<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html lang="zh-CN">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>增加节点</title>

    <!-- 需要引用的CSS -->
     <link rel="shortcut icon" href="../../site.ico" />
     <link rel="stylesheet" type="text/css" href="../../dist/skin/css/bootstrap.css" />
     <link rel="stylesheet" type="text/css" href="../../dist/skin/css/font-awesome.css" />
     <link rel="stylesheet" type="text/css" href="../../dist/skin/css/ui.css" />
	 <link rel="stylesheet" type="text/css" href="../../dist/skin/css/form.css" />
	 <style>
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
	<!-- 页面结构 -->
	<form class="form-horizontal"  id="saveForm" onsubmit="return false">
		<div class="form-group">
			<label for="name" class="col-xs-3 col-md-3 control-label text-right">名称<span class="required">*</span></label>
			<div class="col-xs-8 col-md-8">
				<input type="text" class="form-control ue-form Validform_input" id="name"
						name="name" value="" placeholder="名称" datatype="*1-32" errormsg="名称不要超过32个字符！" nullmsg="名称不能为空" />						
				<span class="Validform_checktip Validform_span"></span>
			</div>
		</div>
		<div class="form-group">
			<label class="col-xs-3 col-md-3 control-label text-right" ></label>
	        <div class="col-xs-8 col-md-8">
	           <button id="save" class="btn ue-btn-primary" >保存</button>
	           <button id="cancel" class="btn ue-btn">取消</button>
	           <span id="msgdemo"></span>
	        </div>
      	</div>
	</form>
	
    <!-- 需要引用的JS -->
    <script type="text/javascript" src="../../dist/js/jquery.js"></script>
	<script type="text/javascript" src="../../dist/js/bootstrap.js"></script>
	<script type="text/javascript" src="../../dist/js/ui.js"></script>
	<script type="text/javascript" src="../../dist/js/form.js"></script>
	<script type="text/javascript">
	 $(function() {
		 var dialog = parent.dialog.get(window);
		 $("#saveForm").Validform({
			btnSubmit: "#save",
			tiptype:function(msg,o,cssctl){
				if(!o.obj.is("form")){
					var objtip=o.obj.siblings(".Validform_checktip"); //下拉框
					//根据单复选框的DOM结构查找其验证结果框
					if(objtip.length == 0){
						if(o.obj.parent("div").length != 0){   //普通文本框
							objtip=o.obj.parents("div").siblings(".Validform_checktip");
						}
					}
					cssctl(objtip,o.type);
					objtip.text(msg);
				} else{
					var objtip=o.obj.find("#msgdemo");
					cssctl(objtip,o.type);
					objtip.text(msg);
				} 
			},
			callback: function(){
				var name = $("#name").val();
				name = name.replace(/\n|\r\n/g,"<br>").replace(/[$]/g,"＄").replace(/[%]/g,"％").replace(/[#]/g,"＃").replace(/[&]/g,"＆").replace(/[ ]/g,"　");
				var rtns={
					name: name
				} 
				dialog.close(rtns);
				dialog.remove();
				return false;
			}
		});
		$("#cancel").on('click',function() {
			dialog.close();
			dialog.remove();
		});
	});
	</script>
  </body>
</html>