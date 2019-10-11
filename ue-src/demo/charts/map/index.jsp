<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false" %>
<!DOCTYPE html>
<html lang="zh-CN">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>图表-地图</title>

    <!-- 需要引用的CSS -->
    <link rel="shortcut icon" href="../../../site.ico" />
	<link rel="stylesheet" type="text/css" href="../../../dist/skin/css/bootstrap.css" />
	<link rel="stylesheet" type="text/css" href="../../../dist/skin/css/font-awesome.css" />
	<link rel="stylesheet" type="text/css" href="../../../dist/skin/css/ui.css" />
	<link rel="stylesheet" type="text/css" href="../../../dist/skin/css/form.css" />
	<link rel="stylesheet" type="text/css" href="../../../dist/skin/css/chart.css" />
	<link rel="stylesheet" type="text/css" href="../../prettify.css"/>
	<style type="text/css">
		#map-container1 {
			height: 400px;
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
	<div class="ue-container">
		<div class="ue-map">
			<div class="ue-legend">
				<ul class="legend-content" id="legendContent">
				</ul>
			</div>
			<div class="ue-echarts-content">
				<div id="map-container1"></div>
			</div>
		</div>
	</div>
	
	
	<!-- 代码高亮 -->
	<div class="ue-container">
		<ul id="myTab" class="nav nav-tabs ue-tabs">
			<li class="active"><a href="#html" data-toggle="tab">HTML</a></li>
		</ul>
		<div id="myTabContent" class="tab-content" style="padding-top:20px">
			<div class="tab-pane active" id="html">
				<pre>
#map-container1 {
    height: 400px;
}

<div class="ue-map">
    <div class="ue-legend">
        <ul class="legend-content" id="legendContent">
        </ul>
    </div>
    <div class="ue-echarts-content">
        <div id="map-container1"></div>
    </div>
</div>
				</pre>
			</div>
		</div>
		<ul id="myTab" class="nav nav-tabs ue-tabs">
			<li class="active"><a href="#js" data-toggle="tab">JS</a></li>
		</ul>
		<div id="myTabContent" class="tab-content" style="padding-top:20px">
			<div class="tab-pane active" id="js">
				<pre>
				
