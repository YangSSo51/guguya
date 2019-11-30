<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.carousel-control-next-icon {
    background-image: url(data:image/svg+xml,%3csvg xmlns='http://www.w3.org/2000/svg' fill='000000' …3cpath d='M2.75 0l-1.5 1.5 2.5 2.5-2.5 2.5 1.5 1.5 4-4-4-4z'/%3e%3c/svg%3e) !important;
}
.carousel-control-prev-icon {
    background-image: url(data:image/svg+xml,%3csvg xmlns='http://www.w3.org/2000/svg' fill='000000' …3cpath d='M5.25 0l-4 4 4 4 1.5-1.5-2.5-2.5 2.5-2.5-1.5-1.5z'/%3e%3c/svg%3e) !important;
}
</style>
</head>
<body>
		<%@ include file="../navbar.jsp"%>
	<div class="container">
	<div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel" style="width:80%; margin-left:auto; margin-right:auto;">
  <ol class="carousel-indicators">
    <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
    <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
    <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
    <li data-target="#carouselExampleIndicators" data-slide-to="3"></li>
  </ol>
  <div class="carousel-inner">
    <div class="carousel-item active">
      <a href="/guguya/project/projects.jsp">
      <img src="/guguya/carousel1.png" class="d-block w-100 " alt="구구야">
      </a>
    </div>
    <div class="carousel-item">
      <a href="/guguya/portfolio/portfolio.jsp">
      <img src="/guguya/carousel2.png" class="d-block w-100 " alt="구구야">
      </a>
    </div>
    <div class="carousel-item">
      <a href="/guguya/community/board.jsp">
      <img src="/guguya/carousel3.png" class="d-block w-100 " alt="구구야">
      </a>
    </div>
        <div class="carousel-item">
      <a href="/guguya/user/signup.jsp">
      <img src="/guguya/carousel4.png" class="d-block w-100 " alt="구구야">
      </a>
    </div>
  </div>
  <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
  </a>
</div>
	</div>
		<%@ include file="../footer.jsp"%>

</body>
</html>