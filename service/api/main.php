<?php 
require 'utils/util.php';
require 'constants/db.config.php';
require 'common/db.class.php';

$ywtype = _get('ywtype');
$tb = _get('tb');

switch ($ywtype) {
	/**
	 *用户登陆
	 */
	case '10001':
		$input = json_decode(file_get_contents("php://input"));
		$sql = "select count(1) count from `user` where user= '".$input[0]."' and password= '". $input[1] ."'";
		$data = Db::query($sql);
		echo json_encode($data);
		break;

	case '11101':
		$sql = "SELECT * FROM `". $tb ."` order by ordernum desc";
		$data = Db::query($sql);
		echo json_encode($data);
		break;
	
	case '11102':
		$data = json_decode(file_get_contents("php://input"));
		if($data->ordernum==null){
			$data->ordernum = 0;
		}
		$sql = "insert into `". $data->table ."`(ordernum,name,imgpath,url,status) values(" . $data->ordernum . ",'" . $data->name ."','" . $data->imgpath . "','" . $data->url . "'," . $data->status .")" ;
		echo $sql;
		Db::exec($sql);
		// echo $sql;
		// echo json_encode($data->name);
		break;
	case '11103':
		$id = _get('id');
		$sql = "DELETE FROM `". $tb ."` where id=" . $id;
		Db::exec($sql);
		// echo json_encode($sql);
		break;
	case '11104':
		$id = _get('id');
		$status = _get('status');;
		$sql = "UPDATE `". $tb ."` SET status = " . $status . " where id =" . $id;
		// echo $sql;
		Db::exec($sql);
		break;
	case '11105':
		$type = _get('type');
		$data = json_decode(file_get_contents("php://input"));
		$tmp = "('".join("','",$data) . "')";
		switch ($type) {
			case 0:
				$sql = "UPDATE `". $tb ."` SET status = 1" . " where id in " . $tmp;
				Db::exec($sql);
				break;
			case 1:
				$sql = "UPDATE `". $tb ."` SET status = 0" . " where id in " . $tmp;
				Db::exec($sql);
				break;
			default:
				# code...
				break;
		}
		break;
	case '11106':
		$data = json_decode(file_get_contents("php://input"),true);
		$tmp = "('".join("','",$data) . "')";
		// echo json_encode($sql1);
		// var_dump($data);
		$sql = "DELETE FROM `". $tb ."` where id in " . $tmp;
		Db::exec($sql);
		break;
	case '11107':
		$keyword = _get("keyword");
		$type = _get("type");
		switch ($type) {
			case '2':
				$sql = "SELECT * FROM `". $tb ."` WHERE name like '%". $keyword ."%' or url like '%". $keyword . "%'"; 
				$data = Db::query($sql);
				echo json_encode($data);
				break;												
			default:
				$sql = "SELECT * FROM `". $tb ."` WHERE (name like '%". $keyword ."%' or url like '%". $keyword . "%') and status='" . $type ."'"; 
				$data = Db::query($sql);
				echo json_encode($data);
				break;
		}
		break;
	case '11108':
		$data = json_decode(file_get_contents("php://input"));
		if($data->ordernum==null){
			$data->ordernum = 0;
		}
		$sql = "update `". $tb ."` set ordernum = '".$data->ordernum ."',name = '". $data->name ."',imgpath= '". $data->imgpath . "',url = '" . $data->url ."',status = ". $data->status ." where id =". $data->id;
		// echo $sql;
		Db::exec($sql);
		break;
	/**
	 * 上传图片
	 */
	case '10002':
		uploadFile();
		break;
	default:
		echo json_encode("error");
		break;
}
?>