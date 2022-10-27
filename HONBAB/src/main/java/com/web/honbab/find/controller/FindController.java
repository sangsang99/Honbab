package com.web.honbab.find.controller;

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
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.web.honbab.find.dto.FindRepDTO;
import com.web.honbab.find.service.FindService;
import com.web.honbab.review.dto.ReviewRepDTO;

@Controller
@RequestMapping("find")
public class FindController {
	
	
	//아ㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏ
	@Autowired
	private FindService fs;
	
	@RequestMapping(value="findAllList")
	public String findAllList(Model model, 
								@RequestParam(value = "num", required = false, defaultValue = "1") int num) {
		fs.findAllList(model, num);
		return "find/findAllList";
	}
	
	@RequestMapping(value = "upViews")
	public String upViews(@RequestParam int uSeq) {
		fs.upViews(uSeq);
		return "redirect:findContent?uSeq=" + uSeq;
	}
	
	@RequestMapping("findContent")
	public String findContent(@RequestParam int uSeq, Model model) {
		fs.findContent(uSeq, model);
		
		return "find/findContent";
	}
	
	@RequestMapping("findWriteForm")
	public String findWriteForm(Model model) {
		return "find/findWriteForm";
	}
	
	@PostMapping("findWrite")
	public void findSave(MultipartHttpServletRequest mul, HttpServletRequest request, HttpServletResponse response) throws IOException{
		String message = fs.findSave(mul, request);
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println(message);
	}

	
	
	@GetMapping("find_modify_form")
	public String findModifyForm(@RequestParam int uSeq, Model model) {
		fs.findContent(uSeq, model);
		
		return "find/findModifyForm";
	}
	
	@PostMapping("find_Modify")
	public void findModify(MultipartHttpServletRequest mul, HttpServletResponse response, HttpServletRequest request) throws IOException {
		String message = fs.findModify(mul, request);
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println(message);
	}
	
	@GetMapping("find_delete")
	public void find_Delete(@RequestParam int uSeq, HttpServletResponse response, HttpServletRequest request) throws Exception {
		String message = fs.findDelete(uSeq, request);
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println(message);
		
	}

	@PostMapping(value="addReply", produces = "applacition/json; charset=utf-8")
	@ResponseBody //JSON{\"result\":true} 요거쓰려면 상단에 @RestController 작성하거나 아니면 해당메서드에 @ResponeseBody 요거작성해야함
	public String addReply(@RequestBody Map<String, Object> map, HttpSession session) {
		FindRepDTO dto = new FindRepDTO();
		//dto.setId((String)session.getAttribute(LOGIN)); //session 諛� 濡쒓렇�씤 濡쒖쭅 �셿�꽦�썑 �닔�젙
		dto.setuReNick("testID");
		dto.setuSeqGroup(Integer.parseInt((String)map.get("uSeq")));
		dto.setuReComent((String)map.get("content"));
		fs.addReply(dto);
		return "{\"result\":true}";
	}
	
	@GetMapping(value = "replyData/{uSeq}", produces = "application/json; charset=utf-8")
	@ResponseBody
	public List<FindRepDTO> replyData(@PathVariable int uSeq){
		return fs.getRepList(uSeq);
	}
}
