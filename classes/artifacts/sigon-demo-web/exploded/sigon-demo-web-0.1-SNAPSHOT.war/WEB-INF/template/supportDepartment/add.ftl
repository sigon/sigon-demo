<!DOCTYPE html>
<html>
<head>
    [#include "/include/head.ftl"]
</head>
<body class="iframe">
    <form action="${action}.action" class="form form_short_info" id="form1" method="post">
        <input id="action" type="hidden" value="${action}">
        <input type="hidden" name="id" value="${supportDepartment.id}">
            <div class="cf">
            <p class="f_1p"><label class="f_info">Department</label>
                <input type="text" class="txt" data-v="validate[required,maxSize[50]]" maxlength="50" name="department" value="${supportDepartment.department}" onkeyup="showMax(this,50)"><span></span></p>
            <p class="f_1p"><label class="f_info">Status</label>
            <input type="radio" name="status" [#if supportDepartment.status=="1"]checked[/#if] id="c2" value="1">
            <label for="c2" class="f_for">Active</label>
            <input type="radio" name="status" [#if supportDepartment.status=="0"]checked[/#if] id="c3" value="0">
            <label for="c3" class="f_for">Deactive</label></p>
            </div>
            <p id="p3"><label class="f_info">Operator</label>
                <select id="s3" class="f_short" >
                    [#list userList as item]
                        <option value="${item.userId}">${item.userId}</option>
                    [/#list]
                </select>
                <a href="javascript:" class="btn bg_green" title="Add" id="add_s">Add</a>
            [#if action=="update"]
                [#list userMap.keySet() as keyItem]
                    <span class="tag bg_green">
                            <input id="tag_${keyItem}" type="hidden" name="user" value="${keyItem}">
                    ${keyItem}
                            <a class="remove" href="javascript:">×</a>
                        </span>
                [/#list]
            [/#if]
            </p>

    <div id="issue">
            [#list supportDepartmentIssue as item]
                <p><label class="f_info">Issue</label>
                    <input type="text" class="txt" data-v="validate[required,maxSize[100]]" maxlength="100" onkeyup="showMax(this,100)" name="issue" value="${item.issue}"><span></span>
                    <a href="javascript:" class="del_p btn_i bg_red" title="Add">d</a>
                </p>
            [/#list]
            [#if action=="save"]
                <p><label class="f_info">Issue</label>
                    <input type="text" class="txt" data-v="validate[required,maxSize[100]]" maxlength="100" onkeyup="showMax(this,100)" name="issue"><span></span>
                </p>
            [/#if]
            </div>
            <p>
                <a href="javascript:" id="cancel" class="btn" data-icon="p" >Cancel</a>
                <Button type="submit" id="sbEdit" class="btn bg_blue" data-icon="y">Save</Button>
            </p>
            </form>
            <script>
            seajs.use(["alert","addp","validation"],function(alertM,addp){
                addp("#issue","p",function(){
                    window.parent.setAH($("body").height()+12);
                })
                $("#form1").validationEngine().on("submit",function(){
                    if(document.getElementsByClassName("user").length<=10)//设置长度
                    /*if($(".tag").length)*/
                        alertM.end($("#action").val()+".action",$("#form1").serialize(),function(){
                            window.parent.location.reload()
                        });
                    else
                        alertM("Operator 超出上限，最多可选10个",{cls:"cross"})
                    return false;
                }).on('jqv.form.result',function(){
                    window.parent.setAH($("body").height()+12);
                });
                $("#cancel").on("click",function(){
                    window.parent.location.reload()
                }),
                $s3=$("#s3"),
                $p3=$("#p3")

                $("#add_s").on("click",function(){
                    if(!$("#tag_"+$s3.val()).length)
                        $p3.append('<span class="tag bg_green"><input type="hidden" id="tag_'+$s3.val()+'" name="user" value="'+$s3.val()+'">'+$s3.find(":selected").html()+'<a class="remove" href="javascript:">×</a></span>')
                })

                $("#p3").on("click",".remove",function(){
                    $(this).parent().remove()
                })
                window.parent.setAH($("body").height()+12);
            })
    </script>
    </body>
</html>