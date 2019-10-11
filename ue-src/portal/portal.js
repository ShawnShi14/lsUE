$(document).ready(function() {
	//登录操作 
	var stoName = $.cookie("userName");
	if(stoName != null) {
		$(".login").html(stoName);
		$("#quit").click(function() {
		     $.removeCookie("userName");
		     $(".dropdown-menu").hide();
		     $(".login").html("登录");
		     window.location.reload(true);
		});
	} else {
	    $(".dropdown-menu").hide();
	    $(".login").bind("click",function() {
	    	initLogin();
	    });
	}
	
	//初始分类菜单 
	getTopType();
	
	$('.component-menu > ul').on("mouseenter", "li.sign", function() {
		var current = $(this);
		getSubType(current);
	});

	//下载前先判断有没有登录
	$("#download").bind("click", function() {
		if(stoName !=null) {
			$("#download").attr("href","http://10.110.13.83:8080/ue/ue.zip");
		} else {
			sticky();
		}
	});
	
});

//获取一级分类菜单
function getTopType(){
	$.ajax({
	    url: context+"/service/comtype/getTopType",
 	    type: "GET",
 	    dataType:"json",
 	    success: function(dataobj) {
 	    	var temps = template("comtype", {
 	    		comtypes :  dataobj.data
 	    	});
  	    	$("#comt").empty().prepend(temps);
 	    },
 	    error: function() {
       }
   });
};	

//获取二级分类菜单
function getSubType(that){
	var typ_timer;
	clearTimeout(typ_timer); 
	var parentId = that.attr("id")
	if(that.find("li").length == 0){
		$.ajax({
			url: context+"/service/comtype/getSubType?parentId="+parentId,
			type: "GET",
			dataType:"json",
			success: function(dataobj) {
				var temp = template("typesub", {
					typesubs :  dataobj.data
				});
				$("#"+parentId).prepend(temp);
				$('.list-types > ul').html($("#"+parentId).find("ul").html());
			},
			error : function() {
			}    
		});
	} 
	else {
		$('.list-types > ul').html(that.find("ul").html());
	}
	
	//判断一级导航li是否有子导航，有则显示list-types
	$('.component-menu').on("mouseenter","ul li",function(){
		var typ_timer;
		var current_typ;
		$(this).addClass("on").siblings().removeClass("on");
		clearTimeout(typ_timer);
		var idstr = $(this).attr("id");
		if(typeof(idstr) == "undefined")
		{
			$(".list-types").hide();
		}
		else
		{
			$('.list-types').show();
		}	    	
	}).mouseleave(function(){
		current_typ = $(this).find("ul li");
		typ_timer = setTimeout(function(){
			$('.list-types').hide();
			current_typ.removeClass("on");
		},100);        
	});
	//二级导航鼠标移入移出处理
	$('.list-types').mouseenter(function(){
		clearTimeout(typ_timer);
		$(this).show();
	}).mouseleave(function(){
		$(this).hide();
		current_typ.removeClass("on");
	});
	
}; 

//初始化所有组件
function getAllComs() {
	$.ajax({
		url : context+"/service/com/getAllComs",
		type : "GET",
		dataType:"json",
		success : function(dataobj) {
			var temp = template("component", {
				components : dataobj.data
			});
			$("#comc").prepend(temp);
			
			//限制字符个数
			$("small").wordLimit(31);
		},
		error : function() {
		}
	});
}

//根据组件类别分类查询
function getComsByTypeId(id) {
	var typeId = id;
	$.ajax({
		url : context + "/service/com/ getComsByTypeId?typeId=" + typeId,
		type : "GET",
		dataType:"json",
		success : function(dataobj) {
			var temp = template("component", {
				components : dataobj.data
			});
			$("#comc").empty().append(temp);
			
			//限制字符个数
			$("small").wordLimit(31);
		},
		error : function() {
		}
	});
}

