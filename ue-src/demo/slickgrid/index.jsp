<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="/tags/loushang-web" prefix="l"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>slickgrid-可编辑表格</title>
	<link rel="shortcut icon" href="../../site.ico" />
	<link rel="stylesheet" type="text/css" href="../../dist/skin/css/bootstrap.css" />
	<link rel="stylesheet" type="text/css" href="../../dist/skin/css/font-awesome.css" />
	<link rel="stylesheet" type="text/css" href="../../dist/skin/css/ui.css" />
	<link rel="stylesheet" type="text/css" href="../../dist/skin/css/form.css" />
	<link rel="stylesheet" type="text/css" href="../../dist/skin/css/slickgrid.css" />
	<link rel="stylesheet" type="text/css" href="slickgrid.css" />
	<link rel="stylesheet" type="text/css" href="../prettify.css"/>
	
	<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="http://cdn.bootcss.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="http://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>
<body>
	<br/>
	<br/>
	<div class="container">
		<div class="col-xs-12 col-md-12">	
	   		<div class="row">
				<form class="form-inline" onsubmit="return false;">										
					<div class="input-group">
		        		<input class="form-control ue-form" type="text" id="productName" placeholder="商品名称"/>
		       			<div class="input-group-addon ue-form-btn" id="query">
		        			<span class="fa fa-search"></span>
		        		</div>
	        		</div>
		    		<a class="btn ue-btn dbtn" id="moresearch">更多搜索<i class="fa fa-angle-down"></i></a>
		    		<div class="btn-group pull-right">
						<button id="add" type="button" class="btn ue-btn">
							<span class="fa fa-plus"></span> 增加
						</button>
						<button id="del" type="button" class="btn ue-btn">
							<span class="fa fa-minus"></span> 删除
						</button>
						<button id="save" type="button" class="btn ue-btn">
							<span class="fa fa-save"></span> 保存
						</button>
					</div>
				</form>
			</div>
		</div>
		<table id="productList">
			<thead>
				<tr>
					<th width="15%" data-field="id" data-render="checkbox"></th>
					<th width="15%" data-field="productCode" data-editor="text">商品编号</th>
					<th width="15%" data-field="productName" data-sortable=true data-editor="text">商品名称</th>
					<th width="15%" data-field="productType" data-editor="select" data-source="getTypeSelectVal" data-render="renderstatus">商品类别</th>
                    <th width="15%" data-field="productNum" data-editor="text" data-validator="isNumber">商品数量</th>	
                    <th width="25%" data-field="productDate" data-editor="date">生产日期</th>
                </tr>
			</thead>
		</table>
	</div>
	
	<!-- 代码高亮 -->
	<hr/>
	<div class="container">
		<ul id="myTab" class="nav nav-tabs ue-tabs">
			<li class="active"><a href="#html" data-toggle="tab">HTML</a></li>
		</ul>
		<div id="myTabContent" class="tab-content" style="padding-top:10px">
			<div class="tab-pane active" id="html">
				<pre>
				
<div class="col-xs-12 col-md-12">	
    <div class="row">
        <form class="form-inline" onsubmit="return false;">										
            <div class="input-group">
                <input class="form-control ue-form" type="text" id="productName" placeholder="商品名称"/>
                <div class="input-group-addon ue-form-btn" id="query">
                    <span class="fa fa-search"></span>
                </div>
            </div>
            <a class="btn ue-btn dbtn" id="moresearch">更多搜索<i class="fa fa-angle-down"></i></a>
            <div class="btn-group pull-right">
                <button id="add" type="button" class="btn ue-btn">
                    <span class="fa fa-plus"></span> 增加
                </button>
                <button id="del" type="button" class="btn ue-btn">
                    <span class="fa fa-minus"></span> 删除
                </button>
                <button id="save" type="button" class="btn ue-btn">
                    <span class="fa fa-save"></span> 保存
                </button>
            </div>
        </form>
    </div>
