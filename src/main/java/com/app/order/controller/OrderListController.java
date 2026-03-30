package com.app.order.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.app.Action;
import com.app.Result;
import com.app.dao.OrderDAO;
import com.app.dto.OrderDTO;

public class OrderListController implements Action {

	@Override
	public Result excute(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
		Result result = new Result();
		OrderDAO orderDAO = new OrderDAO();
		
		req.setAttribute("orders", orderDAO.findAll());
		
		result.setPath("/order/list.jsp");
		
		return result;
	}

}
