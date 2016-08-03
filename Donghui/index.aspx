<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="Donghui.index" %>

<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta name="description" content="">
	<meta name="author" content="webThemez.com">
	<title>去塞班岛生孩子</title>
	<link rel="favicon" href="assets/images/favicon.png">
	<link rel="stylesheet" media="screen" href="http://fonts.useso.com/css?family=Open+Sans:300,400,700">
	<link rel="stylesheet" href="assets/css/bootstrap.min.css">
	<link rel="stylesheet" href="assets/css/font-awesome.min.css"> 
	<link rel="stylesheet" href="assets/css/bootstrap-theme.css" media="screen"> 
	<link rel="stylesheet" href="assets/css/style.css">
    <link rel='stylesheet' id='camera-css'  href='assets/css/camera.css' type='text/css' media='all'> 
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
					<li class="active"><a href="index.aspx">首页</a></li>
					<li><a href="about.aspx">关于</a></li>
					<li><a href="courses.aspx">领先优势</a></li>
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

	<!-- Header -->
	<header id="head">
		<div class="container">
            <%-- <div class="heading-text">							
							<h1 class="animated flipInY delay1">Start Online Education</h1>
							<p>Free Online education template for elearning and online education institute.</p>
						</div>--%>
            
					<div class="fluid_container">                       
                    <div class="camera_wrap camera_emboss pattern_1" id="camera_wrap_4">
                        <% for (int i = 0; i < bannerList.Count; i++)
                            {
                                if (!string.IsNullOrEmpty( bannerList[i]))
                                {
                                    %>
                                <div data-thumb="assets/images/banner/<%= bannerList[i] %>" data-src="assets/images/banner/<%= bannerList[i] %>">  </div> 
                            <%    }
                                
                            } %>
                      <%--  <div data-thumb="assets/images/slides/img1.jpg" data-src="assets/images/slides/img1.jpg">  </div> 
                        <div data-thumb="assets/images/slides/img2.jpg" data-src="assets/images/slides/img2.jpg">  </div>
                        <div data-thumb="assets/images/slides/img3.jpg" data-src="assets/images/slides/img3.jpg">  </div> 
                        <div data-thumb="assets/images/banner/03.jpg" data-src="assets/images/banner/03.jpg">  </div> --%>
                    </div><!-- #camera_wrap_3 -->
                </div><!-- .fluid_container -->
		</div>
	</header>
	<!-- /Header -->

  <div class="container">
    <div class="row">
        <%
            for (int i = 0; i < advList.Rows.Count; i++)
            {%>
        	<div class="col-md-3">
						<div class="grey-box-icon">
							<div class="icon-box-top grey-box-icon-pos">
								<img src="<%= advList.Rows[i]["photo"].ToString() %>" alt="" />
							</div><!--icon box top -->
							<h4><%=advList.Rows[i]["name"].ToString() %></h4>
							<p><%=advList.Rows[i]["subtitle"].ToString() %></p>
     						<p><a href="sidebar-right.aspx?id=<%=advList.Rows[i]["id"].ToString() %>" target="_blank"><em>阅读更多</em></a></p>
						</div><!--grey box -->
					</div><!--/span3-->
            <%} %> 
					 
				</div>
    </div>
      <section class="news-box top-margin">
        <div class="container">
            <h2><span>案例</span></h2>
            <div class="row">
       <%
           for (int i = 0; i < caseList.Rows.Count; i++)
           {
%>
                   <div class="col-lg-4 col-md-4 col-sm-12">
                    <div class="newsBox">
                        <div class="thumbnail">
                            <figure><img width="340" height="150" src="<%= caseList.Rows[i]["photo"].ToString() %>" alt=""></figure>
                            <div class="caption maxheight2">
                            <div class="box_inner">
                                        <div class="box">
                                            <p class="title"><h5><a href="sidebar-right.aspx?id=<%= caseList.Rows[i]["id"].ToString()%>"> <%= caseList.Rows[i]["name"].ToString() %></a></h5></p>
                                            <p><a href="sidebar-right.aspx?id=<%= caseList.Rows[i]["id"].ToString()%>"><%= caseList.Rows[i]["subtitle"].ToString() %></a></p>
                                        </div> 
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
  <%         } %>
 
            </div>
        </div>
    </section>
   
  
	
      <section class="container">
      <div class="row">
      	<div class="col-md-8"><div class="title-box clearfix "><h2 class="title-box_primary">关于我们</h2></div> 
    <%= aboutusDic["AboutusText"] %>
        <a href="about.aspx" title="read more" class="btn-inline " target="_self">阅读更多</a> </div>
              
          
          <div class="col-md-4"><div class="title-box clearfix "><h2 class="title-box_primary">最新资讯</h2></div> 
            <div class="list styled custom-list">
            <ul>
                <%
                    for (int i = 0; i < newsList.Count; i++)
                    {%>
                       <li><a target="_blank" title="<%= newsList[i]["name"] %>" href="sidebar-right.aspx?id=<%= newsList[i]["id"] %>"><%= (i+1)+"."+ newsList[i]["name"] %></a></li>
                    <%} %>
             
            </ul>
            </div>
         </div>
      </div>
      </section>
      
    	 
    <footer id="footer">
 
		<div class="container">
   <div class="row">
  <div class="footerbottom">
    <div class="col-md-3 col-sm-6">
      
      <div class="footerwidget">
     
      </div>
    </div>
    <div class="col-md-3 col-sm-6">
    
    </div>
    <div class="col-md-3 col-sm-6">
    </div>
    <div class="col-md-3 col-sm-6"> 
            	<%--<div class="footerwidget"> 
                         <h4>联系我们</h4> 
                        <p></p>
            <div class="contact-info"> 
            <i class="fa fa-map-marker"></i><%= aboutusDic["Address"] %> <br>
            <i class="fa fa-phone"></i><%= aboutusDic["Phone"] %><br>
             <i class="fa fa-envelope-o"></i> <%= aboutusDic["Email"] %>
              </div> 
                </div>--%><!-- end widget --> 
    </div>
  </div>
