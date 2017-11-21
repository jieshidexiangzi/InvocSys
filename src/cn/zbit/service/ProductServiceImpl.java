package cn.zbit.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import cn.zbit.entity.Product;
import cn.zbit.mapper.ProductMapper;

@Service
public class ProductServiceImpl implements ProductService {
	@Resource
	private ProductMapper productMapper;

	@Override
	public List<Product> getProductList() {
		return productMapper.getProductList();
	}

	@Override
	public Product queryProductByid(Integer pid) {
		return productMapper.queryProductByid(pid);
	}


}
