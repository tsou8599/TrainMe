<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Train Me 健身教練與學員的最佳媒合平台</title>

<%--     <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">    --%>
<link rel="stylesheet" href="<c:url value='/css/style.css' />">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css"
	integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l"
	crossorigin="anonymous" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/@splidejs/splide@2.4.21/dist/css/themes/splide-sea-green.min.css">
<link href="${pageContext.request.contextPath}/assets/css/style.css"
	rel="stylesheet">
<%-- <link href="${pageContext.request.contextPath}/assets/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet"> --%>
<%-- <link href="${pageContext.request.contextPath}/assets/vendor/owl.carousel/assets/owl.carousel.min.css" rel="stylesheet"> --%>
<%-- <link href="${pageContext.request.contextPath}/assets/vendor/venobox/venobox.css" rel="stylesheet"> --%>

<link href="assets/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<link href="assets/vendor/font-awesome/css/font-awesome.min.css"
	rel="stylesheet">
<link href="assets/vendor/boxicons/css/boxicons.min.css"
	rel="stylesheet">
<link href="assets/vendor/owl.carousel/assets/owl.carousel.min.css"
	rel="stylesheet">
<link href="assets/vendor/venobox/venobox.css" rel="stylesheet">
<link href="assets/vendor/aos/aos.css" rel="stylesheet">


<%--     <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style_nav.css">    --%>
<link rel="stylesheet"
	href="<c:url value='/css/style_nav_change.css' />">
<link rel="stylesheet" href="<c:url value='/css/popup_t1.css' />">
<link rel="stylesheet"	href="<c:url value='/css/style_carousel_search.css' />">
<link rel="stylesheet"	href="<c:url value='/css/style_footer.css' />">
<link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
<script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>

<style>
/* 	       @import url('https://fonts.googleapis.com/css2?family=Noto+Sans+TC:wght@100;300;400;500;700;900&display=swap');  */
	body{
		overflow-x:hidden;
	}

  @media screen and (max-width: 1024px){
        header{
            width: 100%;            
        }
        .carousel-item img{
            width: 100%;
            height: 100%;
        }
        .new {
           height: 100%;
           flex-direction: column;
           width: 100%;
        }

        .search_trainer{
            width: 100%;
            position: relative;
            display: block;
            text-align: center;
            /* justify-content: center; */
            /* flex-direction: column; */
            background-color: #eee;
            padding:50px 0 20px 0;
        }
        .search_trainer li select,.search_trainer li .search_input,.search_trainer li button{
            width: 80%;
            margin: 10px 0px; 
        }
        .search_input{
         	width: 80%;
        	text-align: left;
        }
        .showbg{
            background-color: #bbb;
        }
        header .items{
            display: block;
            position: absolute;
            background-color: #bbb;
            /* height: calc(50vh - 75px); */
            width: 100%;
            /* top: 80px; */
            top:-300px;
            transition: top .4s;
        }
        header .items.show{
            top:80px;
        }
        header .items li {
            padding: 20px 0px;
            font-size: 16px;
        }
        ul .bar {
            display: block;
        }
        
        .logo{
            display: flex;
        }

        /* 文字 */

        .carousel .ad {
            position: absolute;
            left: 20%;
            top: 20%;
        }
        .fa-angle-right:before{
        	display: none;
        }

    }

    @media screen and (max-width: 768px){
    	
        .carousel .ad h3{
            padding: 0;
            align-items: center;
/*             width: 300px; */
            font-size: 1.4rem;
        }
        .carousel .ad p{
            display: none;
        }
        .fa-angle-right:before{
        	display: none;
        }
    }
    
     @media screen and (max-width: 411px){
     	.carousel .ad {
            position: absolute;
 			top:20%;
 			left:15%;
        }
	     .logo{
	     	margin-left:-100px; 
	     }
     	ul .bar {
      		margin-left:-100px; 
     		
     	}
     }

