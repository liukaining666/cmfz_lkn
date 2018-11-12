<%@page isELIgnored="false"  pageEncoding="UTF-8" contentType="text/html; UTF-8" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>持名法州后台管理中心</title>

    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="this is my page">
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">

    <link rel="icon" href="img/favicon.ico" type="image/x-icon" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/qq/css/common.css" type="text/css"></link>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/qq/css/login.css" type="text/css"></link>
    <script type="text/javascript" src="${pageContext.request.contextPath}/qq/script/jquery.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/qq/script/common.js"></script>
    <script type="text/javascript">

        $(function(){
            //点击更换验证码：
            $("#captchaImage").click(function(){//点击更换验证码
                alert("自己做");
            });
        });
    </script>
</head>
<body>

<div class="login">
    <form id="loginForm" action="${pageContext.request.contextPath}/admin/login" method="post" >
        <table>
            <tbody>
            <tr>
                <td>
                    id:<input type="text" value="${param.id}" name="id"/>
                </td>
            </tr>
            <tr>
                <td width="190" rowspan="2" align="center" valign="bottom">
                    <img src="img/header_logo.gif" />
                </td>
                <th>
                    新密码:
                </th>
                <td>
                    <input type="text"  name="username" class="text" maxlength="20"/>
                </td>
            </tr>
            <tr>
                <th>
                    确认密码:
                </th>
                <td>
                    <input type="password" name="password" class="text" maxlength="20" autocomplete="off"/>
                </td>
            </tr>

            <%--<tr>
                <td>&nbsp;</td>
                <th>验证码:</th>
                <td>
                    <input type="text" id="enCode" name="code" class="text captcha" maxlength="4" autocomplete="off"/>
                    <img id="captchaImage" class="captchaImage" src="img/captcha.jpg" title="点击更换验证码"/>
                </td>
            </tr>--%>
            <tr>
                <td>
                    &nbsp;
                </td>
                <th>
                    &nbsp;
                </th>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <th>&nbsp;</th>
                <td>
                    <input type="button" class="homeButton" value="" onclick="location.href='/'"><input type="submit" class="loginButton" value="修改">
                </td>
            </tr>
            </tbody></table>
        <div class="powered">COPYRIGHT © 2008-2017.</div>
        <div class="link">
            <a href="http://www.chimingfowang.com/">持名佛网首页</a> |
            <a href="http://www.chimingbbs.com/">交流论坛</a> |
            <a href="">关于我们</a> |
            <a href="">联系我们</a> |
            <a href="">授权查询</a>
        </div>
    </form>
</div>
</body>
</html>