</div>
<table id="productList">
    <thead>
        <tr>
            <th width="15%" data-field="id" data-render="checkbox"></th>
            <th width="15%" data-field="productCode" data-editor="text">商品编号</th>
            <th width="15%" data-field="productName" data-sortable="true" data-editor="text">商品名称</th>
            <th width="15%" data-field="productType" data-editor="select" data-source="getTypeSelectVal" data-render="renderstatus">商品类别</th>
            <th width="15%" data-field="productNum" data-editor="text" data-validator="isNumber">商品数量</th>	
            <th width="25%" data-field="productDate" data-editor="date">生产日期</th>
        </tr>
    </thead>
</table>
				</pre>
			</div>
		</div>
		<br/>
		<ul id="myTab" class="nav nav-tabs ue-tabs">
			<li class="active"><a href="#js" data-toggle="tab">JS</a></li>
		</ul>
		<div id="myTabContent" class="tab-content" style="padding-top:10px">
			<div class="tab-pane active" id="js">
				<pre>
				
var context = "<l:assetcontext/>";
// 定义表格对象
var grid;
// 表格数据
var data = [];
var dataView;
$(document).ready(function() {
    // 初始化表格
    initTable();
	
    // 增加
    $("#add").bind("click",add);
	
    // 删除
    $("#del").bind("click",del);
	
    // 保存
    $("#save").bind("click",save);
	
    // 搜索
    $("#query").bind("click",query);
	
    // 更多搜索
    $("#moresearch").popover({
        title: "",
        content: $("#searchpanel").html(),
        placement: "bottom",
        html: true,
        trigger: "click"
    });
	
    $(document).on("click","#search",function(){
        var id = $("#productId").val();
        alert("查询商品编号"+id);
	});
});

// 初始化表格
function initTable() {
    var options={};
    var url = context+"/service/product/query";
    grid = new L.EditGrid("productList", url);
    grid.init(options);		// 初始化editGrid
}

// 查询
function query() {
    var name = $("#productName").val();
    grid.setParameter("productName", name);
    grid.reload();
}

// 增加一行
function add() {
    grid.addRow({});
}

// 删除
function del() {
    grid.deleteRow();
}

// 保存数据
function save() {
    var changedRows = grid.getChangedData();
    if(changedRows.length < 1) {
        $.dialog({
            type: "alert",
            content: "数据未发生改变!"
        });
    } else {
        var url = context + "/service/product/save";
        var json = JSON.stringify(changedRows);
        $.ajax({
            url : url,
            type : "POST",
            async : false,
            contentType: "application/json",
            dataType: "json",
            data: json,
            success : function(data){
                if(data.success == true){
                    $.dialog({
                        type:"alert",
                        content:"保存成功",
                        autofocus: true
                    });
                    grid.reload();
                }
            },
            error : function(data, textstatus){
                $.dialog({
                    type:"alert",
                    content:"错误",
                    autofocus: true
                });
            }
       }); 
   } 
}

// 渲染列值
function renderstatus(row, cell, value, columnDef, dataContext){
    if(value == "0")
        return "食品";
    if(value == "1")
        return "水果";
    if(value == "2")
        return "器材";
    else
        return "";
    return value;
}

