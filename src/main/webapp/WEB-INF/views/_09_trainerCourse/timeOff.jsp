<!DOCTYPE html>
<html lang="en">
<head>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>管理預約時段-Train Me 健身教練與學員的最佳媒合平台</title>
<link rel="stylesheet" href="<c:url value='/css/style.css' />">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css"
	integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l"
	crossorigin="anonymous" />
<link rel="stylesheet" href="<c:url value='/css/style_st_info.css' />">
<link rel="stylesheet"
	href="<c:url value='/css/style_st_account.css' />">
<link rel="stylesheet" href="<c:url value='/css/style_timeset.css' />">
<link rel="stylesheet" href="<c:url value='/css/style_nav.css' />">
<link rel="stylesheet" href="<c:url value='/css/style_footer.css' />">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">

<!-- 暫時代替側邊選單點擊變色的功能的CSS -->
<style>
.container {
	margin-bottom: 100px;
}

.aside ul li:nth-child(3) a {
	color: #21d4a7;
}

.aside ul li:nth-child(3) a:hover {
	color: #fff;
}

.short_nb {
	width: 90px;
}

.lesson_name {
	width: 300px;
}

.tschedule td {
	cursor: pointer;
}

.tschedule .closed {
	background: #eee;
	color: #999;
}

.tschedule .booked {
	background: pink;
	cursor: not-allowed;
	color: white;
}
</style>
<!-- <script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script> -->

<script
	src="https://cdn.jsdelivr.net/gh/alpinejs/alpine@v2.3.5/dist/alpine.min.js"
	defer></script>
<script src="https://unpkg.com/dayjs@1.8.21/dayjs.min.js"></script>
</head>
<body>

	<jsp:include page="/fragment/nav_tr.jsp" />



	<div class="container">

		<jsp:include page="/fragment/sidebar_tr.jsp" />



		<div class="content" x-data="data()" x-init="init()">
			<div class="back">
				<a href="<c:url value='/trainerCourse/${LoginOK.id}' />"><i
					class="fas fa-chevron-left"></i> 返回課程管理</a>
			</div>
			<div class="title">
				<h3>課程管理 > 管理預約時段</h3>
			</div>

			<div id="datebox" class="datebox">
				<p>請在此設定您不開放預約的時段。</p>

				<div>
					<label>選擇起始日期：</label> <input type="date" id="date_begin"
						name="date_begin" class="input_date" x-model="beginDate"
						@change="updateBeginDate()" />
				</div>
			</div>



			<!-- ============預約時間設定======================================================= -->

			<div class="info_wrap t lesson">

				<div class="sc">
					<!-- 一進來就會顯示當天起始那一周的時間表 -->
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
						<tbody>
							<template x-for="hour in hours" :key="hour">
								<tr>
									<th scope="row" x-text="hour + ':00 - '+ (hour+1) + ':00'"></th>
									<template x-for="date in dates" :key="date + hour">
										<td
											:class="{
						                        closed :isClosed(date,hour),
						                        booked :isBooked(date,hour)
						                    }"
											@click="closeToggle(date,hour)">
											<template x-if="isBooked(date, hour)">
												<div>已預約</div>
											</template>
											<template x-if="isClosed(date, hour)">
												<div>已關閉</div>
											</template>
										</td>
									</template>
								</tr>
							</template>

						</tbody>
					</table>

					<div class="e_button trls_t_btn">
						<button class="save" @click="save">儲存設定</button>
					</div>
				</div>

			</div>
		</div>

	</div>
	<!-- footer -->
	<jsp:include page="/fragment/footer.jsp" />

</body>

<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns"
	crossorigin="anonymous"></script>
<script>
  let today = dayjs().add(1,'day').format('YYYY-MM-DD');
  let dateEndStr = dayjs(today).add(7,'day').format('YYYY-MM-DD');
//   console.log(dateEnd);

  function data() {
    return {
      beginDate : today,
      dateEnd1 : dateEndStr,
      dates:[],
      hours : [8,9,10,11,12,13,14,15,16,17,18,19,20,21],
      closed : [],
      booked : [],
      init(){
        this.updateBeginDate();
        this.getBookedHours();
        this. getClosedHours();
      },
      getBookedHours(){

    	  const self = this;
    	  $.get("/TrainMe/TimeOff/getBooked/" + ${LoginOK.id},
                  function (data) {
                	self.booked = data;
//                 	 console.log(booked);
                  },
                  "json"
        );
    	  

      },
      getClosedHours(){
// 		var dateEnd = dayjs(this.beginDate).add(7,'day');
// 		dateEndStr = this.dateEnd.format('YYYY-MM-DD')
		const data = {dateBegin:this.beginDate , dateEnd: this.dateEnd1 }
		const self = this;
    	$.get("/TrainMe/TimeOff/getClosed/" + ${LoginOK.id}, data,
                  function (data) {
                	self.closed = data;
                	 console.log(closed);
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
          let date = dayjs(beginDate).add(i,'day');
          result.push(date);
        }
        // console.log(result);
        return result;
      },
      parseDayOfWeek(day){
        let week = ['(日)','(一)','(二)','(三)','(四)','(五)','(六)']
        return week[day];
      },
      toDateHourStr(date, hour){
        const dateStr = date.format('YYYY-MM-DD');
        return dateStr + "_" + hour;;
      },
      closeToggle(date,hour){
        if(this.isBooked(date,hour)){
          return;
        }
        // const dateStr = date.format('YYYY-MM-DD');
        // const dateHourStr = `${dateStr}_${hour}`;
        const dateHourStr = this.toDateHourStr(date, hour);
        const index = this.closed.indexOf(dateHourStr);
        if(index > -1){
          this.closed.splice(index, 1);
        }else {
          this.closed.push(dateHourStr);
        }
        console.log(this.closed);
      },
      isBooked(date,hour){
        // const dateStr = date.format('YYYY-MM-DD');
        // const dateHourStr = `${dateStr}_${hour}`;
        const dateHourStr = this.toDateHourStr(date, hour);
        return this.booked.includes(dateHourStr);
      },
      isClosed(date,hour){
        // const dateStr = date.format('YYYY-MM-DD');
        // const dateHourStr = `${dateStr}_${hour}`;
        const dateHourStr = this.toDateHourStr(date, hour);
        return this.closed.includes(dateHourStr);
      },
      save(){  // 先刪除時間內的所有資料，再存新資料
    	  const self = this;
    	  const hourData = this.closed.map(hour => hour); //解開包住物件得
    	  const payload = {
          closeHour: hourData,
          dateBegin: self.beginDate,
          dateEnd: self.dateEnd1,
      	  };
    	  
        $.post("/TrainMe/TimeOff/update/"+ ${LoginOK.id}, {data:JSON.stringify(payload)},
          function (data, textStatus, jqXHR) {
        	 console.log(data);
        	alert("儲存成功")
          },
          "json"
        );
      }
      


    }
  }

  


</script>
</html>