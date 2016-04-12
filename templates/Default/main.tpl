<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ru" lang="ru">
<head>
{header}
<noscript><meta http-equiv="refresh" content="0; URL=/badbrowser.php"></noscript>
  <link media="screen" href="/templates/Default/style/animations.css" type="text/css" rel="stylesheet"/>
<link media="screen" href="/templates/Default/style/style.css" type="text/css" rel="stylesheet"/>
<link media="screen" href="{theme}/style/fontello.css" type="text/css" rel="stylesheet"/>
<link media="screen" href="{theme}/style/bugs.css" type="text/css" rel="stylesheet" />

<script type="text/javascript" src="/templates/Default/style/menu1.css"></script>
<script type="text/javascript" src="/templates/Default/style/rate.css"></script>
<script type="text/javascript" src="/templates/Default/js/jquery.lib.js"></script>
<script type="text/javascript" src="/templates/Default/js/Russian/lang.js"></script>
<script type="text/javascript" src="/templates/Default/js/main.js"></script>
<script type="text/javascript" src="/templates/Default/js/profile.js"></script>



<script type="text/javascript" src="{theme}/js/bugs.js"></script>
{js}[not-logged]<script type="text/javascript" src="{theme}/js/reg.js"></script>[/not-logged]
</head>
<body onResize="onBodyResize()" class="no_display">
<div class="scroll_fix_bg no_display" onMouseDown="myhtml.scrollTop()"><div class="scroll_fix_page_top">Наверх</div></div>
<div id="doLoad"></div>
[logged]
<div class="head">
[/logged]
 <div class="autowr">

<div class="leftmenu">
<div class="headlogo pointer"></div>
<div id="backbtn" class="opacity0" onclick="history.back();">Назад</div>



</div>
 
[logged]
  <div class="headmenu">

    

   <div class="search_tab">
<input id="se_type" value="1" type="hidden">
    <input type="text" value="Поиск" class="fave_input search_input" 
		onBlur="if(this.value=='Поиск') this.value='Поиск';this.style.color = '#c1cad0';" 
		onFocus="if(this.value=='Поиск')this.value='';this.style.color = '#fff'" 
		onKeyPress="if(event.keyCode == 13) gSearch.go();"
		onKeyUp="FSE.Txt()"
	id="query" maxlength="65" />
   <div class="fast_search_bg no_display">
   <span id="reFastSearch"></span>
   <a href="/?go=search" style="padding:10px;" onClick="gSearch.go(); return false" onMouseOver="FSE.ClrHovered(this.id)" id="all_fast_res_clr1"><text>Искать</text> <b id="fast_search_txt"></b><div class="fl_r fast_search_ic"></div></a>
   </div>
   <!--/search-->	
	</div>

<div class="head_player">

   <div id="hPlay" class="fl_l">
  <a class="fl_l hPrev" onclick="player.prev()"><span></span></a>
  <a class="fl_l hPlay" onclick="player.onePlay()"><span></span></a>
  <a class="fl_l hPause" onclick="player.pause()"><span></span></a>
  <a class="fl_l hNext" onclick="player.next()"><span></span></a>
  </div>

  <a class="fl_l hOpen" onclick="doLoad.js(0); player.open(); return false;" style="margin-right: -4px;"><span></span></a>

</div>



   <a href="/?act=logout" class="fl_r">
	<img src="/templates/Default/images/icons/exit.png">
   </a>
  <div class="user_info fl_r" ><a href='/editmypage' style="font-size:12px" onclick="Page.Go(this.href); return false;" class="pointer">Редактировать</a>



   </div>
  </div>
  
   <!--search-->	
   </div>

     
 </div>
</div>
[/logged]
















