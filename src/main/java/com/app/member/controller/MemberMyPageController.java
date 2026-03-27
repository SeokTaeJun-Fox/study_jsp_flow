package com.app.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.app.Action;
import com.app.Result;
import com.app.dao.MemberDAO;
import com.app.vo.MemberVO;

public class MemberMyPageController implements Action {

	@Override
	public Result excute(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
		Result result = new Result();
		HttpSession session = req.getSession();
		MemberDAO memberDAO = new MemberDAO();
		
		String memberEmail = (String)session.getAttribute("memberEmail");
		MemberVO loginMember = memberDAO
				.findByMemberEmail(memberEmail)
				.orElseThrow(RuntimeException::new);
		
		req.setAttribute("loginMember", loginMember);
		result.setPath("/member/my-page.jsp");
		
		return result;
	}

}
