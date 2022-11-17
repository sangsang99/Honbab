package com.web.honbab.member.interceptor;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.web.honbab.session.name.MemberSession;

@Component
public class MemberInterceptor extends HandlerInterceptorAdapter implements MemberSession {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {

		HttpSession session = request.getSession();
		if (session.getAttribute(LOGIN) == null) {
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('로그인 후 작성 가능');" + "location.href='" + request.getContextPath()
					+ "/member/login' </script>");
			response.sendRedirect("/honbab/index");

			return false;
		}
		return true;

	}

}
