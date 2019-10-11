<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
  <head>
	<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<title>文件上传-plupload</title> 
	
	<!-- 需要引用的css -->
	<link rel="shortcut icon" href="../../site.ico" />
	<link rel="stylesheet" type="text/css" href="../../dist/skin/css/bootstrap.css" />
	<link rel="stylesheet" type="text/css" href="../../dist/skin/css/font-awesome.css" />
	<link rel="stylesheet" type="text/css" href="../../dist/skin/css/form.css">
	<link rel="stylesheet" type="text/css" href="../../dist/skin/css/ui.css">
	<link rel="stylesheet" type="text/css" href="../prettify.css"/>
	
	<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="http://cdn.bootcss.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="http://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
  </head>
  <body>
	<div class="ue-container" id="rpick">
		<form action="" method="post">
			<div class="input-group">
	           <input class="form-control ue-form" type="text" placeholder="选择上传文件" id="filelist" />
	           <div class="input-group-addon ue-form-btn" id="inputfiles">
	           		<span class="fa fa-upload"></span>
	           </div>
	        </div>
	        <div class="progress" style="display: none;margin-top: 10px;">  
	       		<div class="progress-bar" id="inputpro">
	          		<span></span>
	        	</div>
	      	</div>
		</form>
		<br/>
    	<br/>
    	<br/>
    	<form action="" method="post"> 
        	<a class="btn ue-btn" id="rpickfiles">单选文件（立即上传，显示上传中）</a>
    	</form>
    	<div id="rresult"></div>
    	<br/>
    	<br/>
    	<br/>
    	<form action="" method="post"> 
        	<a class="btn ue-btn" id="cpickfiles">多选文件（立即上传，显示进度）</a>
    	</form>
    	<div id="cresult"></div>
	</div>
	<div class="ue-container" id="uipick"> 
    	<form action="" method="post">
    		<div id="ui-uploader"></div>
    	</form>
	</div>
	<!-- 代码高亮 -->
	<div class="ue-container">
		<ul id="myTab" class="nav nav-tabs ue-tabs">
			<li class="active"><a href="#html" data-toggle="tab">HTML</a></li>
		</ul>
		<div id="myTabContent" class="tab-content" style="padding-top:20px">
			<div class="tab-pane active" id="html">
				<pre>

<form action="" method="post">
   <div class="input-group">
      <input class="form-control ue-form" type="text" placeholder="选择上传文件" id="filelist" />
      <div class="input-group-addon ue-form-btn" id="inputfiles">
         <span class="fa fa-upload"></span>
      </div>
   </div>
   <div class="progress" style="display: none;margin-top: 10px;">
      <div class="progress-bar" id="inputpro">
         <span></span>
      </div>
   </div>
</form>
		
<form action="" method="post"> 
    <a class="btn ue-btn" id="rpickfiles">单选文件（立即上传，显示上传中）</a>
</form>
<div id="rresult"></div>
    	
<form action="" method="post"> 
    <a class="btn ue-btn" id="cpickfiles">多选文件（立即上传，显示进度）</a>
</form>
<div id="cresult"></div>
    	
<form action="" method="post">
    <div id="ui-uploader"></div>
</form>
				</pre>
			</div>
		</div>
	</div>
	<div class="ue-container">
		<p>本插件需要引入的css文件：</p>
		<br/>
		<ul id="myTab" class="nav nav-tabs ue-tabs">
			<li class="active"><a href="#css" data-toggle="tab">CSS</a></li>
		</ul>
		<div id="myTabContent" class="tab-content" style="padding-top:20px">
			<div class="tab-pane active" id="css">
				<pre>

&lt;link rel="stylesheet" type="text/css" href="../../dist/skin/css/bootstrap.css" /&gt;
&lt;link rel="stylesheet" type="text/css" href="../../dist/skin/css/font-awesome.css" /&gt;
&lt;link rel="stylesheet" type="text/css" href="../../dist/skin/css/ui.css"&gt;
&lt;link rel="stylesheet" type="text/css" href="../../dist/skin/css/form.css"&gt;
				</pre>
			</div>
		</div>
		<p><code>注意：此css文件路径是我们定义的路径，使用需要改成自己的定义路径。</code></p>
	</div>
	<div class="ue-container">
		<p>本插件需要引入的js文件：</p>
		<br/>
		<ul id="myTab" class="nav nav-tabs ue-tabs">
			<li class="active"><a href="#js" data-toggle="tab">JS</a></li>
		</ul>
		<div id="myTabContent" class="tab-content" style="padding-top:20px">
			<div class="tab-pane active" id="js">
				<pre>

