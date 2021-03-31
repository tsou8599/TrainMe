<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Train Me 健身教練與學員的最佳媒合平台</title>
<link rel="stylesheet" href="<c:url value='/css/style.css' />">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css"
	integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l"
	crossorigin="anonymous" />
<link rel="stylesheet" href="<c:url value='/css/style_st_info.css' />">
<link rel="stylesheet" href="<c:url value='/css/style_nav.css' />">
<link rel="stylesheet" href="<c:url value='/css/style_mail.css' />">
<link rel="stylesheet" href="<c:url value='/css/style_footer.css' />">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">

<!-- 暫時代替側邊選單點擊變色的功能的CSS -->
<style>
html,
body {
    height: 100%;
    margin: 0;
    padding: 0;
}
.container {
    min-height: 100%;
    overflow: hidden;
    padding-bottom: 50px;
}
.footer {
    height: 50px;
    line-height: 50px;
    background: rgb(15, 112, 202);
    margin-top: -50px;
}
/* .container { */
/* 	margin-bottom:150px; */
/* } */

.aside ul li:nth-child(2) a {
	color: #21d4a7;
}

.aside ul li:nth-child(2) a:hover {
	color: #fff;
}
</style>

<script
	src="https://cdn.jsdelivr.net/gh/alpinejs/alpine@v2.3.5/dist/alpine.min.js"
	defer></script>
