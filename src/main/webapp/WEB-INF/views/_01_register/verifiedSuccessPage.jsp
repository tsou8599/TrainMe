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


</head>
<body>
	<!-- ============上方導覽列======================================================= -->
<%-- 	<jsp:include page="/fragment/nav.jsp"/>  --%>
    <!-- ====================================================================== -->
    <div class="message">
          
               <!-- 說明 -->
        <div class="sa">
            <div class="b_tutle">
                <h4>驗證成功！</h4>
            </div>

            <div class="block">


                <h5>歡迎加入TrainMe</h5>
                
                <!-- <p>歡迎您成為TrainMe的學員！</p>
                <p>請至個人資料填寫您的身高、體重，系統將自動計算您的BMI等身體資訊。</p> -->
                <p>網頁將在<span id="div1"></span>秒後導向首頁</p>
                <p>或者立即<a href="<c:url value='/' />">點此回到首頁</a></p>

            </div>


         </div>
    </div>

    <script src="./js/jquery-3.5.1.js"></script>
    <script type="text/javascript">
        //設定倒數秒數 
        var count = 5;
        //寫一個方法，顯示倒數秒數  數到0後跳轉頁面  
        function countDown(){
            //將count顯示在div中
            document.getElementById("div1").innerHTML= count;
            //每執行一次，count減1
            count -= 1;
            //count=0時，跳轉頁面
            if(count==0){
                window.location.href="/TrainMe/";
            }
            //每秒執行一次,showTime()
            setTimeout("countDown()",1000);
        }
        //執行countDown方法
        countDown();
    </script>
    
</body>

</html>