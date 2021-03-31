<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>登入 註冊 pop up</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">
<%--     <link rel="stylesheet" href="${pageContext.request.contextPath}/css/popup_t1.css"> --%>
<%--     <link rel="stylesheet" href="<c:url value='/css/popup_t1.css' />"> --%>

    <!-- 遮罩 -->
    <div id="overlay" class="hide" onclick="Hide();"></div>

    <!-- 彈出框 -->
    <div id="popup_form" class="popup_box hide">

        <div id="sform_tr" class="tr signupform">
            <h2>教練註冊</h2>
            <form:form method="POST" action="/TrainMe/tr_register" calss="from"
			modelAttribute="trainerBean" enctype='multipart/form-data'>
                <div class="wrap">
                    <div class="box">
                        <div class="group">
                            <label >姓名</label><br>
                            <form:input path='name' class="input_field" placeholder="請輸入您的姓名" required="required" />
                        </div>
                        <div class="msgbox">
							<form:errors path="name" cssClass="error" />
                        </div>

                        <div class="group">
                            <label>e-mail</label><br>
                            <form:input path="email" class="input_field" placeholder="請輸入您的e-mail信箱" required="required" />
                        </div>
                        <div class="msgbox">
							<form:errors path="email" cssClass="error" />
                        </div>

                        <div class="group">
                            <label>密碼</label><br>
                            <form:input type="password" path="password" class="input_field pw" placeholder="請輸入您的密碼" required="required" />
                        </div>
                        <div class="msgbox">
							<form:errors path="password" cssClass="error" />
                        </div>
                        <div class="group">
                            <label>確認密碼</label><br>
                            <form:input type="password" path="passwordcheck" class="input_field pw"	placeholder="請再次輸入您的密碼" required="required" />
                        </div>
                        <div class="msgbox">
							<form:errors path="passwordcheck" cssClass="error" />
                        </div>

                        <div class="group">
                            <label>手機</label><br>
                            <form:input path="phone" class="input_field" placeholder="請輸入您的手機" required="required" />
                        </div>
                       <div class="msgbox">
							<form:errors path="phone" cssClass="error" />                
                        </div>

                    </div>
                    <div class="box">
                        <div class="group">                            
                                <label>所屬健身房</label><br>
                                <form:select path="gym.id" class="input_field">
                                    <form:option value="-1" label="請挑選" />
                                    <form:options items="${gymList}" />
                                </form:select>
                        </div>
                        <div class="msgbox">
                            
                        </div>

                        <div class="group">
                            
                                <label>健身房驗證碼</label><br>
                                <form:input path="gympassword" class="input_field" type="number" placeholder="請輸入健身房驗證碼" required="required" />
                        </div>
                        <div class="msgbox">
							<form:errors path="gympassword" cssClass="error" />
                        </div>

                        <div class="group">
                            <label>身分證字號</label><br>
                            <form:input path="id_number" class="input_field"
							placeholder="請輸入您的身分證字號" required="required" />
                        </div>
                        <div class="msgbox">
							<form:errors path="id_number" cssClass="error" />
                        </div>

                        <div class="group">
                            <label>生日</label><br>
                            <form:input path="birthday" type="date"
							class="input_field birthday" required="required" />
                        </div>
                        <div class="msgbox">
							<form:errors path="birthday" cssClass="error" />                            
                        </div>

                        <div class="group">
                            <div class="radio">
                                <label>性別</label><br>
                                <div class="sex">
                                    <form:radiobuttons path="sex" items='${sexMap}' />
                                </div>
                            </div>
                        </div>
                        <div class="msgbox">
                            <form:errors path="sex" cssClass="error" />
                        </div>
                    </div>
                </div>
                <button type="submit" class="btn_login">註冊</button>
                <div class="ask_login">
                    <p>已有帳號？<span class="span-btn" onclick="login()">點我登入</span></p>
                </div>
            </form:form>

        </div>

        <div id="lf" class="loginform">
            <form:form method="POST" action="/TrainMe/login" class="login_area" modelAttribute="loginBean"
			enctype='multipart/form-data'>
                <div class="login_logo">
                    <img
					src="${pageContext.request.contextPath}/images/index/logo_black.png"
					alt="Train Me" title="Train Me">
                </div>

                <h2>歡迎回來!</h2>

                <div class="group">
                    <label>帳號</label><br>
                    <form:input path="userEmail" class="input_field"
					placeholder="E-mail信箱" required="required" />
                </div>
                <div class="group">
                    <label>密碼</label><br>
                    <form:input type="password" path="password" class="input_field pw"
					placeholder="密碼" required="required" />
                </div>
                <div class="check_area">
                    <div class="check">
