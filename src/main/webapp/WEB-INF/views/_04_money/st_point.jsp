<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Train Me 健身教練與學員的最佳媒合平台</title>

<link rel="stylesheet" href="../css/style.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css"
	integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l"
	crossorigin="anonymous" />
<link rel="stylesheet" href="../css/style_st_info.css">
<link rel="stylesheet" href="../css/style_st_lesson.css">
<link rel="stylesheet" href="../css/style_st_money.css">
<link rel="stylesheet" href="../css/style_nav.css">
<link rel="stylesheet" href="../css/style_footer.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">

<!-- 暫時代替側邊選單點擊變色的功能的CSS -->
<style>
.container{
	margin-bottom:100px;
}
.aside ul li:nth-child(4) a{
	color: #21d4a7;
}
.aside ul li:nth-child(4) a:hover{
	color: #fff;
}
</style>
</head>
<body>


	<!-- ============上方導覽列======================================================= -->
	<jsp:include page="/fragment/nav_st.jsp" />

	<div class="container">

		<!-- ============左側選單======================================================= -->
		<jsp:include page="/fragment/sidebar_st.jsp" />


		<!-- ============右側網頁======================================================= -->


		<!--         ============個人資料======================================================= -->

		<!-- 	<!-- ============上方導覽列======================================================= -->

		<!-- 	<header id="navbar"> -->
		<!-- 		<ul> -->
		<!-- 			<li class="logo"><a href="./0.index_navUpdate.html"><img -->
		<!-- 					src="../images/_03_MemberData/logo_black.png"></a></li> -->
		<!-- 			<div class="items"> -->
		<!-- 				<li><a href="#">關於我們</a></li> -->
		<!-- 				<li><a href="#">尋找教練</a></li> -->
		<!-- 				<li><a href="#">購物商城</a></li> -->
		<!-- 				<li><a href="#">運動論壇</a></li> -->
		<!-- 			</div> -->
		<!-- 			<li> -->
		<!-- 				<button class="nav_btn" onclick="Show();">登入/註冊</button> -->
		<!-- 			</li> -->
		<!-- 			<li class="member"><a href="#"> <img -->
		<!-- 					src="../images/_03_MemberData/member.jpg"> -->
		<!-- 			</a> -->
		<!-- 				<ul class="dropdown"> -->
		<!-- 					<div class="triangle"></div> -->
		<!-- 					<div class="dropdown_box"> -->
		<!-- 						<li><a href="./st_info.html">個人資料</a></li> -->
		<!-- 						<li><a href="#">我的課程</a></li> -->
		<!-- 						<li><a href="#">我的點數</a></li> -->
		<!-- 						<li><a href="#">訂單查詢</a></li> -->
		<!-- 						<li><a href="./st_info_account.html">帳號設定</a></li> -->
		<!-- 						<hr> -->
		<!-- 						<li><a href="#">登出</a></li> -->
		<!-- 					</div> -->
		<!-- 				</ul></li> -->
		<!-- 	</header> -->



		<!-- 	<div class="container"> -->

		<!-- 		<!-- ============左側選單======================================================= -->

		<!-- 		<div class="aside"> -->
		<!-- 			<ul id="menu"> -->
		<!-- 				<li class="mypage_title">我的主頁</li> -->
		<!-- 				<li><a id="a" href="./st_info.html"><i -->
		<!-- 						class="fas fa-user-circle"></i>個人資料</a></li> -->
		<!-- 				<li><a id="a" href="./st_info_lesson.html"><i -->
		<!-- 						class="far fa-list-alt"></i></i>我的課程</a></li> -->
		<!-- 				<li><a id="a" href="./st_info_money.html"><i -->
		<!-- 						class="fas fa-coins"></i>我的點數</a></li> -->
		<!-- 				<li><a id="a" href="#"><i class="fas fa-shopping-cart"></i>訂單查詢</a></li> -->
		<!-- 				<li><a id="a" href="./st_info_account.html"><i -->
		<!-- 						class="fas fa-tools"></i>帳號設定</a></li> -->
		<!-- 			</ul> -->
		<!-- 		</div> -->

		<!-- ============右側網頁======================================================= -->


		<!-- ============個人資料======================================================= -->

		<div class="content">
			<div class="title">
				<h3>我的點數</h3>
			</div>
			
			<!-- 說明 -->

                <div class="explain">
                    <div>在TrainMe以點數購課，1點對應新台幣1元。
                        您對教練發送預約課程的訊息後，教練接受您的預約時將立即扣點。</div>
                </div>

			<!-- ============即將開始的課程======================================================= -->

			<div class="info_wrap t lesson">
			
			
			<!-- 說明 -->

			<div class="balance">
				<p>
				<c:choose>
				<c:when test="${moneyLast.total_amount==0}"> 
				<i class="fas fa-coins"></i> 目前餘額 :0 元 </span>
				</c:when>
				<c:otherwise>
					<i class="fas fa-coins"></i> 目前餘額 : <span>${moneyLast.total_amount}</span>
					點
					</c:otherwise>
					</c:choose>
				</p>
								<button class="df_btn" onclick="location.href='/TrainMe/studentMoney/addPoint' ">我要儲值</button>
			</div>
			
				<table class="table border">
					<c:choose>
					<c:when test="${MoneyBean.size()==0}">   
					<thead class="thead">
							<tr>
								<th scope="col">交易日期</th>
								<th scope="col">上課日期</th>
								<th scope="col">課程名稱</th>
								<th scope="col">教練</th>
								<th scope="col">扣款類型</th>
								<th scope="col">扣款點數</th>
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
								<th scope="col">教練</th>
								<th scope="col">扣款類型</th>
								<th scope="col">扣款點數</th>
								<th scope="col">新增點數</th>
							</tr>
						</thead>
						<tbody class="tr_height">

							<c:forEach varStatus="i" begin="0" end="${MoneyBean.size()-1}">
								<tr>
									<td>${MoneyBean.get(i.current).change_time}</td>
									<c:if test="${MoneyBean.get(i.current).change_amount>0}">

										<td>-</td>
										<td>-</td>
										<td>-</td>
										<td>儲值點數</td>
										<td>-</td>
										<td>${MoneyBean.get(i.current).change_amount}</td>
									</c:if>

									<c:if test="${MoneyBean.get(i.current).change_amount < 0}">

										<td>${MoneyBean.get(i.current).getStudentCourseBean_H().getDate()}</td>
										<td>${MoneyBean.get(i.current).getStudentCourseBean_H().getTrainerCourseBean_H().getSkillBean_H().getName()}</td>
										<td>${MoneyBean.get(i.current).getStudentCourseBean_H().getTrainerCourseBean_H().getTrainerBean_H().getName()}</td>
										<td>購買課程</td>
										<td>${MoneyBean.get(i.current).change_amount}</td>
										<td>-</td>


									</c:if>


								</tr>
							</c:forEach>
						</tbody>
						</c:otherwise>
					</c:choose>
				</table>
			</div>



		</div>




	</div>

	<!-- footer -->
	<jsp:include page="/fragment/footer.jsp" />


</body>



<script src="./js/jquery-3.5.1.js"></script>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
	integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns"
	crossorigin="anonymous"></script>
<script>
	//選單點選變色(待補)

	//頁籤

	$('#pills-tab a').on('click', function(event) {
		event.preventDefault()
		$(this).tab('show')
	})
</script>


</html>