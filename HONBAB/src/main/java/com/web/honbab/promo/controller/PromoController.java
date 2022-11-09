package com.web.honbab.promo.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.web.honbab.admin.service.OperService;
import com.web.honbab.promo.dto.PromoDTO;
import com.web.honbab.promo.service.PromoFileService;
import com.web.honbab.promo.service.PromoService;
import com.web.honbab.session.name.MemberSession;
import com.web.honbab.session.search.SearchSession;

@Controller
@RequestMapping(value="promotion")
public class PromoController implements SearchSession, MemberSession {
	
	@Autowired
	private PromoService ps;
	
	@Autowired
	private OperService os;
	
	@GetMapping("promoADList")
	public String promoADList(Model model, @RequestParam(value="num", required = false, defaultValue ="1") int num) {
		os.promoList(model, num);
		return "promotion/promoADList";
	}
	@GetMapping("promoAllList")
	public String promoAllList(Model model, @RequestParam(value="num", required = false, defaultValue ="1") int num,
								HttpSession session) {
		session.removeAttribute(SEARCHOPTION);
		session.removeAttribute(SEARCHVALUE);
		ps.promoList(model, num);
		String user= (String) session.getAttribute(LOGIN);
		if(user != null) {
			int result = ps.isBizUser(user);
			if(result == 1) {
				model.addAttribute("isBizUser", true);
			}
		}
		return "promotion/promoAllList";
	}
	
	@RequestMapping("writeForm")
	public String writeForm() {
		return "promotion/promoWriteForm";
		
	}
	
	@PostMapping("writeSave")
	public void writeSave(MultipartHttpServletRequest mul,
						  HttpServletResponse response,
						  HttpServletRequest request) throws IOException{
		String message = ps.writeSave(mul, request);
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter()	;
		out.println(message);
	}
	
	
	
	@GetMapping("contentView")
	public String contentView(@RequestParam int writeNo, Model model) {
		ps.contentView(writeNo, model);
		return "promotion/promoContentView";
	}
	
	@GetMapping("download")
	public void download(@RequestParam String imageFileName, HttpServletResponse response) throws Exception{
		response.addHeader("Context-disposition", "attachment; fileName="+imageFileName);
		File file = new File(PromoFileService.IMAGE_REPO+"\\"+imageFileName);
		FileInputStream in = new FileInputStream(file);
		FileCopyUtils.copy(in, response.getOutputStream());
		in.close();
	}
	
	@GetMapping("promoModifyForm")
	public String modify_form(@RequestParam int writeNo, Model model) {
		ps.contentView(writeNo, model);
		return "promotion/promoModifyForm";
	}
	
	@PostMapping("modify")
	public void modify(MultipartHttpServletRequest mul,
						  HttpServletResponse response,
						  HttpServletRequest request) throws IOException{
		String message = ps.modify(mul, request);
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter()	;
		out.println(message);
	}
	
	@GetMapping("delete")
	public void delete(@RequestParam int writeNo, @RequestParam String imageFileName,
					  HttpServletResponse response,
					  HttpServletRequest request) throws IOException{
		String message = ps.boardDelete(writeNo, imageFileName, request);
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter()	;
		out.println(message);
	}
	
	@GetMapping(value= "search")
	public String searchList(Model model,
			@RequestParam(value = "num", required = false, defaultValue = "1") int num,
			HttpSession session) throws IOException{
		ps.getSearch(model, num);
		return "promotion/promoAllList";
	}
	
	@PostMapping(value = "search") // 
	public String searchList(MultipartHttpServletRequest mul, Model model,
			@RequestParam(value = "num", required = false, defaultValue = "1") int num,
			HttpSession session) throws IOException{
		session.removeAttribute(SEARCHOPTION);
		session.removeAttribute(SEARCHVALUE);
		session.setAttribute(SEARCHOPTION, mul.getParameter("option"));
		session.setAttribute(SEARCHVALUE, mul.getParameter("text"));
		ps.getSearch(model, num);
		return "promotion/promoAllList";
	}
	
}