[logged]
<div class="left_menu">
<div id="menu" style="float:left">
<ul id="leftmenu">
<div class="menu_ic pr_ic"></div>
<li id="myprofile" style="display:">
<a href="{my-page-link}" onclick="Page.Go(this.href); return false;">Моя страница</a></li>
<div class="menu_ic news_ic"></div>
<li id="mynews" style="display:"><a href="/news" onclick="Page.Go(this.href); return false;">Новости</a></li>
<div class="menu_ic not_ic"></div>
<li id="mynews" style="display:"><a href="/news/notifications" onclick="Page.Go(this.href); return false;">Ответы</a></li>
<div class="menu_ic msg_ic"></div>
<li id="mymail" style="display:"><a href="/messages" onclick="Page.Go(this.href); return false;">Диалоги</a><div style="margin-top:-13px;"> </div><div id="new_msg">{msg}</div></li><div class="clear"></div>
<div class="menu_ic fr_ic"></div>
<li id="myfriends" style="display:"><a href="/friends" onclick="Page.Go(this.href); return false;" id="requests_link">Друзья </a>
<div style="margin-top:-13px;"> </div> <div id="new_requests">{demands}</div></li><div style="margin-top:13px;"></div>
<div class="menu_ic comm_ic"></div>
<li id="mygroups" style="display:"><a href="/groups/" onclick="Page.Go(this.href); return false;">Сообщества</a><div style="margin-top:-15px;"> </div></li>
<div class="clear"></div>
<div class="menu_ic ph_ic"></div>
<li id="myphotos" style="display:"><a href="/albums/{my-id}" onclick="Page.Go(this.href); return false;" id="requests_link_new_photos">Фотографии </a><div id="new_photos">{new_photos}</div></li>
<div class="clear"></div>
<div class="menu_ic vid_ic"></div>
<li id="myvideos" style="display:" ><a href="/videos" onclick="Page.Go(this.href); return false;">Видеозаписи</a></li>
<div class="clear"></div>
<div class="menu_ic aud_ic"></div>
<li id="myaudio" style="display:"><a href="/audio" onClick="player.change_list(0); return false" id="fplayer_pos">Аудиозаписи</a></li>
<div class="clear"></div>
<div class="menu_ic fave_ic"></div>
<li id="myfave" style="display:"><a href="/fave" onclick="Page.Go(this.href); return false;">Закладки</a></li>
<div class="menu_ic apps_ic"></div>
<li id="myapps" style="display:"><a href="/apps" onclick="Page.Go(this.href); return false">Приложения</a></li>
<div id="birthday"></div>
<div class="mgclr"></div>
<div class="menu_gray">
<div class="menu_ic sett_ic"></div>
<li id="mysettings" style="display:"><a href="/settings" onclick="Page.Go(this.href); return false;">Настройки</a></li>
<div class="menu_ic help_ic"></div>
<li><a href="/support" onclick="Page.Go(this.href); return false">Помощь</a> <div id="new_support"></div></li>
</div>
</ul>
<br>

<div class="left_box attention">
  <div class="albtitle">Последние новости</div>
  <div>
    
  Открыта вакансия
    <div class="mgclr"></div>  
  </div>
  <a href="/blog">Подробнее</a>
</div>
<div class="mgclr"></div>


</div>
</div>
[/logged]







<div class="clear"></div>
<div style="margin-top:44px;"></div>
<div class="autowr">
<div class="content" [logged]style="width:805px;"[/logged]>
<div class="shadow">
<div class="speedbar no_display" id="">{speedbar}</div>
<div class="padcont">


<style>
.padcont {
background: none;
border-radius: none;
border: none;
}
.profile_update_photo {
  margin-top: 5px;
}

</style>









<div id="audioPlayer"></div>
<div id="page">{info}{content}</div>
<div class="clear"></div>
</div>
 
</div>

</div>
   <div class="clear"></div>

  
 
[logged]<script type="text/javascript" src="{theme}/js/push.js"></script>
<div class="no_display"><audio id="beep-three" controls preload="auto"><source src="{theme}/images/soundact.ogg"></source></audio></div>
<div id="updates"></div>[/logged]
<div class="clear"></div>
</body>
</html>