</style>
</head>
<body>

	<c:if test="${LoginOK == null}">
		<jsp:include page="/fragment/nav.jsp" />
	</c:if>

	<c:if test="${LoginOK.type == 1}">
		<jsp:include page="/fragment/nav_st.jsp" />
	</c:if>

	<c:if test="${LoginOK.type == 2}">
		<jsp:include page="/fragment/nav_tr.jsp" />
	</c:if>

	<!-- <!-- 登入/註冊 -->
	<jsp:include page="/fragment/login.jsp" />


	<!-- 橫幅/搜尋 -->

	<div class="carousel">

		<div class="slider">

			<div id="carouselExampleIndicators" class="carousel slide"
				data-ride="carousel">
				<!-- <ol class="carousel-indicators">
                <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
                <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
                <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
            </ol> -->
				<div class="carousel-inner">
					<div class="carousel-item active">
						<img
							src="${pageContext.request.contextPath}/images/index/banner_25001.jpg"
							class="d-block w-100">
					</div>
					<div class="carousel-item">
						<img
							src="${pageContext.request.contextPath}/images/index/banner_25002.jpg"
							class="d-block w-100">
					</div>
					<div class="carousel-item">
						<img
							src="${pageContext.request.contextPath}/images/index/banner_25003.jpg"
							class="d-block w-100">
					</div>
				</div>
				<!-- 				<a class="carousel-control-prev" href="#carouselExampleIndicators" -->
				<!-- 					role="button" data-slide="prev"> <span -->
				<!-- 					class="carousel-control-prev-icon" aria-hidden="true"></span> <span -->
				<!-- 					class="sr-only">Previous</span> -->
				<!-- 				</a> <a class="carousel-control-next" href="#carouselExampleIndicators" -->
				<!-- 					role="button" data-slide="next"> <span -->
				<!-- 					class="carousel-control-next-icon" aria-hidden="true"></span> <span -->
				<!-- 					class="sr-only">Next</span> -->
				<!-- 				</a> -->
			</div>

		</div>
		<form class="search_trainer"
			action="<c:url value='/searchTrainerByCondition' />">
			<li><select name="skillType" class="lesson">
					<option value="0">課程種類</option>
					<c:if test="${skillTypeAll.size() > 0}">
						<c:forEach varStatus="i" begin="0" end="${skillTypeAll.size()-1}">
							<option value="${skillTypeAll.get(i.current).getId()}">${skillTypeAll.get(i.current).getName()}</option>
						</c:forEach>
					</c:if>
			</select></li>
			<li><select name="city" class="location">
					<option value="0">地點</option>
					<option value="1">台北市</option>
					<option value="2">新北市</option>
			</select></li>
			<li><input type="search" name="keyword" placeholder="輸入關鍵字"
				class="search_input"></li>
			<li><button class="search_btn">搜尋教練</button></li>
		</form>

		<div class="ad">
			<h3>健身教練與學員的專屬媒合平台</h3>
			<p>
				教練課程價錢、時段公開透明<br> 省去詢問時間，免於被健身業務打擾<br>
				透過評價系統，讓您篩選最適合自己的教練！
			</p>
		</div>
	</div>

	<!-- 	大概介紹 -->

	<div class="new">

		<div class="intro">
			<div class="box">
				<i class="far fa-hand-point-up"></i> <span>快速預約</span>
			</div>
			<div class="p">選擇您需要的課程與時段一鍵預約</div>
		</div>
		<i class="fas fa-angle-right"></i>

		<div class="intro">
			<div class="box">
				<i class="fas fa-coins"></i> <span>點數購課</span>
			</div>
			<div class="p">儲值點數加贈點，快速購課不煩惱</div>
		</div>
		<i class="fas fa-angle-right"></i>
		<div class="intro">
			<div class="box">
				<i class="far fa-thumbs-up"></i> <span>評價系統</span>
			</div>
			<div class="p">評價機制，增加選擇教練的參考依據</div>
		</div>
		<i class="fas fa-angle-right"></i>

		<div class="intro">
			<div class="box">
				<i class="fas fa-weight"></i> <span>體態紀錄</span>
			</div>
			<div class="p">學員每月體重變化一目瞭然</div>
		</div>



	</div>


	<!-- 人氣教練 -->
 <!-- 人氣教練 -->


