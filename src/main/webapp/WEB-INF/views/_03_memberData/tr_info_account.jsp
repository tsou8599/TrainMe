
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
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css"
	integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l"
	crossorigin="anonymous" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/style_st_info.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/style_st_account.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/style_nav.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/style_tr_info.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">
<link rel="stylesheet" href="./css/style_st_lesson.css">
<link rel="stylesheet"	href="<c:url value='/css/style_footer.css' />">
<style>
.container {
	margin-bottom: 100px;
}
.aside ul li:nth-child(1) a{
	color: #21d4a7;
}
.aside ul li:nth-child(1) a:hover{
	color: #fff;
}
</style>
<script src="${pageContext.request.contextPath}/js/jquery-3.5.1.js"></script>
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
				<h3>個人資料</h3>
			</div>

			<!-- 說明 -->

			<div class="explain ex_a">
				<p>您在 Train Me 服務使用的基本資訊，這些內容將顯示在您的教練頁面。</p><a href="<c:url value='/trainer_info/${LoginOK.id}?type=trainer' />"><i class="fas fa-search"></i>查看我的教練頁面</a>
			</div>
			<div class="setting_area">
				<form:form action="/TrainMe/updateTrInfoAccount/${trainerBean.id}"
					method="post" modelAttribute="trainerBean"
					enctype="multipart/form-data">

					<div class="setting_box" value="2000" id="abc">
						<label>姓名</label>
						<p>${trainerBean.name}</p>
					</div>
					<div class="setting_box">
						<label>授課區域</label>
						<p>${gym.getName()}</p>
					</div>
					<div class="setting_box">
						<label>年資</label> <input type="number" min="0" name="year"
							placeholder="請填整數" class="short_nb" required
							value="${trainerBean.year}" /> 年
					</div>

					<div class="setting_box">
						<label for="name">教練頁面標題</label> <input class="trpage_title"
							type="text" name="course" placeholder="請輸入您想顯示在教練頁面的標題名稱，限20字以內"
							required value="${trainerBean.course}" id="course"
							oninput="checkCourse();" />
					</div>

					<!-- 證照 -->
					<div class="setting_box ls">
						<label for="name">新增證照</label>
						<!-- <br> -->
						<p class="label_set" id="License">證照名稱：</p>
						<input type="text" id="lsname" name="" placeholder="請輸入您所擁有的證照名稱" />

						<button type="button" class="btn btn-dark n_btn add_btn"
							onclick="addtr()">新增</button>


						<div class="tab-content mt-3" id="pills-tabContent">
							<!-- 證照表格 -->
							<div class="tab-pane fade show active" id="pills-wait"
								role="tabpanel" aria-labelledby="pills-wait-tab">

								<!-- ===================  bordered  改成 table-bordered =====================================-->
								<table id="table" class="table table-bordered">
									<thead class="thead-light">
										<tr>
											<th scope="col" class="trif_f">擁有證照</th>
											<th scope="col">編輯</th>
										</tr>
									</thead>
									<tbody class="tr_license">


										<c:if test="${trainerLicenseBean.size() > 0}">
											<c:forEach varStatus="i" begin="0"
												end="${trainerLicenseBean.size()-1}">
												<tr id="tr_lc">
													<td class="trif_f">
														${trainerLicenseBean.get(i.current).getName()}</td>
													<td><a
														href="<c:url value='/delLicense/${trainerBean.id}/${trainerLicenseBean.get(i.current).getId()}' />"
														class="del_btn">刪除</a></td>
												</tr>

											</c:forEach>
										</c:if>

										<!-- <td class="trif_f">AASFP 亞洲運動及體適能專業學院高級私人體適能教練</td>
                                                <td><a href="#">編輯</a>　<a href="javascript:" onclick="deletetr()">刪除</a></td> -->
									</tbody>
								</table>
							</div>
						</div>
					</div>

					<div class="setting_box upload_file">
						<label for="name">自我介紹:</label>
						<textarea name="introduction" id="text" cols="60" rows="15"
							maxlength="1000" placeholder="限1000字以內">${trainerBean.introduction}</textarea>
						<p id="feedback"></p>
					</div>


					<div class="setting_box upload_file">
						<label>上傳相片</label>

						<div class="upload_file_area">
							<div id="imgbox" class="ufl_box upload_imgbox">

								<c:choose>
									<c:when test="${empty  trainerBean.profile_image}">
										<img id="photo" name="photo"
											src="${pageContext.request.contextPath}/images/_03_MemberData/member.jpg">
									</c:when>
									<c:otherwise>
										<img id="photo" name="photo"
											src="/upload/${trainerBean.profile_image}">
									</c:otherwise>
								</c:choose>


							</div>
							<div class="ufl_box">
								<p>
									從電腦中選取圖檔<br> 最佳大小為 250 x 250 px
								</p>
								<button type="button" class="upload_button">
									<label> <!-- 									<input type="file" accept="image/*" class="theFile" name="theFile" />  -->
										<form:input path="trainerImage" type='file' class="theFile" />
										<form:errors path="trainerImage" cssClass="error" /> 上傳檔案
									</label>
								</button>
							</div>
						</div>
					</div>

					<div class="setting_box upload_file">
						<label>上傳影片</label>
						<div class="upload_file_area">
							<div>
								<c:choose>
									<c:when test="${empty  trainerBean.profile_video}">
										<video id="video" class="upload_videobox" controls></video>
									</c:when>
									<c:otherwise>
										<video id="video" class="upload_videobox" controls>
											<source src="/upload/${trainerBean.profile_video}"
												type="video/mp4" id="video_del">
										</video>
									</c:otherwise>
								</c:choose>
							</div>
							<div class="ufl_box">
								<p>
									從電腦中選取影片檔 <br> 上傳檔案限mp4格式 <br> ，6MB以內
								</p>
								<button type="button" class="upload_button">
									<label> <form:input path="trainerVideo" type="file"
											accept="video/*" class="theFile" /> <form:errors
											path="trainerVideo" cssClass="error" /> 上傳檔案
									</label>
								</button>
								<br>
								<p id="file_error_video"></p>
							</div>
						</div>
					</div>


					<div class="edit_box e_button">
						<button class="save">更新</button>
					</div>
				</form:form>
			</div>


		</div>
	</div>
		<!-- footer -->
	<jsp:include page="/fragment/footer.jsp" />
	
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script>
	
		/*
		 var tab=document.getElementById('tab') //獲取表格元素
		 var rows=tab.rows; //返回包含表格中所有行的一個數組。
		 cells=rows[1].cells //某一行的單元格
		 alert(rows[1].cells[2].innerHTML)
		 rows[1].cells[2].innerHTML='資料13';
		 rows[1].cells[2].style.color='red'
		 */

	// 編輯證照
		//新增
		function addtr() {
			var lsname = document.getElementById('lsname').value;
			var value = document.getElementById('lsname').value.trim();
		if(value != ""){
			$.post("/TrainMe/addLicense", 
					{  lsname: lsname, 
					   trainerBeanId: ${trainerBean.id}
					} ,
					 function () {
					      window.location.assign(window.location.href)  
					 }
			);	
		}else{
			$('#lsname').css('border-color','#f50000');
		}
		}
		//刪除
		$('.del_btn').on('click', function(event) {
    var yes = confirm('確定刪除？');
    if (!yes) {
     event.preventDefault()
    }
   })

		// 教練課程標題
		function checkCourse() {
		var course_input = document.querySelector("#course");
	
	if (course_input.value.length > 50) {
		course_input.setCustomValidity("超過50字了");
	} else {
		course_input.setCustomValidity(""); // be sure to leave this empty!
	}
}

		// 自我介紹       
		$(document).ready(function() {
							var x = ($("#text").val().replace(/\s*/g,"")).length;					
							if(x == 0){
								var textMax = 500;
							}else{
								var textMax = 500 - ($("#text").val().replace(/\s*/g,"")).length;
							};
							$('#feedback').html(`尚可輸入<span style="color:red;">${'${'}textMax}</span> 個字 `);
							$('#text').on('input propertychange',typeChange)

							function typeChange(){	
								let textMax = 500;	
								let textLength = $('#text').val().replace(/\s*/g,"").length;
								total = textMax - textLength;
								$('#feedback').html(`尚可輸入<span style="color:red;">${'${'}total}</span> 個字 `);
							};
						
						});
		
		// 將換行、空白符號轉換成<br>，存入資料庫
		var content = $("#text").val();
		content = content.replace(/\n|\r\n/g, "<br>");
