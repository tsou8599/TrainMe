<%@ page language="java" contentType="text/html; charset=UTF-8" 
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div class="aside">
	<ul id="menu">
        <li><a id="a" href="<c:url value='/student_info/${LoginOK.id}' />"><i class="fas fa-user-circle"></i>個人主頁</a></li>
        <li><a id="a" href="<c:url value='/message/${LoginOK.id}' />"><i class="fas fa-envelope"></i>我的通知</a></li>
        <li><a id="a" href="<c:url value='/st_info_lesson/${LoginOK.id}' />"><i class="far fa-list-alt"></i>我的課程</a></li>
        <li><a id="a" href="<c:url value='/studentMoney/${LoginOK.id}' />"><i class="fas fa-coins"></i>我的點數</a></li>
        <li><a id="a" href="<c:url value='/favoriteTrainer/${LoginOK.id}' />"><i class="fas fa-bookmark"></i>收藏教練</a></li>
        <li><a id="a" href="<c:url value='/studentData/${LoginOK.id}' />"><i class="fas fa-tools"></i>帳號設定</a></li>
	</ul>
</div>