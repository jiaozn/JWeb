<%@ page language="java" import="java.util.*,com.jjweb.model.User" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
   <base href="<%=basePath%>">
    <script src="ckeditor/ckeditor.js"></script>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<title>Hello,world</title>
  </head>
  
  <body>
   <jsp:include page="main_head.jsp"></jsp:include>
   <p>

   <h3>Hello,World!<br>
   <s:property value="introduction.content" escape="false"/></h3><br>
   <h4>Yours,Jiao<br></h4>
  <s:property value="introduction.time"/><br>

  <%! int au; %>
<%
			User userx= (User)session.getAttribute("userx") ;
	if (userx==null){
			userx=new User();
			userx.setAuthority(0);
			userx.setId(0);
			userx.setName("游客");
			au=0;
			session.setAttribute("userx", userx);
			}
	else{
	au=userx.getAuthority();}
			//游客0，登陆3，管理7
				%>
  <%if(au==7){ %>
   <a href="introduction_edit" >【编辑】</a><br>
   <%} %>
   
    网站人气：<s:property value="sessionRecord"/><br>
   
   
   <hr>
 <h5>留言板：</h5><br>
 
 
 <form action="comments_addCommit" name="commentsForm" method="post" role="form" >
<div class="form-group">
   <textarea id="editor1" name="comments.content" class="form-control" rows="3" ></textarea>
   <script>
                // Replace the <textarea id="editor1"> with a CKEditor
                // instance, using default configuration.
                CKEDITOR.replace( 'editor1' );
            </script>
   </div>
   <input type="hidden" name="comments.articalid" value="0"/>
   <input type="hidden" name="comments.userid" value="<s:property value="#session.userx.id"/>"/>
     <input type="hidden" name="commentsFrom" value="introductionPage"/>
   <input type="submit" class="btn btn-default"/> 
   </form>
  
 <br>
  
 
<br>
<table class="table">

		
	<s:iterator value="listCommentsDTO" var="art">
		<tr>
		<s:property value="#art.id"/>楼：<s:property value="#art.user.name"/>	对	<s:property value="#art.artical.title"/>	评论道：<br>
		<br>
		<s:property value="#art.content" escape="false"/>
		<br>
		<s:property value="#art.time"/>		--------	<br><br><br>
		<%if(au==7){%>
		<a href="comments_edit?commentsDTO.id=<s:property value="#art.id"/>">修改   </a>
		<a href="comments_delete?commentsDTO.id=<s:property value="#art.id"/>">删除   </a>
		<%} %>
		</tr>
		<br>
	</s:iterator>
	</table>
   
   
   
   
   
   <jsp:include page="main_foot.jsp"></jsp:include>
    <%--<s:property value="#session.userx.id"/>
  --%></body>
</html>
