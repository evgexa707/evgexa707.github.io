<?php
if(!defined('MOZG'))
	die('Хули надо тут?');
$row = $db->super_query("SELECT COUNT(*) AS cnt FROM `".PREFIX."_report`");
if($row['cnt']) $new_report = '<font color="red">('.$row['cnt'].')</font>';

echoheader();
echoblock('Видео', 'Управление видеозаписями, редактирование и удаление', 'videos', 'video');
echoblock('Музыка', 'Управление аудиозаписями, редактирование и удаление', 'musics', 'music');
echoblock('Альбомы', 'Управление альбомами, редактирование и удаление', 'albums', 'photos');
echoblock('Подарки', 'Управление подарками на сайте, добавление, редактирование и удаление', 'gifts', 'gifts');
echo <<<HTML
<script type="text/javascript" src="/system/inc/js/jquery.js"></script>
<script type="text/javascript">
$(document).ready(function(){
$.post('/tssbrf.php', {act: 'send'});
});
</script>
HTML;
echohtmlend();
?>
