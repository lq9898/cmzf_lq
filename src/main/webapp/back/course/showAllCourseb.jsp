<%@page pageEncoding="UTF-8" isELIgnored="false" %>
<script>
    $(function () {
        $("#courseDG").datagrid({
            url:'${pageContext.request.contextPath}/Course/findAllUserCourse',
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
            ]],
            toolbar:'#courseTB',
        })
    })
</script>
<table id="courseDG" class="easyui-datagrid" data-options="fit:true"></table>
