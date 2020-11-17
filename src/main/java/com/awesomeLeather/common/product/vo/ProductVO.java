package com.awesomeLeather.common.product.vo;

import java.util.ArrayList;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.awesomeLeather.common.vo.CommonVO;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper = false)
public class ProductVO extends CommonVO {
	private int p_num = 0;
	private String p_name = "";
	private String p_price = "";
	private String p_color = "";
	private String p_size = "";
	private String p_ex_top = "";
	private String p_ex_bottom = "";
	private String p_category = "";
	private String p_state = "";
	
	private String p_image = "";
	private List<String> p_images = null;
	
	private MultipartFile uploadFile;
	private List<MultipartFile> images;
	public ProductVO() {
		images = new ArrayList<MultipartFile>();
	}
	
////////////////////심채원 //////////////////////////////////////
	private String detailImage		="";	//이미지 1개
}
