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

	//?ù¥ÎØ∏Ï? Î™©Î°ù Íµ¨ÌòÑ
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
