<!DOCTYPE html>
<html>
<head>
[#include "/include/head.ftl"]
</head>
<body>

<h2 class="page_title">PaymentReason List</h2>
<form id="listForm" action="list.action" method="post">
    <menu>
        <div class="form">
            <p class="f_1p">
                <label class="f_info">ReasonCn</label>
                <input type="text" id="reasonCn" name="reasonCn" value="${paymentReason.reasonCn}" >
            </p>
            <p class="f_1p">
                <label class="f_info">ReasonEn</label>
                <input type="text" id="reasonEn" name="reasonEn" value="${paymentReason.reasonEn}" >
            </p>
            <!--搜索和重置按钮-->
            <p  class="f_1p">
                <button type="submit" id="searchForm" class="btn bg_blue" data-icon="s">Search</button>
                <a href="javascript:" id="reset" class="btn" onclick="resetForm('#listForm')">Reset</a>
            </p>
        </div>

    </menu>
    <div class="table">
        <table>
        [@showMenu code ="990901"]
            <a href="add.action" class="btn add bg_green" data-icon="a">Add</a>
        [/@showMenu]
            <hr>
            <tr>
                <th>reasonCn</th>
                <th>reasonEn</th>
                <th width="64">Actions</th>
            </tr>

        [#list page.content as item]
            <tr>
                <td> ${item.reasonCn} </td>
                <td> ${item.reasonEn} </td>
                <td>
                    <span class="btn_i item_menu">
                        o<span data-itemid="${item.id}">
            [@showMenu code ="990902"]
                         <a href="edit.action?id=${item.id}" class="edit" data-icon="e">Edit</a>
            [/@showMenu]
                [@showMenu code ="990903"]
                            <a href="javascript:" class="delete" data-icon="e">Delete</a>
                [/@showMenu]
                    </span>
                </td>
            </tr>
        [/#list]
        </table>
    [@pagination pageNumber = page.pageNumber totalPages = page.totalPages]
        [#include "/include/pagination.ftl"]
    [/@pagination]
    </div>
</form>

<script>

    seajs.use(["alert","validation"], function (alertM) {
        $(".edit,.add").on("click",function(){
            var title=$(this).is(".add")?"PaymentReason Add":"PaymentReason Edit";
            alertM(this.href,{
                title:title,
                time:"y",
                width:660,
                height:200,
                iframe:1
            })
            return false;
        });

        $("table").on("click",".delete",function(){
            var $t=$(this);
            var idForDelete=$t.parent().data("itemid") ;
            alertM("Are you sure delete the Reason?",{
                time:"y",
                title:"Delete",
                btns:[
                    {
                        txt:$t.html(),
                        cls:"bg_red",
                        func:function(){
                            alertM("Loading",{cls:"loading",time:"y"});
                            $.ajax({
                                url:"/paymentReason/delete.action",
                                dataType:"json",
                                data:{
                                    id:idForDelete
                                }
                            }).done(function(data){
                                alertM(data.msg,{cls:data.status,rf:function(){
                                    if(data.status=="succ")
                                        window.location.href="list.action";
                                }})
                            });
                            return false;
                        }
                    },
                    {
                        txt:"Cancel"
                    }
                ]
            })
        });

        window.refresh=function(t){
            if(t)
                window.location.reload()
            alertM.remove()
        }
    })
</script>
[#include "/include/footer.ftl"]
</body>
</html>
