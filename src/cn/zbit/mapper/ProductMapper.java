package cn.zbit.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import cn.zbit.entity.Product;

@Repository("productMapper")
public interface ProductMapper {
	public List<Product> getProductList();
	
	public Product queryProductByid(
			@Param("pid") Integer pid);
	
	public int updateQuantity(
			@Param("pid") Integer pid,
			@Param("quantity") Integer quantity);
	
}
