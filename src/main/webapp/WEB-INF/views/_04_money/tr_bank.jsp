<!DOCTYPE html>
<html lang="en">
<head>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%-- <fmt:formatDate value="${now}" pattern="yyyyMMdd" var="currentYear" /> --%>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Train Me 健身教練與學員的最佳媒合平台</title>/title>
<link rel="stylesheet" href="<c:url value='/css/style.css' />">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css"
	integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l"
	crossorigin="anonymous" />
<link rel="stylesheet" href="<c:url value='/css/style_nav.css' />">
<link rel="stylesheet" href="<c:url value='/css/style_st_lesson.css' />">
<link rel="stylesheet" href="<c:url value='/css/style_st_info.css' />">
<link rel="stylesheet" href="<c:url value='/css/style_st_money.css' />">
<link rel="stylesheet" href="<c:url value='/css/style_footer.css' />">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
<!-- 暫時代替側邊選單點擊變色的功能的CSS -->
<style>
.container {
	margin-bottom: 100px;
}
.aside ul li:nth-child(4) a{
	color: #21d4a7;
}
.aside ul li:nth-child(4) a:hover{
	color: #fff;
}
/* 查詢區間： */
.qr {
	margin: 10px 0 15px 0;
	display: flex;
	align-items: baseline;
	vertical-align: middle;
	font-size: 15px;
}

.qr li select {
	width: 150px;
	font-size: 14px;
}

.bank tr th:last-child {
	width: 150px;
}
</style>
</head>
<body>

	<!-- ============上方導覽列======================================================= -->
	<jsp:include page="/fragment/nav_tr.jsp" />



	<div class="container">

		<!-- ============左側選單======================================================= -->
		<jsp:include page="/fragment/sidebar_tr.jsp" />

		<!-- ============右側網頁======================================================= -->


		<!-- ============個人資料======================================================= -->

		<div class="content">
			<div class="title">
				<h3>帳戶查詢</h3>
			</div>
			<!-- 說明 -->

			<div class="explain">
				<p>查詢您在Train Me的課程帳款。</p>
			</div>

			<!-- ============帳戶======================================================= -->

			<div class="info_wrap t lesson">
				<div class="qr">
					<label>查詢區間：</label>
					<li><Select id="selector">
							<option value="three_months">最近三個月</option>
							<option value="six_months">最近半年</option>
							<option value="all_data">全部資料</option>
					</Select>
				</div>
				<!-- ============現在時間======================================================= -->
				<jsp:useBean id="now" class="java.util.Date" />
				<!-- ============最近三個月======================================================= -->
				<table class="table border" id="three_months">
					<thead class="thead bank">
						<tr>
							<th scope="col">交易日期</th>
							<th scope="col">款項名目</th>
							<th scope="col">轉出帳號</th>
							<th scope="col">轉入帳號</th>
							<th scope="col">轉入金額</th>
						</tr>
					</thead>
					<c:if test="${AccountBean.size()>0}">
						<tbody class="tr_height">
							<c:forEach varStatus="i" begin="0" end="${AccountBean.size()-1}">
								<%--<c:set var="now" value="<%=new java.util.Date()%>" /> --%>			
								<c:set var="other" value="${AccountBean.get(i.current).time}" />
								<fmt:parseNumber value="${ now.time / (1000*60*60*24) }"
									integerOnly="true" var="nowDays" scope="request" />
								<fmt:parseNumber value="${ other.time / (1000*60*60*24) }"
									integerOnly="true" var="otherDays" scope="page" />
								<c:if test="${nowDays - otherDays < 90}">
									<tr>
										<td>${AccountBean.get(i.current).time}</td>
										</a>
										<td>${AccountBean.get(i.current).getNote()}</td>
										<td>111111111111</td>
										<td>${AccountBean.get(i.current).getTrainerBean_H().getBank_account()}</td>
										<td>${AccountBean.get(i.current).getTotal_amount()}元</td>
										<%--<td><fmt:formatDate pattern="yyyy-MM-dd" value="${now}" /></td> --%>
									</tr>
								</c:if>
							</c:forEach>
						</tbody>
					</c:if>
				</table>
				<!-- ============最近半年======================================================= -->
				<table class="table border" id="six_months" style="display: none">
					<thead class="thead bank">
						<tr>
							<th scope="col">交易日期</th>
							<th scope="col">款項名目</th>
							<th scope="col">轉出帳號</th>
							<th scope="col">轉入帳號</th>
							<th scope="col">轉入金額</th>
						</tr>
					</thead>
					<c:if test="${AccountBean.size()>0}">
						<tbody class="tr_height">
							<c:forEach varStatus="i" begin="0" end="${AccountBean.size()-1}">
								<%--<c:set var="now" value="<%=new java.util.Date()%>" /> --%>							
								<c:set var="other" value="${AccountBean.get(i.current).time}" />
								<fmt:parseNumber value="${ now.time / (1000*60*60*24) }"
									integerOnly="true" var="nowDays" scope="request" />
								<fmt:parseNumber value="${ other.time / (1000*60*60*24) }"
									integerOnly="true" var="otherDays" scope="page" />
								<c:if test="${nowDays - otherDays < 182}">
									<tr>
										<td>${AccountBean.get(i.current).time}</td>
										<td>${AccountBean.get(i.current).getNote()}</td>
										<td>111111111111</td>
										<td>${AccountBean.get(i.current).getTrainerBean_H().getBank_account()}</td>
										<td>${AccountBean.get(i.current).getTotal_amount()}元</td>
									</tr>
								</c:if>
							</c:forEach>
						</tbody>
					</c:if>
				</table>
				<!-- ============全部資料======================================================= -->
				<table class="table border" id="all_data" style="display: none">
					<thead class="thead bank">
						<tr>
							<th scope="col">交易日期</th>
							<th scope="col">款項名目</th>
							<th scope="col">轉出帳號</th>
							<th scope="col">轉入帳號</th>
							<th scope="col">轉入金額</th>
						</tr>
					</thead>
					<c:if test="${AccountBean.size()>0}">
						<tbody class="tr_height">
							<c:forEach varStatus="i" begin="0" end="${AccountBean.size()-1}">
								<tr>
									<td>${AccountBean.get(i.current).time}</td>
									<td>${AccountBean.get(i.current).getNote()}</td>
									<td>111111111111</td>
									<td>${AccountBean.get(i.current).getTrainerBean_H().getBank_account()}</td>
									<td>${AccountBean.get(i.current).getTotal_amount()}元</td>
								</tr>
							</c:forEach>
						</tbody>
					</c:if>
				</table>
			</div>
		</div>
	</div>
	
	
		<!-- footer -->
	<jsp:include page="/fragment/footer.jsp" />
	
	
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
		integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns"
		crossorigin="anonymous"></script>
	<script>
		//選單點選變色(待補)

		var changeTab = null;
		//頁籤

		// 		$('#pills-tab a').on('click', function(event) {
		// 			event.preventDefault()
		// 			console.log(this);
		// 			$(this).tab('show')
		// 		})

		//頁籤
		$(function() {
			$('#selector').change(function() {
				$("table").hide();
				$('#' + $(this).val()).show();
			});
		});
	</script>
</body>
</html>