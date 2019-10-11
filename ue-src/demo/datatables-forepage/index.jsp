<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>datatables-前端分页</title>
	
	<!-- 需要引用的CSS -->
	<link rel="shortcut icon" href="../../site.ico" />
	<link rel="stylesheet" type="text/css" href="../../dist/skin/css/bootstrap.css" />
	<link rel="stylesheet" type="text/css" href="../../dist/skin/css/font-awesome.css" />
	<link rel="stylesheet" type="text/css" href="../../dist/skin/css/ui.css" />
	<link rel="stylesheet" type="text/css" href="../../dist/skin/css/form.css" />
	<link rel="stylesheet" type="text/css" href="../../dist/skin/css/datatables.css" />
	<link rel="stylesheet" type="text/css" href="datatables.css" />
	<link rel="stylesheet" type="text/css" href="../prettify.css"/>
	<style type="text/css">
	.popover {
		max-width: 800px;
	}
	.popover-content-left {
		width: 280px;
	}
	.popover-content-right {
		width: 366px;
		width: 420px\9;
	}
	label {
	    display: inline\9;
	}
	</style>
	
	<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="http://cdn.bootcss.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="http://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>
	 <br /> 
	 <br />
	<div class="container">
		<div class="col-xs-12 col-md-12">		   
			<div class="row">
				<form class="form-inline">										
					<div class="input-group">
				        <input class="form-control ue-form" type="text" id="userName" placeholder="请输入用户名称"/>
				        <div class="input-group-addon ue-form-btn" id="query">
				        	<span class="fa fa-search"></span>
				        </div>
			     	</div>
				    <a class="btn ue-btn-noborder" id="moresearch">精简搜索<i class="fa fa-angle-down"></i></a>
				    <div class="btn-group pull-right">
						<button id="add" type="button" class="btn ue-btn ">
							<span class="fa fa-plus"></span>新增
						</button>
						<div class="btn-group">
							<button type="button" class="btn ue-btn dropdown-toggle"
							data-toggle="dropdown">
							更多<span class="fa fa-caret-down"></span>
							</button>
								<ul class="dropdown-menu ue-dropdown-menu dropdown-menu-right ">
								<li><a><span class="fa fa-cog"></span>查看</a></li>
								<li><a id="modify"><span class="fa fa-pencil"></span>编辑</a></li>
								<li><a id="del"><span class="fa fa-minus"></span>删除</a></li>
							</ul>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>

	<div class="container">
		<table id="userList" class="table table-bordered table-hover">
			<thead>
				<tr>
					<th rowspan="2" width="10%" data-field="userId" data-sortable= "false" data-render="rendercheckbox">
						<input type="checkbox" id="selectAll"/>
					</th>
					<th rowspan="2" width="18%" data-field="userId" data-sortable="false">账号</th>
					<th colspan="2" width="36%">基础信息</th>
					<th rowspan="2" width="18%" data-field="status" data-render="renderstatus">账号状态</th>
					<th rowspan="2" width="18%" data-field="userId" data-render="renderoptions">操作</th>
				</tr>
				<tr>
					<th width="18%" data-field="userName">姓名</th>
					<th width="18%" data-field="nickname">昵称</th>
				</tr>
			</thead>
		</table>
	</div>
	<!-- 代码高亮 -->
     <div class="container">
		<ul id="myTab" class="nav nav-tabs ue-tabs">
			<li class="active"><a href="#html" data-toggle="tab">HTML</a></li>
		</ul>
		<div id="myTabContent" class="tab-content" style="padding-top:20px">
			<div class="tab-pane active" id="html">
				<pre>
<div class="col-xs-12 col-md-12">          
    <div class="row">
        <form class="form-inline">                                       
            <div class="input-group">
                <input class="form-control ue-form" type="text" id="userName" placeholder="请输入用户名称"/>
                <div class="input-group-addon ue-form-btn" id="query">
                    <span class="fa fa-search"></span>
                </div>
            </div>
            <a class="btn ue-btn-noborder" id="moresearch">精简搜索<i class="fa fa-angle-down"></i></a>
            <div class="btn-group pull-right">
                <button id="add" type="button" class="btn ue-btn ">
                    <span class="fa fa-plus"></span>新增
                </button>
                <div class="btn-group">
                    <button type="button" class="btn ue-btn dropdown-toggle" data-toggle="dropdown">
                                                          更多<span class="fa fa-caret-down"></span>
                    </button>
                    <ul class="dropdown-menu ue-dropdown-menu dropdown-menu-right ">
                        <li><a><span class="fa fa-cog"></span>查看</a></li>
                        <li><a id="modify"><span class="fa fa-pencil"></span>编辑</a></li>
                        <li><a id="del"><span class="fa fa-minus"></span>删除</a></li>
                    </ul>
                </div>
           </div>
      </form>
   </div>
