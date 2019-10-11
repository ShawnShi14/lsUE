<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false" %>
<!DOCTYPE html>
<html lang="zh-CN">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>树+标签页</title>

    <!-- 需要引用的CSS -->
	<link rel="shortcut icon" href="../../site.ico" />
	<link rel="stylesheet" type="text/css" href="../../dist/skin/css/bootstrap.css" />
	<link rel="stylesheet" type="text/css" href="../../dist/skin/css/font-awesome.css" />
	<link rel="stylesheet" type="text/css" href="../../dist/skin/css/jquery-ui.css" />
	<link rel="stylesheet" type="text/css" href="../../dist/skin/css/ui.css" />
	<link rel="stylesheet" type="text/css" href="../../dist/skin/css/form.css" />
	<link rel="stylesheet" type="text/css" href="../../dist/skin/css/ztree.css" />
	<style>	
	.form-inline {
		margin-left: 0px;
		margin-bottom: 5px;
	}
	.ue-menu-right {
		padding: 5px;
	}
    iframe {
    	width: 100%;
    	height: 100%;
 		border: 0px;
    }
    .ui-dialog .ui-dialog-content {
		overflow: hidden;
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
	<div class="ue-menu-wrap">
		<div class="ue-menu-left">
			<ul id="tree" class="ztree"></ul>
		</div>
		<div class="ue-menu-right">
		    <iframe src="subtab.html" name="iframeTab" frameborder="no"></iframe>
		</div>
	</div>
</body>
	<script type="text/javascript" src="../../dist/js/jquery.js"></script>
	<script type="text/javascript" src="../../dist/js/bootstrap.js"></script>
	<script type="text/javascript" src="../../dist/js/jquery-ui.js"></script>
	<script type="text/javascript" src="../../dist/js/ui.js"></script>
	<script type="text/javascript" src="../../dist/js/form.js"></script>
	<script type="text/javascript" src="../../dist/js/ztree.js"></script>
	<script>
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
	   /*   function onClick(e,treeId, treeNode) {
				var zTree = $.fn.zTree.getZTreeObj("tree");
				zTree.expandNode(treeNode);
			} */
		/* 双击父节点展开树节点，单击重新reload表格 */
	     var curRecord;    //当前选中的树节点
	     function onClick(e,treeId, treeNode) {
	    	// 记录当前选中的节点
	    	curRecord = treeNode;
	    	// 重新加载数据
	    	$(e.target).parent("a").attr("target","iframeTab");
	    	$(e.target).parent("a").attr("href","subtab.html");
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
			　 }else {
			　　　    return true;
			　 }
		}
		
		//增加节点
		function addNewNodes(treeId,treeNode) {
			var parentId　= treeNode.id;
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
					height: 120,
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
					height: 120,
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
		//左右拖拽布局 
	$(document).ready(function(){
    	$(".ue-menu-left").dragResize({
 			target: ".ue-menu-right",//被动变化元素，可为空
 			handles: "e"//支持e、s、n、w四个方向
 		});
    });
	</script>
</html>