<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>測試首頁</title>

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
<link href="${pageContext.request.contextPath}/assets/css/style.css" rel="stylesheet">
<%-- <link href="${pageContext.request.contextPath}/assets/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet"> --%>
<%-- <link href="${pageContext.request.contextPath}/assets/vendor/owl.carousel/assets/owl.carousel.min.css" rel="stylesheet"> --%>
<%-- <link href="${pageContext.request.contextPath}/assets/vendor/venobox/venobox.css" rel="stylesheet"> --%>

  <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="assets/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet">
  <link href="assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
  <link href="assets/vendor/owl.carousel/assets/owl.carousel.min.css" rel="stylesheet">
  <link href="assets/vendor/venobox/venobox.css" rel="stylesheet">
  <link href="assets/vendor/aos/aos.css" rel="stylesheet">

<%--     <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style_nav.css">    --%>
<link rel="stylesheet" href="<c:url value='/css/style_nav.css' />">
<link rel="stylesheet" href="<c:url value='/css/popup_t1.css' />">
<link rel="stylesheet"
	href="<c:url value='/css/style_carousel_search.css' />">


<style>
/* 	       @import url('https://fonts.googleapis.com/css2?family=Noto+Sans+TC:wght@100;300;400;500;700;900&display=swap');  */

/*教練推薦*/
.hot_trainer {
	text-align: center;
	display: block;
	margin: 20px 0px 0px 0px;
}

.hot_trainer h3 {
	font-size: 18px;
	text-align: center;
	color: #666;
	font-family: 'Noto Sans TC', sans-serif;
}

.splide {
	margin: auto;
}

.splide__slide {
	position: relative;
	/* width: 280px; */
	height: 320px;
	/* background-color: black; */
	/* background: linear-gradient(to bottom, rgba(0,0,0,0) 0%,rgba(0,0,0,0.65) 100%); */
	box-shadow: 0px 0px 5px 0.6px #999;
}

.splide__slide img {
	width: 100%;
	height: 100%;
	/* opacity: 0.5; */
}

.splide__slide .p_t {
	position: absolute;
	width: 100%;
	bottom: 0px;
	background-color: rgba(0, 0, 0, 0.7);;
	padding: 7px 0px 10px;
	color: aliceblue;
	font-family: 'Noto Sans TC', sans-serif;
}

.t_name {
	font-size: 18px;
	font-weight: 700;
	text-align: center;
	margin: 8px;
}

.p_t span {
	display: flex;
	justify-content: space-around;
	/* padding: 5px; */
	font-size: 13px;
	margin: 0px 10px;
}

.p_t span i {
	margin: 0px 10px 0px 0px;
}

/* <p class="t_name">教練名稱</p>
                    <p class="t_location">地點</p>
                    <p class="t_ltimes">20次課程媒合</p> */

/*評價星星*/
.p_t span:nth-child(3) p {
	/* vertical-align: middle; */
	margin: 6px 0px 0px -80px;
	font-size: 15px;
}

.ratings {
	position: relative;
	bottom: 20%;
	left: 4%;
	vertical-align: middle;
	display: inline-block;
	color: #b1b1b1;
	overflow: hidden;
}

.full-stars {
	position: absolute;
	left: 0;
	top: 0;
	white-space: nowrap;
	overflow: hidden;
	color: #fde16d;
}

.empty-stars:before, .full-stars:before {
	content: "\2605\2605\2605\2605\2605";
	font-size: 15pt;
}

.empty-stars:before {
	-webkit-text-stroke: 1px #848484;
}

.full-stars:before {
	-webkit-text-stroke: 1px orange;
}
/* Webkit-text-stroke is not supported on firefox or IE */

/* Firefox */
@
-moz-document url-prefix() { .full-stars { color:#ECBE24;
	
}

}

/* footer */
footer {
	padding: 100px 0 0 0;
	background: #888
}

footer .container {
	display: flex;
	width: 1200px;
	margin: auto;
	font-family: 'Noto Sans TC', sans-serif;
}

