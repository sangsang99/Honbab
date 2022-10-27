package com.web.honbab.member.interceptor;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.web.honbab.session.name.MemberSession;

public class MemberInterceptor extends HandlerInterceptorAdapter implements MemberSession {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {

		HttpSession session = request.getSession();
		if(session.getAttribute(LOGIN) == null) {
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('로그인 하세요');" 
			           + "location.href='"
					   + request.getContextPath()
					   + "/member/login'</script>");
			return false;
		}
		return true;
		
	}
}
