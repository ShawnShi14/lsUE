<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
	<title>Loushang UI库</title>
	
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
	    <![endif]-->
</head>
<body>
	<!-- 页面结构 -->
	<header class="navbar navbar-fixed-top navbar-bg">
		<div class="container">
			<div class="navbar-header">
				<a href="" class="navbar-brand">Loushang UI库</a>
			</div>
			<div class="collapse navbar-collapse">
				<div class="nav-bar navbar-nav navbar-right">
					<a class="btn ue-btn-primary pull-left" id="download" href="http://ue.inspur.com/ue.zip">下载源码</a>
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
	<div class="component-banner">
		<div class="jumbotron">
			<h2>UI组件库、典型模板库</h2>
			<p>没有最好的，只有最适合的</p>
		</div>
	</div>
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
			<div class="col-md-10">
				<div class="row" id="comc"></div>
			</div>
			<div class="col-md-2">
				<div class="input-group">
           			<input id="comName" class="form-control ue-form" type="text" placeholder="请输入组件名称"/>
           			<div id="namesearch" class="input-group-addon ue-form-btn">
           				<span class="fa fa-search"></span>
          			</div>
        		</div>
        		<div id="rc">
					<ul class="list-group">
						<li class="recommend" onClick="getComsOrderByCreateTime()"><i class="fa fa-flag"></i> <span>最新发布</span></li>
						<li class="recommend" onClick="getComsOrderByViewCounts()"><i class="fa fa-eye"></i> <span>最多浏览</span></li>
						<li class="recommend" onClick="getComsOrderByCommentCounts()"><i class="fa fa-comments-o"></i> <span>最多评价</span></li>
						<li class="recommend" onClick="getComsOrderByDownloadCounts()"><i class="fa fa-arrow-circle-o-down"></i> <span>最多下载</span></li>
					</ul>
				</div>
			</div> 
		</div>
	</div>
	<!-- 需要引用的JS -->
	<script type="text/javascript" src="dist/js/jquery.js"></script>
	<script type="text/javascript" src="dist/js/bootstrap.js"></script>
	<script type="text/javascript" src="dist/js/form.js"></script>
	<script type="text/javascript" src="dist/js/arttemplate.js"></script>
	<script type="text/javascript" src="dist/js/ui.js"></script>
	<script type="text/javascript" src="portal/portal.js"></script>
	<script type="text/html" id="component">
{{ each components as component i }}
	<div class="col-md-3 col-sm-4 component-item">
        <div class="component">
            <div class="link">
               <a href="ui.jsp?comId={{component.id}}" target="_blank"><img src="demo/{{component.id}}/thumbnail.jpg"></a>
            </div>
            <article>
            	<a href="ui.jsp?comId={{component.id}}" target="_blank">
                	{{component.name}}
                </a>
                <small>{{component.description}}</small>
            </article>
        </div>
    </div>
{{/each}}
</script>

<!-- 一级分类菜单模板 -->
<script type="text/html" id="comtype">
{{each comtypes as comtype i }}
	<li id={{comtype.id}} class="sign"><a>{{comtype.name}}<i class="fa fa-angle-down"></i></a>
	</li>
{{/each}}
</script>

<!-- 二级分类菜单模板 -->
<script type="text/html" id="typesub">
  <ul>
  {{each typesubs as typesub i }}
     <li id={{typesub.id}}><a><i class="fa fa-th-large"></i>{{typesub.name}}</li></a>
  {{/each}}
 </ul>
</script>
	<script type="text/javascript">
		var context = "<%=request.getContextPath()%>";
		var tId="";
	    $(document).ready(function() {
	    	//初始所有组件，判断是否有从ui.jsp接收typeId
		    var typeId = '<%=request.getParameter("typeId")%>';
		    if(typeId == "null"){
		    	//初始所有组件 
			 	getAllComs();
		    }
		    else {
		    	//根据组件类别分类查询
		    	 getComsByTypeId(typeId);
		    }	
		    
		    //根据组件类别分类查询
			$(".list-types").on("click","li",function() {
				var typeId = $(this).attr("id");
				tId = typeId;
				getComsByTypeId(typeId);
			});
	    	 		
		    //根据组件名称模糊查询，按钮
	 		$("#namesearch").on("click",function() {
	 			 getComsByName();
			});
				    	
			//根据组件名称模糊查询，搜索框回车事件
			$("#comName").keydown(function(event) {
				if(event.keyCode == 13)
				{
					getComsByName();
			   	}
			});
	    });
	</script>
</body>
</html>