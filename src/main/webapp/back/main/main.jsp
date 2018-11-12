<%@page isELIgnored="false" pageEncoding="UTF-8" %>
<%--<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>--%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>持名法州主页</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/back/easyui/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/back/easyui/themes/icon.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/back/easyui/jquery.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/back/easyui/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/back/easyui/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/back/easyui/form.validator.rules.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/back/js/datagrid-detailview.js"></script>
    <script type="text/javascript">
	<!--菜单处理-->
    $(function () {
        var name="${sessionScope.Admin.adminName}";
        if(name==""){
            window.location.href="${pageContext.request.contextPath}/back/main/login.jsp";
        }
        //页面加载完成之后发送ajax请求到后台展示所有的菜单
        $.post(
            "${pageContext.request.contextPath}/Menu/findAllMenu",
            //返回的响应结果通过accordion方式添加到菜单
            function (menu) {
                $.each(menu,function (index,menu) {
                    //遍历二级菜单
                    var content="<div style='text-align: center'>";
                    $.each(menu.children,function (index,child) {
                        content += "<a onclick=\"addTabs('"+child.name+"','"+child.iconCls+"','"+child.href+"')\" " +
                            "style='width:95%;margin:10px 0px; border: 1px blue solid;' class='easyui-linkbutton' " +
                            "data-options=\"plain:true,iconCls:'"+child.iconCls+"'\">"+child.name+"</a><br>";
                    });
                    content+="</div>";
                    //添加菜单
                    $("#menu").accordion('add',{
                            title:menu.name,
                            iconCls:menu.iconCls,
                            content:content,
                        }
                    )
                });
            }
        )
    });
    //点击菜单追加选项卡
    function addTabs(title,iconCls,href) {
        //添加前先判断是否存在选项卡

        var t=$("#tabs").tabs('exists',title);
        if(!t){
            //创建选项卡
            $("#tabs").tabs('add',{
                closable:true,
                iconCls:iconCls,
                href:"${pageContext.request.contextPath}"+href,
                title:title,
                fit:true
            })
        }
        else{
            $("#tabs").tabs('select',title);
        }
    };
    //修改密码对话框
    function changePwd() {
        $("#changePwd").dialog({
            href:'${pageContext.request.contextPath}/back/main/change.jsp',
            width:500,
            height:400,
            title:'修改密码',
            iconCls:'icon-edit',
            buttons:
                [{
                text:'修改',
                iconCls:'icon-edit',
                handler:function(){
                    $("#openChangePwd").form('submit',{
                        url:'${pageContext.request.contextPath}/Admin/changePwd',
                        success:function(result) {
                            //响应回来的是json格式的字符串，要将其转化成js对象的格式
                            var resultObj = $.parseJSON(result);
                            if(resultObj.success){
                                $.messager.show({title:'提示',msg:resultObj.message});

                                window.location.href = '${pageContext.request.contextPath}/Admin/exit';

                            }else{
                                $.messager.show({title:'提示',msg:resultObj.message});
                            }
                        }
                    });
                }
            },{
                text:'关闭',
                iconCls:'icon-cancel',
                handler:function(){
                    $("#changePwd").dialog('close');
                }
            }],
        })
    }


</script>

</head>
<body class="easyui-layout">
     <%--页面的头部分--%>
    <div data-options="region:'north',split:true" style="height:60px;background-color:  #5C160C">
    	<div style="font-size: 24px;color: #FAF7F7;font-family: 楷体;font-weight: 900;width: 500px;float:left;padding-left: 20px;padding-top: 10px" >持名法州后台管理系统</div>
    	<div style="font-size: 16px;color: #FAF7F7;font-family: 楷体;width: 300px;float:right;padding-top:15px">欢迎您:${sessionScope.Admin.adminName} &nbsp;<a href="javaScript:void(0);" onclick="changePwd()"   class="easyui-linkbutton" data-options="iconCls:'icon-edit'">修改密码</a>&nbsp;&nbsp;<a  href="${pageContext.request.contextPath}/Admin/exit" id="drop"  class="easyui-linkbutton" data-options="iconCls:'icon-cancel'">退出系统</a></div>
    </div>   
    <div data-options="region:'south',split:true" style="height: 40px;background: #5C160C">
    	<div style="text-align: center;font-size:15px; color: #FAF7F7;font-family: 楷体" >&copy;百知教育 htf@zparkhr.com.cn</div>
    </div>   
       <%--页面左侧部分--%>
    <div data-options="region:'west',title:'导航菜单',split:true" style="width:220px;">
    	<div id="menu" class="easyui-accordion" data-options="fit:true">
    		
		</div>  
    </div>
     <%--页面的中间位置--%>
    <div data-options="region:'center'">
    	<div id="tabs" class="easyui-tabs" data-options="fit:true,narrow:true,pill:true,">
               <%--选项卡--%>
		    <div title="主页" data-options="iconCls:'icon-neighbourhood',closable:true"  style="background-image:url(img/shouye.jpg);background-repeat: no-repeat;background-size:100% 100%"></div>
		</div>  
    </div>
  <%--修改密码对话框--%>
   <div id="changePwd"></div>
   <%--按钮--%>
     <%--<div id="bb">
         <a href="#" onclick="cPwd()" class="easyui-linkbutton" data-options="iconCls:'icon-edit'">修改</a>
         <a href="#" class="easyui-linkbutton">关闭</a>
     </div>--%>
</body> 
</html>