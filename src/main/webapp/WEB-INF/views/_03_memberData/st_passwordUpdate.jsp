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
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style_st_info.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style_st_account.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style_nav.css">
<link rel="stylesheet" href="<c:url value='/css/style_footer.css' />">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script src="../js/jquery-3.5.1.js"></script>
<!-- 暫時代替側邊選單點擊變色的功能的CSS -->
<style>

.container{
	margin-bottom:200px;
}
.aside ul li:nth-child(6) a{
	color: #21d4a7;
}
.aside ul li:nth-child(6) a:hover{
	color: #fff;
}
</style>
</head>
<body>

	<!-- ============上方導覽列======================================================= -->
	<jsp:include page="/fragment/nav_st.jsp"/>  

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
<!-- 						<li><a href="#">個人資料</a></li> -->
<!-- 						<li><a href="#">我的課程</a></li> -->
<!-- 						<li><a href="#">我的點數</a></li> -->
<!-- 						<li><a href="#">訂單查詢</a></li> -->
<!-- 						<li><a href="#">帳號設定</a></li> -->
<!-- 						<hr> -->
<!-- 						<li><a href="#">登出</a></li> -->
<!-- 					</div> -->
<!-- 				</ul></li> -->
<!-- 	</header> -->

	<!-- 編輯資料 -->

	<div class="container">
	
		<!-- ============左側選單======================================================= -->
		<jsp:include page="/fragment/sidebar_st.jsp"/>
		
		<!-- ============右側網頁======================================================= -->
		<jsp:include page="/fragment/pw_edit_st.jsp"/>
		
<!-- 		<div class="aside"> -->
<!-- 			<ul> -->
<!-- 				<li class="mypage_title">我的主頁</li> -->
<!-- 				<li><a href="./st_info.html"><i class="fas fa-user-circle"></i>個人資料</a></li> -->
<!-- 				<li><a href="./st_info_lesson.html"><i -->
<!-- 						class="far fa-list-alt"></i></i>我的課程</a></li> -->
<!-- 				<li><a href="#"><i class="fas fa-coins"></i>我的點數</a></li> -->
<!-- 				<li><a href="#"><i class="fas fa-shopping-cart"></i>訂單查詢</a></li> -->
<!-- 				<li><a href="./st_info_account.html"><i -->
<!-- 						class="fas fa-tools"></i>帳號設定</a></li> -->
<!-- 			</ul> -->
<!-- 		</div> -->



<!-- <!-- 		<div class="content"> --> 
<!-- 			<div class="title"> -->
<!-- 				<h3>帳號設定 > 修改密碼</h3> -->
<!-- 			</div> -->


<!-- 			<div class="edit_area"> -->
<!-- 				<div class="edit_box"> -->
<!-- 					<label>輸入你的舊密碼</label><br> <input type="password" id="opswd" -->
<!-- 						name="opswd" required> -->
<!-- 				</div> -->
<!-- 				<div class="edit_box"> -->
<!-- 					<label>輸入新的密碼</label><br> <input type="password" id="opswd" -->
<!-- 						name="npswd1" required> -->
<!-- 				</div> -->
<!-- 				<div class="edit_box"> -->
<!-- 					<label>再一次輸入新的密碼</label><br> <input type="password" id="opswd" -->
<!-- 						name="npswd2" required> -->
<!-- 				</div> -->
<!-- 				<div class="edit_box e_button"> -->
<!-- 					<button class="cancel" onclick=history.go(-1)>取消</button> -->
<!-- 					<button class="save" id="saveBtn">儲存</button> -->
<!-- 				</div> -->
<!-- 			</div> -->
<!-- 		</div> -->
	</div>

<!-- footer -->
	<jsp:include page="/fragment/footer.jsp" />
</body>
<script>

// document.getElementById("saveBtn").addEventListener("click",function(){
//     swal({
//       title: "確定更改密碼嗎?",
//       icon: "info",
//       buttons: true,
//       dangerMode: false
//     });
//   });

// grab the form from the DOM
// const form = document.querySelector('#my-form');

// // listen to the 'submit' event on the form
// form.addEventListener('submit', evt => {
//   // prevent the submit event 
//   evt.preventDefault();
  
//   // display an alert
//   swal({
// 	  title: "確定更改密碼嗎?",
//       icon: "info",
//       dangerMode: false,
//       buttons: true
//   }).then(a => {
//     // when the promise resolves,
//     // check the value that was passed
//     if (a) {
//       // if the value is true,
//       // actually submit the form
//       form.submit();
//     }
//   });
// })

    </script>
</html>