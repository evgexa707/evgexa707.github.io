<?php
if(!defined('MOZG')) die('Hacking attempt!');
echoheader();

//Исправлено
if($_GET['act'] == 'open'){
	$id = intval($_GET['id']);	
	$db->query("UPDATE `".PREFIX."_bugs` SET status = '1' WHERE id = '{$id}'");
	
	header("Location: ?mod=bugs");	
}

//Исправлен
if($_GET['act'] == 'ok'){
	$id = intval($_GET['id']);	
	$db->query("UPDATE `".PREFIX."_bugs` SET status = '2' WHERE id = '{$id}'");
	
	header("Location: ?mod=bugs");	
}

//Отклонен
if($_GET['act'] == 'close'){
	$id = intval($_GET['id']);	
	$db->query("UPDATE `".PREFIX."_bugs` SET status = '3' WHERE id = '{$id}'");
	
	header("Location: ?mod=bugs");	
}

//Удаление
if($_GET['act'] == 'del'){
	$id = intval($_GET['id']);
	$user_id = $user_info['user_id'];
	$row = $db->super_query("SELECT uids, images FROM `".PREFIX."_bugs` WHERE id = '{$id}'");
	
	if($row['uids'] != $user_id);
	
	$url_1 = ROOT_DIR . '/uploads/bugs/'.$row['uids'].'/o_'.$row['images'];
	$url_2 = ROOT_DIR . '/uploads/bugs/'.$row['uids'].'/'.$row['images'];
		
	@unlink($url_1);
	@unlink($url_2);
	
	$db->query("DELETE FROM `".PREFIX."_bugs` WHERE id = '{$id}'");	
	
	header("Location: ?mod=bugs");
	
}

if($_GET['page'] > 0) $page = intval($_GET['page']); else $page = 1;
$gcount = 20;
$limit_page = ($page-1)*$gcount;

$sql_ = $db->super_query("SELECT tb1.*, tb2.user_id, user_search_pref FROM `".PREFIX."_bugs` tb1, `".PREFIX."_users` tb2 WHERE tb1.uids = tb2.user_id {$where_sql} ORDER by `date` DESC LIMIT {$limit_page}, {$gcount}", 1);

$where_sql = str_replace('AND tb1.', 'WHERE ', $where_sql);
$numRows = $db->super_query("SELECT COUNT(*) AS cnt FROM `".PREFIX."_bugs` {$where_sql}");

if($sql_){

	foreach($sql_ as $row){		
		$row['text'] = stripslashes($row['text']);
		$row['date'] = langdate('j F Y в H:i', $row['date']);				
		echo <<<HTML
<div style="padding-bottom:10px;padding-top:10px;border-top:1px solid #f0f0f0;margin-top:5px">
<div><a href="/u{$row['user_id']}" target="_blank"><b>{$row['user_search_pref']}</b></a> <span style="color:#777;float:right">{$row['date']}</span></div>
<div>{$row['text']}</div>
<div>{$moder_lnk} <a href="?mod=bugs&act=del&id={$row['id']}" style="float:right">Удалить</a></div>
<div>{$moder_lnk} <a href="?mod=bugs&act=open&id={$row['id']}" style="margin-left: 503px;">открытый</a></div>
<div style="margin-top: -17px;">{$moder_lnk} <a href="?mod=bugs&act=ok&id={$row['id']}" style="margin-left: 440px;">исправлен</a></div>
<div style="margin-left: 50px;margin-top: -17px;">{$moder_lnk} <a href="?mod=bugs&act=close&id={$row['id']}" style="margin-left: 335px;">отклонен</a></div>
</div>
HTML;
		
	}

} else
	echo '<div style="font-size:13px;color:#555;text-align:center;padding:50px">Ничего не найдено.</div>';

$query_string = preg_replace("/&page=[0-9]+/i", '', $_SERVER['QUERY_STRING']);

echo navigation($gcount, $numRows['cnt'], '?'.$query_string.'&page=');

echohtmlend();
?>