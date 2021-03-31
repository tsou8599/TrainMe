<!DOCTYPE html>
<html lang="en">
<head>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<link rel="stylesheet" href="../css/style_nav.css">
<link rel="stylesheet" href="<c:url value='/css/style_st_lesson.css' />">
<link rel="stylesheet"	href="<c:url value='/css/style_footer.css' />">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">
	
<style>
.aside ul li:nth-child(1) a{
	color: #21d4a7;
}
.aside ul li:nth-child(1) a:hover{
	color: #fff;
}
.container{
	margin-bottom:100px;
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

		<div class="main">

			<!-- ============個人資料======================================================= -->
			<div class="content">
				<div class="title">
					<h3>個人主頁</h3>
					<a href="<c:url value='/student_info_edit/${LoginOK.id}' />"
						id="edit_info"><i class="fas fa-pen-square"></i>
					</a>
				</div>

				<div class="info_wrap">

					<div class="wrap picture">
						<c:choose>
							<c:when test="${empty  LoginOK.profile_image}">
								<img id="photo" name="photo"
									src="${pageContext.request.contextPath}/images/_03_MemberData/member.jpg">
							</c:when>
							<c:otherwise>
								<img id="photo" name="photo"
									src="/upload/${LoginOK.profile_image}">
							</c:otherwise>
						</c:choose>

					</div>

					<div class="wrap profile">

						<div class="wrap_right">

							<div class="wrap_profile left">

								<div class="wp_div">
									<h2>${LoginOK.name}</h2>
									<p>${LoginOK.nickname}</p>
								</div>
								<div class="wp_div">
									<p>
										帳號 : <span>${LoginOK.email}</span>
									</p>
								</div>
								<div class="wp_div">
									<p>
										點數餘額 : <span> 
											
										<c:choose>
												<c:when test="${TotalAmount == null}">
													0
												</c:when>
												<c:otherwise>
												${TotalAmount.getTotal_amount()} 	
												</c:otherwise>

											</c:choose>
										</span> 點 <a href="<c:url value='/studentMoney/addPoint' />">我要儲值</a>
									</p>
								</div>

							</div>



							<div class="wrap_profile right">

								<div class="body_data">
									<div class="data">
										<p>年齡</p>
										<span>${age}</span>

									</div>
									<div class="data">
										<p>身高</p>
										<span>${LoginOK.heigth}</span>

									</div>
									<div class="data">
										<p>體重</p>
										<span>${LoginOK.weight}</span>

									</div>
								</div>						
								<div class="body_data">
									<div class="data">
										<p>BMI</p>
										<span>${BMI}</span>

									</div>
									<div class="data">
										<p>BMR<a href="javascript:void(0)" data-toggle="tooltip" data-placement="left" title="BMR（Basal Metabolic Rate）基礎代謝率，是維持身體重要器官運作所需的最低熱量，包括心臟、肝臟、肺、腎、大腦、神經系統、肌肉、皮膚等器官的每日運作。而基礎代謝率會隨著年齡增長，而逐漸下降。"><i class="fas fa-question-circle"></i></a></p>
										<span>${BMR}</span>

									</div>
									<div class="data">
										<p>TDEE<a href="javascript:void(0)" data-toggle="tooltip" data-placement="left" title="TDEE（Total Daily Energy Expenditure）每日消耗總熱量，指的是除了BMR外，再加上所有可能消耗熱量的變數後（如：活動程度），計算出每日需要的熱量，TDEE 一般被視為維持體重所需的熱量，因此當攝取的熱量 = TDEE 時，體重維持不變，若有減肥或增重需求，就需攝取低於或高於 TDEE 的熱量。"><i class="fas fa-question-circle"></i></a></p>
										<span>${TDEE}</span>

									</div>
								</div>

							</div>

						</div>




						<div class="wrap_right self_intro">

							<p>${LoginOK.introduction}</p>
						</div>


					</div>


				</div>

				<!-- ============即將開始的課程======================================================= -->

				<div class="info_wrap t">

					<h5>
						即將開始的課程
					</h5>
					<table class="table border">
						<thead class="thead">
							<tr class="my-auto">
								<th scope="col" class="class_name">課程名稱</th>
								<th scope="col">教練</th>
								<th scope="col">上課時間</th>
								<th scope="col">本堂點數</th>
								<th scope="col">取消課程</th>
							</tr>
						</thead>
						<tbody>
							<c:if test="${comingSoonCourse.size() > 0}">
								<c:forEach varStatus="i" begin="0"
									end="${comingSoonCourse.size()-1}">

									<tr>
										<td class="class_name">${comingSoonCourse.get(i.current).getTrainerCourseBean_H().getSkillBean_H().getName()}</td>
										<td>${comingSoonCourse.get(i.current).getTrainerCourseBean_H().getTrainerBean_H().getName()}</td>
										<td>${comingSoonCourse.get(i.current).getDate()}

											${comingSoonCourse.get(i.current).getTime()}:00 -
											${comingSoonCourse.get(i.current).getTime() + 1}:00</td>
										<td>${comingSoonCourse.get(i.current).getTrainerCourseBean_H().getPrice()}</td>
										<td><a href="/TrainMe/CancelCourse/${LoginOK.id}?courseId=${comingSoonCourse.get(i.current).getId()}"
											class="cancel">取消</a></td>
									</tr>

								</c:forEach>
							</c:if>

						</tbody>
					</table>






				</div>

				<!-- ============等待同意的預約======================================================= -->

				<div class="info_wrap t">

					<h5>
						等待同意的預約
					</h5>
					<table class="table border">
						<thead class="thead">
							<tr>
								<th scope="col" class="class_name">課程名稱</th>
								<th scope="col">教練</th>
								<th scope="col">上課時間</th>
								<th scope="col">本堂點數</th>
								<th scope="col">取消課程</th>
							</tr>
						</thead>

						<tbody>
							<c:if test="${waitCourse.size() > 0}">
								<c:forEach varStatus="i" begin="0" end="${waitCourse.size()-1}">
									<tr>
									<td class="class_name">${waitCourse.get(i.current).getTrainerCourseBean_H().getSkillBean_H().getName()}</td>
									<td>${waitCourse.get(i.current).getTrainerCourseBean_H().getTrainerBean_H().getName()}</td>
									<td>${waitCourse.get(i.current).getDate()}

										${waitCourse.get(i.current).getTime()}:00 -
										${waitCourse.get(i.current).getTime() + 1}:00</td>
									<td>${waitCourse.get(i.current).getTrainerCourseBean_H().getPrice()}</td>
									<td><a href="/TrainMe/CancelCourse/${LoginOK.id}?courseId=${waitCourse.get(i.current).getId()}" class="cancel">取消</a></td>
									</tr>
								</c:forEach>
							</c:if>
						</tbody>


					</table>


				</div>

				<!-- ============體重趨勢圖======================================================= -->

				<div class="info_wrap t">
					<div class="title" id="weight_info">
						<h5>
						我的體重趨勢圖
						</h5>
						<p>(單位:kg)</p>
						<span>
						<a href="javascript:void(0)" data-toggle="tooltip" data-placement="top" title="「我的體重趨勢圖」以每月最後修改的體重為數據，學員要記得每個月都量體重哦！">
						<i class="fas fa-question-circle"></i>
						</a>
						</span>
            
						
					</div>

					<canvas id="myChart" width="400" height="150"></canvas>
				</div>

			</div>

		</div>
</div>			
			<!-- footer -->
	<jsp:include page="/fragment/footer.jsp" />


<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"></script>
<!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script> -->
<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/chart.js@2.9.4/dist/Chart.min.js"></script>
<script>

	//懸浮顯示文字
	jQuery(document).ready(function($) {
	   $('[data-toggle="tooltip"]').tooltip();
	});
// $('[data-toggle="tooltip"]').tooltip('show')


	// 圖表
	var ctx = document.getElementById('myChart').getContext('2d');

	function weight(){
		var array = new Array();
		<c:forEach items="${StudentDataBean}" var="sdb">
	 		array.push(${sdb}); //js中可以使用此標籤，將EL表示式中的值push到陣列中
	 	</c:forEach>
	return array;
	}
	var myChart = new Chart(ctx, {
		type : 'line',
		data : {
			labels : [ '2020年 4月', '5月', '6月', '7月', '8月', '9月',
					'10月', '11月', '12月', '2021年 1月', '2月', '3月'], // 時間
			datasets : [ {
				// label: '# of Votes',				
				
				data : 
					
					[ ] = weight(),  //體重			
					backgroundColor : 'transparent',
					borderColor : 'red',
					borderWidth : 1	,					
			} ]
		},
		options : {
			legend : { 
				display: false 
				},
			plugins : {
				title : {
					display : false,

				},
			},
			scales : {

				yAxes : [ {
					ticks : {
						beginAtZero : true
					}
				} ]
			}
		}
	});
	
	// 確認是否取消通知
	$('.cancel').on('click', function (event) {
		var yes = confirm('是否確定取消課程？');
		if(!yes){
			event.preventDefault();
		}
	})
	


	
</script>

</body>
</html>