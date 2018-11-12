<%@page pageEncoding="UTF-8" isELIgnored="false" %>
    <script type="text/javascript">
        $(function () {
            $("#gktb").datagrid({
                url:"${pageContext.request.contextPath}/course/findByPage",
                height:430,
                remoteSort:false,//关闭服务器端排序
                fitColumns:true,
                resizeHandle:'both',//两边都可拉伸
                toolbar:'#gkan',//顶部添加工具
                autoRowHeight:true,//自动适应行高
                striped:true,//斑马线效果
                method:'post',
                loadMsg:'正在加载.........',
                pagination:true,//分页工具
              /*rownumbers:true,//显示行号*/
                pagePosition:'bottom',//分页工具栏位置
                pageNumber:1,//初始页码
                pageSize:3,//每页显示的记录数
                pageList:[1,2,3,8,10,50,100],//下拉列表的值
                columns:[[
                    /*{title:"checkbox",field:"checkbox",checkbox:true},//复选框*/
                    {title:"Id",field:"id",width:100},

                    {title:"名称",field:"title",resizable:false,width:100},//resizable:false 关闭拖动列的宽
                    {title:"marking",field:"marking",resizable:false,width:100},//resizable:false 关闭拖动列的宽
                    {title:"创建时间",field:"creatTime",sortable:true,width:100,//sortable:true 排序
                        styler:function (value,row,index) {
                            return "color:#f60";
                        },
                    },
                    /*{title:"Bir",field:"bir",width:100},*/
                    {title:"Option",field:"option",width:100,
                        formatter:function (value,row,index) {
                            /* console.log(row.id);*/
                            return "<a href='javascript:;' class='sc' onclick=\"del('"+row.id+"')\" data-options=\"iconCls:'icon-remove'\">删除</a>&nbsp;&nbsp;"
                        },
                    },
                ]],
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
            $.post("${pageContext.request.contextPath}/course/delete",{"id":id},function (result) {
                $.messager.show({title:'消息提示',msg:'删除成功'});
                $("#gktb").datagrid('reload');//删除之后再次刷新
            })
        }
        //添加事件
        function add() {
            $("#addgkbox").dialog({
                buttons:[{
                    iconCls:'icon-save',
                    text:'保存',
                    handler: saveClassForm
                },{
                    iconCls:'icon-cancel',
                    text:'关闭',
                    handler:function(){
                        $("#addgkbox").dialog('close');
                        console.log("关闭");
                    }
                }]
            });
        }


        function saveClassForm(){
            $("#addgkForm").form('submit',{
                url:'${pageContext.request.contextPath}/course/add',
                success:function(result){//响应的一定是json格式字符串   使用应该先转为js对象
                    var resultObj = $.parseJSON(result);
                    if(resultObj.success){
                        //提示信息
                        $.messager.show({title:'提示',msg:"用户添加成功!!!"});
                    }else{
                        //提示信息
                        $.messager.show({title:'提示',msg:resultObj.message});
                    }
                    //关闭对话框
                    $("#addgkbox").dialog('close');
                    //刷新datagrid
                    $("#gktb").datagrid('reload');
                }
            });
        }
    </script>
<table id="gktb"></table>
<div id="gkan">
    <a href="javascript:" class="easyui-linkbutton" onclick="add()" data-options="iconCls:'icon-add',">添加</a>
    <%--<a href="javascript:" class="easyui-linkbutton" onclick="delAll()" data-options="iconCls:'icon-remove'">批量删除</a>--%>
</div>
<%--添加窗口--%>
<div id="addgkbox" data-options="href:'${pageContext.request.contextPath}/qq/show/gongke/add.jsp',width:600,height:500,title:'保存用户信息',iconCls:'icon-save'"></div>
