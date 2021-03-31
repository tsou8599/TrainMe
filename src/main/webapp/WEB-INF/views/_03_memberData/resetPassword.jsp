<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Train Me 健身教練與學員的最佳媒合平台</title>
<link rel="stylesheet" href="<c:url value='/css/style.css' />">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css"
	integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l"
	crossorigin="anonymous" />
<link rel="stylesheet" href="<c:url value='/css/style_nav.css' />">
<link rel="stylesheet" href="<c:url value='/css/popup_t1.css' />">
<link rel="stylesheet" href="<c:url value='/css/style_rd_page.css' />">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.5.1.js"></script>
<%-- <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.validate.min.js"></script> --%>
</head>
<body>
	<!-- ============上方導覽列======================================================= -->
	<jsp:include page="/fragment/nav.jsp"/> 


    <jsp:include page="/fragment/login.jsp"/> 
   <!-- ====================================================================== -->
    <div class="message">
          
               <!-- 說明 -->
        <div class="sa">
            <div class="b_tutle">
                <h4>重置密碼</h4>
            </div>

            <div class="block re">
                <p class="re_p">請輸入你所註冊的信箱，<br>系統將會寄一組新的密碼給您。</p>
                
                
                <form:form id="resetForm" method="POST" action="/TrainMe/resetPassword" modelAttribute="loginBean"
                enctype='multipart/form-data'>

                <form:input type="text" path="userEmail" placeholder="請輸入您的E-mail信箱" required="required" size="20" />
                <!-- <input type="text"  placeholder="請輸入您的E-mail信箱" required> -->
                <form:errors path="userEmail" style = "font-size: 1px; color: red;" />
                <div>
                    <p>${message}</p>
                </div>
            
                <div class="check_btn">
                    <button type="submit" class="save">送出</button>
                </div>

                </form:form>
            </div>
         </div>
    </div>


<!-- 	<div align="center"> -->
<!-- 		<h2>重置密碼</h2> -->
<!-- 		<p>請輸入您的信箱, 系統會寄一組新的密碼給你:</p> -->

<%-- 		<form:form id="resetForm" method="POST" action="/TrainMe/resetPassword" modelAttribute="loginBean" --%>
<%-- 			enctype='multipart/form-data'> --%>
<!-- 			<table> -->
<!-- 				<tr> -->
<!-- 					<td>Email:</td> -->
<%-- 					<td><form:input type="text" path="userEmail" placeholder="請輸入您的信箱" required="required" size="20" /></td> --%>
<%-- 					<form:errors path="userEmail" style = "font-size: 1px; color: red;" /> --%>
<!-- 				</tr> -->
<!-- 				<tr> -->
<!-- 					<td colspan="2" align="center"> -->
<!-- 						<button type="submit">送出</button> -->
<!-- 					</td> -->
<!-- 				</tr> -->
<!-- 			</table> -->
<!-- 			<div align="center"> -->
<!-- 				<br /> -->
<%-- 				<h3>${message}</h3> --%>
<!-- 				<br /> -->
<!-- 			</div> -->
<%-- 		</form:form> --%>
<!-- 	</div> -->


<!-- 	<script type="text/javascript"> -->
<!-- // 	$(document).ready(function() { -->
<!-- // 	    $("#resetForm").validate({ -->
<!-- // 	        rules: { -->
<!-- // 	            email: { -->
<!-- // 	                required: true, -->
<!-- // 	                email: true -->
<!-- // 	            } -->
<!-- // 	        }, -->
<!-- // 	    messages : { -->
<!-- // 	        email: { -->
<!-- // 	            email: "The email should be in the format: abc@domain.tld" -->
<!-- // 	        } -->
<!-- // 	    } -->
<!-- // 	    }); -->
<!-- // 	}); -->
<!-- 	</script> -->
</body>

<script>
   

// 導覽列

        var prevScrollpos = window.pageYOffset;
        window.onscroll = function() {
        var currentScrollPos = window.pageYOffset;
        if (prevScrollpos > currentScrollPos) {
            document.getElementById("navbar").style.top = "0";
        } else {
            document.getElementById("navbar").style.top = "-90px";
        }
        prevScrollpos = currentScrollPos;
        } 
        
        
        // 解決有錯誤資料時跳轉頁面問題
	    <c:if test="${studentBean.getHasError()}">
			   Show();
			   register_st()	   	
	    </c:if>
	    <c:if test="${trainerBean.getHasError()}">
			   Show();
			   register_tr()
	    </c:if>
	    <c:if test="${loginBean.getHasError()}">
			   Show();
	    </c:if>
        


      </script>


</html>