var context="<%=request.getContextPath()%>";
$(document).ready(function(){
    var url = context + "/service/echarts/map";
    $("#map-container1").echarts({
        type: "map",
        paths: "../../../dist/js",
        url: url,
        xAxis: {name: "地区", value: "area"},
        yAxis: [{name: "访客数", value: "uv"}]
    });
});
				</pre>
			</div>
		</div>
	</div>
	<div class="ue-container">
		<h3>说明</h3>
		<p>本插件须引用的css文件：</p>
		<p><code>font-awesome.css</code>、<code>form.css</code>、<code>chart.css</code></p>
		<p>本插件须引用的js文件：</p>
		<p><code>jquery.js</code>、<code>form.js</code>、<code>echarts.js</code>、<code>jquery.echarts.js</code></p>
		<p>注：</p>
		<p>1.配置图表相应的DOM结构，其中，<code>.ue-map</code>用来定义柱状图容器，<code>.ue-legend</code>是配置相应的图例，<code>.ue-echarts-content</code>用来定义柱状图图形的容器</p>
		<p>2.在js中调用echarts()接口，在接口中配置相应的数据。</p>
		<p><code>必须说明一点必须先引入echarts.js文件</code></p>
		<br/>
		<h3>配置参数</h3>
		<br/>
		<h4>title</h4>
		<p style="color: #999">标题，每个图表最多仅有一个标题控件，每个标题控件可设主副标题。</p>
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
					<td>text</td>
					<td>String</td>
					<td>' '</td>
					<td>主标题文本，'\n'指定换行</td>
				</tr>
				<tr>
					<td>subtext</td>
					<td>String</td>
					<td>' '</td>
					<td>副标题文本，'\n'指定换行</td>
				</tr>
				<tr>
					<td>show</td>
					<td>Boolean</td>
					<td>true</td>
					<td>显示策略，可选为：true（显示） | false（隐藏）</td>
				</tr>
				<tr>
					<td>zlevel</td>
					<td>Number</td>
					<td>0</td>
					<td>一级层叠控制<br/>
						每一个不同的zlevel将产生一个独立的canvas，相同zlevel的组件或图标将在同一个canvas上渲染。<br/>
						zlevel越高越靠顶层，canvas对象增多会消耗更多的内存和性能，并不建议设置过多的zlevel，大部分情况可以通过二级层叠控制z实现层叠控制。
					</td>
				</tr>
				<tr>
					<td>z</td>
					<td>Number</td>
					<td>6</td>
					<td>二级层叠控制，同一个canvas（相同zlevel）上z越高约靠顶层。</td>
				</tr>
				<tr>
					<td>link</td>
					<td>String</td>
					<td>' '</td>
					<td>主标题文本超链接</td>
				</tr>
				<tr>
					<td>target</td>
					<td>String</td>
					<td>null</td>
					<td>指定窗口打开主标题超链接，支持'self' | 'blank'，不指定等同为'blank'（新窗口）</td>
				</tr>
				<tr>
					<td>target</td>
					<td>String</td>
					<td>null</td>
					<td>指定窗口打开主标题超链接，支持'self' | 'blank'，不指定等同为'blank'（新窗口）</td>
				</tr>
				<tr>
					<td>sublink</td>
					<td>String</td>
					<td>' '</td>
					<td>副标题文本超链接</td>
				</tr>
				<tr>
					<td>subtarget</td>
					<td>String</td>
					<td>null</td>
					<td>指定窗口打开副标题超链接，支持'self' | 'blank'，不指定等同为'blank'（新窗口）</td>
				</tr>
				<tr>
					<td>sublink</td>
					<td>String</td>
					<td>' '</td>
					<td>副标题文本超链接</td>
				</tr>
				<tr>
					<td>x</td>
					<td>String | Number</td>
					<td>'left'</td>
					<td>水平安放位置，默认为左侧，可选为：'center' | 'left' | 'right' | {number}（x坐标，单位px）</td>
				</tr>
				<tr>
					<td>y</td>
					<td>String | Number</td>
					<td>'top'</td>
					<td>垂直安放位置，默认为全图顶端，可选为：'top' | 'bottom' | 'center' | {number}（y坐标，单位px）</td>
				</tr>
				<tr>
					<td>textAlign</td>
					<td>String</td>
					<td>null</td>
					<td>水平对齐方式，默认根据x设置自动调整，可选为： left' | 'right' | 'center</td>
				</tr>
				<tr>
					<td>backgroundColor</td>
					<td>color</td>
					<td>'rgba(0,0,0,0)'</td>
					<td>标题背景颜色，默认透明</td>
				</tr>
				<tr>
					<td>borderColor</td>
					<td>String</td>
					<td>'#ccc'</td>
					<td>标题边框颜色</td>
				</tr>
				<tr>
					<td>borderWidth</td>
					<td>number</td>
					<td>0</td>
					<td>标题边框线宽，单位px，默认为0（无边框）</td>
				</tr>
				<tr>
					<td>padding</td>
					<td>number | Array</td>
					<td>5</td>
					<td>标题内边距，单位px，默认各方向内边距为5，接受数组分别设定上右下左边距，同css</td>
				</tr>
				<tr>
					<td>itemGap</td>
					<td>number</td>
					<td>5</td>
					<td>主副标题纵向间隔，单位px，默认为10</td>
				</tr>
				<tr>
					<td>textStyle</td>
					<td>Object</td>
					<td>{
					    fontSize: 18,
					    fontWeight: 'bolder',
					    color: '#333'
					}   </td>
					<td>主标题文本样式</td>
				</tr>
				<tr>
					<td>subtextStyle</td>
					<td>Object</td>
					<td>{color: '#aaa'}</td>
					<td>副标题文本样式</td>
				</tr>
			</tbody>
		</table>
		<h4>tooltip</h4>
		<p style="color: #999">提示框，鼠标悬浮交互时的信息提示。</p>
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
					<td>show</td>
					<td>boolean</td>
					<td>true</td>
					<td>是否显示，可选为：true（显示） | false（隐藏）</td>
				</tr>
				<tr>
					<td>showContent</td>
					<td>boolean</td>
					<td>true</td>
					<td>tooltip主体内容显示策略，只需tooltip触发事件或显示axisPointer而不需要显示内容时可配置该项为false，
                                                             可选为：true（显示） | false（隐藏）</td>
				</tr>
				<tr>
					<td>trigger</td>
					<td>string</td>
					<td>'item'</td>
					<td>触发类型，默认数据触发，见下图，可选为：'item' | 'axis'</td>
				</tr>
				<tr>
					<td>formatter</td>
					<td>string | Function</td>
					<td>null</td>
					<td>内容格式器：{string}（Template） | {Function}，支持异步回调</td>
				</tr>
				<tr>
					<td>showDelay</td>
					<td>number</td>
					<td>20</td>
					<td>显示延迟，单位ms</td>
				</tr>
				<tr>
					<td>hideDelay</td>
					<td>number</td>
					<td>100</td>
					<td>隐藏延迟，单位ms</td>
				</tr>
				<tr>
					<td>enterable</td>
					<td>boolean</td>
					<td>false</td>
					<td>鼠标是否可进入详情气泡中，默认为false，如需详情内交互，如添加链接，按钮，可设置为true。</td>
				</tr>
				<tr>
					<td>backgroundColor</td>
					<td>color</td>
					<td>'rgba(0,0,0,0.7)'</td>
					<td>提示背景颜色，默认为透明度为0.7的黑色</td>
				</tr>
				<tr>
					<td>borderColor</td>
					<td>string</td>
					<td>'#333'</td>
					<td>提示边框颜色</td>
				</tr>
				<tr>
					<td>borderRadius</td>
					<td>number</td>
					<td>4</td>
					<td>提示边框圆角，单位px，默认为4</td>
				</tr>
				<tr>
					<td>borderWidth</td>
					<td>number</td>
					<td>0</td>
					<td>提示边框线宽，单位px，默认为0（无边框）</td>
				</tr>
				<tr>
					<td>padding</td>
					<td>number | Array</td>
					<td>5</td>
					<td>提示内边距，单位px，默认各方向内边距为5，接受数组分别设定上右下左边距，同css</td>
				</tr>
				<tr>
					<td>textStyle</td>
					<td>Object</td>
					<td>{ color:'#fff' }</td>
					<td>文本样式，默认为白色字体</td>
				</tr>
				<tr>
					<td>axisPointer</td>
					<td>Object</td>
					<td>{
    type: 'line',
    lineStyle: {
        color: '#48b',
        width: 2,
        type: 'solid'
    },
    crossStyle: {
        color: '#1e90ff',
        width: 1,
        type: 'dashed'
    },
    shadowStyle: {
        color: 'rgba(150,150,150,0.3)',
        width: 'auto',
        type: 'default'
    }
} </td>
					<td>坐标轴指示器，默认type为line，可选为：'line' | 'cross' | 'shadow' | 'none'(无)，指定type后对应style生效 
