$users = [System.Collections.ArrayList]($users = quser)[1..($users.count - 1)]
$users = $users.Replace('>',' ')
$rdsessions = @()

foreach ($session in $users)
{
	$session_id = ($session.tostring() -split ' +')[2]
	if($session_id -like "rdp*" -or $session_id -like "console" ){$session = $session.replace($session_id,"")}
	$obj = New-Object PSObject
	$obj | Add-Member -MemberType NoteProperty -Name Username -Value ($session.tostring() -split ' +')[1]
	$obj | Add-Member -MemberType NoteProperty -Name ID -Value ($session.tostring() -split ' +')[2]
	$obj | Add-Member -MemberType NoteProperty -Name LogonState -Value ($session.tostring() -split ' +')[3]
	$obj | Add-Member -MemberType NoteProperty -Name IdleTime -Value ($session.tostring() -split ' +')[4]
	$obj | Add-Member -MemberType NoteProperty -Name LogonDate -Value ($session.tostring() -split ' +')[5]
	$obj | Add-Member -MemberType NoteProperty -Name LogonTime -Value ($session.tostring() -split ' +')[6]
	$rdsessions += $obj
}

$rdsessions