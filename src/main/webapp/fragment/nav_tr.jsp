<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>導覽列</title>
<header id="navbar">
	<ul>
		<li class="logo"><a href="<c:url value='/' />"><img
				src="${pageContext.request.contextPath}/images/index/logo_black.png" id="logoimg"></a>
			<!--                 <a href="#"><img src="../images/index/logo_black.png"></a> -->
		</li>
		<div class="items">
<!-- 			<li><a href="#about">關於我們</a></li> -->
			<li><a class="nav-underline" href="<c:url value='/searchTrainerAll' />">尋找教練</a></li>
<!-- 			<li><a href="#">購物商城</a></li> -->
			<li><a href="#">運動論壇</a></li>
		</div>
		<!--             <li> -->
		<!--                 <button class="nav_btn" id="logout_btn">登出</button> -->
		<!--             </li>      -->
		<li class="member"><a href="#">
		
				 <c:choose>
					<c:when test="${empty  LoginOK.profile_image}">
						<img
							src="${pageContext.request.contextPath}/images/index/member.jpg">
					</c:when>
					<c:otherwise>
						<img src="/upload/${LoginOK.profile_image}">
					</c:otherwise>
				</c:choose>

		</a>
			<ul class="dropdown">
				<div class="triangle"></div>
				<div class="dropdown_box">
					<li><a href="<c:url value='/tr_info_account/${LoginOK.id}' />">個人資料</a></li>
					<li><a href="<c:url value='/message/${LoginOK.id}' />">我的通知</a></li>
					<li><a href="<c:url value='/trainerCourse/${LoginOK.id}' />">課程管理</a></li>
					<li><a href="<c:url value='/trainerAccount/${LoginOK.id}' />">帳戶查詢</a></li>
					<li><a href="<c:url value='/trainerData/${LoginOK.id}' />">帳號設定</a></li>
					<hr>
					<li><a href="<c:url value='/logout' />">登出</a></li>
				</div>
			</ul>
			</li>
		<li>
	        <a href="<c:url value='/message/${LoginOK.id}' />">
	        	<i class="far fa-bell"><span class="jiaobiao" id="unread"></span></i>
	        </a>
        </li>
   </ul> 
</header>

<script
			src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>

$.post("/TrainMe/unRead/" + ${LoginOK.id}, {type : ${LoginOK.type}},
		   function (data, textStatus, jqXHR) {
	   
	   		$('#unread').html(data);
	   		
	   		if(data == 0){
	   			$("#unread").remove();
	   		}
	   
		},
		"json"	
);

</script>