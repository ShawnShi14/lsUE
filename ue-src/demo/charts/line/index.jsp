<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>图表-折线图</title>
<!-- 需要引用的CSS -->
<link rel="shortcut icon" href="../../../site.ico" />
<link rel="stylesheet" type="text/css" href="../../../dist/skin/css/bootstrap.css" />
<link rel="stylesheet" type="text/css" href="../../../dist/skin/css/font-awesome.css" />
<link rel="stylesheet" type="text/css" href="../../../dist/skin/css/ui.css" />
<link rel="stylesheet" type="text/css" href="../../../dist/skin/css/form.css" />
<link rel="stylesheet" type="text/css" href="../../../dist/skin/css/chart.css" />
<link rel="stylesheet" type="text/css" href="../../prettify.css" />
<style>
	#line-container1 {
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
		<div class="ue-line">
			<div class="ue-legend">
				<ul class="legend-content" id="legendContent">
				</ul>
			</div>
			<div class="ue-echarts-content">
				<div id="line-container1"></div>
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
#line-container1 {
    height: 400px;
}

<div class="ue-line">
    <div class="ue-legend">
        <ul class="legend-content" id="legendContent">
        </ul>
    </div>
    <div class="ue-echarts-content">
        <div id="line-container1"></div>
    </div>
</div>
				</pre>
			</div>
		</div>
		<ul id="myTab" class="nav nav-tabs ue-tabs">
			<li class="active"><a href="#html" data-toggle="tab">JS</a></li>
		</ul>
		<div id="myTabContent" class="tab-content" style="padding-top:20px">
			<div class="tab-pane active" id="js">
				<pre>
				
