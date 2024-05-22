<%--
  Created by IntelliJ IDEA.
  User: 28346
  Date: 2024/2/24
  Time: 21:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <script src="https://cdn.staticfile.org/vue/2.7.0/vue.min.js"></script>
    <link rel="stylesheet" href="https://unpkg.com/element-ui/lib/theme-chalk/index.css">
    <script src="https://unpkg.com/element-ui/lib/index.js"></script>
    <script src="https://unpkg.com/axios/dist/axios.min.js"></script>
</head>
<body>
<div id="app">
    {{message}}
</div>

<script>
    new Vue({
        el: '#app',
        data:{
            message: 'Hello Vue.js!'
        },
        mounted()
        {
            axios.get("/t1_war/getlist").then(result=>{document.write(result.data)})
        }
    })
</script>

</body>
</html>
