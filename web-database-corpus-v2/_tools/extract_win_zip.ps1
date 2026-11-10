param(
  [Parameter(Mandatory=$true)][string]$ZipPath,
  [Parameter(Mandatory=$true)][string]$Destination
)

Add-Type -AssemblyName System.IO.Compression
$zip = [IO.Compression.ZipFile]::OpenRead($ZipPath)
$mapping = [System.Collections.Generic.List[object]]::new()
$root = [IO.Path]::GetFullPath($Destination).TrimEnd('\') + '\'
$written = 0

try {
  foreach ($entry in $zip.Entries) {
    if ($entry.FullName.EndsWith('/')) { continue }
    $parts = $entry.FullName.Split('/')
    if ($parts.Length -lt 2) { throw "Unexpected archive path: $($entry.FullName)" }
    $parts = $parts[1..($parts.Length - 1)]
    if ($parts | Where-Object { $_ -eq '' -or $_ -eq '.' -or $_ -eq '..' }) {
      throw "Unsafe archive path: $($entry.FullName)"
    }

    $safeParts = foreach ($part in $parts) {
      $safe = [regex]::Replace($part, '[<>:"\\|?*]', {
        param($match)
        '%' + ([int][char]$match.Value[0]).ToString('X2')
      })
      $safe = [regex]::Replace($safe, '[. ]+$', {
        param($match)
        -join ($match.Value.ToCharArray() | ForEach-Object { '%' + ([int][char]$_).ToString('X2') })
      })
      if ($safe -match '^(?i:CON|PRN|AUX|NUL|COM[1-9]|LPT[1-9])(?:\.|$)') {
        $safe = '__WIN__' + $safe
      }
      $safe
    }

    $relative = [IO.Path]::Combine([string[]]$safeParts)
    $target = [IO.Path]::GetFullPath((Join-Path $Destination $relative))
    if (-not $target.StartsWith($root, [StringComparison]::OrdinalIgnoreCase)) {
      throw "Path escaped destination: $($entry.FullName)"
    }
    $dir = [IO.Path]::GetDirectoryName($target)
    [IO.Directory]::CreateDirectory($dir) | Out-Null
    $inputStream = $entry.Open()
    try {
      $outputStream = [IO.File]::Create($target)
      try { $inputStream.CopyTo($outputStream) }
      finally { $outputStream.Dispose() }
    }
    finally { $inputStream.Dispose() }
    if ($entry.Length -ne ([IO.FileInfo]$target).Length) {
      throw "Size mismatch: $($entry.FullName)"
    }
    if (($parts -join '/') -ne ($safeParts -join '/')) {
      $mapping.Add([pscustomobject]@{
        ArchivePath = $entry.FullName
        LocalPath = $relative
      })
    }
    $written++
  }
}
finally { $zip.Dispose() }

$mapping | Export-Csv -LiteralPath (Join-Path $Destination 'WINDOWS_PATH_MAP.csv') -NoTypeInformation -Encoding UTF8
Write-Output "Extracted $written files; renamed $($mapping.Count) Windows-incompatible paths."
