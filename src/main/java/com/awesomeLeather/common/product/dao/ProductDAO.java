package com.awesomeLeather.common.product.dao;

import java.util.List;

import com.awesomeLeather.common.product.vo.ProductVO;



public interface ProductDAO {
	
	public List<ProductVO> productList(ProductVO pvo);
	
	public ProductVO productDetail(ProductVO pvo);
	
	public int productInsert(ProductVO pvo);
	
	public int productNumber();
	
	public List<String> detailImages(ProductVO pvo);
	
	public int statePause(ProductVO pvo);
	
	public int stateSell(ProductVO pvo);
	
	
////////////////////////////////╫иц╓©Ь ///////////////////////////////////////////////////////////////////////////
	
	public List<ProductVO> clientProductList(ProductVO pvo); 
	public ProductVO clientProductDetail(ProductVO pvo); //p_num, p_name, p_price, p_color, p_category
	public List<String> imageDetail(ProductVO vo);
}
