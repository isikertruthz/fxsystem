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
		if($data->content==null){
		//不带content
			$sql = "update `". $tb ."` set ordernum = '".$data->ordernum ."',name = '". $data->name ."',imgpath= '". $data->imgpath . "',url = '" . $data->url ."',status = ". $data->status ." where id =". $data->id;
		}else{
			$sql = "update `". $tb ."` set ordernum = '".$data->ordernum ."',name = '". $data->name ."',imgpath= '". $data->imgpath . "',url = '" . $data->url ."',status = ". $data->status .",content='". $data->content ."' where id =". $data->id;
		}

		echo $sql;
		Db::exec($sql);
		break;
	/**
	 * 上传图片
	 */
	case '10002':
		uploadFile();
		break;

	case '11201':
		$sql = "SELECT * FROM `". $tb ."` order by ordernum";
		$data = Db::query($sql);
		echo json_encode($data);
		break;

	case '11202':
		$req = json_decode(file_get_contents("php://input"));
		$serial = $req->serial;
		$visited = $req->isvisited;

		$sql = "";
		for ($i=0; $i < count($serial); $i++) { 
			$sql = "UPDATE `". $tb ."` SET ordernum = ". $i . " where id = ".$serial[$i];
			Db::exec($sql);
		}

		$sql = "UPDATE `". $tb ."` SET isvisited = 0";
		Db::exec($sql);

		for ($i=0; $i < count($visited); $i++) { 
			$sql = "UPDATE `". $tb ."` SET isvisited = 1 where id = ".$visited[$i];
			Db::exec($sql);
		}
		break;

	case '11203':
		$sql = "UPDATE `". $tb ."` SET ordernum = id,isvisited = 1";
		Db::exec($sql);
		break;

	case '11204':
		$data = json_decode(file_get_contents("php://input"));
		if($data->ordernum==null){
			$data->ordernum = 0;
		}
		$sql = "insert into `". $data->table ."`(ordernum,name,imgpath,url,status,content) values(" . $data->ordernum . ",'" . $data->name ."','" . $data->imgpath . "','" . $data->url . "'," . $data->status ." ,'". $data->content ."')" ;
		// echo $sql;
		Db::exec($sql);
		// ech $sql;
		echo json_encode($data->name);
		break;
	case '11301':
		$sql = "SELECT * FROM `". $tb ."` order by ordernum";
		$data = Db::query($sql);
		echo json_encode($data);
		break;
	case '11302':
		$data = json_decode(file_get_contents("php://input"));
		$sql = "DELETE FROM `". $tb ."`";
		// var_dump($data);
		// echo $sql;
		Db::exec($sql);  //删除

		$item = null;
		$sql = "";
		for($i=0; $i < count($data); $i++){
			$item = $data[$i];
			// var_dump($item);
			$sql = "INSERT INTO `". $tb ."`(imgpath,url,ordernum) values('" . $item->imgpath . "','" . $item->url ."',".$item->ordernum.")";
			Db::exec($sql);
		}   //插入

		$sql = "SELECT * FROM `". $tb ."` order by ordernum";
		$data = Db::query($sql);
		echo json_encode($data);  //返回刷新

		break;
	case '11401':
		$sql = "SELECT * FROM `". $tb ."` where isrec = 1";
		$data = Db::query($sql);
		echo json_encode($data);
		break;
	case '11402':
		$id = _get('id');
		$sql = "DELETE FROM `". $tb ."` where id=" . $id;
		Db::exec($sql);
		// echo json_encode($sql);
		break;
	default:
		echo json_encode("error");
		break;
}
?>