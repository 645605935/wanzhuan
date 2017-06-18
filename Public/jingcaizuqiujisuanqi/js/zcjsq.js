$('.xiala span').click(function (){
    var mask = $(this).closest('.xiala').children(".mask");
//    mask.toggle();
    var display = $(mask).get(0).style.display;
    if(display=='none'){
        $('.xiala span').css('background','url("'+BASE_URL+'/jingcaizuqiujisuanqi/image/a1s.png") right center no-repeat');
       // $('.xiala .mask').hide();
        mask.show();
        $(this).css('background','url("'+BASE_URL+'/jingcaizuqiujisuanqi/image/a2s.png") right center no-repeat');
    }else{
        mask.hide();
        $(this).css('background','url("'+BASE_URL+'/jingcaizuqiujisuanqi/image/a1s.png") right center no-repeat');
    }
});

$("#tsks ul li").click(function(){
    var yuan = $('#tsks span').text();
    var txt = $(this).text();
    $("#tsks span").html(txt);
    $(this).html(yuan);
    $('#tsks span').css('background','url("' + m_res + 'images/jingcaizuqiujisuanqi/a1s.png") right center no-repeat');
    $("#tsks ul").hide();
});

$(".dateShousuo").click(function(){
    var article = $(this).closest('.article');
    var articleCon = $(this).closest('.article').children(".articleCon");
    articleCon.toggle();
    var display = $(articleCon).get(0).style.display;
    if(display=='none'){
        $(this).css('background','url("' + m_res + 'images/jingcaizuqiujisuanqi/jiantou2.png") center center no-repeat');
        $(this).closest('.date').css('border-bottom','1px solid #999');
    }else{
        $(this).css('background','url("' + m_res + 'images/jingcaizuqiujisuanqi/jiantou1.png") center center no-repeat');
        $(this).closest('.date').css('border-bottom','none');
    }
    var contentH = $('#content').height();
    var qtqw = $(window).height() - 350;
    if(contentH>qtqw){
        $('#footer').addClass('dibu');
    }else{
        $("#footer").removeClass('dibu');
    }
});

$('.mingxi').click(function (){
    var mingxi = $(this).closest('tr').children('.mingxi');
    var index = $(this).index();
    var section = $(this).closest('.section');
    var saishiCon = section.children('.saishiCon');
    var dangqian = saishiCon.eq(index-12);
    var display = $(dangqian).get(0).style.display;
    if(display=='none'){
        saishiCon.hide();
        dangqian.show();
        mingxi.find('span').css('background','url("'+BASE_URL+'/jingcaizuqiujisuanqi/image/a1s.png") right center no-repeat');
        $(this).find('span').css('background','url("'+BASE_URL+'/jingcaizuqiujisuanqi/image/a2s.png") right center no-repeat');
        mingxi.css('background','#fff');
        $(this).css('background','#FFF1E7');
    }else{
        saishiCon.hide();
        mingxi.css('background','#fff');
        $(this).find('span').css('background','url("'+BASE_URL+'/jingcaizuqiujisuanqi/image/a1s.png") right center no-repeat');
    }
    var contentH = $('#content').height();
    var qtqw = $(window).height() - 350;
    if(contentH>qtqw){
        $('#footer').addClass('dibu');
    }else{
        $("#footer").removeClass('dibu');
    }
});

function search_(){
	
	$("div[class='section']").show();
	
	var rq = ",";
	$("input:checkbox[name='checkbox1']").not("input:checked").each(function() {
    	rq += $(this).val() + ",";
    });
    
    var league = ",";
    $("input:checkbox[name='checkbox2']").not("input:checked").each(function() {
    	league += $(this).val() + ",";
    });

    var pl = ",";
    $("input:checkbox[name='checkbox3']").not("input:checked").each(function() {
    	pl += $(this).val() + ",";
    });
    
    $("div[class='section']").each(function() {
		if(rq.indexOf("," + $(this).attr("rq_val") + ",") > -1){
			$(this).hide();
		}else if(pl.indexOf("," + $(this).attr("pl_val") + ",") > -1){
			$(this).hide();
		}else if(league.indexOf("," + $(this).attr("league_val") + ",") > -1){
			$(this).hide();
		}
	});
}

$("input:checkbox[name='checkbox1']").click(function (){
	search_();
});

$("input:checkbox[name='checkbox2']").click(function (){
	search_();
});

$("input:checkbox[name='checkbox3']").click(function (){
	search_();
});

$("input:checkbox[name='checkbox4']").click(function (){
    if($(this).is(':checked')){
    	$("#"+$(this).attr("value")).show();
    }else{
    	$("#"+$(this).attr("value")).hide();
    }
});

$("#checkAll").click(function() {
	$("input:checkbox[name='checkbox2']").each(function() {
        this.checked = true;
    });
    search_();
});

$("#removeAll").click(function() {
	$("input:checkbox[name='checkbox2']").each(function() {
        this.checked = false;
    });
    search_();
});

$("#reverse").click(function() {
	$("input:checkbox[name='checkbox2']").each(function() {
        if(this.checked == true) {
            this.checked = false;
        } else {
            this.checked = true;
        }
    });
    search_();
});

jiajian();
function jiajian(){
    $('#jia').click(function () {
        var bssz = $('#bssz').val();
        $('#bssz').val(parseInt(bssz)+1);
    });
    $('#jian').click(function () {
        var bssz = $('#bssz').val();
        if(bssz>1){
            $('#bssz').val(parseInt(bssz)-1);
        }
    });
}

$(window).scroll(function() {
    var qg = $(document).height() -200;
    var gdgd = $(document).scrollTop()+$(window).height();
    if(qg<gdgd){
        $("#footer").removeClass('dibu');
    }else{
        $('#footer').addClass('dibu');
    }
})
$("#yincang").click(function(){
    $(this).closest('.mask').hide();
    $('.xiala span').css('background','url("' + m_res + 'images/jingcaizuqiujisuanqi/a1s.png") right center no-repeat');
});