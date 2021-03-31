<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>尋找教練-Train Me 健身教練與學員的最佳媒合平台</title>
<link rel="stylesheet" href="<c:url value='/css/style.css' />">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css"
	integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l"
	crossorigin="anonymous" />
<link rel="stylesheet" href="<c:url value='/css/style_nav.css' />">
<link rel="stylesheet" href="<c:url value='/css/popup_t1.css' />">
<link rel="stylesheet"
	href="<c:url value='/css/style_search_trainer.css' />">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/@splidejs/splide@2.4.21/dist/css/themes/splide-sea-green.min.css">
<link rel="stylesheet"	href="<c:url value='/css/style_footer.css' />">
<link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">

<style>
footer {
	margin-top:120px;
}
</style>
<script
	src="https://cdn.jsdelivr.net/gh/alpinejs/alpine@v2.3.5/dist/alpine.min.js" defer></script>
<script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
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

	<!-- ====================================================================== -->

	<!-- 登入/註冊 -->
	<c:if test="${LoginOK == null}">
		<jsp:include page="/fragment/login.jsp" />
	</c:if>



	<!-- 搜尋 -->

	<div class="search_area">
		<div class="title">
			<h3>搜尋教練</h3>
		</div>

		<div class="search_trainer">

			<!-- 搜尋bar -->

			<form action="<c:url value='/searchTrainerByCondition' />">
				<label>課程種類：</label>
				<li><select name="skillType" class="lesson">
						<option value="0">請選擇</option>
						<c:if test="${skillTypeAll.size() > 0}">
							<c:forEach varStatus="i" begin="0" end="${skillTypeAll.size()-1}">
								<option value="${skillTypeAll.get(i.current).getId()}">${skillTypeAll.get(i.current).getName()}</option>
							</c:forEach>
						</c:if>
				</select></li> <label>地點：</label>
				<li><select name="city" class="location">
						<option value="0">請選擇</option>
						<option value="1">台北市</option>
						<option value="2">新北市</option>
				</select></li>
				<li><input type="search" name="keyword" placeholder="輸入關鍵字"
					class="search_input"></li>
				<li><button class="search_btn">
						<i class="fas fa-search"></i>
					</button></li>

			</form>


			<!-- 排序 -->

			<div class="sequence">

				<label>目前排序</label> <a href="#">即時推薦</a> <a href="#">優質教練優先</a> <a
					href="#">新教練優先</a> <a href="#">低價優先</a> <a href="#">多評價優先</a>

			</div>
		</div>


		<!-- 搜尋結果 -->
		<div class="result">

			<!-- 教練框(每次新增就是整個fb div) -->
			<c:if test="${trainerCourseAll.size() > 0}">
				<c:forEach varStatus="i" begin="0"
					end="${trainerCourseAll.size()-1}">


					<div class="fb" data-aos="fade-up">

						<!-- 教練頭像&名稱&評價 -->
						<div class="mpb">
							<div class="mb_picture">
								<c:choose>
									<c:when
										test="${trainerCourseAll.get(i.current).getTrainerBean_H().getProfile_image() == null}">
										<img
											src="<c:url value="/images/_03_MemberData/member.jpg" />">
									</c:when>
									<c:otherwise>
										<img
											src="/upload/${trainerCourseAll.get(i.current).getTrainerBean_H().getProfile_image()}">
									</c:otherwise>
								</c:choose>
							</div>


							<span>${trainerCourseAll.get(i.current).getTrainerBean_H().getName()}</span>

							<!-- 評價星星 (暫)-->
							<c:choose>
								<c:when
									test="${empty  trainerCourseAll.get(i.current).getTrainerBean_H().getRatings_size()}">
									<p class="norate">目前無評價</p>
								</c:when>
								<c:otherwise>
									<div class="fc_star">
										<div class="starss">
											<div class="empty_star">★★★★★</div>
											<div class="full_star"
												style="width:${trainerCourseAll.get(i.current).getTrainerBean_H().getRatings() * 20}%">★★★★★</div>
										</div>
										<span>(${trainerCourseAll.get(i.current).getTrainerBean_H().getRatings_size()})</span>
									</div>
								</c:otherwise>
							</c:choose>
						</div>

						<!-- 內容 -->
						<div class="fb_content" x-data="data()" x-init="init()">

							<!-- 課程資訊 -->
							<div class="fc_title">
							
							<c:if test="${LoginOK.type == 1}">
								<a class="trTitle"
									href="<c:url value='/trainer_info/${trainerCourseAll.get(i.current).getTrainerBean_H().getId()}?type=search&stId=${LoginOK.id}' />">
									${trainerCourseAll.get(i.current).getTrainerBean_H().getCourse()}
								</a>
							</c:if>
							
							<c:if test="${LoginOK.type != 1}">
								<a class="trTitle"
									href="<c:url value='/trainer_info/${trainerCourseAll.get(i.current).getTrainerBean_H().getId()}?type=search' />">
									${trainerCourseAll.get(i.current).getTrainerBean_H().getCourse()}
								</a>
							</c:if>


							<c:if test="${st_favorite.size() >= 0}">
								<a href="javascript:;" class="heart" title="收藏教練"> <i
										class="fas fa-heart like" :class="{ change_color : isLike(${trainerCourseAll.get(i.current).getTrainerBean_H().getId()}) }"
										id="tr_${trainerCourseAll.get(i.current).getTrainerBean_H().getId()}"></i>
								</a>
							</c:if>


							</div>
							<div class="ls_info">
								<label>課程種類： <span> <c:if
											test="${trainerOfSkillType.size() != 0}">
											<c:forEach varStatus="a" begin="0"
												end="${trainerOfSkillType.size()-1}">
												<c:if
													test="${trainerCourseAll.get(i.current).getTrainerBean_H().getId() == trainerOfSkillType.get(a.current).getTrainerBean_H().getId()}">				
													${trainerOfSkillType.get(a.current).getSkill_typeBean_H().getName()}
												</c:if>
											</c:forEach>
										</c:if>

								</span>
								</label>
								<br>
								<label>課程價格： <span>${trainerCourseAll.get(i.current).getPrice()}
										up</span></label>
							</div>


							<!-- 自我介紹 -->
							<div class="fc_content">
								<p>
									${trainerCourseAll.get(i.current).getTrainerBean_H().getIntroduction()}
								</p>
							</div>


						</div>



					</div>
				</c:forEach>
			</c:if>


		</div>


