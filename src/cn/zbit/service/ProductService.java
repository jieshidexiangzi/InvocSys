package cn.zbit.service;

import java.util.List;

import cn.zbit.entity.Product;

public interface ProductService {
	public List<Product> getProductList();
	
	public Product queryProductByid(Integer pid);
	
}
