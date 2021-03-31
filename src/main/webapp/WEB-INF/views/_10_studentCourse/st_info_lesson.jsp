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
<link rel="stylesheet" href="<c:url value='/css/style.css' />">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css"
	integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l"
	crossorigin="anonymous" />
<link rel="stylesheet" href="<c:url value='/css/style_nav.css' />">
<link rel="stylesheet" href="<c:url value='/css/style_st_lesson.css' />">
<link rel="stylesheet" href="<c:url value='/css/style_st_info.css' />">
<link rel="stylesheet"	href="<c:url value='/css/style_footer.css' />">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">

<!-- 暫時代替側邊選單點擊變色的功能的CSS -->
<style>
html,
body {
    height: 100%;
    margin: 0;
    padding: 0;
}
.container {
    min-height: 100%;
    overflow: hidden;
    padding-bottom: 50px;
}
.footer {
    height: 50px;
    line-height: 50px;
    background: rgb(15, 112, 202);
    margin-top: -50px;
}
/* .container{ */
/* 	margin-bottom:100px; */
/* } */
.aside ul li:nth-child(3) a{
	color: #21d4a7;
}
.aside ul li:nth-child(3) a:hover{
	color: #fff;
}
.modal-content {
	background-color: #fff;
	position: relative;
	color: #666;
	width: 100%;
}

.modal-header {
	text-align: center;
	margin: auto;
	border: none;
	padding-top: 30px;
}

.modal-title {
	font-weight: bold;
	color: #000;
}

.modal-header h5{
     font-weight: bold;
     color: #000;
}

.modal-body {
	padding: 0 0 30px 0;
	text-align: center;
}

.modal-footer {
	width: 100%;
	display: flex;
	justify-content: center;
	border: none;
	background-color: #21d4a7;
}

.modal-footer .btn {
	border-radius: 1px;
	padding: 10px 50px;
}

.modal-footer .btn:first-child {
	background-color: #fff;
	color: #333;
	border: none;

	/* border: 1px solid #fff; */
}

