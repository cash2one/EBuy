<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link type="text/css" rel="stylesheet" href="css/style.css" />
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery-1.11.1.js"></script>
<script type="text/javascript">
	$(function(){
		$("#loginForm").submit(function(){
			return checkForm();
		});
		$("#imageCode").on("click",loadimage());
	});
	
	// 加载验证码
	function loadimage(){
		$("#randImage").attr("src","${pageContext.request.contextPath}/user_createCheckCode.action?time="+new Date().getMilliseconds());
	}
	
	// 表单验证
	function checkForm(){
		 var userName=$("#userName").val();
		 var password=$("#password").val();
		 var imageCode=$("#imageCode").val();
		 if(userName==""){
			 $("#error").html("用户名不能为空！");
			 return false;
		 }
		 if(password==""){
			 $("#error").html("密码不能为空！");
			 return false;
		 }
		 if(imageCode==""){
			 $("#error").html("验证码不能为空！");
			 return false;
		 }
		 return true;
	}
</script>

</head>
<body>
	<div id="header" class="wrap">
		<jsp:include page="../../../common/top.jsp" />
	</div>
	<div id="register" class="wrap">
		<div class="shadow">
			<em class="corner lb"></em> <em class="corner rt"></em>
			<div class="box">
				<h1>欢迎回到易买网</h1>
				<form id="loginForm" method="post"
					action="${pageContext.request.contextPath}/user_login.action">
					<table>
						<tr>
							<td class="field">用户名：</td>
							<td><input class="text" type="text" id="userName"
								name="user.userName" value="${user.userName}" autofocus="autofocus" />
							</td>
						</tr>
						<tr>
							<td class="field">登录密码：</td>
							<td><input class="text" type="password" id="password"
								name="user.password" value="${user.password}" />
							</td>
						</tr>
						<tr>
							<td class="field">验证码：</td>
							<td><input class="text"
								style="width: 60px; margin-right: 10px;" type=text
								value="${imageCode}" name="imageCode" id="imageCode"><img
								 title="换一张试试" name="randImage"
								id="randImage" src="image.jsp" width="60" height="20" border="1">
							</td>
						</tr>

						<tr>
							<td></td>
							<td><label class="ui-green"><input type="submit"
									name="submit" value="立即登录" /> </label>&nbsp;&nbsp;&nbsp;&nbsp; <font
								id="error" color="red">${error}</font>
							</td>
						</tr>
					</table>
				</form>
			</div>
		</div>
	</div>
	<div id="footer">
		<jsp:include page="../../../common/footer.jsp" />
	</div>
</body>
</html>