var xuanzhong = {};
	
	$(".shuju").click(function(){
	  	var bool = true;
	     
		if($(this).attr("class") == "shuju xuanzhong"){
			$(this).attr("class", "shuju");
		}else{
			var value = $(this).attr("value");
			var match_id = $(this).parents(".section").attr("match_id");
			if(xuanzhong[match_id] == "undefined" || xuanzhong[match_id] == undefined || xuanzhong[match_id] == valueToType(value)){
				$(this).attr("class", "shuju xuanzhong");
			}else{
				alert("一场比赛只能选择一种玩法进行串关计算");
				bool = false;
			}
			
		}
		
		if(bool){
			attrClass();
		}
		
	});
	
	var matchArr = Array();
	var sjArr = Array();
	var plArr = Array(); 
	var zsArr = Array(); 
	var dtArray = Array(); 
	var dtCount = 0;
	var min_wf = 0;
	var dtArr = {};
	
	var old_count = 0;
	var count = 0;
	
	function attrClass(){
		xuanzhong = {};
		matchArr = [];
		sjArr = [];
		plArr = [];
		var match = {};
		var match_id = 0;
		var html = "";
		var i = 1;
		
		var length = $(".xuanzhong").length;
		old_count = count;
		if(length > 0){
			count = 1;
		}else{
			count = 0;
		}
		
		$(".xuanzhong").each(function(){
			
			var parents = $(this).parents(".section");
			var this_match_id = parents.attr("match_id");
			var match_week = parents.attr("match_week");
			var match_time = parents.attr("match_time");
			var match = parents.attr("match");
			var value = $(this).attr("value");
			var jiangjin = $(this).find("strong").text();
			xuanzhong[this_match_id] = valueToType(value);
			
			
			if(length == 1){                                  //只有一条数据
				
				html = html + "<ul class='yylClear'>"
	                            + "<li class='li1'><i>" + match_week + "</i>" + match + "</li>"
	                            + "<li class='li2'><i>" + value + "</i></li>"
	                            + "<li class='li3'><input type='checkbox' value='" + this_match_id + "'/></li>"
	                            + "<li class='li4'><i></i></li>"
	                        + "</ul>";
			
			}else{
				if(length > i){                             //多条数据，且不是最后一条
					if(i == 1){
					
						html = html + "<ul class='yylClear'>"
	                            + "<li class='li1'><i>" + match_week + "</i>" + match + "</li>"
	                            + "<li class='li2'><i>" + value + "</i>";
	                            
					}else if(this_match_id == match_id){
						html = html + "<i>" + value + "</i>";
					}else{
						++count;
						html = html + "</li>"
	                            + "<li class='li3'><input type='checkbox' value='" + match_id + "'/></li>"
	                            + "<li class='li4'><i></i></li>"
	                        + "</ul>";
	                        
	                   html = html + "<ul class='yylClear'>"
	                            + "<li class='li1'><i>" + match_week + "</i>" + match + "</li>"
	                            + "<li class='li2'><i>" + value + "</i>";
					}
				}else{
					if(this_match_id == match_id){
						html = html + "<i>" + value + "</i></li>"
	                            + "<li class='li3'><input type='checkbox' value='" + this_match_id + "'/></li>"
	                            + "<li class='li4'><i></i></li>"
	                        + "</ul>";
					}else{
						++count;
						html = html + "</li>"
	                            + "<li class='li3'><input type='checkbox' value='" + match_id + "'/></li>"
	                            + "<li class='li4'><i></i></li>"
	                        + "</ul>";
	                        
	                   html = html + "<ul class='yylClear'>"
	                            + "<li class='li1'><i>" + match_week + "</i>" + match + "</li>"
	                            + "<li class='li2'><i>" + value + "</i></li>"
	                            + "<li class='li3'><input type='checkbox' value='" + this_match_id + "'/></li>"
	                            + "<li class='li4'><i></i></li>"
	                        + "</ul>";
					}
					
				}
				
			}
			
			if(sjArr.length < count){
				matchArr.push(Array());
				sjArr.push(Array());
				plArr.push(Array());
			}
			
			match_id = this_match_id;
			
			sjArr[count - 1].push(value);
			plArr[count - 1].push(jiangjin);
			
			matchArr[count - 1][0] = match_week;
			matchArr[count - 1][1] = match_time;
			matchArr[count - 1][2] = match;
			matchArr[count - 1][3] = match_id;
			
			i++;
		});
		
		
		//alert(sjArr);
		
		$("#myList").html(html);
		var height_count = count > parseInt((length+2)/3) ? count : parseInt((length+2)/3);
		if(height_count > 4){
			$(".content .footer .yx .mask .list").height(168);
		}else{
			$(".content .footer .yx .mask .list").height(42 * height_count);
		}
		if(old_count != count){
			wf = [];
			showWf(count);
			c_ = 0;
			min_wf = 0;
			$("#jine").text("0");
			$("#zuigaojj").text("0.00");
			
		}else{
			showZs(wf, sjArr, plArr, dtArray);
		}
		$("#myCount").text("已选" + count + "场");
		
		var dtArr2 = {};
		dtArray = [];
		dtCount = 0;
		var i = 0;
		$("#myList input").each(function(index, item){
			
			if(dtArr[$(item).attr("value")] == 1){
				dtArr2[$(item).attr("value")] = 1;
				dtArray.push(1);
				dtCount++;
				$(item).attr("checked", "");
			}else{
				dtArray.push(0);
			}
			i++;
		});
		
		dtArr = dtArr2;
		
		chins();	
	}
	
	var c_ = 0;
	var wf = Array();
	
	
	function chins(){
		$("body").undelegate();
		$("body").delegate("#myList .li2 i", "click", function () {
			var index = $(".li2 i").index($(this));
		   	$(".xuanzhong").eq(index).attr("class", "shuju");
		    $(this).remove();
		    attrClass();
		});
		
		$("body").delegate("#myList input", "click", function () {
			
			var is_check = $(this).is(':checked');
			
			if($(this).is(':checked') && min_wf > 0 && dtCount == min_wf){
				$(this).removeAttr("checked");
				alert("当前选择玩法最多能定胆" + min_wf + "场比赛~");
				return false;
			} 
			dtArr = {};
			dtArray = [];
			dtCount = 0;
			$("#myList input").each(function(){
				if($(this).is(':checked')){
					dtArr[$(this).attr("value")] = 1;
					dtArray.push(1);
					dtCount++;
				}else{
					dtArray.push(0);
				}
			});
			attrClass();
		});
		
		$("body").delegate("#myList .li4", "click", function () {
			var match_id = $(this).parent().find("input").attr("value");
			$(".xuanzhong").each(function(){
				var parents = $(this).parents(".section");
				var this_match_id = parents.attr("match_id");
				if(this_match_id == match_id){
					$(this).attr("class", "shuju");
				}
			});
			attrClass();
		});
		
		
		$("body").delegate(".ggfs label input", "click", function () {
			wf = [];
			var is_check = $(this).is(':checked');
			if(is_check){
				var min_wf_count = gd__[$(this).val()][0];
				if(min_wf == 0 || min_wf_count < min_wf){
					min_wf = min_wf_count;
				}
				if(min_wf_count < dtCount){
					$(this).removeAttr("checked");
					alert("您已定胆" + dtCount + "场比赛,不能选择当前玩法~");
				}else if(c_ >= 3){
					$(this).removeAttr("checked");
				   	alert("最多只能选择3个玩法");
				}else{
				   	c_++;
				}
			}else{
				c_--;
			}
			
			min_wf = 0;
			$(".ggfs label input:checked").each(function() {
				var min_wf_count = gd__[$(this).val()][0];
				if(min_wf == 0 || min_wf_count < min_wf){
					min_wf = min_wf_count;
				}
				wf.push($(this).val());
			});
			showZs(wf, sjArr, plArr, dtArray);
		});
			
	}
	
	
	
	var zhushu = 0;
	var zuigaojj = 0;
	var jiangjintourubi = 0;
	
	function showZj(){
		$("#jine").text(zhushu * parseInt($("#bs").val()) * 2);
		$("#zuigaojj").text( (zuigaojj * parseInt($("#bs").val())).toFixed(2));
	}
	
	$("#bs").keyup(function(){
		this.value=this.value.replace(/[^0-9]/g,'');
		if(this.value > 99){
			this.value = 99;
		}else if(this.value < 1){
			this.value = 1;
		}
		showZj();
		
	});
	
	$("#jian").click(function(){
		var bs = parseInt($("#bs").val());
		if(bs > 1){
			$("#bs").val(bs - 1);
			showZj();
		}
	});
	
	$("#jia").click(function(){
		var bs = parseInt($("#bs").val());
		if(bs < 99){
			$("#bs").val(bs + 1);
			showZj();
		}
	});
	
	$("#quanshan").click(function(){
		$(".xuanzhong").attr("class", "shuju");
		attrClass();
	});
	
	
	
	$("#historydate").click(function(){
		var display = document.getElementById("historyUL").style.display;
		if(display=='none'){
	        $("#historyUL").show();
	        $(this).css('background','url("'+BASE_URL+'/jingcaizuqiujisuanqi/image/a2s.png") right center no-repeat');
	    }else{
	        $("#historyUL").hide();
	        $(this).css('background','url("'+BASE_URL+'/jingcaizuqiujisuanqi/image/a1s.png") right center no-repeat');
	    }
	});
	
	$("#historyUL li").click(function(){
		var date_ = $(this).text().substring(0, 10);
		var type = $(this).text().substring(11);
		if("当前" == type){
			window.location.href = "counter.jspx";
		}else{
			window.location.href = "counter.jspx?date=" + date_;
		}
		
	});
	
	
	$("#ckxq").click(function(){
		
		$("#bs_").val($("#bs").val());
		$("#zs_").val(zhushu);
		$("#zuigaojj_").val(jiangjintourubi.toFixed(2));
		
		if($("#bs_").val() < 0 || $("#bs_").val() > 99){
			return false;
		}
		
		if($("#zs_").val() < 1 || c_ < 1){
			alert("请先选择对阵比赛和投注玩法");
			return false;
		}
		
		
		$("#matchArr").val(JSON.stringify(matchArr));
		$("#sjArr").val(JSON.stringify(sjArr));
		$("#wfArr").val(JSON.stringify(wf));
		$("#plArr").val(JSON.stringify(plArr));
		$("#zsArr").val(JSON.stringify(zsArr));
		$("#dtArr").val(JSON.stringify(dtArr));
		$("#ckxq_form").submit();
	});