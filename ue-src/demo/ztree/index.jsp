<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html lang="zh-CN">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>ztree</title>
    <!-- 需要引用的CSS -->
	<link rel="shortcut icon" href="../../site.ico" />
	<link rel="stylesheet" type="text/css" href="../../dist/skin/css/bootstrap.css" />
	<link rel="stylesheet" type="text/css" href="../../dist/skin/css/font-awesome.css">
	<link rel="stylesheet" type="text/css" href="../../dist/skin/css/ztree.css" />
	<link rel="stylesheet" type="text/css" href="../../dist/skin/css/form.css" />
	<link rel="stylesheet" type="text/css" href="../../dist/skin/css/ui.css" />
	<link rel="stylesheet" type="text/css" href="../prettify.css"/>
	
    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="http://cdn.bootcss.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="http://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
  </head>
  <body>
  	<div class="ue-container">
		<ul id="tree" class="ztree" ></ul>
	</div>
	 <div class="ue-container">
	 	<p>规定唯一的<code>id</code>，定义<code>class</code>，规定元素的类名，用于指向样式表中的类。</p>
	 	<br/>
		<ul id="myTab" class="nav nav-tabs ue-tabs">
			<li class="active"><a href="#html" data-toggle="tab">HTML</a></li>
		</ul>
		<div id="myTabContent" class="tab-content" style="padding-top:20px">
			<div class="tab-pane active" id="html">
				<pre>
				
<ul id="tree" class="ztree" ></ul>
				</pre>
			</div>
		</div>
	</div>
	<div class="ue-container">
		<p>为了实现效果，还需要引进一些必要的css文件：</p>
		<br/>
		<ul id="myTab" class="nav nav-tabs ue-tabs">
			<li class="active"><a href="#css" data-toggle="tab">CSS</a></li>
		</ul>
		<div id="myTabContent" class="tab-content" style="padding-top:20px">
			<div class="tab-pane active" id="css">
				<pre>

&lt;link rel="stylesheet" type="text/css" href="../../dist/skin/css/bootstrap.css" /&gt;
&lt;link rel="stylesheet" type="text/css" href="../../dist/skin/css/ztree.css" /&gt;
&lt;link rel="stylesheet" type="text/css" href="../../dist/skin/css/ui.css" /&gt;
				</pre>
			</div>
		</div>
		<p><code>注意：此css文件路径是我们定义的路径，使用需要改成自己的定义路径。</code></p>
	</div>
	<div class="ue-container">
		<p>插件必须引入的js文件：</p>
		<br/>
		<ul id="myTab" class="nav nav-tabs ue-tabs">
			<li class="active"><a href="#js" data-toggle="tab">JS</a></li>
		</ul>
		<div id="myTabContent" class="tab-content" style="padding-top:20px">
			<div class="tab-pane active" id="js">
				<pre>

&lt;script type="text/javascript" src="../../dist/js/jquery.js"&gt;&lt;/script&gt;
&lt;script type="text/javascript" src="../../dist/js/form.js"&gt;&lt;/script&gt;
&lt;script type="text/javascript" src="../../dist/js/ztree.js"&gt;&lt;/script&gt;
				</pre>
			</div>
		</div>
		<p><code>注意：此js文件路径是我们定义的路径，使用需要改成自己的定义路径。</code></p>
		<br/>
		<p>本插件除了引用必须的js文件外，还需要实现方法。</p>
		<p>如下是本插件需要引入的js初始源代码：</p>
		<br/>
		<ul id="myTab" class="nav nav-tabs ue-tabs">
			<li class="active"><a href="#js" data-toggle="tab">JS源代码</a></li>
		</ul>
		<div id="myTabContent" class="tab-content" style="padding-top:20px">
			<div class="tab-pane active" id="js">
				<pre>
				