// 获取类别下拉框选项值
function getTypeSelectVal() {
    var arr = [];
    arr.push({
        key: 0,
        value: "食品"
    });
    arr.push({
        key: 1,
        value: "水果"
    });
    arr.push({
        key: 2,
        value: "器材"
    });
    return arr;
}
				</pre>
			</div>
		</div>
		<br/>
		<h3>说明：</h3>
		<p>DOM结构中的参数：</p>
		<table class="table table-bordered">
			<thead>
				<tr>
					<th>选项</th>
					<th>类型</th>
					<th>默认值</th>
					<th>说明</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>width</td>
					<td>String</td>
					<td>'20%'</td>
					<td>设置列宽。</td>
				</tr>
				<tr>
					<td>data-field</td>
					<td>String</td>
					<td></td>
					<td>设置列属性，与后台类中的属性一致。</td>
				</tr>
				<tr>
					<td>data-sortable</td>
					<td>Boolean</td>
					<td>false</td>
					<td>是否排序</td>
				</tr>
				<tr>
					<td>data-editor</td>
					<td>String</td>
					<td></td>
					<td>text:定义的列为文本框；select:定义的列为下拉框；date：定义的列为日期框</td>
				</tr>
				<tr>
					<td>data-hidden</td>
					<td>Boolean</td>
					<td>false</td>
					<td>当data-hidden的值为true，隐藏此列</td>
				</tr>
				<tr>
					<td>data-rander</td>
					<td>String</td>
					<td></td>
					<td>定义一个函数，对此列进行操作。其中，data-rander="checkbox"时此列定义的是复选框；data-rander="radio"时此列定义的是单选按钮。</td>
				</tr>
			</tbody>
		</table>
		<br/>
		<p>JS中的options配置：</p>
		<table class="table table-bordered">
			<thead>
				<tr>
					<th>选项</th>
					<th>类型</th>
					<th>默认值</th>
					<th>说明</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>paging</td>
					<td>Boolean</td>
					<td>true</td>
					<td>是否分页，默认为显示分页，当设置为false时为不分页。</td>
				</tr>
				<tr>
					<td>info</td>
					<td>Boolean</td>
					<td>true</td>
					<td>是否显示”显示X到X条共X条记录“的信息，设置为false时不显示。</td>
				</tr>
				<tr>
					<td>editable</td>
					<td>Boolean</td>
					<td>true</td>
					<td>表格是否可编辑。当editable的值设为false时表格不可编辑。</td>
				</tr>
				<tr>
					<td>autoEdit</td>
					<td>Boolean</td>
					<td>true</td>
					<td>是否是单击可编辑。当autoEdit设置为false时为双击编辑。</td>
				</tr>
				<tr>
					<td>autoHeight</td>
					<td>Boolean</td>
					<td>true</td>
					<td>可编辑表格高度是否自适应，此时slickgrid的css样式中高度也要设置auto</td>
				</tr>
				<tr>
					<td>colresizable</td>
					<td>Boolean</td>
					<td>true</td>
					<td></td>
				</tr>
				<tr>
					<td>widthType</td>
					<td>String</td>
					<td>'%'</td>
					<td>宽度类型</td>
				</tr>
				<tr>
					<td>rerenderOnResize</td>
					<td>Boolean</td>
					<td>true</td>
					<td>设置为true，每当调整此列的大小时，整个表视图将重新渲染。</td>
				</tr>
				<tr>
					<td>selectActiveRow</td>
					<td>Boolean</td>
					<td>false</td>
					<td>点击行时将其选中，并将其余行取消选中</td>
				</tr>
				<tr>
					<td>multiSelect</td>
					<td>Boolean</td>
					<td>true</td>
					<td>true：多选(Ctrl+左键单击行)；false：单选</td>
				</tr>
				<tr>
					<td>defaultColumnWidth</td>
					<td>Number</td>
					<td>20</td>
					<td>默认列宽，与widthType结合</td>
				</tr>
				<tr>
					<td>enableTextSelectionOnCells</td>
					<td>Boolean</td>
					<td>true</td>
					<td></td>
				</tr>
				<tr>
					<td>forceFitColumns</td>
					<td>Boolean</td>
					<td>true</td>
					<td>强制列大小适应容器（防止水平滚动）。有效的设置列宽在小容器上不需要列数。</td>
				</tr>
				<tr>
					<td>lastRendering</td>
					<td>Number</td>
					<td>0</td>
					<td></td>
				</tr>
				<tr>
					<td>isNextMerged</td>
					<td>Nmber</td>
					<td>0</td>
					<td></td>
				</tr>
				<tr>
					<td>changedCells</td>
					<td>Object</td>
					<td>{}</td>
					<td></td>
				</tr>
			</tbody>
		</table>
	</div>
		
	<!-- 需要引用的js文件 -->
	<script type="text/javascript" src="../../dist/js/jquery.js"></script>
	<script type="text/javascript" src="../../dist/js/bootstrap.js"></script>
	<script type="text/javascript" src="../../dist/js/form.js"></script>
	<script type="text/javascript" src="../../dist/js/slickgrid.js"></script>
	<script type="text/javascript" src="../../dist/js/loushang-framework.js"></script>
	<script type="text/javascript" src="../../dist/js/ui.js"></script>
	<script type="text/javascript" src="../ZeroClipboard.min.js"></script>
    <script type="text/javascript" src="../prettify.js"></script>
	
	<script id="searchpanel" type="text/html">
	<div class="form-group">
	    <label for="productId" class="text-name" style="float: left\9;">商品编号:</label> 
		<input type="text" class="form-control ue-form" id="productId" placeholder="商品编号" style="float: left\9;">
	</div>
    <div class="text-right" style="margin-top: 10px;">
	    <button id="search" class="btn ue-btn-primary">搜索</button>
	</div>
	</script>
