package com.awesomeLeather.common.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@ToString
@Setter
@Getter
public class CommonVO {
	//초기검색 시 사용할 필드(검색 대상, 검색 단어)
	private String search = "";
	private String keyword = "";
	
	//날짜검색시 사용할 필드(시작일, 종료일)
	private String start_date = "";
	private String end_date = "";
}
