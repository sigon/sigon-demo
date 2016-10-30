<!DOCTYPE html>
<html>
<head>
[#include "/include/head.ftl"]
</head>
<body>
[#assign menu="OtherDoc"]
[#include "/basicInfo/menu.ftl"]
<h2 class="page_title">MerchantDoc List</h2>
<form id="listForm" action="list.action" method="post">
    <input type="hidden" name="code" value="${code}" />
    <menu>
        <div class="form">


            <p class="f_1p">
                <label class="f_info">Doc Type</label>
                <select name="docType" id="docType">
                    <option value="">All</option>
                [#list docTypeEnum as item]
                    <option value="${item.code}" [#if merchantOtherDoc.docType==item.code]selected="selected" [/#if]>${item.descEng}</option>
                [/#list]
                </select>
            </p>


            <p class="f_1p">
                <label class="f_info">Title</label>
                <input type="text" id="title" name="title" value="${merchantOtherDoc.title}" >
            </p>
            <!--搜索和重置按钮-->
            <p  class="f_1p">
                <button type="submit" id="searchForm" class="btn bg_blue" data-icon="s">Search</button>
                <a href="javascript:" id="reset" class="btn" onclick="resetForm('#listForm')">Reset</a>
            </p>
        </div>

    </menu>
    <div class="table">
[@showMenu code="030229"]
            <a href="add.action?code=${merchantOtherDoc.code}" class="btn add bg_green" data-icon="a">Add</a>
[/@showMenu]
            <hr>
        <table>
            <tr>

                <th>title</th>
                <th>doc Type</th>
                <th>comment</th>
                <th>Modify Date[@pageOrder pageable=page.pageable property="modify_date"][/@pageOrder]</th>
                <th width="64">Actions</th>

            </tr>

        [#list page.content as item]
            <tr>
                [#if item.delFlag!=1]
                    <td> ${item.title}</td>
                    <td> ${docTypeMap.get(item.docType).descEng}</td>
                    <td> ${item.comment}</td>
                    <td> [@dateFormat value=item.modifyDate ][/@dateFormat]</td>
                <td>
                    <span class="btn_i item_menu">
                        o<span data-itemid="${item.id}">
            [@showMenu code="030230"]
                         <a href="edit.action?id=${item.id}&code=${merchantOtherDoc.code}" class="edit" data-icon="e">Edit</a>
            [/@showMenu]
                [@showMenu code="030231"]
                            <a href="javascript" data-itemid="${item.id}" class="delete" data-icon="e">Delete</a>
                [/@showMenu]
                    </span>
                </td>
                [/#if]
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
//        $(".edit,.add").on("click",function(){
//            var title=$(this).is(".add")?"MerchantOtherDoc Add":"MerchantOtherDoc Edit";
//            alertM(this.href,{
//                title:title,
//                time:"y",
//                width:660,
//                height:400,
//                iframe:1
//            })
//            return false;
//        });
        $("#reset").on("click",function(){
            $("#status").val("1");
        })
        $(".delete").on("click",function(){
            var $t=$(this);
            alertM("Are you sure to delete ?",{
                time:"y",
                title:"Confirm",
                btns:[
                    {
                        txt:$t.html(),
                        cls:"bg_blue",
                        func:function(){

                            alertM("Loading",{cls:"loading",time:"y"});
                            $.ajax({
                                url:"delete.action",
                                dataType:"json",
                                data:{
                                    id:$t.data("itemid")
                                }
                            }).done(function(data){
                                alertM(data.msg,{cls:data.status,rf:function(){
                                    if(data.status=="succ")
                                        window.location.href="list.action?code=${merchantOtherDoc.code}";
                                }})
                            });
                        }
                    },
                    {
                        txt:"Cancel"
                    }
                ]
            })
            return false;
        })

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