.modal-footer .btn:last-child {
	background-color: #000;
	border: none;
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


		<!-- ============個人資料======================================================= -->

		<div class="content">
			<div class="title">
				<h3>我的課程</h3>
			</div>

			<!-- ============即將開始的課程======================================================= -->

			<div class="info_wrap t lesson">

				<ul class="nav nav-tab mb-3" id="pills-tab" role="tablist">
					<li class="nav-item mr-4" role="presentation"><a
						class="nav-link li_color active" id="pills-wait-tab"
						data-toggle="pill" href="#pills-wait" role="tab"
						aria-controls="pills-wait" aria-selected="true"> 等待同意 </a></li>
					<li class="nav-item mr-4" role="presentation"><a
						class="nav-link li_color" id="pills-next-tab" data-toggle="pill"
						href="#pills-next" role="tab" aria-controls="pills-next"
						aria-selected="false">即將上課 </a></li>
					<li class="nav-item " role="presentation"><a
						class="nav-link li_color" id="pills-history-tab"
						data-toggle="pill" href="#pills-history" role="tab"
						aria-controls="pills-history" aria-selected="false">歷史課程 </a></li>
				</ul>

				<div class="tab-content mt-3" id="pills-tabContent">
					<!-- 等待同意 -->
					<div class="tab-pane fade show active" id="pills-wait"
						role="tabpanel" aria-labelledby="pills-wait-tab">
						<table class="table border b_c">
							<thead class="thead">
								<tr>
									<th scope="col" class="class_name">課程名稱</th>
									<th scope="col">教練</th>
									<th scope="col">上課時間</th>
									<th scope="col">本堂點數</th>
									<th scope="col">取消課程</th>
								</tr>
							</thead>
							<tbody class="tr_height">
								<c:if test="${waitCourse.size() > 0}">
									<c:forEach varStatus="i" begin="0" end="${waitCourse.size()-1}">
										<tr>
											<td class="class_name">${waitCourse.get(i.current).getTrainerCourseBean_H().getSkillBean_H().getName()}</td>
											<td>${waitCourse.get(i.current).getTrainerCourseBean_H().getTrainerBean_H().getName()}</td>
											<td>${waitCourse.get(i.current).getDate()}

												${waitCourse.get(i.current).getTime()}:00 -
												${waitCourse.get(i.current).getTime() + 1}:00</td>
											<td>${waitCourse.get(i.current).getTrainerCourseBean_H().getPrice()}</td>
											<td><button type="button" class="btn btn-primary"
													data-toggle="modal" data-target="#exampleModal1${waitCourse.get(i.current).getId()}">
													取消</button></td>
										</tr>
										
<!-- 										取消課程的彈跳視窗，會先被隱藏起來 -->
										<div class="modal fade" id="exampleModal1${waitCourse.get(i.current).getId()}" tabindex="-1"
											aria-labelledby="exampleModalLabel" aria-hidden="true">
											<div class="modal-dialog modal-dialog-centered">
												<div class="modal-content">
													<div class="modal-header">
														<h5 class="modal-title" id="exampleModalLabel">確定要取消嗎？</h5>
													</div>
													<div class="modal-body">上課時段：
														${waitCourse.get(i.current).getDate()}

														${waitCourse.get(i.current).getTime()}:00 -
														${waitCourse.get(i.current).getTime() + 1}:00</div>
													<div class="modal-footer">
														<button type="button" class="btn btn-secondary"
															data-dismiss="modal">取消</button>
														<button id="manageFeedback" class="btn btn-primary"
															onclick="location.href='/TrainMe/CancelCourseLesson/${LoginOK.id}?courseId=${waitCourse.get(i.current).getId()}&type=waitCourse'">確定</button>
													</div>
												</div>
											</div>
										</div>

									</c:forEach>
								</c:if>
							</tbody>
						</table>
					</div>
					<!-- 即將上課 -->
					<div class="tab-pane fade" id="pills-next" role="tabpanel"
						aria-labelledby="pills-next-tab">
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
							<tbody class="tr_height">
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
											<td><button type="button" class="btn btn-primary"
													data-toggle="modal" data-target="#exampleModal${comingSoonCourse.get(i.current).getId()}">
													取消</button></td>
										</tr>
										
<!-- 										取消課程的彈跳視窗，會先被隱藏起來 -->
										<div class="modal fade" id="exampleModal${comingSoonCourse.get(i.current).getId()}" tabindex="-1"
											aria-labelledby="exampleModalLabel" aria-hidden="true">
											<div class="modal-dialog modal-dialog-centered">
												<div class="modal-content">
													<div class="modal-header">
														<h5 class="modal-title" id="exampleModalLabel">確定要取消嗎？</h5>
													</div>
													<div class="modal-body">上課時段：
														${comingSoonCourse.get(i.current).getDate()}

														${comingSoonCourse.get(i.current).getTime()}:00 -
														${comingSoonCourse.get(i.current).getTime() + 1}:00</div>
													<div class="modal-footer">
														<button type="button" class="btn btn-secondary"
															data-dismiss="modal">取消</button>
														<button id="manageFeedback" class="btn btn-primary"
															onclick="location.href='/TrainMe/CancelCourseLesson/${LoginOK.id}?courseId=${comingSoonCourse.get(i.current).getId()}&type=comingSoon'">確定</button>
													</div>
												</div>
											</div>
										</div>

									</c:forEach>
								</c:if>
							</tbody>
						</table>
					</div>
					<!-- 歷史課程 -->
					<div class="tab-pane fade" id="pills-history" role="tabpanel"
						aria-labelledby="pills-history-tab">
						<table class="table border">
							<thead class="thead">
								<tr class="my-auto">
									<th scope="col" class="class_name">課程名稱</th>
									<th scope="col">教練</th>
									<th scope="col">上課時間</th>
									<th scope="col">本堂點數</th>
									<th scope="col">評價</th>
									<th scope="col">上課日誌</th>
								</tr>
							</thead>
							<tbody class="tr_height">
								<c:if test="${beforeCourse.size() > 0}">
									<c:forEach varStatus="i" begin="0"
										end="${beforeCourse.size()-1}">
										<tr>
											<td class="class_name">${beforeCourse.get(i.current).getTrainerCourseBean_H().getSkillBean_H().getName()}</td>
											<td>${beforeCourse.get(i.current).getTrainerCourseBean_H().getTrainerBean_H().getName()}</td>
											<td>${beforeCourse.get(i.current).getDate()}

												${beforeCourse.get(i.current).getTime()}:00 -
												${beforeCourse.get(i.current).getTime() + 1}:00</td>
											<td>${beforeCourse.get(i.current).getTrainerCourseBean_H().getPrice()}</td>

											<c:if test="${ratings.size() == 0 }">
												<td><a
													href="<c:url value='/st_feedback/${beforeCourse.get(i.current).getId()}' />">給評價</a></td>

											</c:if>
											<c:if test="${ratings.size() > 0 }">
												<c:choose>
													<c:when
														test="${beforeCourse.get(i.current).getIs_rated()== 1 }">
														<td>已評價</td>
													</c:when>
													<c:otherwise>
														<td><a
															href="<c:url value='/st_feedback/${beforeCourse.get(i.current).getId()}' />">給評價</a></td>
													</c:otherwise>
												</c:choose>
											</c:if>											
											<c:choose>
													<c:when test="${empty beforeCourse.get(i.current).getDatdiary_content() &&  empty beforeCourse.get(i.current).getCourseDiaryItemBean_H() }">		
															<td></td>							
													</c:when>
													<c:otherwise>
														<td><a
														href="<c:url value='/student_Course_diary/${beforeCourse.get(i.current).getId()}' />"><i
														class="fas fa-book"></i></a></td>
													</c:otherwise>
										 </c:choose>											 
										</tr>
									</c:forEach>
								</c:if>
							</tbody>
						</table>
					</div>
				</div>

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

	$('#pills-tab a').on('click', function(event) {
		event.preventDefault()
		console.log(this);
		$(this).tab('show')
	})

	// 確認是否取消通知
// 	$('.cancel').on('click', function(event) {
// 		var yes = confirm('是否確定取消課程？');
// 		if (!yes) {
// 			event.preventDefault();
// 		}
// 		console.log(this.dataset.type);
// 		changeTab = this.dataset.type;
// 	})
// 		console.log("${type.equals('comingSoon')}");
	

	<c:if test="${type.equals('comingSoon')}">
// 				console.log("111111111");
				$('#pills-next-tab').tab('show')			
	</c:if>
	<c:if test="${type.equals('waitCourse')}">
// 				console.log("2222");
				$('#pills-wait-tab').tab('show')			
	</c:if>
		
				
		
	
</script>
</body>
</html>
