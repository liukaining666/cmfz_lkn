<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page pageEncoding="UTF-8" isELIgnored="false" %>

<div style="text-align: center">
    <form id="addzj1form" class="easyui-form" method="post" enctype="multipart/form-data">
        <div>
            <input type="hidden" name="id" value="${param.id}" class="easyui-textbox" >
        </div>
        <div style="margin-top: 70px;">
            标题: <input type="text" name="title" class="easyui-textbox">
        </div>
        <div style="margin-top: 70px;">
            作者: <input type="text" name="author" class="easyui-textbox">
        </div>
        <div style="margin-top: 20px;">
            MP3:  <input  name="filename" class="easyui-filebox">
        </div>
    </form>
</div>