//模糊查询
function getComsByName() {
	var name = $("#comName").val();
	$.ajax({
		url : context+"/service/com/getComsByName",
		type : "POST",
		data: {
		  name: name
		},
		dataType:"json",
		success : function(dataobj) {    					
			var temp = template("component", {
				components : dataobj.data
			});
			$("#comc").children().remove();		
			if(temp != null && temp !="")
			{	
				$("#comc").prepend(temp);
				
				//限制字符个数
				$("small").wordLimit(31);
			}
			else
			{
				$("#comc").prepend("<div>抱歉，未查到相关组件！</div>");
			}
		},
		error : function() {
		}
	});			 
};

//根据最新发布推荐
function getComsOrderByCreateTime() {
	$.ajax({
		url: context+"/service/com/getComsOrderByCreateTime?typeId=" + tId,
		type: "GET",
		dataType: "json",
		success : function(dataobj) {
			var temp = template("component", {
				components : dataobj.data
			});
			$("#comc").empty().append(temp);
			$("small").wordLimit(31);
		},
		error : function() {
		}
	  });
}
  
//很据最多浏览次数推荐组件
function getComsOrderByViewCounts() {
	$.ajax({
		url: context+"/service/com/getComsOrderByViewCounts?typeId=" + tId,
		type: "GET",
		dataType: "json",
		success : function(dataobj) {
			var temp = template("component", {
				components : dataobj.data
			});
			$("#comc").empty().append(temp);
			$("small").wordLimit(31);
		},
		error : function() {
		}
	});
}
  
//更新浏览次数
function updateViewCount(comId) {
	$.ajax({
		type: 'POST',  
		url: context+"/service/com/updateViewCount",
		data: {
			"comId": comId
		}
	}); 
}

//组件分类情况下根据组件下载次数进行排序
function getComsOrderByDownloadCounts() {
	$.ajax({
		type: "GET",
		url: context + "/service/com/getComsOrderByDownloadCounts?typeId=" + tId,
		dataType: "json",
		success: function(dataobj) {
			var temp = template("component", {
				components : dataobj.data
			});
			$("#comc").empty().prepend(temp);
			//限制字符个数
			$("small").wordLimit(31);
		},
		error: function() {
		}
	});
}

//最多评论排序
function getComsOrderByCommentCounts() {
	$.ajax({
		url : context+"/service/com/getComsOrderByCommentCounts?typeId=" + tId,
		type : "GET",
		dataType:"json",
		success : function(dataobj) {
			var temp = template("component", {
				components : dataobj.data
			});
			$("#comc").prepend(temp);
			$("#comc").empty().prepend(temp);
			//限制字符个数
			$("small").wordLimit(31);
		},
		error : function() {		
		}
	});
}
  
//弹出提示框
function sticky() {
	$.sticky(
			"您还没有登录，请先登录", //提示框显示内容
			{
				style :'warning', //提示框种类
				autoclose : 2000, //提示框是否自动退出或者自动退出的快慢程度
				position :'bottom-right' //提示框定位：top, or bottom-right, center
	});
}

//弹出登录框
function initLogin(){
	$.dialog({
		type: "iframe",
		url: "login.jsp",
		title: "登录",
		width: 390,
		height: 266
	});
}

//初始明细页内容
function getComDetail(comId) {
	$.ajax({
		url: context+"/service/com/getComsByComponentId?comId=" + comId,
		type: "GET",
		success: function(data) {
			document.title = data.data.name;
			ko.applyBindings(data.data, document.getElementById("element-bind"));
			return;
		},
		error: function() {
		}
	});
}

