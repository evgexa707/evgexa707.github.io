<script type="text/javascript">
var jQpage_cnt = 1;
$(document).ready(function(){
  player.jPlayerInc();
  $('.staticpl_audios').scroll(function(){
	if($('#jQaudios').height() - $('.staticpl_audios').height() <= $('.staticpl_audios').scrollTop() + ($('.staticpl_audios').height() / 2 + 100 ))
		player.page();
  });
});
</script>
<div id="Xjquery_jplayer"></div>
 <div class="staticpl_seadisb"></div>
<div class="staticPlbgTitle" style="box-shadow: 0px 0px 100px 0px; border-radius: 4px; position: relative; z-index: 100;">
  <div class="staticpl_play fl_l" onclick="player.onePlay()"></div>
  <div class="staticpl_pause fl_l" onclick="player.pause()"></div>
  <div class="staticpl_prev fl_r" onclick="player.prev()"></div>
  <div class="staticpl_next fl_r" onclick="player.next()"></div>

  <div class="staticpl_trackname" style="width: 535px;"><div class="staticpl_rtitle" style="max-width: 495px;"><div><b id="XjArtis">Aurosonic &amp; Frainbreeze</b> – <span id="XjTitle">Tell Me Anything(with Sarah Russell) [Radio Edit]</span></div></div><small id="play_time">00:00</small></div>
  <div class="staticpl_progress_bar" style="width: 530px;">
   <div id="player_progress_load_bar_2" style="width: 0%;">
    <div id="player_progress_play_bar_2" style="width: 0%;"></div>
   </div>
  </div>
  <div class="staticpl_progress_bar_voice" id="player_volume_bar_2">
   <div id="player_volume_bar_value_2" style="width: 80%;"></div>
  </div>
  <div class="staticpl_repeat" onclick="player.refresh()" onmouseover="myhtml.title('1', 'Повторять эту песню', 'xPlayerVolrefresh')" id="xPlayerVolrefresh1"></div>

  <div class="clear"></div>
 </div>
 <div class="staticpl_seachbg">
  <img src="{theme}/images/loading_mini.gif" class="fl_r no_display" id="jQpLoad" style="margin-left:410px;margin-top:13px;position:absolute" />
  <input type="text" value="Поиск" class="fave_input" 
	onBlur="if(this.value==''){this.value='Поиск';this.style.color = '#c1cad0'}" 
	onFocus="if(this.value=='Поиск'){this.value='';this.style.color = '#000'}" 
	onKeyUp="player.gSearch()"
	id="jQpSeachVal"
	maxlength="70" />
	<div id="jQpaddbutpos"></div>
	<div class="clear"></div>
 </div>
 <div class="staticpl_audios">
  <div class="staticpl_shadow"></div>
   <div id="jQaudios">{audios}</div>
   <div class="staticpl_albut {jQbut}" onClick="player.page()"><span id="jQp_page_but">Показать больше аудиозаписей</span></div>
 </div>
 <div class="staticpl_bottom">
  <div class="fl_l staticpl_mtp">
   <a href="/" onClick="player.change_list(0); return false">Перейти к списку аудиозаписей</a>

  </div>
  <div class="button_div fl_r"><button onClick="player.close()">Закрыть</button></div>
  <div class="clear"></div>
 </div>






