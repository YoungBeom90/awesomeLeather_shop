package com.awesomeLeather.common.excel;

import java.io.BufferedInputStream;
import java.io.FileInputStream;
import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.ss.usermodel.Workbook;
import org.springframework.web.servlet.view.AbstractView;

import lombok.extern.log4j.Log4j;
import net.sf.jxls.transformer.XLSTransformer;

@Log4j
public class ListExcelView extends AbstractView {
	
	@Override
	public void renderMergedOutputModel(Map<String, Object> model, HttpServletRequest request, HttpServletResponse response) throws Exception {
		response.setHeader("Content-Disposition",  "attachment;fileName=\"" + model.get("fileName") + "_" + new SimpleDateFormat("yyyyMMdd").format(Calendar.getInstance().getTime()) + ".xlsx" + "\"");
		response.setContentType("application/x-msexcel; charset=UTF-8");
		
		//참고 : jxls는 엑셀파일 포멧의 탬플릿을 이용하여 엑셀 파일을 손쉽게 생성하기 위한 패키지(jxls는 탬플릿을 기반으로 종 엑셀 파일을 생성)
		 String docRoot = request.getSession().getServletContext().getRealPath("/WEB-INF/excel/");
		 log.info("경로 체크(docRoot) : " + docRoot);
		 
		 InputStream is = new BufferedInputStream(new FileInputStream(docRoot + model.get("templete")));
		 XLSTransformer trans = new XLSTransformer();
		 
		 Workbook workbook = trans.transformXLS(is, model);
		 is.close();
		 
		 workbook.write(response.getOutputStream());
		 
	}
}