.footer-item h3 {
	font-size: 20px;
	color: #fff;
	border-bottom: 1px solid #fff;
	margin-bottom: .5em;
	padding-bottom: .5em;
}

.footer-item {
	width: 0;
	flex-grow: 1;
	margin: 0 20px;
}

.footer-item nav {
	display: flex;
	flex-direction: column;
}

.footer-item nav a {
	color: #fff;
	font-size: 14px;
	line-height: 1.2;
	text-decoration: none;
	padding: 5px 0;
}

.copyright {
	width: 100%;
	text-align: center;
	font-family: Verdana, Geneva, Tahoma, sans-serif;
	margin: 100px 0 0;
	padding: 10px 0px;
	background-color: #000;
	color: #fff;
}

/*其他區塊*/
.other {
	display: flex;
	justify-content: space-around;
	margin: auto;
	width: 100%;
	max-width: 60%;
	height: 400px;
}

.about {
	width: 50%;
	margin: 0px 30px;
}

.about p {
	font-family: 'sans-seri', 'Noto Sans TC',;
	line-height: 1.7;
	font-size: 12px;
}

.about h3 {
	font-family: 'Noto Sans TC', sans-serif;
	margin: 20px;
	text-align: center;
	color: #888;
}

/* @media screen and (min-width: 768px) {
            
        } */
html .noscroll {
	position: fixed;
	overflow-y: scroll;
	width: 100%;
}

html .fixWindow {
	position: fixed;
	width: 100%;
}
    #contact .card:hover i,#contact .card:hover h4{
	color: #2dc997;
    }
    a {
        color:black;
    }
