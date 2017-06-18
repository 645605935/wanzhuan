var jb_ = {
		"2" : "2串1",
		"3" : "3串1",
		"4" : "4串1",
		"5" : "5串1",
		"6" : "6串1",
		"7" : "7串1",
		"8" : "8串1"
		};

var gd_ = {
		"3" : ["3串3", "3串4"],
		"4" : ["4串4", "4串5", "4串6", "4串11"],
		"5" : ["5串5", "5串6", "5串10", "5串16", "5串20", "5串26"],
		"6" : ["6串6", "6串7", "6串15", "6串20", "6串22", "6串35", "6串42", "6串50", "6串57"],
		"7" : ["7串7", "7串8", "7串21", "7串35", "7串120"],
		"8" : ["8串8", "8串9", "8串28", "8串56", "8串70", "8串247"]
		};


var gd__ ={
		"2串1":[2], "2串3":[2,1], 
		
		"3串1":[3], "3串3":[2], "3串4":[2,3], "3串7":[1,2,3],
		
		"4串1":[4], "4串4":[3], "4串5":[3,4], "4串6":[2], "4串11":[2,3,4], "4串15":[1,2,3,4],
		
		"5串1":[5], "5串5":[4], "5串6":[4,5], "5串10":[2], "5串16":[3,4,5], "5串20":[2,3], "5串26":[2,3,4,5], "5串31":[1,2,3,4,5],
		
		"6串1":[6], "6串6":[5], "6串7":[5,6], "6串15":[2], "6串20":[3], "6串22":[4,5,6], "6串35":[2,3], "6串42":[3,4,5,6], "6串50":[2,3,4], "6串57":[2,3,4,5,6], "6串63":[1,2,3,4,5,6],
		
		"7串1":[7], "7串7":[6], "7串8":[6,7], "7串21":[5], "7串35":[4], "7串120":[2,3,4,5,6,7],	
		
		"8串1":[8], "8串8":[7], "8串9":[7,8], "8串28":[6], "8串56":[5], "8串70":[4], "8串247":[2,3,4,5,6,7,8],
		
		"9串1":[9], 
		
		"10串1":[10],
		
		"11串1":[11],
		
		"12串1":[12],
		
		"13串1":[13],
		
		"14串1":[14],
		
		"15串1":[15]
	};

function showWf(count){
	if(count >8){
		count = 8;
	}
	if(count < 2){
		$("#wf_jb").html("");
		$("#wf_gd").html("");
	}else{
		var html_jb = "";
		var html_gd = "";
		html_jb = html_jb + "<label><input type='checkbox' value='" + jb_[count] + "'>" + jb_[count] + "</label> ";
		
		if(count > 2){
			$.each(gd_[count], function(idx, item) {
				html_gd = html_gd + "<label><input type='checkbox' value='" + item + "'>" + item + "</label>";
			});
			html_gd = html_gd + "<br>";
		}
		
		$("#wf_jb").html(html_jb);
		$("#wf_gd").html(html_gd);
	}
	
}

var zc_ = {
		"主胜" : "0",
		"平": "0",
		"主负" : "0",
		
		"主胜(让)" : "1",
		"平(让)" : "1",
		"主负(让)" : "1",

		"1-0" : "2",
		"2-0" : "2",
		"2-1" : "2",
		"3-0" : "2",
		"3-1" : "2",
		"3-2" : "2",
		"4-0" : "2",
		"4-1" : "2",
		"4-2" : "2",
		"5-0" : "2",
		"5-1" : "2",
		"5-2" : "2",
		"胜其他" : "2",
		
		"0-0" : "3",
		"1-1" : "3",
		"2-2" : "3",
		"3-3" : "3",
		"平其他" : "3",
		
		"0-1" : "4",
		"0-2" : "4",
		"1-2" : "4",
		"0-3" : "4",
		"1-3" : "4",
		"2-3" : "4",
		"0-4" : "4",
		"1-4" : "4",
		"2-4" : "4",
		"0-5" : "4",
		"1-5" : "4",
		"2-5" : "4",
		"负其他" : "4",
		
		"总0球" : "5",
		"总1球" : "5",
		"总2球" : "5",
		"总3球" : "5",
		"总4球" : "5",
		"总5球" : "5",
		"总6球" : "5",
		"总>6球" : "5",
		
		"胜/胜" : "6",
		"胜/平" : "6",
		"胜/负" : "6",
		"平/胜" : "6",
		"平/平" : "6",
		"平/负" : "6",
		"负/胜" : "6",
		"负/平" : "6",
		"负/负" : "6"
	};

function valueToType(value){
	var zc_index = zc_[value];
	if(zc_index < 2){
		return zc_index;
	}else if(zc_index < 5){
		return 2;
	}else{
		return zc_index - 2;
	}
	
}


