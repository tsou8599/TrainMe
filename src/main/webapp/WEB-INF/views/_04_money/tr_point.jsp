<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>學員-我的點數</title>

<link rel="stylesheet" href="../css/style.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css"
	integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l"
	crossorigin="anonymous" />
<link rel="stylesheet" href="../css/style_st_info.css">
<link rel="stylesheet" href="../css/style_st_lesson.css">
<link rel="stylesheet" href="../css/style_st_money.css">
<link rel="stylesheet" href="../css/style_nav.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">

<!-- 暫時代替側邊選單點擊變色的功能的CSS -->
<style>
.aside ul li:nth-child(4) a {
	color: #21d4a7;
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
				<h3>我的點數</h3>
			</div>
			
			<!-- 說明 -->

                <div class="explain">
<!--                     <div>在TrainMe以點數購課，1點對應新台幣1元。 -->
<!--                         您對教練發送預約課程的訊息後，教練接受您的預約時將立即扣點。</div> -->
                </div>

			<!-- ============即將開始的課程======================================================= -->

			<div class="info_wrap t lesson">
			
			
			<!-- 說明 -->

			<div class="balance">
				<p>
				<c:choose>
				<c:when test="${trMonthPoint.size() == 0}"> 
				<i class="fas fa-coins"></i> 本月點數 :0 元 </span>
				</c:when>
				<c:otherwise>
					<i class="fas fa-coins"></i> 本月點數 : <span>${trMonthPoint.get((trMonthPoint.size()-1)).total_amount}</span>
					點
					</c:otherwise>
					</c:choose>
				</p>
			</div>
			
				<table class="table border">
					<c:choose>
					<c:when test="${trMonthPoint.size()==0}">   
					<thead class="thead">
							<tr>
								<th scope="col">交易日期</th>
								<th scope="col">上課日期</th>
								<th scope="col">課程名稱</th>
								<th scope="col">學生</th>
								<th scope="col">新增點數</th>
							</tr>
						</thead>
					 </c:when> 
					 <c:otherwise>
						<thead class="thead">
							<tr>
								<th scope="col">交易日期</th>
								<th scope="col">上課日期</th>
								<th scope="col">課程名稱</th>
								<th scope="col">學生</th>
								<th scope="col">新增點數</th>
							</tr>
						</thead>
						<tbody class="tr_height">
						 <c:if test="${trMonthPoint != null}">
						
							<c:forEach varStatus="i" begin="0" end="${trMonthPoint.size()-1}">
								<tr>
									<td>${trMonthPoint.get(i.current).change_time}</td>
									

										<td>${trMonthPoint.get(i.current).getStudentCourseBean_H().getDate()}</td>
										<td>${trMonthPoint.get(i.current).getStudentCourseBean_H().getTrainerCourseBean_H().getSkillBean_H().getName()}</td>
										<td>${trMonthPoint.get(i.current).getStudentCourseBean_H().getStudentBean_H().getName()}</td>
										<td>${trMonthPoint.get(i.current).change_amount}</td>
										




								</tr>
							</c:forEach>
							 </c:if>
						</tbody>
						</c:otherwise>
					</c:choose>
				</table>
			</div>



		</div>




	</div>

</body>



<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
	integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns"
	crossorigin="anonymous"></script>
<script>
	
	
	
	
</script>


</html>