</div>
				</pre>
				<pre>
<table id="userList" class="table table-bordered table-hover">
    <thead>
        <tr>
            <th width="10%" data-field="userId" data-sortable= "false" data-render="rendercheckbox">
                <input type="checkbox" id="selectAll"/>
            </th>
            <th width="18%" data-field="userId" data-sortable="false">账号</th>
            <th width="18%" data-field="userName">姓名</th>
            <th width="18%" data-field="nickname">昵称</th>
            <th width="18%" data-field="status" data-render="renderstatus">账号状态</th>
            <th width="18%" data-field="userId" data-render="renderoptions">操作</th>
        </tr>
    </thead>
</table>
				</pre>
				
				<pre>
$(document).ready(function() {
    //初始化datatable
    var options = {"Serverside": false,"orderCellsTop": true};
    var url = context+"/service/user/data";
    grid = new L.FlexGrid("userList",url); 
    grid.init(options); //初始化datatable
    //增加
    $("#add").bind("click", function() {
        alert("跳转到增加页面");
    });
    // 编辑
    $(".modify").bind("click",function() {
        var data = grid.oTable.row($(this).parents("tr")).data();
        modify(data);
    });
    //更多搜索框的调用
    $("#moresearch").morequery({
        "title":"",
        "content": template('mypopover',{})
    });
    $("#moresearch").on("click",function(){
        $('#startDay').datetimepicker({
            container: $("#start"),
			language: "zh-CN",
			autoclose: 1,
			startView: 2,
			minView: 2,
			format: "yyyy-mm-dd"
		});
		$('#endDay').datetimepicker({
			container: $("#end"),
			language: "zh-CN",
			autoclose: 1,
			startView: 2,
			minView: 2,
			format: "yyyy-mm-dd"
		});
    });
    // 删除
    $(document).on("click",".del",function() {
        var recordIds = grid.oTable.row($(this).parents("tr")).data().userId;
        var resetPaging = false;
        grid.reload(null, null, resetPaging);
    });
    //条件查询
    $("#query").bind("click", function() {
        var userName = $("#userName").val();
        var param = {userName: userName};
        var url = context + "/service/user/data";
        grid.reload(url, param);
    }); 
});

