<%@page isELIgnored="false" pageEncoding="UTF-8" %>
<script>
   $(function () {
       $("#albumTg").treegrid({
           url:'${pageContext.request.contextPath}/Album/findAllAlbum',
           idField:'id',
           treeField:'title',
           fit:true,
           fitColumns:true,
           singleSelect:true,
           toolbar:'#albumTb',
           columns:[[
               {field:'id',title:'ID',},
               {field:'title',title:'title',},
               {field:'downPath',title:'downPath',},
               {field:'size',title:'size',},
               {field:'duration',title:'duration',}

           ]],
       });
   })
    //添加专辑
    function addAlbumDialog() {
        $("#openAlbumAdd").dialog({
            href:'${pageContext.request.contextPath}/back/album/addAlbum.jsp',
            buttons:[{
                text:'保存',
                iconCls:'icon-save',
                handler:function(){
                    $('#addAlbumForm').form('submit',{
                        url:'${pageContext.request.contextPath}/Album/save',
                        success:function (result) {
                            var resultObj = $.parseJSON(result);
                            if(resultObj.success){
                                $.messager.show({title:'提示',msg:'添加成功'});

                            }else{
                                $.messager.show({title:'提示',msg:resultObj.message});
                            }
                            //刷新页面
                            $("#albumTg").treegrid('reload');
                            //关闭对话框
                            $("#openAlbumAdd").dialog('close');
                        }
                    });
                }
            },{
                text:'关闭',
                iconCls:'icon-cancel',
                handler:function(){
                    $("#openAlbumAdd").dialog('close');
                }
            }]
        })
    }
    //专辑详情
    function albumDetails() {
        var album = $("#albumTg").treegrid('getSelected');
        console.log(album);
        if(album==null || album.size!=null){
               $.messager.show({title:'提示',msg:'请选择1行专辑'});
           }else{
                   $("#openAlbum").dialog({
                       href:'${pageContext.request.contextPath}/back/album/albumDetails.jsp?id='+album.id+'&img='+album.coverImg,
                   });
           }
    }






       //添加章节
    function addChapterDialog() {
       $("#openChapterAdd").dialog({
           href:'${pageContext.request.contextPath}/back/album/addChapter.jsp',
           buttons:[{
               text:'保存',
               iconCls:'icon-save',
               handler:function(){
                   $('#addChapterForm').form('submit',{
                       url:'${pageContext.request.contextPath}/Chapter/save',
                       success:function (result) {
                           var resultObj = $.parseJSON(result);
                           if(resultObj.success){
                               $.messager.show({title:'提示',msg:'添加成功'});

                           }else{
                               $.messager.show({title:'提示',msg:resultObj.message});
                           }
                           //刷新页面
                           $("#albumTg").treegrid('reload');
                           //关闭对话框
                           $("#openChapterAdd").dialog('close');
                       },
                   });
               }
           },{
               text:'关闭',
               iconCls:'icon-cancel',
               handler:function(){
                   $("#openChapterAdd").dialog('close');
               }
           }]
       })
    }
    //下载音频
    function openLoadRadioDialog() {
       var album = $("#albumTg").datagrid('getSelected');
            if(album.downPath!=null){
                $("#openloadRadio").dialog({
                    href:'${pageContext.request.contextPath}/back/album/loadRadio.jsp?downPath='+album.downPath,
                })
            }else{
                $.messager.show({
                    title:"温馨提示！",
                    msg:"请选择章节下载！"

                })
            }

    }
</script>
<table id="albumTg"></table>
<%--定义工具按钮--%>
<div id="albumTb">
    <a href="#" class="easyui-linkbutton" onclick="albumDetails()" data-options="iconCls:'icon-edit',plain:true">专辑详情</a>
    <a href="#" class="easyui-linkbutton" onclick="addAlbumDialog()" data-options="iconCls:'icon-help',plain:true">添加专辑</a>
    <a href="#" class="easyui-linkbutton" onclick="addChapterDialog()" data-options="iconCls:'icon-edit',plain:true">添加章节</a>
    <a href="#" class="easyui-linkbutton" onclick="openLoadRadioDialog()" data-options="iconCls:'icon-help',plain:true">下载音频</a>
</div>
<%--专辑详情对话框--%>
<div id="openAlbum" data-options="resizable:true,width:500,height:400,iconCls:'icon-save',title:'专辑详情',collapsible:true,minimizable:true,maximizable:true,"></div>
<%--添加专辑对话框--%>
<div id="openAlbumAdd" data-options="resizable:true,width:500,height:400,iconCls:'icon-save',title:'添加专辑',collapsible:true,minimizable:true,maximizable:true,"></div>
<%--添加章节对话框--%>
<div id="openChapterAdd" data-options="resizable:true,width:500,height:400,iconCls:'icon-save',title:'添加章节',collapsible:true,minimizable:true,maximizable:true,"></div>
<%--下载音频对话框--%>
<div id="openloadRadio" data-options="resizable:true,width:500,height:400,iconCls:'icon-save',title:'下载音频',collapsible:true,minimizable:true,maximizable:true,"></div>


