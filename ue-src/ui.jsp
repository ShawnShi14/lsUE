<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html lang="zh-CN">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title></title>

    <!-- 需要引用的CSS -->
    <link rel="shortcut icon" href="site.ico" />
	<link rel="stylesheet" type="text/css" href="dist/skin/css/bootstrap.css" />
	<link rel="stylesheet" type="text/css" href="dist/skin/css/font-awesome.css" />
	<link rel="stylesheet" type="text/css" href="dist/skin/css/ui.css" />
	<link rel="stylesheet" type="text/css" href="dist/skin/css/form.css" />
	<link rel="stylesheet" type="text/css" href="portal/portal.css" />
	
    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="http://cdn.bootcss.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="http://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
      <script type="text/javascript" src="dist/js/PIE.js"></script>
    <![endif]-->
    
  </head>
  <body>
	<!-- 页面结构 -->
	<header class="navbar navbar-static-top navbar-bg">
	  <div class="container">
	    <div class="navbar-header">
	      <a href="index.jsp" class="navbar-brand">Loushang UI组件库</a>
	    </div>
	   	<div class="collapse navbar-collapse">
			<div class="nav-bar navbar-nav navbar-right">
				<a class="btn ue-btn-primary" id="download" href="http://ue.inspur.com/ue.zip">下载源码</a>
				<div class="dropdown">
					<a class="dropdown-toggle" data-toggle="dropdown">
						<label class="btn login">登录</label>
					</a>
					<ul class="dropdown-menu ue-dropdown-menu">
						<li class="ue-dropdown-angle"></li>
						<li><a class="center">个人信息</a></li>
						<li><a class="center" id="quit">退出登录</a></li>
					</ul>
				</div>
			</div>
		</div>
	  </div>
	</header>
	<div class="component-menu-wrap">
		<div class="container component-menu" >
			<ul id="comt"></ul>
			<ul id="coma">
			    <%--<li><a href="changelog.html" target="_blank">Change Log</a></li>--%>
				<li><a href="ui-compatibility.html" target="_blank">兼容性</a></li>
				<li><a href="ui-codenorm.html" target="_blank">代码规范</a></li>
				<li><a href="http://jsonlint.com" target="_blank">JSON在线工具</a></li>
			</ul>
		</div>
	</div>
    <div class="container">
		<div class="row" style="position: relative;">
			<div class="list-types" style="display: none;">
				<ul>
					
				</ul>
			</div>
		<div class="row component-content" id="element-bind">
      	<div class="col-md-9 component-detail">
		    <div class="top-bann">
		      <h4 data-bind="text: name">
		      </h4>
		    </div>
		    <div class="con">
		      <img class="thumbile" data-bind="attr: {src: 'demo/'+id+'/thumbnail.jpg'}">
		      
		      <div class="browsers-shell">
		         <div class="browsers">
		        	 <img src="portal/images/browser.png"/>
		        	 <div style="display: inline-block;">
		               	<ul id="browsers-ul" data-bind="foreach: [11,10,9,8,7,6]">
		             		<img class="pull-left" src="portal/images/browser_ie.png" />
		                 	<li data-bind="attr: {'data-val': $data}, css: {'on': $data >= $parent.browserIe}">
		                     	<span data-bind="text: $data"></span><i></i>
		                 	</li>
		             	</ul>
		             </div>
		         </div>
		      </div>
			</div>
			<div class="comment comment-head">
				<p class="control-label">讨论下这个组件<span id="counts"></span>&nbsp;&nbsp;</p>
				<div class="rateresult"></div>					
			</div>
			<div id="feedbacklist"></div>
			<div class="comment">
				<div class="ratestar"></div>
				<input type="hidden" id="star" />
				<textarea class="form-control" rows=8 maxlength="1000"></textarea>
				<div class="bt">
					<button type="button" id="ue_release" class="btn ue-btn-primary">发表评论</button>
				</div>
			</div>
		</div>
  		<div class="col-md-3">
  			<div class="component-info">
  				<div class="inner">
			      <div class="author-info">
			        <a><img class="tx ue-pie" src="portal/images/user-avatar.jpg"></a>
			        <a class="author" data-bind="text: userId"></a>
			      </div>
			    </div>
			    <div class="opers-choose clearfix">
		      		<a class="choose-view" data-bind="attr: {href: 'demo/'+id+'/index'+ '.'+suffix }" target="_blank">
		      			<i class="fa fa-eye"></i>
		      			<span>查看演示</span>
		      		</a>
		      		<!-- ko if: website!=null -->
		      		<a class="choose-download" data-bind="attr:{href: website}"  target="_blank">
		      			<i class="fa fa-globe"></i>
		      			<span>查看官网</span>
		      		</a>
		      		<!-- /ko -->
		      		<!-- <a class="choose-web" href="#">
		      			<i class="fa fa-download"></i> 
		      			<span>立即下载</span>
		      		</a> -->
			    </div>
  			</div>
		   <!--  <a class="component-upload" href="upload.html" target="_blank">
	        	<i class="fa fa-upload"></i>
	       		<span>发布资源</span>
	        </a> -->
	    </div>
	   </div>
		</div>
	</div>
    
    <!-- 需要引用的JS -->
    <script type="text/javascript" src="dist/js/jquery.js"></script>
	<script type="text/javascript" src="dist/js/bootstrap.js"></script>
	<script type="text/javascript" src="dist/js/knockout.js"></script>
	<script type="text/javascript" src="dist/js/arttemplate.js"></script>
	<script type="text/javascript" src="dist/js/ui.js"></script>
	<script type="text/javascript" src="dist/js/form.js"></script>
	<script type="text/javascript" src="portal/portal.js"></script>
    
    <!-- 一级分类菜单模板 --> 
    <script type="text/html" id="comtype">
    {{each comtypes as comtype i }}
    	<li id={{comtype.id}} class="sign"><a>{{comtype.name}}<i class="fa fa-angle-down"></i></a>
    		<ul>
    		</ul>
    	</li>
    {{/each}}
    </script>

    <!-- 二级导分类菜单模板 -->
	<script type="text/html" id="typesub">
  	<ul>
  	{{each typesubs as typesub i }}
      <li id={{typesub.id}}><a><i class="fa fa-th-large"></i>{{typesub.name}}</li></a>
  	{{/each}}
 	</ul>
	</script>

	<!-- 评论列表模板 -->
	<script type="text/html" id="feedback">
	<ul class="ue-list indent">
  		{{each feedbacks as feedback i }}
			<li>
				<span><strong>{{feedback.userId}}：</strong></span>
				<span class="pull-right">{{feedback.createTime}}</span>
				<br><br>
				<div class="content">{{feedback.content}}</div> <br> 
			</li> 
  		{{/each}}
	</ul>
	</script>

    <script type="text/javascript">
    var context = "<%=request.getContextPath()%>";  
    $(document).ready(function() {
        // 获取请求参数
        var url = window.location.href;
        var comId = url.substring(url.indexOf("=") + 1);
		var userId = "ue";
		
        // ajax请求数据
        getComDetail(comId);
		 
	    //根据组件类别分类查询
	    $(".list-types").on("click","li",function() {
	    	var typeId = $(this).attr("id");
	    	window.location.href = context+"/index.jsp?typeId=" + typeId;//跳转到index.jsp页面 
	    }); 
	    	 
	    //按照组件id初始化评论列表
		getFeedBacksByComId(comId);
	    
		 //更新浏览次数，加载完一次页面算更新一次记录 
        updateViewCount(comId); 
		
	    //按星级评分
	    $(".ratestar").raty({
			path: 'dist/skin/img',
			click: function(score) {
			    $("#star").val(score);
			}
		});
	    
      //提交反馈数据  
      $('#ue_release').on('click', function() {
    	  var stoName = $.cookie("userName");
    	  if (stoName != null) {
    		  $(".login").html(stoName);
    		  saveFeedBack(comId,userId);
    	  }else {
    		  //弹出提示 
    		  sticky();
    	    }
       });
	});
     
    </script>
  </body>
</html>