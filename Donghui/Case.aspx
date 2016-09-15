<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Case.aspx.cs" Inherits="Donghui.Case" %>

<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
   <title>案例|<%= aboutusDic["SeoTitle"] %></title>
    <meta name="keywords" content="<%= aboutusDic["SeoKeywords"] %>" />
    <meta name="description" content="<%= aboutusDic["SeoDescription"] %>"/>
	 
	<link rel="favicon" href="assets/images/favicon.png">
<%--	<link rel="stylesheet" media="screen" href="http://fonts.useso.com/css?family=Open+Sans:300,400,700">--%>
	<link rel="stylesheet" href="assets/css/bootstrap.min.css">
	<link rel="stylesheet" href="assets/css/font-awesome.min.css">
	<!-- Custom styles for our template -->
	<link rel="stylesheet" href="assets/css/bootstrap-theme.css" media="screen">
	<link rel="stylesheet" type="text/css" href="assets/css/isotope.css" media="screen" />
	<link rel="stylesheet" href="assets/js/fancybox/jquery.fancybox.css" type="text/css" media="screen" />
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
					<img src="assets/images/logo.png" alt="Techro HTML5 template"></a>
			</div>
			<div class="navbar-collapse collapse">
				<ul class="nav navbar-nav pull-right mainNav">
					<li><a href="index.aspx">首页</a></li>
					<li><a href="about.aspx">关于</a></li>
					<li><a href="Advantage.aspx">领先优势</a></li>
					<li><a href="price.aspx">价格</a></li>
					<li class="active"><a href="Case.aspx">案例</a></li>
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
                    <h1>案例</h1>
                    <p>你最值得信赖的美国月子服务专家</p>
                </div>
    </header>


	<!-- container -->
	<section class="container">
		<div class="row">
			<div class="col-md-12">
				<section id="portfolio" class="page-section section appear clearfix">
					<br />
					<br />
					<p>
						<%--At lorem Ipsum available, but the majority have suffered alteration in some form by injected huffered altehe majority have suffered alteration in some form by injected huffered alteration in some form by injected humour.uffered alteration in some form by injected h--%>
					<br />
						<br />
					</p>


					<div class="row">
						<nav id="filter" class="col-md-12 text-center">
							<%--<ul>
								<li><a href="#" class="current btn-theme btn-small" data-filter="*">All</a></li>
								<li><a href="#" class="btn-theme btn-small" data-filter=".webdesign">Development</a></li>
								<li><a href="#" class="btn-theme btn-small" data-filter=".photography">Designing</a></li>
								<li><a href="#" class="btn-theme btn-small" data-filter=".print">Tools</a></li>
							</ul>--%>
						</nav>
						<div class="col-md-12">
							<div class="row">
								<div class="portfolio-items isotopeWrapper clearfix" id="3">
                            
                                    <%
                                        for (int i = 0; i < caseList.Rows.Count; i++)
                                        {%>
                                    	<article class="col-sm-4 isotopeItem webdesign">
										<div class="portfolio-item">
											<img src="<%= caseList.Rows[i]["photo"].ToString() %>" alt="" width="360" height="275"/>
											<div class="portfolio-desc align-center">
												<div class="folio-info">
													<a href="detail.aspx?id=<%= caseList.Rows[i]["id"].ToString()  %>" class="fancybox" target="_blank">
														<h5><%=  caseList.Rows[i]["name"].ToString() %></h5>
														<i class="fa fa-link fa-2x"></i></a>
												</div>
											</div>
                                            <label><%=  caseList.Rows[i]["subtitle"].ToString() %></label>
										</div>
									</article>

                                        <%}
                                         %>


