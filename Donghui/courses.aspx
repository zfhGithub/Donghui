<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="courses.aspx.cs" Inherits="Donghui.courses" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta name="description" content="">
	<meta name="author" content="webThemez.com">
	<title>领先优势</title>
	<link rel="favicon" href="assets/images/favicon.png">
	<link rel="stylesheet" media="screen" href="http://fonts.useso.com/css?family=Open+Sans:300,400,700">
	<link rel="stylesheet" href="assets/css/bootstrap.min.css">
	<link rel="stylesheet" href="assets/css/font-awesome.min.css">
	<!-- Custom styles for our template -->
	<link rel="stylesheet" href="assets/css/bootstrap-theme.css" media="screen">
	<link rel="stylesheet" href="assets/css/style.css">
	<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
	<!--[if lt IE 9]>
	<script src="assets/js/html5shiv.js"></script>
	<script src="assets/js/respond.min.js"></script>
	<![endif]-->
</head>

<body>
	<!-- Fixed navbar -->
	<div class="navbar navbar-inverse">
		<div class="container">
			<div class="navbar-header">
				<!-- Button for smallest screens -->
				<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse"><span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span></button>
				<a class="navbar-brand" href="index.aspx">
					<img src="assets/images/logo.png" alt="Techro HTML5 template"></a>
			</div>
			<div class="navbar-collapse collapse">
				<ul class="nav navbar-nav pull-right mainNav">
					<li><a href="index.aspx">首页</a></li>
					<li><a href="about.aspx">关于</a></li>
					<li class="active"><a href="courses.aspx">领先优势</a></li>
					<li><a href="price.aspx">价格</a></li>
					<li><a href="videos.aspx">案例</a></li>
					<%--<li class="dropdown">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown">Pages <b class="caret"></b></a>
						<ul class="dropdown-menu">
							<li><a href="sidebar-right.aspx">Right Sidebar</a></li>
							<li><a href="#">Dummy Link1</a></li>
							<li><a href="#">Dummy Link2</a></li>
							<li><a href="#">Dummy Link3</a></li>
						</ul>
					</li>--%>
					<li><a href="contact.aspx">联系我们</a></li>

				</ul>
			</div>
			<!--/.nav-collapse -->
		</div>
	</div>
	<!-- /.navbar -->

		<header id="head" class="secondary">
            <div class="container">
                    <h1>领先优势</h1>
                    <p>我们在美国的七家大型月子中心均拥有十年以上历史，十七年来树立的良好口碑，接待过众多在美坐月子的名人和明星的月子中心!</p>
                </div>
    </header>

    
    <div class="container">
<h3>我们的优势</h3>
<p>
    18年月子中心，真正百人团队，超高通过率，100%入境 优质直营月子中心12万RMB起（仅限本月）！免费提供去美国坐月子最新政策咨询，量身制定专业方案，合法安全，全程透明。
</p>
<br/>
        <ul class="list-unstyled video-list-thumbs row">
            <%
                for (int i = 0; i < advList.Rows.Count; i++)
                {%>
                   <li class="col-lg-3 col-sm-4 col-xs-6">
                    <a href="#" title="">
                        <img src="<%= advList.Rows[i]["photo"].ToString() %>" alt="Barca" class="img-responsive" height="130px" />
                        <h2><%= advList.Rows[i]["title"] %> </h2>
                        <span class="play-button"></span>
                        <span class="duration"><%= advList.Rows[i]["name"] %></span>
                    </a>
                </li>
                <%}
                 %>
         
          
        </ul>

