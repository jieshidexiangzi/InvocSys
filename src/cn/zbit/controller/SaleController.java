package cn.zbit.controller;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import cn.zbit.entity.Product;
import cn.zbit.entity.Sale;
import cn.zbit.entity.User;
import cn.zbit.service.ProductService;
import cn.zbit.service.SaleService;
import cn.zbit.utils.PageSupport;

@Controller
@RequestMapping("/sale")
public class SaleController {
	@Resource
	private ProductService productService;
	@Resource
	private SaleService saleService;
	
	@RequestMapping("/main.html")
	public String main(){
		
		return "main";
	}
	
	@RequestMapping("/queryInput.html")
	public String queryInput(Model model){
		List<Product> plist = productService.getProductList();
		model.addAttribute("plist", plist);
		
		return "queryQuantity";
	}
	
	@RequestMapping("/query.html")
	public String query(Integer productId,Model model){
		Product product = productService.queryProductByid(productId);
		model.addAttribute("product", product);
		List<Product> plist = productService.getProductList();
		model.addAttribute("plist", plist);
		model.addAttribute("productId", productId);
		
		return "queryQuantity";
	}
	
	@RequestMapping("/addInput.html")
	public String addInput(Model model){
		List<Product> plist = productService.getProductList();
		model.addAttribute("plist", plist);
		
		return "addsale";
	}
	
	@RequestMapping("/add.html")
	public String add(Sale sale,HttpSession session, Model model){
		sale.setSaleDate(new Date());
		sale.setTotalPrice(sale.getPrice()*sale.getQuantity());
		User userSession = (User) session.getAttribute("user");
		sale.setUserId(userSession.getId());
		
		if (saleService.addSale(sale)) {
			model.addAttribute("msg", "<script>alert('添加成功！');</script>");
		} else {
			model.addAttribute("msg", "<script>alert('添加失败！');</script>");
		}
		
		return "addsale";
	}
	
	@RequestMapping("/saleList.html")
	public String list(
			@RequestParam(value="orderName",required=false) String orderName, 
			@RequestParam(value="pageIndex",required=false) String pageIndex,
			Model model){
		
		//设置页面容量
    	int pageSize = 5;
		//当前页码
    	int currentPageNo = 1;
    	if(pageIndex != null){
    		currentPageNo = Integer.valueOf(pageIndex);
    	}	
		if (pageIndex != null) {
			currentPageNo = Integer.parseInt(pageIndex);
		}
		
		// 设置排序字段
		if (orderName == null) {
			orderName = "saleDate";
		}
		
		//总数量（表）	
    	int totalCount	= saleService.getCount();
    	//总页数
    	PageSupport pages=new PageSupport();
    	pages.setCurrentPageNo(currentPageNo);
    	pages.setPageSize(pageSize);
    	pages.setTotalCount(totalCount);
    	// 总页数
    	int totalPageCount = pages.getTotalPageCount();
    	//控制首页和尾页
    	if(currentPageNo < 1){
    		currentPageNo = 1;
    	}else if(currentPageNo > totalPageCount){
    		currentPageNo = totalPageCount;
    	}
    	
		
		List<Sale> list = saleService.getSaleList(orderName, currentPageNo, pageSize);
		model.addAttribute("list", list);
		model.addAttribute("totalPageCount", totalPageCount);
		model.addAttribute("totalCount", totalCount);
		model.addAttribute("currentPageNo", currentPageNo);
		model.addAttribute("orderName", orderName);
		return "salelist";
	}
}
