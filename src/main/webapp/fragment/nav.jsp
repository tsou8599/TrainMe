<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>導覽列</title>
<%-- 	<link rel="stylesheet" href="<c:url value='/css/style.css' />"> --%>
<%-- 	<link rel="stylesheet" href="<c:url value='/css/style_nav.css' />"> --%>
    <header id="navbar">
        <ul>
            <li class="logo">
                <a href="<c:url value='/' />"><img src="${pageContext.request.contextPath}/images/index/logo_black.png" id="logoimg"></a>
<!--                 <a href="#"><img src="../images/index/logo_black.png"></a> -->
            </li>
                <div class="items">
                    <li><a class="nav-underline" href="#about">關於我們</a></li>
                    <li><a class="nav-underline" href="<c:url value='/searchTrainerAll' />">尋找教練</a></li>
                    <li><a class="nav-underline" href="#contact">聯絡我們</a></li>
<!--                     <li><a href="#">購物商城</a></li> -->
<!--                     <li><a href="#">運動論壇</a></li> -->
                </div>
            <li>
                <button class="nav_btn" onclick="Show();">登入/註冊</button>
            </li>    
       
       
    </header>
   
    <script>

	// 導覽列
        // 往下捲動再往上時顯示導覽列
//         var prevScrollpos = window.pageYOffset;
//         window.onscroll = function() {
//         var currentScrollPos = window.pageYOffset;
//         if (prevScrollpos > currentScrollPos) {
//             document.getElementById("navbar").style.top = "0";
//         } else {
//             document.getElementById("navbar").style.top = "-90px";
//         }
//         prevScrollpos = currentScrollPos;
//         } 
        

//         var logout_btn = document.getElementById('logout_btn');
//         logout_btn.addEventListener('click',function () {
// 		window.location.href="<c:url value='/Logout' />";		
//         })

</script>
