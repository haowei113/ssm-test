<%@ page import="pojo.User" %><%--
  Created by IntelliJ IDEA.
  User: 28346
  Date: 2024/5/3
  Time: 19:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="https://unpkg.com/element-ui/lib/theme-chalk/index.css">
    <script src="https://cdn.staticfile.org/vue/2.7.0/vue.min.js"></script>
    <script src="https://unpkg.com/axios/dist/axios.min.js"></script>
    <script src="https://unpkg.com/element-ui/lib/index.js"></script>

</head>
<body>
<% User user = (User)request.getAttribute("inf"); %>
<div id="d1">
    <el-container style=" border: 1px solid #eee">
        <el-aside width="200px" style="background-color: rgb(255,255,255)">
            <el-menu>
                <el-menu-item index="1" v-on:click="shows1()">信息管理</el-menu-item>
                <el-menu-item index="2" v-on:click="shows2()">商品管理</el-menu-item>
                <el-menu-item index="3" v-on:click="shows3()">订单管理</el-menu-item>
            </el-menu>
        </el-aside>
        <el-main>
            <span id="s1" style="display: block">
                <el-form label-width="80px">
                    <el-form-item label="用户名">
                        <el-input v-model="informationForm.username"></el-input>
                    </el-form-item>
                    <el-form-item label="密码">
                        <el-input v-model="informationForm.password"></el-input>
                    </el-form-item>

                     <el-form-item>
                         <el-button type="primary" v-on:click="updateinformation()">确认修改</el-button>
                     </el-form-item>
                </el-form>
            </span>
            <span id="s2" style="display: none">
                <el-button type="primary" @click="productDialogVisible = true">添加商品</el-button>
                <el-dialog title="新增商品" :visible.sync="productDialogVisible" width="30%" >
                    <el-form>
                        <el-form-item label="商品名称">
                            <el-input v-model="productForm.name"></el-input>
                        </el-form-item>
                        <el-form-item label="商品描述">
                            <el-input v-model="productForm.description"></el-input>
                        </el-form-item>
                    </el-form>

                    <span slot="footer" class="dialog-footer">
                        <el-button @click="productDialogVisible = false">取 消</el-button>
                        <el-button type="primary" @click="addProduct();sizeAndCurrentChange()">确 定</el-button>
                    </span>
                </el-dialog>

                <el-table :data="productTable" border style="width: 100%">
                    <el-table-column prop="productName" label="商品名" width="150"></el-table-column>
                    <el-table-column prop="description" label="商品描述" width="120"></el-table-column>

                    <el-table-column fixed="right" label="操作" width="200">
                        <template slot-scope="scope">
                            <el-button type="text" size="small">查看</el-button>
                            <el-button type="text" size="small">编辑</el-button>
                            <el-button type="text" size="small">删除</el-button>
                        </template>
                    </el-table-column>
                </el-table>

                <el-pagination
                        @size-change="sizeAndCurrentChange" @current-change="sizeAndCurrentChange"
                        :current-page.sync="productPage.currentPage" :page-size.sync="productPage.pageSize" :page-sizes="[10, 20, 30, 40]"
                        layout="total,sizes, prev, pager, next" :total.sync="productPage.total">
                </el-pagination>
            </span>
            <span id="s3" style="display: none">
                3
            </span>
        </el-main>
    </el-container>
</div>
</body>
<script>
    new Vue({
        el:"#d1",
        data:
        {
            ifSuccess:1,
            productDialogVisible:false,
            user:{
                username:"",
                password:"",
            },
            informationForm:{
                username:"1",
                password:"1",
            },
            productForm:{
                name:"",
                description:"",
            },
            productPage:{
                currentPage:1,
                pageSize:20,
                total:1000,
            },
            productTable:[{productName:"www",description:"好"},{productName:"qqq",description:"不好"}],
        },
        methods: {
            hideAll: function () {
                document.getElementById("s1").style.display = "none";
                document.getElementById("s2").style.display = "none";
                document.getElementById("s3").style.display = "none";
            },
            shows1: function () {
                this.hideAll();
                document.getElementById("s1").style.display = "block";
            },
            shows2: function () {
                this.hideAll();
                document.getElementById("s2").style.display = "block";
            },
            shows3: function () {
                this.hideAll();
                document.getElementById("s3").style.display = "block";
            },
            updateinformation: function () {
                axios.get("updateinformation/" + this.informationForm.username + "/" + this.informationForm.password
                    + "/" + this.user.username).then(result => {
                    this.ifSuccess = result.data;
                    if (this.ifSuccess === 0) {
                        this.$message('用户名重复！');
                    } else {
                        this.$message('修改成功！');
                        this.user.username = this.informationForm.username;
                        this.user.password = this.informationForm.password;
                    }
                    this.ifSuccess = 1;
                });
            },
            addProduct: function () {
                axios.get("seller/addProduct/" + this.productForm.name + "/" + this.user.username + "/" + this.productForm.description).then(result => {
                    if (result.data === 0) {
                        this.$message('添加失败！');
                    }
                    else
                    {
                        this.$message('添加成功！');
                    }
                    this.productDialogVisible = false;
                    this.productForm.name="";
                    this.productForm.description="";
                });
            },

            sizeAndCurrentChange:function(){
                axios.get("seller/selectProductBySeller/" + this.user.username + "/" + this.productPage.currentPage + "/" + this.productPage.pageSize).then(result => {
                    this.productTable=result.data.rows;
                    this.productPage.total=result.data.total;
                });
            },

        },
        mounted()
        {
            this.informationForm.username="<%=user.getUsername()%>";
            this.informationForm.password="<%=user.getPassword()%>";
            this.user.username="<%=user.getUsername()%>";
            this.user.password="<%=user.getPassword()%>"
            axios.get("seller/selectProductBySeller/" + this.user.username + "/" + this.productPage.currentPage + "/" + this.productPage.pageSize).then(result => {
                this.productTable=result.data.rows;
                this.productPage.total=result.data.total;
            });
        }
    })
</script>
</html>
