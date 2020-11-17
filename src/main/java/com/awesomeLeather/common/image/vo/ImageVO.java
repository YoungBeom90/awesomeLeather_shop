package com.awesomeLeather.common.image.vo;

import java.util.ArrayList;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class ImageVO {
	private int i_num = 0;
	private int p_num = 0;
	private String i_name = "";
	private String i_address = "";
	private String i_type = "";
	private String i_ex = "";
	private List<MultipartFile> files;
	
	public ImageVO() {
		files = new ArrayList<MultipartFile>();
	}
}
