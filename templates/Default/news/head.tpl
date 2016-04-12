[news]<script type="text/javascript">
var page_cnt = 1;
$(document).ready(function(){
	music.jPlayerInc();
	$('#wall_text, .fast_form_width').autoResize();
	$(window).scroll(function(){
		if($(document).height() - $(window).height() <= $(window).scrollTop()+($(document).height()/2-250)){
			news.page();
		}
	});
});
$(document).click(function(event){
	wall.event(event);
});
</script>
<style>.newcolor000{color:#000}</style>
<div id="jquery_jplayer"></div>

<input type="hidden" id="teck_id" value="" />
<input type="hidden" id="teck_prefix" value="" />
<input type="hidden" id="typePlay" value="standart" />
<input type="hidden" id="type" value="{type}" />




<ul class="bg_block" id="rightmenu">
<li class="{activetab-}">
<div></div>
<a href="/news" onclick="Page.Go(this.href); return false;">Лента</a></li>
<li class="{activetab-updates}">
<div></div>
<a href="/news/updates" onclick="Page.Go(this.href); return false;">Друзья </a>
</li>
<li class="{activetab-photos}">
<div></div>
<a href="/news/photos" onclick="Page.Go(this.href); return false;">Фотографии</a>
</li>
<li class="{activetab-videos}">
<div></div>
<a href="/news/videos" onclick="Page.Go(this.href); return false;" id="requests_link">Видеозаписи </a>
</li>

</ul>



<div class="bg_block" style="width: 537px;">
<div class="newmes" id="wall_tab">


<textarea onblur="if(this.value=='') this.value='Что у Вас нового?';this.style.color = '#909090';$('#wall_text').css('height', '33px');" onfocus="if(this.value=='Что у Вас нового?')this.value='';this.style.color = '#000000';$('#wall_text').css('height', '50px');" class="wall_inpst wall_fast_opened_texta" style="width: 524px; resize: none; overflow-y: hidden; border-bottom-width: 1px; border-bottom-style: solid; border-bottom-color: rgb(228, 228, 228); margin-top: -5px; color: rgb(144, 144, 144); font-weight: 500; position: absolute; top: 0px; left: -9999px; height: 33px; line-height: normal; text-decoration: none; letter-spacing: normal;" onkeyup="wall.CheckLinkText(this.value)" tabindex="-1">Что у Вас нового?</textarea><textarea id="wall_text" onblur="if(this.value=='') this.value='Что у Вас нового?';this.style.color = '#909090';$('#wall_text').css('height', '33px');" onfocus="if(this.value=='Что у Вас нового?')this.value='';this.style.color = '#000000';$('#wall_text').css('height', '50px');" class="wall_inpst wall_fast_opened_texta" style="width: 524px;
resize: none;
overflow-y: hidden;
border-bottom: 1px solid #E4E4E4;
margin-top: -5px;
color: #909090;
font-weight: 500;" onkeyup="wall.CheckLinkText(this.value)">Что у Вас нового?</textarea>
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
   <div class="attach_link_block_ic fl_l"></div><div class="attach_link_block_te"><div class="fl_l">Ссылка: <a href="/" id="attatch_link_url" target="_blank"></a></div><img class="fl_l cursor_pointer" style="margin-top:2px;margin-left:5px" src="/templates/Default/images/close_a.png" onmouseover="myhtml.title('1', 'Не прикреплять', 'attach_lnk_')" id="attach_lnk_1" onclick="wall.RemoveAttachLnk()"></div>
   <input type="hidden" id="attach_lnk_stared">
   <input type="hidden" id="teck_link_attach">
   <span id="urlParseImgs" class="no_display"></span>
   </div>
   <div class="clear"></div>
   <div id="attach_block_vote" class="no_display">
   <div class="attach_link_bg">
	<div class="texta">Тема опроса:</div><input type="text" id="vote_title" class="inpst" maxlength="80" value="" style="width:355px;margin-left:5px" onkeyup="$('#attatch_vote_title').text(this.value)"><div class="mgclr"></div>
	<div class="texta">Варианты ответа:<br><small><span id="addNewAnswer"><a class="cursor_pointer" onclick="Votes.AddInp()">добавить</a></span> | <span id="addDelAnswer">удалить</span></small></div><input type="text" id="vote_answer_1" class="inpst" maxlength="80" value="" style="width:355px;margin-left:5px"><div class="mgclr"></div>
	<div class="texta">&nbsp;</div><input type="text" id="vote_answer_2" class="inpst" maxlength="80" value="" style="width:355px;margin-left:5px"><div class="mgclr"></div>
	<div id="addAnswerInp"></div>
	<div class="clear"></div>
   </div>
   <div class="attach_toolip_but"></div>
   <div class="attach_link_block_ic fl_l"></div><div class="attach_link_block_te"><div class="fl_l">Опрос: <a id="attatch_vote_title" style="text-decoration:none;cursor:default"></a></div><img class="fl_l cursor_pointer" style="margin-top:2px;margin-left:5px" src="/templates/Default/images/close_a.png" onmouseover="myhtml.title('1', 'Не прикреплять', 'attach_vote_')" id="attach_vote_1" onclick="Votes.RemoveForAttach()"></div>
   <input type="hidden" id="answerNum" value="2">
   </div>
   <div class="clear"></div>
   <input id="vaLattach_files" type="hidden">
   <div class="clear"></div>
<div class="wall_attach_icon_photo fl_l" id="wall_attach_link" onclick="wall.attach_addphoto()">Фотография</div>
    <div class="wall_attach_icon_doc fl_l" id="wall_attach_link" onclick="wall.attach_addDoc()">Документ</div>
<div class="wall_attach_icon_video fl_l" id="wall_attach_link" onclick="wall.attach_addvideo()"></div>
  <div class="wall_attach_icon_audio fl_l" id="wall_attach_link" onclick="wall.attach_addaudio()"></div>
    <div class="wall_attach_icon_vote fl_l" id="wall_attach_link" onclick="$('#attach_block_vote').slideDown('fast');wall.attach_menu('close', 'wall_attach', 'wall_attach_menu');$('#vote_title').focus();$('#vaLattach_files').val($('#vaLattach_files').val()+'vote|start||')"></div>

   <div class="button_div fl_r margin_top_10"><button onclick="wall.send_news(); return false" id="wall_send">Отправить</button></div>

  </div>

  <div class="clear"></div>

</div>






</div>
<div class="clear"></div><div style="margin-top:10px;"></div>[/news]
[bottom]<span id="news"></span>
[bottom]<span id="news"></span>
<div onClick="news.page()" id="wall_l_href_news" class="cursor_pointer"><div class="photo_all_comm_bg wall_upgwi" id="loading_news" style="width:750px">Показать предыдущие новости</div></div>[/bottom]