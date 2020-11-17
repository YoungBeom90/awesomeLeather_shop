package com.awesomeLeather.common.image.service;

import java.util.List;

import com.awesomeLeather.common.image.vo.ImageVO;
import com.awesomeLeather.common.product.vo.ProductVO;


public interface ImageService {
	public List<ImageVO> imageList(ImageVO ivo);

	public ImageVO productDetail(ProductVO pvo);

}
