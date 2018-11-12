<%@page pageEncoding="UTF-8" isELIgnored="false" %>
<div style="margin-top: 50px;text-align: center">
    <a href="${pageContext.request.contextPath}/Album/download?fileName=${param.downPath}&openStyle=inline" class="easyui-linkbutton" data-options="width:60,height:30">在线打开</a>
</div>
<div style="margin-top: 50px;text-align: center">
    <a href="${pageContext.request.contextPath}/Album/download?fileName=${param.downPath}&openStyle=attachment" class="easyui-linkbutton" data-options="width:60,height:30">下载</a>
</div>