//按照组件id查询并显示反馈信息
function getFeedBacksByComId(id) {
    var comId = id;
    $.ajax({
    	url: context+"/service/feedback/getFeedBacksByComId?comId="+comId,
   		type: "GET",
   		dataType:"json",
    	success: function(dataobj) {
 	    	var temps = template("feedback", {
 	    		feedbacks : dataobj.data
 	    	});
 	    	
 	    	//获得评论数
 	    	var counts = dataobj.data.length;
            
 	    	//显示
 			$("#counts").html("("+counts+")");
 		   	$("#feedbacklist").empty().prepend(temps);
 	    	
 		   	//获取评论
 	    	if(counts != 0)
 	    	{
 	            updateFeedBackCounts(comId,counts);	        
 	 	    	 	 	    	
 	  	    	//算出星级评分的平均分
 	 	    	var sum = 0;
 	 	    	for(var i = 0;i<counts;i++)
 	 	    	{
 	 	    		sum = sum + dataobj.data[i].score*1;
 	 	    		
 	    			//遍历<br>，实现回车换行
 	     			var returnbr = $(".content")[i].innerHTML;
 	     			var realbr = returnbr.replace(/&lt;br&gt;/g,"<br>").replace(/[＄]/g,"$").replace(/[％]/g,"%").replace(/[＃]/g,"#").replace(/[＆]/g,"&").replace(/[ ]/g,"　");
 	     			$(".content")[i].innerHTML = realbr;    			
 	 	    	}	
 	 	    	var avg = sum / counts;
 	 	    	$('.rateresult').empty().append("<p>"+ avg.toFixed(1) + "&nbsp;<span>分</span></p>");
 	    	}
 	    	else
 	    	{
 	 		   	$('.rateresult').empty().append("<p>0&nbsp;<span>分</span></p>");
 	    	}
    	},
    	error: function() {
    	}
    });
}

//添加组件反馈
function saveFeedBack(comId,userId) {
	var userId=userId;
	var score = $('#star').val();
    var content = $('textarea').val();
	content = content.replace(/\n|\r\n/g,"<br>").replace(/[$]/g,"＄").replace(/[%]/g,"％").replace(/[#]/g,"＃").replace(/[&]/g,"＆").replace(/[ ]/g,"　");
    if(score == "") {
    	$.dialog({
			type: 'alert',
		    content: '赏个分吧'
	    });
    	return false;
    }
    else if(content == "") {
    		$.dialog({
    			type: 'alert',
    		    content: '赏个评论吧'
    	    });
    	return false;
    }
	$.ajax({
		type: 'POST',  
	    url: context+"/service/feedback/saveFeedBack", 
	    data: {
	    	"score": score,
	    	"content": content,
	    	"comId": comId,
	    	"userId": userId
	    },
	    success: function(data) {
	    	$('textarea').val("");
	        $('#star').val("");
			$(".ratestar").raty({
				path: 'dist/skin/img',
				click: function(score) {
					$("#star").val(score);
				}
			});
	        getFeedBacksByComId(comId);
	    },
	    error: function() {
	    }
	});
	return false;  
}

//统计评论数量
function updateFeedBackCounts(comId,count) {
	var comId = comId;
	var count = count;
	 $.ajax({
         type: 'POST',  
         url: context+"/service/com/updateFeedBackCounts",
         data: {
        	 "comId": comId,
        	 "count": count
         }
     });
}

//copyright c by zhangxinxu v1.0 2009-09-05
//http://www.zhangxinxu.com
/* $(".test1").wordLimit(); 自动获取css宽度进行处理，如果css中未对.test1给定宽度，则不起作用
$(".test2").wordLimit(24); 截取字符数，值为大于0的整数，这里表示class为test2的标签内字符数最多24个
*/

(function($){
	$.fn.wordLimit = function(num) {
		this.each(function(){	
			if(!num){
				var copyThis = $(this.cloneNode(true)).hide().css({
					'position': 'absolute',
					'width': 'auto',
					'overflow': 'visible'
				});	
				$(this).after(copyThis);
				if(copyThis.width()>$(this).width()){
					$(this).text($(this).text().substring(0,$(this).text().length-4));
					$(this).html($(this).html()+'...');
					copyThis.remove();
					$(this).wordLimit();
				}else{
					copyThis.remove(); //清除复制
					return;
				}	
			}else{
				var maxwidth=num;
				if($(this).text().length>maxwidth){
					$(this).text($(this).text().substring(0,maxwidth));
					$(this).html($(this).html()+'...');
				}
			}					 
		});
	}		  
})(jQuery);    