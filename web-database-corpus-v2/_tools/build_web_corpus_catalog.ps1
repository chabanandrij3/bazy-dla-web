param([Parameter(Mandatory=$true)][string]$Root)

$topicNames = @('01-navigation','02-structure-layout','03-content-readability','04-forms','05-functionality','06-accessibility','07-aesthetics','08-security','09-supplements')
$catalogPath = Join-Path $Root 'FILE_CATALOG.tsv'
$manifestPath = Join-Path $Root 'SOURCE_MANIFEST.tsv'
$utf8 = [Text.UTF8Encoding]::new($false)
$catalog = [IO.StreamWriter]::new($catalogPath, $false, $utf8)
$manifest = [IO.StreamWriter]::new($manifestPath, $false, $utf8)
$catalog.WriteLine("Topic`tSource`tRelativePath`tBytes")
$manifest.WriteLine("Topic`tSource`tFiles`tBytes`tRevision`tSnapshot")
$totalFiles = 0

try {
  foreach ($topic in $topicNames) {
    $topicPath = Join-Path $Root $topic
    if (-not (Test-Path -LiteralPath $topicPath)) { continue }
    foreach ($source in [IO.Directory]::EnumerateDirectories($topicPath)) {
      $sourceName = [IO.Path]::GetFileName($source)
      $count = 0
      $bytes = [long]0
      foreach ($path in [IO.Directory]::EnumerateFiles($source, '*', [IO.SearchOption]::AllDirectories)) {
        $relative = $path.Substring($source.Length + 1).Replace('\','/')
        if ($relative -eq '.git' -or $relative.StartsWith('.git/')) { continue }
        $size = ([IO.FileInfo]$path).Length
        $catalog.WriteLine("$topic`t$sourceName`t$relative`t$size")
        $count++
        $bytes += $size
      }
      $revision = ''
      $snapshot = 'git checkout'
      if (Test-Path -LiteralPath (Join-Path $source '.git')) {
        $revision = (& git -C $source rev-parse HEAD 2>$null | Select-Object -First 1)
      } elseif (Test-Path -LiteralPath (Join-Path $source 'ORIGINAL_SNAPSHOT.zip')) {
        $snapshot = 'GitHub ZIP snapshot; original ZIP preserved'
      }
      $manifest.WriteLine("$topic`t$sourceName`t$count`t$bytes`t$revision`t$snapshot")
      $manifest.Flush()
      Write-Output "$topic/$sourceName : $count files"
      $totalFiles += $count
    }
  }
}
finally {
  $catalog.Dispose()
  $manifest.Dispose()
}

Write-Output "Total indexed files: $totalFiles"