<div class="hot_tr">
 <span class="hot_trainer" data-aos="fade-up">
  <h3>精選人氣教練</h3>
 </span>

 <div class="splide" data-aos="fade-up">
  <div class="splide__track">
   <ul class="splide__list">
    <c:if test="${trainerAndCourse.size() > 0}">
     <c:forEach varStatus="i" begin="0" end="${trainerAndCourse.size()-1}">
    <a class="splide__slide"
     href="<c:url value='/trainer_info/${trainerAndCourse.get(i.current).getTrainerBean_H().getId()}?type=index' />">

     <div class="tr_img">
      <img
       src="/upload/${trainerAndCourse.get(i.current).getTrainerBean_H().getProfile_image()}">
     </div> <!--                         <div class="p_t"> --> <!--                             <p class="t_name">林瑪莉</p> -->
     <!--                             <span> --> <!--                                 <p class="t_location"><i class="fas fa-map-marker-alt"></i>台北市</p> -->
     <!--                                 <p class="t_ltimes"><i class="fas fa-user-friends"></i>20次課程媒合</p> -->
     <!--                             </span> --> <!--                             <span> -->
     <!--                                 <div class="ratings"> --> <!--                                     <div class="empty-stars"></div> -->
     <!--                                     <div class="full-stars" style="width:80%"></div>                             -->
     <!--                                 </div> --> <!--                                 <p>(18)</p> -->
     <!--                             </span> --> <!--                         </div> -->  
       <div class="p_t">
        <p class="t_name">${trainerAndCourse.get(i.current).getTrainerBean_H().getName()}</p>
        <span>
         <p class="t_location">
          <i class="fas fa-map-marker-alt"></i>${trainerAndCourse.get(i.current).getTrainerBean_H().getGym().getCity().getName()}${trainerAndCourse.get(i.current).getTrainerBean_H().getGym().getArea().getName()}</p>
         <p class="t_location">
          <i class="fas fa-dumbbell"></i>
          ${trainerAndCourse.get(i.current).getSkill_typeBean_H().getName()}...         
         </p>
         
        </span>
        <span class="rt_v">
         
          <div class="ratings">
           <div class="empty-stars"></div>
           <div class="full-stars"
            style="width: ${trainerAndCourse.get(i.current).getTrainerBean_H().getRatings() * 20}%"></div>
          </div>
          <span>(${trainerAndCourse.get(i.current).getTrainerBean_H().getRatings_size()})</span>
         
        </span>
       </div>
       </a>
      </c:forEach>
     </c:if>

    



   </ul>
  </div>
 </div>
