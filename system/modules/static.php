<?php
/* 
	Appointment: Статические страницы
	File: static.php 
	Author: vii zona 
	Engine: Vii Engine
	Copyright: vii zona (с) 2011
	e-mail: vii zona
	URL: http://viirips.ru/
	ICQ: viirips.ru
	Данный код защищен авторскими правами
*/
if(!defined('MOZG'))
	die('Hacking attempt!');

if($ajax == 'yes')
	NoAjaxQuery();

if($logged){
	$alt_name = $db->safesql(totranslit($_GET['page']));
	$row = $db->super_query("SELECT title, text FROM `".PREFIX."_static` WHERE alt_name = '".$alt_name."'");
	if($row){
		$tpl->load_template('static.tpl');
		$tpl->set('{alt_name}', $alt_name);
		$tpl->set('{title}', stripslashes($row['title']));
		$tpl->set('{text}', stripslashes($row['text']));
		$tpl->compile('content');
	} else
		msgbox('', 'Страница не найдена.', 'info_2');
	
	$tpl->clear();
	$db->free();
} else {
	$user_speedbar = $lang['no_infooo'];
	msgbox('', $lang['not_logged'], 'info');
}
?>