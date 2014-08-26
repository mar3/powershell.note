# coding: windows-31j
#
#
# PowerShell でメール送信！
#
#
#
#

function main() {

	Write-Host "### start ###"

	#
	# 接続
	#

	$client = New-Object System.Net.Mail.SmtpClient
	$client.Host = "example.jp"
	$client.Port = 25

	#
	# SMTP 認証の準備
	#

	$credentials = New-Object Net.NetworkCredential
	$credentials.UserName = "user.name"
	$credentials.password = "jkJhsyTwg;aa@S"
	$client.Credentials = $credentials

	#
	# メッセージを組み立て
	#

	$message = New-Object System.Net.Mail.MailMessage
	$from = New-Object System.Net.Mail.MailAddress("mail.from@example.jp", "差出人 表示部分")
	$message.From = $from
	$to = New-Object System.Net.Mail.MailAddress("rcpt.to@example.jp", "宛先 表示部分")
	$message.To.Add($to)
	$message.SubjectEncoding = [System.Text.Encoding]::UTF8
	$message.Subject = "subject です... "
	$message.BodyEncoding = [System.Text.Encoding]::UTF8
	$message.Body = "body です..."
	# $message.Attachments = ""

	#
	# 送信！
	#

	$client.Send($message)
	
	Write-Host "--- end ---"
}

main