// 		console.log(content);
		
		
		// 上傳
		// 照片處理
		const theFile = document.getElementById('trainerImage');

		theFile.addEventListener('change', function() {
			console.log('ok');
			showImg(theFile);

		})

		function showImg(imgFile) {
			var file = imgFile.files[0];

			// 建立FileReader物件
			var fr = new FileReader();

			let photo = document.getElementById('photo');
			//註冊load事件
			fr.addEventListener('load', function(e) {
				photo.src = e.target.result;
			});
			//readAsDataURL去讀 file 把檔案轉成 URL
			fr.readAsDataURL(file);

		}
		// 影片處理
		const input = document.getElementById('trainerVideo');
		const video = document.getElementById('video');
		const videoSource = document.createElement('source');
		input.addEventListener('change', function() {
			del();
			$("#file_error_video").html("");
			var file_size_video = $('#trainerVideo')[0].files[0].size;
			const files = this.files || [];
			if (file_size_video > 70971520) {
				$("#file_error_video").html("檔案大小請勿超過 70MB");
				return false;
			} else {
				if (!files.length)
					return;

				const reader = new FileReader();

				reader.onload = function(e) {
					videoSource.setAttribute('src', e.target.result);
					video.appendChild(videoSource);
					video.load();
					video.play();
				};

				reader.onprogress = function(e) {
					console.log('progress: ', Math.round((e.loaded * 100)
							/ e.total));
				};

				reader.readAsDataURL(files[0]);
			}
		});
		function del() {
		}
		if (video.hasChildNodes()) {
			while (video.childNodes.length >= 1) {
				video.removeChild(video.firstChild);
			}
		}
		
		$('#License').click(function(){
			$('#lsname').val('國際B級健身教練證')
		})
	</script>
</body>
</html>
