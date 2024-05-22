<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <link rel="stylesheet" href="../css/css1.css">
    <script src="https://cdn.staticfile.org/vue/2.7.0/vue.min.js"></script>
    <script src="https://unpkg.com/axios/dist/axios.min.js"></script>
</head>
<body>

<div id="app">
    <input type="text" v-model="message">
    <p>{{message}}</p>
</div>
<script>
    new Vue({
        el: '#app',
        data: {
            message: 'Hello Vue.js!'
        },
        mounted()
        {
            axios.get("/t1_war/selectAll").then(result=>{this.message=result.data.data[1].id})
        }

    })
</script>

</body>
</html>