address{
line-height: 26px;
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
							class="d-block w-100" alt="...">
						<div class="ad">
							<h3>健身教練與學員的專屬媒合平台</h3>
							<p>
								教練課程價錢、時段公開透明<br> 省去詢問時間，免於被健身業務打擾<br>
								透過評價系統，讓您篩選最適合自己的教練！
							</p>
						</div>
					</div>
					<div class="carousel-item">
						<img
							src="${pageContext.request.contextPath}/images/index/banner_25002.jpg"
							class="d-block w-100" alt="...">
						<div class="ad">
							<h3>健身教練與學員的專屬媒合平台</h3>
							<p>
								教練課程價錢、時段公開透明<br> 省去詢問時間，免於被健身業務打擾<br>
								透過評價系統，讓您篩選最適合自己的教練！
							</p>
						</div>
					</div>
					<div class="carousel-item">
						<img
							src="${pageContext.request.contextPath}/images/index/banner_25003.jpg"
							class="d-block w-100" alt="...">
						<div class="ad">
							<h3>健身教練與學員的專屬媒合平台</h3>
							<p>
								教練課程價錢、時段公開透明<br> 省去詢問時間，免於被健身業務打擾<br>
								透過評價系統，讓您篩選最適合自己的教練！
							</p>
						</div>
					</div>
				</div>
				<a class="carousel-control-prev" href="#carouselExampleIndicators"
					role="button" data-slide="prev"> <span
					class="carousel-control-prev-icon" aria-hidden="true"></span> <span
					class="sr-only">Previous</span>
				</a> <a class="carousel-control-next" href="#carouselExampleIndicators"
					role="button" data-slide="next"> <span
					class="carousel-control-next-icon" aria-hidden="true"></span> <span
					class="sr-only">Next</span>
				</a>
			</div>

		</div>
		<form class="search_trainer" action="<c:url value='/searchTrainerByCondition' />">
			<li>
			<select name="skillType" class="lesson">
					<option value="0">請選擇</option>
					<c:if test="${skillTypeAll.size() > 0}">
						<c:forEach varStatus="i" begin="0" end="${skillTypeAll.size()-1}">
							<option value="${skillTypeAll.get(i.current).getId()}">${skillTypeAll.get(i.current).getName()}</option>
						</c:forEach>
					</c:if>
			</select>
			</li>
			<li>
			<select name="city" class="location">
					<option value="0">地點</option>
					<option value="1">台北市</option>
					<option value="2">新北市</option>
			</select>
			</li>
			<li><input type="search" name="keyword" placeholder="輸入關鍵字"
				class="search_input"></li>
			<li><button class="search_btn">搜尋教練</button></li>
		</form>
	</div>



	<!-- 人氣教練 -->

	<span class="hot_trainer"> <img
		src="data:image/png;base64,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">
		<h3>本月人氣教練</h3>
	</span>
	<div class="splide">
		<div class="splide__track">
			<ul class="splide__list">

				<c:if test="${trainerAndCourse.size() > 0}">
					<c:forEach varStatus="i" begin="0"
						end="${trainerAndCourse.size()-1}">
						<div class="splide__slide">
							<div class="p_t">
								<p class="t_name">${trainerAndCourse.get(i.current).getTrainerBean_H().getName()}</p>
								<span>
									<p class="t_location">
										<i class="fas fa-map-marker-alt"></i>${trainerAndCourse.get(i.current).getTrainerBean_H().getCity().getName()}</p>
									<p class="t_ltimes">
										<i class="fas fa-user-friends"></i>20次課程媒合
									</p>
								</span> 
								<span>
									<div class="ratings">
										<div class="empty-stars"></div>
										<div class="full-stars" style="width: ${trainerAndCourse.get(i.current).getTrainerBean_H().getRatings() * 20}%"></div>
									</div>
									<p>(${trainerAndCourse.get(i.current).getTrainerBean_H().getRatings_size()})</p>				
								</span>
							</div>
							<a
								href="<c:url value='/trainer_info/${trainerAndCourse.get(i.current).getTrainerBean_H().getId()}?type=index' />">
								<img
								src="/upload/${trainerAndCourse.get(i.current).getTrainerBean_H().getProfile_image()}"
								border="0">
							</a>
						</div>

						<!--                 <div class="splide__slide"> -->
						<!--                     <div class="p_t"> -->
						<!--                         <p class="t_name">林瑪莉</p> -->
						<!--                         <span> -->
						<!--                             <p class="t_location"><i class="fas fa-map-marker-alt"></i>台北市</p> -->
						<!--                             <p class="t_ltimes"><i class="fas fa-user-friends"></i>20次課程媒合</p> -->
						<!--                         </span> -->
						<!--                         <span> -->
						<!--                             <div class="ratings"> -->
						<!--                                 <div class="empty-stars"></div> -->
						<!--                                 <div class="full-stars" style="width:80%"></div>                             -->
						<!--                             </div> -->
						<!--                             <p>(18)</p> -->
						<!--                         </span> -->
						<!--                     </div> -->
						<%--                     <img src="${pageContext.request.contextPath}/images/index/2.png"> --%>
						<!--                 </div> -->

						<!--                 <div class="splide__slide"> -->
						<!--                     <div class="p_t"> -->
						<!--                         <p class="t_name">林瑪莉</p> -->
						<!--                         <span> -->
						<!--                             <p class="t_location"><i class="fas fa-map-marker-alt"></i>台北市</p> -->
						<!--                             <p class="t_ltimes"><i class="fas fa-user-friends"></i>20次課程媒合</p> -->
						<!--                         </span> -->
						<!--                         <span> -->
						<!--                             <div class="ratings"> -->
						<!--                                 <div class="empty-stars"></div> -->
						<!--                                 <div class="full-stars" style="width:80%"></div>                             -->
						<!--                             </div> -->
						<!--                             <p>(18)</p> -->
						<!--                         </span> -->
						<!--                     </div> -->
						<%--                     <img src="${pageContext.request.contextPath}/images/index/3.jpg"> --%>
						<!--                 </div> -->

						<!--                 <div class="splide__slide"> -->
						<!--                     <div class="p_t"> -->
						<!--                         <p class="t_name">林瑪莉</p> -->
						<!--                         <span> -->
						<!--                             <p class="t_location"><i class="fas fa-map-marker-alt"></i>台北市</p> -->
						<!--                             <p class="t_ltimes"><i class="fas fa-user-friends"></i>20次課程媒合</p> -->
						<!--                         </span> -->
						<!--                         <span> -->
						<!--                             <div class="ratings"> -->
						<!--                                 <div class="empty-stars"></div> -->
						<!--                                 <div class="full-stars" style="width:80%"></div>                             -->
						<!--                             </div> -->
						<!--                             <p>(18)</p> -->
						<!--                         </span> -->
						<!--                     </div> -->
						<%--                     <img src="${pageContext.request.contextPath}/images/index/1.jpg"> --%>
						<!--                 </div> -->

						<!--                 <div class="splide__slide"> -->
						<!--                     <div class="p_t"> -->
						<!--                         <p class="t_name">林瑪莉</p> -->
						<!--                         <span> -->
						<!--                             <p class="t_location"><i class="fas fa-map-marker-alt"></i>台北市</p> -->
						<!--                             <p class="t_ltimes"><i class="fas fa-user-friends"></i>20次課程媒合</p> -->
						<!--                         </span> -->
						<!--                         <span> -->
						<!--                             <div class="ratings"> -->
						<!--                                 <div class="empty-stars"></div> -->
						<!--                                 <div class="full-stars" style="width:80%"></div>                             -->
						<!--                             </div> -->
						<!--                             <p>(18)</p> -->
						<!--                         </span> -->
						<!--                     </div> -->
						<%--                     <img src="${pageContext.request.contextPath}/images/index/2.png"> --%>
						<!--                 </div> -->

						<!--                 <div class="splide__slide"> -->
						<!--                     <div class="p_t"> -->
						<!--                         <p class="t_name">林瑪莉</p> -->
						<!--                         <span> -->
						<!--                             <p class="t_location"><i class="fas fa-map-marker-alt"></i>台北市</p> -->
						<!--                             <p class="t_ltimes"><i class="fas fa-user-friends"></i>20次課程媒合</p> -->
						<!--                         </span> -->
						<!--                         <span> -->
						<!--                             <div class="ratings"> -->
						<!--                                 <div class="empty-stars"></div> -->
						<!--                                 <div class="full-stars" style="width:80%"></div>                             -->
						<!--                             </div> -->
						<!--                             <p>(18)</p> -->
						<!--                         </span> -->
						<!--                     </div> -->
						<%--                     <img src="${pageContext.request.contextPath}/images/index/3.jpg"> --%>
						<!--                 </div> -->

					</c:forEach>
				</c:if>
			</ul>
		</div>
	</div>
	<!-- <!-- 登入/註冊 -->
	<jsp:include page="/fragment/login.jsp" />
	
	<div class="other">
		<div class="about">
			<h3>為什麼要找私人健身教練？</h3>
			<p>
				私人健身教練會客製化學員的教練課程，依學員時間、身體狀態安排課程，並視情況調整進度，彈性更高、學習更能建立信心，許多教練也會為學生客製化個人的增肌減脂飲食菜單及課後的自主訓練菜單。
				許多人會想看書或看影片在家自己練，但常因此忽略細節，甚至因為出力不當造成運動傷害，以至於喪失信心與興趣。私人健身教練採「平衡訓練，以全身為訓練範圍，在過程中重量搭配、角度位置、技術，到安全措施全部包辦。</p>
		</div>
		<div class="about">
			<h3>小型健身房收費與特點</h3>
			<p>
				> 收費方式：以上課次數、課程項目計費<br> > 教練費用：單堂教練費用700-3000元，團體課程費用300-1000元<br>
				> 使用限制：預約制或有課程時才能使用<br> >
				優點：使用人數較少，小班制團體課品質相對有保障，對於想嘗試健身但比較害羞的群體來說也是很好的選擇<br> >
				缺點：營業據點較少，團體課的多樣性比較低
			</p>
		</div>
	</div>
	
	<!-- ======= About Section ======= -->
    <section id="about">
      <div class="container">
        <div class="row about-container">

          <div class="col-lg-6 content order-lg-1 order-2">
            <h2 class="title">關於我們</h2>
            <p>
              TraineMe平台是由一群熱愛運動的團隊共同打造，我們團隊希望提供一個公開透明，自由選擇的平台，讓一個想健身的人透過TraineMe平台，尋找喜歡的教練，根據自己的需求，選擇適合的課程。
              健身教練也能透過TraineMe平台媒合學員，並且能即時開課，展現自己所學。藉由TraineMe平台能讓學員與教練達到互利共享的雙贏空間。
            </p>
            
            <div class="icon-box">
              <div class="icon"><i class="far fa-handshake"></i></div>
              <h4 class="title"><a href="">健身教練與學員的專屬媒合平台</a></h4>
              <p class="description">讓中小型健身房的教練與學員快速媒合</p>
            </div>

            <div class="icon-box">
              <div class="icon"><i class="far fa-hand-paper"></i></div>
              <h4 class="title"><a href="">興趣當先，拒絕廢話</a></h4>
              <p class="description">教練課程價錢、時段公開透明，省去詢問時間，免於被健身業務打擾</p>
            </div>

            <div class="icon-box">
              <div class="icon"><i class="fas fa-dumbbell"></i></div>
              <h4 class="title"><a href="">輕鬆開始，輕鬆結束</a></h4>
              <p class="description">平台提供各種教練課程供學員自由選擇，不受合約約束</p>
            </div>
            
             <div class="icon-box">
              <div class="icon"><i class="far fa-star"></i></div>
              <h4 class="title"><a href="">簡單高效，評價透明</a></h4>
              <p class="description">透過評價系統，讓學員篩選最適合自己的教練</p>
            </div>

          </div>

          <div class="col-lg-6 background order-lg-2 order-1">
          	<img src="./assets/img/about-img.jpg">
          </div>
       
        </div>

      </div>
    </section><!-- End About Section -->
     <!-- ======= Facts Section ======= -->
    <section id="facts">
      <div class="container">
        <div class="section-header">
          <h3 class="section-title">TraineMe Growth</h3>
          <p class="section-description">TraineMe平台近期成長</p>
        </div>
        <div class="row counters">

          <div class="col-lg-3 col-6 text-center">
            <span data-toggle="counter-up">168</span>
            <p>學員</p>
          </div>

          <div class="col-lg-3 col-6 text-center">
            <span data-toggle="counter-up">50</span>
            <p>教練</p>
          </div>

          <div class="col-lg-3 col-6 text-center">
            <span data-toggle="counter-up">268</span>
            <p>媒合數</p>
          </div>

          <div class="col-lg-3 col-6 text-center">
            <span data-toggle="counter-up">8</span>
            <p>合作中小型健身房</p>
          </div>

        </div>

      </div>
    </section><!-- End Facts Section -->

	 <section id="contact">
       <div class="container">    
       <div>
<h3 class="text-center text-uppercase">聯絡我們</h3>
<br>
<p class="text-center w-75 m-auto">想成為TrainMe平台的教練或是學員嗎?想了解更多嗎?歡迎諮詢</p>
<br>
<br>
<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3614.7432711166844!2d121.53559291552197!3d25.042785144092026!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3442a97d255598df%3A0x47ea748e8f3f53aa!2z5ZyL56uL6Ie65YyX56eR5oqA5aSn5a24!5e0!3m2!1szh-TW!2stw!4v1616412938598!5m2!1szh-TW!2stw" width="100%" height="380" frameborder="0" style="border:0" allowfullscreen></iframe>
</div>
           <div class="row">
            <div class="col-sm-12 col-md-6 col-lg-4 my-5">
               <div class="card border-0">
                  <div class="card-body text-center">
                    <i class="fas fa-map-marker-alt fa-5x mb-3" aria-hidden="true"></i>   
                    <h4 class="text-uppercase mb-5">辦公室</h4>
                   <address>10608台北市大安區忠孝東路三段1號</address>
                  </div>
                </div>
             </div>
             <div class="col-sm-12 col-md-6 col-lg-4 my-5">
               <div class="card border-0">
                  <div class="card-body text-center">
                    <i class="fa fa-phone fa-5x mb-3" aria-hidden="true"></i>
                    <h4 class="text-uppercase mb-5">客服專線</h4>
                    <address>02-11111111                  
					</address>
                  </div>
                </div>
             </div>
             <div class="col-sm-12 col-md-6 col-lg-4 my-5">
               <div class="card border-0">
                  <div class="card-body text-center">
                  <a href="mailto:trainme015@gmail.com" style="text-decoration:none;">
                  <i class="fas fa-envelope fa-5x mb-3" aria-hidden="true"></i>             
                    <h4 class="text-uppercase mb-5">客服信箱</h4>
                    </a>
                    <address>寫信聯繫客服</address>
                  </div>                                            
                </div>
             </div>
                <div class="container">    
             <div class="row">
             <div class="col-sm-12 col-md-12 col-lg-12 my-5">    
               <div class="card border-0">
                  <div class="card-body text-center">   
                    <a href="<c:url value='/Contact/' />" style="text-decoration:none;">            
                    	<i class="far fa-user-circle fa-5x mb-3" aria-hidden="true"></i>        
                    	<h4 class="text-uppercase mb-5">電子信箱</h4>                
                	</a>    
                 <address>請將您的寶貴意見以填寫表單方式送出<br>我們將於工作日由專人以郵件回覆您的問題</address>                      
                  </div>
                </div>
<!--              </div> -->
<!--              </div> -->
              <section id="contact" class="contact section-bg">
<!--       <div class="container"> -->
<!--         <div class="row"> -->
          <div class="col-lg-12 contact-form-wrap">
            <form action="forms/contact.php" method="post" role="form" class="php-email-form">
              <div class="form-row">
                <div class="col-md-6 form-group">
                  <label for="name">Your Name</label>
                  <input type="text" name="name" class="form-control" id="name" data-rule="minlen:4" data-msg="Please enter at least 4 chars" />
                  <div class="validate"></div>
                </div>
                <div class="col-md-6 form-group">
                  <label for="email">Your Email</label>
                  <input type="email" class="form-control" name="email" id="email" data-rule="email" data-msg="Please enter a valid email" />
                  <div class="validate"></div>
                </div>
              </div>
              <div class="form-group">
                <label for="subject">Subject</label>
                <input type="text" class="form-control" name="subject" id="subject" data-rule="minlen:4" data-msg="Please enter at least 8 chars of subject" />
                <div class="validate"></div>
              </div>
              <div class="form-group">
                <label for="message">Message</label>
                <textarea class="form-control" name="message" rows="8" data-rule="required" data-msg="Please write something for us"></textarea>
                <div class="validate"></div>
              </div>
              <div class="mb-3">
                <div class="loading">Loading</div>
                <div class="error-message"></div>
                <div class="sent-message">Your message has been sent. Thank you!</div>
              </div>
              <div class="text-center"><button type="submit">Send Message</button></div>
            </form>
          </div>
        </div>
      </div>
    </section><!-- End Contact Us Section -->
             </div>
           </div>
       </div>
    </section>	
    
    
	<!-- footer -->

	<footer>
		<div class="container">
			<div class="footer-item">
				<h3>本站地圖</h3>
				<nav>
					<a href="#">關於我們</a> <a href="#">搜尋教練</a> <a href="#">購物商城</a> <a
						href="#">運動論壇</a>
				</nav>
			</div>

			<div class="footer-item">
				<h3>本站地圖</h3>
				<nav>
					<a href="#">關於我們</a> <a href="#">搜尋教練</a> <a href="#">購物商城</a> <a
						href="#">運動論壇</a>
				</nav>
			</div>

			<div class="footer-item">
				<h3>本站地圖</h3>
				<nav>
					<a href="#">關於我們</a> <a href="#">搜尋教練</a> <a href="#">購物商城</a> <a
						href="#">運動論壇</a>
				</nav>
			</div>

		</div>
		<div class="copyright">Copyright &copy; 2021 Train Me</div>
	</footer>

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
        


// 教練推薦

        document.addEventListener( 'DOMContentLoaded', function () {
            new Splide( '.splide', {
            width: '1200px',
            // fixedWidth: '12rem',
            // fixedHeight: '8rem',
            padding: {
                left:20,
                right:20,
            },               
            perPage: 4,
            perMove: 1,
            gap: 40,
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
