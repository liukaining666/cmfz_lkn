<%@page pageEncoding="UTF-8" isELIgnored="false" %>
<script>
    $(function () {

        $("#showzj_form").form('load','${pageContext.request.contextPath}/album/findById?id=${param.id}'); //{"id":"21","name":"小黑"}

    })

</script>
<div style="text-align: center;">
    <form id="showzj_form" class="easyui-form" method="post" enctype="multipart/form-data">
        <input type="text" name="id" value="${param.id}">
        <div style="margin-top: 70px;">
            专辑名字: <input type="text" name="title" class="easyui-textbox">
        </div>
        <div style="margin-top: 20px;">
            专辑路径:  <input  name="filename" class="easyui-textbox" >
        </div>
        <div style="margin-top: 20px;">
            专辑作者: <input type="text" name="author" class="easyui-textbox">
        </div>
    </form>
</div>