package cn.zbit.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import cn.zbit.entity.Sale;

@Repository("saleMapper")
public interface SaleMapper {
	public int add(Sale sale);
	
	public List<Sale> getSaleList(
			@Param("orderName") String orderName,
			@Param("offset") int offset, 
			@Param("pageSize") int pageSize);
	
	public int count();
}
