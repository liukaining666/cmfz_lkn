<%@page pageEncoding="UTF-8" isELIgnored="false" %>
<script>
    $(function () {
        $("#update_form").form('load','${pageContext.request.contextPath}/banner/queryById?id=${param.id}'); //{"id":"21","name":"小黑"}
    })

</script>
<div style="text-align: center;">
    <form id="update_form" class="easyui-form" method="post" enctype="multipart/form-data">
        <input type="hidden" name="id" value="${param.id}">
        <div style="margin-top: 70px;">
            标题: <input type="text" name="title" class="easyui-textbox">
        </div>
        <div style="margin-top: 20px;">
            图片:  <input name="filename" value="${param.lujing}"  class="easyui-filebox">
        </div>
        <div style="margin-top: 20px;">
            时间: <input type="text" name="times" class="easyui-datebox">
        </div>
    </form>
</div>