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
import com.web.honbab.session.name.MemberSession;
import com.web.honbab.session.search.SearchSession;

@Controller
@RequestMapping("find")
public class FindController implements SearchSession, MemberSession{
	
	
	@Autowired
	private FindService fs;
	
	@RequestMapping(value="findAllList")
	public String findAllList(Model model, 
								@RequestParam(value = "num", required = false, defaultValue = "1") int num,
								HttpSession session) {
		session.removeAttribute(SEARCHOPTION);
		session.removeAttribute(SEARCHOPTION2);
		session.removeAttribute(SEARCHOPTION3);
		session.removeAttribute(SEARCHVALUE);
		fs.findAllList(model, num);
		return "find/findAllList";
	}
	
	@RequestMapping(value = "upViews")
	public String upViews(@RequestParam int writeNo) {
		fs.upViews(writeNo);
		return "redirect:findContent?writeNo=" + writeNo;
	}
	
	@RequestMapping("findContent")
	public String findContent(@RequestParam int writeNo, Model model) {
		fs.findContent(writeNo, model);
		
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
	public String findModifyForm(@RequestParam int writeNo, Model model) {
		fs.findContent(writeNo, model);
		
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
	public void find_Delete(@RequestParam int writeNo, HttpServletResponse response, HttpServletRequest request) throws Exception {
		String message = fs.findDelete(writeNo, request);
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println(message);
		
	}

	@PostMapping(value="addReply", produces = "applacition/json; charset=utf-8")
	@ResponseBody //JSON{\"result\":true} 요거쓰려면 상단에 @RestController 작성하거나 아니면 해당메서드에 @ResponeseBody 요거작성해야함
	public String addReply(@RequestBody Map<String, Object> map, HttpSession session) {
		FindRepDTO dto = new FindRepDTO();
		//dto.setId((String)session.getAttribute(LOGIN)); //session 諛� 濡쒓렇�씤 濡쒖쭅 �셿�꽦�썑 �닔�젙
		dto.setReNick((String)session.getAttribute(NICK));
		dto.setReId((String)session.getAttribute(LOGIN));
		dto.setWriteGroup(Integer.parseInt((String)map.get("writeNo")));
		dto.setReComent((String)map.get("coment"));
		fs.addReply(dto);
		return "{\"result\":true}";
	}
	
	@GetMapping(value = "replyData/{writeNo}", produces = "application/json; charset=utf-8")
	@ResponseBody
	public List<FindRepDTO> replyData(@PathVariable int writeNo){
		return fs.getRepList(writeNo);
	}
	
	@GetMapping(value="delete1")
	  //@ResponseBody
	  public String delete(@RequestParam(value="writeGroup")Integer writeNo, Model model ) { 
		  model.addAttribute("writeNo",writeNo);
		  fs.deleteBoard(writeNo); 
	  return "redirect:/find/findContent?writeGroup=" + writeNo; 
	  }
	
	@GetMapping(value= "search")
	public String searchList(Model model,
			@RequestParam(value = "num", required = false, defaultValue = "1") int num,
			HttpSession session) throws IOException{
		fs.searchReview(model, num);
		return "find/findAllList";
	}
	
	@PostMapping(value = "search") // 
	public String searchList(MultipartHttpServletRequest mul, Model model,
			@RequestParam(value = "num", required = false, defaultValue = "1") int num,
			HttpSession session) throws IOException{
		session.removeAttribute(SEARCHOPTION);
		session.removeAttribute(SEARCHOPTION2);
		session.removeAttribute(SEARCHOPTION3);
		session.removeAttribute(SEARCHVALUE);
		session.setAttribute(SEARCHOPTION, mul.getParameter("region"));
		session.setAttribute(SEARCHOPTION2, mul.getParameter("gender"));
		session.setAttribute(SEARCHOPTION3, mul.getParameter("age"));

		fs.searchReview(model, num);
		return "find/findAllList";
	}
	
}
