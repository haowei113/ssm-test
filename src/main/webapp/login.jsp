<%--
  Created by IntelliJ IDEA.
  User: 28346
  Date: 2024/5/3
  Time: 16:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<% String flag = (String)request.getAttribute("flag"); %>
<script>
    var flag = "<%=flag%>";
    if(flag=="failed")
    window.alert("用户名或密码错误!");
</script>
<form action="login">
    用户名：<input type="text" name="username"><br />
    密码：<input type="text" name="password"><br />
    身份：<select name="identity"><br />
    <option value="manager">系统管理员</option>
    <option value="buyer">买家</option>
    <option value="seller">卖家</option>
</select><br />
    <input type="submit" value="登录">
</form>
</body>
</html>
