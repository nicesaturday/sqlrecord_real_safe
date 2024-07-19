<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
  <div id="section_serch">
    <div id="section_serch_box">
      <div id="section_serch_item1">
      	<div id="section_serch_item_logo">
      	 <a href="${hpath }">
      	  <img src="${hpath }/resources/imgs/homepageLogo/logo.png">
      	  </a>
      	</div>
      	<div class="section_serch_item_box">
      	  <p class="section_serch_item_textBox"><a href="${hpath }/productFor/list/TURNTABLES">TURNTABLES</a></p>
      	</div>
      	<div class="section_serch_item_box">
      	  <p class="section_serch_item_textBox"><a href="${hpath }/productFor/list/SPEAKERS">SPEAKERS</a></p>
      	</div>
      	<div class="section_serch_item_box">
      	  <p class="section_serch_item_textBox"><a href="${hpath }/productFor/list/RADIOS">RADIOS</a></p>
      	</div>
      	<div class="section_serch_item_box">
      	  <p class="section_serch_item_textBox"><a href="#">CD&nbspPLAYERS</a></p>
      	</div>
      	<div class="section_serch_item_box">
      	  <p class="section_serch_item_textBox"><a href="#">CASSETTE&nbspPLAYERS</a></p>
      	</div>
      	<div class="section_serch_item_box">
      	  <p class="section_serch_item_textBox"><a href="#">MEDIA&nbspSTANDS</a></p>
      	</div>
      	<div class="section_serch_item_box">
      	  <p class="section_serch_item_textBox"><a href="${hpath }/productFor/list/VINYL">VINYL</a></p>
      	</div>
      </div>
      
      <div id="section_serch_item2">
        <div id="section_serch_item1_cartBox">
         <div style="width: 40px; height: 40px; padding: 2rem 0.3rem; cursor: pointer">
          <c:choose>

          	<c:when test="${ not empty loginUser }">
          		<a href="${hpath }/cart/member/${ loginUser.memberNo}">
           			<img src="${hpath }/resources/imgs/homepageLogo/cart.png">
          		</a>
          	</c:when>
          	<c:when test="${ not empty loginGuest }">
          		<a href="${hpath }/cart/guest/${ guestUser.guest_no}">
           			<img src="${hpath }/resources/imgs/homepageLogo/cart.png">
          		</a>
          	</c:when>
          	<c:otherwise>
          		<a href="${hpath }/member/login.do">
           			<img src="${hpath }/resources/imgs/homepageLogo/cart.png">
          		</a>
          	</c:otherwise>
          </c:choose>
         </div>
        </div>
        <div id="section_serch_item1_inputBox">
          <div id="section_serch_item1_inputBox_item">
            <div style="width: 40px; height: 40px;">
              <svg xmlns="http://www.w3.org/2000/svg" height="20" width="20" viewBox="0 0 512 512"><!--!Font Awesome Free 6.5.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2024 Fonticons, Inc.--><path fill="#aeaab1" d="M416 208c0 45.9-14.9 88.3-40 122.7L502.6 457.4c12.5 12.5 12.5 32.8 0 45.3s-32.8 12.5-45.3 0L330.7 376c-34.4 25.2-76.8 40-122.7 40C93.1 416 0 322.9 0 208S93.1 0 208 0S416 93.1 416 208zM208 352a144 144 0 1 0 0-288 144 144 0 1 0 0 288z"/></svg>
            </div>
            <input id="section_serch_item1_input" type="text" placeholder="스토어 검색">
      	  </div>
      	</div>
      </div>
    </div>
  </div>