<script type="text/javascript">
var context = "<l:assetcontext/>";
// 定义表格对象
var grid;
// 表格数据
var data = [];
var dataView;
$(document).ready(function() {
	// 初始化表格
	initTable();
	
	// 增加
	$("#add").bind("click",add);
	
	// 删除
	$("#del").bind("click",del);
	
	// 保存
	$("#save").bind("click",save);
	
	// 搜索
	$("#query").bind("click",query);
	
	// 更多搜索
	$("#moresearch").popover({
	    title: "",
	    content: $("#searchpanel").html(),
	    placement: "bottom",
	    html: true,
	    trigger: "click"
	});
	
	$(document).on("click","#search",function(){
		var id = $("#productId").val();
		alert("查询商品编号"+id);
	});
	
	//更多搜索里面的占位符在ie8上的兼容性问题 
	$(document).on("click","#moresearch",function(){
		 JPlaceHolder.init();
	});
	
});

// 初始化表格
function initTable() {
	var options={};
	var url = context+"/service/product/query";
	grid = new L.EditGrid("productList", url);
	grid.init(options);		// 初始化editGrid
}

// 查询
function query() {
	var name = $("#productName").val();
	grid.setParameter("productName", name);
	grid.reload();
}

// 增加一行
function add() {
	grid.addRow({});
}

// 删除
function del() {
	grid.deleteRow();
}

// 保存数据
function save() {
	var changedRows = grid.getChangedData();
	if(changedRows.length < 1) {
		$.dialog({
			type: "alert",
			content: "数据未发生改变!"
		});
	} else {
		var url = context + "/service/product/save";
		var json = JSON.stringify(changedRows);
		$.ajax({
			url : url,
			type : "POST",
			async : false,
			contentType: "application/json",
			dataType: "json",
			data: json,
			success : function(data){
				if(data.success == true){
				    $.dialog({
					 type:"alert",
					 content:"保存成功",
					 autofocus: true
				    });
				    grid.reload();
				}
			},
			error : function(data, textstatus){
				$.dialog({
					 type:"alert",
					 content:"错误",
					 autofocus: true
				 });
			}
		}); 
	} 
}

// 渲染列值
function renderstatus(row, cell, value, columnDef, dataContext){
	if(value == "0")
		return "食品";
	if(value == "1")
		return "水果";
	if(value == "2")
		return "器材";
	else
		return "";
	return value;
}

// 获取类别下拉框选项值
function getTypeSelectVal() {
	var arr = [];
	arr.push({
		key: 0,
		value: "食品"
	});
	arr.push({
		key: 1,
		value: "水果"
	});
	arr.push({
		key: 2,
		value: "器材"
	});
	return arr;
}
</script>
</body>
</html>