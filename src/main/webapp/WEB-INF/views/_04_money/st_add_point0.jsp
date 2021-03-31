<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>st_add_point</title>
	<link rel="stylesheet" href="st_add_point.css">
	<link rel="stylesheet" href="../fontawesome-free-5.15.1-web/css/all.css">
	<style>
		.container {
			/* border: 1px solid red; */
			margin-top: 50px;
			margin-left: 10%;
			margin-right: 10%;
			font-size: 30px;
			padding: 10px;
		}
		
		.container p {
			/* border: 1px solid red; */
			font-size: 15px;
			color: #5b5b5b;
		}
		
		.chose {
			/* border: 1px solid red; */
			font-size: 30px;
			text-align: center;
		}
		
		.pic {
			text-align: center;
			margin: 0px auto;
			/* background-color:#FFAFFF; */
			margin: 0 auto;
		}
		
		.pic .DIV1 {
			width: 200px;
			line-height: 50px;
			padding: 20px;
			border: 2px green solid;
			/* margin-right: 100px; */
			margin: 5%;
			float: left;
		}
		
		.pic .DIV2 {
			width: 200px;
			line-height: 50px;
			padding: 20px;
			border: 2px green solid;
			/* margin-right: 100px; */
			margin: 50px;
			float: left;
		}
		
		.ccle {
			margin: 0px auto;
			text-align: center;
		}
		
		.ccle div {
			display: inline-block;
			vertical-align: top;
			width: 300px;
			height: 200px;
			line-height: 75px;
			/* border: 1px solid #FF0000; */
			border-radius: 20px;
			margin: 20px;
			background-color: #cccc;
		}
		
		.text1 {
			font: 25px bold;
			color: rgb(50, 125, 224);
			font-weight: 900;
			margin-top: 0px;
			margin-bottom: 0px;
		}
		
		.text2 {
			color: tomato;
			margin-top: 0px;
			font-weight: 900;
		}
		
		.description {
			/* border: 1px solid red; */
			margin-left: 10%;
			margin-right: 10%;
			font-size: 15px;
			padding: 10px;
			color: #5b5b5b;
		}
	</style>
</head>
<body>
	<div class="container">
		我的點數&nbsp&nbsp>&nbsp&nbsp我要儲值
		<p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Neque
			quis a pariatur libero error? Atque, nulla totam? Ducimus aut itaque
			dolorem unde! Voluptas quos exercitationem provident numquam sapiente
			suscipit accusantium? Maxime aspernatur reiciendis unde voluptatibus
			iusto totam minus beatae aliquam consequuntur doloremque, modi ea
			assumenda porro suscipit saepe veritatis magnam sit optio quis aut
			neque magni deserunt. Rem, obcaecati repudiandae.</p>
		</div>
		<p class="chose">選擇儲值方案</p>
		
		
		<div class="ccle">
			<div onclick="alertCookie(2000)" ><a href="<c:url value='/studentMoney/checkout' />">
				支付2000元<br />
				<p class="text1">儲值2000點</p>
			</div>
			<div onclick="alertCookie(3000)"><a href="<c:url value='/studentMoney/checkout' />">
				支付3000元<br />
				<p class="text1">儲值3000點</p>
				<p class="text2">
					加值30點<i class="fas fa-coins"></i>
				</p>
			</div>
		</div>
		
		<div class="ccle">
			<div onclick="alertCookie(5000)" ><a href="<c:url value='/studentMoney/checkout' />">
				支付5000元<br />
				<p class="text1">儲值5000點</p>
				<p class="text2">
					加值50點<i class="fas fa-coins"></i>
				</p>
			</div>
			<div onclick="alertCookie(7000)"><a href="<c:url value='/studentMoney/checkout' />">
				支付7000元<br />
				<p class="text1">儲值7000點</p>
				<p class="text2">
					加值100點<i class="fas fa-coins"></i>
				</p>
			</div>
			<div onclick="alertCookie(10000)" ><a href="<c:url value='/studentMoney/checkout' />">
				支付10000元<br />
				<p class="text1">
					儲值10000點<br />
					<p class="text2">
						加值200點<i class="fas fa-coins"></i>
					</p>
				</div>
			</div>
			<p class="description">Lorem ipsum dolor sit amet consectetur
				adipisicing elit. Neque quis a pariatur libero error? Atque, nulla
				totam? Ducimus aut itaque dolorem unde! Voluptas quos exercitationem
				provident numquam sapiente suscipit accusantium? Maxime aspernatur
				reiciendis unde voluptatibus iusto totam minus beatae aliquam
				consequuntur doloremque, modi ea assumenda porro suscipit saepe
				veritatis magnam sit optio quis aut neque magni deserunt. Rem,
				obcaecati repudiandae.</p>
				<script>
					localStorage.clear();
					
					function alertCookie(value){
						
						localStorage.setItem('name',value);
						// alert(value)
// 						window.location.assign("/TrainMe/_04_money/st_checkout.jsp")
						
					}
					
				</script>
			</body>
			</html>