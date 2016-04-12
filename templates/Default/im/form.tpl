
<script type="text/javascript">
$(document).ready(function(){
	vii_interval_im = setInterval('im.update()', 2000);
	music.jPlayerInc();
	$('.im_scroll').scroll(function(){
		if($('.im_scroll').scrollTop() <= ($('.im_scroll').height()/2)+250)
			im.page('{for_user_id}');
	});
});
func = function(val){
	document.getElementById('message_tab_frm').elements['msg_text'].focus();
	if(document.selection){
		document.getElementById('message_tab_frm').document.selection.createRange().text = document.getElementById('message_tab_frm').document.selection.createRange().text+val;
    } else if(document.getElementById('message_tab_frm').elements['msg_text'].selectionStart != undefined){
		var element = document.getElementById('message_tab_frm').elements['msg_text']; 
		var str = element.value; 
		var start = element.selectionStart; 
		var length = element.selectionEnd - element.selectionStart; 
		element.value = str.substr(0, start) + str.substr(start, length) + val + str.substr(start + length);
	} else {
		document.getElementById('message_tab_frm').elements['msg_text'].value += val; 
    }
}
</script>


<div id="jquery_jplayer"></div>
<input type="hidden" id="teck_id" value="" />
<input type="hidden" id="typePlay" value="standart" />
<input type="hidden" id="teck_prefix" value="" />






<div class="clear"></div>




<div style="background-color: #E6E8EC; width: 501px; height: 18px;padding: 12px 33px 0px 15px;
margin: 1px -16px 0px -15px;">
<div class="note_add_bg clear support_addform im_addform">
<div class="im_border_bottom"></div>
<form id="message_tab_frm">
<div class="im_border_top"></div>
<form id="message_tab_frm">
<textarea 
	class="videos_input wysiwyg_inpt fl_l im_msg_texta" 
	id="msg_text" 
	style="height:38px"
	placeholder="Введите Ваше сообщение.."
	onKeyPress="
	 if(((event.keyCode == 13) || (event.keyCode == 10)) && (event.ctrlKey == false)) im.send('{for_user_id}', '{my-name}', '{my-ava}')
	 if(((event.keyCode == 13) || (event.keyCode == 10)) && (event.ctrlKey == true)) func('\r\n')
	"
	onKeyUp="im.typograf()"
></textarea>
</form>
<div class="clear"></div>
<div id="attach_files" class="no_display" style="margin-left:5px"></div>
<input id="vaLattach_files" type="hidden">
<div class="clear"></div>
<div class="more_div" style="margin-top: -4px;"></div>


<div class="button_div fl_r" style="margin-top: 11px;margin-bottom: 4px;"><button onclick="im.send('{for_user_id}', '{my-name}', '{my-ava}')" id="sending">Отправить</button></div>
<div class="wall_attach_icon_photo fl_l" id="wall_attach_link" onclick="wall.attach_addphoto()">Фотография</div>
    <div class="wall_attach_icon_doc fl_l" id="wall_attach_link" onclick="wall.attach_addDoc()">Документ</div>
<div class="wall_attach_icon_video fl_l" id="wall_attach_link" onclick="wall.attach_addvideo()"></div>
  <div class="wall_attach_icon_audio fl_l" id="wall_attach_link" onclick="wall.attach_addaudio()"></div>
<div class="clear" style="margin-top:10px"></div>
<div class="clear"></div>
</div></div>

<input type="hidden" id="status_sending" value="1" />
<input type="hidden" id="for_user_id" value="{for_user_id}" />


<!--<script type="text/javascript">
$(document).ready(function(){
	vii_interval_im = setInterval('im.update()', 2000);
	music.jPlayerInc();
	$('.im_scroll').scroll(function(){
		if($('.im_scroll').scrollTop() <= ($('.im_scroll').height()/2)+250)
			im.page('{for_user_id}');
	});
});
func = function(val){
	document.getElementById('message_tab_frm').elements['msg_text'].focus();
	if(document.selection){
		document.getElementById('message_tab_frm').document.selection.createRange().text = document.getElementById('message_tab_frm').document.selection.createRange().text+val;
    } else if(document.getElementById('message_tab_frm').elements['msg_text'].selectionStart != undefined){
		var element = document.getElementById('message_tab_frm').elements['msg_text']; 
		var str = element.value; 
		var start = element.selectionStart; 
		var length = element.selectionEnd - element.selectionStart; 
		element.value = str.substr(0, start) + str.substr(start, length) + val + str.substr(start + length);
	} else {
		document.getElementById('message_tab_frm').elements['msg_text'].value += val; 
    }
}
</script>
<style>
.im1_addform{padding:10px;margin-top:5px}
</style>