lineStyle设置直线指示器, 
crossStyle设置十字准星指示器, 
shadowStyle设置阴影指示器，areaStyle.size默认为'auto'自动计算，可指定具体宽度</td>
				</tr>
			</tbody>
		</table>
		<br/>
		<h4>dataRange</h4>
		<p style="color: #999">值域选择，每个图表最多仅有一个值域控件。</p>
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
					<td>show</td>
					<td>boolean</td>
					<td>true</td>
					<td>显示策略，可选为：true（显示） | false（隐藏）</td>
				</tr>
				<tr>
					<td>min</td>
					<td>number</td>
					<td>null</td>
					<td>指定的最小值，eg: 0，默认无，必须参数，唯有指定了splitList时可缺省min。</td>
				</tr>
				<tr>
					<td>max</td>
					<td>number</td>
					<td>null</td>
					<td>指定的最大值，eg: 100，默认无，必须参数，唯有指定了splitList时可缺省max</td>
				</tr>
				<tr>
					<td>x</td>
					<td>string | number</td>
					<td>'left'</td>
					<td>水平安放位置，默认为全图左对齐，可选为：'center' | 'left' | 'right' | {number}（x坐标，单位px）</td>
				</tr>
				<tr>
					<td>y</td>
					<td>string | number</td>
					<td>'bottom'</td>
					<td>垂直安放位置，默认为全图底部，可选为：'top' | 'bottom' | 'center' | {number}（y坐标，单位px）</td>
				</tr>
				<tr>
					<td>orient</td>
					<td>string</td>
					<td>'vertical'</td>
					<td>布局方式，默认为垂直布局</td>
				</tr>
				<tr>
					<td>text</td>
					<td>Array</td>
					<td>null</td>
					<td>值域文字显示，splitNumber生效时默认以计算所得数值作为值域文字显示，可指定长度为2的文本数组显示简介的值域文本，如['高', '低']，'\n'指定换行</td>
				</tr>
				<tr>
					<td>calculable</td>
					<td>boolean</td>
					<td>false</td>
					<td>是否启用值域漫游，启用后无视splitNumber和splitList，值域显示为线性渐变</td>
				</tr>
			</tbody>
		</table>
		<br/>
		<h4>toolbox</h4>
		<p style="color: #999">工具箱</p>
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
					<td>show</td>
					<td>boolean</td>
					<td>false</td>
					<td>显示策略</td>
				</tr>
				<tr>
					<td>orient</td>
					<td>string</td>
					<td>'horizontal'</td>
					<td>布局方式</td>
				</tr>
				<tr>
					<td>x</td>
					<td>string | number</td>
					<td>'right'</td>
					<td>水平安放位置，默认为全图居中，可选为：'center' | 'left' | 'right' | {number}（x坐标，单位px）</td>
				</tr>
				<tr>
					<td>y</td>
					<td>string | number</td>
					<td>'top'</td>
					<td>垂直安放位置，默认为全图顶端，可选为：'top' | 'bottom' | 'center' | {number}（y坐标，单位px）</td>
				</tr>
			</tbody>
		</table>
		<br/>
		<h4>roamController</h4>
		<p style="color: #999">缩放漫游组件</p>
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
					<td>show</td>
					<td>boolean</td>
					<td>true</td>
					<td>显示策略</td>
				</tr>
				<tr>
					<td>x</td>
					<td>string | number</td>
					<td>'left'</td>
					<td>水平安放位置，默认为左侧，可选为：'center' | 'left' | 'right' | {number}（x坐标，单位px）</td>
				</tr>
				<tr>
					<td>y</td>
					<td>string | numbe</td>
					<td>'top'</td>
					<td>垂直安放位置，默认为全图顶端，可选为：'top' | 'bottom' | 'center' | {number}（y坐标，单位px）</td>
				</tr>
				<tr>
					<td>mapTypeControl</td>
					<td>Object</td>
					<td>null</td>
					<td>必须，指定漫游组件可控地图类型，如：{ china: true }
