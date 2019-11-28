<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
  <footer id="footer" class="footer mt-auto py-3">
    <div class="row">
      <div class="col-6 col-lg-6">
        <h3 class="title_l">KPUTube</h3>
        <div class="left-container">
          <div class="row" id="row-container">
            <h4 class="title_m">날짜</h4>
            <span class="content">2019.09.25(수)-27(금)</span>
          </div>
          <div class="row" id="row-container">
            <h4 class="title_m">장소</h4>
            <span class="content">경기도 시흥시 산기대학로 237</span>
          </div>
        </div>
        <div class="row">
          <div class="col-1 col-lg-1">
            <img src="{% static 'img/logo.png' %}" alt="logo" class="my-logo">
          </div>
          <div class="col-10 col-lg-11">
            <img id="icon2" src="{% static 'img/kpuXlikelion.png' %}">
            <h5 class="content">Copyright © 산기대멋쟁이사자처럼7기.All right reserved</h5>
          </div>
        </div>
      </div>
      <div class="col-6 col-lg-6">
        <h3 class="title_l">DEVELOPER</h3>
        <div class="right-container">
          <div class="row mobile" id="row-container" >
            <div class="col-4 col-lg-6">
              <div class="row small-row" >
                <h4 class="title_m">김연준</h4>
                <span class="content">컴퓨터공학과</span>
              </div>
              <div class="row small-row">
                <h4 class="title_m">고주원</h4>
                <span class="content">IT경영학과</span>
              </div>
            </div>
            <div class="col-4 col-lg-6" id="small-row">
              <div class="row small-row">
                <h4 class="title_m">이세민</h4>
                <span class="content">컴퓨터공학과</span>
              </div>
              <div class="row small-row">
                <h4 class="title_m">양소영</h4>
                <span class="content">컴퓨터공학과</span>
              </div>
            </div>

          </div>
        </div>
        <div class="row bottom" style="padding-left:15px; margin-top:8px;">
          <h3 class="title_l">협력</h3>
          <img src="{% static 'img/wehigher.png' %}" alt="logo" class="my-logo2">
          <h4 class="content" style="margin-top:8px; margin-left:10px;">총학생회 '위하여'</h4>
        </div>
      </div>
    </div>
  </footer>
</body>
</html>