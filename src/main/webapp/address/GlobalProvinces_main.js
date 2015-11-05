/**
 * 用户地区控制
 */

/* module object */
function GlobalProvincesModule ()
{
	this.debug = false;
	this.def_province = ["--", ""];
	this.def_city1 = ["--", ""];
	this.def_city2 = ["--", ""];
	this.def_city3 = ["--", ""];

	this.initProvince = function (obj1)
	{
		try{
			var i;
			for(i = obj1.options.length -1; i >= 0 ; i--)
			{
				removeOptionItem(obj1, i);
			}

			if(this.def_province)
				obj1.options.add(new Option(this.def_province[0], this.def_province[1]));

			if(!GP) return;

			for(i=0; i < GP.length; i++)
			{
				obj1.options.add(new Option(GP[i], GP[i]));
			}
		}catch(e){if(this.debug) alert("执行方法\"initProvince\"时，遇到" + e.message);}
	}

	this.initCity1 = function (obj1, key)
	{
		try{
			var i;
			for(i = obj1.options.length -1; i >= 0 ; i--)
			{
				this.removeOptionItem(obj1, i);
			}

			if(this.def_city1)
				obj1.options.add(new Option(this.def_city1[0], this.def_city1[1]));

			if(!GC1[key]) return;

			for(i=0; i < GC1[key].length; i++)
			{
				obj1.options.add(new Option(GC1[key][i], GC1[key][i]));
			}
		}catch(e){if(this.debug) alert("执行方法\"initCity1\"时，遇到" + e.message);}
	}

	this.initCity2 = function (obj1, key, key2)
	{
		try{
			var i;
			for(i = obj1.options.length -1; i >= 0 ; i--)
			{
				this.removeOptionItem(obj1, i);
			}

			if(this.def_city2)
				obj1.options.add(new Option(this.def_city2[0], this.def_city2[1]));

			if(!GC2[key]) return;
			if(!GC2[key][key2])
			{
				obj1.options[0].selected = true;
			}else{
				var equal_second_location = "";
				for(i=0; i < GC2[key][key2].length; i++)
				{
					if (GC2[key][key2][i] == key2 + "市") {
						equal_second_location = GC2[key][key2][i];
					} else {
						obj1.options.add(new Option(GC2[key][key2][i], GC2[key][key2][i]));
					}
				}
				if (equal_second_location != "") {
					obj1.options.add(new Option(equal_second_location, equal_second_location));
				}
				obj1.options.add(new Option("其他", "其他"));

				if(GC2[key][key2].length == 1)
					obj1.options[GC2[key][key2].length - 1].selected = true;
			}

		}catch(e){if(this.debug) alert("执行方法\"initCity2\"时，遇到" + e.message);}
	}

	this.initCity3 = function (obj1, key, key2, key3)
	{
		try{
			var i;
			for(i = obj1.options.length -1; i >= 0 ; i--)
			{
				this.removeOptionItem(obj1, i);
			}

			if(this.def_city3)
				obj1.options.add(new Option(this.def_city3[0], this.def_city3[1]));

			if(!GC3[key][key2] || !GC3[key][key2][key3])
			{
				obj1.options[obj1.options.length - 1].selected = true;
			}else{
				var count = 0;
				for(i=0; i < GC3[key][key2][key3].length; i++)
				{
					obj1.options.add(new Option(GC3[key][key2][key3][i], GC3[key][key2][key3][i]));
					count++;
				}
				if (count > 0) {
					obj1.options.add(new Option("其他", "其他"));
				}

				if(GC3[key][key2][key3].length == 1)
					obj1.options[GC3[key][key2][key3].length - 1].selected = true;
			}

		}catch(e){if(this.debug) alert("执行方法\"initCity2\"时，遇到" + e.message);}
	}

	this.selectProvincesItem = function (obj1, value)
	{
		try{
			var ret = false;
			for(var i = 0; i < obj1.options.length; i++)
			{
				if(obj1.options[i].text == value)
				{
					ret = obj1.options[i].selected = true;
					break;
				}
			}
			return ret;
		}catch(e){if(this.debug) alert("执行方法\"selectProvincesItem\"时，遇到" + e.message);}
	}

	this.selectCity1Item = function (obj1, value)
	{
		try{
			var ret = false;
			for(var i = 0; i < obj1.options.length; i++)
			{
				if(obj1.options[i].text == value)
				{
					ret = obj1.options[i].selected = true;
					break;
				}
			}
			return ret;
		}catch(e){if(this.debug) alert("执行方法\"selectCity1Item\"时，遇到" + e.message);}
	}

	this.selectCity2Item = function (obj1, value)
	{
		try{
			var ret = false;
			for(var i = 0; i < obj1.options.length; i++)
			{
				if(obj1.options[i].text == value)
				{
					ret = obj1.options[i].selected = true;
					break;
				}
			}
			return ret;
		}catch(e){if(this.debug) alert("执行方法\"selectCity2Item\"时，遇到" + e.message);}
	}

	this.getSelValue = function (obj1)
	{
		if(obj1 && obj1.options && obj1.options.length > 0)
			return obj1.options[obj1.selectedIndex].value;
		else
			return null;
	}

	this.getProvinceNameById = function (id)
	{
		try{
			var ret = "";
			for(var i = 0; i< GP.length; i++)
			{
				if(GP[i][1] == id)
				{
					ret = GP[i];
					break;
				}
			}

			return ret;
		}catch(e){if(this.debug) alert("执行方法\"getProvinceNameById\"时，遇到" + e.message);}
	}

	this.getProvinceIdByName = function (name)
	{
		try{
			var ret = -1;
			for(var i = 0; i< GP.length; i++)
			{
				if(GP[i] == name)
				{
					ret = GP[i][1];
					break;
				}
			}

			return ret;
		}catch(e){if(this.debug) alert("执行方法\"getProvinceIdByName\"时，遇到" + e.message);}
	}

	this.removeOptionItem = function(obj, index)
	{
		if(typeof obj.options.remove == "undefined")
		{
			obj.remove(index);
		}else{
			obj.options.remove(index);
		}
	}
}
