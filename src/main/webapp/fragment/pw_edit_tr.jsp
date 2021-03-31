<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<div class="content">
	<div class="title">
		<h3>帳號設定 > 修改密碼</h3>
	</div>

 	<form:form id="my-form" method="POST" action="/TrainMe/updateTrPassword/${trainerBean.id}" modelAttribute="trainerBean" enctype='multipart/form-data'>
		<div class="edit_area">
			<div class="edit_box">
				<label>輸入你的舊密碼</label><br> 
					<form:input path="oldpassword" placeholder="請輸入您的舊密碼" required="required" />
					<form:errors path="oldpassword" style = "font-size: 1px; color: red;" />
			</div>
			<div class="edit_box">
				<label>輸入新的密碼</label><br> 
					<form:input path="newpassword" placeholder="請輸入您的新密碼" required="required" type="password" />
					<form:errors path="newpassword" style = "font-size: 1px; color: red;" />
			</div>
			<div class="edit_box">
				<label>再一次輸入新的密碼</label>
					<form:input path="newpasswordcheck" placeholder="再一次輸入新的密碼" required="required" type="password" />
					<form:errors path="newpasswordcheck" style = "font-size: 1px; color: red;" />
			</div>
			<div class="edit_box e_button">
				<button class="cancel" onclick=history.go(-1)>取消</button>
				<button class="save" id="saveBtn">儲存</button>
			</div>
		</div>
	</form:form>
</div>
