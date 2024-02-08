$svgContent = Get-Content ./info.svg -Raw
$today = (get-date).DayOfWeek
if (($today -eq 'Saturday') -or ($today -eq 'Sunday')){
    $today = 'weekend'
}
$currentDay = $today.ToString().ToLower()

$svgContent = $svgContent.replace("{day}", $currentDay)
$svgContent | Set-Content ./infoUpdated.svg -Encoding utf8 -Force