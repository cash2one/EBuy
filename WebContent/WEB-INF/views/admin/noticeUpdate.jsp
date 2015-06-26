<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/jquery-easyui-1.3.3/themes/default/easyui.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/jquery-easyui-1.3.3/themes/icon.css">
<script type="text/javascript"
	src="${pageContext.request.contextPath}/jquery-easyui-1.3.3/jquery.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/jquery-easyui-1.3.3/jquery.easyui.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/jquery-easyui-1.3.3/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery.form.js"></script>
<title>Insert title here</title>
<script type="text/javascript">
	//提交表单
	function submitForm() {
		if ($("#fm").form("validate")) {
			var content = $("#content").val();
			alert(content);
			if(content==null || content==""){
				$.messager.alert("系统提示","新闻内容不能为空！");
				return false;
			}
			$('#fm').ajaxSubmit({
				url : "notice_saveNotice.action",
				data:{
					"noticeManage.content":content
				},
				type : "post",
				dataType : "json",
				success : function(result) {
					if (result.success) {
						$.messager.alert("系统提示", "保存成功");
						setTimeout(function() {
							parent.closeWin();
						}, 1000);
						parent.reload();
					} else {
						$.messager.alert("系统提示", "保存失败");
						return;
					}
				}
			});
		}
	}
</script>
</head>
<body>
	<div>
		<form id="fm" method="post">
			<table cellspacing="8px;">
				<tr>
					<td>公告标题：</td>
					<td colspan="4"><input type="text" id="title"
						name="noticeManage.title" class="easyui-validatebox" required="true"
						style="width: 300px;" value="${noticeManage.title}" />
					</td>
				</tr>
				<tr>
					<td valign="top">公告内容：</td>
					<td colspan="4"><textarea id="content"
							name="noticeManage.content">${noticeManage.content}</textarea><input
						type="hidden" name="noticeManage.id" value="${noticeManage.id }">
						<input type="button" id="submit" onclick="submitForm();"
						style="display: none;">
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>