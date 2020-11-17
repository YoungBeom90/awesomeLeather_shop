package com.awesomeLeather.common.product.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.awesomeLeather.common.file.FileUploadUtil;
import com.awesomeLeather.common.image.dao.ImageDAO;
import com.awesomeLeather.common.image.vo.ImageVO;
import com.awesomeLeather.common.product.dao.ProductDAO;
import com.awesomeLeather.common.product.vo.ProductVO;

import lombok.Setter;

@Service
public class ProductServiceImpl implements ProductService {
	
	@Setter(onMethod_ = @Autowired)
	private ProductDAO productDAO;
	
	@Setter(onMethod_ = @Autowired)
	private ImageDAO imageDAO;
	

	@Override
	public List<ProductVO> productList(ProductVO pvo) {
		List<ProductVO> list = null;
		list = productDAO.productList(pvo);
		return list;
	}

	@Override
	public ProductVO productDetail(ProductVO pvo) {
		ProductVO detail = null;
		List<String> images = null;
		detail = productDAO.productDetail(pvo);
		images = productDAO.detailImages(detail);
		detail.setP_images(images);
		return detail;
	}
	
	@Transactional
	@Override
	public int productInsert(ProductVO pvo) throws Exception {
		int result = 0;
		String mainImageFullName = FileUploadUtil.mainImageUpload(pvo.getUploadFile(), "mainImages");
		List<String> subImageFullNames = FileUploadUtil.subImagesUpload(pvo.getImages(), "subImages");
		

		if(!subImageFullNames.isEmpty() && !mainImageFullName.isEmpty()) {
			//�긽�뭹�쓽 p_num�떆���뒪 媛��졇�삤湲�
			pvo.setP_num(productDAO.productNumber());	
			//癒쇱� �떆���뒪瑜� 鍮꾨’�븳 �긽�뭹�젙蹂대뱾 �궫�엯
			result = productDAO.productInsert(pvo);
			
			if (result > 0) { // �긽�뭹 異붽� 寃곌낵 �솗�씤 �썑 �씠誘몄� 吏꾪뻾
				
				
				List<ImageVO> images = new ArrayList<ImageVO>();
				ImageVO ivo = null;
				
				//�꽌釉� �씠誘몄� 二쇱냼媛� �뀒�씠釉� ���옣
				for(int i = 0; i < subImageFullNames.size(); i++) {
					ivo = new ImageVO();
					/* ivo.setI_num(imageDAO.imageNumber()); */
					ivo.setP_num(pvo.getP_num());
					// �씠誘몄� 二쇱냼 媛�.
					ivo.setI_address(subImageFullNames.get(i));
					// �씠誘몄� 蹂몃옒 �씠由�.
					ivo.setI_name(pvo.getImages().get(i).getOriginalFilename());
					// �뼱�뼡 �씠誘몄��씤吏�.
					ivo.setI_type("sub");
					images.add(ivo);
				}
				//硫붿씤 �씠誘몄� 二쇱냼媛� �뀒�씠釉� ���옣
				ivo = new ImageVO();
				ivo.setP_num(pvo.getP_num());
				ivo.setI_address(mainImageFullName);
				ivo.setI_name(pvo.getUploadFile().getOriginalFilename());
				ivo.setI_type("main");
				images.add(ivo);
				
				// �떎以� �씠誘몄��� ���몴 �씠誘몄� 紐⑥븘�꽌 �븳踰덉뿉 �뜲�씠�꽣踰좎씠�뒪�뿉 �쟾�떖.
				imageDAO.imagesInsert(images);
			}
			
			
		}

		return result;
	}

	@Override
	public int statePause(ProductVO pvo) {
		int result = 0;
		result = productDAO.statePause(pvo);
		return result;
	}

	@Override
	public int stateSell(ProductVO pvo) {
		int result = 0;
		result = productDAO.stateSell(pvo);
		return result;
	}
	
	
////////////////////////////////심채원 ///////////////////////////////////////////////////////////////////////////

	/*상품 목록 구현*/
	@Override
	public List<ProductVO> clientProductList(ProductVO pvo) {
		List<ProductVO> list = null;
		list = productDAO.productList(pvo);
		return list;
	}
	/*상품 상세 페이지 구현*/
	@Override
	public ProductVO clientProductDetail(ProductVO pvo) {
		List<String> images = null;
		ProductVO vo = null;
		
		vo = productDAO.productDetail(pvo);
		images = productDAO.imageDetail(vo);
		vo.setP_images(images);
		
		return vo;
	}
}
