package com.awesomeLeather.common.product.service;

import java.util.List;

import com.awesomeLeather.common.product.vo.ProductVO;



public interface ProductService {
	public List<ProductVO> productList(ProductVO pvo);
	public ProductVO productDetail(ProductVO pvo);
	public int productInsert(ProductVO pvo) throws Exception;
	public int statePause(ProductVO pvo);
	public int stateSell(ProductVO pvo);
	
	
////////////////////////////////╫иц╓©Ь ///////////////////////////////////////////////////////////////////////////
	public ProductVO clientProductDetail(ProductVO pvo);
	public List<ProductVO> clientProductList(ProductVO pvo);

	
}