</div>
    	<!--
	<div id="courses">
		<section class="container">
			<h3>发展历程</h3>
			<div class="row">
				<div class="col-md-4">
					<div class="featured-box"> 
						<div class="text">
							<h3>Responsive Design</h3>
							Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
						</div>
					</div>
				</div>
				<div class="col-md-4">
					<div class="featured-box"> 
						<div class="text">
							<h3>HTML5/CSS3</h3>
							Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
						</div>
					</div>
				</div>
				<div class="col-md-4">
					<div class="featured-box"> 
						<div class="text">
							<h3>Web Designing</h3>
							Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-md-4">
					<div class="featured-box"> 
						<div class="text">
							<h3>Web App Dev</h3>
							Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
						</div>
					</div>
				</div>
				<div class="col-md-4">
					<div class="featured-box"> 
						<div class="text">
							<h3>Data Base</h3>
							Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
						</div>
					</div>
				</div>
				<div class="col-md-4">
					<div class="featured-box"> 
						<div class="text">
							<h3>Mobile App Dev</h3>
							Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
						</div>
					</div>
				</div>
			</div> 
		</section>
	</div>
     -->
	<!-- container -->
	<div class="container">
		<div class="row">
			<!-- Article content -->
			<section class="col-sm-12 maincontent">
				<h3><%= title %></h3>
				<p>
					<%= myCommitHtml %>
				</p>
				<%--<h3>Bootstrap</h3>
				<p>Standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>--%>
			</section>
		</div>
	</div>
	<!-- /container -->
 <footer id="footer">
 
		<div class="container">
   <div class="row">
  <div class="footerbottom">
    <div class="col-md-3 col-sm-6">
      <div class="footerwidget">
        <h4>
          Course Categories
        </h4>
        <div class="menu-course">
          <ul class="menu">
            <li><a href="#">
                List of Technology 
              </a>
            </li>
            <li><a href="#">
                List of Business
              </a>
            </li>
            <li><a href="#">
                List of Photography
              </a>
            </li>
            <li><a href="#">
               List of Language
              </a>
            </li>
          </ul>
        </div>
      </div>
    </div>
    <div class="col-md-3 col-sm-6">
      <div class="footerwidget">
        <h4>
          Products Categories
        </h4>
        <div class="menu-course">
          <ul class="menu">
            <li> <a href="#">
                Individual Plans  </a>
            </li>
            <li><a href="#">
                Business Plans
              </a>
            </li>
            <li><a href="#">
                Free Trial
              </a>
            </li>
            <li><a href="#">
                Academic
              </a>
            </li>
          </ul>
        </div>
      </div>
    </div>
    <div class="col-md-3 col-sm-6">
      <div class="footerwidget">
        <h4>
          Browse by Categories
        </h4>
        <div class="menu-course">
          <ul class="menu">
            <li><a href="#">
                All Courses
              </a>
            </li>
            <li> <a href="#">
                All Instructors
              </a>
            </li>
            <li><a href="#">
                All Members
              </a>
            </li>
            <li>
              <a href="#">
                All Groups
              </a>
            </li>
          </ul>
        </div>
      </div>
    </div>
    <div class="col-md-3 col-sm-6"> 
            	<div class="footerwidget"> 
                         <h4>Contact</h4> 
                        <p>Lorem reksi this dummy text unde omnis iste natus error sit volupum</p>
            <div class="contact-info"> 
            <i class="fa fa-map-marker"></i> Kerniles 416  - United Kingdom<br>
            <i class="fa fa-phone"></i>+00 123 156 711 <br>
             <i class="fa fa-envelope-o"></i> youremail@email.com
              </div> 
                </div><!-- end widget --> 
    </div>
  </div>
</div>
			<div class="social text-center">
				<a href="#"><i class="fa fa-twitter"></i></a>
				<a href="#"><i class="fa fa-facebook"></i></a>
				<a href="#"><i class="fa fa-dribbble"></i></a>
				<a href="#"><i class="fa fa-flickr"></i></a>
				<a href="#"><i class="fa fa-github"></i></a>
			</div>

			<div class="clear"></div>
			<!--CLEAR FLOATS-->
		</div>
		<div class="footer2">
			<div class="container">
				<div class="row">

					<div class="col-md-6 panel">
						<div class="panel-body">
							<p class="simplenav">
								<a href="index.aspx">首页</a> | 
								<a href="about.aspx">关于</a> |
								<a href="courses.aspx">Courses</a> |
								<a href="price.aspx">Price</a> |
								<a href="videos.aspx">Videos</a> |
								<a href="contact.aspx">Contact</a>
							</p>
						</div>
					</div>

					<div class="col-md-6 panel">
						<div class="panel-body">
							<p class="text-right">
								Copyright &copy; 2016.Company name All rights reserved.
							</p>
						</div>
					</div>

				</div>
				<!-- /row of panels -->
			</div>
		</div>
	</footer>


	<!-- JavaScript libs are placed at the end of the document so the pages load faster -->
	<script src="http://apps.bdimg.com/libs/jquery/1.10.2/jquery.min.js"></script>
	<script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>
	<script src="assets/js/custom.js"></script>
</body>
</html>
