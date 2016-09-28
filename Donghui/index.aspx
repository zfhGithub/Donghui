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
<%--	<link rel="stylesheet" media="screen" href="http://fonts.useso.com/css?family=Open+Sans:300,400,700">--%>
    <link href="assets/css/family.css" rel="stylesheet" />
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
    <link href="assets/customerservice/customer-service.css" rel="stylesheet" />
    <link href="assets/customerservice/lanren.css" rel="stylesheet" />
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
					<li class="active"><a href="index.aspx">首页</a></li>
					<li><a href="about.aspx">关于</a></li>
					<li><a href="courses.aspx">领先优势</a></li>
					<li><a href="price.aspx">价格</a></li>
					<li><a href="videos.aspx">案例</a></li>
					<li class="dropdown">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown"> 赴美生子攻略 <b class="caret"></b></a>
						<ul class="dropdown-menu">
							<li><a href="sidebar-right.aspx?id=17">赴美生子流程</a></li>
							<li><a href="sidebar-right.aspx?id=16">赴美生子优势</a></li> 
						</ul>
					</li>
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
              <%--  <img src="assets/customerservice/images/online_phone.jpg" width="155" height="45" alt="">--%>
                   <ul class="floatDphone" >
                       <%
                           for (int i = 0; i < phoneList.Count; i++)
                           {%>
                         <li><a href="javascript:;">    <img src="assets/customerservice/images/phone.png" align="absmiddle"> <%= phoneList[i] %> </a> </li>
                           <%}
                            %> 
                   </ul>
            </div>
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
			jQuery('#lanrenzhijia_m').delay(3000).slideDown();
			jQuery('a[name=close]').click(function () {
			    jQuery('#lanrenzhijia_m').slideUp();
			    jQuery('#lanrenzhijia_m').delay(5000).slideDown();
			});

			var flag = 0;
			jQuery('#rightArrow').on("click", function () {
			    if (flag == 1) {
			        jQuery("#floatDivBoxs").animate({ right: '-175px' }, 300);
			        jQuery(this).animate({ right: '-5px' }, 300);
			        jQuery(this).css('background-position', '0px 0');
			        flag = 0;
			    } else {
			        jQuery("#floatDivBoxs").animate({ right: '0' }, 300);
			        jQuery(this).animate({ right: '170px' }, 300);
			        jQuery(this).css('background-position', '0px 0');
			        flag = 1;
			    }
			});

		});
      
        
	</script> 
 
    
</body>
</html>
