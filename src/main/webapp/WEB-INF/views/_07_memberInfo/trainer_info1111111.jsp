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
<link rel="stylesheet" href="<c:url value='/css/style_modal.css' />">
<link rel="stylesheet" href="<c:url value='/css/style_nav.css' />">
<link rel="stylesheet" href="<c:url value='/css/style_st_lesson.css' />">
<link rel="stylesheet" href="<c:url value='/css/popup_t1.css' />">

<%-- <link rel="stylesheet" href="<c:url value='/css/style_st_info.css' />"> --%>
<link rel="stylesheet" href="<c:url value='/css/style_timeset.css' />">

<link rel="stylesheet"
	href="<c:url value='/css/style_trainer_page.css' />">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/@splidejs/splide@2.4.21/dist/css/themes/splide-sea-green.min.css">

<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>

<script
	src="https://cdn.jsdelivr.net/gh/alpinejs/alpine@v2.3.5/dist/alpine.min.js"
	defer></script>
<script src="https://unpkg.com/dayjs@1.8.21/dayjs.min.js"></script>

<style type="text/css">
.tschedule td {
	cursor: pointer;
}
.tschedule .closed,.tschedule .booked,.tschedule .save{
	border-radius: 8px;
	width:50px;
/* 	height:95%; */
 	border:3px solid #fff;
	margin: 5px;
}
.tschedule .closed {
	background: #E7E7E7;
	color: #999;
	cursor: not-allowed;
}

