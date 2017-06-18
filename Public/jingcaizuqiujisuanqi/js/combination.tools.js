var CombinationTools = new Object();

/*
 * 求组合C(n,r)
 */
CombinationTools.getCombinationCount = function(n, r){
	if(r > n) return 0;
	if(r < 0 || n < 0) return 0;
	return Math.floor(this.getFactorial(n)/(this.getFactorial(r) * this.getFactorial(n-r)));
}

/*
 * 求n的阶乘
 */
CombinationTools.getFactorial = function(n){
	var result = 1;
    for(var i = 1; i <= n; i++) {
        result = result*i;
    }
    return result;
	
}

/**
 * 
 *  组合算法
* 本程序的思路是开一个数组，其下标表示1到m个数，数组元素的值为1表示其下标
* 代表的数被选中，为0则没选中。
* 首先初始化，将数组前n个元素置 1，表示第一个组合为前n个数。
* 然后从左到右扫描数组元素值的“10”组合，找到第一个“10”组合后将其变为
* “01”组合，同时将其左边的所有“1”全部移动到数组的最左端。
* 当第一个“1”移动到数组的m-n的位置，即n个“1”全部移动到最右端时，就得
* 到了最后一个组合。
* 例如求5中选3的组合：
* 1 1 1 0 0 //1,2,3
* 1 1 0 1 0 //1,2,4
* 1 0 1 1 0 //1,3,4
* 0 1 1 1 0 //2,3,4
* 1 1 0 0 1 //1,2,5
* 1 0 1 0 1 //1,3,5
 *0 1 1 0 1 //2,3,5
* 1 0 0 1 1 //1,4,5
* 0 1 0 1 1 //2,4,5
* 0 0 1 1 1 //3,4,5
 * 从n个数字中选择m个数字
 * 
 * @param a
 * @param m
 * @return 可能返回null, 当m大于a.length的时候
 */
CombinationTools.combination = function(a, b, m){
	var n = a.length;
	if (m > n) {
		return null;
	}
	
	// 计算组合个数
	var size = this.getCombinationCount(n, m);
	var result = new Array();
	if (m == n) {
		var arr = Array();
		arr.push(a);
		arr.push(b);
		arr.push(a);
		result.push(arr);
		return result;
	}
	var bs = new Array();
	for (var i = 0; i < n; i++) {
		bs[i] = 0;
	}
	
	// 初始化
	for (var i = 0; i < m; i++) {
		bs[i] = 1;
	}
	
	var flag = true;
	var tempFlag = false;
	var pos = 0;
	var sum = 0;
	// 首先找到第一个10组合，然后变成01，同时将左边所有的1移动到数组的最左边
	do {
		sum = 0;
		pos = 0;
		tempFlag = true;
		result.push(this.output(bs, a, b, m));

		for (var i = 0; i < n - 1; i++) {
			if (bs[i] == 1 && bs[i + 1] == 0) {
				bs[i] = 0;
				bs[i + 1] = 1;
				pos = i;
				break;
			}
		}
		// 将左边的1全部移动到数组的最左边

		for (var i = 0; i < pos; i++) {
			if (bs[i] == 1) {
				sum++;
			}
		}
		for (var i = 0; i < pos; i++) {
			if (i < sum) {
				bs[i] = 1;
			} else {
				bs[i] = 0;
			}
		}

		// 检查是否所有的1都移动到了最右边
		for (var i = n - m; i < n; i++) {
			if (bs[i] == 0) {
				tempFlag = false;
				break;
			}
		}
		if (tempFlag == false) {
			flag = true;
		} else {
			flag = false;
		}

	} while (flag);
	result.push(this.output(bs, a, b, m));
	
	return result;
}


CombinationTools.output = function(bs, a, b, m) {
	
	var result = new Array();
	var result1 = new Array();
	var result2 = new Array();
	var bs2 = new Array();
	for (var i = 0; i < bs.length; i++) {
		bs2.push(bs[i]);
		if (bs[i] == 1) {
			result1.push(a[i]);
			result2.push(b[i]);
		}
	}
	
	result.push(result1);
	result.push(result2);
	result.push(bs2);
	return result;
}