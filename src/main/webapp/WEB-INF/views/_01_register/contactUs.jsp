<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html>
<html>
<head>
<style>
body {font-family: Arial, Helvetica, sans-serif;}
* {box-sizing: border-box;}

input[type=text], [type=email], select, textarea {
  width: 100%;
  padding: 12px;
  border: 1px solid #ccc;
  border-radius: 4px;
  box-sizing: border-box;
  margin-top: 6px;
  margin-bottom: 16px;
  resize: vertical;
}

input[type=submit] {
  background-color: #4CAF50;
  color: white;
  padding: 12px 20px;
  border: none;
  border-radius: 4px;
  cursor: pointer;
}

input[type=submit]:hover {
  background-color: #45a049;
}

.container {
  border-radius: 5px;
  background-color: #f2f2f2;
  padding: 20px;
}

</style>
</head>
<body>
<h3>聯絡我們</h3>

<div class="container">
   <form:form  action="/TrainMe/contactUs/" method="post" modelAttribute="contactBean" enctype="multipart/form-data">
 
    <label for="lname">姓名</label>
    <form:input type="text" id="name" path="userName" required="required" />
	 
	<label for="email">Email</label>
    <form:input id="userEmail" path="userEmail" type="email" required="required" />

    <label for="q_category">問題類型</label>
    <form:select id="q_category" path="q_category">
      <option value="教練相關問題">教練相關問題</option>
      <option value="學員相關問題">學員相關問題</option>
      <option value="儲值點數問題">儲值點數問題</option>
      <option value="其他問題">其他問題</option>
    </form:select>

 	<label for="subject">請問您遇到了什麼問題?</label>
    <form:input id="subject" path="subject" type="text" required="required" />

    <label for="message">問題描述</label>
    <form:textarea id="message" path="message" style="height:200px" required="required" />

    <input type="submit" value="Submit">
  </form:form>
</div>
</body>
<script>

// function addtr() {
// 	var checkValue = $("#category").val();
// 	var l_name = document.getElementById('l_name').value;
// 	var l_price = document.getElementById('l_price').value;
	 
// 	 console.log(checkValue +' , '+l_name+' , '+l_price);
	 
// 		  $.post("/TrainMe/addTrCourse/"+ ${LoginOK.id},
// 				  {skillType: checkValue,  skill: l_name, price: l_price,},
// 		          function (data, textStatus, jqXHR) {
// 			        	 console.log(data);
// 		        	  window.location.assign(window.location.href);
// 		        	alert("新增成功");
// 		          },
// 		          "json"
// 		        );
		
// }
</script>
</html>