<?php 

function _get($str){
$val = !empty($_GET[$str]) ? $_GET[$str] : null;
return $val;
} 

function uploadFile(){
	// echo $_FILES["file"]["type"];
	$allowedExts = array("gif", "jpeg", "jpg", "png");
	$temp = explode(".", $_FILES["file"]["name"]);
	$extension = end($temp);     // 获取文件后缀名
	if ((($_FILES["file"]["type"] == "image/gif")
	|| ($_FILES["file"]["type"] == "image/jpeg")
	|| ($_FILES["file"]["type"] == "image/jpg")
	|| ($_FILES["file"]["type"] == "image/pjpeg")
	|| ($_FILES["file"]["type"] == "image/x-png")
	|| ($_FILES["file"]["type"] == "image/png"))
	&& ($_FILES["file"]["size"] < 204800000)   // 小于 200 kb
	&& in_array($extension, $allowedExts))
	{
		if ($_FILES["file"]["error"] > 0)
		{
			echo "错误：: " . $_FILES["file"]["error"] . "<br>";
		}
		else
		{
			// 判断当期目录下的 upload 目录是否存在该文件
			// 如果没有 upload 目录，你需要创建它，upload 目录权限为 777
			if (file_exists("upload/" . $_FILES["file"]["name"]))
			{
				echo $_FILES["file"]["name"] . " 文件已经存在。 ";
			}
			else
			{
				// 如果 upload 目录不存在该文件则将文件上传到 upload 目录下
				// echo $_FILES["file"]["tmp_name"];
				move_uploaded_file($_FILES["file"]["tmp_name"], "../upload/" . $_FILES["file"]["name"]);
				echo "文件存储在: " . "upload/" . $_FILES["file"]["name"];
			}
		}
	}
	else
	{
		echo "非法的文件格式";
	}
}
?>