<!-- 		<nav aria-label="Page navigation example"> -->
<!-- 			<ul class="pagination justify-content-center"> -->
<!-- 				<li class="page-item disabled"><a class="page-link" href="#" -->
<!-- 					tabindex="-1" aria-disabled="true">Previous</a></li> -->
<!-- 				<li class="page-item"><a class="page-link" href="#">1</a></li> -->
<!-- 				<li class="page-item"><a class="page-link" href="#">2</a></li> -->
<!-- 				<li class="page-item"><a class="page-link" href="#">3</a></li> -->
<!-- 				<li class="page-item"><a class="page-link" href="#">Next</a></li> -->
<!-- 			</ul> -->
<!-- 		</nav> -->


	</div>

	<!-- footer -->
	<jsp:include page="/fragment/footer.jsp" />

	<!-- 回到最上面 -->
	<a href="https://www.blogger.com/blogger.g?blogID=2031514508322140995#"
		id="gotop"> <i class="fa fa-angle-up"></i>
	</a>
	
	


	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<!-- 	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script> -->
	<script>

	// 浮現特效

	AOS.init();

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
	
	
	
		// 點擊收藏愛心切換顏色
		$('.heart').click(function(e) {
			
				
			
			var trId = e.target.id;
			var trIdStr = trId.substring(3, trId.length);
			
			
			if($('#' + trId).hasClass('change_color')){
				var id = "${LoginOK.id}" == "" ? 0 : ${LoginOK.id}
				$.post("/TrainMe/deleteFavorite/" + id , {tr_id : trIdStr},
	              		   function (data, textStatus, jqXHR) {
					console.log("okkkk");
							},
							"json"	
	                 );
				
			}else{
				var id = "${LoginOK.id}" == "" ? 0 : ${LoginOK.id}
				$.post("/TrainMe/addFavorite/" + id, {tr_id : trIdStr},
	              		   function (data, textStatus, jqXHR) {
							
							},
							"json"	
	                 );
				
			}
			
			
			
			$('#' + trId).toggleClass('change_color');
		});

		
		
		
		function data() {
			return{
				favoriteTr : [],
				init(){
					
					const self = this;
					var id = "${LoginOK.id}" == "" ? 0 : ${LoginOK.id}
					$.get("/TrainMe/favoriteList/" + id,
			                  function (data) {	
								console.log(data);
			                	 self.favoriteTr = data;
			                  },
			                  "json"
			        );
				},
				isLike(trId){
					return this.favoriteTr.includes(trId);
				},
				
				
				
			}
		}

		// $.post("/TrainMe/totalPage",
		// 		   function (data, textStatus, jqXHR) {
		// 	   console.log(data);

		// 		},
		// 		"json"	
		// );
	</script>
</body>
</html>
