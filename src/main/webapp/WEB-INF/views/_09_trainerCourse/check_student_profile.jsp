<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>查看學員資料</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">

<!-- 查看學員資料 -->
<!-- 遮罩 -->
<div id="overlay" class="hide" onclick="Hide();"></div>

<!-- 彈出框 -->
<div id="student_infobox" class="popup_box hide">

	<div class="st_info_wrap">
		<a class="close" href="#" onclick="Hide();">&times;</a>

		<!-- 左相片 -->
		<div class="st_picture" id="profile_image">
			<img src="<c:url value=""  />">
		</div>

		<!-- 右資訊 -->
		<div class="profile">


			<div class="wp_div">
				<h2 id="name"></h2>
				<p id="nickname"></p>
				<span id="sex"></span>
			</div>
			<div class="pf">
				<div class="wrap">

					<div class="wp_div">
						<label>年齡</label><span id="age"></span>
					</div>
					<div class="wp_div">
						<label>生日</label><span id="birthday"></span>
					</div>
					<div class="wp_div">
						<label>連絡電話</label><span id="phone"></span>
					</div>
				</div>

				<div class="wrap">
					<div class="wp_div">
						<label>身高</label><span id="heigth"></span>
					</div>
					<div class="wp_div">
						<label>體重</label><span id="weight"></span>
					</div>
					<div class="wp_div">
						<label>BMI</label><span id="BMI"></span>
					</div>
				</div>
			</div>
		</div>

	</div>

	<hr>

	<!-- 自我介紹 -->

	<div class="st_info_wrap">
		<div class="self_intro"><p>自我介紹</p><p id="introduction"></p></div>
	</div>
</div>

<script>
	//查看學員資料

	// 顯示框
	function Show() {
		document.getElementById('student_infobox').classList.remove('hide');
		document.getElementById('overlay').classList.remove('hide');
		$("#student_infobox").css("display", "block");
		document.documentElement.style.overflow = 'hidden';//電腦端禁止滑動
		document.body.style.overflow = 'hidden';//手機端禁止滑動
	}
	// 隱藏框
	function Hide() {
		document.getElementById('student_infobox').classList.add('hide');
		document.getElementById('overlay').classList.add('hide');
		$("#student_infobox").css("display", "none");
		document.documentElement.style.overflow = 'auto';//電腦端可以滑動
		document.body.style.overflow = 'auto';//手機端可以滑動
	}
</script>
