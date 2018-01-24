<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>账户管理列表</title>
<link href="${pageContext.request.contextPath}/css/style.css"
	rel="stylesheet" type="text/css" />
<script>
		window.onload=function(){
			 var tbl = document.getElementById("tbody");
			 var trs = tbl.getElementsByTagName("tr");
			 for (var i = 0; i < trs.length; i++){
				  var j = i + 1;
				  if (j % 2 != 0) { //偶数行
					  trs[i].style.background = "#ccc";
				  }
			}
		}

		function deleteAccount(id){
			var result = confirm("确实删除该账户？");
			if(result){
				var form=document.getElementById("deleteAccount"+id);
				form.submit();
			}
		}
		function toModifyAccount(id){
				var form=document.getElementById("toModifyAccount"+id);
				form.submit();
		}
</script>
</head>
<body>
	<!-- top.jsp -->
	<jsp:include page="top.jsp"></jsp:include>

	<div class="main">
		<div class="global-width">
		
			<!-- left.jsp -->
			<jsp:include page="left.jsp"></jsp:include>
			
			<div class="action">
				<div class="t">账户管理列表</div>
				<div class="pages">
					<table width="90%" border="0" cellspacing="0" cellpadding="0">
						<thead>
						<tr>
							<th>工&nbsp;号</th>
							<th>用户名</th>
							<th>手&nbsp;机</th>
							<th>地&nbsp;址</th>
							<th>操&nbsp;作</th>
						</tr>
						</thead>
						<tbody id="tbody">
						<c:forEach items="${listUsers }" var="user">
								<tr align="center">
									<td>${user.id }</td>
									<td>${user.username }</td>
									<td>${user.phone }</td>
									<td>${user.address }</td>
									<td>
										<a href="javascript:void(0)" onclick="toModifyAccount(${user.id})">修改</a>
										<form  style="display: inline" action="${pageContext.request.contextPath }/user/toModifyAccount/${user.id}" 
										method="post" id="toModifyAccount${user.id}">
											<input type="hidden" name="_method" value="PUT" />
										</form>
										<font>|</font>
										<!-- <br style="height:1px"/> -->
										<a href="javascript:void(0)" onclick="deleteAccount(${user.id})">删除</a>
										<form  style="display: inline" action="${pageContext.request.contextPath }/user/deleteAccount/${user.id}" 
										method="post" id="deleteAccount${user.id}">
											<input type="hidden" name="_method" value="DELETE" />
										</form>
									</td>
								</tr>
						</c:forEach>
						</tbody>
						<tr>
							<td align="left" colspan="5"><br/>
								<input type="button"  id="save" value="添加数据" onclick="location.href='${pageContext.request.contextPath}/user/toInsertAccount.do'" />
							</td>
						</tr>

					</table>
				</div>
			</div>
		</div>
	</div>
	<!-- </form> -->
	<div class="copyright">Copyright &nbsp; &copy;版权所有 &nbsp;</div>

</body>
</html>