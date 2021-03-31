
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
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css"
	integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l"
	crossorigin="anonymous" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/style_st_info.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/style_st_account.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/style_nav.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/style_tr_info.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/style_tr_dairy.css">
<link rel="stylesheet" href="<c:url value='/css/style_footer.css' />">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round|Open+Sans">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
<style>
/* 暫時代替側邊選單點擊變色的功能的CSS */
.aside ul li:nth-child(3) a {
	color: #21d4a7;
}

.aside ul li:nth-child(3) a:hover {
	color: #fff;
}

.container {
	margin-bottom: 100px;
}
/* body { */
/* 	color: #404E67; */
/* 	background: #F5F7FA; */
/* 	font-family: 'Open Sans', sans-serif; */
/* } */
/* .table-responsive{ */
/* 	display: flex; */
/*     justify-content: center; */
/*     align-items: center; */
/*     flex-direction: column; */
/* } */
/* .table-wrapper { */
/* 	width: 690px; */
/* 	margin: 0px auto; */
/* 	background: #fff; */
/* /* 	padding: 20px; */
*
/
/* 	box-shadow: 0 1px 1px rgba(0, 0, 0, .05); */
/* } */

/* .table-title { */
/* 	padding-bottom: 10px; */
/* 	margin: 0 0 10px; */
/* } */

/* .table-title h2 { */
/* 	margin: 6px 0 0; */
/* 	font-size: 22px; */
/* } */

/* .table-title .add-new { */
/* 	float: right; */
/* 	height: 30px; */
/* /* 	font-weight: bold; */

 

*
/
/* 	font-size: 12px; */
/* 	text-shadow: none; */
/* 	min-width: 100px; */
/* 	border-radius: 50px; */
/* 	line-height: 13px; */
/* } */

/* /* .table-title .add-new i { */

 

*
/
/* /* 	margin-right: 4px; */

 

*
/
/* /* } */

 

*
/

/* table.table { */
/* 	table-layout: fixed; */
/* } */

/* table.table tr th, table.table tr td { */
/* 	border-color: #e9e9e9; */
/* 	text-align: center; */
/* } */

/* table.table th i { */
/* 	font-size: 13px; */
/* 	margin: 0 5px; */
/* 	cursor: pointer; */
/* } */

/* table.table th:last-child { */
/* 	width: 100px; */
/* } */

/* table.table td a { */
/* 	cursor: pointer; */
/* 	display: inline-block; */
/* 	margin: 0 5px; */
/* 	min-width: 24px; */
/* } */

/* table.table td a.edit { */
/* 	color: #666; */
/* } */

/* table.table td a.delete { */
/* 	color: #666; */
/* } */

/* table.table td i { */
/* 	font-size: 19px; */
/* } */

/* table.table td a.add i { */
/* 	font-size: 24px; */
/* 	margin-right: -1px; */
/* 	position: relative; */
/* 	top: 3px; */
/* } */

/* table.table .form-control { */
/* 	height: 32px; */
/* 	line-height: 32px; */
/* 	box-shadow: none; */
/* 	border-radius: 2px; */
/* } */

/* table.table .form-control.error { */
/* 	border-color: #f50000; */
/* } */

