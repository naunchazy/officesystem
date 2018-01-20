<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>办公自动化管理系统</title>
		<link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet" type="text/css" />
		<script>
		/*function setit(id)
			{
				 document.forms[0].submit();  
			}*/
			/* function toUpdateUser(id){
				var form=document.getElementById("updateUser"+id);
				form.submit();
				location.href="${pageContext.request.contextPath}/user/toUpdateUser.do/"+id;
			} */
			function toUpdateUser(){
			location.href="${pageContext.request.contextPath}/user/toUpdateUser.do";
			}
		</script>
	</head>
	
	<body>
		<div class="top">
			<div class="global-width">
				<img src="${pageContext.request.contextPath}/Images/logo.gif" class="logo" />
			</div>
		</div>
		<div class="status">
			<div class="global-width">
				${sessionUser.username }，你好！欢迎访问办公管理系统！
				<a style="float:right" href="#" onclick="location.href='loginOut.action'";>注销</a>
			</div>
		</div>
		<!-- <form id="myForm" name="myForm" action="user/toEditUserInfo.do" method="post"> -->
		<input type="hidden" name="u.id" value="26"/>
		<input type="hidden" name="u.sex" value="2" id="u_sex"/>
		<input type="hidden" name="u.supper" value="0" id="u_supper"/>
		<div class="main">
			<div class="global-width">
				
 
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>办公自动化管理系统</title>
		<link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet" type="text/css" />
	</head>
  
  <body>
    <div class="nav" id="nav">
		<div class="t"></div>
			<dl>
				<dt onclick="this.parentNode.className=this.parentNode.className=='open'?'':'open';">
					信息管理 
				</dt>
				<dd>
					<a target="_self">个人信息</a>
				</dd>
			</dl>
			<dl>
				<dt onclick="this.parentNode.className=this.parentNode.className=='open'?'':'open';">
					邮件管理
				</dt>
				<dd>
					<a href="mailWrite.action" target="_self">写邮件</a>
				</dd>
				<dd>
					<a href="mailReceive!receive.action" target="_self">收邮件</a>
				</dd>
				<dd>
					<a href="mailGarage!garage.action" target="_self">垃圾邮件</a>
				</dd>
			</dl>
			<dl>
				<dt onclick="this.parentNode.className=this.parentNode.className=='open'?'':'open';">
					考勤管理
				</dt>
				<dd>
					<a href="leave.action" target="_self">休假</a>
				</dd>
			</dl>
					
			<dl >
				<dt onclick="this.parentNode.className=this.parentNode.className=='open'?'':'open';">
					权限管理
				</dt>
				<dd>
					<a href="userInfo!singleAccountData.action" target="_self">个人账户</a>
				</dd>
			</dl>
		</div>
  </body>
</html>
 
		<div class="action">
					<div class="t">
						个人信息
					</div>
					<div class="pages">
						<table width="90%" border="0" cellspacing="0" cellpadding="0">
							<tr >
								<td align="right" width="30%">用户名：</td><td  align="left"><input type="text" name="u.nickname" value="${sessionUser.username}" readonly="readonly" id="nickname"/></td>
							</tr>
							<tr >
								<td align="right" width="30%">年龄：</td>
								<td  align="left">
									<input type="text" name="u.age" value="${sessionUser.age}" readonly="readonly" id="age"/>
								</td>
							</tr>
							<tr >
								<td align="right" width="30%">性别：</td>
								<td  align="left">
									<c:if test="${sessionUser.gender==0}">
										<input type="text" name="gender" id="gender" value="男" readonly="readonly" id=""/>
									</c:if>
									<c:if test="${sessionUser.gender==1}">
										<input type="text" name="gender" id="gender" value="女" readonly="readonly" id=""/>
									</c:if>
								</td>
							</tr>
							<tr >
								<td align="right" width="30%">手机：</td><td  align="left"><input type="text" name="u.mobile" value="${sessionUser.phone}" readonly="readonly" id="u_mobile"/></td>
							</tr>
							<tr >
								<td align="right" width="30%">地址：</td><td  align="left"><input type="text" name="u.address" value="${sessionUser.address}" readonly="readonly" id="u_address"/></td>
							</tr>
							<tr >
								<%-- <td align="center" colspan="2"><br/><input type="button"  id="save" value="编辑数据" onclick="setit(${sessionUser.id})" /></td> --%>
								<td align="center" colspan="2"><br/>
									<%-- <input type="button"  id="update" value="编辑数据" onclick="updateUser(${sessionUser.id})" /> --%>
									<%-- <input type="button" value="编辑数据" onclick="toUpdateUser(${sessionUser.id})" /> --%>
									<input type="button" value="编辑数据" onclick="toUpdateUser()" />
									<%-- <form action="user/toEditUserInfo.do/${sessionUser.id}" method="post" id="updateUser${sessionUser.id}">
										<input type="hidden" name="_method" value="PUT"/>
									</form> --%>
								</td>
							</tr>
								
						</table>
								
					</div>
				</div>
			</div>
		</div>
		<!-- </form> -->
		<div class="copyright">
			Copyright &nbsp; &copy;版权所有 &nbsp; 
		</div>
 
	</body>
</html>