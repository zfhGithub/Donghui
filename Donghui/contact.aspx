<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="contact.aspx.cs" Inherits="Donghui.contact" %>

<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
   <title>给我们留言|<%= aboutusDic["SeoTitle"] %></title>
    <meta name="keywords" content="<%= aboutusDic["SeoKeywords"] %>" />
    <meta name="description" content="<%= aboutusDic["SeoDescription"] %>"/>
 
	<link rel="favicon" href="assets/images/favicon.png">
<%--	<link rel="stylesheet" media="screen" href="http://fonts.useso.com/css?family=Open+Sans:300,400,700">--%>
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
					<li><a href="Case.aspx">案例</a></li>
					<li class="dropdown">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown"> 赴美生子攻略 <b class="caret"></b></a>
						<ul class="dropdown-menu">
							<li><a href="detail.aspx?id=17">赴美生子流程</a></li>
							<li><a href="detail.aspx?id=16">赴美生子优势</a></li> 
						</ul>
					</li>
					<li class="active"><a href="contact.aspx">联系我们</a></li>

				</ul>
			</div>
			<!--/.nav-collapse -->
		</div>
	</div>
	<!-- /.navbar -->

		<header id="head" class="secondary">
            <div class="container">
                    <h1>联系我们</h1>
                    <p>您好，请您留下您的信息：1:电话 2:怀孕多久 3:是否已有美国签证 4:所在省市，我们会第一时间也您取得联系，谢谢！
</p>
                </div>
    </header>


	<!-- container -->
	<div class="container">
				<div class="row">
					<div class="col-md-8">
						<h3 class="section-title">输入您的留言</h3>
						<p>
					<%--	Lorem Ipsum is inting and typesetting in simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the is dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.--%>
						</p>
						
					  
		<!--NOTE: Update your email Id in "contact_me.php" file in order to receive emails from your contact form-->
                        <form name="sentMessage" id="contactForm" novalidate action="contact.aspx" method="post">
                            <div class="control-group">
                                <div class="controls">
                                    <input type="text" class="form-control"
                                        placeholder="输入您的姓名" id="name" required name="cname"
                                        data-validation-required-message="请输入您的姓名" />
                                    <p class="help-block"></p>
                                </div>
                            </div>
                            <div class="control-group">
                                <div class="controls">
                                    <input type="text" maxlength="11" class="form-control" placeholder="电话"
                                        id="phone" required name="cphone"
                                        data-validation-required-message="请输入你的电话" />
                                        <p class="help-block"></p>
                                </div>
                            </div>
                            <div class="control-group">
                                <div class="controls">
                                    <input type="email" class="form-control" placeholder="邮箱"
                                        id="email" required name="cemail"
                                        data-validation-required-message="请输入你的邮箱" />
                                        <p class="help-block"></p>
                                </div>
                            </div>

                            <div class="control-group">
                                <div class="controls">
                                    <textarea rows="10" cols="100" class="form-control"
                                        placeholder="消息内容" id="message" required name="cmessage"
                                        data-validation-required-message="请输入消息内容" minlength="5"
                                        data-validation-minlength-message="最少输入五个字"
                                        maxlength="999" style="resize: none"></textarea>
                                </div>
                            </div>
                            <div id="success"></div>
                            <!-- For success/fail messages -->
                            <button type="submit" class="btn btn-primary pull-right">提交</button><br />
                        </form>
					</div>
					<div class="col-md-4">
						<div class="row">
							<div class="col-md-6">
								<h3 class="section-title">办公地址</h3>
								<div class="contact-info">
									<h5>地址</h5>
									<p><%= contactDt.Rows[0]["Address"].ToString() %></p>
									
									<h5>邮箱</h5>
									<p><%= contactDt.Rows[0]["Email"].ToString() %></p>
									
									<h5>联系方式</h5>
									<p><%= contactDt.Rows[0]["Phone"].ToString() %></p>
								</div>
							</div> 
						</div> 						
					</div>
				</div>
			</div>
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
 <script src="contact/jqBootstrapValidation.js"></script>
 <script src="contact/contact_me.js"></script>
	<script src="assets/js/custom.js"></script>

	<!-- Google Maps -->
	<script src="https://maps.googleapis.com/maps/api/js?v=3.exp&sensor=false"></script>
	<script src="assets/js/google-map.js"></script>
    <script src="assets/customerservice/js.js"></script>
</body>
</html>
