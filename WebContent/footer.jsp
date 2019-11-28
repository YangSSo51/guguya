<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>

#footer{
    color: #ffffff;
    background-color: #404040;
    text-align: left;
    padding: 3.5em;
    bottom: 0;
    padding-left:100px;
}

.small-col{
    width:30px;
}
h3.title_l{font-weight: 700; font-size: 1.5em; margin-right: 0.5em; text-align: left;}
h4.title_m{font-weight: 500; font-size: 1.2em; margin-right: 0.5em; text-align: left;}
.content{font-weight: 200; font-size: 0.8em; margin-right: 0.5em; margin-top:1px; text-align: left;}
.my-logo{
    width: 50px;
}
.my-logo2{
    width: 80px;
}
#row-container{
    margin-left:15px;
}
@media (min-width: 1025px)  {
}
@media (min-width: 1025px)  {
    div#footer{
        position: relative;
        background-color: #323232;
        color: #ffffff;
        font-family: 'Nanum Gothic', sans-serif;
        text-align: left;
        padding-top: 1%;
        padding-bottom: 1%;
        padding-left: 25%;
        padding-right: 20%;
        width: 100%;
        bottom:0;
        left:0;        
    }

    .logo{
    	width:35px;
    	margin-right:5px;
    }
}
@media (max-width: 1025px)  {
    .mobile{
        width:140px;
    }
    .bottom{
        width:160px;
    }
    .small-row{
        width:90px;
    }
    #small-row{
        width:30px;
        margin-left:30px;
    }
    .col-6{
        padding:0;
        width:30px;
    }
    #footer{
        padding:20px;
    }
    h3.title_l{font-weight: 700; font-size: 0.8em; margin-right: 0.2em; text-align: left;}
    h4.title_m{font-weight: 500; font-size: 0.6em; margin-left:0.1em; margin-right: 0.4em; text-align: left;}
    .content{font-weight: 200; font-size: 0.2em; margin-right: 0.2em; text-align: left;}
    .my-logo{
        width: 28px;
        margin-top:10px;
    }
    .my-logo2{
        width: 30px;
        height: 15px;
        margin-left:4px;
        margin-top:6px;
    }
    #row-container{
        margin-left:5px;
    }
    #icon2{
        width:70px;
    }
    .left-container{
        margin-top:10px;
    }
    .right-container{
        margin-left: 6px;
    }
    .gone{
        display: none;
    }
    .logo{
    	width:20px;
    }
}
</style>
  <footer id="footer" class="footer mt-auto py-3">
    <div class="row">
      <div class="col-6 col-lg-6">
        <h3 class="title_l">구구야</h3>
        <div class="left-container">
          <div class="row" id="row-container">
            <a href="/guguya/home.jsp">
          	<img class="logo" src="/guguya/logo_mini.png">
          	</a>
          	<a href="https://github.com/YangSSo51/guguya">
          	<img class="logo" src="/guguya/git_logo.png">
          	</a>
          </div>
        </div>
      </div>
      <div class="col-6 col-lg-6">
        <h3 class="title_l">DEVELOPER</h3>
        <div class="right-container">
          <div class="row mobile" id="row-container" >
            <div class="col-4 col-lg-6">
              <div class="row small-row" >
                <h4 class="title_m">박현욱</h4>
                <span class="content">컴퓨터공학과</span>
              </div>
              <div class="row small-row">
                <h4 class="title_m">금기륜</h4>
                <span class="content">컴퓨터공학과</span>
              </div>
            </div>
            <div class="col-4 col-lg-6" id="small-row">
              <div class="row small-row">
                <h4 class="title_m">이상현</h4>
                <span class="content">컴퓨터공학과</span>
              </div>
              <div class="row small-row">
                <h4 class="title_m">양소영</h4>
                <span class="content">컴퓨터공학과</span>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </footer>
</html>