.tschedule .booked {
/* 	background: #FF5500;FF8F00 */
	background-image: linear-gradient(120deg, #FF8F00, #FF5500);
	color: white;
	cursor: not-allowed;
}
.tschedule .save{
	color: white;
	background-image: linear-gradient(120deg, #21d4a7, #0ac2a9);
/* 	background: #30BE8F;  */
/* 	border:1px solid #eee; */
}
.tschedule .save:hover{
	background-image: linear-gradient(120deg, #30E9BB, #0DDFC2);
}


.tschedule .lock{
	cursor: not-allowed;
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


	<!-- ??????/?????? -->
	<c:if test="${LoginOK == null}">
		<jsp:include page="/fragment/login.jsp" />
	</c:if>


	<!-- ????????????????????? -->

	<header id="trainer_navbar">
		<ul>
			<div class="items">
				<li><a href="#introduction">????????????</a></li>
				<li><a href="#class">????????????</a></li>
				<li><a href="#license">????????????</a></li>
				<li><a href="#video">????????????</a></li>
				<li><a href="#reservation">????????????</a></li>
				<li><a href="#feedback">????????????</a></li>
			</div>
		</ul>
	</header>


	<!-- ====================================================================== -->

	<!-- ???????????? -->

	<div id="bt" class="trpg_wrap">
		<div class="backto">
			<c:if test="${type.equals('trainer')}">
				<a href="<c:url value='/tr_info_account/${LoginOK.id}' />"><i
					class="fas fa-chevron-left"> </i> ??????</a>
			</c:if>
			<c:if test="${type.equals('search')}">
				<a href="<c:url value='/searchTrainerAll' />"><i
					class="fas fa-chevron-left"> </i> ??????</a>
			</c:if>
			<c:if test="${type.equals('index')}">
				<a href="<c:url value='/' />"><i
					class="fas fa-chevron-left"> </i> ??????</a>
			</c:if>
		</div>
	</div>
	<a id="introduction"></a>
	<div class="trpg_wrap">
		<div class="trpg_content">
			<div class="trpg_content_left">
				<div class="picture">
					<c:choose>
						<c:when test="${empty  trainerBean.profile_image}">
							<img
								src="${pageContext.request.contextPath}/images/_03_MemberData/member.jpg">
						</c:when>
						<c:otherwise>
							<img src="/upload/${trainerBean.profile_image}">
						</c:otherwise>
					</c:choose>
				</div>
			</div>

			<div class="trpg_content_right">
				<div class="page_title_t">
					<h3>${trainerBean.course}</h3>
				</div>
				<div class="page_title ">

					<h3>${trainerBean.name}</h3>
					<h3>${trainerBean.nickname}</h3>
					<span> <c:if test="${trainerBean.sex.equals('M')}">
							<i class="fas fa-mars"></i>
						</c:if> <c:if test="${trainerBean.sex.equals('F')}">
							<i class="fas fa-venus"></i>
						</c:if>
					</span>
				</div>
				<div class="info_div">
					<label>????????????</label>
					<div class="starss">
						<div class="empty_star">???????????????</div>
						<div class="full_star" style="width:${trainerBean.ratings * 20}%">???????????????</div>
					</div>
					<p>(${trainerBean.ratings_size})</p>
				</div>
				<div class="info_div">
					<label>????????????</label>
					<p>${gym.getName()}</p>
					<!--??????????????????????????????????????????-->
				</div>
				<div class="info_div">
					<label>????????????</label>
					<p>${trainerBean.year}</p>
					???
				</div>
				<div class="info_div">
					<label>????????????</label>
					<p>
						<c:if test="${trainerCoursesSkillType.size() > 0}">
							<c:forEach varStatus="i" begin="0"
								end="${trainerCoursesSkillType.size()-1}">
										${trainerCoursesSkillType.get(i.current).getName()} 
										<c:if test="${i.current != trainerCoursesSkillType.size()-1}">
										???
										</c:if>
							</c:forEach>
						</c:if>
					</p>
				</div>
			</div>

			<div class="trpg_content_gym">

				<div class="page_title gym">
					<h3>${gym.getName()}</h3>
				</div>
				<div class="info_div">
					<span><i class="fas fa-map-marker-alt"></i>${gym.getAddress()}
					</span>
				</div>
				<div class="info_div">
					<span><i class="fas fa-phone"></i>${gym.getPhone()}</span>
				</div>
				<div class="info_div">
					<span><i class="fas fa-home"></i><a href="">????????????</a></span>
				</div>
				<div class="info_div">
					<span>${gym.getIntroduction()}</span>
				</div>
			</div>

		</div>
	</div>


	<!-- ???????????? -->

	<div class="trpg_wrap">
		<div class="title">
			<h4>????????????</h4>
		</div>
		<div class="trpg_content si sit" id="introduction">${trainerBean.introduction}</div>
	</div>



	<!-- ???????????? -->
	<a name="class"></a>
	<div class="trpg_wrap">

		<div class="title">
			<h4>????????????</h4>
		</div>

		<div class="trpg_content si">

			<div class="tab-pane fade show active" id="pills-wait"
				role="tabpanel" aria-labelledby="pills-wait-tab">
				<table class="table table-border ls_class">
					<thead class="thead">
						<tr>
							<th scope="col">????????????</th>
							<th scope="col" class="class_name">????????????</th>
							<th scope="col">????????????</th>
						</tr>
					</thead>
					<tbody class="tr_height">

						<c:if test="${trainerCourses.size() != 0}">
							<c:forEach varStatus="i" begin="0"
								end="${trainerCourses.size()-1}">
								<tr>
									<td>${trainerCourses.get(i.current).getSkill_typeBean_H().getName()}</td>
									<td>${trainerCourses.get(i.current).getSkillBean_H().getName()}</td>
									<td>${trainerCourses.get(i.current).getPrice()}</td>
								</tr>
							</c:forEach>
						</c:if>
					</tbody>
				</table>
			</div>
		</div>
	</div>


	<!-- ???????????? -->
	<a name="license"></a>
	<div class="trpg_wrap">
		<div class="title">
			<h4>????????????</h4>
		</div>

		<div class="trpg_content si">
			<div class="lcs">
				<!-- 				<li>AASFP ???????????????????????????????????????????????????????????????</li> -->
				<!-- 				<li>ACE ???????????????????????????????????????</li> -->
				<!-- 				<li>AFAA PFT ????????????????????????????????????????????????</li> -->
				<!-- 				<li>Balanced Body Pilates ??????????????????????????????????????????????????????</li> -->
				<!-- 				<li>EOXi ????????????????????????</li> -->
				<c:if test="${trainerLicenseBean.size() != 0}">
					<c:forEach varStatus="i" begin="0"
						end="${trainerLicenseBean.size()-1}">
						<li>${trainerLicenseBean.get(i.current).getName()}</li>
					</c:forEach>
				</c:if>
			</div>
		</div>
	</div>

	<!-- ???????????? -->
	<a id="video"></a>
	<div class="trpg_wrap">
		<div class="title">
			<h4>????????????</h4>
		</div>

		<div class="trpg_content si">
			<div class="video">
				<c:choose>
					<c:when test="${empty  trainerBean.profile_video}">
						(??????????????????????????????)
					</c:when>
					<c:otherwise>
						<video id="video" class="upload_videobox" controls>
							<source src="/upload/${trainerBean.profile_video}"
								type="video/mp4" id="video_del">
						</video>
						<P class="p" style="text-align: center;">- ???????????????????????????????????????????????? -</P>


					</c:otherwise>
				</c:choose>

			</div>
		</div>
	</div>
	
	
	
<!-- 	<!-- ?????? --> -->
<!-- <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal"> -->
<!--     Launch demo modal -->
<!--   </button> -->
  
<!--   <!-- ???????????? --> -->
<!--   <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true"> -->
<!--     <div class="modal-dialog modal-dialog-centered"> -->
<!--       <div class="modal-content"> -->
<!--         <div class="modal-header"> -->
<!--           <h5 class="modal-title" id="exampleModalLabel">?????????????????????</h5> -->
<!--         </div> -->
<!--         <div class="modal-body"> -->
<!--             ??????????????? -->
<!--             2020-01-23??? -->
<!--             09:00-10:00 -->
<!--         </div> -->
<!--         <div class="modal-footer"> -->
<!--           <button type="button" class="btn btn-secondary" data-dismiss="modal">??????</button> -->
<!--           <button type="button" class="btn btn-primary">??????</button> -->
<!--         </div> -->
<!--       </div> -->
<!--     </div> -->
<!--   </div> -->





	<!-- ???????????? -->

	<a name="reservation"></a>
	<div class="trpg_wrap">
		<div class="title">
			<h4>????????????</h4>

		</div>
		<div class="trpg_content si" x-data="data()" x-init="init($refs)">
			<!-- ???????????? -->
			<div class="reservation">

				<div class="year">
					<span>2021???</span>
				</div>

				<div class="choose_date">
					<label>???????????????</label> <input type="date" id="date_begin"
						name="date_begin" class="input_date" x-model="beginDate"
						@change="updateBeginDate()" x-ref="date" />
				</div>

			</div>

			<div class="a">
								<template x-if="isToday()">
									<span class="pre"><i class="fas fa-angle-left"
										@click="lessDate()"></i></span>
								</template>
							<div class="list">		
					<div class="choose_box">
						<div class="sc">
							<!-- ?????????????????????????????????????????????????????? -->
							<table class="table tschedule">
								<thead class="thead">
									<tr>
										<th scope="col"></th>
										<template x-for="date in dates" :key="date.day()">
											<th scope="col">
											
												<div x-text="parseDayOfWeek(date.day())"></div>
												<div x-text="date.format('MM/DD')"></div>
											</th>
										</template>
									</tr>
								</thead>
								<tbody class="tbody">
									<template x-for="hour in hours" :key="hour">
										<tr>
											<th scope="row" x-text="hour + ':00 - '+ (hour+1) + ':00'"></th>
											<template x-for="date in dates" :key="date + hour">
												<td
													:class="{
		                       			 closed :isClosed(date,hour),  
				                        booked :isBooked(date, hour)"
													@click="bookCourse(date,hour)">
													<template x-if="isBooked(date, hour)">
														<span>?????????</span>
													</template>
													<template x-if="isClosed(date, hour)">
														<span>?????????</span>
													</template>
													<template x-if="!isClosed(date, hour) && !isBooked(date, hour)">
														<button class="save" :class= "lock :isTrainer()"
															style="border-radius: 5px; background-color: #eee; padding: 15px 20px">??????</button>
													</template>
												</td>
											</template>	
										</tr>
									</template>

							</tbody>
						</table>
					</div>



					<div class="sc">
						<!-- ?????????????????????????????????????????????????????? -->
					</div>
				</div>

</div>
							<template x-if="isEnd()">
								<span class="next"><i class="fas fa-angle-right"
									@click="addDate()"></i></span>
							</template>
		</div>



		</div>


	</div>



	<!-- ???????????? -->

	<a name="feedback"></a>
	<div class="trpg_wrap">
		<div class="title">
			<h4>????????????</h4>
		</div>
		<div class="trpg_content si feedback">


			<!-- ????????????(????????????????????????fb div) -->
			<c:if test="${trainerCourseAndStudentCourseAndRatings.size() != 0}">
				<c:forEach varStatus="i" begin="0"
					end="${trainerCourseAndStudentCourseAndRatings.size()-1}">
					<div class="fb">

						<!-- ??????????????? -->
						<div class="mb_picture">
							<c:choose>
								<c:when
									test="${empty  trainerCourseAndStudentCourseAndRatings.get(i.current).getStudentBean_H().getProfile_image()}">
									<img
										src="${pageContext.request.contextPath}/images/_03_MemberData/member.jpg">
								</c:when>
								<c:otherwise>
									<img
										src="/upload/${trainerCourseAndStudentCourseAndRatings.get(i.current).getStudentBean_H().getProfile_image()}">
								</c:otherwise>
							</c:choose>
						</div>

						<!-- ???????????? -->
						<div class="fb_content">

							<!-- ???????????????????????? -->
							<div class="fc_title">
								<span>${trainerCourseAndStudentCourseAndRatings.get(i.current).getStudentBean_H().getName()}</span>
								<span>${trainerCourseAndStudentCourseAndRatings.get(i.current).getDate()}</span>
								<label>?????????</label><span>${trainerCourseAndStudentCourseAndRatings.get(i.current).getTrainerCourseBean_H().getSkillBean_H().getName()}</span>
							</div>

							<!-- ???????????? (???)-->
							<div class="fc_star">
								<div class="starss" id="starss">
									<div class="empty_star">???????????????</div>
									<div class="full_star"
										style="width:${trainerCourseAndStudentCourseAndRatings.get(i.current).getRatingsBean_H().getPoint() * 20}%">???????????????</div>
								</div>
							</div>

							<!-- ?????? -->
							<div class="sit">
								<p>${trainerCourseAndStudentCourseAndRatings.get(i.current).getRatingsBean_H().getComment()}</p>
							</div>

						</div>
					</div>
				</c:forEach>
			</c:if>
			<!-- 			<div class="fb"> -->
			<!-- 				??????????????? -->
			<!-- 				<div class="mb_picture"> -->
			<%-- 					<img src="<c:url value='/images/_03_MemberData/member.jpg' />"> --%>
			<!-- 				</div> -->

			<!-- 				???????????? -->
			<!-- 				<div class="fb_content"> -->

			<!-- 					???????????????????????? -->
			<!-- 					<div class="fc_title"> -->
			<!-- 						<span>?????????</span> <span>2021-01-27 08:30</span> <label>?????????</label><span>????????????????????????????????????????????????????????????</span> -->
			<!-- 					</div> -->

			<!-- 					???????????? (???) -->
			<!-- 					<div class="fc_star"> -->
			<!-- 						<div class="starss" id="starss"> -->
			<%-- 							<img value="1" src="<c:url value='/images/star1.png' />"> <img --%>
			<%-- 								value="2" src="<c:url value='/images/star1.png' />"> <img --%>
			<%-- 								value="3" src="<c:url value='/images/star1.png' />"> <img --%>
			<%-- 								value="4" src="<c:url value='/images/star1.png' />"> <img --%>
			<%-- 								value="5" src="<c:url value='/images/star1.png' />"> --%>
			<!-- 						</div> -->
			<!-- 					</div> -->

			<!-- 					?????? -->
			<!-- 					<div class="fc_content"> -->
			<!-- 						<p> -->
			<!-- 							?????????,???????????????<br> ????????????????????????????????????,??????????????????,<br> -->
			<!-- 							??????????????????????????????????????????????????????????????????????????????????????????????????????<br> ????????????! -->
			<!-- 						</p> -->
			<!-- 					</div> -->

			<!-- 				</div> -->
			<!-- 			</div> -->

			<!-- 			<div class="fb"> -->

			<!-- 				??????????????? -->
			<!-- 				<div class="mb_picture"> -->
			<%-- 					<img src="<c:url value='/images/_03_MemberData/member.jpg' />"> --%>
			<!-- 				</div> -->

			<!-- 				???????????? -->
			<!-- 				<div class="fb_content"> -->

			<!-- 					???????????????????????? -->
			<!-- 					<div class="fc_title"> -->
			<!-- 						<span>?????????</span> <span>2021-01-27 08:30</span> <label>?????????</label><span>????????????????????????????????????????????????????????????</span> -->
			<!-- 					</div> -->

			<!-- 					???????????? (???) -->
			<!-- 					<div class="fc_star"> -->
			<!-- 						<div class="starss" id="starss"> -->

			<%-- 							<img value="1" src="<c:url value='/images/star1.png' />"> <img --%>
			<%-- 								value="2" src="<c:url value='/images/star1.png' />"> <img --%>
			<%-- 								value="3" src="<c:url value='/images/star1.png' />"> <img --%>
			<%-- 								value="4" src="<c:url value='/images/star1.png' />"> <img --%>
			<%-- 								value="5" src="<c:url value='/images/star1.png' />"> --%>
			<!-- 						</div> -->
			<!-- 					</div> -->

			<!-- 					?????? -->
			<!-- 					<div class="fc_content"> -->
			<!-- 						<p> -->
			<!-- 							?????????,???????????????<br> ????????????????????????????????????,??????????????????,<br> -->
			<!-- 							??????????????????????????????????????????????????????????????????????????????????????????????????????<br> ????????????! -->
			<!-- 						</p> -->
			<!-- 					</div> -->

			<!-- 				</div> -->
			<!-- 			</div> -->

			<!-- 		</div> -->
			<!-- 	</div> -->

			<!-- ??????????????? -->
			<a
				href="https://www.blogger.com/blogger.g?blogID=2031514508322140995#"
				id="gotop"> <i class="fa fa-angle-up"></i>
			</a>

			<script
				src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
			<script>
		//???????????????
		$(function() {
			/* ??????GoTop?????????????????? */
			$('#gotop').click(function() {
				$('html,body').animate({
					scrollTop : 0
				}, 'slow'); /* ??????????????? ??????slow */
				return false;
			});

			/* ???????????????????????????????????????400px??????GoTop???????????? */
			$(window).scroll(function() {
				if ($(this).scrollTop() > 400) {
					$('#gotop').fadeIn();
				} else {
					$('#gotop').fadeOut();
				}
			});
		});
		
		
		
		         

		let today = dayjs().add(1,'day').format('YYYY-MM-DD');
		  function data() {
			    return {
				      beginDate : today,
				      dates:[],
				      hours : [8,9,10,11,12,13,14,15,16,17,18,19,20,21],
				      closed : [],
				      booked : [],
				      init($refs){
				        this.updateBeginDate();
				        this.getBookedHours();
				        this. getClosedHours();
				        $refs.date.min = today;
				        var dateEnd = dayjs(today).add(14,'day');
				        dateEndStr = dayjs(dateEnd).format('YYYY-MM-DD');
				        $refs.date.max = dateEndStr;
				      },
				      getBookedHours(){

				    	  const self = this;
				    	  $.get("/TrainMe/TimeOff/getBooked/" + ${trainerBean.id},
				                  function (data) {
				                	self.booked = data;
				                  },
				                  "json"
				        );
				    	  

				      },
				      getClosedHours(){
						var dateEnd = dayjs(this.beginDate).add(7,'day');
						const datax = {dateBegin:this.beginDate , dateEnd: dateEnd.format('YYYY-MM-DD') }
						const self = this;
				    	$.get("/TrainMe/TimeOff/getClosed/" + ${trainerBean.id}, datax,
				                  function (data) {
				                	self.closed = data;
// 				                	 console.log(closed);
				                  },
				                  "json"
				        );
				      },
				      updateBeginDate(){
					        this.dates = this.generateDates(this.beginDate);
					  },
					  generateDates(beginDate){
					        let  result = [];
					        for (let i = 0; i < 7; i++) {
					          let date = dayjs(this.beginDate).add(i,'day');
					          result.push(date);
					        }
					        // console.log(result);
					        return result;
					 },
				     parseDayOfWeek(day){
				        let week = ['???','???','???','???','???','???','???']
				        return week[day];
				     },
				     toDateHourStr(date, hour){
					        const dateStr = date.format('YYYY-MM-DD');
					        return dateStr + "_" + hour;;
					 },
					 bookCourse(date,hour){
					    	  const dateStr = date.format('YYYY-MM-DD');
					        if(this.isBooked(date,hour) || this.isClosed(date,hour) || this.isTrainer() ){
					          return;
					 		 }   
					        var yes = confirm('?????????????????? ' + dateStr + ' ' +   hour +':00 - '+(hour+1)+':00 ? ')
							if(!yes){
								
								event.preventDefault();
							}
					        if(yes){
					        	if(${LoginOK == null}){
// 					        		console.log(${LoginOK});
					        		alert("????????????")
					        		Show();
// 		====================?????????????????????????????????????????????????????????====================
// 					        		if(${LoginOK != null}){
// 					        		window.location.href="/bookCourse";
// 					        		}
					        	}else{
					        		  console.log(${empty LoginOK.id});
					        		  console.log('111');
					        		var stId = ${empty LoginOK.id} ? 0 : ${LoginOK.id}
					        		window.location.href="/TrainMe/bookCourse?tr=" + ${trainerBean.id} +"&st=" + stId
					        							+ "&date=" + dateStr + "&hour=" + hour;
					        	}
					        }
					        
					      },
					      isBooked(date,hour){
					        // const dateStr = date.format('YYYY-MM-DD');
					        // const dateHourStr = `${dateStr}_${hour}`;
					        const dateHourStr = this.toDateHourStr(date, hour);
// 					        console.log(this.booked);
					        return this.booked.includes(dateHourStr);
					      },
					      isClosed(date, hour){
//					        const dateStr = date.format('YYYY-MM-DD');
					        // const dateHourStr = `${dateStr}_${hour}`;
					    	const dateHourStr = this.toDateHourStr(date, hour);
						    return this.closed.includes(dateHourStr);
					        
					      },
					      isToday(){
// 					    	  console.log(this.beginDate == today);
					    	  return this.beginDate != today;
					      },
					      lessDate(){
					    	  this.beginDate = dayjs(this.beginDate).subtract(7,'day').format('YYYY-MM-DD');
					    	  this.updateBeginDate();
					      },
					      addDate(){
					    	  this.beginDate = dayjs(this.beginDate).add(7,'day').format('YYYY-MM-DD');
					    	  this.updateBeginDate();
					      },
					      isEnd(){
					    	  var endDate =  dayjs(today).add(14,'day').format('YYYY-MM-DD');
					    	  return this.beginDate != endDate;
					      },
					      isTrainer(){
					    	  var logOk = ${LoginOK.type};
					    	  return logOk == 2;
					      }
			      
			      
			 	}
		    
		  }
		
		  
	</script>
</body>
</html>