</head>
<body>

	<!-- ============上方導覽列======================================================= -->
	<c:if test="${LoginOK.type == 1}">
		<jsp:include page="/fragment/nav_st.jsp" />
	</c:if>

	<c:if test="${LoginOK.type == 2}">
		<jsp:include page="/fragment/nav_tr.jsp" />
	</c:if>



	<div class="container">

		<!-- ============左側選單======================================================= -->
		<c:if test="${LoginOK.type == 1}">
			<jsp:include page="/fragment/sidebar_st.jsp" />
		</c:if>

		<c:if test="${LoginOK.type == 2}">
			<jsp:include page="/fragment/sidebar_tr.jsp" />
		</c:if>

		<!-- ============右側網頁======================================================= -->



		<div class="main">

			<!-- ============個人資料======================================================= -->
			<div class="content">
				<div class="title">
					<h3>我的通知</h3>
				</div>

				<div class="info_wrap">
					<div class="info_wrap_mail" x-data="data()" x-init="init()">
						<template x-for="(message, index) in messages" :key="message.id">


							<!-- 官方通知 -->
							<div :id=" 'msg_' + message.id" class="mail_area "
								@click="toggle( message.id, index)">
								<div class="mail_area_box">
									<div class="top_mail_title">
										<div class="icon_mini">
											<template x-if="!message.is_read">
												<div id="dot" class="dot"></div>
											</template>
											<template x-if="message.is_read && !message.openStatus">
												<div>已讀</div>
											</template>
										</div>
										<div class="mail_title">
											<span x-text="message.title"></span>
										</div>
										<div class="date">
											<span x-text="message.date"></span>
										</div>
									</div>
									<div id="notice" class="notice nn1">
										<div class="n_div">
											<div class="notice_area">
												<p x-text="message.content"></p>

												<template x-if="isTrPass(message.kind)">
													<button class="btn_notice" @click="goTrInfo()">個人主頁</button>
													<button class="btn_notice" @click="goTrData()">帳號設定</button>
												</template>

												<template x-if="isStPass(message.kind)">
													<button class="btn_notice" @click="goStInfo()">個人資料</button>
													<button class="btn_notice" @click="goStData()">帳號設定</button>
												</template>

												<template x-if="isTrBook(message.kind)">
													<button class="btn_notice" @click="goTrCourse()">課程管理</button>
												</template>

												<template x-if="isAllowToSt(message.kind)">
													<button class="btn_notice" @click="goStCourse()">課程管理</button>
												</template>

												<template x-if="isRejectToSt(message.kind)">
													<button class="btn_notice" @click="goStCourse()">課程管理</button>
												</template>

												<template x-if="isStPrice(message.kind)">
													<button class="btn_notice" @click="goStPrint()">我的點數</button>
												</template>

											</div>
										</div>
									</div>
								</div>
							</div>

						</template>


						<!--                         官方通知 -->
						<!--                         <div id="mail_area" class="mail_area no2"> -->
						<!--                             <div class="mail_area_box"> -->
						<!--                                 <div class="top_mail_title"> -->
						<!--                                     <div class="icon_mini"> -->
						<!--                                         <div id="dot" class="dot"></div> -->
						<!--                                     </div> -->
						<!--                                     <div class="mail_title"> -->
						<!--                                         <span>親愛的會員你好，歡迎加入TrainMe</span> -->

						<!--                                     </div> -->
						<!--                                 </div> -->
						<!--                                 <div id="notice" class="notice nn2"> -->
						<!--                                     <div class="n_div"> -->
						<!--                                     <div class="icon" style="background-color: #21d4a7"> -->
						<!--                                         <i class="fas fa-info"></i> -->
						<!--                                     </div> -->
						<!--                                     <div class="notice_area"> -->
						<!--                                         <p>親愛的會員你好，TrainMe 希望帶你認識更多好教練，趕快填好個人資料，一起運動吧!</p> -->
						<!--                                         <button class="btn_notice">填寫個人資訊</button> -->
						<!-- 						                                        <div class="date"> -->
						<!-- 						                                            <span>2020-10-22 00:00:00</span> -->
						<!-- 						                                        </div> -->
						<!--                                     </div> -->
						<!--                                 </div> -->
						<!--                             </div> -->
						<!--                             </div> -->
						<!--                         </div> -->




						<!--                         各個通知類型對應的ICON圖示&顏色============================================ -->
						<!--                         for學員 儲值 -->
						<!--                         <div class="mail_area"> -->
						<!--                             <div class="icon" style="background-color: #FFDC00"> -->
						<!--                                 <i class="fas fa-coins"></i> -->
						<!--                             </div> -->
						<!--                             <div class="mail_area_box"> -->
						<!--                                 <div class="title"> -->
						<!--                                     <h6>for學員 儲值</h6> -->
						<!--                                 </div> -->
						<!--                                 <div class="notice"> -->
						<!--                                     <p>親愛的 謝馨儀 你好，你剛剛成功儲值了 5050 點，目前的點數餘額為 32230 點，可以到「我的點數」中確認唷！</p> -->
						<!--                                 </div> -->
						<!--                                 <div class="date"> -->
						<!--                                     <span>2020-10-22 00:00:00</span> -->
						<!--                                 </div> -->
						<!--                             </div> -->
						<!--                         </div> -->
						<!--                         for學員 預約了課程 -->
						<!--                         <div class="mail_area"> -->
						<!--                             <div class="icon" style="background-color: salmon"> -->
						<!--                                 <i class="far fa-hand-point-up"></i> -->
						<!--                             </div> -->
						<!--                             <div class="mail_area_box"> -->
						<!--                                 <div class="title"> -->
						<!--                                     <h6>for學員 預約了課程</h6> -->
						<!--                                 </div> -->
						<!--                                 <div class="notice"> -->
						<!--                                     <p>親愛的 謝馨儀 你好，你剛剛預約了一堂 阿庭 教練的「心肺訓練」課程，將在 2021-03-23 13:00-14:00 上課，本堂課程扣款 900 點，可以到「我的課程」、「我的點數」中確認唷！</p> -->
						<!--                                 </div> -->
						<!--                                 <div class="date"> -->
						<!--                                     <span>2020-10-22 00:00:00</span> -->
						<!--                                 </div> -->
						<!--                             </div> -->
						<!--                         </div> -->
						<!--                         for教練 有新的預約 -->
						<!--                         <div class="mail_area"> -->
						<!--                             <div class="icon" style="background-color: salmon"> -->
						<!--                                 <i class="far fa-hand-point-up"></i> -->
						<!--                             </div> -->
						<!--                             <div class="mail_area_box"> -->
						<!--                                 <div class="title"> -->
						<!--                                     <h6>for教練 預約了課程</h6> -->
						<!--                                 </div> -->
						<!--                                 <div class="notice"> -->
						<!--                                     <p>親愛的基德教練你好，學員謝馨儀希望於2021-03-22 11:00-12:00 預約您的OOO課程，請趕快到課程管理回覆唷!</p> -->
						<!--                                 </div> -->
						<!--                                 <div class="date"> -->
						<!--                                     <span>2020-10-22 00:00:00</span> -->
						<!--                                 </div> -->
						<!--                             </div> -->
						<!--                         </div> -->
						<!--                         for學員 教練不同意課程 -->
						<!--                         <div class="mail_area"> -->
						<!--                             <div class="icon" style="background-color: #2FE780"> -->
						<!--                                 <i class="fas fa-exclamation-triangle"></i> -->
						<!--                             </div> -->
						<!--                             <div class="mail_area_box"> -->
						<!--                                 <div class="title"> -->
						<!--                                     <h6>for學員 教練不同意課程</h6> -->
						<!--                                 </div> -->
						<!--                                 <div class="notice"> -->
						<!--                                     <p>教練不同意課程</p> -->
						<!--                                 </div> -->
						<!--                                 <div class="date"> -->
						<!--                                     <span>2020-10-22 00:00:00</span> -->
						<!--                                 </div> -->
						<!--                             </div> -->
						<!--                         </div> -->
						<!--                         for學員 教練同意課程 -->
						<!--                         <div class="mail_area"> -->
						<!--                             <div class="icon" style="background-color: #00BEF1"> -->
						<!--                                 <i class="fas fa-check-circle"></i> -->
						<!--                             </div> -->
						<!--                             <div class="mail_area_box"> -->
						<!--                                 <div class="title"> -->
						<!--                                     <h6>for學員 教練同意課程</h6> -->
						<!--                                 </div> -->
						<!--                                 <div class="notice"> -->
						<!--                                     <p>教練同意課程</p> -->
						<!--                                 </div> -->
						<!--                                 <div class="date"> -->
						<!--                                     <span>2020-10-22 00:00:00</span> -->
						<!--                                 </div> -->
						<!--                             </div> -->
						<!--                         </div> -->
						<!--                         for教練 學員取消課程 -->
						<!--                         <div class="mail_area"> -->
						<!-- 						<div class="icon" style="background-color: #ccc"> -->
						<!-- 							<i class="fas fa-times"></i> -->
						<!-- 						</div> -->
						<!-- 						<div class="mail_area_box"> -->
						<!-- 							<div class="title"> -->
						<!-- 								<h6>for教練 學員取消課程</h6> -->
						<!-- 							</div> -->
						<!-- 							<div class="notice"> -->
						<!-- 								<p>學員取消課程</p> -->
						<!-- 							</div> -->
						<!-- 							<div class="date"> -->
						<!-- 								<span>2020-10-22 00:00:00</span> -->
						<!-- 							</div> -->
						<!-- 						</div> -->
						<!-- 					</div> -->


					</div>
				</div>



			</div>
		</div>
	</div>

	<!-- footer -->
	<jsp:include page="/fragment/footer.jsp" />


	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script>