function rendercheckbox(data, type, full) {
    return '<input type="checkbox" value="' + data + '" id="checkbox" name="checkboxlist"/>';
};
function renderoptions(data, type, full) {
    return '<div class="btn-group pull-center"><button type="button" class="btn btn-xs ue-btn del" style="margin-left:5px;margin-bottom:3px"><span class="fa fa-trash"></span>删除</button><button  type="button"  class="btn btn-xs ue-btn modify" style="margin-bottom:3px"><span class="fa fa-cog"></span>编辑</button></div>'
}
function renderstatus(data,type,full){
    switch (data)
    {
        case "N":
            data = "启用";
            break;
       case "X":
            data = "停用";
            break;
    }
    return data;
}
//修改当前记录 
function modify(data){
    var recordIds = data.userId;
    alert("修改用户ID"+recordIds);
}
				</pre>
			</div>
		</div>
		<br/>
		<p style="line-height:25px">需要引用的css文件：</p>
		<p><code>bootstrap.css</code>，<code>form.css</code>，<code>ui.css</code>，<code>font-awesome</code>，<code>datatables.css</code></p>
		<p style="line-height:25px">需要引用的js文件：</p>
		<p><code>bootstrap.js</code>，<code>jquery.js</code>，<code>loushang-framework.js</code>，<code>arttemplate.js</code>，<code>form.js</code>，<code>datatables.js</code></p>，<code>ui.js</code>
		<h3>说明</h3>
		<p style="line-height:25px">在下拉框中如果想同时选择多个选项的时候，可以设置<code>multiple</code>属性，
				还可以把 <code>multiple</code> 属性与<code>size</code>属性配合使用，来定义可见选项的数目。</p>
		<br/>
		<h3>features</h3>
		<table class="table table-bordered">
			<thead>
				<tr>
					<th>名称</th>
					<th>类型</th>
					<th>默认值</th>		
					<th>说明</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>serverSide</td>
					<td>boolean</td>
					<td>true</td>
					<td>是否开启服务器模式</td>
				</tr>
				<tr>
					<td>ordering</td>
					<td>boolean</td>
					<td>true</td>
					<td>是否允许Datatables开启排序</td>
				</tr>
				<tr>
					<td>processing</td>
					<td>boolean</td>
					<td>true</td>
					<td>是否显示处理状态(排序的时候，数据很多耗费时间长的话，也会显示这个)</td>
				</tr>
				<tr>
					<td>searching</td>
					<td>boolean</td>
					<td>false</td>
					<td>是否允许Datatables开启本地搜索</td>
				</tr>
				<tr>
					<td>pagingType</td>
					<td>String</td>
					<td>"full_numbers"</td>
					<td>分页按钮的显示方式</td>
				</tr>
				<tr>
					<td>dom</td>
					<td>String</td>
					<td>'<"H"r>t<"F"ipl><"clearfix">'</td>
					<td>定义DataTables的组件元素的显示和显示顺序</td>
				</tr>
				<tr>
					<td>order</td>
					<td>Array</td>
					<td>null</td>
					<td>表格在初始化的时候的排序</td>
				</tr>
			</tbody>
		</table>
		<br/>
		<h3>参数</h3>
		<table class="table table-bordered">
			<thead>
				<tr>
					<th>名称</th>
					<th>类型</th>
					<th>默认值</th>		
					<th>说明</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>language.processing</td>
					<td>String</td>
					<td>"查询中..."</td>
					<td>当table处理用户处理信息时，显示的信息字符串</td>
				</tr>
				<tr>
					<td>language.lengthMenu</td>
					<td>String</td>
					<td>" _MENU_ "</td>
					<td>'每页显示记录'的下拉框的提示信息</td>
				</tr>
				<tr>
					<td>language.loadingRecords</td>
					<td>String</td>
					<td>"加载中..."</td>
					<td>加载数据时的提示信息 - 当 Ajax请求数据时显示</td>
				</tr>
				<tr>
					<td>language.zeroRecords</td>
					<td>String</td>
					<td>"未查询到记录"</td>
					<td>当搜索结果为空时，显示的信息</td>
				</tr>
				<tr>
					<td>language.info</td>
					<td>String</td>
					<td>"显示 _START_ 到 _END_ 条 共 _TOTAL_ 条记录"</td>
					<td>表格的page分页所需显示的所有字符串</td>
				</tr>
				<tr>
					<td>language.infoEmpty</td>
					<td>String</td>
					<td>null</td>
					<td>当表格没有数据时，汇总地方显示的字符串</td>
				</tr>
				<tr>
					<td>language.emptyTable</td>
					<td>String</td>
					<td>"&lt;span class='norecord'&gt;&lt;/span&gt;"</td>
					<td>当表格没有数据时，表格所显示的字符串</td>
				</tr>
				<tr>
					<td>language.paginate.previous</td>
					<td>String</td>
					<td>"上一页"</td>
					<td>分页信息的 'previous' 按钮显示的信息</td>
				</tr>
				<tr>
					<td>language.paginate.next</td>
					<td>String</td>
					<td>"下一页"</td>
					<td>分页信息的 'next' 按钮显示的信息</td>
				</tr>
				<tr>
					<td>language.paginate.first</td>
					<td>String</td>
					<td>"首页"</td>
					<td>分页信息的 'first' 按钮显示的信息</td>
				</tr>
				<tr>
					<td>language.paginate.last</td>
					<td>String</td>
					<td>"尾页"</td>
					<td>分页信息的 'last' 按钮显示的信息</td>
				</tr>
				<tr>
					<td>language.url</td>
					<td>String</td>
					<td>null</td>
					<td>从远程地址中加载语言信息</td>
				</tr>
				<tr>
					<td>language.decimal</td>
					<td>String</td>
					<td>null</td>
					<td>小数点表示字符（有些文化中用"，"表示小数点）</td>
				</tr>
			</tbody>
		</table>
		<br/>
		<h3>columns</h3>
		<p>注意： <code>columnDefs</code>需要和<code>columnDefs.targets</code>搭配使用，而 <code>columns</code>可以单独使用，这是两者的不同处</p>
		<table class="table table-bordered">
			<thead>
				<tr>
					<th>名称</th>		
					<th>说明</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>columns</td>
					<td>设定列的所有初始属性</td>
				</tr>
				<tr>
					<td>columnDefs</td>
					<td>设置定义列的初始属性</td>
				</tr>
				<tr>
					<td>columnDefs.targets</td>
					<td>为一个或多个列编制定义</td>
				</tr>
				<tr>
					<td>columns.data</td>
					<td>设置列的数据源，即如何从整个Table的数据源(object / array)中获得</td>
				</tr>
				<tr>
					<td>columns.name</td>
					<td>为列设定一个别名（描述性名字）</td>
				</tr>
				<tr>
					<td>columns.defaultContent</td>
					<td>设定该列的默认、静态的内容</td>
				</tr>
				<tr>
					<td>columns.orderable</td>
					<td>在该列上允许或者禁止排序功能</td>
				</tr>
				<tr>
					<td>columns.orderData</td>
					<td>定义多个列的默认排序条件</td>
				</tr>
				<tr>
					<td>columns.orderDataType</td>
					<td>列的表格的DOM类型，可以用来方便排序</td>
				</tr>
				<tr>
					<td>columns.orderSequence</td>
					<td>排序的顺序，正序或倒序</td>
				</tr>
				<tr>
					<td>columns.render</td>
					<td>在列上处理数据的函数，可以再次自定义显示内容</td>
				</tr>
				<tr>
					<td>columns.searchable</td>
					<td>在该列上允许或者禁止过滤搜索记录</td>
				</tr>
				<tr>
					<td>columns.title</td>
					<td>设定该列的标题</td>
				</tr>
				<tr>
					<td>column.type</td>
					<td>设定该列的类型 - 在该列排序或者搜索的时候使用</td>
				</tr>
				<tr>
					<td>columns.visible</td>
					<td>显示或隐藏该列</td>
				</tr>
				<tr>
					<td>columns.width</td>
					<td>设定列宽</td>
				</tr>
				<tr>
					<td>columns.cellType</td>
					<td>为列指定一个单元格类型</td>
				</tr>
				<tr>
					<td>columns.className</td>
					<td>为指定的列的每个单元格都指定一个css class</td>
				</tr>
				<tr>
					<td>columns.contentPadding</td>
					<td>当计算最佳显示状态时，文字内容部分需要增加的css padding值</td>
				</tr>
				<tr>
					<td>columns.createCell</td>
					<td>单元格生成以后的回调函数，这样你可以在这里改变DOM</td>
				</tr>
			</tbody>
		</table>
		<br/>
		<h3>回调函数</h3>
		<table class="table table-bordered">
			<thead>
				<tr>
					<th>名称</th>		
					<th>说明</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>infoCallback</td>
					<td>表格状态信息改变的回调函数</td>
				</tr>
				<tr>
					<td>preDrawCallback</td>
					<td>表格绘制前的回调函数</td>
				</tr>
				<tr>
					<td>rowCallback</td>
					<td>表格行(Row)绘制的回调函数</td>
				</tr>
				<tr>
					<td>stateLoadCallback</td>
					<td>该回调函数定义了从哪里和如何读取保存的状态</td>
				</tr>
				<tr>
					<td>stateLoaded</td>
					<td>状态加载完成之后的回调函数</td>
				</tr>
				<tr>
					<td>stateLoadParams</td>
					<td>状态加载完成之后，对数据处理的回调函数</td>
				</tr>
				<tr>
					<td>stateSavaCallback</td>
					<td>该回调函数定义了状态该存储在什么地方及如何存储</td>
				</tr>
				<tr>
					<td>stateSaveParams</td>
					<td>对状态进行存储时，对数据处理的回调函数</td>
				</tr>
				<tr>
					<td>formatNumber</td>
					<td>数字格式化时的回调函数</td>
				</tr>
				<tr>
					<td>initComplete</td>
					<td>初始化结束后的回调函数</td>
				</tr>
				<tr>
					<td>headerCallback</td>
					<td>表格Header显示时的回调函数</td>
				</tr>
				<tr>
					<td>footerCallback</td>
					<td>tfoot的回调函数</td>
				</tr>
				<tr>
					<td>createdRow</td>
					<td>行被创建时回调函数</td>
				</tr>
				<tr>
					<td>drawCallback</td>
					<td>表格每次重绘回调函数</td>
				</tr>
			</tbody>
		</table>
	</div>	 
	
	<script type="text/javascript" src="../../dist/js/jquery.js"></script>
	<script type="text/javascript" src="../../dist/js/bootstrap.js"></script>
	<script type="text/javascript" src="../../dist/js/form.js"></script>
	<script type="text/javascript" src="../../dist/js/datatables.js"></script>
	<script type="text/javascript" src="../../dist/js/loushang-framework.js"></script>
	<script type="text/javascript" src="../../dist/js/arttemplate.js"></script>
	<script type="text/javascript" src="../../dist/js/ui.js"></script>
	<script type="text/javascript" src="../ZeroClipboard.min.js"></script>
	<script type="text/javascript" src="../prettify.js"></script>
	<script id="mypopover" type="text/html">
	<div class="clearfix">
	    <div class="pull-left popover-content-left">
			<div class="form-group">
				<label for="menuId" class="text-name">目录编码:</label> 
				<input type="text" class="form-control ue-form" id="menuId">
			</div>
		    <div class="form-group">
				<label for="menuType" class="text-name">目录类型:</label> 
				<select class="form-control ue-form" id="menuType">
					<option>全部</option>
				</select>
				</div>
			<div class="form-group">
				<label for="doMain" class="text-name">实施主体:</label> 
				<input type="text" class="form-control ue-form" id="doMain" >
			</div>
		</div>
		<div class="pull-right popover-content-right">
			<div class="form-group">
				<label for="startDay" class="text-name">办理时间:</label> 
				<div class="input-group date" id="startDay">
					<div id="start">
						<input type="text" class="form-control ue-form" style="width: 100px" name="startDay" /> 
					</div>
					<span class="input-group-addon ue-form-btn"><i class="fa fa-calendar"></i></span>								   
				</div>&nbsp;&nbsp;到
				<div class="input-group date" id="endDay">
					<div id="end">
						<input type="text" class="form-control ue-form" style="width: 100px" name="endDay"/> 
					</div>
					<span class="input-group-addon ue-form-btn"><i class="fa fa-calendar"></i></span>								   
				</div>
			</div>
			<div class="form-group">
				<label for="menuName" class="text-name">目录名称:</label> 
				<input type="text" class="form-control ue-form" id="menuName">
			</div>
			<div class="form-group">
				<label for="menutype" class="text-name">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;状态:</label> 
				<select class="form-control ue-form" id="menutype">
					<option>全部</option>
				</select>
			</div>
		</div>
	</div>
	<div class="text-right">
		<button id="confirm" class="btn ue-btn-primary">搜索</button>
	</div>
	</script>
	<script type="text/javascript">
	
	var context="<%=request.getContextPath()%>";
	$(document).ready(function() {
	  //初始化datatable
	  	var options = {"Serverside": false,"orderCellsTop": true};
	  	var url = context+"/service/user/data";
		grid = new L.FlexGrid("userList",url); 
		grid.init(options); //初始化datatable
		//增加
		 $("#add").bind("click", function() {
			alert("跳转到增加页面");
		 });
		// 编辑
		 $(".modify").bind("click",function() {
			var data = grid.oTable.row($(this).parents("tr")).data();
			modify(data);
		});
		//更多搜索框的调用
		 $("#moresearch").morequery({
			 "title":"",
			 "content": template('mypopover',{})
		 });
		 $("#moresearch").on("click",function(){
			$('#startDay').datetimepicker({
			    container: $("#start"),
			    language: "zh-CN",
			    autoclose: 1,
			    startView: 2,
				minView: 2,
			    format: "yyyy-mm-dd"
			});
			$('#endDay').datetimepicker({
			    container: $("#end"),
			    language: "zh-CN",
			    autoclose: 1,
			    startView: 2,
				minView: 2,
			    format: "yyyy-mm-dd"
			});
		});
		// 删除
		$(document).on("click",".del",function() {
			var recordIds = grid.oTable.row($(this).parents("tr")).data().userId;
			debugger;
			 var param = {userName: userName};
			var resetPaging = false;
			grid.reload(null, param, resetPaging);
			
		});
		//条件查询
		$("#query").bind("click", function() {
		    var userName = $("#userName").val();
		    var param = {userName: userName};
		    var url = context + "/service/user/data";
		    grid.reload(url, param);
		}); 
	});

	function rendercheckbox(data, type, full) {
        return '<input type="checkbox" value="' + data + '" id="checkbox" name="checkboxlist"/>';
    };
    function renderoptions(data, type, full) {
    	return '<div class="pull-center"><button type="button" class="btn btn-xs ue-btn del" style="margin-left:5px;margin-bottom:3px"><span class="fa fa-trash"></span>删除</button>'+
    			'<button type="button"  class="btn btn-xs ue-btn modify" style="margin-bottom:3px"><span class="fa fa-cog"></span>编辑</button></div>'
    }
    function renderstatus(data,type,full){
    	switch (data)
    	{
    	case "N":
   		  data = "启用";
    	  break;
    	case "X":
    	  data = "停用";
    	  break;
    	}
		return data;
    }
	//修改当前记录 
	function modify(data){
 		var recordIds = data.userId;
		alert("修改用户ID"+recordIds);
	}
 	
	</script>
</body>
</html>