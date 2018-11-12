<%@page pageEncoding="UTF-8" isELIgnored="false" %>
<script type="text/javascript">
    $(function () {

        $('#tt').datagrid({
            title:'DataGrid - DetailView',
            remoteSort:false,//关闭服务器端排序
            fitColumns:true,
            resizeHandle:'both',//两边都可拉伸
            toolbar:'#an',//顶部添加工具
            autoRowHeight:true,//自动适应行高
            striped:true,//斑马线效果
            method:'post',
            loadMsg:'正在加载.........',
            pagination:true,//分页工具
           // rownumbers:true,//显示行号
            pagePosition:'bottom',//分页工具栏位置
            pageNumber:1,//初始页码
            pageSize:3,//每页显示的记录数
            pageList:[1,2,  3,8,10,50,100],//下拉列表的值
            width:1120,
            height:430,
            remoteSort:false,
            singleSelect:true,
            nowrap:false,
            fitColumns:true,
            url:"${pageContext.request.contextPath}/banner/findByPage",
            columns:[[
                {title:"标题",field:"title",width:200},
                {title:"路径",field:"lujing",width:200},
                {title:"时间",field:"times",width:200},
                {title:"Option",field:"option",width:200,
                    formatter:function (value,row,index) {
                        /* console.log(row.id);*/
                        return "<a href='javascript:;' class='sc' onclick=\"del('"+row.id+"')\" data-options=\"iconCls:'icon-remove'\">删除</a>&nbsp;&nbsp;" +
                            "<a href='javascript:;' class='xg' onclick=\"upd('"+row.id+"')\" data-options=\"iconCls:'icon-edit'\">更新</a>";
                    },
                },
            ]],
            view: detailview,
            detailFormatter: function(rowIndex, rowData){
                return '<table><tr>' +
                    '<td rowspan=2 style="border:0"><img src="${pageContext.request.contextPath}' + rowData.lujing + '" style="height:50px;"></td>' +
                    '<td style="border:0">' +
                    '<p>Status: ' + rowData.status + '</p>' +
                    '<p>lujing: ' + rowData.lujing + '</p>' +
                    '</td>' +
                    '</tr></table>';
            },


        onLoadSuccess:function () {//onLoadSuccess事件加载完成后触发
                $(".sc").linkbutton({
                    iconCls:'icon-remove',
                });
                $(".xg").linkbutton({
                    iconCls:'icon-edit',
                });

            },
        });
    });
    //删除单行数据
    function del(id) {
        //发送异步请求把id传过去
        $.post("${pageContext.request.contextPath}/banner/delete",{"id":id},function (result) {
            $.messager.show({title:'消息提示',msg:'删除成功'});
            $("#tt").datagrid('reload');//删除之后再次刷新
        })
    }
    //添加事件
    function add() {

        $("#lbaddbox").dialog({
            buttons:[{
                iconCls:'icon-save',
                text:'保存',
                handler: saveUserForm
            },{
                iconCls:'icon-cancel',
                text:'关闭',
                handler:function(){
                    $("#lbaddbox").dialog('close');
                    console.log("关闭");
                }
            }]
        });
    }
    function upd(id) {

        $("#updbox").dialog({
            href:'${pageContext.request.contextPath}/qq/show/update.jsp?id='+id,
            buttons:[{
                iconCls:'icon-save',
                text:'保存',
                handler: updateForm
            },{
                iconCls:'icon-cancel',
                text:'关闭',
                handler:function(){
                    $("#updbox").dialog('close');
                    console.log("关闭");
                }
            }]
        });
    }
    function updateForm() {
        //提交信息
        $("#update_form").form('submit',{
            //发送请求
            url:'${pageContext.request.contextPath}/banner/update',
            success:function (result) {//响应的一定是json格式字符串   使用应该先转为js对象
                $("#updbox").dialog('close');
                //刷新datagrid(信息)
                $("#tt").datagrid('reload');
                $.messager.show({title:'消息提示',msg:'修改成功'});
            },
        })

    }

    function saveUserForm(){
        //保存用户信息
        // $("#addform").form('disableValidation');

        $("#addform").form('submit',{
            url:'${pageContext.request.contextPath}/banner/save',
            success:function(result){//响应的一定是json格式字符串   使用应该先转为js对象
                var resultObj = $.parseJSON(result);
                console.log(result);
                if(resultObj.success){
                    //提示信息
                    $.messager.show({title:'提示',msg:"用户添加成功!!!"});
                }else{
                    //提示信息
                    $.messager.show({title:'提示',msg:resultObj.message});
                }
                //关闭对话框
                $("#lbaddbox").dialog('close');
                //刷新datagrid
                $("#tt").datagrid('reload');
            }
        });
    }
</script>
<table id="tt"></table>
<div id="an">
    <a href="javascript:" class="easyui-linkbutton" onclick="add()" data-options="iconCls:'icon-add',">添加</a>

</div>
<%--添加窗口--%>
<div id="lbaddbox" data-options="href:'${pageContext.request.contextPath}/qq/show/add.jsp',width:600,height:500,title:'保存用户信息',iconCls:'icon-save'"></div>
<%--更新用户对话框--%>
<div id="updbox" data-options="draggable:false,iconCls:'icon-edit',width:600,height:400,title:'更新用户信息'"></div>