!function(a,b){"object"==typeof exports?module.exports=b(a,require('jquery')):'function'==typeof define&&define.amd?define(['jquery'],function(c){return b(a,c)}):b(a,a.jQuery)}(this,function(a,b,c){b.PaginationCalculator=function(a,b){this.maxentries=a,this.opts=b},b.extend(b.PaginationCalculator.prototype,{numPages:function(){return Math.ceil(this.maxentries/this.opts.items_per_page)},getInterval:function(a){var b=Math.floor(this.opts.num_display_entries/2),c=this.numPages(),d=c-this.opts.num_display_entries,e=a>b?Math.max(Math.min(a-b,d),0):0,f=a>b?Math.min(a+b+this.opts.num_display_entries%2,c):Math.min(this.opts.num_display_entries,c);return{start:e,end:f}}}),b.PaginationRenderers={},b.PaginationRenderers.defaultRenderer=function(a,c){this.maxentries=a,this.opts=c,this.pc=new b.PaginationCalculator(a,c)},b.extend(b.PaginationRenderers.defaultRenderer.prototype,{createLink:function(a,c,d){var e,f=this.pc.numPages();return a=a<0?0:a<f?a:f-1,d=b.extend({text:a+1,classes:""},d||{}),e=a==c?b("<span class='current'>"+d.text+"</span>"):b("<a>"+d.text+"</a>").attr('href',this.opts.link_to.replace(/__id__/,a)),d.classes&&e.addClass(d.classes),e.data('page_id',a),e},appendRange:function(a,b,c,d,e){var f;for(f=c;f<d;f++)this.createLink(f,b,e).appendTo(a)},getLinks:function(a,c){var d,e,f=this.pc.getInterval(a),g=this.pc.numPages(),h=b("<div class='pagination'></div>");return this.opts.prev_text&&(a>0||this.opts.prev_show_always)&&h.append(this.createLink(a-1,a,{text:this.opts.prev_text,classes:"prev"})),f.start>0&&this.opts.num_edge_entries>0&&(e=Math.min(this.opts.num_edge_entries,f.start),this.appendRange(h,a,0,e,{classes:'sp'}),this.opts.num_edge_entries<f.start&&this.opts.ellipse_text&&b("<span>"+this.opts.ellipse_text+"</span>").appendTo(h)),this.appendRange(h,a,f.start,f.end),f.end<g&&this.opts.num_edge_entries>0&&(g-this.opts.num_edge_entries>f.end&&this.opts.ellipse_text&&b("<span>"+this.opts.ellipse_text+"</span>").appendTo(h),d=Math.max(g-this.opts.num_edge_entries,f.end),this.appendRange(h,a,d,g,{classes:'ep'})),this.opts.next_text&&(a<g-1||this.opts.next_show_always)&&h.append(this.createLink(a+1,a,{text:this.opts.next_text,classes:"next"})),b('a',h).click(c),h}}),b.fn.pagination=function(a,c){function d(a){var c=b(a.target).data('page_id'),d=e(c);return d||a.stopPropagation(),d}function e(a){i.data('current_page',a),g=f.getLinks(a,d),i.empty(),g.appendTo(i);var b=c.callback(a,i);return b}c=b.extend({items_per_page:10,num_display_entries:11,current_page:0,num_edge_entries:0,link_to:"#",prev_text:"《",next_text:"》",ellipse_text:"...",prev_show_always:!0,next_show_always:!0,renderer:"defaultRenderer",load_first_page:!1,callback:function(){return!1}},c||{});var f,g,h,i=this;if(h=c.current_page,i.data('current_page',h),a=!a||a<0?1:a,c.items_per_page=!c.items_per_page||c.items_per_page<0?1:c.items_per_page,!b.PaginationRenderers[c.renderer])throw new ReferenceError("Pagination renderer '"+c.renderer+"' was not found in jQuery.PaginationRenderers object.");f=new b.PaginationRenderers[c.renderer](a,c);var j=new b.PaginationCalculator(a,c),k=j.numPages();i.bind('setPage',{numPages:k},function(a,b){if(b>=0&&b<a.data.numPages)return e(b),!1}),i.bind('prevPage',function(a){var c=b(this).data('current_page');return c>0&&e(c-1),!1}),i.bind('nextPage',{numPages:k},function(a){var c=b(this).data('current_page');return c<a.data.numPages-1&&e(c+1),!1}),g=f.getLinks(h,d),i.empty(),g.appendTo(i),c.load_first_page&&c.callback(h,i)}});