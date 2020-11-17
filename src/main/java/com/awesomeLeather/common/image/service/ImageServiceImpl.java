package com.awesomeLeather.common.image.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.awesomeLeather.common.image.dao.ImageDAO;
import com.awesomeLeather.common.image.vo.ImageVO;
import com.awesomeLeather.common.product.vo.ProductVO;

import lombok.AllArgsConstructor;
@Service
@AllArgsConstructor
public class ImageServiceImpl implements ImageService {
	private ImageDAO imageDAO;

	//?��미�? 목록 구현
	@Override
	public List<ImageVO> imageList(ImageVO ivo) {
		List<ImageVO> list = null;
		list = imageDAO.imageList(ivo);
		return list;
	}

	@Override
	public ImageVO productDetail(ProductVO pvo) {
		// TODO Auto-generated method stub
		return null;
	}
}