// .mail_area是整個通知的框框
// .notice是要展開的div
// .dot展開前標題的圓點，展開後要消失,收起來後要出現
// $(function () {
//                 $(".no1").on('click', function (e) {
//                 	  console.log(e.target);
//                     let a = 0;  //設定剛進來收起來的狀態是0
//                     if (a == 0) {
//                         $(".nn1").slideDown("slow", aaaa);
//                         function aaaa(){
//                             // 標題的圓點
//                             $(".dot").css("display", "none");
//                             a = 1;  //設定a=1為展開的狀態
//                         }
//                     }
//                     if(a == 1){
//                         $(".nn1").slideUp("slow", up);
//                         function up(){
//                             $(".dot").css("display", "block");
//                             a = 0;
//                         }
//                         // alert()

//                     }
//                 });

        // $(".top_mail_title").click(function(e){
        //     $(".notice").slideDown("slow",down);
            
        //     e.preventDefault();
        // });
        // function down(e){
        //     $(".dot").css("display", "none");
        //     // e.preventDefault();
        // }
       
        // $(".mail_area_box").click(function(e){
        //     $(".dot").css("display", "block");
        //     $(".notice").slideUp("slow");
        //     e.preventDefault();
        // });


        // //用於切換被選元素的 hide() 與 show() 方法。
        //     $("#toggle").click(function () {
        //         $("p").toggle();
        //     });
        // })




