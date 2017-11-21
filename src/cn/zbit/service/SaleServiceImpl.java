package cn.zbit.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import cn.zbit.entity.Sale;
import cn.zbit.mapper.ProductMapper;
import cn.zbit.mapper.SaleMapper;

@Service
public class SaleServiceImpl implements SaleService {
	@Resource
	private SaleMapper saleMapper;
	@Resource
	private ProductMapper productMapper;

	@Override
	public boolean addSale(Sale sale) {
		if (saleMapper.add(sale) > 0) {
			productMapper.updateQuantity(sale.getProductId(), sale.getQuantity());
			return true;
		} else {
			return false;
		}
	}

	@Override
	public List<Sale> getSaleList(String orderName, int currentPageNo,
			int pageSize) {
		return saleMapper.getSaleList(orderName, (currentPageNo - 1)*pageSize, pageSize);
	}

	@Override
	public int getCount() {
		return saleMapper.count();
	}

}
