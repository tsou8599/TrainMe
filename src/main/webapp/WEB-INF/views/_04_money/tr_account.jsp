
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Train Me 健身教練與學員的最佳媒合平台</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/style.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/style_st_info.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/style_st_account.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/style_nav.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/style_tr_info.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style_footer.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">
<!-- <link rel="stylesheet" -->
<!-- 	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" -->
<!-- 	integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" -->
<!-- 	crossorigin="anonymous" /> -->
<!-- <link rel="stylesheet" href="./css/style_st_lesson.css"> -->
<style>
/* 暫時代替側邊選單點擊變色的功能的CSS */
.aside ul li:nth-child(4) a{
	color: #21d4a7;
}
.aside ul li:nth-child(4) a:hover{
	color: #fff;
}
</style>
<script src="${pageContext.request.contextPath}/js/jquery-3.5.1.js"></script>
</head>
<body>
	<!-- ============上方導覽列======================================================= -->
	<jsp:include page="/fragment/nav_tr.jsp" />

	<!-- 編輯資料 -->

	<div class="container">
		<!-- ============左側選單======================================================= -->
		<jsp:include page="/fragment/sidebar_tr.jsp" />

		<div class="content">
			<div class="title">
				<h3>帳戶查詢</h3>
			</div>

			<!-- 說明 -->
			<div class="info_wrap t lesson">
				<table class="table border">

					<thead class="thead-light">
						<tr>
							<th scope="col">轉入時間</th>
							<th scope="col">轉出帳號</th>
							<th scope="col">轉入帳號</th>
							<th scope="col">轉入金額</th>
							<th scope="col">備註</th>
						</tr>
					</thead>
					<tbody class="tr_height">

						<c:if test="${AccountBean.size() != 0}">
							<c:forEach varStatus="i" begin="0" end="${AccountBean.size()-1}">
								<tr>
									<td>${AccountBean.get(i.current).time}</td>
									<td>54612344356885</td>
									<td>${AccountBean.get(i.current).getTrainerBean_H().getBank_account()}</td>
									<td>${AccountBean.get(i.current).getTotal_amount()}元</td>
									<td>${AccountBean.get(i.current).getNote()}</td>

								</tr>
							</c:forEach>
						</c:if>
					</tbody>
				</table>
				
				
					<!-- footer -->
	<jsp:include page="/fragment/footer.jsp" />
</body>
</html>