﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="detail.aspx.cs" Inherits="Donghui.detail" %>
<%@ Import Namespace="System.Data" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title><%= News["name"] %> |<%= aboutusDic["SeoTitle"] %></title>
    <meta name="keywords" content="<%= aboutusDic["SeoKeywords"] %>" />
    <meta name="description" content="<%= aboutusDic["SeoDescription"] %>"/>
	 
	<link rel="favicon" href="assets/images/favicon.png">
<%--	<link rel="stylesheet" media="screen" href="http://fonts.useso.com/css?family=Open+Sans:300,400,700">--%>
    <link href="assets/css/family.css" rel="stylesheet" />
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
        <link href="assets/customerservice/customer-service.css" rel="stylesheet" />
    <link href="assets/customerservice/lanren.css" rel="stylesheet" />
    <script>
var _hmt = _hmt || [];
(function() {
  var hm = document.createElement("script");
  hm.src = "//hm.baidu.com/hm.js?bc0f8aa0929818cf5b3b6b55240e5de4";
  var s = document.getElementsByTagName("script")[0]; 
  s.parentNode.insertBefore(hm, s);
})();
</script>

</head>

<body>
	<!-- Fixed navbar -->
	<div class="navbar navbar-inverse">
		<div class="container">
			<div class="navbar-header">
				<!-- Button for smallest screens -->
				<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse"><span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span></button>
				<a class="navbar-brand" href="index.aspx">
					<img src="assets/images/logo.png" alt=""></a>
			</div>
			<div class="navbar-collapse collapse">
				<ul class="nav navbar-nav pull-right mainNav">
					<li><a href="index.aspx">首页</a></li>
					<li><a href="about.aspx">关于</a></li>
					<li><a href="Advantage.aspx">领先优势</a></li>
					<li><a href="price.aspx">价格</a></li>
					<li><a href="Case.aspx">案例</a></li>
					<li class="dropdown">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown"> 赴美生子攻略 <b class="caret"></b></a>
						<ul class="dropdown-menu">
							<li><a href="detail.aspx?id=17">赴美生子流程</a></li>
							<li><a href="detail.aspx?id=16">赴美生子优势</a></li> 
						</ul>
					</li>
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
            <aside class="col-md-4 sidebar detail">
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
                                    <li><a target="_blank" title="<%= newsList.Rows[i]["name"].ToString() %>" href="detail.aspx?id=<%= newsList.Rows[i]["id"].ToString() %>"><%= (i+1)  +"."+ newsList.Rows[i]["name"].ToString() %></a></li>
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
								<a href="Advantage.aspx">领先优势</a> |
								<a href="price.aspx">价格</a> |
								<a href="Case.aspx">案例</a> |
								<a href="contact.aspx">联系我们</a>
							</p>
						</div>
					</div>

					<div class="col-md-6 panel">
						<div class="panel-body">
							<p class="text-right">
								Copyright &copy;  2016. 
							</p>
						</div>
					</div>

				</div>
				<!-- /row of panels -->
			</div>
		</div>
	</footer>
      <div id="rightArrow" class="open-im">&nbsp;</div>
    
    <div id="floatDivBoxs">
        <div class="floatDtt">在线客服</div>
        <div class="floatShadow">
            <ul class="floatDqq">
                <%
                    foreach (KeyValuePair<string,string> item in qqList)
                    {
                        if ( item.Key.Split('-').Length > 0)
                        { 
                        %>
                       <li><a target="_blank" href="tencent://message/?uin=<%= item.Key.Split('-')[0] %>&Site=sc.chinaz.com&Menu=yes">
                        <img src="assets/customerservice/images/qq.png" align="absmiddle"><%= item.Value %></a></li>
                    <%}}
                     %>  
            </ul>
            <div class="floatDtxt">热线电话</div>
            <div class="floatDtel">
                 <ul class="floatDphone" >
                       <%
                           for (int i = 0; i < phoneList.Count; i++)
                           {%>
                         <li><a href="javascript:;">    <img src="assets/customerservice/images/phone.png" align="absmiddle"> <%= phoneList[i] %> </a> </li>
                           <%}
                            %> 
                   </ul>
            <div class="floatImg">
                <img src="assets/customerservice/images/erweima.jpg" width="100%">微信公众账号</div>
        </div>
        <div class="floatDbg"></div>
    </div>


    <div class="lanrenzhijia_m" id="lanrenzhijia_m">
        <ul>
            <a href="javascript:;" class="close" name="close"></a>
            <a href="tencent://message/?uin=639083793&Site=sc.chinaz.com&Menu=yes" target="_blank" style="left: 145px;"></a>
            <a href="javascript:;" name="close" style="left: 235px;"></a>
        </ul>
    </div>

	<!-- JavaScript libs are placed at the end of the document so the pages load faster -->
	<script src="http://apps.bdimg.com/libs/jquery/1.10.2/jquery.min.js"></script>
	<script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>
	<script src="assets/js/custom.js"></script>
</body>
</html>
