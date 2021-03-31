<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>st_checkout</title>
<style>
.error {
	color: rgb(235, 57, 57);
	font-size: 10px;
}

table, td {
	border: #8B8B8B 1px solid;
}
</style>
</head>
<body>
	<table>

		<tr>
			<th>購買項目</th>
			<th>金額</th>
		</tr>
		<tr>
			<td><span id="feedback"></span></td>
			<td></td>
		</tr>
	</table>
	<form:form method="POST" modelAttribute="cardBean"
		enctype='multipart/form-data' action="/TrainMe/studentMoney/checkout">
		<div>信用卡付款</div>
		<div>
			<label>姓名</label><br>
			<form:input path='name' placeholder="請輸入您的姓名" required="required" />
		</div>

		<div>
			<form:errors path="name" cssClass="error" />
		</div>

		<div>
			<label>信用卡卡號</label><br>
			<form:input path='cardNo1' required="true" maxlength="4" size="4"
				type="text" />
			<form:input path='cardNo2' required="required" maxlength="4" size="4"
				type="text" />
			<form:input path='cardNo3' required="required" maxlength="4" size="4"
				type="text" />
			<form:input path='cardNo4' required="required" maxlength="4" size="4"
				type="text" />
		</div>

		<div>
			<form:errors path="cardNo1" cssClass="error" />
		</div>

		<div>
			<label>有效期限</label><br>
		</div>
		<div>
			<form:select path="expiryMonth">
				<form:option selected="selected" value="-1">--</form:option>

				<c:forEach varStatus="i" begin="1" end="12">
					<form:option value="${i.current}">${i.current}月</form:option>
				</c:forEach>

			</form:select>

			<form:select path='expiryYear'>
				<form:option selected="selected" value="-1">--</form:option>

				<c:forEach varStatus="i" begin="1" end="20">
					<form:option value="${2020+i.current}">${2020+i.current}</form:option>
				</c:forEach>

			</form:select>
		</div>

		<div>
			<form:errors path="expiryMonth" cssClass="error" />
		</div>

		<div>
			<label>背面後三碼</label><br>
			<form:input path='cardCVV' required="required" size="3" maxlength="3" />
		</div>

		<div>
			<form:errors path="cardCVV" cssClass="error" />
		</div>

		<hr>

		<div>持卡人資料</div>
		<div>
			<label>持卡人姓名</label><br>
			<form:input path='cardName' placeholder="請輸入持卡人姓名"
				required="required" />
		</div>

		<div>
			<form:errors path="cardName" cssClass="error" />
		</div>
		<div>
			<label>手機號碼</label><br>
			<form:input path='tel' required="required" />
		</div>

		<div>
			<form:errors path="tel" cssClass="error" />
		</div>

		<div>
			<label>電子信箱</label><br>
			<form:input path='email' required="required" type="email" />
		</div>

		<div>
			<form:errors path="email" cssClass="error" />
		</div>

		<div>
			<label>帳單地址</label><br>
		</div>
		<div>
			<form:select path='city.id'>
				<form:option value="-1" label="選擇縣市" />
				<form:options items="${cityList}" />
			</form:select>

			<form:select path='area.id' placeholder="選擇地區">
				<form:option value="-1" label="選擇縣市" />
				<form:options items="${areaList}" />
			</form:select>
			<form:input path='address' required="required" />
		</div>
		<form:input style="display: none;" path="money" />
		<button type="submit" class="submit-btn register-btn">提交</button>
	</form:form>

	<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
	<script>
		value = localStorage.getItem('name');
		// alert(value);
		document.getElementById("feedback").innerHTML = value;
		// alert(feedback);
		 money = document.getElementById('money');
         money.value = value;
		
		// 縣市列表
		var cityList = document.getElementById('city.id')
		var areaList = document.getElementById('area.id')
	    cityList.addEventListener("change",function (e) {
	    	
			const cityId = e.target.value;
	        var areaList = document.getElementById('area.id');
	        if(areaList.firstChild){
	        	areaList.innerHTML = "";
	        }

	        getAreaList(cityId);
	        
	    })
	    
	// 行政區列表
	    function getAreaList(cityId) {
	        axios.get("/TrainMe/getareaList", {
	    	    params: {
	    	    	cityId: cityId
	    	    }})
		    .then(function (res) {
		        var areas = res.data;
//	 	        console.log(areas);
		        for(area of areas){
//	 	        	  console.log(area);
		            var option = document.createElement("option");
		            option.value = area.id;
		            option.innerHTML = area.name;
		            areaList.appendChild(option);
	      	    }

	   		 })

			

		}
	</script>

</body>
</html>