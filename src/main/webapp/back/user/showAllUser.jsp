<%@page isELIgnored="false" pageEncoding="UTF-8" contentType="text/html; UTF-8" %>
<script>
    $(function () {
        $("#userDg").datagrid({

            url:'${pageContext.request.contextPath}/User/findByPage',
            pagination:true,  //显示分页
            view: detailview,
            detailFormatter: function(rowIndex, rowData){
                return '<table><tr>' +
                    '<td rowspan=2 style="border:0"><img src="${pageContext.request.contextPath}/'+rowData.headPic+'" style="height:50px;"></td>' +
                    '<td style="border:0">' +
                    '<p>Attribute: ' + rowData.username + '</p>' +
                    '<p>Status: ' + rowData.status + '</p>' +
                    '</td>' +
                    '</tr></table>';
            },
            striped:true,
            rowNumbers:true,
            singleSelect:false,
            ctrlSelect:true,
            remoteSort:false,
            multiSort:true,
            columns:[[
                {field:'id',title:'ID',width:100},
                {field:'username',title:'username',width:100},
                {field:'phoneNum',title:'phoneNum',width:100,align:'right'},
                {field:'password',title:'password',width:100},
                {field:'nickName',title:'nickName',width:100,},
                {field:'headPic',title:'headPic',width:100,},
                {field:'sex',title:'sex',width:100},
                {field:'sign',title:'sign',width:100,},
                {field:'salt',title:'salt',width:100,},
                {field:'province',title:'province',width:100,},
                {field:'city',title:'city',width:100,},
                {field:'status',title:'status',width:100,},
                {field:'date',title:'date',width:100,},
                {field:'操作',title:'操作',width:200,formatter:function (value,row,index) {
                        return "<a href='javaScript:;' class='options' onclick=\"motityStatusUserDialog('"+row.id+"')\" data-options=\"iconCls:'icon-remove',plain:true\">修改</a>"
                            /*"<a href='javaScript:;' class='options' onclick=\"deleteUser('"+row.id+"')\" data-options=\"iconCls:'icon-edit',plain:true\">删除</a>"*/
                    }},
            ]],
            onLoadSuccess:function(){
                $(".options").linkbutton();
            },
          /*  toolbar:'#usertb',*/
        })
    })
   //删除用户
  /* function deleteUser(id) {
        $.post(
            "${pageContext.request.contextPath}/User/delete",
            "id="+id,
            function (result) {
                //var resultObj = $.parseJSON(result);
                var json = $.parseJSON(result);
                console.log(json);
                if(result.success){
                    $.messager.show({title:'提示',msg:'删除成功'});

                }else{
                    $.messager.show({title:'提示',msg:result.message});
                }
            }
        )
        //刷新页面
        $("#userDg").datagrid('reload');
    }*/
     //修改用户状态
    function motityStatusUserDialog(id) {

        $("#openMotityUser").dialog({
            href:'${pageContext.request.contextPath}/back/user/motityStatusUser.jsp?id='+id,
            buttons:[{
                text:'保存',
                handler:function(){
                    //修改用户状态
                    $("#motityStatusUserForm").form('submit',{
                        url:'${pageContext.request.contextPath}/User/motityStatus',
                        success:function (result) {
                            var resultObj = $.parseJSON(result);
                            if(resultObj.success){
                                $.messager.show({title:'标题',msg:'修改成功'});
                            }else{
                                $.messager.show({title:'标题',msg:resultObj.message});
                            }
                            //刷新页面
                            $("#userDg").datagrid('reload');
                            //关闭对话框
                            $("#openMotityUser").dialog('close');
                        }
                    });
                }
            },{
                text:'关闭',
                handler:function(){
                    $("#openMotityUser").dialog('close');
                }
            }]
        })
    }
   //添加轮播图
    function openAddUserDialog() {
        $("#openAddUser").dialog({
            href:'${pageContext.request.contextPath}/back/user/addUser.jsp',
            buttons:[{
                text:'保存',
                iconCls:'icon-save',
                handler:function(){
                    //保存一个轮播图
                    $("#addUserForm").form('submit',{
                        url:'${pageContext.request.contextPath}/User/register',
                        success:function (result) {
                            var resultObj = $.parseJSON(result);
                            if(resultObj.success){
                                $.messager.show({title:'提示',msg:'添加成功'});
                            }else{
                                $.messager.show({title:'提示',msg:resultObj.message});
                            }
                            //刷新页面
                            $("#userDg").datagrid('reload');
                            //关闭对话框
                            $("#openAddUser").dialog('close');
                        }
                    })
                }
            },{
                text:'关闭',
                iconCls:'icon-cancel',
                handler:function(){
                    $("#openAddBanner").dialog('close');
                }
            }]
        })
    }
    //用户登录
    /*function openLoginDialog() {
        $("#openLoginUser").dialog({
            href:'${pageContext.request.contextPath}/back/user/login.jsp',
            buttons:[{
                text:'登录',
                iconCls:'icon-save',
                handler:function(){
                    //用户登录
                    $("#loginUserForm").form('submit',{
                        url:'${pageContext.request.contextPath}/User/login',
                        success:function (result) {
                            var resultObj = $.parseJSON(result);
                            console.log(resultObj);
                            if(resultObj=="1"){
                                $.messager.show({title:'提示',msg:'该用户不存在,请重新输入'});
                            }else if(resultObj=="2"){
                               $.messager.show({title:'提示',msg:'该账号已被冻结'});
                            }else if(resultObj=="3"){
                                $.messager.show({title:'提示',msg:'登录成功'});
                            }else{
                                $.messager.show({title:'提示',msg:"登录失败"});
                            }
                            //刷新页面
                            $("#userDg").datagrid('reload');
                            //关闭对话框
                            $("#openLoginUser").dialog('close');
                        }
                    })
                }
            },{
                text:'关闭',
                iconCls:'icon-cancel',
                handler:function(){
                    $("#openLoginUser").dialog('close');
                }
            }]

        })
    }*/
</script>
<table id="userDg" class="easyui-datagrid" data-options="fit:true"></table>
<%--工具按钮--%>
<%--<div id="usertb">
    <a href="#" class="easyui-linkbutton" onclick="openAddUserDialog()" data-options="iconCls:'icon-add',plain:true">添加</a>
    <a href="#" class="easyui-linkbutton"  data-options="iconCls:'icon-remove',plain:true">批量删除</a>
    <a href="#" class="easyui-linkbutton"  onclick="openLoginDialog()" data-options="iconCls:'icon-remove',plain:true">登录</a>
</div>--%>
<%--添加用户对话框--%>
<div id="openAddUser" data-options="resizable:true,width:500,height:600,iconCls:'icon-save',title:'添加用户',collapsible:true,minimizable:true,maximizable:true,"></div>
<%--修改用户对话框--%>
<div id="openMotityUser" data-options="resizable:true,width:500,height:400,iconCls:'icon-save',title:'修改用户状态',collapsible:true,minimizable:true,maximizable:true,"></div>
<div id="openLoginUser" data-options="resizable:true,width:500,height:400,iconCls:'icon-save',title:'用户登录+',collapsible:true,minimizable:true,maximizable:true,"></div>
















