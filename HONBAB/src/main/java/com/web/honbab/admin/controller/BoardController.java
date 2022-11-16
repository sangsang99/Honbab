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

import com.web.honbab.admin.service.BoardService;
import com.web.honbab.challenge.service.ChallengeService;
import com.web.honbab.find.dto.FindRepDTO;
import com.web.honbab.find.service.FindService;
import com.web.honbab.promo.dto.PromoRepDTO;
import com.web.honbab.promo.service.PromoService;
import com.web.honbab.review.dto.ReviewRepDTO;
import com.web.honbab.review.service.ReviewService;
import com.web.honbab.session.name.MemberSession;

////
@Controller
@RequestMapping("admin")
public class BoardController implements MemberSession {

	@Autowired
	private BoardService bs;

	@Autowired
	private FindService fs;

	@Autowired
	private ReviewService rs;

	@Autowired
	private PromoService ps;

	@Autowired
	private ChallengeService cs;

	@RequestMapping("boardManagement")
	public String boardManagement() {

		return "admin/boardManagement";
	}

	@RequestMapping("findBoard")
	public String findBoard(Model model, @RequestParam(value = "num", required = false, defaultValue = "1") int num) {
		fs.findAllList(model, num);

		return "admin/findBoard";
	}

	@RequestMapping(value = "upViews")
	public String upViews(@RequestParam int writeNo) {
		fs.upViews(writeNo);
		return "redirect:findContent?writeNo=" + writeNo;
	}

	@RequestMapping("findContent")
	public String findContent(@RequestParam int writeNo, Model model) {
		fs.findContent(writeNo, model);

		return "admin/findContent";
	}

	@GetMapping("find_delete")
	public void find_Delete(@RequestParam int writeNo, HttpServletResponse response, HttpServletRequest request)
			throws Exception {
		String message = bs.findDelete(writeNo, request);
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println(message);

	}

	@GetMapping(value = "delete1")
	// @ResponseBody
	public String delete(@RequestParam(value = "writeGroup") Integer writeNo, Model model) {
		model.addAttribute("writeNo", writeNo);
		bs.deleteBoard(writeNo);
		return "redirect:/admin/findContent?writeGroup=" + writeNo;
	}

	@PostMapping(value = "addReply", produces = "applacition/json; charset=utf-8")
	@ResponseBody // JSON{\"result\":true} 요거쓰려면 상단에 @RestController 작성하거나 아니면 해당메서드에
					// @ResponeseBody 요거작성해야함
	public String addReply(@RequestBody Map<String, Object> map, HttpSession session) {
		FindRepDTO dto = new FindRepDTO();
		dto.setReNick("testID");
		dto.setReId((String) session.getAttribute(LOGIN));
		dto.setWriteGroup(Integer.parseInt((String) map.get("writeNo")));
		dto.setReComent((String) map.get("coment"));
		fs.addReply(dto);
		return "{\"result\":true}";
	}

	@GetMapping(value = "replyData/{writeNo}", produces = "application/json; charset=utf-8")
	@ResponseBody
	public List<FindRepDTO> replyData(@PathVariable int writeNo) {
		return fs.getRepList(writeNo);
	}

	@RequestMapping("challBoard")
	public String challBoard(Model model, @RequestParam(value = "num", required = false, defaultValue = "1") int num) {
		cs.challengeAllList(model, num);
		return "admin/challBoard";
	}

	@GetMapping("challContent")
	public String challengeView(@RequestParam int writeNo, Model model) {
		cs.challengeView(writeNo, model);

		return "admin/challContent";
	}

	@GetMapping("challengeDelete")
	public void challengeDelete(@RequestParam int writeNo, HttpServletResponse response, HttpServletRequest request)
			throws Exception {
		String message = bs.challengeDelete(writeNo, request);
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println(message);

	}

	@RequestMapping("honbabBoard")
	public String honbabBoard(Model model, @RequestParam(value = "num", required = false, defaultValue = "1") int num) {
		rs.reviewAllList(model, num);
		return "admin/honbabBoard";
	}

	@RequestMapping(value = "upViews1")
	public String upViews1(@RequestParam int writeNo) {
		bs.upViews1(writeNo);
		return "redirect:honbabContent?writeNo=" + writeNo;
	}

	@RequestMapping(value = "honbabContent")
	public String honbabContent(@RequestParam int writeNo, Model model) {
		rs.reviewContent(writeNo, model);
		return "admin/honbabContent";
	}

	@GetMapping("review_delete")
	public void review_delete(@RequestParam int writeNo, @RequestParam String imageFileName, HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		String message = bs.reviewDelete(writeNo, imageFileName, request);
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println(message);
	}

	@GetMapping(value = "delete2")
	// @ResponseBody
	public String delete1(@RequestParam(value = "writeGroup") Integer writeNo, Model model) {
		model.addAttribute("writeNo", writeNo);
		bs.deleteBoard1(writeNo);
		return "redirect:/admin/honbabContent?writeGroup=" + writeNo;
	}

	@PostMapping(value = "addReply1", produces = "applacition/json; charset=utf-8")
	@ResponseBody // JSON{\"result\":true} 요거쓰려면 상단에 @RestController 작성하거나 아니면 해당메서드에
					// @ResponeseBody 요거작성해야함
	public String addReply1(@RequestBody Map<String, Object> map, HttpSession session) {
		ReviewRepDTO dto = new ReviewRepDTO();
		dto.setReNick("testID");
		dto.setReId((String) session.getAttribute(LOGIN));
		dto.setWriteGroup(Integer.parseInt((String) map.get("writeNo")));
		dto.setReComent((String) map.get("coment"));
		rs.addReply(dto);
		return "{\"result\":true}";
	}

	@GetMapping(value = "replyData1/{writeNo}", produces = "application/json; charset=utf-8")
	@ResponseBody
	public List<ReviewRepDTO> replyData1(@PathVariable int writeNo) {
		return rs.getRepList(writeNo);
	}

	@RequestMapping("promoBoard")
	public String promoBoard(Model model, @RequestParam(value = "num", required = false, defaultValue = "1") int num) {
		ps.promoList(model, num);
		return "admin/promoBoard";
	}

	@RequestMapping(value = "promoContent")
	public String promoContent(@RequestParam int writeNo, Model model) {
		ps.contentView(writeNo, model);
		return "admin/promoContent";
	}

	@GetMapping("delete")
	public void delete(@RequestParam int writeNo, @RequestParam String imageFileName, HttpServletResponse response,
			HttpServletRequest request) throws IOException {
		String message = bs.boardDelete(writeNo, imageFileName, request);
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println(message);
	}

	@PostMapping(value = "addReply2", produces = "applacition/json; charset=utf-8")
	public String addReply2(@RequestBody Map<String, Object> map, HttpSession session) {
		PromoRepDTO dto = new PromoRepDTO();
		dto.setId((String) session.getAttribute(LOGIN));
		dto.setWrite_group(Integer.parseInt((String) map.get("write_no")));
		dto.setTitle((String) map.get("title"));
		dto.setContent((String) map.get("content"));
		dto.setStar(Integer.parseInt((String) map.get("star")));

		ps.addReply(dto);
		return "{\"result\":true}";
	}

	@GetMapping(value = "replyData2/{write_group}", produces = "application/json; charset=utf-8")
	public List<PromoRepDTO> replyData2(@PathVariable int write_group) {
		return ps.getRepList(write_group);
	}

	@GetMapping(value = "delete3")
	public String delete2(@RequestParam(value = "write_group", required = false) Integer write_group) {
		bs.deleteBoard2(write_group);
		return "redirect:promoContent?write_group=" + write_group;
	}

}
