# coding: windows-31j
#
#
# PowerShell �Ń��[�����M�I
#
#
#
#

function main() {

	Write-Host "### start ###"

	#
	# �ڑ�
	#

	$client = New-Object System.Net.Mail.SmtpClient
	$client.Host = "example.jp"
	$client.Port = 25

	#
	# SMTP �F�؂̏���
	#

	$credentials = New-Object Net.NetworkCredential
	$credentials.UserName = "user.name"
	$credentials.password = "jkJhsyTwg;aa@S"
	$client.Credentials = $credentials

	#
	# ���b�Z�[�W��g�ݗ���
	#

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

	#
	# ���M�I
	#

	$client.Send($message)
	
	Write-Host "--- end ---"
}

main
