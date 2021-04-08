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
<link rel="stylesheet" href="<c:url value='/css/style_nav.css' />">
<link rel="stylesheet" href="<c:url value='/css/style_footer.css' />">
<link rel="stylesheet"
 href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">
<style>
</style>

</head>
<body>

    <!-- 分類 -->
    <div class="">
        <a href="#">全部文章</a>
        <a href="#">公告</a>
        <a href="#">教練推薦</a>
        <a href="#">健身心得</a>
        <a href="#">問題</a>
        <a href="#">其他</a>
    </div>

    <button  onclick="location.href='/TrainMe/forumAll/newArticle' ">發表文章</button>
    
<%--     <a href="<c:url value='/tr_PasswordUpdate/${trainerBean.id}' />">修改密碼</a> --%>



    <!-- 文章顯示區 -->
    <div class="">


        <!-- 列表title -->
        <table class="table">
            <thead class="thead-dark">
              <tr>
                <th>分類</th>
                <th>主題</th>
                <th>作者</th>
                <th>發表時間</th>
                <th>最後回覆時間</th>
                <th>回應</th>
              </tr>
            </thead>
            <tbody>
              <tr>
                <th>公告</th>
                <td>推薦ooo教練</td>
                <td>Mary</td>
                <td>2020/04/05</td>
                <td>2020/05/11</td>
                <td>2</td>
              </tr>
            
            </tbody>
          </table>
          
    

    </div>

</body>
</html>