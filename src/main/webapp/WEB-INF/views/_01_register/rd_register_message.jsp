<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<link rel="stylesheet" href="<c:url value='/css/style.css' />">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css"
	integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l"
	crossorigin="anonymous" />
<link rel="stylesheet" href="<c:url value='/css/style_nav.css' />">
<link rel="stylesheet" href="<c:url value='/css/style_rd_page.css' />">
<link rel="stylesheet" href="<c:url value='/css/popup_t1.css' />">

</head>
<body>
	<!-- ============上方導覽列======================================================= -->
	<jsp:include page="/fragment/nav.jsp"/> 

	<!-- 登入/註冊 -->
	<jsp:include page="/fragment/login.jsp" />
	
    <!-- ====================================================================== -->
    <div class="message">
          
               <!-- 說明 -->
        <div class="sa">
            <div class="b_tutle">
                <h4>歡迎您加入Train Me</h4>
            </div>

            <div class="block">


                <h5>查收電子郵件</h5>
                <p>註冊驗證信已發送至</p>
                <p>
                <c:choose>
					<c:when
						test="${st_email != null}">
						${st_email.email}
					</c:when>
					<c:otherwise>
						${tr_email.email}
					</c:otherwise>
				</c:choose>
                
                </p>
                <p>請點擊郵件內的驗證連結，完成會員啟用。</p>
                    
            </div>


         </div>
    </div>

</body>
</html>
