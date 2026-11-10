param([Parameter(Mandatory=$true)][string]$Root)

$sources = Import-Csv -LiteralPath (Join-Path $Root 'SOURCE_MANIFEST.tsv') -Delimiter "`t"
$byHash = @{}
foreach ($source in $sources) {
  if ($source.Topic -eq '09-supplements') { continue }
  $repoPath = Join-Path (Join-Path $Root $source.Topic) $source.Source
  if (-not (Test-Path -LiteralPath (Join-Path $repoPath '.git'))) { continue }
  foreach ($line in (& git -C $repoPath ls-files --stage)) {
    $tab = $line.IndexOf("`t")
    if ($tab -lt 0) { continue }
    $file = $line.Substring($tab + 1)
    if ($file -notmatch '\.(md|mdx|json|ya?ml|txt|html)$') { continue }
    $meta = $line.Substring(0, $tab).Split(' ')
    if ($meta.Length -lt 2) { continue }
    $hash = $meta[1]
    if ($hash -eq 'e69de29bb2d1d6434b8b29ae775ad8c2e48c5391') { continue }
    if (-not $byHash.ContainsKey($hash)) { $byHash[$hash] = [System.Collections.Generic.List[object]]::new() }
    $byHash[$hash].Add([pscustomobject]@{
      Topic = $source.Topic
      Source = $source.Source
      Path = $file
    })
  }
}

$outPath = Join-Path $Root 'EXACT_GIT_DOCUMENT_DUPLICATES.tsv'
$writer = [IO.StreamWriter]::new($outPath, $false, [Text.UTF8Encoding]::new($false))
$writer.WriteLine("Group`tGitBlobSHA1`tTopic`tSource`tRelativePath")
$groups = 0
$files = 0
try {
  foreach ($hash in $byHash.Keys) {
    $items = $byHash[$hash]
    if ($items.Count -lt 2) { continue }
    $uniqueSources = [System.Collections.Generic.HashSet[string]]::new()
    foreach ($item in $items) { [void]$uniqueSources.Add($item.Source) }
    if ($uniqueSources.Count -lt 2) { continue }
    $groups++
    foreach ($item in $items) {
      $writer.WriteLine("$groups`t$hash`t$($item.Topic)`t$($item.Source)`t$($item.Path)")
      $files++
    }
  }
}
finally { $writer.Dispose() }
Write-Output "Exact duplicate Git document groups: $groups; file rows: $files"
