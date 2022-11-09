package com.web.honbab.admin.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.web.honbab.admin.dto.NoticeRepDTO;
import com.web.honbab.admin.service.OperService;
import com.web.honbab.promo.service.PromoService;
import com.web.honbab.review.dto.ReviewRepDTO;
import com.web.honbab.session.admin.AdminSession;

@Controller
@RequestMapping("oper")
public class OperController implements AdminSession{

	@Autowired
	private OperService os;
	
	@Autowired
	private PromoService ps;
	

	
	//영업관리 메인페이지
	@RequestMapping("operation")
	public String goNoticeWriteFrom(Model model, @RequestParam(value="num", required = false, defaultValue ="1") int num) {
		os.viewNoticeList(model);
		ps.promoAllList(model);
		os.promoList(model, num);
		return "admin/operation";
	}
	
	//공지작성이동
	@RequestMapping("writeNoticeForm")
	public String goWriteNoticeForm() {
		return "admin/operNoticeWriteForm";
	}
	 
	//공지사항 보기
	@RequestMapping("noticeConetentView")
	public String goNoticeConetentView(Model model, @RequestParam int writeNo) {
		os.noticeConetentView(model, writeNo);
		return "admin/operNoticeContent";
	}
	
	//공지사항 삭제버튼
	@RequestMapping("deleteNoticeContent")
	public void deleteNoticeContent(@RequestParam int writeNo,
				HttpServletRequest request, HttpServletResponse response) throws IOException {
		String message = os.deleteNoticeContent(writeNo, request);
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println(message);
	}

	
	@RequestMapping("modifyNoticeContent")
	public String updateNoticeForm(Model model, @RequestParam int writeNo) {
		os.noticeConetentView(model, writeNo);
		return "admin/operNoticeModifyForm";
	}
	
	//공지사항 수정버튼
	@RequestMapping("noticeModify")
	public void updateNoticeContent(@RequestParam int writeNo,
			HttpServletRequest request, HttpServletResponse response) throws IOException{
		String message = os.updateNoticeContent(writeNo, request);
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println(message);
	}
	
	//공지사항 작성버튼 누르면 반응
	@RequestMapping("noticeWrite")
	public void insertNoiticeWrite(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String message = os.noticeWrite(request);
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println(message);
	}
	
	@PostMapping(value="addReply", produces = "applacition/json; charset=utf-8")
	@ResponseBody //JSON{\"result\":true} 요거쓰려면 상단에 @RestController 작성하거나 아니면 해당메서드에 @ResponeseBody 요거작성해야함
	public String addReply(@RequestBody Map<String, Object> map)  {
		System.out.println("진입테스트");
		NoticeRepDTO dto = new NoticeRepDTO();
		dto.setReNick((String)map.get("id"));
		dto.setReId((String)map.get("id"));
		dto.setWriteGroup(Integer.parseInt((String)map.get("writeNo")));
		dto.setReComent((String)map.get("coment"));
		os.addReply(dto);
		return "{\"result\":true}";
	}
	
	@GetMapping(value = "replyData/{writeNo}", produces = "application/json; charset=utf-8")
	@ResponseBody
	public List<ReviewRepDTO> replyData(@PathVariable int writeNo){
		return os.getRepList(writeNo);
	}
	
	@PostMapping(value = "setAD")
	public String setAD(HttpServletRequest request, Model model, 
						@RequestParam(value="num", required = false, defaultValue ="1") int num) {
		os.setAD(request);
		os.viewNoticeList(model);
		os.promoList(model, num);
		ps.promoAllList(model);
		return "admin/operation";
	}
}