当同一图表内同时呈现多个地图时，可以单独指定所需控制地图类型，如：{ china: false, '北京': true}</td>
				</tr>
			</tbody>
		</table>
		<h4>series(地图)</h4>
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
					<td>mapType</td>
					<td>string</td>
					<td>'china'</td>
					<td>地图类型，支持world，china及全国34个省市自治区。省市自治区的mapType直接使用简体中文： 
新疆， 西藏， 内蒙古， 青海， 四川， 黑龙江， 甘肃， 云南， 广西， 湖南， 陕西， 
广东，吉林， 河北， 湖北， 贵州， 山东， 江西， 河南， 辽宁， 山西， 安徽， 福建， 
浙江， 江苏，重庆， 宁夏， 海南， 台湾， 北京， 天津， 上海， 香港， 澳门' 
支持子区域模式，通过主地图类型扩展出所包含的子区域地图，格式为'主地图类型|子区域名称'，如 
'world|Brazil'，'china|广东'</td>
				</tr>
				<tr>
					<td>mapLocation</td>
					<td>Object</td>
					<td>{x:'center',y:'center'}</td>
					<td>地图位置设置，默认只适应上下左右居中可配x，y，width，height，任意参数为空都将根据其他参数自适应</td>
				</tr>
				<tr>
					<td>roam</td>
					<td>boolean | string</td>
					<td>false</td>
					<td>是否开启滚轮缩放和拖拽漫游，默认为false（关闭），其他有效输入为true（开启），'scale'（仅开启滚轮缩放），'move'（仅开启拖拽漫游）</td>
				</tr>
			</tbody>
		</table>
		<h4>series(通用)</h4>
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
					<td>type</td>
					<td>string</td>
					<td>null</td>
					<td>图表类型，必要参数！如为空或不支持类型，则该系列数据不被显示。可选为： 
'line'（折线图） | 'bar'（柱状图） | 'scatter'（散点图） | 'k'（K线图） 
'pie'（饼图） | 'radar'（雷达图） | 'chord'（和弦图） | 'force'（力导向布局图） | 'map'（地图）</td>
				</tr>
				<tr>
					<td>name</td>
					<td>string</td>
					<td>null</td>
					<td>系列名称，如启用legend，该值将被legend.data索引相关</td>
				</tr>
				<tr>
					<td>itemStyle</td>
					<td>Object</td>
					<td>null</td>
					<td>图形样式</td>
				</tr>
				<tr>
					<td>data</td>
					<td>Array</td>
					<td>[]</td>
					<td>数据</td>
				</tr>
			</tbody>
		</table>
	</div>
    <!-- 需要引用的JS -->
    <script type="text/javascript" src="../../../dist/js/jquery.js"></script>
	<script type="text/javascript" src="../../../dist/js/bootstrap.js"></script>
	<script type="text/javascript" src="../../../dist/js/form.js"></script>
	<script type="text/javascript" src="../../ZeroClipboard.min.js"></script>
	<script type="text/javascript" src="../prettify.js"></script>
	<script type="text/javascript" src="../../../dist/js/arttemplate.js"></script>
	<script type="text/javascript" src="../../../dist/js/echarts.js"></script>
	<script type="text/javascript" src="../../../dist/js/jquery.echarts.js"></script>
	
	
	<script type="text/javascript">
	var context="<%=request.getContextPath()%>";
	$(document).ready(function(){
		var url = context + "/service/echarts/map";
		$("#map-container1").echarts({
			type: "map",
			paths: "../../../dist/js",
			url: url,
			xAxis: {name: "地区", value: "area"},
			yAxis: [{name: "访客数", value: "uv"}]
		});
	});
	</script>
  </body>
</html>