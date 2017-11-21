package cn.zbit.service;

import java.util.List;

import cn.zbit.entity.Sale;

public interface SaleService {
	public boolean addSale(Sale sale);
	
	public List<Sale> getSaleList(
			String orderName,
			int currentPageNo, 
			int pageSize);
	public int getCount();
}