<%--									<article class="col-sm-4 isotopeItem webdesign">
										<div class="portfolio-item">
											<img src="assets/images/portfolio/img1.jpg" alt="" />
											<div class="portfolio-desc align-center">
												<div class="folio-info">
													<a href="assets/images/portfolio/img1.jpg" class="fancybox">
														<h5>Project Title</h5>
														<i class="fa fa-link fa-2x"></i></a>
												</div>
											</div>
										</div>
									</article>

									<article class="col-sm-4 isotopeItem photography">
										<div class="portfolio-item">
											<img src="assets/images/portfolio/img2.jpg" alt="" />
											<div class="portfolio-desc align-center">
												<div class="folio-info">
													<a href="assets/images/portfolio/img2.jpg" class="fancybox">
														<h5>Project Title</h5>
														<i class="fa fa-link fa-2x"></i></a>
												</div>
											</div>
										</div>
									</article>


									<article class="col-sm-4 isotopeItem photography">
										<div class="portfolio-item">
											<img src="assets/images/portfolio/img3.jpg" alt="" />
											<div class="portfolio-desc align-center">
												<div class="folio-info">
													<a href="assets/images/portfolio/img3.jpg" class="fancybox">
														<h5>Project Title</h5>
														<i class="fa fa-link fa-2x"></i></a>
												</div>
											</div>
										</div>
									</article>

									<article class="col-sm-4 isotopeItem print">
										<div class="portfolio-item">
											<img src="assets/images/portfolio/img4.jpg" alt="" />
											<div class="portfolio-desc align-center">
												<div class="folio-info">
													<a href="assets/images/portfolio/img4.jpg" class="fancybox">
														<h5>Project Title</h5>
														<i class="fa fa-link fa-2x"></i></a>
												</div>
											</div>
										</div>
									</article>

									<article class="col-sm-4 isotopeItem photography">
										<div class="portfolio-item">
											<img src="assets/images/portfolio/img5.jpg" alt="" />
											<div class="portfolio-desc align-center">
												<div class="folio-info">
													<a href="assets/images/portfolio/img5.jpg" class="fancybox">
														<h5>Project Title</h5>
														<i class="fa fa-link fa-2x"></i></a>
												</div>
											</div>
										</div>
									</article>

									<article class="col-sm-4 isotopeItem webdesign">
										<div class="portfolio-item">
											<img src="assets/images/portfolio/img6.jpg" alt="" />
											<div class="portfolio-desc align-center">
												<div class="folio-info">
													<a href="assets/images/portfolio/img6.jpg" class="fancybox">
														<h5>Project Title</h5>
														<i class="fa fa-link fa-2x"></i></a>
												</div>
											</div>
										</div>
									</article>

									<article class="col-sm-4 isotopeItem print">
										<div class="portfolio-item">
											<img src="assets/images/portfolio/img7.jpg" alt="" />
											<div class="portfolio-desc align-center">
												<div class="folio-info">
													<a href="images/portfolio/img7.jpg" class="fancybox">
														<h5>Project Title</h5>
														<i class="fa fa-link fa-2x"></i></a>
												</div>
											</div>
										</div>
									</article>

									<article class="col-sm-4 isotopeItem photography">
										<div class="portfolio-item">
											<img src="assets/images/portfolio/img8.jpg" alt="" />
											<div class="portfolio-desc align-center">
												<div class="folio-info">
													<a href="images/portfolio/img8.jpg" class="fancybox">
														<h5>Project Title</h5>
														<i class="fa fa-link fa-2x"></i></a>
												</div>
											</div>
										</div>
									</article>

									<article class="col-sm-4 isotopeItem print">
										<div class="portfolio-item">
											<img src="assets/images/portfolio/img9.jpg" alt="" />
											<div class="portfolio-desc align-center">
												<div class="folio-info">
													<a href="images/portfolio/img9.jpg" class="fancybox">
														<h5>Project Title</h5>
														<i class="fa fa-link fa-2x"></i></a>
												</div>
											</div>
										</div>
									</article>--%>
								</div>

							</div>


						</div>
					</div>

				</section>
			</div>
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


    <div class="lanrenzhijia_m" id="lanrenzhijia_m" style="z-index:1000;">
        <ul>
            <a href="javascript:;" class="close" name="close"></a>
            <a href="tencent://message/?uin=639083793&Site=sc.chinaz.com&Menu=yes" target="_blank" style="left: 145px;"></a>
            <a href="javascript:;" name="close" style="left: 235px;"></a>
        </ul>
    </div>

	<!-- JavaScript libs are placed at the end of the document so the pages load faster -->
	<script src="http://apps.bdimg.com/libs/jquery/1.10.2/jquery.min.js"></script>
	<script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>
	<script src="assets/js/jquery.cslider.js"></script>
	<script src="assets/js/jquery.isotope.min.js"></script>
	<script src="assets/js/fancybox/jquery.fancybox.pack.js" type="text/javascript"></script>
	<script src="assets/js/custom.js"></script>
</body>
</html>
