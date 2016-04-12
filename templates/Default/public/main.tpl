<script type="text/javascript">
var startResizeCss = false;
$(document).ready(function(){
	[admin]ajaxUpload = new AjaxUpload('upload_cover', {
		action: '/index.php?go=groups&act=upload_cover&id={id}',
		name: 'uploadfile',
		onSubmit: function (file, ext) {
			if(!(ext && /^(jpg|png|jpeg|gif|jpe)$/.test(ext))) {
				addAllErr(lang_bad_format, 3300);
				return false;
			}
			$("#les10_ex2").draggable('destroy');
			$('.cover_loaddef_bg').css('cursor', 'default');
			$('.cover_loading').show();
			$('.cover_newpos, .cover_descring').hide();
			$('.cover_profile_bg').css('opacity', '0.4');
		},
		onComplete: function (file, row){
			if(row == 1 || row == 2) addAllErr('Максимальны размер 7 МБ.', 3300);
			else {
				$('.cover_loading').hide();
				$('.cover_loaddef_bg, .cover_hidded_but, .cover_loaddef_bg, .cover_descring').show();
				$('#upload_cover').text('Изменить фото');
				$('.cover_profile_bg').css('opacity', '1');
				$('.cover_loaddef_bg').css('cursor', 'move');
				$('.cover_newpos').css('position', 'absolute').css('z-index', '2').css('margin-left', '197px').show();
				row = row.split('|');
				rheihht = row[1];
				postop = (parseInt(rheihht/2)-100);
				if(rheihht <= 230) postop = 0;
				$('#les10_ex2').css('height', +rheihht+'px').css('top', '-'+postop+'px');
				cover.init('/uploads/groups/'+row[0], rheihht);
				$('.cover_addut_edit').attr('onClick', 'cover.startedit(\'/uploads/groups/'+row[0]+'\', '+rheihht+')');
			}
		}
	});[/admin]
	$('#wall_text, .fast_form_width').autoResize();
	myhtml.checked(['{settings-comments}', '{settings-discussion}']);
	music.jPlayerInc();
	$(window).scroll(function(){
		if($('#type_page').val() == 'public'){
			if($(document).height() - $(window).height() <= $(window).scrollTop()+($(document).height()/2-250)){
				groups.wall_page();
			}
			if($(window).scrollTop() < $('#fortoAutoSizeStyle').offset().top){
				startResizeCss = false;
				$('#addStyleClass').remove();
			}
			if($(window).scrollTop() > $('#fortoAutoSizeStyle').offset().top && !startResizeCss){
				startResizeCss = true;
				$('body').append('<div id="addStyleClass"><style type="text/css" media="all">.public_wall{width:770px}.infowalltext_f{font-size:11px}.wall_inpst{width:688px}.public_likes_user_block{margin-left:585px}.wall_fast_opened_form{width:698px}.wall_fast_block{width:710px;margin-top:2px}.public_wall_all_comm{width:692px;margin-top:2px;margin-bottom:-2px}.player_mini_mbar_wall{width:710px;margin-bottom:0px}#audioForSize{min-width:700px}.wall_rec_autoresize{width:710px}.wall_fast_ava img{width:50px}.wall_fast_ava{width:60px}.wall_fast_comment_text{margin-left:57px}.wall_fast_date{margin-left:57px;font-size:11px}.size10{font-size:11px}</style>');
			}
		}	
	});
	langNumric('langForum', '{forum-num}', 'обсуждение', 'обсуждения', 'обсуждений', 'обсуждение', 'Нет обсуждений');
	langNumric('langNumricAll', '{audio-num}', 'аудиозапись', 'аудиозаписи', 'аудиозаписей', 'аудиозапись', 'аудиозаписей');
	langNumric('langNumricVide', '{videos-num}', 'видеозапись', 'видеозаписи', 'видеозаписей', 'видеозапись', 'видеозаписей');
});
$(document).click(function(event){
	wall.event(event);
});
</script>
<input type="hidden" id="type_page" value="public" />
<style>.newcolor000{color:#000}</style>
<div id="jquery_jplayer"></div>
<div id="addStyleClass"></div>
<input type="hidden" id="teck_id" value="" />
<input type="hidden" id="teck_prefix" value="" />
<input type="hidden" id="typePlay" value="standart" />
<input type="hidden" id="public_id" value="{id}" />
[admin]<div class="cover_loading no_display"><img src="{theme}/images/progress_gray.gif" /></div>
<div class="cover_profile_bg cover_groups_bg">
 <div class="cover_buts_pos">
  <div class="cover_newpos" {cover-param-}>
  <div id="cover_addut_edit" class="no_display"><div class="cover_addut_edit {cover-param}" onClick="cover.startedit('{cover}', '{cover-height}')">Редактировать обложку</div></div>
  </div>
  <div class="cover_loaddef_bg {cover-param}" {cover-param-}>
   <div class="cover_descring {cover-param-}">Обложку можно двигать по высоте</div>
   <div id="les10_ex2" {cover-param-}><img src="{cover}" width="" id="cover_img" /></div>
   <div id="cover_restart"></div>
  </div>
 </div>
</div>[/admin]
[not-admin][cover]<div class="cover_all_user"><img src="{cover}" width="" id="cover_img" {cover-param-} /></div>[/cover][/not-admin]

<div class="ava fl_r" style="margin-right:0px" onMouseOver="groups.wall_like_users_five_hide()">







<div class="bg_block" style="padding-bottom: 5px;">
<center>
[admin]<div id="owner_photo_wrap">
  <div id="owner_photo_top_bubble_wrap">
  <div id="owner_photo_top_bubble">
        <div class="owner_photo_bubble_delete_wrap" onclick="groups.delphoto('{id}'); return false;">
          <div class="owner_photo_bubble_delete"></div>
        </div>
  </div>
</div>[/admin]
<div class="b_photo "><span id="ava">
<a class="cursor_pointer" onclick="Photo.groups('{id}', '{ava}', '3'); return false">

<img src="{photo}" id="ava"></a></span>
 [admin]<div id="owner_photo_bubble_wrap">
        <div id="owner_photo_bubble">
        <div id="owner_photo_bubble"><div class="owner_photo_bubble_action owner_photo_bubble_action_update" onclick="groups.loadphoto('{id}')">
  <span class="owner_photo_bubble_action_in">Загрузить фотографию</span>
</div><div class="owner_photo_bubble_action owner_photo_bubble_action_crop" onclick="groups.delphoto('{id}'); return false;">
  <span class="owner_photo_bubble_action_in">Удалить фотографию</span>
</div></div>
  </div>
</div></div>

</div>[/admin]</center>


 
   <div id="yes" class="{yes}">
    <div class="button_div big_btn fl_l" style="  margin-top: 10px;"><button onclick="groups.login('{id}'); return false" style="width:205px">Подписаться</button></div>
    <div class="fr-info" style="margin-top: 0px;" id="num2"><a href="/public{id}" onclick="groups.all_people('{id}'); return false">Подписался <span id="traf2">{num}</span> </a></div>
   </div>
   <div id="no" class="{no}" style="text-align:left">

<div class="button_div big_btn fl_l" style="  margin-top: 10px;"><button onclick="groups.exit2('{id}', '1628'); return false" style="width:205px">Отписаться</button></div>
<div class="clear"></div>
<div class="fr-info" style="margin-top: 0px;">Вы подписаны на новости этого сообщества.</div>


   </div>
   <div class="clear"></div>
  </div>




<div class="menuleft" style="margin-top:5px"><div class="bg_block">
  <a href="/" onclick="groups.inviteBox('{id}'); return false"><div>Пригласить друзей</div></a> 
 [admin]
   
  <a href="/stats?gid={id}" onclick="Page.Go(this.href); return false"><div>Статистика страницы</div></a>  
  
  <a href="/" onclick="groups.editform(); return false"><div>Управление страницей</div></a>[/admin]
 </div>

 </div>







 <div style="margin-top:7px">













<div class="bg_block">
  <div class="{no-users}" id="users_block">

   
  <a onClick="groups.all_people('{id}')" style="text-decoration:none"><div class="albtitle"><span id="traf"></span>{num}</div></a>

 <div class="newmesnobg" style="padding-left: 11px;padding-top: 11px;padding-bottom:0px;margin-bottom:-2px"><div class="public_usersblockhidden">{users}</div>
    <div class="clear"></div>
   </div>
  </div> </div>
 </div>
  [videos]<div class="bg_block"><div class="public_vlock cursor_pointer" onClick="Page.Go('/public/videos{id}'); return false">Видеозаписи</div>

  [yesvideo]<div class="color777 public_margbut">{videos-num} <span id="langNumricVide"></span></div>[/yesvideo]
  {videos}
  [novideo]<div class="line_height color777" align="center">Ролики с Вашим участием и другие видеоматериалы<br />
  <a href="/public/videos{id}" onClick="Page.Go(this.href); return false">Добавить видеозапись</a></div>[/novideo]
 </div>[/videos]
 [feedback]<div class="bg_block"><div class="public_vlock cursor_pointer" onClick="groups.allfeedbacklist('{id}')">Контакты [yes][admin]<a href="/public{id}" class="fl_r" onClick="groups.allfeedbacklist('{id}'); return false">ред.</a>[/admin][/yes]</div>
 <div class="public_" id="feddbackusers">
  [yes]<div class="color777 public_margbut">{num-feedback}</div>[/yes]
  {feedback-users}
  [no]<div class="line_height color777" align="center">Страницы представителей, номера телефонов, e-mail<br />
  <a href="/public{id}" onClick="groups.addcontact('{id}'); return false">Добавить контакты</a></div>[/no]
 </div></div>[/feedback]
 [audios]<div class="bg_block"><div class="public_vlock cursor_pointer" onClick="Page.Go('/public/audio{id}'); return false">Аудиозаписи</div>

  [yesaudio]<div class="color777 public_margbut">{audio-num} <span id="langNumricAll"></span></div>[/yesaudio]
  {audios}
  [noaudio]<div class="line_height color777" align="center">Композиции или другие аудиоматериалы<br />
  <a href="/public/audio{id}" onClick="Page.Go(this.href); return false">Добавить аудиозапись</a></div>[/noaudio]
 </div>[/audios]
 <div id="fortoAutoSizeStyle"></div>
</div>
<div class="profiewr">
 <div id="public_editbg_container">
 <div class="public_editbg_container">
 <div class="fl_l" style="width:560px">
 [admin]<div class="set_status_bg no_display" id="set_status_bg">
  <input type="text" id="status_text" class="status_inp" value="{status-text}" style="width:500px;" maxlength="255" onKeyPress="if(event.keyCode == 13)gStatus.set('', 1)" />
  <div class="fl_l status_text"><span class="no_status_text [status]no_display[/status]">Введите здесь текст статуса.</span><a href="/" class="yes_status_text [no-status]no_display[/no-status]" onClick="gStatus.set(1, 1); return false">Удалить статус</a></div>
  [status]<div class="button_div_gray fl_r status_but margin_left"><button>Отмена</button></div>[/status]
  <div class="button_div fl_r status_but"><button id="status_but" onClick="gStatus.set('', 1)">Сохранить</button></div>
 </div>[/admin]
<div class="bg_block">
 <div class="public_title" id="e_public_title">{title} {verification}</div>
 <div class="status">
</div>
  <div>[admin]<a href="/" id="new_status" onClick="gStatus.open(); return false">[/admin]{status-text}[admin]</a>[/admin]</div>
  [admin]<span id="tellBlockPos"></span>
  <div class="status_tell_friends no_display" style="width:215px">
   <div class="status_str"></div>
   <div class="html_checkbox" id="tell_friends" onClick="myhtml.checkbox(this.id); gStatus.startTellPublic('{id}')">Рассказать подписчикам сообщества</div>
  </div>[/admin]
  [admin]<a href="#" onClick="gStatus.open(); return false" id="status_link" [status]class="no_display"[/status]>установить статус</a>[/admin]
 </div>
<div class="bg_block">
  <div class="{descr-css}" id="descr_display"><div class="flpodtext">Описание:</div> <div class="flpodinfo" id="e_descr">{descr}</div></div>
  <div class="flpodtext">Дата создания:</div> <div class="flpodinfo">{date}</div>
  [web]<div class="flpodtext">Веб-сайт:</div> <div class="flpodinfo"><a href="{web}" target="_blank">{web}</a></div>[/web]
 </div></div>
 [admin]<div class="public_editbg fl_l no_display" id="edittab1">
  <div class="public_title">Редактирование страницы</div>
  <div class="public_hr"></div>
  <div class="texta">Название:</div>
   <input type="text" id="title" class="inpst" maxlength="100"  style="width:260px;" value="{title}" />
  <div class="mgclr"></div>
  <div class="texta">Описание:</div>
   <textarea id="descr" class="inpst" style="width:260px;height:80px">{edit-descr}</textarea>
  <div class="mgclr"></div>
  <div class="texta">Адрес страницы:</div>
   <input type="hidden" id="prev_adres_page" class="inpst" maxlength="100"  style="width:260px;" value="{adres}" />
   <input type="text" id="adres_page" class="inpst" maxlength="100"  style="width:260px;" value="{adres}" />
  <div class="mgclr"></div>
  <div class="texta">Веб-сайт:</div>
   <input type="text" id="web" class="inpst" maxlength="100"  style="width:260px;" value="{web}" />
  <div class="mgclr"></div>
  <div class="texta">&nbsp;</div>
   <div class="html_checkbox" id="comments" onClick="myhtml.checkbox(this.id)" style="margin-bottom:8px">Комментарии включены</div>
  <div class="mgclr clear"></div>
  <div class="texta">&nbsp;</div>
   <div class="html_checkbox" id="discussion" onClick="myhtml.checkbox(this.id)" style="margin-bottom:8px">Обсуждения включены</div>
  <div class="mgclr clear"></div>
  <div class="texta">&nbsp;</div>
   <a href="/public{id}" onClick="groups.edittab_admin(); return false">Назначить администраторов &raquo;</a>
  <div class="mgclr"></div>
  <div class="texta">&nbsp;</div>
   <div class="button_div fl_l"><button onClick="groups.saveinfo('{id}'); return false" id="pubInfoSave">Сохранить</button></div>
   <div class="button_div_gray fl_l margin_left"><button onClick="groups.editformClose(); return false">Отмена</button></div>
  <div class="mgclr"></div>
 </div>
 <div class="public_editbg fl_l no_display" id="edittab2">
  <div class="public_title">Руководители страницы</div>
  <div class="public_hr"></div>
  <input 
	type="text" 
	placeholder="Введите ссылку на страницу или введите ID страницы пользователя и нажмите Enter" 
	class="videos_input" 
	style="width:526px"
	onKeyPress="if(event.keyCode == 13)groups.addadmin('{id}')"
	id="new_admin_id"
   />
  <div class="clear"></div>
  <div style="width:600px" id="admins_tab">{admins}</div>
  <div class="clear"></div>
  <div class="button_div fl_l"><button onClick="groups.editform(); return false">Назад</button></div>
 </div>[/admin]
 </div>
 </div>
 [discussion]<div class="bg_block"><a href="/forum{id}" onClick="Page.Go(this.href); return false" class="fl_l" style="text-decoration:none"><div class="albtitle" style="border-bottom:0px">{forum-num} <b id="langForum">Нет обсуждений</b></div></a>
 <a href="/forum{id}?act=new" onClick="Page.Go(this.href); return false" class="fl_r {no}" style="text-decoration:none"><div class="albtitle" style="border-bottom:0px;color:#ddd">Новая тема</div></a>
 <div class="clear"></div>{thems}<div class="clear"></div></div>[/discussion]

 [admin]<div class="bg_block">
 <div class="albtitle" id="rec_num" style="border-bottom:0px">{rec-num}</div>
 <div class="mgclr"></div><div class="newmes" id="wall_tab" style="padding-top: 10px;border-top: 1px solid #E7EAED;">
  <input type="hidden" value="Что у Вас нового?" id="wall_input_text">
  <input type="text" class="wall_inpst" value="Что у Вас нового?" onmousedown="wall.form_open(); return false" id="wall_input" style="margin: 0px; display: none;">
  <div class="no_display" id="wall_textarea" style="display: block;">
   <textarea id="wall_text" class="wall_inpst wall_fast_opened_texta" style="width: 534px; margin: 0px; height: 33px;" onkeyup="wall.CheckLinkText(this.value)" onblur="wall.CheckLinkText(this.value, 1)" onkeypress="if(event.keyCode == 10 || (event.ctrlKey &amp;&amp; event.keyCode == 13)) groups.wall_send('19')">   </textarea>
   <div id="attach_files" class="margin_top_10 no_display"></div>
   <div id="attach_block_lnk" class="no_display clear">
   <div class="attach_link_bg">
    <div align="center" id="loading_att_lnk"><img src="/templates/Default/images/loading_mini.gif" style="margin-bottom:-2px"></div>
    <img src="" align="left" id="attatch_link_img" class="no_display cursor_pointer" onclick="wall.UrlNextImg()">
  <div id="attatch_link_title"></div>
  <div id="attatch_link_descr"></div>
  <div class="clear"></div>
   </div>
   <div class="attach_toolip_but"></div>
   <div class="attach_link_block_ic fl_l no_display"></div><div class="attach_link_block_te"><div class="fl_l">Ссылка: <a href="/" id="attatch_link_url" target="_blank"></a></div><img class="fl_l cursor_pointer" style="margin-top:2px;margin-left:5px" src="/templates/Default/images/close_a.png" onmouseover="myhtml.title('1', 'Не прикреплять', 'attach_lnk_')" id="attach_lnk_1" onclick="wall.RemoveAttachLnk()"></div>
   <input type="hidden" id="attach_lnk_stared">
   <input type="hidden" id="teck_link_attach">
   <span id="urlParseImgs" class="no_display"></span>
   </div>
   <div class="clear"></div>
   <div id="attach_block_vote" class="no_display">
   <div class="attach_link_bg">
  <div class="texta">Тема опроса:</div><input type="text" id="vote_title" class="inpst" maxlength="80" value="" style="width:355px;margin-left:-25px" onkeyup="$('#attatch_vote_title').text(this.value)"><div class="mgclr"></div>
  <div class="texta">Варианты ответа:<br><small><span id="addNewAnswer"><a class="cursor_pointer" onclick="Votes.AddInp()">добавить</a></span> | <span id="addDelAnswer">удалить</span></small></div><input type="text" id="vote_answer_1" class="inpst" maxlength="80" value="" style="width:355px;margin-left:-25px"><div class="mgclr"></div>
  <div class="texta">&nbsp;</div><input type="text" id="vote_answer_2" class="inpst" maxlength="80" value="" style="width:355px;margin-left:-25px"><div class="mgclr"></div>
  <div id="addAnswerInp"></div>
  <div class="clear"></div>
   </div>
   <div class="attach_toolip_but"></div>
   <div class="attach_link_block_ic fl_l no_display"></div><div class="attach_link_block_te"><div class="fl_l">Опрос: <a id="attatch_vote_title" style="text-decoration:none;cursor:default"></a></div><img class="fl_l cursor_pointer" style="margin-top:2px;margin-left:5px" src="/templates/Default/images/close_a.png" onmouseover="myhtml.title('1', 'Не прикреплять', 'attach_vote_')" id="attach_vote_1" onclick="Votes.RemoveForAttach()"></div>
   <input type="hidden" id="answerNum" value="2">
   </div>
   <div class="clear"></div>
   <input id="vaLattach_files" type="hidden">
   <div class="clear"></div>
<div class="wall_attach_icon_photo fl_l" id="wall_attach_link" onclick="groups.wall_attach_addphoto()">Фотография</div>
    <div class="wall_attach_icon_doc fl_l" id="wall_attach_link" onclick="wall.attach_addDoc()">Документ</div>
<div class="wall_attach_icon_video fl_l" id="wall_attach_link" onclick="wall.attach_addvideo_public()"></div>
  <div class="wall_attach_icon_audio fl_l" id="wall_attach_link" onclick="wall.attach_addaudio()"></div>
    <div class="wall_attach_icon_vote fl_l" id="wall_attach_link" onclick="$('#attach_block_vote').slideDown('fast');wall.attach_menu('close', 'wall_attach', 'wall_attach_menu');$('#vote_title').focus();$('#vaLattach_files').val($('#vaLattach_files').val()+'vote|start||')"></div>

   <div class="button_div fl_r margin_top_10"><button onclick="groups.wall_send('{id}'); return false" id="wall_send">Отправить</button></div>
  </div> </div>
  <div class="clear"></div>
 
 </div>[/admin]
 <div id="public_wall_records">{records}</div>
 <div class="cursor_pointer {wall-page-display}" onClick="groups.wall_page('{id}'); return false" id="wall_all_records"><div class="public_wall_all_comm" id="load_wall_all_records" style="margin-left:0px">к предыдущим записям</div></div>
 <input type="hidden" id="page_cnt" value="1" />
</div>
<div class="clear"></div>