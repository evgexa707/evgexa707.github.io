<script type="text/javascript">
$(document).ready(function(){
	vii_interval = setInterval('im.updateDialogs()', 2000);
	pHate = location.hash.replace('#', '');
	if(pHate)
		im.open(pHate);
});
</script><br/>
<div class="im_flblock"><a href="/" style="font-weight:normal" onClick="im.settTypeMsg(); return false" id="settTypeMsg">{msg-type}</a><div class="clear"></div>
<span id="updateDialogs"></span><div id="alldialogs">{dialogs}</div><div class="clear"></div></div><div class="im_head fl_l" id="imViewMsg"><div class="info_center"><div style="padding-top:260px">Вы можете выбрать собеседника из левой колоны и начать с ним общение в онлайн режиме, без обновления страницы.</div></div></div>
</div>