/* table.table td .add { */
/* 	display: none; */
/* } */
/* .table-responsive{ */
/* 	padding:0px; */
/* } */
/* .addbtn{ */
/* 	padding: 6px 25px; */
/* 	background-color: #21d4a7; */
/* 	border: none; */
/* 	color: #fff; */
/* } */
/* .addbtn:hover{ */
/* 	color: #fff; */
/* 	background-color: #29dfb1; */
/* } */
/* .setting_title{ */
/* 	display: flex; */
/*     justify-content: space-between; */
/*     align-items: center;     */
/*     margin-bottom: 10px;  */
/*     	color: #fff; */
/* } */
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
			<div class="back">
				<a href="<c:url value='/trainerCourse/${LoginOK.id}' />"><i
					class="fas fa-chevron-left"></i> 返回課程管理</a>
			</div>
			<div class="title">
				<h3>課程管理 > 填寫上課日誌</h3>
			</div>


			<div class="setting_area">
				<div class="setting_box">
					<div class="setting_title">
						<label><h5>重量訓練</h5></label>
						<button type="button" class="btn add-new addbtn">新增</button>
					</div>
					<form:form
						action="/TrainMe/updateStudentCourseDatDiaryContent/${CourseMsg.id}"
						method="post" modelAttribute="studentCourseBean"
						enctype="multipart/form-data">
						<div class="container-lg">

							<div class="table-responsive">
								<div class="table-wrapper">
									<table class="table table-bordered">
										<thead>
											<tr>
												<th id="fillIn">訓練動作</th>
												<th id="fillIn1">總重量</th>
												<th>次數</th>
												<th>組數</th>
												<th>休息時間</th>
												<th>刪除</th>
											</tr>
										</thead>
										<tbody>
											<c:if test="${CourseDiaryItem.size() > 0}">
												<c:forEach varStatus="i" begin="0"
													end="${CourseDiaryItem.size()-1}">
													<tr>
														<td>${CourseDiaryItem.get(i.current).getAction()}</td>
														<td>${CourseDiaryItem.get(i.current).getLord()}</td>
														<td>${CourseDiaryItem.get(i.current).getReps()}</td>
														<td>${CourseDiaryItem.get(i.current).getSets()}</td>
														<td>${CourseDiaryItem.get(i.current).getRest()}</td>
														<td><a
															href="<c:url value='/delCourseDiaryItem/${CourseMsg.id}/${CourseDiaryItem.get(i.current).getCdi_id()}' />"
															class="delete" title="Delete"><i
																class="material-icons">&#xE872;</i></a></td>
													</tr>
												</c:forEach>
											</c:if>
										</tbody>
									</table>
								</div>
							</div>
						</div>

						<div class="setting_box upload_file">
							<label style="width: 140px"><h5 id="fillIn2">教練建議</h5>
								<p id="feedback"></p></label>
							<textarea name="datdiary_content" id="text" cols="60" rows="15"
								maxlength="500" placeholder="限500字以內">${CourseMsg.datdiary_content}</textarea>


						</div>

						<div class="edit_box e_button">
							<button class="save">更新</button>
						</div>
					</form:form>
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
	<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
	<script>