<!--                         <input type="checkbox" class="check_box"> 記住密碼 -->
                    <a href="<c:url value='/ResetPassword' />">忘記密碼</a>
                    </div>
                </div>
                <div class="msgbox">
                	<form:errors path="userEmail" cssClass="error" />
					<form:errors path="password" cssClass="error" />  
                </div>
                
                <div class="btn_group">
                    <button type="submit" class="btn_login">登入</button>
                </div>
            </form:form>
            <div class="ask_signup">
                <div class="ask_area">
                    <p>還不是會員嗎？</p>
                    <div class="imgbox">
                        <img
                            src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAGQAAABkCAYAAABw4pVUAAAABmJLR0QA/wD/AP+gvaeTAAAE5UlEQVR4nO2dy4scVRTGvxMk48YYxSiCA+4CoiRb8Q9QMcYnEoKr4GPhHyHuE10I4t6VScCVC8VgFm4CLty6GR9jwmTMjM7ERRSdz0VXa6Wmq+q+Tt+T7vODhim6zrnn3O8+q6prAMdxHMdxHMdxHCcKki+Q3CR5neTJ2vEsPSSv8n9+qR3PHQvJ50leI/kryRcz/NxGhp+XmliukTyR6ueOheR6qx43Sa4k+skWhORKE8OUn1L8lOBArYIB7LX+PgLglVqBNGUfqVj+f9QU5GLn+M0qUUx4q3N8oUoUNSF5lOReZ8R5LMFP1pBVKo6FgOTlTkWcTfCRK8i5jouvY30sDCRPdyrjBsm7I30kC0LyYGcyJ8nTcVksECUqJFOQ7AaxcOQOGZmCZA+ZCwczJ9VUQXLLXWhyWmqGID6Z98H9Y3nwTjlDkJ87poszmZNcJXmR5G7z+Yzk0Qj7FU6u1k7ZiLD9oWW3FmgjvH0xcZ0Jl25y81ahCWqr21JJbpNcjfBzoqmkHZKnIuye5eS62DrJZyLsTjWVuEnyuVC7ln2RvIvTtJA+zkf6uksrztJllsy7KE0r62OnWmDKaOUtBQIbnEhFJLsMi2jlXfNqrzMDF8QYLogxZgpCi+vrFtbj6yMpbkaurwdWGhyb+DKSqr7+j807OW5Grq81BOFASwqJb8i+FLF5x9Zr2zBqfR0bWECigy1pLL4x+9h4BuKMynss7pIFRZ0fkOhgSxorb8y+KSO7B8XmHXr+vs3LLGdtuhue2PPHILkL4J6er3cBHBpxcXPE/nEA3wG4v/PdbwCOich6YJwq9WRx2dtXmcC4GCH2H2C/GABwH4BzAf5VsdhDiq/MOgz2IBG5N8TJMvUQbXJ7oCrLKIhpXBBjuCDGcEGM4YIYQ/0edugy1tqdxTksv2fiPcQYLogxXBBjuCDGcEGM4YIYwwUxhvo+xNr+IpSxuLX2Kd5DjFFNEJIbQ/egl5W5P/7fYg3AQ9MDkk/Be2xVQa4AeLJ1/E2tQFrsjZ+iS80W+VXFsvv4vXYANQW5BGCrYvmz+LF2ANUEEZFbAD6pVX4P39YOoPYk+iGAvyrH0Obz2gFUFURE1gB8XDOGFlsAvqwdxCxBbg6cr/EjzvcAXFXwG8tHzTCqRVC9zhLk0oDhF8nh9CAi2wBeB/BPad8RbAB4X7mMtHrl5KUs2zMe0L5B8pEZ50c9BT5Q7tvc/zKYebBH8uXQOFPzZmS9do1XOXn0f6f5fNpnFBvYSLlnSP4ZXJVleDcmxpy8GVGvyaQENuLvCZJX8uo4iD9IvmMl7ykmXxxA8gCApwG8CuBMYmhjPCoiye/n1cgbMCpIy/dhTH5Io8HDIhL81qEuWnnX3hiO8aCibxMvTu5SQhDNfcsDmfaavlXyLiGI5r5FsxXn+p7rfi0Y5qyvx32/UWI51UPyCksz7+weIiLfAziGyfvSd5vPeQDHRST3/3lo9pCsIUsr7yJ3DJufEr9WwlcH05O6Rt7WV1mW5xAVXBBjLLMgmkvqZJZZEJM9xPRjniRvAUj631QB/A3goIiYekjPbA8heQh6YgCTFeZhRf9JmBUE8xlSzA1byy6IuYl92QXxHhKBC2IMF8QYPocYw3uIMTSv9E5xQSLwIcsYPmQZYx6t15wgjuM4juM4juM48+ZfIpziDTRhQqYAAAAASUVORK5CYII=">
                    </div>
                    <div class="btn_group">
                        <button type="button" class="btn_login ask_btn" id="registerbtn" onclick="register_st()">註冊學員</button>
                    </div>
                    <p><br><br>您是已有健身房驗證碼的教練嗎？</p>
                    <div class="imgbox">
                        <img
                            src="data:image/png;base64,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">
                    </div>
                    <div class="btn_group">
                        <button type="button" class="btn_login ask_btn" id="registerbtn" onclick="register_tr()">註冊教練</button>
                    </div>
                </div>
            </div>
        </div>

        <div id="sform_st" class="st signupform">
            <h2>學員註冊</h2>
            <form:form method="POST" class="form" action="/TrainMe/st_register"
			modelAttribute="studentBean" enctype='multipart/form-data'>
                <div class="wrap">

                    <div class="box">
                        <div class="group">
                            <label id="fillIn">姓名</label><br>
                            <form:input path="name" class="input_field stName" placeholder="請輸入您的姓名"
							required="required" value="" />
                        </div>
                        <div class="msgbox">
							<form:errors path="name" cssClass="error" />
                        </div>
                        <div class="group">
                            <label>e-mail</label><br>
                            <form:input path="email" class="input_field stEmail"
							placeholder="請輸入您的e-mail信箱" required="required" />                           
                        </div>
                        <div class="msgbox">
                            <form:errors path="email" cssClass="error" />
                        </div>
                        <div class="group">
                            <label>密碼</label><br>
                            <form:input path="password" class="input_field pw stPw" type="password"
							placeholder="請輸入您的密碼" required="required" />
                        </div>
                        <div class="msgbox">
							<form:errors path="password" cssClass="error" />
                        </div>
                        <div class="group">
                            <label>確認密碼</label><br>
                            <form:input path="passwordcheck" class="input_field pw stPwCheck" type="password"
							placeholder="請再次輸入您的密碼" required="required" />
                        </div>
                        <div class="msgbox">
							<form:errors path="passwordcheck" cssClass="error" />
                        </div>
                    </div>
                    <div class="box">
                        <div class="group">
                            <label>手機</label><br>
                            <form:input path="phone" class="input_field stPhone" placeholder="請輸入您的手機"
							required="required" />
                        </div>
                        <div class="msgbox">
							<form:errors path="phone" cssClass="error" />
                        </div>
                        <div class="group">
                            <label>身分證字號</label><br>
                            <form:input path="id_number" class="input_field stIdNumber"
							placeholder="請輸入您的身分證字號" required="required" />
                        </div>
                        <div class="msgbox">
							<form:errors path="id_number" cssClass="error" />
                        </div>
                        <div class="group">
                            <label>生日</label><br>
                            <form:input path="birthday" type="date"
							class="input_field birthday stBir" required="required" />
                        </div>
                        <div class="msgbox">
							<form:errors path="birthday" cssClass="error" />
                        </div>
                        <div class="group">
                            <div class="radio">
                                <label>性別</label><br>
                                <div class="sex">
                                    <form:radiobuttons path="sex" items='${sexMap}' />
                                </div>
                            </div>
                        </div>
                        <div class="msgbox">
								<form:errors path="sex" cssClass="error" />
                        </div>
                    </div>
                </div>
                <button type="submit" class="btn_login">註冊</button>
                <div class="ask_login">
                    <p>已有帳號？<span class="span-btn" onclick="login()">點我登入</span></p>
                </div>
            </form:form>

        </div>



    </div>


