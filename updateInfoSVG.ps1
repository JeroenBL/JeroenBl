$svgContent = Get-Content ./info.svg -Raw
$today = (get-date).DayOfWeek
if (($today -eq 'Saturday') -or ($today -eq 'Sunday')){
    $today = 'weekend'
}
$currentDay = $today.ToString().ToLower()

$publicRepos = (irm https://api.github.com/orgs/Tools4everBV).public_repos

$svgContent = $svgContent.replace("{dayOfWeek}", $currentDay)
$svgContent = $svgContent.replace("{000}", $publicRepos)
$svgContent | Set-Content ./infoUpdated.svg -Encoding utf8 -Force