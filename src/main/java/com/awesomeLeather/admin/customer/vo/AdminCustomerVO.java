package com.awesomeLeather.admin.customer.vo;

import lombok.Data;

@Data
public class AdminCustomerVO {
	private int c_num = 0;				// 회원 번호
	private String c_id = "";			// 회원 아이디
	private String c_pw = "";			// 회원 비밀번호
	private String c_name = "";			// 회원 이름
	private String c_phone = "";		// 회원 전화번호
	private String c_address1 = "";		// 회원 주소
	private String c_address2 = "";		// 회원 주소
	private String c_address3 = "";		// 회원 주소
	private String c_address4 = "";		// 회원 주소
	private String c_date = "";			// 회원 가입 날짜
	private int c_echeck = 0;			// 이메일 수신여부
	private String c_pwchange = "";		// 회원 비밀번호 수정날짜
}