// 		自我介紹       
		$(document).ready(function() {		
							var x = ($("#text").val().replace(/\s*/g,"")).length;								
							if(x == 0){
								var textMax = 500;
							}else{
								var textMax = 500 - ($("#text").val().replace(/\s*/g,"")).length;
							};
							$('#feedback').html(`尚可輸入<span style="color:red;">${'${'}textMax}</span> 個字 `);
							$('#text').on('input propertychange',typeChange)
		
							var fillIn = document.getElementById('fillIn')
							fillIn.addEventListener("click",function(){
								document.getElementById('action').value = "仰臥起坐";
								document.getElementById('lord').value = "7kg";
								document.getElementById('reps').value = "20下";
								document.getElementById('sets').value = "5組";
								document.getElementById('rest').value = "20秒";
							});
							var fillIn1 = document.getElementById('fillIn1')
							fillIn1.addEventListener("click",function(){
								document.getElementById('action').value = "機械式捲腹";
								document.getElementById('lord').value = "15kg";
								document.getElementById('reps').value = "15下";
								document.getElementById('sets').value = "4組";
								document.getElementById('rest').value = "40秒";
							});
							var fillIn2 = document.getElementById('fillIn2')
							fillIn2.addEventListener("click",function(){
								document.getElementById('text').value = "雖然是初學者，但學習快速、動作標準，但手部肌肉較不足，建議之後可以再加強手部的訓練。";
								typeChange();
							});
							
							function typeChange(){	
								let textMax = 500;	
								let textLength = $('#text').val().replace(/\s*/g,"").length;
								total = textMax - textLength;
								$('#feedback').html(`尚可輸入<span style="color:red;">${'${'}total}</span> 個字 `);
							};
						
						});
		

		// 將換行、空白符號轉換成<br>，存入資料庫
		var content = $("#text").val();
		content = content.replace(/\n|\r\n/g, "<br>");
		// 		console.log(content);

		$(document).ready(function() {
// 							$('[data-toggle="tooltip"]').tooltip();
							var actions = $("table td:last-child").html();
							// Append table with add row form on add new button click
							$(".add-new").click(function() {
												$(this).attr("disabled",
														"disabled");
												var index = $(
														"table tbody tr:last-child")
														.index();
												var row = '<tr>'
														+ '<td><input  style="width:85px;" type="text" class="form-control"  name="action" id="action"/></td>'
														+ '<td><input  style="width:86px;" type="text" class="form-control" name="lord" id="lord"></td>'
														+ '<td><input  style="width:86px;" type="text" class="form-control" name="reps" id="reps"></td>'
														+ '<td><input  style="width:86px;" type="text" class="form-control" name="sets" id="sets"></td>'
														+ '<td><input  style="width:86px;" type="text" class="form-control" name="rest" id="rest"></td>'
														+ '<td><a class="add" title="Add"><i class="material-icons">&#xE03B;</i></a><a class="delete" title="Delete"><i class="material-icons">&#xE872;</i></a></td>'
														+ '</tr>';
												$("table").append(row);
												$("table tbody tr").eq(index + 1).find(".add, .edit").toggle();
												
											});
							// Add row on add button click
							$(document).on("click",".add",function() {	
										var empty = false;
										var input = $(this).parents("tr").find(
												'input[type="text"]');
										input.each(function() {

											if (!$(this).val()) {
												$(this).addClass("error");
												empty = true;
											} else {
												$(this).removeClass("error");
											}
										});
										$(this).parents("tr").find(".error")
												.first().focus();
										if (!empty) {	
		
											var action = document.getElementById('action').value;
											var lord = document.getElementById('lord').value;
											var reps = document.getElementById('reps').value;
											var sets = document.getElementById('sets').value;
											var rest = document.getElementById('rest').value;	
											console.log(action);	
											 axios.get("/TrainMe/addCourseDiaryItem", {
										         params: {
										        	   action: action, 
													   CourseMsgId: ${CourseMsg.id},
													   lord: lord,
													   reps: reps,
													   sets: sets,
													   rest: rest
										         }})
										     .then(function (res) {
// 												      window.location.assign(window.location.href)  
										      })
										      
												input.each(function() {		
													
													$(this).parent("td").html(
															$(this).val());														
												});
								
											$(this).parents("tr").find(
													".add, .edit").toggle();
											$(".add-new").removeAttr("disabled");
										
										}
									});
							
							// Edit row on edit button click
// 							$(document).on("click",".edit",
// 											function() {$(this).parents("tr").find("td:not(:last-child)").each(function() {											
// 												$(this).html('<input type="text" name="action" id="action" style="width:86px;" class="form-control" value="'+ $(this).text()+ '"> ');});
											
// 											$(this).parents("tr").find(
// 														".add, .edit").toggle();
// 												$(".add-new").attr("disabled",
// 														"disabled");
// 											});
							
							// Delete row on delete button click
							$(document).on("click", ".delete", function(event) {								
								$(".add-new").removeAttr("disabled");
								var yes = confirm('確定刪除？');
			    					if (!yes) {
			    								 event.preventDefault()
								    }else{
								    	$(this).parents("tr").remove();
								    }
			    					
							});
						});
		
		
		
// 		var fillIn = document.getElementById('fillIn')
// 		fillIn.addEventListener("click",function(){
// 			document.getElementById('action').value = "仰臥起坐";
// 			document.getElementById('lord').value = "7kg";
// 			document.getElementById('reps').value = "20下";
// 			document.getElementById('sets').value = "5組";
// 			document.getElementById('rest').value = "20秒";
// 		});
// 		var fillIn1 = document.getElementById('fillIn1')
// 		fillIn1.addEventListener("click",function(){
// 			document.getElementById('action').value = "機械式捲腹";
// 			document.getElementById('lord').value = "15kg";
// 			document.getElementById('reps').value = "15下";
// 			document.getElementById('sets').value = "4組";
// 			document.getElementById('rest').value = "40秒";
// 		});
// 		let textMax = 500;
// 		var fillIn2 = document.getElementById('fillIn2')
// 		fillIn2.addEventListener("click",function(){
// 			document.getElementById('text').value = "雖然是初學者，但學習快速、動作標準，但手部肌肉較不足，建議之後可以再加強手部的訓練。";
// 			typeChange();
// 			$('#text').on('input propertychange',typeChange);
// 			function typeChange(){		
// 				let textLength = $('#text').val().length;
// 				total = textMax - textLength;
// 				$('#feedback').html(`尚可輸入<span style="color:red;">${'${'}total}</span> 個字 `);
// 			};
// 		});
	</script>
</body>
</html>