var zTree;
var setting = {
    check: {
        //设置 zTree 的节点上是否显示 checkbox / radio
        enable: false
    },    
    edit:{
        //设置 zTree 是否处于编辑状态
        enable:true       	
    },
    async: {
        //设置 zTree 是否开启异步加载模式
        enable: true,
        //Ajax 获取数据的 URL 地址
        url:"../../data/organ",
        //用于对 Ajax 返回数据进行预处理的函数
        dataFilter: filter
    },
    data: {
        simpleData: {
           //确定 zTree 初始化时的节点数据、异步加载时的节点数据、或 addNodes 方法中输入的 newNodes 数据是否采用简单数据模式
           enable:true,
           //节点数据中保存唯一标识的属性名称
           idKey: "id",
           //节点数据中保存其父节点唯一标识的属性名称
           pIdKey: "pId",
           //用于修正根节点父节点数据，即 pIdKey 指定的属性值
           rootPId: ""
        }
    },
    callback: {
        //用于捕获节点被点击的事件回调函数
        onClick: onClick
    }
};
$(document).ready(function(){
    //zTree 初始化方法
    $.fn.zTree.init($("#tree"), setting, root); 
});
     
/**定义根节点*/
var root = [{id:'root', nodeType:'root', isLeafModule: '', name: '组织机构树', isParent: true,iconSkin:"icon01"}];    
    
function filter(treeId, parentNode, childNodes){
    if (!childNodes) return null;
    for (var i=0, l=childNodes.length; i<1; i++) {
        childNodes[i].name = childNodes[i].name.replace(/\.n/g, '.');
    }
    return childNodes;
}
     
