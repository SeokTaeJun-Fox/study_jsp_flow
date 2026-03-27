package com.app.product.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.app.Action;
import com.app.Result;
import com.app.dao.ProductDAO;
import com.app.vo.ProductVO;

public class ProductWriteOkController implements Action {

	@Override
	public Result excute(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
		Result result = new Result();
		ProductDAO productDAO = new ProductDAO();
		ProductVO productVO = new ProductVO();
		
		productVO.setProductName(req.getParameter("productName"));
		productVO.setProductPrice(Integer.valueOf(Integer.parseInt(req.getParameter("productPrice"))));
		productVO.setProductStock(Integer.valueOf(Integer.parseInt(req.getParameter("productStock"))));
		
		productDAO.save(productVO);
		
//		어디로, 어떻게
		result.setRedirect(true);
		result.setPath("/flow/read.product?id=" + productVO.getId());
		return result;
	}

}
