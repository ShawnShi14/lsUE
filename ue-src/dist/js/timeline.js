;(function($, window, document, undefined) {
  "use strict";
  var pluginName = "timeline";
  var defaults = {
          brush: "#008cdc",
          MAX_BARS: 30,
          NAVIGATOR_HEIGHT: 30,
          NAVIGATOR_MARGIN_TOP: 30,
          margin: {
              top: 5, 
              right: 5, 
              bottom: 5, 
              left: 30
          }
      };
  var SECONDS_BY_DAY = 1000 * 60 * 60 * 24;

  function Plugin(element, dataset, callback) {
      this.element = element;
      this.settings = $.extend({}, defaults);
      this._defaults = defaults;
      this._name = pluginName;
      this.dataset = _sort(dataset || [], "date");
      this.callback = callback;
      
      this.navDomain = [];
      this.brushDomain = [];
      
      if(dataset.length != 0) {
          _render(this);
          _resize(this);
      }
  }
  
  $.extend(Plugin.prototype, {
      reload: function(data) {
          this.dataset = _sort(data, 'date');
          this.navDomain = [];
          this.brushDomain = [];
          _render(this);
      },
      destory: function() {
          this.dataset = [];
          $(this.element).empty();
      }
  });
  
  function _getMaxValue(data, field) {
      return Math.max.apply(Math, _pluck(data, field));
  }
  
  function _getMinValue(data, field) {
      return Math.min.apply(Math, _pluck(data, field));
  }
  
  function _getDateRange(data, from, to) {
      var fromIdx = _findIndex(data, from);
      var toIdx = _findIndex(data, to);
      return _pluck(data.slice(fromIdx, toIdx), "date");
  }
  
  function _pluck(arr, key) {
      return $.map(arr, function(e) { return e[key]; });
  }

  function _findIndex(arr, obj) {
     return $.map(arr, function(index, elem) {
        if(elem.date >= obj) {
            return elem;
        }
     })[0];
  }
  
  function _sort(arr, field) {
      arr.sort(function(left, right) {
          var leftValue = left[field];
          var rightValue = right[field];
          return ((leftValue < rightValue) ? -1 : ((leftValue > rightValue) ? 1 : 0));
      });
      return arr;
  }
  
  function _render(timeline) {
     var margin = timeline.settings['margin'];
     var chartPadding = 0;
     var navigatorMarginTop = timeline.settings['NAVIGATOR_MARGIN_TOP'];
     var navigatorHeight = timeline.settings['NAVIGATOR_HEIGHT'];
     var dataset = timeline.dataset;
     var element = timeline.element;
     var handleWidth = 15;
     var callback = timeline.callback;
     var MAX_BARS = timeline.settings['MAX_BARS'];

     $(element).empty();
     
     var totalWidth = $(element).width();
     var totalHeight = $(element).height();
     var navigatorHeight = timeline.settings['NAVIGATOR_HEIGHT'];
     var navigatorWidth = totalWidth - margin.left;
     var chartWidth = totalWidth - margin.left;
     var chartHeight = totalHeight - navigatorHeight - navigatorMarginTop;

     var minDate = dataset[0].date;
     var maxDate = dataset[dataset.length - 1].date;

     var navDomain = timeline.navDomain;
     var brushDomain = timeline.brushDomain;

     if(navDomain.length == 0) {
        navDomain[0] = minDate;
        navDomain[1] = maxDate;
     }

     $(element).empty();
     
     var svg = d3.select(element)
         .append("svg")
         .attr({
            "width": totalWidth,
            "height": totalHeight
         });
     
     // 绘制底图
     svg.append("rect")
         .attr({
            "width": chartWidth,
            "height": chartHeight + margin.top,
            "transform": "translate(" + margin.left + ", 0)",
            "fill": "#ccc",
            "fill-opacity": 0.5
         });

     // 绘制图形
     var mainGroup = svg.append("g")
         .attr("transform", "translate(" + margin.left + "," + margin.top + ")");
     
     // 绘制x轴
     var minDate = dataset[0].date;
     var maxDate = dataset[dataset.length - 1].date;
     
     var fakeOrdinalXScale = d3.scale.ordinal()
            .domain(_pluck(dataset, 'date'))
            .rangeBands([0, chartWidth], 0.5);

     var barWidth = fakeOrdinalXScale.rangeBand();

     var xScale = d3.time.scale()
         .domain(navDomain)
         .range([barWidth / 2 + chartPadding, chartWidth - barWidth / 2 - chartPadding]);
     
     var xAxis = d3.svg.axis()
         .scale(xScale)
         .orient("bottom")
         .tickPadding(5)
         .tickFormat(d3.time.format("%Y-%m-%d"));
     
     mainGroup.append("g")
         .attr("class", "x axis")
         .attr("transform", function(d) {
             return "translate(0, " + chartHeight +")";
         })
         .call(xAxis);

     // 绘制y轴
     var maxY = d3.max([_getMaxValue(dataset, 'value'), 5]);
     var yScale = d3.scale.linear()
         .domain([0, maxY])
         .nice()
         .range([chartHeight, 0]);
     
     var yAxis = d3.svg.axis()
         .scale(yScale)
         .orient("left")
         .ticks(5)
         .tickPadding(10)
         .tickSize(-chartWidth);
     
     mainGroup.append('g')
         .attr("class", "y axis")
         .call(yAxis);
     mainGroup.select(".y.axis g.tick:first-child line")
         .attr("stroke-width", 2)
         .attr("style", "stroke: #aaa");
     
     // 绘制柱状图
     var chartContainer = mainGroup.append("g")
         .attr("clip-path", 'url(#chartClip)');
     
     chartContainer.append("clipPath")
         .attr("id", 'chartClip')
         .append("rect")
         .attr("width", chartWidth + fakeOrdinalXScale.rangeBand())
         .attr("height", chartHeight);
     
     var columnGroup = chartContainer.selectAll(".column")
         .data(dataset);
     
     columnGroup.enter()
         .append("rect")
         .attr({
            "class": "column",
            "width": function() {
                return fakeOrdinalXScale.rangeBand();
            },
            "height": function(d) {
             return chartHeight - yScale(d.value);
            },
            "x": function(d) {
                return xScale(d.date) - fakeOrdinalXScale.rangeBand() / 2;
            },
            "y": function(d) {
                return yScale(d.value);
            },
            "fill": "#008cdc",
            "stroke": "#008cdc"
         })
		 .on("click", function(d, i) {
             d3.event.stopPropagation();
		 });

     // brush
     var brush = d3.svg.brush()
         .x(xScale)
         .on("brushend", brushend);

     if(brushDomain.length != 0) {
        brush.extent(brushDomain);
     }

     mainGroup.append("g")
         .attr("class", "brush")
         .call(brush)
         .selectAll("rect")
         .attr({
            "y": -margin.top,
            "height": chartHeight + margin.top,
            "fill": 'red',
            "fill-opacity": 0.3
         });

     function brushend() {
        var selected = brush.extent();
        var start = selected[0];
        var end = selected[1];
        if(start != end) {
            brushDomain[0] = start;
            brushDomain[1] = end;
            callback(start, end);
        }
     }

     // 绘制导航条
     var navXScale = d3.time.scale()
         .domain([minDate, maxDate])
         .range([0, navigatorWidth]);

     var navYScale = d3.scale.linear()
         .domain([0, _getMaxValue(dataset, "value") || 1])
         .range([navigatorHeight, 0]);
     
     var navGroup = svg.append("g")
         .attr({
            "class": "navigator",
            "width": navigatorWidth,
            "height": navigatorHeight,
            "transform": "translate(" + (margin.left - handleWidth) + "," + (totalHeight - navigatorHeight) + ")"
         });
     
     var navChartContainer = navGroup.append("g")
         .attr("clip-path", 'url(#navChartClip)');
     
     navChartContainer.append("clipPath")
         .attr("id", "navChartClip")
         .append("rect")
         .attr("width", navigatorWidth + handleWidth * 2)
         .attr("height", navigatorHeight);
     
     navChartContainer.append("rect")
         .attr({
            "width": navigatorWidth + handleWidth * 2,
            "height": navigatorHeight,
            "fill": "#ccc"
         });
     
     navChartContainer.append("g")
         .selectAll(".column")
         .data(dataset)
         .enter()
         .append("rect")
         .attr("class", "column")
         .attr("width", function() {
             return fakeOrdinalXScale.rangeBand();
         })
         .attr("height", function(d) {
             return navigatorHeight - navYScale(d.value);
         })
         .attr("x", function(d) {
             return navXScale(d.date);
         })
         .attr("y", function(d) {
             return navYScale(d.value);
         })
         .attr("fill", "#aaa");
     
     // 添加导航条视窗
     var navViewport = d3.svg.brush()
         .x(navXScale)
         .extent(navDomain)
         .on("brush", display);

     navGroup.append("g")
         .attr("class", "nav-viewport")
         .call(navViewport)
         .selectAll("rect")
         .attr("height", navigatorHeight);
     
     var leftHandleGroup = navGroup.select(".nav-viewport .resize.w")
         .append('g');

     leftHandleGroup.append("rect")
         .attr({
            "width": handleWidth,
            "height": navigatorHeight,
            "stroke": "#ccc",
            "fill": "#fdfefc"
         });

     leftHandleGroup.append("path")
         .attr("d", "M5 15 L10 10 L10 20 Z")
         .attr("fill", "#ccc");
     
     var rightHandleGroup = navGroup.select(".nav-viewport .resize.e")
         .append('g')
         .attr("transform", "translate(0, 0)");

     rightHandleGroup.append("rect")
         .attr({
            "width": handleWidth,
            "height": navigatorHeight,
            "stroke": "#ccc",
            "fill": "#fdfefc"
         });

     rightHandleGroup.append("path")
         .attr("d", "M13 15 L7 10 L7 20 Z")
         .attr("fill", "#ccc");
     
     customTicks(minDate, maxDate);
     // 更新x轴标签文本
     setXAxisLabel();

     function display() {
        var extent = navViewport.empty() ? navXScale.domain() : navViewport.extent();
        zoomToPeriod(extent[0], extent[1]);
    }

     function customTicks(start, end) {
        start = new Date(start).getTime();
        end = new Date(end).getTime();
        var diff = Math.floor((end - start) / SECONDS_BY_DAY);
        if(diff < MAX_BARS * 1.5) {
            xAxis.ticks(d3.time.day.range, 1);
        } else if(diff < MAX_BARS * 7) {
            xAxis.ticks(d3.time.sunday.range, 1);
        } else if(diff < MAX_BARS * 30) {
            xAxis.ticks(d3.time.month.range, 1);
        } else if(diff < MAX_BARS * 90) {
            xAxis.ticks(d3.time.month.range, 3);
        } else if(diff < MAX_BARS * 365){
            xAxis.ticks(d3.time.year, 1);
        } else if(diff < MAX_BARS * 1825) {
            xAxis.ticks(d3.time.year.range, 5);
        } else {
            xAxis.ticks(d3.time.year.range, 10);
        }
     }
     
     function zoomToPeriod(from, to) {
         navDomain[0] = from;
         navDomain[1] = to;

         customTicks(from, to);
         chartContainer.call(xScale.domain([from, to]));
         updateAxis();
         updateCharts();
     }

     function setXAxisLabel() {
         // 更新x轴标签
         mainGroup.selectAll('.x.axis g.tick rect').remove();
         mainGroup.selectAll(".x.axis > g.tick > text").each(function(d, i) {
            var value = d3.time.format("%Y-%m-%d").parse(d3.select(this).text());
            if(value.getMonth() == 0 && value.getDate() == 1) {
                d3.select(this.parentNode)
                    .insert('rect', ':first-child')
                    .attr({
                        "class": "year",
                        "width": 44,
                        "height": 16,
                        "x": -22,
                        "y": 6,
                        "rx": 3,
                        "ry": 3,
                        "fill": "#666"
                    });
                d3.select(this).text(value.getFullYear() + "年").attr("class", "year");
            } else if(value.getDate() === 1) {
                d3.select(this).text((value.getMonth() + 1) + "月");
            } else {
                d3.select(this).text(value.getDate() + "日");
            }
         });
     }
     
     function updateAxis() {
         mainGroup.select(".x.axis").call(xAxis);
         setXAxisLabel();
     }
     
     function updateCharts() {
         columnGroup.exit().remove();
         columnGroup.attr("x", function(d) {
                 return xScale(d.date) - fakeOrdinalXScale.rangeBand() / 2;
             })
             .attr("y", function(d) {
                return yScale(d.value); 
             });
     }
  }

  // 缩放
  function _resize(timeline) {
      // 缩放有bug暂时全部重绘
      d3.select(window).on('resize', function() {
          _render(timeline);
      });
  }
  
  $.fn[pluginName] = function(dataset, callback) {
      return this.each(function() {
          $.data(this, "plugin_" + pluginName, new Plugin(this, dataset, callback));
      });
  }
})(jQuery, window, document);
