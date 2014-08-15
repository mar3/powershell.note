#
# いっきにまとめて列挙する方法
#
function Enumerate1($path) {

	Write-Host("path=[" + $path + "]")

	$items = Get-ChildItem -Path $path -Recurse

	foreach($item in $items) {

		Write-Host $item.FullName
	}
}

#
# 一つずつ掘り下げる方法
#
function Enumerate2($path) {

	Write-Host("path=[" + $path + "]")

	#
	# ファイルを先に列挙します。
	#

	$items = Get-ChildItem -Path $path -File

	foreach($item in $items) {

		Write-Host $item.FullName
	}

	#
	# ディレクトリを列挙します。
	#

	$items = Get-ChildItem -Path $path -Directory

	foreach($item in $items) {

		Enumerate2 $item.FullName
	}
}

function Main($path) {
	
	$item = Get-Item $path

	# Enumerate1 $path

	Enumerate2 $path
}

Main $Args[0]

