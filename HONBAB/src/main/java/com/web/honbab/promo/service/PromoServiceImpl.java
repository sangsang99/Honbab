package com.web.honbab.promo.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.web.honbab.common.service.CommonService;
import com.web.honbab.mybatis.promo.PromoMapper;
import com.web.honbab.promo.dto.PromoDTO;
import com.web.honbab.promo.dto.PromoRepDTO;
import com.web.honbab.session.search.SearchSession;



@Service
public class PromoServiceImpl implements PromoService, SearchSession{
	
	@Autowired
	PromoMapper mapper;
	
	@Autowired
	PromoFileService pfs;
	
	@Autowired
	CommonService cms;
	
	@Autowired
	HttpSession session;
	
	@Override
	public void promoList(Model model, int num) {
		
		int allCount = mapper.selectPromoAllCount(); // 전체 글수
		int[] startEnd = new int[1];
		
		startEnd = cms.paging(model, num, allCount); 
		model.addAttribute("isSearchPage", false);
		model.addAttribute("promoList", mapper.promoList(startEnd[0], startEnd[1])); 
	}
	
	@Override
	public void promoAllList(Model model) {
		model.addAttribute("isSearchPage", false);
		model.addAttribute("promoAllList", mapper.promoAllList()); 
	}

	@Override
	public int isBizUser(String user) {
		int result = 0;
		result = mapper.isBizUser(user);
		
		return result;
	}

	@Override
	public String writeSave(MultipartHttpServletRequest mul, HttpServletRequest request) {
		
		PromoDTO dto = new PromoDTO();
		dto.setId(mul.getParameter("id"));
		dto.setTitle(mul.getParameter("title"));
		dto.setContent(mul.getParameter("content"));
		dto.setAddress(mul.getParameter("address"));
		dto.setComName(mul.getParameter("comName"));
		MultipartFile file = mul.getFile("image_file_name");
		
		if(file.getSize() != 0) {
			dto.setImageFileName(pfs.saveFile(file));
		} else {
			dto.setImageFileName("nan");
		}
		
		int result = 0;
		try {
			result = mapper.writeSave(dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		String msg,url;
		if(result == 1) {
			msg = "새 글이 등록 되었습니다.";
			url = "/promotion/promoAllList";
		} else {
			msg ="문제가 생겼습니다";
			url = "/promotion/writeForm";
		}
		return pfs.getMessage(request, msg, url);
	}
	
	@Override
	public void contentView(int writeNo, Model model) {
		model.addAttribute("data", mapper.contentView(writeNo));
		upHit(writeNo);
	}

	private void upHit(int writeNo) {
		mapper.upHit(writeNo);
		
	}

	@Override
	public String modify(MultipartHttpServletRequest mul, HttpServletRequest request) {
		PromoDTO dto = new PromoDTO();
		dto.setWriteNo(Integer.parseInt(mul.getParameter("writeNo")));
		dto.setTitle(mul.getParameter("title"));
		dto.setContent(mul.getParameter("content"));
		dto.setAddress(mul.getParameter("address"));
		dto.setComName(mul.getParameter("comName"));
		MultipartFile file = mul.getFile("image_file_name");
		
		if(file.getSize() != 0) {
			dto.setImageFileName(pfs.saveFile(file));
			pfs.deleteImage(mul.getParameter("originFileName"));
		} else {
			dto.setImageFileName(mul.getParameter("originFileName"));
		}
		
		int result = 0;
		try {
			result = mapper.modify(dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		String msg,url;
		if(result == 1) {
			msg = "글 수정 완료!.";
			url = "/promotion/promoAllList";
		} else {
			msg ="문제가 생겼습니다";
			url = "/promotion/promoModifyForm?writeNo="+dto.getWriteNo();
		}
		return pfs.getMessage(request, msg, url);
	}

	@Override
	public String boardDelete(int writeNo, String imageFileName, HttpServletRequest request) {
		int result = mapper.delete(writeNo);
		String msg, url;
		
		if(result == 1) {
			if(imageFileName != null) {
				pfs.deleteImage(imageFileName);
			}
			msg = "글이 삭제 되었습니다.";
			url = "/promotion/promoAllList";
		} else {
			msg ="오류 발생, 작업이 완료되지 않았습니다.";
			url = "/promotion/promoContentView?writeNo="+writeNo;
		}
		return pfs.getMessage(request, msg, url);
	}

	@Override
	public void addReply(PromoRepDTO dto) {
		mapper.addReply(dto);
		
	}

	@Override
	public List<PromoRepDTO> getRepList(int write_group) {
		return mapper.getRepList(write_group);
	}

	@Override
	public void getSearch(Model model, int num) {

		String keyword = (String) session.getAttribute(SEARCHVALUE);
		String select = (String) session.getAttribute(SEARCHOPTION);
		int allCount;
		int[] startEnd = new int[1];

		switch (select) {
		case "comName":
			allCount = mapper.selectPromoCountForComName(keyword); 
			startEnd = cms.paging(model, num, allCount);
			model.addAttribute("promoList", mapper.searchForComName(keyword, startEnd[0], startEnd[1]));
			model.addAttribute("isSearchPage", true);
			break;
		case "address":
			allCount = mapper.selectPromoCountForAddress(keyword); 
			startEnd = cms.paging(model, num, allCount);
			model.addAttribute("promoList", mapper.searchForAddress(keyword, startEnd[0], startEnd[1]));
			model.addAttribute("isSearchPage", true);
			break;
		default:
			System.out.println("에러발생");
			break;
		}
	}
	
}	