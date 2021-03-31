<!DOCTYPE html>
<html lang="en">
<head>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>我的課程設定-Train Me 健身教練與學員的最佳媒合平台</title>
<link rel="stylesheet" href="<c:url value='/css/style.css' />">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css"
	integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l"
	crossorigin="anonymous" />
<link rel="stylesheet" href="<c:url value='/css/style_st_info.css' />">
<link rel="stylesheet"
	href="<c:url value='/css/style_st_account.css' />">
<link rel="stylesheet" href="<c:url value='/css/style_timeset.css' />">
<link rel="stylesheet" href="<c:url value='/css/style_st_lesson.css' />">
<link rel="stylesheet" href="<c:url value='/css/style_tr_lesson.css' />">
<link rel="stylesheet" href="<c:url value='/css/style_nav.css' />">
<link rel="stylesheet" href="<c:url value='/css/style_footer.css' />">

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">

<!-- 暫時代替側邊選單點擊變色的功能的CSS -->
<style>
.container {
	margin-bottom: 100px;
}

.aside ul li:nth-child(3) a {
	color: #21d4a7;
}

.aside ul li:nth-child(3) a:hover {
	color: #fff;
}

.short_nb {
	width: 90px;
}

.lesson_name {
	width: 300px;
}
</style>
</head>
<body>
	<jsp:include page="/fragment/nav_tr.jsp" />


	<div class="container">

		<jsp:include page="/fragment/sidebar_tr.jsp" />


		<div class="content">
			<div class="back">
				<a href="<c:url value='/trainerCourse/${LoginOK.id}' />"><i
					class="fas fa-chevron-left"></i> 返回課程管理</a>
			</div>

			<div class="title">
				<h3>課程管理 > 我的課程設定</h3>
			</div>


			<!-- ============課程設定======================================================= -->
			<div class="info_wrap t lesson">

				<!-- 新增 -->
				<div class="setting_box add_lesson">
					<p class="label_set">新增課程：</p>
					<select name="" id="l_category">
						<option value="0">請選擇</option>
						<c:if test="${skillTypeAll.size() > 0}">
							<c:forEach varStatus="i" begin="0" end="${skillTypeAll.size()-1}">
								<option value="${skillTypeAll.get(i.current).getId()}">${skillTypeAll.get(i.current).getName()}</option>
							</c:forEach>
						</c:if>
					</select>

					<p id="courseSet" class="label_set">課程名稱：</p>
					<input type="text" id="l_name" name="" placeholder="限20字以內"
						class="lesson_name" oninput="checkWordCount()" />

					<p id="priceSet" class="label_set">課程定價：</p>
					<input type="number" min="0" id="l_price" name="" class="short_nb" />

					<button type="button" class="btn btn-dark n_btn add_btn"
						onclick="addtr()">新增</button>


					<!-- 表格 -->
					<div class="tab-content mt-3" id="">
						<div class="tab-pane fade show active" id="" role="tabpanel"
							aria-labelledby="pills-wait-tab">
							<table id="" class="table table-border">
								<thead class="thead">
									<tr>
										<th scope="col">課程種類</th>
										<th scope="col">課程名稱</th>
										<th scope="col">價格</th>
										<th scope="col">編輯</th>
									</tr>
								</thead>
								<tbody class="tr_height tr_license tr_lesson">

									<c:if test="${TrainerCourseList.size() > 0}">
										<c:forEach varStatus="i" begin="0"
											end="${TrainerCourseList.size()-1}">
											<tr>
												<td>${TrainerCourseList.get(i.current).getSkill_typeBean_H().getName()}</td>
												<td>${TrainerCourseList.get(i.current).getSkillBean_H().getName()}</td>
												<td>${TrainerCourseList.get(i.current).getPrice()}</td>
												<td><a class="delect"
													href="/TrainMe/delectCourse/${LoginOK.id}?trainerCourseId=${TrainerCourseList.get(i.current).getId()}">刪除</a></td>
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
	</div>

	<!-- footer -->
	<jsp:include page="/fragment/footer.jsp" />
</body>

<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns"
	crossorigin="anonymous"></script>
<script>
	// 編輯課程

	// ↓↓↓↓↓↓↓↓↓↓↓目前都壞掉ㄌ↓↓↓↓↓↓↓↓↓↓↓

	//新增
	function addtr() {
		var checkValue = $("#l_category").val();
		var l_name = document.getElementById('l_name').value;
		var l_price = document.getElementById('l_price').value;
		 
		 console.log(checkValue +' , '+l_name+' , '+l_price);
		 
			  $.post("/TrainMe/addTrCourse/"+ ${LoginOK.id},
					  {skillType: checkValue,  skill: l_name, price: l_price,},
			          function (data, textStatus, jqXHR) {
// 			        	 console.log(data);
			        	  window.location.assign(window.location.href);
			        	alert("新增成功");
			          },
			          "json"
			        );
			
	}

	//刪除
	$('.delect').on('click', function(event) {
		var yes = confirm('是否確定刪除？');
		if (!yes) {
			event.preventDefault();
		}
	})
	
	function checkWordCount() {
		 var l_name = document.querySelector("#l_name");
		 if (l_name.value.length > 20) {
// 			 console.log('okkkkkkkkkk');
			 l_name.setCustomValidity("超過20字了");
		 } else {
			 l_name.setCustomValidity(""); // be sure to leave this empty!
		 }
	}
	
	$('#courseSet').click(function(){
		$('#l_name').val('基礎課程')
	})
	
	$('#priceSet').click(function(){
		$('#l_price').val('1000')
	})
	
</script>
</html>