<div id="jquery_jplayer"></div>
<input type="hidden" id="teck_id" value="" />
<input type="hidden" id="typePlay" value="standart" />
<input type="hidden" id="teck_prefix" value="" />
<div class="note_add_bg clear im1_addform im_addform">
<div class="ava_mini im_ava_mini">
 <a href="/u{myuser-id}" onClick="Page.Go(this.href); return false"><img src="{my-ava}" alt="" /></a>
</div>
<form id="message_tab_frm">
<textarea 
	class="videos_input wysiwyg_inpt fl_l im_msg_texta" 
	id="msg_text" 
	style="height:48px"
	placeholder="Введите Ваше сообщение.."
	onKeyPress="
	 if(((event.keyCode == 13) || (event.keyCode == 10)) && (event.ctrlKey == false)) im.send('{for_user_id}', '{my-name}', '{my-ava}')
	 if(((event.keyCode == 13) || (event.keyCode == 10)) && (event.ctrlKey == true)) func('\r\n')
	"
	onKeyUp="im.typograf()"
></textarea>
</form>

<div class="clear"></div>
<div id="attach_files" class="no_display" style="margin-left:10px"></div>
<input id="vaLattach_files" type="hidden" />
<div class="clear"></div>


<div style="background: #f5f5f5;margin-top: -5px;" class="form_wall_post pull-left">
 <div style="margin-left:10px" class="pull-left">
 
       <div onclick="wall.attach_addsmile()" class="btn smbutton" type="button" tabindex="-1" onmouseover="myhtml.title('9', 'Ещё смайлики', 'newBBlockl')" id="newBBlockl9"><i class="icon-plane"><span></span></i></div>
			<div onclick="wall.attach_addphoto()" class="btn smbutton" type="button" tabindex="-2" onmouseover="myhtml.title('10', 'Прикрепить фотографию', 'newBBlockl')" id="newBBlockl10"><i class="icon-picture"><span></span></i></div>
			<div onclick="wall.attach_addvideo()" class="btn smbutton" type="button" tabindex="-3" onmouseover="myhtml.title('11', 'Прикрепить видеозапись', 'newBBlockl')" id="newBBlockl11"><i class="icon-facetime-video"><span></span></i></div>
			<div onclick="wall.attach_addaudio()" class="btn smbutton" type="button" tabindex="-4" onmouseover="myhtml.title('12', 'Прикрепить аудиозапись', 'newBBlockl')" id="newBBlockl12"><i class=" icon-music"><span></span></i></div>
			<div onclick="wall.attach_addDoc()" onmouseover="myhtml.title('13', 'Прикрепить документ', 'newBBlockl')" id="newBBlockl13" class="btn smbutton" type="button" tabindex="-7"><i class=" icon-file"><span></span></i></div>
 </div>	


 <div style="margin-left: 28px;float:left;margin-top: 1px" class="button_div fl_l margin_top_10 messFocus"><button onclick="im.send('{for_user_id}', '{my-name}', '{my-ava}')" id="sending">Отправить</button></div><br/>
	<div class="messContent" style="top:505px;width: 200px">
<div style="position: relative;line-height: 150%">
<div class="messStrleka" style="top: 27px;"></div>
<div class=""><b style="color: #2A5779;font-weight: bold;padding-bottom: 2px;">Настройки отправки</b><br><br><b>Enter</b> — отправка сообщения<br><span style="margin-top:5px"><b>Ctrl+Enter</b> — перенос строки</span></div>
</div>
</div>
 
 </div>