</div>




	<!-- ======= About Section ======= -->
	<section id="about">
		<h2 class="title h2" data-aos="fade-up">關於我們</h2>
		<div class="container" data-aos="fade-up">
			<p>TraineMe是由一群熱愛運動的團隊共同打造，讓想健身的人透過平台尋找喜歡的教練，根據自己的需求，選擇適合的課程。健身教練也能透過平台媒合學員，並且能即時開課，展現自己所學。藉由TraineMe讓學員與教練達到互利共享的雙贏空間。</p>
			<div class="row about-container">

				<div class="col-lg-6 content order-lg-1 order-2">

					<!--             <p> -->
					<!--               TraineMe是由一群熱愛運動的團隊共同打造，讓想健身的人透過平台尋找喜歡的教練，根據自己的需求，選擇適合的課程。 -->
					<!--       健身教練也能透過平台媒合學員，並且能即時開課，展現自己所學。藉由TraineMe讓學員與教練達到互利共享的雙贏空間。 -->
					<!--             </p> -->

					<div class="icon-box">
						<div class="icon">
							<i class="far fa-handshake"></i>
						</div>
						<h4 class="title">健身教練與學員的專屬媒合平台
						</h4>
						<p class="description">讓中小型健身房的教練與學員快速媒合</p>
					</div>

					<div class="icon-box">
						<div class="icon">
							<i class="far fa-hand-paper"></i>
						</div>
						<h4 class="title">興趣當先，拒絕廢話</h4>
						<p class="description">教練課程價錢、時段公開透明，省去詢問時間，免於被健身業務打擾</p>
					</div>

					<div class="icon-box">
						<div class="icon">
							<i class="fas fa-dumbbell"></i>
						</div>
						<h4 class="title">輕鬆開始，輕鬆結束</h4>
						<p class="description">平台提供各種教練課程供學員自由選擇，不受合約約束</p>
					</div>

					<div class="icon-box">
						<div class="icon">
							<i class="far fa-star"></i>
						</div>
						<h4 class="title">簡單高效，評價透明</h4>
						<p class="description">透過評價系統，讓學員篩選最適合自己的教練</p>
					</div>

				</div>

				<div class="col-lg-6 background order-lg-2 order-1">
					<!--           	<img src="./assets/img/about-img.jpg"> -->
				</div>

			</div>

		</div>
	</section>
	<!-- End About Section -->
	<!-- ======= Facts Section ======= -->
	<section id="facts">
		<div class="container" data-aos="fade-up">
			<div class="section-header">
				<h3 class="section-title">TraineMe Growth</h3>
				<p class="section-description">TraineMe平台近期成長</p>
			</div>
			<div class="row counters">

				<div class="col-lg-3 col-6 text-center">
					<span data-toggle="counter-up">${studentBean.studentTotal}</span>
					<p>學員</p>
				</div>

				<div class="col-lg-3 col-6 text-center">
					<span data-toggle="counter-up">${trainerBean.trainerTotal}</span>
					<p>教練</p>
				</div>

				<div class="col-lg-3 col-6 text-center">
					<span data-toggle="counter-up">${studentCourseBean.studentCourseTotal}</span>
					<p>媒合課堂數</p>
				</div>

				<div class="col-lg-3 col-6 text-center">
					<span data-toggle="counter-up">${gymBean.gymTotal}</span>
					<p>合作健身房/工作室</p>
				</div>

			</div>

		</div>
	</section>
	<!-- End Facts Section -->

	<section id="contact">
		<div class="container" data-aos="fade-up">
			<div>
				<h3 class="text-center text-uppercase">聯絡我們</h3>
				<br>
				<p class="text-center w-75 m-auto">想成為TrainMe平台的教練或是學員嗎?想了解更多嗎?歡迎諮詢</p>
				<!-- 				<iframe -->
				<!-- 					src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3614.7432711166844!2d121.53559291552197!3d25.042785144092026!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3442a97d255598df%3A0x47ea748e8f3f53aa!2z5ZyL56uL6Ie65YyX56eR5oqA5aSn5a24!5e0!3m2!1szh-TW!2stw!4v1616412938598!5m2!1szh-TW!2stw" -->
				<!-- 					width="100%" height="380" frameborder="0" style="border: 0" -->
				<!-- 					allowfullscreen></iframe> -->
			</div>
			<div class="container">
				<div class="row">
					<div class="col-sm-12 col-md-12 col-lg-12 my-1">
						<section id="contact" class="contact section-bg">
							<div class="col-lg-12 contact-form-wrap">
								<form:form action="/TrainMe/contactUs/" method="post"
									role="form" class="php-email-form" modelAttribute="contactBean"
									enctype="multipart/form-data">
									<div class="form-row">
										<div class="col-md-6 form-group">
											<label for="lname" id="clickName">姓名</label>
											<form:input type="text" id="ruruName" path="userName"
												class="form-control" required="required" />
										</div>
										<div class="col-md-6 form-group">
											<label for="email">Email</label>
											<form:input id="ruruEmail" path="userEmail"
												class="form-control" type="email" required="required" />
										</div>
									</div>
									<div class="form-group">
										<label for="q_category">問題類型</label>
										<form:select id="q_category" path="q_category"
											class="form-control">
											<option value="教練相關問題">教練相關問題</option>
											<option value="學員相關問題">學員相關問題</option>
											<option value="儲值點數問題">儲值點數問題</option>
											<option value="其他問題">其他問題</option>
										</form:select>
									</div>
									<div class="form-group">
										<label for="subject">請問您遇到了什麼問題?</label>
										<form:input id="subject" path="subject" class="form-control"
											type="text" required="required" />
									</div>
									<div class="form-group">
										<label for="message">問題描述</label>
										<form:textarea id="message" path="message"
											class="form-control" rows="8" style="height:200px"
											required="required" />
									</div>
									<div class="text-center">
										<button type="submit">傳送訊息</button>
									</div>
								</form:form>
							</div>
						</section>
					</div>
				</div>
				</div>
	</div>
