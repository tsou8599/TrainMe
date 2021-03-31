<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Train Me 健身教練與學員的最佳媒合平台</title>
    <link rel="stylesheet" href="../css/style.css">
    <link
    rel="stylesheet"
    href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css"
    integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l"
    crossorigin="anonymous"
    />
<!-- 	<link rel="stylesheet" href="../css/style_footer.css"> -->
    <link rel="stylesheet" href="../css/style_nav.css">
    <link rel="stylesheet" href="../css/style_add_point.css">
    <link rel="stylesheet"	href="<c:url value='/css/style_footer.css' />">
    <link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">
</head>
<body>
   
<!-- ============上方導覽列======================================================= -->
	<jsp:include page="/fragment/nav_st.jsp" />


    <!-- ====================================================================== -->
    <div class="message">
          
        
            <div class="b_tutle">
                <h4>儲值點數</h4>
                <p class="re_p">請選擇您需要的儲值方案</p>
            </div>

            <div class="block">
                <div class="sa">
                 

                               <div class="choose_point">
                    <p>支付2000元</p>
                    <h5>儲值2000點</h5>
                    <button onclick="alertCookie(2000)" id="button">購買點數</button>
                </div>


                

                <div class="choose_point">
                    <p>支付3000元</p>
                    <div class="cp_box">
                        <h5>儲值3000點</h5>
                        <h5>+</h5>
                        <div class="circle">
                            <span>20點</span>
                        </div>
                    </div>
                    <button onclick="alertCookie(3000)" id="button">購買點數</button>
                </div>


                <div class="choose_point">
                    <p>支付5000元</p>
                    <div class="cp_box">
                        <h5>儲值5000點</h5>
                        <h5>+</h5>
                        <div class="circle">
                            <span>50點</span>
                        </div>
                    </div>
                    <button onclick="alertCookie(5000)" id="button">購買點數</button>
                </div>


                <div class="choose_point">
                    <p>支付7000元</p>
                    <div class="cp_box">
                        <h5>儲值7000點</h5>
                        <h5>+</h5>
                        <div class="circle">
                            <span>70點</span>
                        </div>
                    </div>
                    <button onclick="alertCookie(7000)" id="button">購買點數</button>

                </div>

                <div class="choose_point">
                    <p>支付10000元</p>
                    <div class="cp_box">
                        <h5>儲值10000點</h5>
                        <h5>+</h5>
                        <div class="circle">
                            <span>100點</span>
                        </div>
                    </div>
                    <button onclick="alertCookie(10000)" id="button">購買點數</button>

                </div>
            </div>

         </div>
    </div>

<!-- footer -->
<%-- 	<jsp:include page="/fragment/footer.jsp" /> --%>

	<!-- footer -->
	<jsp:include page="/fragment/footer.jsp" />
    
</body>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
    localStorage.clear();
    
    function alertCookie(value){
    	
    	window.location.href = "/TrainMe/studentMoney/add/${LoginOK.id}?price="+value ;

        
//         localStorage.setItem('name',value);
//         alert(value)
// 		window.location.assign("/TrainMe/studentMoney/checkout")
        
    }

			
	
    
</script>
</html>