/**单击父节点展开树*/
function onClick(e,treeId, treeNode) {
    var zTree = $.fn.zTree.getZTreeObj("tree");
    zTree.expandNode(treeNode);
}
				</pre>
			</div>
		</div>
		<br/>
		<h3>参数</h3>
		<table class="table table-bordered">
			<thead>
				<tr>
					<th>名称</th>
					<th>说明</th>
				</tr>	
			</thead>
			<tbody>
				<tr>
					<td>setting.check. enable</td>
					<td>设置 zTree 的节点上是否显示 checkbox / radio</td>
				</tr>
				<tr>
					<td>setting.edit.enable</td>
					<td>设置 zTree 是否处于编辑状态</td>
				</tr>
				<tr>
					<td>setting.async. enable</td>
					<td>设置 zTree 是否开启异步加载模式</td>
				</tr>
				<tr>
					<td>setting.async.url</td>
					<td>Ajax 获取数据的 URL 地址</td>
				</tr>
				<tr>
					<td>etting.async. dataFilter</td>
					<td>用于对 Ajax 返回数据进行预处理的函数</td>
				</tr>
				<tr>
					<td>setting.data. simpleData.enable</td>
					<td>确定 zTree 初始化时的节点数据、异步加载时的节点数据、或 addNodes 方法中输入的 newNodes 数据是否采用简单数据模式 (Array)</td>
				</tr>
				<tr>
					<td>setting.data. simpleData. idKey</td>
					<td>节点数据中保存唯一标识的属性名称</td>
				</tr>
				<tr>
					<td>setting.data. simpleData. pIdKey</td>
					<td>节点数据中保存其父节点唯一标识的属性名称</td>
				</tr>
				<tr>
					<td>setting.data. simpleData. rootPId</td>
					<td>用于修正根节点父节点数据，即 pIdKey 指定的属性值</td>
				</tr>
				<tr>
					<td>setting.callback. onClick</td>
					<td>用于捕获节点被点击的事件回调函数</td>
				</tr>
				<tr>
					<td>setting.callback. beforeClick</td>
					<td>用于捕获单击节点之前的事件回调函数，并且根据返回值确定是否允许单击操作</td>
				</tr>
			</tbody>
		</table>
		<h3>methods</h3>
		<table class="table table-bordered">
			<thead>
				<tr>
					<th>名称</th>
					<th>说明</th>
				</tr>	
			</thead>
			<tbody>
				<tr>
					<td>$.fn.zTree.init()</td>
					<td>zTree 初始化方法，创建 zTree 必须使用此方法</td>
				</tr>
				<tr>
					<td>$.fn.zTree.getZTreeObj()</td>
					<td>zTree v3.x 专门提供的根据 treeId 获取 zTree 对象的方法。必须在初始化 zTree 以后才可以使用此方法</td>
				</tr>
				<tr>
					<td>zTreeObj.expandNode()</td>
					<td>展开 / 折叠 指定的节点</td>
				</tr>
				<tr>
					<td>zTreeObj.expandAll()</td>
					<td>展开 / 折叠 全部节点</td>
				</tr>
			</tbody>
		</table>
	</div>
    <!-- 需要引用的JS -->
  <!--   <script type="text/javascript" src="../../dist/js/jquery.js"></script>
    <script type="text/javascript" src="../../dist/js/bootstrap.js"></script> 
    <script type="text/javascript" src="../../dist/js/ztree.js"></script>
     <script type="text/javascript" src="../ZeroClipboard.min.js"></script>
    <script type="text/javascript" src="../prettify.js"></script> -->
    
    <script src="../require.js"></script>
    <script src="../main.js"></script>
    <script type="text/javascript">
    require(['jquery','form/artdialog','ztree','demo/prettify'], function($){
    var context="<%=request.getContextPath()%>";  
    $(document).ready(function(){
    	//初始树 
    	oTree = initTree();
    });
    //初始树 
    /* var zTree; */
    function initTree() {
    	var setting = {
        	check: {
            	enable: false
        	},
       	 	view: {
				addHoverDom: addHoverDom,
				removeHoverDom: removeHoverDom,
				showLine: false,
				selectedMulti: false //设置是否允许同时选中多个节点
			},
			edit:{
        		enable:true,
        		showRenameBtn: false,//不显示组件自定义的rename按钮 
        		showRemoveBtn: setRemoveBtn
        	}, 
        	async: {
				enable: true,
				url: context + "/service/organ/getAllNodes",//Ajax 获取数据的 URL 地址
				autoParam: ["id"], //异步加载时需要自动提交父节点属性的参数。
				dataFilter: datafilter,//用于对 Ajax 返回数据进行预处理的函数
				type: "get"
			},
         	data: {
         		 key: {
        			name: "name"//zTree 节点数据保存节点名称的属性名称
        		}, 
           		simpleData: {
                	enable: true,//确定 zTree 初始化时的节点数据、异步加载时的节点数据、或 addNodes 方法中输入的 newNodes 数据是否采用简单数据模式 (Array)
                	idKey: "id",//节点数据中保存唯一标识的属性名称。
                	pIdKey: "parenrId",//节点数据中保存其父节点唯一标识的属性名称
                	rootPId: ""//用于修正根节点父节点数据，即 pIdKey 指定的属性值
            	}
        	},
        	callback: {
        		onClick: onClick,
				beforeRemove: beforeRemove
			}
    	};
    	
    	//初始树 
    	$(document).ready(function() {
       	 	var tree = $.fn.zTree.init($("#tree"), setting, root); 
       		/* tree.expandNode(tree.getNodes()[0],true,false,true); */
        });
    	
    	/**定义根节点*/
        var root = [{id:'0', nodeType:'root',isLeafModule: '', name: '组织机构树', isParent: true,iconSkin:"icon01", open: true, isRoot: true}];
    }
   
     function datafilter(treeId, parentNode, childNodes){
    	if (!childNodes) return null;
		for (var i=0, l=childNodes.length; i<l; i++) {
			if(childNodes[i].isParent == "1") {
				childNodes[i].isParent = true;
			} else {
				childNodes[i].isParent = false;
			}
			childNodes[i].name = childNodes[i].name.replace(/\.n/g, '.');
		}  
		return childNodes;
    }
     
     /**单击父节点展开树*/
     function onClick(e,treeId, treeNode) {
			var zTree = $.fn.zTree.getZTreeObj("tree");
			zTree.expandNode(treeNode);
		}

     // 鼠标悬停在节点上显示自定义按钮
	 function addHoverDom(treeId, treeNode) {
		 if(treeNode.isRoot){
			 addNewNodes(treeId,treeNode);
    		 return;
    	 }else {
    		//修改节点 
    		 updateNodes(treeId,treeNode);
    		 //增加按钮 
        	 addNewNodes(treeId,treeNode);
    	 }
	};
	
	function setRemoveBtn(treeId, treeNode) {
	  if(treeNode.level == 0) {
	    return false;
	  } else {
	    return true;
	  }
	}
	
	//增加节点
	function addNewNodes(treeId,treeNode) {
		var parentId = treeNode.id;
		var sObj = $("#" + treeNode.tId + "_span");
		//判断是否处于编辑状态 
		if (treeNode.editNameFlag || $("#addBtn_"+treeNode.tId).length>0) return;
		var addStr = "<span class='button add' id='addBtn_" + treeNode.tId
			+ "' title='增加节点'></span>";
		sObj.after(addStr);
		
		//绑定事件 
		var btn = $("#addBtn_"+treeNode.tId);
		if (btn) btn.bind("click", function(){
			$.dialog ({
				type: "iframe",
				url: "addnewnodes.jsp",
				title:"增加节点",
				width: 500,
				height: 100,
				onclose: function() {
					var dataObj = this.returnValue;
					if(dataObj) {
						$.ajax({
							type: "POST",
							async: false,
							url: context + "/service/organ/addNode",
							data: {
								"parentId": parentId,
								 "name": dataObj.name
							},
							success: function(result) {
								var flag = result.flag;
								var orgId = result.id;
								if(flag){
									var zTree = $.fn.zTree.getZTreeObj("tree");
									zTree.addNodes(treeNode, {id:orgId, parentId: parentId, name:dataObj.name});
								}
							},
							error: function() {
							}
						});
					}
				}
			});
			return false;
		});
	}
	
	//修改节点信息 
	 function updateNodes(treeId,treeNode) {
		var id = treeNode.id;
		var name = treeNode.name;
		//增加修改按钮 
		var sObj = $("#" + treeNode.tId + "_span");
		if (treeNode.editNameFlag || $("#editBtn_"+treeNode.tId).length>0) return;
		var editStr = "<span class='button edit' id='editBtn_" + treeNode.tId
		+ "' title='修改节点'></span>";
		sObj.after(editStr);
		
		//绑定事件 
		var btn = $("#editBtn_"+treeNode.tId);
		if (btn) btn.bind("click", function(){
			$.dialog({
				type: "iframe",
				url: "updatenode.jsp?name=" + encodeURI(encodeURI(name)),
				title: "修改节点",
				width: 500,
				height: 100,
				onclose: function() {
					var dataObj = this.returnValue;
					if(dataObj) {
						$.ajax({
							type: "POST",
							url: context + "/service/organ/updateNode",
							data: {
								"id": id,
								"name": dataObj.name
							},
							success: function(data) {
								if(data == "true") { 
									//将重新修改后的名称加载到树结构上 
									treeNode.name = dataObj.name;
									var zTree = $.fn.zTree.getZTreeObj("tree");
									zTree.updateNode(treeNode);
								}
							}
						});
					}
				}
			});
			return false;
		});
	} 
	
	//鼠标移开的时候按钮消失 
	function removeHoverDom(treeId, treeNode) {
		$("#addBtn_"+treeNode.tId).unbind().remove();
		$("#editBtn_"+treeNode.tId).unbind().remove();
	};
	
	//在删除节点之前对数据进行操作 
	function beforeRemove(treeId,treeNode){
		var id = treeNode.id;
		var parentId = treeNode.parentId;
		if(treeNode.nodeType == "root"){
			return false; 
		}else {
			//在删除节点之前对节点进行判断 
			$.ajax({
				type: "GET",
				url: context + "/service/organ/findChildrenNodes?id=" + id,
				success:function(data) {
					if(data == "true") {
						$.dialog({
							type: 'alert',
							content: '请先删除子节点'
						});
					}else {
						$.dialog({
							type: "confirm",
							content: "确定删除该节点？",
							autofocus: true,
							ok: function() {
								$.ajax({
									type: "POST",
									async: false,
									url: context + "/service/organ/deleteNode",
									data: {
										"id": id,
										"parentId": parentId
									},
									success: function(data) {
										if(data == "true") {
											var zTree = $.fn.zTree.getZTreeObj("tree");
											zTree.removeNode(treeNode);
										}
									}
								});
							},
							cancel: function() {
							}
						});
					}
				}
			});
			return false;//若不return false 无论后台是否删除节点，ztree都会前台默认删除节点
		}
	}
    });
	</script>	
  </body>
</html>