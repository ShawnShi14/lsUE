package org.loushang.ue.product.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.loushang.ue.product.data.Product;
import org.loushang.ue.product.service.IProductService;
import org.loushang.framework.mybatis.PageUtil;
import org.loushang.framework.util.UUIDGenerator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * Controller层，用于前后台交互、前后台数据格式转换
 * 
 * @author 框架产品组
 * 
 */
@Controller
@RequestMapping(value = "/product")
public class ProductController {

	@Autowired
	IProductService productService;

	// ////////////////////////////////新增、修改//////////////////////////////////

	@RequestMapping("/save")
	@ResponseBody
	public Map save(@RequestBody List<Product> productlist) {
		productService.save(productlist);
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("success", true);
		return resultMap;
	}

	// ////////////////////////////////删除//////////////////////////////////

	/**
	 * 商品删除操作
	 * 
	 * @param ids
	 *            [主键ID数组]
	 * 
	 * @return 商品列表页面路径
	 * 
	 */
	@RequestMapping("/delete/{ids}")
	@ResponseBody
	public String delete(@PathVariable String ids) {
		if (ids != null) {
			String[] idArray = ids.split(",");
			if (idArray.length == 1) {
				productService.delete(idArray[0]);
			} else {
				productService.delete(idArray);
			}
		}
		return "success";
	}

	// ////////////////////////////////查询//////////////////////////////////

	/**
	 * 用户信息数据的查询
	 * 
	 * @param parameters
	 *            , key 分别为 ： <code>orderfield<code>[排序列]
	 *              <code>orderdir<code>[排序方向desc或asc] 
	 *              <code>start<code>[起始行] 
	 *              <code>limit<code>[每页显示条数]
	 * 
	 * @return Map, key分别为： <code>total<code>[总记录条数] <code>data<code>[用户信息列表],
	 *         List 内容为 Product
	 * 
	 */
	@RequestMapping("/query")
	@ResponseBody
	public Map<String, Object> query(@RequestBody Map<String, Object> parameters) {
		Map<String, Object> productData = new HashMap<String, Object>();
		String productName = String.valueOf(parameters.get("productName"));
		if(productName.indexOf("_") > 0) {
			productName = productName.replace("_", "\\_");
			parameters.put("productName", productName);
		}
		List<Product> products = productService.query(parameters);
		productData.put("data", products);
		// 获取总记录条数
		int total = PageUtil.getTotalCount();
		productData.put("total", total != -1 ? total : products.size());

		return productData;
	}
}