//     });

    function data() {
		return{
			messages:[],
			init(){
				this.getAllMessage();
			},
			getAllMessage(){
				const self = this;
				$.get("/TrainMe/allMessage/" + ${LoginOK.id} +"?type=" + ${LoginOK.type},
		                  function (data) {
		                 	self.messages = data
		                 	 console.log(data);
		                  },
		                  "json"
		        );
			},
			toggle(sid, index){
				var notice = "#msg_" + sid + " .nn1";
				var dot = "#msg_" + sid + " .dot"
// 				console.log("#" + sid + " .nn1");
                   if (!this.messages[index].openStatus) {
                	   
                	   this.messages[index].openStatus = true; 
                	   
                       $(notice).slideDown("slow", open);
                       function open(){
                           // 標題的圓點
                           $(dot).css("display", "none");
                       }
                       
                       if(this.messages[index].is_read){
                    	   return;
                       }
                       
                       const self = this;
                       $.post("/TrainMe/markAsRead/" + ${LoginOK.id}, {msgId : sid, type : ${LoginOK.type}},
                    		   function (data, textStatus, jqXHR) {
                    	   console.log(data);
                    	   console.log($('#unread'));
                    	   
                    	   		$('#unread').html(data);
                    	   		self.messages[index].is_read = 1;  
                    	   
							},
							"json"	
                       );
                    	
                       return;
                       
                   }      
                   if(this.messages[index].openStatus)	{
                       $(notice).slideUp("slow", up);
                       this.messages[index].openStatus = false;
                       function up(){
                           $(dot).css("display", "block");
                       }
                   }
                   
			},
			isTrPass(kind){
				return kind == "trPass";
			},
			isStPass(kind){
				return kind == "stPass";
			},
			isTrBook(kind){
				return kind == "trBook";
			},
			isAllowToSt(kind){
				return kind == "allowToSt";
			},
			isRejectToSt(kind){
				return kind == "rejectToSt";
			},
			isStPrice(kind){
				return kind == "stPrice";
			},
			goTrInfo(){
				window.location.href="<c:url value='/tr_info_account/${LoginOK.id}' />";
			},
			goTrData(){
				window.location.href="<c:url value='/trainerData/${LoginOK.id}' />";
			},
			goStInfo(){
				window.location.href="<c:url value='/student_info_edit/${LoginOK.id}' />";
			},
			goStData(){
				window.location.href="<c:url value='/studentData/${LoginOK.id}' />";
			},
			goTrCourse(){
				window.location.href="<c:url value='/trainerCourse/${LoginOK.id}' />";
			},
			goStCourse(){
				window.location.href="<c:url value='/st_info_lesson/${LoginOK.id}' />";
			},
			goStPrint(){
				window.location.href="<c:url value='/studentMoney/${LoginOK.id}' />";
			}
			
			
			
			
		}
			
	}




    </script>
</body>
</html>