&lt;script type="text/javascript" src="../../dist/js/jquery.js"&gt;&lt;/script&gt;
&lt;script type="text/javascript" src="../../dist/js/form.js"&gt;&lt;/script&gt;
			   </pre>
			</div>
		</div>
		<p><code>注意：此js文件路径是我们定义的路径，使用需要改成自己的定义路径。</code></p>
		<br/>
		<p>除了要引用必要的js文件外，还需要实现方法。</p>
		<p>如下为本插件js初始源代码：</p>
		<br/>
		<ul id="myTab" class="nav nav-tabs ue-tabs">
			<li class="active"><a href="#js" data-toggle="tab">JS源文件</a></li>
		</ul>
		<div id="myTabContent" class="tab-content" style="padding-top:20px">
			<div class="tab-pane active" id="js">
				<pre>
//用来获取上下文,用于servlet的配置路径
var context="&lt;%= request.getContextPath()%&gt;";				
$(function() {
    var uploader = new plupload.Uploader({
    //用来指定上传方式,指定多个上传方式请使用逗号隔开,默认即为此,可不写
    runtimes: 'html5,flash,silverlight,html4',
    //点击上传html标签的id,可以是a,button等
    browse_button: 'inputfiles',
    //服务器端的页面上传地址
    url : context + '/upload',
    //文件的最大上传大小,不写该参数则上传文件大小无限制
    max_file_size: '50mb',
    //设置多项选择,默认为true,即可多选文件,功能为单选时需将此设为false
    multi_selection: false,
    //上传的文件生成一个唯一的文件名,默认为false,false时上传文件为本身的名字,true时自动生成其他名字
    unique_names: true,
    //可以使用该参数来限制上传文件的类型,大小等,该参数以对象的形式传入
    filters: [
        {title: "Image files", extensions: "jpg,gif,png"}, 
        {title: "Zip files", extensions: "zip"}
    ],
    //flash地址,swf文件,当需要使用swf方式进行上传时需要配置该参数
    flash_swf_url: '../../dist/js/Moxie.swf',
    //silverlight文件,当需要使用silverlight方式进行上传时需要配置该参数
    silverlight_xap_url: '../../dist/js/Moxie.xap',
    //当Plupload初始化完成后触发
    init: {
        //当文件添加到上传队列后触发(up为当前的plupload实例对象,files为一个数组,里面的元素为本次添加到上传队列里的文件对象)
        FilesAdded: function(up, files) {
            plupload.each(files, function(file) {
                document.getElementById('filelist').value += file.name;
            });
            //开始上传队列中的文件
            uploader.start();
        },
        //会在文件上传过程中不断触发,可以用此事件来显示上传进度(up当前的plupload实例对象,file为触发此事件的文件对象)
        UploadProgress: function(up, file) {
            $("#inputpro").parent().show();
            $("#inputpro")[0].style.width = $("#inputpro")[0].innerText = file.percent + "%";
        }
    }
 });
//初始化Plupload实例
uploader.init();
});
	
$(function() {
    var $r = $('#rpick');
    var uploader = new plupload.Uploader({
        runtimes: 'html5,flash,silverlight,html4',
        browse_button: 'rpickfiles',
        multi_selection: false,
        url : context + '/upload',
        max_file_size: '50mb',
        unique_names: true,
        filters: [
          {title: "Image files", extensions: "jpg,gif,png"}, 
          {title: "Zip files", extensions: "zip"} 
        ],
        flash_swf_url: '../../dist/js/Moxie.swf',
        silverlight_xap_url: '../../dist/js/Moxie.xap',
        init: {
    	   FilesAdded: function(up, files) {
              //上传时的加载效果
    		  $r.loading({
    			isShowMask: true,
    			lines: 10,
    			length: 8,
    			width: 5,
    			radius: 15
    		  });
    		  uploader.start();
           },
    		
           UploadProgress: function(up, file) {
              if (file.percent == 100) {
                 $r.unloading();
                 document.getElementById('rresult').innerHTML = '上传成功！';
              }
           },
    		//当发生错误时触发	
           Error: function(up, err) {
              document.getElementById('rresult').appendChild(document.createTextNode("\nError #" + err.code + ": " + err.message));
           }
        }
    });
    uploader.init();
});
	
