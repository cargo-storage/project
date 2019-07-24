<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%request.setCharacterEncoding("utf-8");%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<title>보관 시작하기</title>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!-- Custom fonts for this template-->
<link href="${contextPath}/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">

<!-- Page level plugin CSS-->
<link href="${contextPath}/css/pignose.calendar.css" rel="stylesheet">

<!-- Custom styles for this template-->
<link href="${contextPath}/css/sb-admin.css" rel="stylesheet">

</head>
<body id="page-top">
	<jsp:useBean id="now" class="java.util.Date" />
	<fmt:formatDate value="${now}" pattern="YYYY-MM-dd" var="today" />
	<jsp:include page="Top.jsp"/>
	<div id="content-wrapper">

		<div class="container-fluid">

			<!-- Breadcrumbs-->
			<ol class="breadcrumb">
				<li>현재 페이지 :&nbsp;&nbsp;&nbsp;</li>
				<li class="breadcrumb-item"><a href="${contextPath}/ad/admin_main">관리자 종합 메뉴</a></li>
				<li class="breadcrumb-item"><a href="${contextPath}/ad/listTables?category=items">창고 현황 관리</a></li>
				<li class="breadcrumb-item active">보관 완료하기</li>
			</ol>
			
			<div class="card mb-3">
				<div class="card-header">
					<i class="fas"></i> 보관 중인 물건 정보
				</div>
				<div class="card-body row">
					<section class="col-lg-6">
						<span class="text-danger">보관 중인 물건 반환 날짜를 선택해 주세요</span>
						<div class="calendar"></div>
					</section>
					<section class="col-lg-6">
					<form action="${contextPath}/ad/release_check_confirm" method="post" id="itoc">
						<table class="table">
							<tr>
								<th colspan="2" class="table-info">고객  정보  ▼</th>
							</tr>
							<tr>
								<th>이름(이메일)</th>
								<td>${map.name} (${map.email})</td>
							</tr>
							<tr>
								<th>연락처</th>
								<td>${map.phone}</td>
							</tr>
							<tr>
								<th colspan="2" class="table-info">물품 정보  ▼</th>
							</tr>
							<tr>
								<th class="text-primary">물품 ID</th>
								<td>${map.item}</td>
							</tr>
							<tr>
								<th>창고 번호</th>
								<td>
								<c:choose>
									<c:when test="${map.overdue eq '-'}"><c:out value="${map.house}"/></c:when>
									<c:otherwise><c:out value="${map.overdue}"/></c:otherwise>							
								</c:choose>
								</td>
							</tr>
							<tr>
								<th>예정 보관 기간</th>
								<td>${map.start_day} ~ ${map.end_day}</td>
							</tr>
							<tr>
								<th>물건 반환일</th>
								<td><input type="text" class="form-control" name="return_day" value="${today}" readonly="readonly"></td>
							</tr>
							<tr>
								<th>물건 가격</th>
								<td><fmt:formatNumber value="${map.item_price}" type="currency" currencySymbol="￦"/></td>
							</tr>
							<tr>
								<td colspan="2" class="text-right">
									<button class="btn btn-info " type="button" onclick="check();"
									data-toggle="tooltip" data-placement="left" title="고객이 연체료 결제를 완료한 후 창고에 넣기 버튼을 누르세요.">
									출고 하기</button>
									<input class="btn btn-secondary" type="button" value="취소하기" onclick="history.back();">
								</td>
							</tr>
						</table>
						<input type="hidden" name="item" value="${map.item}">
						</form>
					</section>
				</div>
			</div>
		</div>
		<!-- /.container-fluid -->

		<!-- Sticky Footer -->
		<footer class="sticky-footer">
			<div class="container my-auto">
				<div class="copyright text-center my-auto">
					<span>Copyright © Your Website 2019</span>
				</div>
			</div>
		</footer>

	</div>
	<!-- /.content-wrapper -->

	</div>
	<!-- /#wrapper -->

	<!-- Scroll to Top Button-->
	<a class="scroll-to-top rounded" href="#page-top"> <i class="fas fa-angle-up"></i></a>
	<!-- Bootstrap core JavaScript-->
	<script src="${contextPath}/vendor/jquery/jquery.min.js"></script>
	<script src="${contextPath}/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Core plugin JavaScript-->
	<script src="${contextPath}/vendor/jquery-easing/jquery.easing.min.js"></script>

	<!-- Page level plugin JavaScript-->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.10.6/moment.min.js"></script>
	<script src="${contextPath}/vendor/pignose_calendar/pignose.calendar.full.min.js"></script>
	
	<!-- Custom scripts for all pages-->
	<script src="${contextPath}/js/sb-admin.js"></script>
	
	<script type="text/javascript">
	var start_day = '${map.start_day}';
	var end_day ='${map.end_day}';
	
	$(document).ready(function() {
		$('[data-toggle="tooltip"]').tooltip()
		
		$('.calendar').pignoseCalendar({
	    	lang: 'ko',
	    	minDate: moment(end_day)-1
	    });//end of pignoseCalendar
		
		//날짜는 클릭 못하게 여기서는 보여주는것만 하는거
		$('.pignose-calendar-body').addClass('clickX');
	});//end of ready
	
	function check() {
		if($('#item_price').val()=="") alert("보관할 물건의 가격을 입력해 주세요!");
		else{
			var check = confirm("결제를 완료하셨습니까?");
			if(check) $('#rtoi').submit();
			else return false;
		}
	}
	</script>
	<!-- Demo scripts for this page-->
<%-- 	<script src="${contextPath}/js/datatables-custom.js"></script> --%>
</body>
</html>