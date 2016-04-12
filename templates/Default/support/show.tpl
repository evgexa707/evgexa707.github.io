<div class="search_form_tab" style="margin-top:-9px">
<div class="bg_block">
 <div class="buttonsprofile albumsbuttonsprofile buttonsprofileSecond" style="height:22px">

  <a href="/support" onClick="Page.Go(this.href); return false;"><div><b>[group=4]Вопросы от пользователей[/group][not-group=4]Мои вопросы[/not-group]</b></div></a>
    <div class="buttonsprofileSec"><a href="/support?act=show&qid={qid}" onClick="Page.Go(this.href); return false;"><div><b>Просмотр вопроса</b></div></a></div>
 </div>
</div>




<div class="bg_block">
<span class="fl_l" style="
"><a href="/support?act=show&qid={qid}" onclick="Page.Go(this.href); return false" style="
    font-weight: 400;
">{title}</a></span>
 <div id="status" class="fl_r color777" style="font-size: 13px">{status}</div>
<br>
</div>


<div class="bg_block" style="padding-bottom: 5px;">
<div class="ava_mini" style="float:width:60px"><a href="/u{uid}" onclick="Page.Go(this.href); return false"><img src="{ava}" alt="" title=""></a></div>
<div class="wallauthor" style="padding-top:4px;"><a href="/u{uid}" onclick="Page.Go(this.href); return false"><b>{name}</b></a><div class="fl_r" style=" margin-right: -5px; font-size: 13px;">&nbsp;&nbsp;<span class="color777">{date} &nbsp;&nbsp;</span> 
<div class="wall_delete" onmouseover="myhtml.title('{qid}', 'Удалить вопрос', 'quest_del_')" onclick="support.delquest('{qid}'); return false" id="quest_del_{qid}"></div>
</div></div>
<div style="float:left;width:690px;">
<div class="walltext">

 {question}

</div>
</div>
<div class="clear"></div>
</div>



<div class="clear"></div>
<div id="answers">{answers}</div>
<div class="note_add_bg clear support_addform">


<div class="bg_block">	
<div class="ava_mini">





 [group=4]<img src="{theme}/images/support.png" alt="" />[/group]
 [not-group=4]<a href="/u{uid}" onClick="Page.Go(this.href); return false"><img src="{ava}" alt="" /></a>[/not-group]
</div>
<textarea 
	class="videos_input wysiwyg_inpt fl_l" 
	id="answer" 
	style="width:696px;height:38px;color:#c1cad0"
	onblur="if(this.value==''){this.value='Комментировать..';this.style.color = '#c1cad0';}" 
	onfocus="if(this.value=='Комментировать..'){this.value='';this.style.color = '#000'}"
>Комментировать..</textarea>
<div class="clear"></div>
<div class="button_div fl_r"><button onClick="support.answer('{qid}', '{uid}'); return false" id="send">Отправить</button></div>
[group=4]<div class="button_div_nostl fl_r" id="close_but"><button onClick="support.close('{qid}'); return false" id="close">Закрыть вопрос</button></div>[/group]
<div class="clear"></div>
</div></div>