<div class="clear" style="margin-top:10px"></div>
<div class="clear"></div>
</div>
<input type="hidden" id="status_sending" value="1" />
<input type="hidden" id="for_user_id" value="{for_user_id}" />




<script type="text/javascript">
$(document).ready(function(){
	vii_interval_im = setInterval('im.update()', 2000);
	music.jPlayerInc();
	$('.im_scroll').scroll(function(){
		if($('.im_scroll').scrollTop() <= ($('.im_scroll').height()/2)+250)
			im.page('{for_user_id}');
	});
});
func = function(val){
	document.getElementById('message_tab_frm').elements['msg_text'].focus();
	if(document.selection){
		document.getElementById('message_tab_frm').document.selection.createRange().text = document.getElementById('message_tab_frm').document.selection.createRange().text+val;
    } else if(document.getElementById('message_tab_frm').elements['msg_text'].selectionStart != undefined){
		var element = document.getElementById('message_tab_frm').elements['msg_text']; 
		var str = element.value; 
		var start = element.selectionStart; 
		var length = element.selectionEnd - element.selectionStart; 
		element.value = str.substr(0, start) + str.substr(start, length) + val + str.substr(start + length);
	} else {
		document.getElementById('message_tab_frm').elements['msg_text'].value += val; 
    }
}
</script>
<div id="jquery_jplayer"></div>
<input type="hidden" id="teck_id" value="" />
<input type="hidden" id="typePlay" value="standart" />
<input type="hidden" id="teck_prefix" value="" />
<div class="note_add_bg clear support_addform im_addform">

<div class="clear"></div>

<div class="ava_mini im_ava_mini">
 <a href="/u{myuser-id}" onClick="Page.Go(this.href); return false"><img src="{my-ava}" alt="" /></a>
</div>
<form id="message_tab_frm">
<textarea 
	class="videos_input wysiwyg_inpt fl_l im_msg_texta" 
	id="msg_text" 
	style="height:38px"
	placeholder="Введите Ваше сообщение.."
	onKeyPress="
	 if(((event.keyCode == 13) || (event.keyCode == 10)) && (event.ctrlKey == false)) im.send('{for_user_id}', '{my-name}', '{my-ava}')
	 if(((event.keyCode == 13) || (event.keyCode == 10)) && (event.ctrlKey == true)) func('\r\n')
	"
	onKeyUp="im.typograf()"
></textarea>
</form>
<div class="clear"></div>
<div id="attach_files" class="no_display" style="margin-left:60px"></div>
<input id="vaLattach_files" type="hidden" />
<div class="clear"></div>
<div class="button_div fl_l" style="margin-left:60px"><button onClick="im.send('{for_user_id}', '{my-name}', '{my-ava}')" id="sending">Отправить</button></div>


<div class="wall_attach fl_r" onclick="wall.attach_menu('open', this.id, 'wall_attach_menu')" onmouseout="wall.attach_menu('close', this.id, 'wall_attach_menu')" id="wall_attach" style="margin-top: 0px;">Прикрепить</div>


<div class="wall_attach_menu no_display" onmouseover="wall.attach_menu('open', 'wall_attach', 'wall_attach_menu')" onmouseout="wall.attach_menu('close', 'wall_attach', 'wall_attach_menu')" id="wall_attach_menu" style="margin-left: 360px; margin-top: 20px; display: none;">
 <div class="wall_attach_icon_smile" id="wall_attach_link" onclick="wall.attach_addsmile()">Смайлик</div>
 <div class="wall_attach_icon_photo" id="wall_attach_link" onclick="wall.attach_addphoto()">Фотографію</div>
 <div class="wall_attach_icon_video" id="wall_attach_link" onclick="wall.attach_addvideo()">Відеозапис</div>
 <div class="wall_attach_icon_audio" id="wall_attach_link" onclick="wall.attach_addaudio()">Аудіозапис</div>
 <div class="wall_attach_icon_doc" id="wall_attach_link" onclick="wall.attach_addDoc()">Документ</div>
</div>


<div class="clear" style="margin-top:10px"></div>
<div class="clear"></div>
</div>
<input type="hidden" id="status_sending" value="1" />
<input type="hidden" id="for_user_id" value="{for_user_id}" />-->