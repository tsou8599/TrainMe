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
<link rel="stylesheet" href="<c:url value='/css/style_favorite.css' />">
<link rel="stylesheet" href="<c:url value='/css/style_footer.css' />">
<link rel="stylesheet"
 href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">
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
    padding-bottom: 80px;
}
.footer {
    height: 50px;
    line-height: 50px;
    background: rgb(15, 112, 202);
    margin-top: -50px;
}
/* .container{ */
/* 	margin-bottom:200px; */
/* } */
.aside ul li:nth-child(5) a{
 color: #21d4a7;
}
.aside ul li:nth-child(5) a:hover{
 color: #fff;
}
</style>

<script
 src="https://cdn.jsdelivr.net/gh/alpinejs/alpine@v2.3.5/dist/alpine.min.js"
 defer></script>
</head>
<body>
 <!-- ============上方導覽列======================================================= -->
 <jsp:include page="/fragment/nav_st.jsp" />



 <div class="container">

  <!-- ============左側選單======================================================= -->
  <jsp:include page="/fragment/sidebar_st.jsp" />

  <!-- ============右側網頁======================================================= -->



  <div class="main">

   <!-- ============個人資料======================================================= -->
   <div class="content">
    <div class="title">
     <h3>收藏教練</h3>
    </div>
    <!-- 說明 -->

    <div class="explain explain_s">
     <label>排序依據：</label> <a href="#">加入順序優先</a> <a href="#">評價數量優先</a>
     <a href="#">高評價優先</a>
    </div>

    <div class="favorite" x-data="data()" x-init="init()">

     <template x-for="trainerX in trainers" :key="trainerX.id">

      <!-- 每個教練框 -->
     <div class="trainer">
        <div class="bgcolor">
      <a href="javascript:;" @click="goLook(trainerX.trId)"> <!-- 超連結至教練個人頁面的a -->
         <span class="love" @click="toggle(trainerX.trId)"><i :id="'tr_' + trainerX.trId" class="fas fa-heart like change_color" ></i></span>

         <template x-if="!trainerX.profile_image">
          <div class="tr_picture">
           <img
            src="<c:url value="/images/_03_MemberData/member.jpg" />">
          </div>
         </template>

         <template x-if="trainerX.profile_image">
          <div class="tr_picture" x-html="image(trainerX.profile_image)" >
          </div>
          
         </template>


         <h6 x-text="trainerX.name"></h6>
        </div>
        <div class="trainer_wrap">
         <div class="twbox">

          <div class="tw">
           <label>教練評價</label>
           <div class="rating">
            <template x-if="trainerX.ratings == 0">
             <span>尚無評價</span>
            </template>
            <template x-if="trainerX.ratings != 0">
             <!--  =========================== 不知道為何會找不到，可是顯示正常 ================================= -->
             <span class="star">★</span>
             <span x-text="trainerX.ratings"></span>
            </template>
           </div>
          </div>
          <div class="tw">
           <label>課程價格</label> <span x-text="trainerX.price+'  up'"></span>
          </div>
          <div class="tw">
           <label>授課地點</label> <span
            x-text="trainerX.city + trainerX.area"></span>
          </div>
          <div class="tw">
           <label>健身房</label> <span x-text="trainerX.gym"></span>
          </div>
          
         </div>
        </div>
       </div>
      </a>
     </template>
    </div>



   </div>
  </div>
 </div>

<!-- footer -->
	<jsp:include page="/fragment/footer.jsp" />

 <script
  src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
 <script>

 //點擊收藏愛心切換顏色
//  $(document).ready(function() {
//    $('#heart').click(function() {
//      $('.like').toggleClass('change_color');
//    })
//  })
 
 function data() {
  return{
   trainers : [],
   init(){
    const self = this;
    
    $.get("/TrainMe/allFavorite/" + ${LoginOK.id} ,
                    function (data) {
                    self.trainers = data
                     console.log(data);
                    },
                    "json"
          );
    
    
   },
   parseStr(skillTypes){
	   
    var str = ""
    for(skillType of skillTypes){
     
     str += skillType +"、";
    }
    return str.substring(0, str.length-1)
   },
   image(profile_image){
    var url = '<img src="/upload/' + profile_image +'">';
//     console.log(url);
    return url;
   },
   toggle(trId){
//     console.log(trId);
//     console.log($('#tr_' + trId).hasClass('change_color'));
    
    if($('#tr_' + trId).hasClass('change_color')){
     
//       console.log("okkkk");
     $.post("/TrainMe/deleteFavorite/" + ${LoginOK.id} , {tr_id : trId});
     
    }else{
//      console.log("nooo");
     $.post("/TrainMe/addFavorite/" + ${LoginOK.id}, {tr_id : trId});
     
    }
     $('#tr_'+ trId).toggleClass('change_color');
//      阻止冒泡事件
      event.stopPropagation();
      return false;
   },
   goLook(trId){
    window.location.href="<c:url value='/trainer_info/" + trId + "?type=favorite&stId=${LoginOK.id}' />";
     
   }
   
   
   
   
   
   
   
  }
 }


</script>
</body>
</html>