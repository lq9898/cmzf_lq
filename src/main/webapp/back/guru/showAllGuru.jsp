<%@page pageEncoding="UTF-8" isELIgnored="false" %>
     <script>
         $(function () {
             $("#guruDg").datagrid({

                 url:'${pageContext.request.contextPath}/Guru/findAllGuru',
                 pagination:true,  //显示分页
                 view: detailview,
                 detailFormatter: function(rowIndex, rowData){
                     return '<table><tr>' +
                         '<td rowspan=2 style="border:0"><img src="${pageContext.request.contextPath}/'+rowData.headPic+'" style="height:50px;"></td>' +
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
                     {field:'name',title:'名称',width:100},
                     {field:'headPic',title:'头像',width:100,align:'right'},
                     {field:'sex',title:'性别',width:100},

                     {field:'操作',title:'操作',width:200,formatter:function (value,row,index) {
                             return "<a href='javaScript:;' class='options' onclick=\"deleteGuru('"+row.id+"')\" data-options=\"iconCls:'icon-remove',plain:true\">删除</a>&nbsp;&nbsp"

                         }},
                 ]],
                 onLoadSuccess:function(){
                     $(".options").linkbutton();
                 },
                 toolbar:'#guruTb',
             })
         })
         /*添加上师*/
       function openAddGuruDialog() {
           $("#addGuru").dialog({
               href:'${pageContext.request.contextPath}/back/guru/addGuru.jsp',
               buttons:[{
                   text:'保存',
                   iconCls:'icon-save',
                   handler:function(){
                       //保存一个轮播图
                       $("#addGuruForm").form('submit',{
                           url:'${pageContext.request.contextPath}/Guru/save',
                           success:function (result) {
                               var resultObj = $.parseJSON(result);
                               if(resultObj.success){
                                   $.messager.show({title:'提示',msg:'添加成功'});
                               }else{
                                   $.messager.show({title:'提示',msg:resultObj.message});
                               }
                               //刷新页面
                               $("#guruDg").datagrid('reload');
                               //关闭对话框
                               $("#addGuru").dialog('close');
                           }
                       })
                   }
               },{
                   text:'关闭',
                   iconCls:'icon-cancel',
                   handler:function(){
                       $("#addGuru").dialog('close');
                   }
               }]
           })
       }

       /*删除上师*/
         function deleteGuru(id) {
             $.messager.confirm('消息提示框','您确定要删除吗?',function (r) {
                 if(r){
                     $.post(
                         "${pageContext.request.contextPath}/Guru/delete",
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
                    // $("#guruDg").datagrid('reload');
                     $("#guruDg").datagrid('reload',true);
                 }
             })
         }





         //批量删除
         function deleteAllGuru() {
             $.messager.confirm('提示对话框','您确定要删除吗?',function (r) {
                 if(r){
                     var rows = $("#guruDg").datagrid('getSelections');
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
                             url:'${pageContext.request.contextPath}/Guru/deleteAll',
                             type:'post',
                             traditional:true,
                             data:{id:ids},
                             success:function (result) {
                                 $.messager.show({title:'提示',msg:'删除成功'});
                                 //刷新页面
                                 $("#guruDg").datagrid('reload');
                             },
                             error:function (result) {
                                 var resultObj = $.parseJSON(result);
                                 $.messager.show({title:'提示',msg:resultObj.message});
                                 //刷新页面
                                 $("#guruDg").datagrid('reload');

                             }
                         });
                     }
                 }
             });
         };

     </script>
<table id="guruDg" class="easyui-datagrid" data-options="fit:true"></table>
    <%--工具按钮--%>
    <div id="guruTb">
        <a href="#" class="easyui-linkbutton" onclick="openAddGuruDialog()" data-options="iconCls:'icon-add',plain:true">添加</a>
        <a href="#" class="easyui-linkbutton" onclick="deleteAllGuru()" data-options="iconCls:'icon-remove',plain:true">批量删除</a>
    </div>
    <%--添加上师对话框--%>
    <div id="addGuru" data-options="resizable:true,width:500,height:400,iconCls:'icon-save',title:'添加上师',collapsible:true,minimizable:true,maximizable:true,"></div>
    <%--修改上师对话框--%>
    <div id="updateGuru" data-options="resizable:true,width:500,height:400,iconCls:'icon-save',title:'修改上师信息',collapsible:true,minimizable:true,maximizable:true,"></div>