$(function() {
    var uploader = new plupload.Uploader({
        runtimes: 'html5,flash,silverlight,html4',
        browse_button: 'cpickfiles',
        url : context + '/upload',
        max_file_size: '50mb',
        unique_names: true,
        filters: [
           {title: "Image files", extensions: "jpg,gif,png"}, 
           {title: "Zip files", extensions: "zip"}
        ],
        flash_swf_url: '../../dist/js/Moxie.swf',
        silverlight_xap_url: '../../dist/js/Moxie.xap',
        init: {
           FilesAdded: function(up, files) {
              plupload.each(files, function(file) {
                 document.getElementById('cresult').innerHTML += '<div id="' + file.id + '">' + file.name + ' (' + plupload.formatSize(file.size) + ') <div class="progress"><div class="progress-bar"><span></span></div></div></div>';
              });
              uploader.start();
           },

           UploadProgress: function(up, file) {
              $("#" + file.id).find('.progress-bar')[0].style.width = $("#" + file.id).find('.progress-bar')[0].innerText = file.percent + "%";
           },
    			
           Error: function(up, err) {
              document.getElementById('cresult').appendChild(document.createTextNode("\nError #" + err.code + ": " + err.message));
           }
         }
    });
    uploader.init();
});
	
$(function() {
    $('#ui-uploader').pluploadQueue({
        runtimes: 'html5,flash,silverlight,html4',
        url : context + '/upload',
        max_file_size: '50mb',
        unique_names: true,
        filters: [
           {title: "Image files", extensions: "jpg,gif,png"}, 
           {title: "Zip files", extensions: "zip"} 
        ],
        
        views: {
    	   list: true,
    	   thumbs: true, // Show thumbs
    	   active: 'thumbs'
    	},
        flash_swf_url: '../../dist/js/Moxie.swf',
        silverlight_xap_url: '../../dist/js/Moxie.xap'
	});
});
				</pre>
			</div>
		</div>
		<br>
		<h3>options</h3>
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
					<td>runtimes</td>
					<td>String</td>
					<td>html5,flash,silverlight,html4</td>
					<td>用来指定上传方式，指定多个上传方式请使用逗号隔开。一般情况下，你不需要配置该参数，因为Plupload默认会根据你的其他的参数配置来选择最合适的上传方式。
					如果没有特殊要求的话，Plupload会首先选择html5上传方式，如果浏览器不支持html5，则会使用flash或silverlight，如果前面两者也都不支持，则会使用最传统的html4上传方式。
					如果你想指定使用某个上传方式，或改变上传方式的优先顺序，则你可以配置该参数。</td>
				</tr>
				<tr>
					<td>browse_button</td>
					<td>String / DOM</td>
					<td>null</td>
					<td>触发文件选择对话框的DOM元素，当点击该元素后便后弹出文件选择对话框。该值可以是DOM元素对象本身，也可以是该DOM元素的id。</td>
				</tr>
				<tr>
					<td>url</td>
					<td>String</td>
					<td>null</td>
					<td>服务器端接收和处理上传文件的脚本地址，可以是相对路径(相对于当前调用Plupload的文档)，也可以是绝对路径。</td>
				</tr>
				<tr>
					<td>filters</td>
					<td>Object</td>
					<td>{ }</td>
					<td>可以使用该参数来限制上传文件。</td>
				</tr>
				<tr>
					<td>headers</td>
					<td>Object</td>
					<td>null</td>
					<td>设置上传时的自定义头信息，以键/值对的形式传入，键代表头信息属性名，键代表属性值。html4上传方式不支持设置该属性。</td>
				</tr>
				<tr>
					<td>multipart</td>
					<td>Boolean</td>
					<td>true</td>
					<td>为true时将以multipart/form-data的形式来上传文件，为false时则以二进制的格式来上传文件。
						html4上传方式不支持以二进制格式来上传文件，在flash上传方式中，二进制上传也有点问题。并且二进制格式上传还需要在服务器端做特殊的处理。</td>
				</tr>
				<tr>
					<td>multipart_params</td>
					<td>Object</td>
					<td>null</td>
					<td>上传时的附加参数，以键/值对的形式传入，服务器端可是使用$_POST来获取这些参数。值还可以是一个字面量对象，还可以是一个数组。</td>
				</tr>
				<tr>
					<td>max_retries</td>
					<td>Number</td>
					<td>0</td>
					<td>当发生plupload.HTTP_ERROR错误时的重试次数，为0时表示不重试。</td>
				</tr>
				<tr>
					<td>resize</td>
					<td>Object</td>
					<td>null</td>
					<td>可以使用该参数对将要上传的图片进行压缩，该参数是一个对象，里面包括5个属性：<br/>
						width：指定压缩后图片的宽度，如果没有设置该属性则默认为原始图片的宽度<br/>
						height：指定压缩后图片的高度，如果没有设置该属性则默认为原始图片的高度<br/>
						crop：是否裁剪图片<br/>
						quality：压缩后图片的质量，只对jpg格式的图片有效，默认为90。quality可以跟width和height一起使用，但也可以单独使用，单独使用时，压缩后图片的宽高不会变化，但由于质量降低了，所以体积也会变小<br/>
						preserve_headers：压缩后是否保留图片的元数据，true为保留，false为不保留,默认为true
					</td>
				</tr>
				<tr>
					<td>drop_element</td>
					<td>DOM/String/Array</td>
					<td>null</td>
					<td>指定了使用拖拽方式来选择上传文件时的拖拽区域，即可以把文件拖拽到这个区域的方式来选择文件。该参数的值可以为一个DOM元素的id,也可是DOM元素本身，还可以是一个包括多个DOM元素的数组。如果不设置该参数则拖拽上传功能不可用。目前只有html5上传方式才支持拖拽上传。</td>
				</tr>
				<tr>
					<td>multi_selection</td>
					<td>Boolean</td>
					<td>true</td>
					<td>是否可以在文件浏览对话框中选择多个文件，true为可以，false为不可以。</td>
				</tr>
				<tr>
					<td>required_features</td>
					<td>Mix</td>
					<td>null</td>
					<td>可以使用该参数来设置你必须需要的一些功能特征，Plupload会根据你的设置来选择合适的上传方式。</td>
				</tr>
				<tr>
					<td>unique_names</td>
					<td>Boolean</td>
					<td>false</td>
					<td>当值为true时会为每个上传的文件生成一个唯一的文件名，并作为额外的参数post到服务器端，参数明为name,值为生成的文件名。</td>
				</tr>
				<tr>
					<td>file_data_name</td>
					<td>String</td>
					<td>file</td>
					<td>指定文件上传时文件域的名称。</td>
				</tr>
				<tr>
					<td>container</td>
					<td>DOM/String</td>
					<td>null</td>
					<td>用来指定Plupload所创建的html结构的父容器，默认为前面指定的browse_button的父元素。该参数的值可以是一个元素的id,也可以是DOM元素本身。</td>
				</tr>
				<tr>
					<td>flash_swf_url</td>
					<td>String</td>
					<td>js/Moxie.swf</td>
					<td>flash上传组件的url地址，如果是相对路径，则相对的是调用Plupload的html文档,当使用flash上传方式会用到该参数。</td>
				</tr>
				<tr>
					<td>silverlight_xap_url</td>
					<td>String</td>
					<td>js/Moxie.xap</td>
					<td>silverlight上传组件的url地址，如果是相对路径，则相对的是调用Plupload的html文档。当使用silverlight上传方式会用到该参数。</td>
				</tr>
			</tbody>
		</table>
		<h3>events</h3>
		<table class="table table-bordered">
			<thead>
				<tr>
					<th>名称</th>
					<th>说明</th>
					<th>监听函数参数</th>
					<th>参数说明</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>Init</td>
					<td>当plupload初始化完成后触发</td>
					<td>(up)</td>
					<td>up为当前的plupload实例对象</td>
				</tr>
				<tr>
					<td>PostInit</td>
					<td>当init事件发生后触发</td>
					<td>(up)</td>
					<td>up为当前的plupload实例对象</td>
				</tr>
				<tr>
					<td>OptionChanged</td>
					<td>当使用plupload实例的setOption()方法改变当前配置参数后触发</td>
					<td>(up,option_name,<br/>new_value,old_value)</td>
					<td>up为当前的plupload实例对象，option_name为发生改变的参数名称，new_value为改变后的值，old_value为改变前的值</td>
				</tr>
				<tr>
					<td>Refresh</td>
					<td>当调用plupload实例的refresh()方法后会触发该事件</td>
					<td>(up)</td>
					<td>up为当前的plupload实例对象</td>
				</tr>
				<tr>
					<td>StateChanged</td>
					<td>当上传队列的状态发生改变时触发</td>
					<td>(up)</td>
					<td>up为当前的plupload实例对象</td>
				</tr>
				<tr>
					<td>UploadFile</td>
					<td>当上传队列中某一个文件开始上传后触发</td>
					<td>(up,file)</td>
					<td>up为当前的plupload实例对象，file为触发此事件的文件对象</td>
				</tr>
				<tr>
					<td>BeforeUpload</td>
					<td>当队列中的某一个文件正要开始上传前触发</td>
					<td>(up,file)</td>
					<td>up为当前的plupload实例对象，file为触发此事件的文件对象</td>
				</tr>
				<tr>
					<td>QueueChanged</td>
					<td>当上传队列发生变化后触发，即上传队列新增了文件或移除了文件。QueueChanged事件会比FilesAdded或FilesRemoved事件先触发</td>
					<td>(up)</td>
					<td>up为当前的plupload实例对象</td>
				</tr>
				<tr>
					<td>UploadProgress</td>
					<td>会在文件上传过程中不断触发，可以用此事件来显示上传进度</td>
					<td>(up,file)</td>
					<td>up为当前的plupload实例对象，file为触发此事件的文件对象</td>
				</tr>
				<tr>
					<td>FilesRemoved</td>
					<td>当文件从上传队列移除后触发</td>
					<td>(up,files)</td>
					<td>up为当前的plupload实例对象，files为一个数组，里面的元素为本次事件所移除的文件对象</td>
				</tr>
				<tr>
					<td>FilesAdded</td>
					<td>当文件添加到上传队列后触发</td>
					<td>(up,files)</td>
					<td>up为当前的plupload实例对象，files为一个数组，里面的元素为本次添加到上传队列里的文件对象</td>
				</tr>
				<tr>
					<td>FileUploaded</td>
					<td>当队列中的某一个文件上传完成后触发</td>
					<td>(up,file,<br/>responseObject)</td>
					<td>up为当前的plupload实例对象，file为触发此事件的文件对象，responseObject为服务器返回的信息对象</td>
				</tr>
				<tr>
					<td>ChunkUploaded</td>
					<td>当使用文件小片上传功能时，每一个小片上传完成后触发</td>
					<td>(up,file,<br/>responseObject)</td>
					<td>up为当前的plupload实例对象，file为触发此事件的文件对象，responseObject为服务器返回的信息对象</td>
				</tr>
				<tr>
					<td>UploadComplete</td>
					<td>当上传队列中所有文件都上传完成后触发</td>
					<td>(up,files)</td>
					<td>up为当前的plupload实例对象，files为一个数组，里面的元素为本次已完成上传的所有文件对象</td>
				</tr>
				<tr>
					<td>Error</td>
					<td>当发生错误时触发</td>
					<td>(up,errObject)</td>
					<td>up为当前的plupload实例对象，errObject为错误对象</td>
				</tr>
				<tr>
					<td>Destroy</td>
					<td>当调用destroy方法时触发</td>
					<td>(up)</td>
					<td>up为当前的plupload实例对象</td>
				</tr>
			</tbody>
		</table>
		<h3>Methods</h3>
		<table class="table table-bordered">
			<thead>
				<tr>
					<th>名称</th>
					<th>描述</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>init()</td>
					<td>初始化Plupload实例</td>
				</tr>
				<tr>
					<td>start()</td>
					<td>开始上传队列中的文件</td>
				</tr>
				<tr>
					<td>refresh()</td>
					<td>刷新当前的plupload实例</td>
				</tr>
				<tr>
					<td>stop()</td>
					<td>停止队列中的文件上传</td>
				</tr>
				<tr>
					<td>unbindAll()</td>
					<td>移除所有事件的所有监听函数</td>
				</tr>
				<tr>
					<td>destroy()</td>
					<td>销毁plupload实例</td>
				</tr>
				<tr>
					<td>setOption(option, [value])</td>
					<td>设置某个特定的配置参数,option为参数名称，value为要设置的参数值</td>
				</tr>
				<tr>
					<td>getOption([option])</td>
					<td>获取当前的配置参数，参数option为需要获取的配置参数名称，如果没有指定option，则会获取所有的配置参数</td>
				</tr>
				<tr>
					<td>disableBrowse(disable)</td>
					<td>禁用或启用plupload的文件浏览按钮,参数disable为true时为禁用，为false时为启用。默认为true</td>
				</tr>
				<tr>
					<td>getFile(id)</td>
					<td>通过id来获取文件对象</td>
				</tr>
				<tr>
					<td>addFile(file, [fileName])</td>
					<td>向上传队列中添加文件，如果成功添加了文件，会触发FilesAdded事件</td>
				</tr>
				<tr>
					<td>removeFile(file)</td>
					<td>从上传队列中移除文件，参数file为plupload文件对象或先前指定的文件名称</td>
				</tr>
				<tr>
					<td>splice(start, length)</td>
					<td>从上传队列中移除一部分文件，start为开始移除文件在队列中的索引，length为要移除的文件的数量，该方法的返回值为被移除的文件。该方法会触发FilesRemoved 和QueueChanged事件</td>
				</tr>
				<tr>
					<td>trigger(name, Multiple)</td>
					<td>触发某个事件。name为要触发的事件名称，Multiple为传给该事件监听函数的参数，是一个对象</td>
				</tr>
				<tr>
					<td>hasEventListener(name)</td>
					<td>用来判断某个事件是否有监听函数，name为事件名称</td>
				</tr>
				<tr>
					<td>bind(name, func, scope)</td>
					<td>给某个事件绑定监听函数，name为事件名，func为监听函数，scope为监听函数的作用域，也就是监听函数中this的指向</td>
				</tr>
				<tr>
					<td>unbind(name, func)</td>
					<td>移除事件的监听函数，name为事件名称，func为要移除的监听函数</td>
				</tr>
			</tbody>
		</table>
	</div>
			
	<!-- 需要引用的JS -->
	<script type="text/javascript" src="../../dist/js/jquery.js"></script>
	<script type="text/javascript" src="../../dist/js/bootstrap.js"></script>  
	<script type="text/javascript" src="../../dist/js/form.js"></script>
	 <script type="text/javascript" src="../ZeroClipboard.min.js"></script>
    <script type="text/javascript" src="../prettify.js"></script>
	<script type="text/javascript">
	var context="<%=request.getContextPath()%>";
	$(function() {
		$("#inputfiles").on("click",function(){
			$("#inputpro").parent().hide(0,function(){
					$("#inputpro")[0].style.width = $("#inputpro")[0].innerText = 0 + "%";
				});
		})
		var uploader = new plupload.Uploader({
			//用来指定上传方式,指定多个上传方式请使用逗号隔开,默认即为此,可不写
			runtimes: 'html5,flash,silverlight,html4',
			//点击上传html标签的id,可以是a,button等
			browse_button: 'inputfiles',
			//服务器端的页面上传地址
			//url:context + '/upload',
			url: context+"/service/upload/upload",
			//文件的最大上传大小,不写该参数则上传文件大小无限制
			max_file_size: '50mb',
			//设置多项选择,默认为true,即可多选文件,功能为单选时需将此设为false
			multi_selection: false,
			//上传的文件生成一个唯一的文件名,默认为false,false时上传文件为本身的名字,true时自动生成名字
            unique_names: true,
            //可以使用该参数来限制上传文件的类型,大小等,该参数以对象的形式传入
            filters: [
                 {title: "Image files", extensions: "jpg,gif,png"}, 
                 {title: "Zip files", extensions: "zip"}
            ],
            //flash地址,swf文件,当需要使用swf方式进行上传时需要配置该参数
            flash_swf_url: '../../dist/js/Moxie.swf',
            //silverlight文件,当需要使用silverlight方式进行上传时需要配置该参数
            silverlight_xap_url: '../../dist/js/Moxie.xap',
            //当Plupload初始化完成后触发
            init: {
				BeforeUpload: function(){
					
					},
            	//当文件添加到上传队列后触发(up为当前的plupload实例对象,files为一个数组,里面的元素为本次添加到上传队列里的文件对象)
    			FilesAdded: function(up, files) {
    				plupload.each(files, function(file) {
    					/* document.getElementById('filelist').value = file.name; */
    					$("#filelist").empty().val(file.name);
						
    				});
    				//开始上传队列中的文件
    				uploader.start();
					
    			},
				//会在文件上传过程中不断触发,可以用此事件来显示上传进度(up当前的plupload实例对象,file为触发此事件的文件对象)
    			UploadProgress: function(up, file) {		
    				$("#inputpro").parent().show();
    				$("#inputpro")[0].style.width = $("#inputpro")[0].innerText = file.percent + "%";
    			}
    		}
		});
		//初始化Plupload实例
		uploader.init();
	});
	
	$(function() {
		var $r = $('#rpick');
		var uploader = new plupload.Uploader({
			runtimes: 'html5,flash,silverlight,html4',
			browse_button: 'rpickfiles',
			multi_selection: false,
			//url: context + '/upload',
			url: context+"/service/upload/upload",
			max_file_size: '50mb',
            unique_names: true,
            filters: [
                 {title: "Image files", extensions: "jpg,gif,png"}, 
                 {title: "Zip files", extensions: "zip"} 
            ],
            flash_swf_url: '../../dist/js/Moxie.swf',
            silverlight_xap_url: '../../dist/js/Moxie.xap',
            init: {
    			FilesAdded: function(up, files) {
    				//上传时的加载效果
    				$r.loading({
    					isShowMask: true,
    					lines: 10,
    					length: 8,
    					width: 5,
    					radius: 15
    				});
    				uploader.start();
    			},

    			UploadProgress: function(up, file) {
    				if (file.percent == 100) {
    					$r.unloading();//上传完毕
    					$("#rresult").empty().html("上传成功！");
    				}
    			},
    			//当发生错误时触发
    			Error: function(up, err) {
    				$("#rresult").empty().append(document.createTextNode("\nError #" + err.code + ": " + err.message));
    				/* document.getElementById('rresult').createElement.appendChild(document.createTextNode("\nError #" + err.code + ": " + err.message)); */
    			}
    		}
		});
		//初始化Plupload实例
		uploader.init();
	});
	
	$(function() {
		var uploader = new plupload.Uploader({
			runtimes: 'html5,flash,silverlight,html4',
			browse_button: 'cpickfiles',
			//url: context + '/upload',
			url: context+"/service/upload/upload",
			max_file_size: '50mb',
      unique_names: true,
      filters: [
           {title: "Image files", extensions: "jpg,gif,png"}, 
           {title: "Zip files", extensions: "zip"}
      ],
      flash_swf_url: '../../dist/js/Moxie.swf',
      silverlight_xap_url: '../../dist/js/Moxie.xap',
      init: {
    			FilesAdded: function(up, files) {
    				plupload.each(files, function(file) {
    					document.getElementById('cresult').innerHTML += '<div id="' + file.id + '">' + file.name + ' (' + plupload.formatSize(file.size) + ') <div class="progress"><div class="progress-bar"><span></span></div></div></div>';
    				});
    				uploader.start();
    			},

    			UploadProgress: function(up, file) {
    				$("#" + file.id).find('.progress-bar')[0].style.width = $("#" + file.id).find('.progress-bar')[0].innerText = file.percent + "%";
    			},
    			
    			Error: function(up, err) {
    				$("#cresult").empty().append(document.createTextNode("\nError #" + err.code + ": " + err.message));
    			}
    	}
		});
		uploader.init();
	});
	
	$(function() {
		$('#ui-uploader').pluploadQueue({
			runtimes: 'html5,flash,silverlight,html4',
			//url: context + '/upload',
			url: context+"/service/upload/upload",
			max_file_size: '50mb',
      unique_names: false,
      chunk_size : '10mb',
      filters: [
           {title: "Image files", extensions: "jpg,gif,png"}, 
           {title: "Zip files", extensions: "zip"}
      ],
      flash_swf_url: '../../dist/js/Moxie.swf',
      silverlight_xap_url: '../../dist/js/Moxie.xap'
		});
	});
   </script> 
  </body>
</html>
