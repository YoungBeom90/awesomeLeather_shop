package com.awesomeLeather.common.product.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;


import com.awesomeLeather.common.excel.ListExcelView;
import com.awesomeLeather.common.image.service.ImageService;
import com.awesomeLeather.common.image.vo.ImageVO;
import com.awesomeLeather.common.product.service.ProductService;
import com.awesomeLeather.common.product.vo.ProductVO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;


@Controller
@Log4j
@RequestMapping(value="/product/*")
@AllArgsConstructor
public class ProductController {
	
	private ProductService productService;
	private ImageService imageService;
	
	/***********************
	 * �긽�뭹 �벑濡� �뤌 �씠�룞
	 * @param pvo
	 * @param model
	 * @return String
	 ***********************/
	@RequestMapping(value="/productInsertForm")
	public String productInsertForm(@ModelAttribute("data") ProductVO pvo, Model model) {
		log.info("productInsertForm �샇異� �꽦怨�");
		
		return "product/productInsertForm";
	}
	
	/***********************
	 * �긽�뭹 �벑濡� �셿猷� 泥섎━
	 * @param pvo
	 * @param model
	 * @return
	 * @throws Exception
	 ************************/
	@RequestMapping(value="/productInsert", method=RequestMethod.POST)
	public String ProductInsert(@ModelAttribute("data") ProductVO pvo, 
			Model model, MultipartHttpServletRequest mhsr) throws Exception {
		log.info("productInsert �샇異� �꽦怨�.");
		log.info("pvo" + pvo);
		
		int result = 0;
		String url = "";
		
		result = productService.productInsert(pvo);
		if(result==1) {
			url = "/product/productList";
		}
		
		return "redirect:" + url;
	}
	/*************************************
	 * �긽�뭹 由ъ뒪�듃 異쒕젰
	 * @param pvo
	 * @param model
	 * @return
	 ************************************/
	@RequestMapping(value="/productList", method = RequestMethod.GET)
	public String productList(@ModelAttribute("data") ProductVO pvo, Model model) {
		log.info("productList �샇異� �꽦怨�.");
		
		
		List<ProductVO> productList = productService.productList(pvo);
		model.addAttribute("list", productList);
		
		
		return "product/productList";
	}
	
	/*************************************
	 * �긽�뭹 �긽�꽭 �럹�씠吏� �씠�룞
	 * @param pvo
	 * @param model
	 * @return
	 ************************************/
	@RequestMapping(value="/productDetail", method = RequestMethod.POST)
	public String productDetail(@ModelAttribute("data") ProductVO pvo, Model model) {
		log.info("productDetail �샇異� �꽦怨�.");
		log.info(pvo.getP_num());
		ProductVO detail = null;
		detail = productService.productDetail(pvo);
		List<String> images = null;
		images = detail.getP_images();
		model.addAttribute("detail", detail);
		model.addAttribute("images", images);
		return "product/productDetail";
	}
	
	/**
	 * �긽�뭹 由ъ뒪�듃 �뿊�� �뙆�씪 �떎�슫濡쒕뱶
	 * @param pvo
	 * @return
	 */
	@RequestMapping(value="/productExcel", method=RequestMethod.GET)
	public ModelAndView productExcel(@ModelAttribute ProductVO pvo) {
		log.info("productExcel �샇異� �꽦怨�.");
		
		List<ProductVO> productList = productService.productList(pvo);
		
		ModelAndView mv = new ModelAndView(new ListExcelView());
		mv.addObject("list", productList);
		mv.addObject("templete", "product.xlsx");
		mv.addObject("fileName", "product");
		
		return mv;
		
	}
	
	@ResponseBody
	@PostMapping(value="/statePause")
	public String statePause(@ModelAttribute("data") ProductVO pvo) {
		log.info("statePause �샇異� �꽦怨�.");
		int result = 0;
		String success = "";
		
		result = productService.statePause(pvo);
		if(result == 1) {
			success = "success";
		}
		return success;
	}
	
	@ResponseBody
	@PostMapping(value="/stateSell")
	public String stateSell(@ModelAttribute("data") ProductVO pvo) {
		log.info("stateSell �샇異� �꽦怨�.");
		int result = 0;
		String success = "";
		
		result = productService.stateSell(pvo);
		if(result == 1) {
			success = "success";
		}
		return success;
	}
	
	//////////////////////////////// 심채원 ///////////////////////////////////////////////////////////////////////////
	
	/**********************************************************
  	상품 목록 구현
   **********************************************************/
   @RequestMapping(value="/clientProductList", method=RequestMethod.GET)
   public String clientProductList(@ModelAttribute("data") ProductVO pvo, ImageVO ivo, Model model) {
      log.info("ClientProductList 호출 성공");
      log.info("imageList 호출 성공");
      //전체 레코드 조회
      List<ProductVO> productList = productService.clientProductList(pvo);
      List<ImageVO> imageList = imageService.imageList(ivo);
      model.addAttribute("imageList",imageList);
      model.addAttribute("productList", productList);
      
      return "clientProduct/clientProductList";
   	}
   
   /**********************************************************
 	상품 상세페이지 구현
    **********************************************************/
   @RequestMapping(value="/clientProductDetail", method=RequestMethod.GET)
   public String clientProductDetail(@ModelAttribute("data") ProductVO pvo, Model model) {
		log.info("ClientProductDetail 호출 성공");
		log.info(pvo.getP_num());
		
		ProductVO detail = null;
		detail = productService.clientProductDetail(pvo);
		List<String> images = null;
		images = detail.getP_images();
		model.addAttribute("detail", detail);
		model.addAttribute("images", images);
		
		log.info(images);
		return "clientProduct/clientProductDetail";
   }
}