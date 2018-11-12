<%@page isELIgnored="false" pageEncoding="UTF-8" contentType="text/html; UTF-8" %>
<script>
    $(function () {
        $("#dg").datagrid({
            url:'${pageContext.request.contextPath}/Banner/findAllBanner',
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
            ctrlSelect:true,
            remoteSort:false,
            multiSort:true,
            columns:[[
                {field:'id',title:'ID',width:100},
                {field:'title',title:'名称',width:100},
                {field:'imgPath',title:'路径',width:100,align:'right'},
                {field:'descs',title:'图片描述',width:100},
                {field:'status',title:'状态',width:100},
                {field:'createDate',title:'创建时间',width:100,},
                {field:'操作',title:'操作',width:200,formatter:function (value,row,index) {
                        console.log(row);
                        return "<a href='javaScript:;' class='options' onclick=\"deleteBanner('"+row.id+"')\" data-options=\"iconCls:'icon-remove',plain:true\">删除</a>&nbsp;&nbsp" +
                            "<a href='javaScript:;' class='options' onclick=\"updateBannerDialog('"+row.id+"')\" data-options=\"iconCls:'icon-edit',plain:true\">修改</a>"
                    }},
            ]],
            onLoadSuccess:function(){
                $(".options").linkbutton();
            },
            toolbar:'#tb',
        })
    })


    //批量删除
    function deleteAll() {
     $.messager.confirm('提示对话框','您确定要删除吗?',function (r) {
         if(r){
             var rows = $("#dg").datagrid('getSelections');

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
                     url:'${pageContext.request.contextPath}/Banner/deleteAll',
                     type:'post',
                     traditional:true,
                     data:{id:ids},
                     success:function (result) {
                         $.messager.show({title:'提示',msg:'删除成功'});
                         //刷新页面
                         $("#dg").datagrid('reload');
                     },
                     error:function (result) {
                         var resultObj = $.parseJSON(result);
                         $.messager.show({title:'提示',msg:resultObj.message});
                         //刷新页面
                         $("#dg").datagrid('reload');

                     }
                 });
             }
         }
     });
    };

    //删除轮播图
   function deleteBanner(id) {
       $.messager.confirm('提示对话框','你确定要删除吗?',function (r) {
           if(r){
               $.post(
                   "${pageContext.request.contextPath}/Banner/delete",
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
               $("#dg").datagrid('reload');
           }
       })

    }
    //修改轮播图
    function updateBannerDialog(id) {
        console.log(id);
        $("#openmotityBanner").dialog({
            href:'${pageContext.request.contextPath}/back/banner/motityBanner.jsp?id='+id,
            buttons:[{
                text:'保存',
                handler:function(){
                    //修改轮播图
                    $("#motityBannerForm").form('submit',{
                        url:'${pageContext.request.contextPath}/Banner/update',
                        success:function (result) {
                            var resultObj = $.parseJSON(result);
                            if(resultObj.success){
                                $.messager.show({title:'标题',msg:'修改成功'});
                            }else{
                                $.messager.show({title:'标题',msg:resultObj.message});
                            }
                            //刷新页面
                            $("#dg").datagrid('reload');
                            //关闭对话框
                            $("#openmotityBanner").dialog('close');
                        }
                    });
                }
            },{
                text:'关闭',
                handler:function(){
                    $("#openmotityBanner").dialog('close');
                }
            }]
        })
    }
    /!*添加轮播图*!/
    function openAddBannerDialog() {
        $("#openAddBanner").dialog({
            href:'${pageContext.request.contextPath}/back/banner/addBanner.jsp',
            buttons:[{
                text:'保存',
                iconCls:'icon-save',
                handler:function(){
                    //保存一个轮播图
                    $("#addBannerForm").form('submit',{
                        url:'${pageContext.request.contextPath}/Banner/save',
                        success:function (result) {
                            var resultObj = $.parseJSON(result);
                            if(resultObj.success){
                                $.messager.show({title:'提示',msg:'添加成功'});
                            }else{
                                $.messager.show({title:'提示',msg:resultObj.message});
                            }
                            //刷新页面
                            $("#dg").datagrid('reload');
                            //关闭对话框
                            $("#openAddBanner").dialog('close');
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
</script>
<table id="dg" class="easyui-datagrid" data-options="fit:true"></table>
<%--工具按钮--%>
<div id="tb">
    <a href="#" class="easyui-linkbutton" onclick="openAddBannerDialog()" data-options="iconCls:'icon-add',plain:true">添加</a>
    <a href="#" class="easyui-linkbutton"  onclick="deleteAll()" data-options="iconCls:'icon-remove',plain:true">批量删除</a>
</div>
<%--添加轮播图对话框--%>
<div id="openAddBanner" data-options="resizable:true,width:500,height:400,iconCls:'icon-save',title:'添加轮播图',collapsible:true,minimizable:true,maximizable:true,"></div>
<%--修改轮播图对话框--%>
<div id="openmotityBanner" data-options="resizable:true,width:500,height:400,iconCls:'icon-save',title:'修改轮播图',collapsible:true,minimizable:true,maximizable:true,"></div>
















