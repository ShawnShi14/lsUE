// the semi-colon before function invocation is a safety net against concatenated
// scripts and/or other plugins which may not be closed properly.
;( function( $, window, document, undefined ) {

	"use strict";

		// undefined is used here as the undefined global variable in ECMAScript 3 is
		// mutable (ie. it can be changed by someone else). undefined isn't really being
		// passed in so we can ensure the value of it is truly undefined. In ES5, undefined
		// can no longer be modified.

		// window and document are passed through as local variables rather than global
		// as this (slightly) quickens the resolution process and can be more efficiently
		// minified (especially when both are regularly referenced in your plugin).

		// Create the defaults once
		var pluginName = "echarts",
			defaults = {
				type: "bar",
				options: {
					'bar': {
				    	grid: {
							x: 40, //直角坐标系左上角横坐标
							y: 30, //直角坐标系左上角纵坐标
							x2: 40, //直角坐标系右上角横坐标
							y2: 60 //直角坐标系右上角纵坐标
						},
						legend: {
							show: false,
							data: []
						},
						color:[],
						tooltip: {},
						xAxis: [
						    {   
						    	splitLine: {
						    		show: false
						    	},
						    	data:[],
						    	name: ""
						    }
						],
						yAxis: [
						    {
						    	splitLine: {
						    		lineStyle: {
						    			type: 'dashed'
						    		}
						    	},
						    	data:[],
						    	name: ""
						    },{
						    	data:[],
						    	name: ""
						    }
						],
						series:[]
				    },
				    'line': {
				    	grid: {
				    		x: 40, //直角坐标系左上角横坐标
							y: 30, //直角坐标系左上角纵坐标
							x2: 40, //直角坐标系右上角横坐标
							y2: 60 //直角坐标系右上角纵坐标
						},
						tooltip: {},
						legend: {
							show: false,
							data: []
						},
						xAxis: [
							{   
								splitLine: {
							    	show: false
							    },
							    data:[],
							    name: ""
							}
						],
						yAxis: [
						    {
								splitLine: {
									lineStyle: {
								    	type: 'dashed'
								    }
								},
								data:[],
								name: ""
						    },{
								data:[],
								name: ""
						    }
						],
						series:[]
				    },
				    'pie': {
				    	tooltip: {},
				    	calculable: true,
				    	legend: {
				    		show: false,
				    	    orient : 'vertical',
				    	    x : 'left',
				    	    data:[]
				    	 },
				    	series:[]
				    },
				    'map': {
				    	 tooltip : {
			    		     trigger: 'item'
			    		 },
			    		 legend: {
			    			 show: false,
			    		     orient: 'vertical',
			    		     x:'left',
			    		     data:[]
			    		 },
			    		 dataRange: {
			    		        min: 0,
			    		        max: 2500,
			    		        x: 'left',
			    		        y: 'center',
			    		        splitNumber : 5,
			    		        text: ['高','低'],// 文本，默认为数值文本
			    		        calculable : true
			    		 },
			    		 series:[]
				    },
				    'radar': {
				    	polar: [],
				    	calculable: true,
				    	series: []
				    },
				    'gauge': {
				    	tooltip: {},
				    	series:[{
				    		name:'业务指标',
				            type:'gauge',
				            splitNumber: 10,       // 分割段数，默认为5
				            axisLine: {            // 坐标轴线
				                lineStyle: {       // 属性lineStyle控制线条样式
				                    color: [[0.2, '#228b22'],[0.8, '#48b'],[1, '#ff4500']], 
				                    width: 8
				                }
				            },
				            axisTick: {            // 坐标轴小标记
				                splitNumber: 10,   // 每份split细分多少段
				                length :12,        // 属性length控制线长
				                lineStyle: {       // 属性lineStyle控制线条样式
				                    color: 'auto'
				                }
				            },
				            axisLabel: {           // 坐标轴文本标签，详见axis.axisLabel
				                textStyle: {       // 其余属性默认使用全局文本样式，详见TEXTSTYLE
				                    color: 'auto'
				                }
				            },
				            splitLine: {           // 分隔线
				                show: true,        // 默认显示，属性show控制显示与否
				                length :30,         // 属性length控制线长
				                lineStyle: {       // 属性lineStyle（详见lineStyle）控制线条样式
				                    color: 'auto'
				                }
				            },
				            pointer : {
				                width : 5
				            },
				            title : {
				                show : true,
				                offsetCenter: [0, '-40%'],       // x, y，单位px
				                textStyle: {       // 其余属性默认使用全局文本样式，详见TEXTSTYLE
				                    fontWeight: 'bolder'
				                }
				            },
				            detail : {
				                formatter:'{value}%',
				                textStyle: {       // 其余属性默认使用全局文本样式，详见TEXTSTYLE
				                    color: 'auto',
				                    fontWeight: 'bolder'
				                }
				            },
				            data: []
				    	}]
				    }
				}
		    };
		// The actual plugin constructor
		function Plugin ( element, settings, options) {
			this.element = element;

			// jQuery has an extend method which merges the contents of two or
			// more objects, storing the result in the first object. The first object
			// is generally empty as we don't want to alter the default options for
			// future instances of the plugin
			this.options = options || {};
			this.settings = $.extend( {}, defaults, settings);
			this._defaults = defaults;
			this._name = pluginName;
			this.init();
		}

		// Avoid Plugin.prototype conflicts
		$.extend( Plugin.prototype, {
			init: function() {
				// Place initialization logic here
				// You already have access to the DOM element and
				// the options via the instance, e.g. this.element
				// and this.settings
				// you can add more functions like the one below and
				// call them like the example below
				
				var that = this;
				require.config({
					paths: {
						echarts: this.settings['paths']
					}
				});
				
				require(
				    [
				        'echarts',
				        'echarts/chart/' + this.settings['type']
				    ], 
				    function(ec) {
				    	that.initChart(ec);
				    }
				);
			},
			
			getOption: function(type) {
				return $.extend(true, {}, this.settings['options'][type]);
			},
			
			initChart: function( ec ) {
				var that = this;
				var myChart = ec.init(that.element);
				myChart.showLoading({
					text: '正在努力的读取数据中...'
				});
				
				if(!$.isEmptyObject(that.options)) {
					myChart.hideLoading();
					myChart.setOptions(that.options);
					return;
				}
				
				// 获取默认配置
				var options = that.getOption(that.settings['type']);
				$.ajax({
					url: that.settings['url'],
					success: function(result) {
						myChart.hideLoading();
						if(result.msg === 'success') {
							var data = result['data'];
							if(that.settings['type'] === 'bar' || that.settings['type'] === 'line') {
								for(var i = 0, len = data.length; i < len; i++) {
									options.xAxis[0].data.push(data[i][that.settings['xAxis'].value]);//
								}
								var yAxis = that.settings['yAxis'];
								for(var j = 0, len = yAxis.length; j < len; j++) {
									var temp = $.map(data, function(item) {
										return item[yAxis[j].value];
									});
									
									var item = {
										name: yAxis[j].name,
										type: that.settings['type'],
										yAxisIndex: j,
										data: temp
									};
									options.yAxis[j].name =  yAxis[j].name;
									options.legend.data.push(yAxis[j].name);
									options.series.push(item);
								}
								options.xAxis[0].name = that.settings['xAxis'].name;
							} else if(that.settings['type'] === 'pie'){
								for(var i = 0, len = data.length; i < len; i++) {
									options.legend.data.push(data[i][that.settings['xAxis'].value]);
								}
								var item = {
									name : that.settings['xAxis'].value,
									type: 'pie',
									radius: '55%',
									center: ['50%', '50%'],
									data: (function() {
										var temp = [];
										for(var i = 0, len = data.length; i < len; i++) {
											temp.push({
												value: data[i][that.settings['yAxis'].value],
												name: data[i][that.settings['xAxis'].value]
											});
										}
										return temp;
									})()
								}
								options.series.push(item);
							} else if(that.settings['type'] === 'radar') {
								var dataX = [];
								for(var i = 0, len = data.length; i < len; i++) {
									dataX.push({
										text: data[i][that.settings['xAxis'].value],
										max: 1000//有问题，是根据每一个字段的最大值设定的
									});
								}
								options.polar.push({
									indicator: dataX
								});
								var item = {
									type: 'radar',
									data: (function() {
										var temp = [];
										for(var i = 0, len = data.length; i < len; i++) {
											temp.push(data[i][that.settings['yAxis'].value]);
										}
										return [
										    {
											    name: that.settings['yAxis'].name,
											    value: temp
										    }
										];
									})()
								};
								options.series.push(item);
							} else if(that.settings['type'] === 'gauge') {
								var item = {
									name: that.settings['yAxis'].name,
									value: data[0][that.settings['yAxis'].value]
								}
								options.series[0].data.push(item);
							} else if(that.settings['type'] === 'funnel') {
								
							} else if(that.settings['type'] === 'scatter') {
								
							} else if(that.settings['type'] === 'map') {
								var yAxis =  that.settings['yAxis'];
								for(var i = 0, len = yAxis.length; i < len; i++) {
									var temp = [];
									for(var j = 0, leng = data.length; j < leng; j++) {
										var temp_item = {
											name: data[j][that.settings['xAxis'].value],
				    		        		value: data[j][yAxis[i].value]
										}
										temp.push(temp_item);
									}
									var item = {
										name:  yAxis[i].name,
										type: 'map',
										mapType: 'china',
										mapLocation: {
					    		            y: 'center',
					    		            height: 300
					    		        },
					    		        itemStyle:{
					    		            normal:{label:{show:true}},
					    		            emphasis:{label:{show:true}}
					    		        },
					    		        data: temp
									}
									options.legend.data.push(yAxis[i].name);
									options.series.push(item);
								}
								
							}
							myChart.setOption(options);
							//新定义图例
								var legendDatas = options.legend.data;
								for(var l = 0; l < legendDatas.length; l++){
									var $color = myChart.component.legend.getColor(legendDatas[l]);
									var html = '<li><span class="legend-icon" style="background-color:'+$color+'">'+
									'<i class="fa fa-pencil"></i>'+
									'</span>'+
									'<span class="legend-title" title='+legendDatas[l]+'>'+legendDatas[l]+'</span>'+
									'</li>';
									$("#legendContent").append(html);
									//地图图表初次加载的时候图例点添加颜色
									if (that.settings['type'] === 'map') {
										myChart.component.legend.setColor(legendDatas[l], $color);
										myChart.refresh();
									}
								}
								//图例的位置
								var width = $("#legendContent").width();
								var height = $("#legendContent").height();
								$(".ue-legend ul").css("margin-left",-width/1.3+"px");
								$(".ue-legend").css("height", height + "px");
								//图例换颜色
								$(".legend-icon").colorpicker(function(el,color){
									$(el).css("backgroundColor",color);
									var $content = $(el).parent().find(".legend-title").text();
									myChart.component.legend.setColor($content,color);
									myChart.refresh();
								});
							//图例开关
							$(document).on("click","ul li .legend-title",function(){
								var isSelected = myChart.component.legend.isSelected($(this).text()); 
								var _that = $(this);
								var ydata = options.yAxis;
								if(isSelected) {
									myChart.component.legend.setSelected(_that.text(),false);
									_that.addClass("legend-select");
									//将图例关掉后坐标轴标题去掉
									if(that.settings['type'] === "bar" || that.settings['type'] == "line"){
										if(ydata.length == 1){
											$("#yAxis-title-left").css("display","none");
										}else {
											var leftTitle = $("#yAxis-title-left .ue-axis-title").text();
											var rightTitle = $("#yAxis-title-right .ue-axis-title").text();
											if(leftTitle == _that.text()) {
												$("#yAxis-title-left").css("display","none");
											}else if (rightTitle == _that.text()) {
												$("#yAxis-title-right").css("display","none");
											}
										}
									}
								}else {
									myChart.component.legend.setSelected(_that.text(),true);
									_that.removeClass("legend-select");
									if(ydata.length == 1){
										$("#yAxis-title-left").css("display","block");
									}else {
										$("#yAxis-title-left").css("display","block");
										$("#yAxis-title-right").css("display","block");
									}
								}
							});
							
							if(that.settings['type'] === "bar" || that.settings['type'] == "line") {
								//自定义y轴标题
								var $yAxisData = options.yAxis;
								var gridData = options.grid;
								var yAxisData = [];
								for(var i = 0; i < $yAxisData.length; i++) {
									yAxisData.push($yAxisData[i].name);
								}
								//应为echart只支持两个以内的纵坐标轴（y轴按最多两个分析）
								if(yAxisData.length == 1) {
									var yaxis = '<div class="ue-yaxis" id="yAxis-title-left" style="position: absolute; top:'+gridData.y+'px; left:'+gridData.x+'px"></div>';
									$(".ue-echarts-content").append(yaxis);
									var ytitle = '<span class="ue-axis-title">' + yAxisData[0] + '<i class="fa fa-pencil"></i></span>'+
												'<div class="new-title" style="display: none">'+
												'<label>标题：<input type="text" class="title-change-input" value="' + yAxisData[0] + '" placeholder="标题名"/></label>'+
												'</div>';
									$("#yAxis-title-left").append(ytitle);
									options.yAxis[0].name = "";
								}else if(yAxisData.length > 1) {
									var yaxis_left = '<div class="ue-yaxis" id="yAxis-title-left" style="position: absolute; top:'+gridData.y+'px; left:'+Number(gridData.x-55)+'px"></div>';
									$(".ue-echarts-content").append(yaxis_left);
									var ytitle_left = '<span class="ue-axis-title">' + yAxisData[0] + '<i class="fa fa-pencil"></i></span>'+
														'<div class="new-title" style="display: none">'+
														'<label>标题：<input type="text" class="title-change-input" data-index="0" value="' + yAxisData[0] + '" placeholder="标题名"/></label>'+
														'</div>';
									$("#yAxis-title-left").append(ytitle_left);
									var yaxis_right = '<div class="ue-yaxis" id="yAxis-title-right" style="position: absolute; top:'+gridData.y+'px; right:'+Number(gridData.x2-57)+'px"></div>';
									$(".ue-echarts-content").append(yaxis_right);
									var ytitle_right = '<span class="ue-axis-title">' + yAxisData[1] + '<i class="fa fa-pencil"></i></span>'+
														'<div class="new-title" style="display: none">'+
														'<label>标题：<input type="text" class="title-change-input" data-index="1" value="' + yAxisData[1] + '" placeholder="标题名"/></label>'+
														'</div>';
									$("#yAxis-title-right").append(ytitle_right);
									
									//将y轴原有的标题去掉
									$yAxisData[0].name = "";
									$yAxisData[1].name = "";
								}
								//自定义x轴标题(按只有一个横坐标)
								var $xAxisData = options.xAxis;
								var xAxis = '<div class="ue-xaxis" style="position: absolute; bottom:'+Number(gridData.y2-23)+'px; left:'+Number(gridData.x-30)+'px"></div>';
								$(".ue-echarts-content").append(xAxis);
								var xtitle = '<span class="ue-axis-title">' + $xAxisData[0].name + '</span>';
								$(".ue-xaxis").append(xtitle);
								
								//将x轴原有的标题去掉
								$xAxisData[0].name = "";
								
								//去掉自带的标题
								myChart.setOption(options);
								
								//点击修改符号弹出修改框
								$(document).on("click", ".ue-axis-title .fa.fa-pencil", function(){
									$(this).parent().next().css("display","block");
								});
								//修改y轴标题
								$(document).on("change", ".title-change-input", function(){
									var $that = $(this);
									var oddTitle = $that.parents(".ue-yaxis").find(".ue-axis-title").text();
									var newTitle = $that.val();
									var index = $that.data("index");
									if(newTitle.length > 20){
										$.sticky(
											"坐标轴标题不能大于20个字符",
											{
											    style : 'warning',
											    autoclose : 2000,
											    position : 'center'
										});
										$that.val(oddTitle);
										return false;
									}
									$yAxisData[index].name = newTitle;
									$that.parents(".new-title").prev().html(newTitle+'<i class="fa fa-pencil"></i>');
								});
								//关闭修改符号弹出窗口
								$(document).on("mouseleave", ".new-title", function(){
									$(this).css("display","none");
								});
							}
							
						} else {
							console.log("加载数据出错");
						}
					}
				});
				
				$(window).resize(function() {
					myChart.resize();
				})
			}
		} );

		// A really lightweight plugin wrapper around the constructor,
		// preventing against multiple instantiations
		$.fn[ pluginName ] = function(options) {
			return this.each( function() {
				if ( !$.data( this, "plugin_" + pluginName ) ) {
					$.data( this, "plugin_" +
						pluginName, new Plugin( this, options) );
				}
			} );
		};

} )( jQuery, window, document );
