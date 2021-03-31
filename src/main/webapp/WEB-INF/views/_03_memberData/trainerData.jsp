
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Train Me 健身教練與學員的最佳媒合平台</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/style.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/style_st_info.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/style_st_account.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/style_nav.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">
<link rel="stylesheet" href="<c:url value='/css/style_footer.css' />">
<%-- <link rel="stylesheet"	href="<c:url value='/css/style_footer.css' />"> --%>
<style>
.container {
	margin-bottom: 100px;
}
.aside ul li:nth-child(5) a{
	color: #21d4a7;
}
.aside ul li:nth-child(5) a:hover{
	color: #fff;
}
</style>
</head>
<body>
	<!-- ============上方導覽列======================================================= -->
	<jsp:include page="/fragment/nav_tr.jsp" />

	<!-- 編輯資料 -->

	<div class="container">
		<!-- ============左側選單======================================================= -->
		<jsp:include page="/fragment/sidebar_tr.jsp" />

		<div class="content">
			<div class="title">
				<h3>帳號設定</h3>
			</div>

			<!-- 說明 -->

			<div class="explain">
				<p>您在 Train Me 服務使用的基本資訊</p>
			</div>
			<div class="setting_area">
				<form:form action="/TrainMe/updateTrData/${trainerBean.id}"
					method="post" modelAttribute="trainerBean"
					enctype="multipart/form-data">
					<div class="setting_box">
						<label>姓名</label>
						<p>${trainerBean.name}</p>
					</div>
					<div class="setting_box">
						<label>Email</label>
						<p>${trainerBean.email}</p>
					</div>
					<div class="setting_box">
						<label>密碼</label><a
							href="<c:url value='/tr_PasswordUpdate/${trainerBean.id}' />">修改密碼</a>
					</div>
					<div class="setting_box">
						<label>生日</label>
						<p>${trainerBean.birthday}</p>
					</div>
					<div class="setting_box">
						<label>健身房</label>
						<p>${gym.getName()}</p>
					</div>
					<div class="setting_box">
						<label>手機</label> <input type="text" required name="phone"
							value="${trainerBean.phone}">
					</div>
					<div class="setting_box">
						<label>顯示暱稱</label> <input type="text" required name="nickname"
							value="${trainerBean.nickname}">
					</div>

					<div class="setting_box address">
						<label>地址</label>
						<form:select path='city.id'>
							<form:option value="-1" label="選擇縣市" />
							<form:options items="${cityList}" />
						</form:select>


						<form:select path='area.id' placeholder="選擇地區">
							<form:option value="-1" label="選擇縣市" />
							<form:options items="${areaList}" />
						</form:select>

						<input type="text" name="address" placeholder="地址"
							value="${trainerBean.address}">
					</div>

					<div class="setting_box">
						<label>銀行帳戶</label> <input type="text" required
							name="bank_account" value="${trainerBean.bank_account}">
					</div>

<!-- 					<div class="setting_box upload_file"> -->
<!-- 						<label>上傳相片</label> -->

<!-- 						<div class="upload_file_area"> -->
<!-- 							<div id="imgbox" class="ufl_box upload_imgbox"> -->

<%-- 								<c:choose> --%>
<%-- 									<c:when test="${empty  trainerBean.profile_image}"> --%>
<!-- 										<img id="photo" name="photo" -->
<%-- 											src="${pageContext.request.contextPath}/images/_03_MemberData/upimage.png"> --%>
<%-- 									</c:when> --%>
<%-- 									<c:otherwise> --%>
<!-- 										<img id="photo" name="photo" -->
<%-- 											src="/upload/${trainerBean.profile_image}"> --%>
<%-- 									</c:otherwise> --%>
<%-- 								</c:choose> --%>


<!-- 							</div> -->
<!-- 							<div class="ufl_box"> -->
<!-- 								<p> -->
<!-- 									從電腦中選取圖檔<br> 最佳大小為 250 x 250 px -->
<!-- 								</p> -->
<!-- 								<button type="button" class="upload_button"> -->
<!-- 									<label> <input type="file" accept="image/*" id="theFile" name="theFile" /> accept : 限制上傳檔案類型 	 -->
<%-- 										<form:input path="trainerImage" type='file' class="theFile" /> --%>
<%-- 										<form:errors path="trainerImage" cssClass="error" /> 上傳檔案 --%>
<!-- 									</label> -->
<!-- 								</button> -->
<!-- 							</div> -->
<!-- 						</div> -->
<!-- 					</div> -->

					<div class="edit_box e_button">
						<button class="save">更新</button>
					</div>
				</form:form>
			</div>


		</div>
	</div>
	
		<!-- footer -->
	<jsp:include page="/fragment/footer.jsp" />
	

	<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>

	<script>

    // 非正方形圖檔置中待解決or是否要有裁切功能
//     function doFirst(){
//     document.getElementById('theFile').onchange = fileChange;
//     }
//     function fileChange(){
//     let file = document.getElementById('theFile').files[0];
//     let readFile = new FileReader();
//     readFile.readAsDataURL(file);
//     readFile.addEventListener('load',function(){
//         let image = document.getElementById('image');
//         let imgbox = document.getElementById('imgbox');
//         image.src = this.result;
//         image.style.maxWidth = '150px';
//         image.style.maxHeight = '150px';

//         imgbox.style.backgroundImage = 'none';
//         });
//     }
//     window.addEventListener('load',doFirst);
    
    console.log(${studentBean.city.id});
// 	getAreaList(${studentBean.city.id});
	
        
	
   
// 縣市列表
	var cityList = document.getElementById('city.id')
	var areaList = document.getElementById('area.id')
    cityList.addEventListener("change",function (e) {
    	
		const cityId = e.target.value;
// 		 console.log(cityId);
        var areaList = document.getElementById('area.id');
        if(areaList.firstChild){
        	areaList.innerHTML = "";
        }

        getAreaList(cityId);
        
    })
    
// 行政區列表
    function getAreaList(cityId) {
// 		 console.log(cityId);
        axios.get("/TrainMe/areaList", {
    	    params: {
    	    	cityId: cityId
    	    }})
	    .then(function (res) {
	        var areas = res.data;
// 	        console.log(areas);
	        for(area of areas){
// 	        	  console.log(area);
	            var option = document.createElement("option");
	            option.value = area.id;
	            option.innerHTML = area.name;
	            areaList.appendChild(option);
      	    }

   		 })

		

	}
    
    
// 照片處理
	
//     const theFile = document.getElementById('trainerImage');


    
//     theFile.addEventListener('change',function () {
//     	console.log('ok');
//         showImg(theFile);
  
//     })

//     function showImg(imgFile) {
//         var file = imgFile.files[0];
       
//             // 建立FileReader物件
//             var fr = new FileReader();
            
//             let photo = document.getElementById('photo');
//             //註冊load事件
//             fr.addEventListener('load', function(e) {
//                  photo.src = e.target.result;                 
//             });
//             //readAsDataURL去讀 file 把檔案轉成 URL
//             fr.readAsDataURL(file);
            
//     }
             
    
</script>
</body>

</html>