</div>
		<%--	<div class="social text-center">
				<a href="#"><i class="fa fa-twitter"></i></a>
				<a href="#"><i class="fa fa-facebook"></i></a>
				<a href="#"><i class="fa fa-dribbble"></i></a>
				<a href="#"><i class="fa fa-flickr"></i></a>
				<a href="#"><i class="fa fa-github"></i></a>
			</div>--%>

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
								<a href="courses.aspx">领先优势</a> |
								<a href="price.aspx">价格</a> |
								<a href="videos.aspx">案例</a> |
								<a href="contact.aspx">联系我们</a>
							</p>
						</div>
					</div>

					<div class="col-md-6 panel">
						<div class="panel-body">
							<p class="text-right">
								Copyright &copy; 东辉珠宝有限公司 2016. 
							</p>
						</div>
					</div>

				</div>
				<!-- /row of panels -->
			</div>
		</div>
	</footer>

	<!-- JavaScript libs are placed at the end of the document so the pages load faster -->
	<script src="assets/js/modernizr-latest.js"></script> 
	<script type='text/javascript' src='assets/js/jquery.min.js'></script>
    <script type='text/javascript' src='assets/js/fancybox/jquery.fancybox.pack.js'></script>
    
    <script type='text/javascript' src='assets/js/jquery.mobile.customized.min.js'></script>
    <script type='text/javascript' src='assets/js/jquery.easing.1.3.js'></script> 
    <script type='text/javascript' src='assets/js/camera.min.js'></script> 
    <script src="assets/js/bootstrap.min.js"></script> 
	<script src="assets/js/custom.js"></script>

    <script>
     
        jQuery(function () {
           
			jQuery('#camera_wrap_4').camera({
                transPeriod: 500,
                time: 3000,
				height: '600',
				loader: 'false',
				pagination: true,
				thumbnails: false,
				hover: false,
                playPause: false,
                navigation: false,
				opacityOnGrid: false,
				imagePath: 'assets/images/'
			});

		});
      
        
	</script> 
</body>
</html>