var context="<%=request.getContextPath()%>";
$(document).ready(function(){
    var url = context + "/service/echarts/line";
    $("#line-container1").echarts({
        type: "line",
        paths: "../../../dist/js",
        url: url,
        xAxis: {name: "月份", value: "month"},
        yAxis: [{name: "降水量", value: "volume1"},{name: "蒸发量", value: "volume2"}]
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
		<p>1.配置图表相应的DOM结构，其中，<code>.ue-line</code>用来定义柱状图容器，<code>.ue-legend</code>是配置相应的图例，<code>.ue-echarts-content</code>用来定义柱状图图形的容器</p>
		<p>2.在js中调用echarts()接口，在接口中配置相应的数据。</p>
		<p><code>必须说明一点必须先引入echarts.js文件</code></p>
		<br/>
		<h3>配置参数</h3>
		<br/>
		<h4>title</h4>
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
					<td>{
    color: '#aaa'
}   </td>
					<td>副标题文本样式</td>
				</tr>
			</tbody>
		</table>
		<h4>legend</h4>
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
					<td>data</td>
					<td>Array</td>
					<td>[]</td>
					<td>图例内容数组，数组项通常为{string}，每一项代表一个系列的name，默认布局到达边缘会自动分行（列），传入空字符串''可实现手动分行（列）。 
						使用根据该值索引series中同名系列所用的图表类型和itemStyle，如果索引不到，该item将默认为没启用状态。 
						如需个性化图例文字样式，可把数组项改为{Object}，指定文本样式和个性化图例icon，格式为 
						{
						  name : {string}, 
						  textStyle : {Object}, 
						  icon : {string}
						}
					</td>
				</tr>
			</tbody>
		</table>
		<h4>series</h4>
		<h4>驱动图表生成的数据内容数组，数组中每一项为一个系列的选项及数据，其中个别选项仅在部分图表类型中有效，请注意适用类型：</h4>
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
					<td>String</td>
					<td>null</td>
					<td>图表类型，必要参数！如为空或不支持类型，则该系列数据不被显示。可选为： 
						'line'（折线图） | 'bar'（柱状图） | 'scatter'（散点图） | 'k'（K线图） 
						'pie'（饼图） | 'radar'（雷达图） | 'chord'（和弦图） | 'force'（力导向布局图） | 'map'（地图）
					</td>
				</tr>
				<tr>
					<td>name</td>
					<td>String</td>
					<td>null</td>
					<td>系列名称，如启用legend，该值将被legend.data索引相关</td>
				</tr>
				<tr>
					<td>data</td>
					<td>Array</td>
					<td>[]</td>
					<td>数据(详见<a href="#SeriesData" title="">series.data</a>)</td>
				</tr>
			</tbody>
		</table>
		<h5>series.data<a name="SeriesData"></a></h5>
		<p> 系列中的数据内容数组，折线图以及柱状图时数组长度等于所使用类目轴文本标签数组axis.data的长度，并且他们间是一一对应的。数组项通常为数值，如:</p>
		<div class="code">
           <pre>[12, 34, 56, ..., 10, 23]</pre>
        </div>
        <p> 当某类目对应数据不存在时（ps：'不存在' 不代表值为 0），可用'-'表示，无数据在折线图中表现为折线在该点断开，在柱状图中表现为该点无柱形，如：</p>
        <div class="code">
            <pre>[12, '-', 56, ..., 10, 23]</pre>
        </div>
        <p> 当需要对个别内容进行个性化定义时，数组项可用对象，如：</p>
        <div class="code">
                        <pre>[
    12, 34,
    {
        value : 56,
        tooltip:{},             //自定义特殊tooltip，仅对该item有效，详见tooltip
        itemStyle:{}            //自定义特殊itemStyle，仅对该item有效，详见itemStyle
    },
    ..., 10, 23
]
</pre>
                    </div>
          <p> 当图表类型为scatter（散点图或气泡图）时，其数值设置比较特殊，他的横纵坐标轴都可能为数值型，并且气泡图时需要指定气泡大小，所以scatter型图表设置为：</p>
          <div class="code">
                        <pre>[
    {
        value : [10, 25, 5]     //[xValue, yValue, rValue]，数组内依次为横值，纵值，大小(可选)
    },
    [12, 15, 1]
    ...
]
</pre>
           </div>
           <p> 当图表类型为K线图时，其数值设置比较特殊，他的数值内容为长度为4的数组，分别代表[开盘价，收盘价，最低值，最高值]</p>
           <div class="code">
                        <pre>[
    {
        value : [2190.1, 2148.35, 2126.22, 2190.1] // // 开盘，收盘，最低，最高
    },
    [2242.26, 2210.9, 2205.07, 2250.63],
    ...
]
</pre>
            </div>
            <p> 当图表类型为饼图时，需要说明每部分数据的名称name，可设置选中状态，所以设置为：</p>
            <div class="code">
                        <pre>[
    {
        value : 12，
        name : 'apple'          //每部分数据的名称
    },
    ...
]
</pre>
             </div>
             <p> 当图表类型为地图时，需要说明每部分数据对应的省份，可设置选中状态，所以设置为：</p>
             <div class="code">
                        <pre>[
    {
        name: '北京',
        value: 1234,
        selected: true
    },
    {
        name: '天津',
        value: 321
    },
    ...
]
</pre>
              </div>
	</div>
	<!-- 需要引用的JS -->
	<script type="text/javascript" src="../../../dist/js/jquery.js"></script>
	<script type="text/javascript" src="../../../dist/js/bootstrap.js"></script>
	<script type="text/javascript" src="../../../dist/js/arttemplate.js"></script>
	<script type="text/javascript" src="../../../dist/js/form.js"></script>
	<script type="text/javascript" src="../../ZeroClipboard.min.js"></script>
	<script type="text/javascript" src="../prettify.js"></script>
	<script type="text/javascript" src="../../../dist/js/echarts.js"></script>
	<script type="text/javascript" src="../../../dist/js/jquery.echarts.js"></script>
	<script type="text/javascript">
	var context="<%=request.getContextPath()%>";
	$(document).ready(function(){
		var url = context + "/service/echarts/line";
		$("#line-container1").echarts({
			type: "line",
			paths: "../../../dist/js",
			url: url,
			xAxis: {name: "月份", value: "month"},
			yAxis: [{name: "降水量", value: "volume1"},{name: "蒸发量", value: "volume2"}]
		});
	});
   </script>
	
</body>
</html>