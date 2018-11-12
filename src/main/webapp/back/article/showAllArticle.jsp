<%@page pageEncoding="UTF-8" isELIgnored="false" %>
<script>
    $(function () {
        $("#articleDg").datagrid({

            url:'${pageContext.request.contextPath}/Article/findAllArticle',
            pagination:true,  //显示分页
            view: detailview,
            detailFormatter: function(rowIndex, rowData){
                return '<table><tr>' +
                    '<td rowspan=2 style="border:0"><img src="${pageContext.request.contextPath}/'+rowData.imgPath+'" style="height:50px;"></td>' +
                    '<td style="border:0">' +
                    '<p>Attribute: ' + rowData.title + '</p>' +
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
                {field:'title',title:'名称',width:100},
                {field:'imgPath',title:'路径',width:100,align:'right'},
                {field:'content',title:'内容',width:100},
                {field:'publishDate',title:'发布时间',width:100,},
                {field:'guru_id',title:'上师ID',width:100,hidden:true},
                {field:'操作',title:'操作',width:200,formatter:function (value,row,index) {
                        return "<a href='javaScript:;' class='options' onclick=\"deleteArticle('"+row.id+"')\" data-options=\"iconCls:'icon-remove',plain:true\">删除</a>"
                    }},
            ]],
            onLoadSuccess:function(){
                $(".options").linkbutton();
            },
            toolbar:'#articleTb',
        })
    })
    //添加文章
    function openAddArticleDialog() {
        $("#addArticle").dialog({
            href:'${pageContext.request.contextPath}/back/article/addArticle.jsp',
            buttons:[{
                text:'保存',
                iconCls:'icon-save',
                handler:function(){
                    //保存一个轮播图
                    $("#addArticleForm").form('submit',{
                        url:'${pageContext.request.contextPath}/Article/save',
                        success:function (result) {
                            var resultObj = $.parseJSON(result);
                            if(resultObj.success){
                                $.messager.show({title:'提示',msg:'添加成功'});
                            }else{
                                $.messager.show({title:'提示',msg:resultObj.message});
                            }
                            //刷新页面
                            $("#articleDg").datagrid('reload');
                            //关闭对话框
                            $("#addArticle").dialog('close');
                        }
                    })
                }
            },{
                text:'关闭',
                iconCls:'icon-cancel',
                handler:function(){
                    $("#addArticle").dialog('close');
                }
            }]
        })
    }
    //删除文章
    function deleteArticle(id) {
        $.messager.confirm('提示对话框','您确定要删除吗?',function (r) {
            if(r){
                $.post(
                    "${pageContext.request.contextPath}/Article/delete",
                    "id="+id,
                    function (result) {
                        //var resultObj = $.parseJSON(result);
                        if(result.success){
                            $.messager.show({title:'提示',msg:'删除成功'});
                        }else{
                            $.messager.show({title:'提示',msg:result.message});
                        }
                    }
                )
                //刷新页面
                $("#articleDg").datagrid('reload');
            }

        })
    }
    //修改文章信息
    function updateArticleDialog() {
        $("#updateArticle").dialog({
            href:'${pageContext.request.contextPath}/back/article/motityArticle.jsp?id='+id,
            buttons:[{
                text:'保存',
                handler:function(){
                    //修改轮播图
                    $("#motityArticleForm").form('submit',{
                        url:'${pageContext.request.contextPath}/Article/update',
                        success:function (result) {
                            var resultObj = $.parseJSON(result);
                            if(resultObj.success){
                                $.messager.show({title:'标题',msg:'修改成功'});
                            }else{
                                $.messager.show({title:'标题',msg:resultObj.message});
                            }
                            //刷新页面
                            $("#articleDg").datagrid('reload');
                            //关闭对话框
                            $("#updateArticle").dialog('close');
                        }

                    });
                }
            },{
                text:'关闭',
                handler:function(){
                    $("#updateArticle").dialog('close');
                }
            }]
        })
    }

    //批量删除
    function deleteAllArticle() {
        $.messager.confirm('提示对话框','您确定要删除吗?',function (r) {
            if(r){
                var rows = $("#articleDg").datagrid('getSelections');
                if(rows.length<=0){
                    $.messager.show({title:'提示',msg:'请至少选择1行'});
                }
                else{
                    var ids=[];
                    for (var i = 0; i < rows.length; i++) {
                        ids.push(rows[i].id);
                    }
                    /*发送ajax请求到服务器*/
                    $.ajax({
                        url:'${pageContext.request.contextPath}/Article/deleteAll',
                        type:'post',
                        traditional:true,
                        data:{id:ids},
                        success:function (result) {
                            $.messager.show({title:'提示',msg:'删除成功'});
                            //刷新页面
                            $("#articleDg").datagrid('reload');
                        },
                        error:function (result) {
                            var resultObj = $.parseJSON(result);
                            $.messager.show({title:'提示',msg:resultObj.message});
                            //刷新页面
                            $("#articleDg").datagrid('reload');

                        }
                    });
                }
            }
        });
    };

</script>



<table id="articleDg" class="easyui-datagrid" data-options="fit:true"></table>
<%--工具按钮--%>
<div id="articleTb">
    <a href="#" class="easyui-linkbutton" onclick="openAddArticleDialog()" data-options="iconCls:'icon-add',plain:true">添加</a>
    <a href="#" class="easyui-linkbutton"  onclick="deleteAllArticle()" data-options="iconCls:'icon-remove',plain:true">批量删除</a>
</div>
<%--添加文章对话框--%>
<div id="addArticle" data-options="resizable:true,width:500,height:400,iconCls:'icon-save',title:'添加文章',collapsible:true,minimizable:true,maximizable:true,"></div>
<%--修改文章对话框--%>
<div id="updateArticle" data-options="resizable:true,width:500,height:400,iconCls:'icon-save',title:'修改文章信息',collapsible:true,minimizable:true,maximizable:true,"></div>