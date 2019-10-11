package org.loushang.ue.product.dao;

import java.util.List;
import java.util.Map;

import org.loushang.framework.mybatis.mapper.EntityMapper;
import org.loushang.ue.product.data.Product;

/**
 * Dao层 接口类，用于持久化数据处理
 * 
 * @author 框架产品组
 * 
 */
public interface ProductMapper extends EntityMapper<Product> {

	public List<Product> getProductListByParam(Map<String, Object> param);
}