<!-- 	</div> -->
<!-- 	</div> -->
	</section>
	<!-- End Contact Us Section -->

	<!-- footer -->
	<jsp:include page="/fragment/footer.jsp" />



	<!-- 回到最上面 -->
	<a href="https://www.blogger.com/blogger.g?blogID=2031514508322140995#"
		id="gotop"> <i class="fa fa-angle-up"></i>
	</a>

	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
		integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
		crossorigin="anonymous">
    </script>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns"
		crossorigin="anonymous">
    </script>
	<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/@splidejs/splide@2.4.21/dist/js/splide.min.js"></script>
	<!-- Vendor JS Files -->
	<!--   <script src="assets/vendor/jquery/jquery.min.js"></script> -->
	<script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<!--   <script src="assets/vendor/jquery.easing/jquery.easing.min.js"></script> -->
	<!--   <script src="assets/vendor/php-email-form/validate.js"></script> -->
	<script src="assets/vendor/counterup/counterup.min.js"></script>
	<script src="assets/vendor/waypoints/jquery.waypoints.min.js"></script>
	<script src="assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
	<script src="assets/vendor/superfish/superfish.min.js"></script>
	<script src="assets/vendor/hoverIntent/hoverIntent.js"></script>
	<script src="assets/vendor/owl.carousel/owl.carousel.min.js"></script>
	<script src="assets/vendor/venobox/venobox.min.js"></script>
	<script src="assets/vendor/aos/aos.js"></script>

	<!-- Template Main JS File -->
	<script src="assets/js/main.js"></script>


	<script>
// 浮現特效

	AOS.init();


// 導覽列

		$(document).ready(function() {
			$("#logoimg").attr('src','${pageContext.request.contextPath}/images/index/logo_w.png');
		})

 		
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
        
        
        //捲動變色
        window.addEventListener('scroll',function(e){

            let header = document.querySelector('header');
            
            let windowPosition = window.scrollY > 0;
            header.classList.toggle('scrolling-nav', windowPosition);
        })
        
        //捲動換logo
        $(window).scroll(function (event) {
            if ($(window).scrollTop() > 0) {
                $("#logoimg").attr("src","${pageContext.request.contextPath}/images/index/logo_black.png");
            } else {
                $("#logoimg").attr("src","${pageContext.request.contextPath}/images/index/logo_w.png");
            }
        });

		//回到最上面
		/* 按下GoTop按鈕時的事件 */
		$('#gotop').click(function() {
			$('html,body').animate({
				scrollTop : 0
			}, 'slow'); /* 返回到最頂 速度slow */
			return false;
		});

		/* 偵測卷軸滑動時，往下滑超過400px就讓GoTop按鈕出現 */
		$(window).scroll(function() {
			if ($(this).scrollTop() > 400) {
				$('#gotop').fadeIn();
			} else {
				$('#gotop').fadeOut();
			}
		});
		
// 		漢堡
		 $('ul .bar i').click(function(){
	            $('header').toggleClass('showbg');
	            $('header .items').toggleClass('show');
	            $('ul .bar i').toggleClass('show');
	            
	        });

// 教練推薦

        document.addEventListener( 'DOMContentLoaded', function () {
            new Splide( '.splide', {
            width: '1120px',
           
            fixedWidth: '14rem',
            fixedHeight: '18rem',
            padding: {
            left:10,
            right:15,
            },                   
            perPage: 4,
            perMove: 1,
            gap: 36,
            rewind : true,
            pagination :false,
            // arrowPath: 'M339.7,10l-65.1,65.3L611.3,500L274.6,924.7l65.1,65.3l385.7-490.2L339.7,10z'
        } ).mount();
        } );
        

        
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
        
	   
        $('#clickName').click(function(){
        	console.log('aaa')
        	$('#ruruEmail').val('aa1234@gmail.com')
        	$('#subject').val('該如何加入TrainMe')
        	$('#message').val('我是一家中小型健身房，看到你們的網站真的很棒，如果我想要加入TrainMe，要怎麼做呢??')
        	$('#ruruName').val('張家豪')
        })
        
        
//         // 找到 select 標籤
//         var gymList = document.getElementById("gymList");

//        // 開始尋找健身房資料的servlet去抓資料，會返回一個promise(承諾)
//         axios.get("/trainme/Gymlist")
//         .then(function (res) {   //若有抓到資料則執行這個function
//           var gyms = res.data; // gyms 為一個物件陣列
//   		console.log(gyms);
//   		for(gym of gyms){
//  	 		console.log(gym);
//   			var option = document.createElement("option");
//   			option.value = gym.id;
//   			option.innerHTML = gym.name;
//   			gymList.appendChild(option);
//   		}
//         });

      </script>

</body>
</html>
