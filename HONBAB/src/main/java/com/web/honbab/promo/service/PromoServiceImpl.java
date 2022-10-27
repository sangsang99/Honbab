package com.web.honbab.promo.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.web.honbab.mybatis.promo.PromoMapper;
import com.web.honbab.promo.dto.PromoDTO;
import com.web.honbab.promo.dto.PromoRepDTO;



@Service
public class PromoServiceImpl implements PromoService {
	
	@Autowired
	PromoMapper mapper;
	
	@Autowired
	PromoFileService pfs;
	
	
	@Override
	public void promoList(Model model, int num) {
		int pageLetter = 10; // 한 페이지당 글 목록수 
		int allCount = mapper.selectBoardCount(); // 전체 글수
		int repeat = allCount/pageLetter; // 마지막 페이지 번호 jsp에서 foreach에 사용할 값, 2/3=0
		if(allCount % pageLetter != 0) // 2/3일 때 마지막 페이지는 1, 5/3일때 마지막페이지는 2
 			repeat += 1; 
		int end = num * pageLetter; //numDefault는 1, pageLetter는 3 이면 end는 3 // 3의 배수만 나옴
		int start = end + 1 - pageLetter; // 끝번호가 15면 첫번호는 13 이런식
		model.addAttribute("repeat", repeat); //jsp파일에 보낼값
		model.addAttribute("promoList", mapper.promoList(start, end)); 
	}
	
	@Override
	public String writeSave(MultipartHttpServletRequest mul, HttpServletRequest request) {
		
		PromoDTO dto = new PromoDTO();
		dto.setId(mul.getParameter("id"));
		dto.setTitle(mul.getParameter("title"));
		dto.setContent(mul.getParameter("content"));
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
			url = "/promotion/promoList";
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
				url = "/promotion/promoList";
			} else {
				msg ="문제가 생겼습니다";
				url = "/promotion/modify_form?writeNo="+dto.getWriteNo();
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
				url = "/promotion/promoList";
			} else {
				msg ="오류 발생, 작업이 완료되지 않았습니다.";
				url = "/promotion/contentView?writeNo="+writeNo;
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


		
	
}	