<%@page pageEncoding="UTF-8" isELIgnored="false" %>
<script>
    $(function () {
        $("#courseDg").datagrid({

            url:'${pageContext.request.contextPath}/Course/findByPage',
            pagination:true,  //显示分页
            striped:true,
            rowNumbers:true,
            singleSelect:false,
            ctrlSelect:true,
            remoteSort:false,
            multiSort:true,
            columns:[[
                {field:'id',title:'ID',width:100},
                {field:'title',title:'title',width:100},
                {field:'flag',title:'flag',width:100,align:'right'},
                {field:'createDate',title:'createDate',width:100},

                {field:'操作',title:'操作',width:200,formatter:function (value,row,index) {
                        return "<a href='javaScript:;' class='options' onclick=\"deleteCourse('"+row.id+"')\" data-options=\"iconCls:'icon-remove',plain:true\">删除</a>&nbsp;&nbsp"

                    }},
            ]],
            onLoadSuccess:function(){
                $(".options").linkbutton();
            },
            toolbar:'#courseTb',
        })
    })
    /*添加课程*/
    function openAddCourseDialog() {
        $("#addCourse").dialog({
            href:'${pageContext.request.contextPath}/back/course/addCourse.jsp',
            buttons:[{
                text:'保存',
                iconCls:'icon-save',
                handler:function(){
                    //保存一个轮播图
                    $("#addCourseForm").form('submit',{
                        url:'${pageContext.request.contextPath}/Course/save',
                        success:function (result) {
                            var resultObj = $.parseJSON(result);
                            if(resultObj.success){
                                $.messager.show({title:'提示',msg:'添加成功'});
                            }else{
                                $.messager.show({title:'提示',msg:resultObj.message});
                            }
                            //刷新页面
                            $("#courseDg").datagrid('reload');
                            //关闭对话框
                            $("#addCourse").dialog('close');
                        }
                    })
                }
            },{
                text:'关闭',
                iconCls:'icon-cancel',
                handler:function(){
                    $("#addCourse").dialog('close');
                }
            }]
        })
    }

    /*删除功课*/
    function deleteCourse(id) {
       $.messager.confirm('消息提示框','你确定要删除吗？',function (r) {
           $.post(
               "${pageContext.request.contextPath}/Course/delete",
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
           $("#courseDg").datagrid('reload');
       })
    }

</script>
<table id="courseDg" class="easyui-datagrid" data-options="fit:true"></table>
<%--工具按钮--%>
<div id="courseTb">
    <a href="#" class="easyui-linkbutton" onclick="openAddCourseDialog()" data-options="iconCls:'icon-add',plain:true">添加</a>
    <%-- <a href="#" class="easyui-linkbutton"  data-options="iconCls:'icon-remove',plain:true">批量删除</a>--%>
</div>
<%--添加功课对话框--%>
<div id="addCourse" data-options="resizable:true,width:500,height:400,iconCls:'icon-save',title:'添加上师',collapsible:true,minimizable:true,maximizable:true,"></div>
<%--修改上师对话框--%>
<div id="updateGuru" data-options="resizable:true,width:500,height:400,iconCls:'icon-save',title:'修改上师信息',collapsible:true,minimizable:true,maximizable:true,"></div>