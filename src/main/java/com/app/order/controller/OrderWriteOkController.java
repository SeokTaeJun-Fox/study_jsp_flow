package com.app.order.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.app.Action;
import com.app.Result;
import com.app.dao.MemberDAO;
import com.app.dao.OrderDAO;
import com.app.dao.ProductDAO;
import com.app.vo.OrderVO;
import com.app.vo.ProductVO;

public class OrderWriteOkController implements Action {

   @Override
   public Result excute(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
      Result result = new Result();
      MemberDAO memberDAO = new MemberDAO();
      OrderDAO orderDAO = new OrderDAO();
      ProductDAO productDAO = new ProductDAO();
      HttpSession session = req.getSession();
      
      String memberEmail = (String)session.getAttribute("memberEmail");
      Long memberId = memberDAO.selectIdByMemberEmail(memberEmail);
      
      String[] productIds = req.getParameterValues("productId");
      String[] orderCounts = req.getParameterValues("orderCount");
      
      for(int i = 0; i < productIds.length; i++) {
         OrderVO orderVO = new OrderVO();
         
         Long productId = Long.parseLong(productIds[i]);
         Integer orderCount = Integer.parseInt(orderCounts[i]);
         
         orderVO.setOrderCount(orderCount);
         orderVO.setProductId(productId);
         orderVO.setMemberId(memberId);
         
         orderDAO.save(orderVO);
         
         ProductVO productVO = productDAO.findById(productId).get();
         productVO.setProductStock(productVO.getProductStock() - orderCount);
         
         productDAO.update(productVO);
      }
      
      result.setRedirect(true);
      result.setPath("/flow/list.order");
      
      return result;
   }

}
