<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="sidebar-right.aspx.cs" Inherits="Donghui.sidebar_right" %>
<%@ Import Namespace="System.Data" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta name="description" content="">
	<meta name="author" content="webThemez.com">
	<title><%= News["name"] %> </title>
	<link rel="favicon" href="assets/images/favicon.png">
	<link rel="stylesheet" media="screen" href="http://fonts.useso.com/css?family=Open+Sans:300,400,700">
	<link rel="stylesheet" href="assets/css/bootstrap.min.css">
	<link rel="stylesheet" href="assets/css/font-awesome.min.css">
	<!-- Custom styles-->
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

	<header id="head" class="secondary">
            <div class="container">
                    <h1><%= News["name"] %> </h1>
                    <p> 发布者：admin; 发布时间:<%= News["created"] %></p>
                </div>
    </header>

	<!-- container -->
	<section class="container">

		<div class="row">

			<!-- Article main content -->
			<article class="col-md-8 maincontent">
				<br />
				<br />
	 <%= News["content"] %>
			</article>
			<!-- /Article -->

			<!-- Sidebar -->
            <aside class="col-md-4 sidebar sidebar-right">
                <div class="row panel">
                   <%
                       if (!string.IsNullOrWhiteSpace( News["photo"]))
                       {%>
                           <div class="col-xs-12">
                                <h3>图片</h3>
                                <p>
                                    <img src="<%= News["photo"]%>" alt="">
                                </p>
                                <p><%= News["subtitle"]%></p>
                         </div>
                       <%}
                        %>
                  
                </div>
                <div class="row panel">
                    <div class="col-xs-12">

                        <div class="title-box clearfix ">
                            <h2 class="title-box_primary">最新文章</h2>
                        </div>
                        <div class="list styled custom-list">
                            <ul>
                                <%
                                    for (int i = 0; i < newsList.Rows.Count;i++)
                                    {%>
                                    <li><a target="_blank" title="<%= newsList.Rows[i]["name"].ToString() %>" href="sidebar-right.aspx?id=<%= newsList.Rows[i]["id"].ToString() %>"><%= (i+1)  +"."+ newsList.Rows[i]["name"].ToString() %></a></li>
                                    <%} %>
                              
                            </ul>
                        </div>

                    </div>
                </div>


            </aside>
			<!-- /Sidebar -->

		</div>
	</section>
	<!-- /container -->
 <footer id="footer">
 
		<div class="container">
   <div class="row">
  <div class="footerbottom">
    <div class="col-md-3 col-sm-6">
     
    </div>
    <div class="col-md-3 col-sm-6">
    
    </div>
    <div class="col-md-3 col-sm-6">
    
    </div>
    <div class="col-md-3 col-sm-6"> 
             
    </div>
  </div>
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
	<script src="http://apps.bdimg.com/libs/jquery/1.10.2/jquery.min.js"></script>
	<script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>
	<script src="assets/js/custom.js"></script>
</body>
</html>