var lc_ = {
		"主胜" : "0",
		"主负" : "0",
		
		"主胜(让)" : "1",
		"主负(让)" : "1",

		"大分" : "2",
		"小分" : "2",
		
		"主胜1-5" : "3",
		"主胜6-10" : "3",
		"主胜11-15" : "3",
		"主胜16-20" : "3",
		"主胜21-25" : "3",
		"主胜26+" : "3",
		
		"客胜1-5" : "4",
		"客胜6-10" : "4",
		"客胜11-15" : "4",
		"客胜16-20" : "4",
		"客胜21-25" : "4",
		"客胜26+" : "4"
	};

function valueToTypeLq(value){
	var lc_index = lc_[value];
	if(lc_index < 3){
		return lc_index;
	}else{
		return 3;
	}
	
}

function arrayToDouble(sjArr){
	var sjArr_ = Array();
	$(sjArr).each(function(index, item){
		sjArr_.push(item.length);
	});
	return sjArr_;
	
}

function getMaxPl(plArr){
	var plArr_ = Array();
	$(plArr).each(function(index, item){
		plArr_.push(0);
		$(item).each(function(index2, item2){
			if(plArr_[index] < item2){
				plArr_[index] = item2;
			}
		});
	});
	
	return plArr_;
	
}

                                                                                                                                                                                                                                                                                                                                                                  
/*function arrayToDouble(sjArr){
	var sjArr_ = Array();
	$(sjArr).each(function(index, item){
		
		sjArr_.push([0, 0, 0, 0, 0, 0]);
		
		$(item).each(function(index2, item2){
			sjArr_[index][5]++;
			var zc_index = zc_[item2];
			if(zc_index < 2){
				sjArr_[index][zc_index]++;
			}else if(zc_index < 5){
				sjArr_[index][2]++;
			}else{
				sjArr_[index][zc_index-2]++;
			}
		});
	});
	
	return sjArr_;
	
}*/

function getCounts(){
	
	for(var i=0;i<branch.length;i++){
		var base = this.getBaseNumber(branch[i]);
		var combinations = this.getAvailabelCombinations(clist,base);
		for(var k=0;k<combinations.length;k++){
			var branchBetCount = 1;
			var available = combinations[k];
			for(var j=0;j<available.length;j++){
				var data = available[j];
				branchBetCount *= data.elements.length;
			}
			result += branchBetCount;
		}
	}
	
}

/*
 * 求组合C(n,r)
 */
function getCombinationCount(n, r){
	if(r > n) return 0;
	if(r < 0 || n < 0) return 0;
	return Math.floor(this.getFactorial(n) / (this.getFactorial(r) * this.getFactorial(n - r)));
}

/*
 * 求n的阶乘
 */
function getFactorial(n){
	var result = 1;
    for(var i = 1; i <= n; i++) {
        result = result * i;
    }
    return result;
	
}


function showZs(wfArr, sjArr, plArr, dtArray){
	zsArr = [];
	var sjArr_ = arrayToDouble(sjArr);
	var plArr_ = getMaxPl(plArr);
	var zs = 0;
	var max_money = 0.00;
	
	$(wfArr).each(function(index, wf){
		$(gd__[wf]).each(function(index2, r){
			var arr_ = CombinationTools.combination(sjArr_, plArr_, r);
			if(arr_.length > 0){
				$(arr_).each(function(index3, arr__){
					var fuhe = true;
					
					$(dtArray).each(function(index5, item5){
						if(item5 == 1 && arr__[2][index5] == 0){
							fuhe = false;
						}
					});
					
					if(fuhe){
						var this_counts = 1;
						var this_money = 1;
						zsArr.push(arr__[2]);
						$(arr__[0]).each(function(index4, r2){
							this_counts = this_counts * r2; 
						});
						
						$(arr__[1]).each(function(index4, r2){
							this_money = this_money * r2; 
						});
						zs = zs + this_counts;
						max_money = max_money + (this_money * 2);
					}
				});
			}
		});
	});
	
	zhushu = zs;
	zuigaojj = max_money;
	jiangjintourubi = zuigaojj / zhushu / 2;
	showZj();
}

function showHistoryZs(wfArr, sjArr, plArr_, dtArray){
	zsArr = [];
	var sjArr_ = arrayToDouble(sjArr);
	var zs = 0;
	var max_money = 0.00;
	
	$(wfArr).each(function(index, wf){
		$(gd__[wf]).each(function(index2, r){
			var arr_ = CombinationTools.combination(sjArr_, plArr_, r);
			if(arr_.length > 0){
				$(arr_).each(function(index3, arr__){
					var fuhe = true;
					
					$(dtArray).each(function(index5, item5){
						if(item5 == 1 && arr__[2][index5] == 0){
							fuhe = false;
						}
					});
					
					if(fuhe){
						var this_counts = 1;
						var this_money = 1;
						zsArr.push(arr__[2]);
						$(arr__[0]).each(function(index4, r2){
							this_counts = this_counts * r2; 
						});
						
						$(arr__[1]).each(function(index4, r2){
							this_money = this_money * r2; 
						});
						zs = zs + this_counts;
						max_money = max_money + (this_money * 2);
					}
				});
			}
		});
	});
	
	zhushu = zs;
	zuigaojj = max_money;
	jiangjintourubi = zuigaojj / zhushu / 2;
	showZj();
}

