<?php
/* 
Appointment: Страница удалена
File: profile_delet.php
Author: f0rt1 
Engine: Vii Engine
Copyright: NiceWeb Group (с) 2011
e-mail: niceweb@i.ua
URL: http://www.niceweb.in.ua/ 
ICQ: 427-825-959
Данный код защищен авторскими правами
*/
if(!defined('MOZG'))
die("Hacking attempt!");
$user_id = $user_info['user_id'];

if($_GET['act'] != 'restore'){
$tpl->load_template('profile_deleted.tpl');
if($user_info['user_photo'])
$ava = $config['home_url'].'uploads/users/'.$user_info['user_id'].'/100_'.$user_info['user_photo'];
else
$ava = '/templates/Default/images/no_ava_50.png';
$tpl->set('{name}', $user_info['user_search_pref']);
$tpl->compile('main');
echo str_replace('{theme}', '/templates/'.$config['temp'], $tpl->result['main']);
}else{
$db->query("UPDATE `".PREFIX."_users` SET user_delet = 0 WHERE user_id = '".$user_id."'");
mozg_clear_cache_file('user_'.$user_id.'/profile_'.$user_id);
header('Location: /');
}
die();

?>