<!--     <script src="../js/jquery-3.5.1.js"></script> -->
<script>
	

	// 顯示登入框
	function Show() {
		document.getElementById('popup_form').classList.remove('hide');
		document.getElementById('overlay').classList.remove('hide');
		$("#popup_form").css("display", "block");
		document.documentElement.style.overflow = 'hidden';//電腦端禁止滑動
		document.body.style.overflow = 'hidden';//手機端禁止滑動
		login()
	}
	// 隱藏登入框
	function Hide() {
		document.getElementById('popup_form').classList.add('hide');
		document.getElementById('overlay').classList.add('hide');
		$("#popup_form").css("display", "none");
		document.documentElement.style.overflow = 'auto';//電腦端可以滑動
		document.body.style.overflow = 'auto';//手機端可以滑動
	}

	var a = document.getElementById('popup_form');
	var x = document.getElementById("lf");
	var y = document.getElementById("sform_st");
	var z = document.getElementById("sform_tr");

	// 顯示登入框
	function register_st() {
		x.style.left = "-800px";
		y.style.left = "0px";
		z.style.left = "-800px";
	}

	// 註冊教練
	function register_tr() {
		x.style.left = "800px";
		y.style.left = "800px";
		z.style.left = "0px";
		a.style.height = "560px";

		// 外框與註冊教練頁的滑動速度
		document.getElementById("popup_form").classList.add('transition');
		document.getElementById("sform_tr").classList.add('transition');
	}

	// 回到登入
	function login() {
		x.style.left = "0px";
		y.style.left = "800px";
		z.style.left = "-800px";
		a.style.height = "500px";
		document.getElementById("popup_form").classList.remove('transition');
	}
	
	//清空密碼攔位
	function resetPassword() {
		var pwInputs = document.getElementsByClassName('pw');
		for(const pwInput of pwInputs){
			pwInput.value = "";
		}	
	}

	resetPassword();
	
	var fillIn =  document.getElementById('fillIn');
	fillIn.addEventListener("click",function(){
	       document.getElementsByClassName('stName')[0].value='李小明';
	       document.getElementsByClassName('stEmail')[0].value='anakzayyy@gmail.com';
	       document.getElementsByClassName('stPw')[0].value='a12345';
	       document.getElementsByClassName('stPwCheck')[0].value='a12345';
	       document.getElementsByClassName('stPhone')[0].value='0986465432';
	       document.getElementsByClassName('stIdNumber')[0].value='E224884358';
	       document.getElementsByClassName('stBir')[0].value='1993-09-03';
	});
	
	
</script>
