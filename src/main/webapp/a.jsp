<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <!-- import CSS -->
  <link rel="stylesheet" href="https://unpkg.com/element-ui/lib/theme-chalk/index.css">
</head>
<body>

<div id="app">
  <div id="d1">{{asd.message}}</div>
  <form>
    <input type="text" v-model="asd.message">
    <input type="text" v-model="asd.message2">
  </form>
</div>
</body>

<!-- import Vue before Element -->
<script src="https://unpkg.com/vue@2/dist/vue.js"></script>
<!-- import JavaScript -->
<script src="https://unpkg.com/element-ui/lib/index.js"></script>
<script>
  new Vue({
    el: '#app',
    data:function(){
      return{
        asd:{
          message:111,
          message2:222,
          timer:null,// 延时器
        },
        bookList:[
          {id:0,name:"book1",num:1},
          {id:1,name:"book2",num:2},
          {id:2,name:"book3",num:3},
        ]
      }
    },
    // computed: {
    //   computeAll(){
    //     var all=0;
    //     for(var item of this.bookList)
    //     {
    //       all+=item.num;
    //     }
    //     return all;
    //   }
    // },
    watch:{
      // asd:{
      //   deep:true,
      //   immediate:true,
      //   handler(newValue){
      //     clearTimeout(this.timer)
      //       this.timer=setTimeout(()=>{
      //         alert(newValue.message)
      //       },1000);
      //   }
      // },

    },
    methods:{
      f1:function(a)
      {
        this.bookList = this.bookList.filter(item => item.id !== a);
      }
    },

    beforeUpdate()
    {
      alert(document.getElementById("d1").innerHTML)
    },

    // Updated()
    // {
    //   alert(this.asd.message)
    // }
  })
</script>
</html>
