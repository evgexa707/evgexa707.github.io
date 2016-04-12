<?php
/* 
 * Author: Evgeny Voronkov
 * Copyright: Web.MixLife.Inc Group
 * Bugs.php
 * Все права защищены! 
 */
if(!defined('MOZG'))
	die('Hacking attempt!');

if($logged){
	$act = $_GET['act'];
	$user_id = $user_info['user_id'];
	$metatags['title'] = $lang['bugs'];
	
	switch($act){
	
	case "add_box":
		NoAjaxQuery();
		$tpl->load_template('bugs/add.tpl');
		$row = $db->super_query("SELECT user_id, user_photo FROM `".PREFIX."_users` WHERE user_id = '{$user_id}'");
		if($row['user_photo']) $tpl->set('{photo}', '/uploads/users/'.$row['user_id'].'/'.$row['user_photo']);
		else $tpl->set('{photo}', '/templates/Default/images/no_ava.gif');
		$tpl->compile('content');
		AjaxTpl();
		die();
	break;
	
	case "create":
		NoAjaxQuery();
		AntiSpam('bugs');
		$title = textFilter($_POST['title']);
		$text = textFilter($_POST['text']);
		$file = textFilter($_POST['file']);
		
		if(!$file) die();
		
		$db->query("INSERT INTO `".PREFIX."_bugs` (uids, title, text, date, images) VALUES ('{$user_id}', '{$title}', '{$text}', '{$server_time}', '{$file}')");
		AntiSpamLogInsert('bugs');
		$iid = $db->insert_id();
		
		die();
	break;
	
	case "load_img":
		NoAjaxQuery();
		
		$image_tmp = $_FILES['uploadfile']['tmp_name'];
		$image_name = totranslit($_FILES['uploadfile']['name']);
		$image_rename = substr(md5($server_time+rand(1,100000)), 0, 20);
		$image_size = $_FILES['uploadfile']['size'];
		$exp = explode(".", $image_name);
		$type = end($exp); // формат файла
		
		$max_size = 1024 * 5000;
		
		if($image_size <= $max_size){
			$allowed_files = explode(', ', 'jpg, jpeg, jpe, png, gif');
			if(in_array(strtolower($type), $allowed_files)){
				$res_type = strtolower('.'.$type);	
				$upDir = ROOT_DIR.'/uploads/bugs/'.$user_id.'/';
				
				if(!is_dir($upDir)){ 
					@mkdir($upDir, 0777);
					@chmod($upDir, 0777);
				}
				
				$rImg = $upDir.$image_rename.$res_type;
				
				if(move_uploaded_file($image_tmp, $rImg)){
				
					include_once ENGINE_DIR.'/classes/images.php';
					
					$tmb = new thumbnail($rImg);
					$tmb->size_auto(600);
					$tmb->jpeg_quality(95);
					$tmb->save($upDir.'o_'.$image_rename.$res_type);
					
					$tmb = new thumbnail($rImg);
					$tmb->size_auto(200, 1);
					$tmb->jpeg_quality(97);
					$tmb->save($rImg);
					
					die($user_id.'|'.$image_rename.$res_type);
				}
			}
		}else
			die('size');
	
		die();
	break;
	
	case 'delete':
		NoAjaxQuery();
		$id = intval($_POST['id']);
		
		$row = $db->super_query("SELECT uids, images FROM `".PREFIX."_bugs` WHERE id = '{$id}'");
		
		
		if($row['uids'] != $user_id || !$row['uids']) die('err');
		
		$url_1 = ROOT_DIR . '/uploads/bugs/'.$row['uids'].'/o_'.$row['images'];
		$url_2 = ROOT_DIR . '/uploads/bugs/'.$row['uids'].'/'.$row['images'];
		
		@unlink($url_1);
		@unlink($url_2);
		
		$db->query("DELETE FROM `".PREFIX."_bugs` WHERE id = '{$id}'");
		
		echo 'ok';
		
		die();
	break;
	
	case "open":
				$limit_num = 10;
				if($_GET['page_cnt'] > 0) $page_cnt = intval($_GET['page_cnt']) * $limit_num;
				else $page_cnt = 0;
				
				$open = $db->super_query("SELECT tb1.*, tb2.user_id, user_search_pref, user_photo, user_sex FROM `".PREFIX."_bugs` tb1, `".PREFIX."_users` tb2 WHERE tb1.uids = tb2.user_id {$where_sql} {$where_cat} ORDER by `date` DESC LIMIT {$page_cnt}, {$limit_num}", 1);
					
				if($open){
				
					$tpl->load_template('bugs/all.tpl');
	
					foreach($open as $row){
					if($row['status'] == 1) { 
						$status = '<span class="orange">открытый</span>';					
						$tpl->set('{title}', stripslashes($row['title']));
						$tpl->set('{text}', stripslashes($row['text']));					
					//Выводим даты сообщения//
						if(date('Y-m-d', $row['date']) == date('Y-m-d', $server_time))
							$date = langdate('сегодня в H:i', $row['date']);
						elseif(date('Y-m-d', $row_chat['date']) == date('Y-m-d', ($server_time-84600)))
							$date = langdate('вчера в H:i', $row['date']);
						else
							$date = langdate('j F Y в H:i', $row['date']);
						$tpl->set('{date}',  $date);
					//Конец//				
					if($row['user_sex'] == 1) $tpl->set('{sex}', 'добавил');
							else $tpl->set('{sex}', 'добавила');			
					if($row['uids'] == $row['user_id'])
								$tpl->set('{status}', $status);
							else
								$tpl->set('{status}', $status);						
								$tpl->set('{name}', $row['user_search_pref']);					
					if($row['user_photo'])
								$tpl->set('{ava}', '/uploads/users/'.$row['uids'].'/50_'.$row['user_photo']);
							else
								$tpl->set('{ava}', '{theme}/images/no_ava_50.png');
						$tpl->set('{id}', $row['id']);	
						$tpl->set('{uid}', $row['user_id']);
						$tpl->compile('bugs');
					}
				}
		    }	
						$tpl->load_template('bugs/open.tpl');
						$tpl->set('{load}', $tpl->result['bugs']);
						$tpl->compile('content');
	break;
	
	case "complete":
				$limit_num = 10;
				if($_GET['page_cnt'] > 0) $page_cnt = intval($_GET['page_cnt']) * $limit_num;
				else $page_cnt = 0;
				
				$ok = $db->super_query("SELECT tb1.*, tb2.user_id, user_search_pref, user_photo, user_sex FROM `".PREFIX."_bugs` tb1, `".PREFIX."_users` tb2 WHERE tb1.uids = tb2.user_id {$where_sql} {$where_cat} ORDER by `date` DESC LIMIT {$page_cnt}, {$limit_num}", 1);
					
				if($ok){
				
					$tpl->load_template('bugs/all.tpl');
	
					foreach($ok as $row){
					if($row['status'] == 2) { 
						$status = '<span class="green">исправлен</span>';					
						$tpl->set('{title}', stripslashes($row['title']));
						$tpl->set('{text}', stripslashes($row['text']));					
					//Выводим даты сообщения//
						if(date('Y-m-d', $row['date']) == date('Y-m-d', $server_time))
							$date = langdate('сегодня в H:i', $row['date']);
						elseif(date('Y-m-d', $row_chat['date']) == date('Y-m-d', ($server_time-84600)))
							$date = langdate('вчера в H:i', $row['date']);
						else
							$date = langdate('j F Y в H:i', $row['date']);
						$tpl->set('{date}',  $date);
					//Конец//				
					if($row['user_sex'] == 1) $tpl->set('{sex}', 'добавил');
							else $tpl->set('{sex}', 'добавила');			
					if($row['uids'] == $row['user_id'])
								$tpl->set('{status}', $status);
							else
								$tpl->set('{status}', $status);						
								$tpl->set('{name}', $row['user_search_pref']);					
					if($row['user_photo'])
								$tpl->set('{ava}', '/uploads/users/'.$row['uids'].'/50_'.$row['user_photo']);
							else
								$tpl->set('{ava}', '{theme}/images/no_ava_50.png');
						$tpl->set('{id}', $row['id']);	
						$tpl->set('{uid}', $row['user_id']);
						$tpl->compile('bugs');
				    }
				}		  
			}
				$tpl->load_template('bugs/complete.tpl');
				$tpl->set('{load}', $tpl->result['bugs']);
				$tpl->compile('content');
	break;
	
	case "close":
				$limit_num = 10;
				if($_GET['page_cnt'] > 0) $page_cnt = intval($_GET['page_cnt']) * $limit_num;
				else $page_cnt = 0;
				
				$sql_ = $db->super_query("SELECT tb1.*, tb2.user_id, user_search_pref, user_photo, user_sex FROM `".PREFIX."_bugs` tb1, `".PREFIX."_users` tb2 WHERE tb1.uids = tb2.user_id {$where_sql} {$where_cat} ORDER by `date` DESC LIMIT {$page_cnt}, {$limit_num}", 1);
					
				if($sql_){
				
					$tpl->load_template('bugs/all.tpl');
	
					foreach($sql_ as $row){
					if($row['status'] == 3) { 
						$status = '<span class="red">отклонен</span>';					
						$tpl->set('{title}', stripslashes($row['title']));
						$tpl->set('{text}', stripslashes($row['text']));					
					//Выводим даты сообщения//
						if(date('Y-m-d', $row['date']) == date('Y-m-d', $server_time))
							$date = langdate('сегодня в H:i', $row['date']);
						elseif(date('Y-m-d', $row_chat['date']) == date('Y-m-d', ($server_time-84600)))
							$date = langdate('вчера в H:i', $row['date']);
						else
							$date = langdate('j F Y в H:i', $row['date']);
						$tpl->set('{date}',  $date);
					//Конец//					
					if($row['user_sex'] == 1) $tpl->set('{sex}', 'добавил');
							else $tpl->set('{sex}', 'добавила');			
					if($row['uids'] == $row['user_id'])
								$tpl->set('{status}', $status);
							else
								$tpl->set('{status}', $status);						
								$tpl->set('{name}', $row['user_search_pref']);					
					if($row['user_photo'])
								$tpl->set('{ava}', '/uploads/users/'.$row['uids'].'/50_'.$row['user_photo']);
							else
								$tpl->set('{ava}', '{theme}/images/no_ava_50.png');
						$tpl->set('{id}', $row['id']);	
						$tpl->set('{uid}', $row['user_id']);
						$tpl->compile('bugs');
				    }
				}		  
			}
				$tpl->load_template('bugs/cancel.tpl');
				$tpl->set('{load}', $tpl->result['bugs']);
				$tpl->compile('content');
	break;
	
	case "my":
				$limit_num = 10;
				if($_GET['page_cnt'] > 0) $page_cnt = intval($_GET['page_cnt']) * $limit_num;
				else $page_cnt = 0;
									
				$my = $db->super_query("SELECT tb1.*, tb2.user_id, user_search_pref, user_photo, user_sex FROM `".PREFIX."_bugs` tb1, `".PREFIX."_users` tb2 WHERE tb1.uids = tb2.user_id {$where_sql} {$where_cat} ORDER by `date` DESC LIMIT {$page_cnt}, {$limit_num}", 1);
				
				if($my){
				
					$tpl->load_template('bugs/all.tpl');
	
					foreach($my as $row){	
					
					if($user_id == $row['uids']){
					
					if($row['status'] == 1) 
						$status = '<span class="orange">открытый</span>';
					else if($row['status'] == 2)
						$status = '<span class="green">исправлен</span>';	
					else if($row['status'] == 3)
						$status = '<span class="red">отклонен</span>';
						$tpl->set('{status}', $status);					
						$tpl->set('{title}', stripslashes($row['title']));
						$tpl->set('{text}', stripslashes($row['text']));					
					//Выводим даты сообщения//
						if(date('Y-m-d', $row['date']) == date('Y-m-d', $server_time))
							$date = langdate('сегодня в H:i', $row['date']);
						elseif(date('Y-m-d', $row_chat['date']) == date('Y-m-d', ($server_time-84600)))
							$date = langdate('вчера в H:i', $row['date']);
						else
							$date = langdate('j F Y в H:i', $row['date']);
						$tpl->set('{date}',  $date);
					//Конец//
					if($row['user_sex'] == 1) $tpl->set('{sex}', 'добавил');
							else $tpl->set('{sex}', 'добавила');			
					if($row['uids'] == $row['user_id'])
								$tpl->set('{status}', $status);
							else
								$tpl->set('{status}', $status);						
								$tpl->set('{name}', $row['user_search_pref']);					
					if($row['user_photo'])
								$tpl->set('{ava}', '/uploads/users/'.$row['uids'].'/50_'.$row['user_photo']);
							else
								$tpl->set('{ava}', '{theme}/images/no_ava_50.png');
						$tpl->set('{id}', $row['id']);	
						$tpl->set('{uid}', $row['user_id']);
						$tpl->compile('bugs');
				    }
				}		  
			}
				$tpl->load_template('bugs/my.tpl');
				$tpl->set('{load}', $tpl->result['bugs']);
				$tpl->compile('content');
	break;
	
	case "view":
		NoAjaxQuery();
		
		$id = intval($_POST['id']);
		
		$row = $db->super_query("SELECT tb1.*, tb2.user_id, user_search_pref, user_photo, user_sex FROM `".PREFIX."_bugs` tb1, `".PREFIX."_users` tb2 WHERE tb1.id = '{$id}' AND tb1.uids = tb2.user_id");
		$bugs = $db->super_query("SELECT admin_id, admin_text FROM `".PREFIX."_bugs` WHERE admin_id = '{$row['user_id']}'");
		
		if(!$row) die('err');
		
		$tpl->load_template('bugs/view.tpl');
		//Bugs
		$tpl->set('{photo}', '/uploads/bugs/'.$row['uids'].'/o_'.$row['images']);		
		$tpl->set('{title}', stripslashes($row['title']));
		$tpl->set('{text}', stripslashes($row['text']));
		$tpl->set('{id}', $row['id']);
		
		//Admin
		$tpl->set('{admin_text}', stripslashes($row['admin_text']));
		$tpl->set('{admin_id}', stripslashes($row['admin_id']));
	
		if($user_id == $bugs['admin_id'])
			$tpl->set('{admin}', $row['user_search_pref']);
		 else 
			$tpl->set('{admin}', $row['user_search_pref']);
		
		
		//Выводим даты сообщения//
		if(date('Y-m-d', $row['date']) == date('Y-m-d', $server_time))
			$date = langdate('сегодня в H:i', $row['date']);
		elseif(date('Y-m-d', $row['date']) == date('Y-m-d', ($server_time-84600)))
			$date = langdate('вчера в H:i', $row['date']);
		else
			$date = langdate('j F Y в H:i', $row['date']);
		$tpl->set('{date}',  $date);
		//Конец//
		
		//Пол
		if($row['user_sex'] == 1) $tpl->set('{sex}', 'добавил');
		else $tpl->set('{sex}', 'добавила');
		
		//status
		if($row['status'] == 1) 
			$status = '<span class="orange">открытый</span>';
		else if($row['status'] == 2)
			$status = '<span class="green">исправлен</span>';	
		else if($row['status'] == 3)
			$status = '<span class="red">отклонен</span>';
			$tpl->set('{status}', $status);
		
		//user
		if($user_id == $row['uids']) 
		$tpl->set('{delete}', '<a href="/" onClick="bugs.Delete('.$row['id'].'); return false;" style="color: #000000">Удалить</a>');
		else 
		$tpl->set('{delete}', '');
		
		$tpl->set('{uid}', $row['user_id']);
		if($row['user_photo']) $tpl->set('{ava}', '/uploads/users/'.$row['user_id'].'/50_'.$row['user_photo']);
		else $tpl->set('{ava}', '/templates/Default/images/no_ava_50.png');
		$tpl->set('{name}', $row['user_search_pref']);
		$tpl->compile('content');
		
		AjaxTpl();
		die();
	break;
	
	default:
	
	//################### Просмотр всех вопросов ###################//
			default:
				
				$limit_num = 10;
				if($_GET['page_cnt'] > 0) $page_cnt = intval($_GET['page_cnt']) * $limit_num;
				else $page_cnt = 0;
				
				$my = intval($_POST['my']);
				
				$sql_ = $db->super_query("SELECT tb1.*, tb2.user_id, user_search_pref, user_photo, user_sex FROM `".PREFIX."_bugs` tb1, `".PREFIX."_users` tb2 WHERE tb1.uids = tb2.user_id {$where_sql} {$where_cat} ORDER by `date` DESC LIMIT {$page_cnt}, {$limit_num}", 1);
					
				if($sql_){
				
					$tpl->load_template('bugs/all.tpl');
	
					foreach($sql_ as $row){

						$tpl->set('{title}', stripslashes($row['title']));
						$tpl->set('{text}', stripslashes($row['text']));
						
						//Выводим даты сообщения//
						if(date('Y-m-d', $row['date']) == date('Y-m-d', $server_time))
							$date = langdate('сегодня в H:i', $row['date']);
						elseif(date('Y-m-d', $row_chat['date']) == date('Y-m-d', ($server_time-84600)))
							$date = langdate('вчера в H:i', $row['date']);
						else
							$date = langdate('j F Y в H:i', $row['date']);
						$tpl->set('{date}',  $date);
						//Конец//
						
						if($row['status'] == 1) 
								$status = '<span class="orange">открытый</span>';
							else if($row['status'] == 2)
								$status = '<span class="green">исправлен</span>';	
							else if($row['status'] == 3)
								$status = '<span class="red">отклонен</span>';
						
						if($row['user_sex'] == 1) $tpl->set('{sex}', 'добавил');
							else $tpl->set('{sex}', 'добавила');
						
						if($row['uids'] == $row['user_id']){
							if($row['uids'])
								$tpl->set('{status}', $status);
							else
								$tpl->set('{status}', $status);
								
								$tpl->set('{name}', $row['user_search_pref']);
							
						if($row['user_photo'])
								$tpl->set('{ava}', '/uploads/users/'.$row['uids'].'/50_'.$row['user_photo']);
							else
								$tpl->set('{ava}', '{theme}/images/no_ava_50.png');
						
						}
						
						$tpl->set('{id}', $row['id']);
						
						$tpl->set('{uid}', $row['user_id']);
						
						$tpl->compile('bugs');
					 }
					 
					}else{
					$tpl->result['bugs'] = '<div class="info_center"><br><br>Ни чего не найдено<br><br></div>';
					}
				$tpl->load_template('bugs/head.tpl');
				$tpl->set('{load}', $tpl->result['bugs']);
				navigation($page_cn, $limit_num, '/index.php'.$query.'&page_cnt=');
				$tpl->compile('content');
			}
		$tpl->clear();
	$db->free();
} else {
	$user_speedbar = $lang['no_infooo'];
	msgbox('', $lang['not_logged'], 'info');
}
?>