package com.awesomeLeather.common.image.dao;

import java.util.List;

import com.awesomeLeather.common.image.vo.ImageVO;


public interface ImageDAO {
	public int imageNumber();
	public int imagesInsert(List<ImageVO> images);
	
	
	////// ╫иц╓©Ь
	public List<ImageVO> imageList(ImageVO ivo);
}
