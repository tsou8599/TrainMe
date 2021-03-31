<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Train Me 健身教練與學員的最佳媒合平台</title>
<link rel="stylesheet" href="<c:url value='/css/style.css' />">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css"
	integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l"
	crossorigin="anonymous" />
<link rel="stylesheet" href="<c:url value='/css/style_nav.css' />">
<link rel="stylesheet" href="<c:url value='/css/style_st_info.css' />">
<link rel="stylesheet" href="<c:url value='/css/style_feedback.css' />">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<style>
.aside ul li:nth-child(3) a{
	color: #21d4a7;
}
.aside ul li:nth-child(3) a:hover{
	color: #fff;
}
</style>
</head>
<body>

	<!-- ============上方導覽列======================================================= -->
	<jsp:include page="/fragment/nav_st.jsp" />



	<div class="container">
	
		<!-- ============左側選單======================================================= -->
		<jsp:include page="/fragment/sidebar_st.jsp" />

		<!-- ============右側網頁======================================================= -->


		<!-- ============給評價======================================================= -->
		
        <div class="content">
            <div class="back">
                <a href="<c:url value='/st_info_lesson/${LoginOK.id}' />"><i class="fas fa-chevron-left"></i>　返回我的課程</a>
              </div>
            <div class="title"><h3 id="fillIn">我的課程 > 給予評價</h3></div>
              

                <div class="edit_area feedback_ar">
                        <div class="feedback_title">
                            <div class="wrap">
                                <div class="edit_box">
                                    <label>授課教練：</label>
                                    <span>${studentCourseBean_H.getTrainerCourseBean_H().getTrainerBean_H().getName()}</span>
                                </div>
                                <div class="edit_box">
                                    <label>課程名稱：</label>
                                    <span>${studentCourseBean_H.getTrainerCourseBean_H().getSkillBean_H().getName()}</span>
                                </div>
                            </div>
                            <div class="wrap">
                                <div class="edit_box">
                                    <label>上課日期：</label>
                                    <span>${studentCourseBean_H.getDate()}</span>
                                </div>
                                <div class="edit_box">
                                    <label>整體評分：</label>
                                    <div class="starss" id="starss">
                                        <img value="1" src="../images/star2.png">
                                        <img value="2" src="../images/star2.png">
                                        <img value="3" src="../images/star2.png">
                                        <img value="4" src="../images/star2.png">
                                        <img value="5" src="../images/star2.png">
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="explain">
                            <span>分享您對本次的教練/課程心得，給予其他學員參考！</span>
                        </div>


                        <div class="feedback_content">
                            <textarea name="feedback_content" id="feedbackContent" cols="70" rows="10"></textarea>
                        </div>

                        <div class="edit_box e_button">
                            <span>還可輸入150個字</span>
        
                            <button class="save" id="saveBtn" >送出評價</button>
                        </div>
                    </div>
             </div>
        </div>
    


<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>



//找到輸入的評價
let feedback_content = document.getElementById("feedbackContent");

    // 點擊星星評分
    let val = "";
    $("#starss img").click(function() {
        var path = "../images/",
            star_img = path + "star1.png",//亮的星
            nostar_img = path + "star2.png";//灰色的星
        $(this).attr('src',star_img);//點擊的哪個星星就設置哪個星星的src為亮的星
        $(this).prevAll().attr('src',star_img);//獲取到你點擊的星的前面所有星星並替換為亮的星
        $(this).nextAll().attr('src',nostar_img);//獲取到你點擊的星的後面所有星星並替換為灰色的星
        val = $(this).attr('value');//獲取到你點擊的星的value值，這就代表幾星，拿到這個值你就可以通過ajax傳給後端實現交互
        console.log(val);
   
    })

   



    //確認按鈕

    document.getElementById("saveBtn").addEventListener("click",function(){
//       swal({
//         title: "確定送出評價嗎?",
//         icon: "info",
//         buttons: true,
//         dangerMode: false     
//       }).then((willDelete) => {
//     	  if (willDelete) {
		  
		  		$.post("/TrainMe/addfeedback/"+ ${LoginOK.id},
		  				{  starsVal: val , feedback: feedback_content.value , studentCourseId: ${studentCourseBean_H.getId()}},
						 function () {
		  					window.location.href="<c:url value='/st_info_lesson/${LoginOK.id}' />";
// 		  					console.log('okkkkkkk');
						 }
		  		);		
		  
// 		  } else {
// 		    swal("Your imaginary file is safe!");
// 		  }
// 		});
 			
  
});
    
    
    var fillIn = document.getElementById('fillIn')
	fillIn.addEventListener("click",function(){
		document.getElementById('feedbackContent').value = "很幸運昨天接觸到薇均教練"
		+ "教練總是很有耐心的教器材如何正確且安全的使用，"
		+ "耐心解說每個動作甚至分解動作一步一步帶著我做，"
		+ "時時確認訓練時的感受度，還會錄影做紀錄，"
		+ "下次忘記還可以喚起記憶，"
		+ "教練也總是在快撐不下去的時候鼓勵我，"
		+ "就會覺得自己好像沒那麼糟，我一定可以的！"
		+ "循序漸進的上課節奏，讓人願意持續踏進健身房，"
		+ "除了運動，也關心著飲食並給予建議，"
		+ "因為每天記錄飲食所以吃東西都會更加留心，"
		+ "教練用調整來改變我的飲食習慣，"
		+ "而不是給壓力逼迫改變，"
		+ "薇均教練教學認真且非常有耐心，"
		+ "讓新手學員很安心，"
		+ "五星教練，推推!!";
			


	});
      
      
      
      
      
      
 
    
</script>

</body>
</html>