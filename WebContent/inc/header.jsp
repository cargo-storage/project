<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
</head>
<body>
    <nav class="navbar navbar-expand-md navbar-transparent fixed-top sticky-navigation navbar-light bg-white shadow-bottom" id="lambda-navbar">
        <a class="navbar-brand" href="${contextPath }/index.jsp">
            TEAM2 WAREHOUSE
        </a>
        <button class="navbar-toggler navbar-toggler-right border-0 collapsed" type="button" data-toggle="collapse" data-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-menu">
            <line x1="3" y1="12" x2="21" y2="12"></line><line x1="3" y1="6" x2="21" y2="6"></line><line x1="3" y1="18" x2="21" y2="18"></line></svg>
        </button>
        <div class="navbar-collapse collapse" id="navbarCollapse" style="">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item">
                    <a class="nav-link page-scroll" href="#company">회사소개</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link page-scroll" href="#houseinfo">이용안내</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link page-scroll" href="${contextPath }/re/info.me?warehouse=A">예약안내</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link page-scroll" href="#market">중고장터</a>
                </li>
				<li class="nav-item">
					<a class="nav-link page-scroll" href="#faq">FAQ</a>
				</li>
				<c:set var="email" value="${sessionScope.mdto.email }"/>
	          	<c:set var="name" value="${sessionScope.mdto.name }"/>
	          	<c:set var="admin" value="${sessionScope.mdto.admin }"/>
	         	
				<c:if test="${admin == 1 }">
        		<li class="nav-item">
                	<a class="nav-link page-scroll" href="#">관리자</a>
            	</li> 
	            </c:if>
               	<c:if test="${email ne null }">
				<li class="nav-item dropdown">
					<a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">마이페이지</a>
					<div class="dropdown-menu" id="dropdown-menu">
						<a class="dropdown-item" href="${contextPath }/member/mypage.jsp">내 정보</a>
						<a class="dropdown-item" href="${contextPath }/me/memberStatus.me?category=status">사용 내역</a>
						<a class="dropdown-item" href="${contextPath }/me/memberStatus.me?category=reservation">예약 현황</a>
					</div>
				</li>              
              	<a href="${contextPath }/me/logout.me" id="btn-logout" class="btn btn-primary btn-navbar">${name }님 환영합니다. 로그아웃 <i class="fas fa-sign-out-alt"></i></a>
				</c:if>
	            <c:set var="email" value="${mdto.email }"/>
	            <c:set var="name" value="${mdto.name }"/>
	            <c:if test="${email eq null }">
	                <div class="text-center">
	                	<a href="#loginModal" class="btn btn-primary btn-navbar trigger-btn" data-toggle="modal">로그인/회원가입</a>
	           		</div>
           		</c:if> 
              </ul>
        </div>
    </nav>
</body>
</html>
   