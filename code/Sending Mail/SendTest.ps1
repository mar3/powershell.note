# coding: Windows-31J
#
#
# PowerShell �Ń��[�����M�I
#
#
#
#

function _create_message() {
	
	$message = New-Object System.Net.Mail.MailMessage
	$from = New-Object System.Net.Mail.MailAddress("mail.from@example.jp", "���o�l �\������")
	$message.From = $from
	$to = New-Object System.Net.Mail.MailAddress("rcpt.to@example.jp", "���� �\������")
	$message.To.Add($to)
	$message.SubjectEncoding = [System.Text.Encoding]::UTF8
	$message.Subject = "subject �ł�... "
	$message.BodyEncoding = [System.Text.Encoding]::UTF8
	$message.Body = "body �ł�..."
	# $message.Attachments = ""
	return $message
}

function _send($message) {

	# �ڑ���
	$client = New-Object System.Net.Mail.SmtpClient
	$client.Host = "example.jp"
	$client.Port = 587

	# SMTP �F�؂̏���
	$credentials = New-Object Net.NetworkCredential
	$credentials.UserName = "user.name"
	$credentials.password = "jkJhsyTwg;aa@S"
	$client.Credentials = $credentials

	$client.Send($message)
}

function _main() {

	Write-Host "### start ###"

	$message = _create_message

	_send($message)

	Write-Host "--- end ---"
}

_main
