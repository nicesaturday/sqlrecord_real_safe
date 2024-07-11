package com.sqlrecord.sqlrecord.cart.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sqlrecord.sqlrecord.cart.model.service.CartService;
import com.sqlrecord.sqlrecord.cart.model.vo.Cart;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequiredArgsConstructor
@RequestMapping("/cart")
public class CartForwardController {
	
	
	private final CartService cartService;
	
	
	
	@GetMapping("/member/{userid}")
	public String getMemberCartListPage(@PathVariable int userid , Model model , HttpServletRequest request) {
		HttpSession session = request.getSession();
		
		
		if(session.getAttribute("loginUser") == null) {
			return "redirect:/member/login.do";
		}
		log.info("이게?{}" , userid);
		
		List<Cart> cartList = cartService.getCartList(userid);
		model.addAttribute("list",cartList);
		for(Cart a : cartList) {
			log.info("카드 하나 : {}" , a.toString());
		}
		log.info("{}" , cartList);
		return "cart/cart";
	}
	
	@GetMapping("/guest/{userid}")
	public String getGuestCartListPage(@PathVariable int userid , Model model) {
		

		List<Cart> cartList = cartService.getGuestCartList(userid);
		model.addAttribute("glist",cartList);
		log.info("{}" , cartList);
		return "cart/cart";
	}
	
}
