<!DOCTYPE html>
<html>
<head>
[#include "/include/head.ftl"]
</head>
<body>
[#assign menu="Doc"]
[#include "/basicInfo/menu.ftl"]
<h2 class="page_title">ID List</h2>
<form id="listForm" action="list.action" method="POST">
    <input type="hidden" name="code" value="${code}" />
    <menu>
        <div class="form">
            <p class="f_1p">
                <label class="f_info">ID Num</label>
                <input type="text" id="docNum" name="docNum" value="${merchantDoc.docNum}" >
            </p>
            <p class="f_1p">
                <label class="f_info">ID Type</label>
                <select id="docType" name="docType" >
                    <option value="">ALL</option>
                [#list idTypeEnum as item]
                    <option value="${item.id}" [#if item.id==merchantDoc.docType] selected="selected" [/#if]>${item.descEng}</option>
                [/#list]
                </select>
            </p>
            <p class="f_1p">
                <label class="f_info">Account Holder</label>
                <select name="isAccountHolder" id="isAccountHolder">
                    <option value="">All</option>
                    [#list whetherEnum as item]
                        <option value="${item.index}" [#if merchantDoc.isAccountHolder==item.index]selected="selected" [/#if]>${item.descEng}</option>
                    [/#list]
                </select>
            </p>

            <!--搜索和重置按钮-->
            <p  class="f_1p">
                <button type="submit" id="searchForm" class="btn bg_blue" data-icon="s">Search</button>
                <a href="javascript:" id="reset" class="btn" onclick="resetForm('#listForm')">Reset</a>
            </p>
        </div>


    </menu>
    <div class="table">
    [@showMenu code="030217"]
        <a href="add.action?merchantCode=${code}" class="btn add bg_green" data-icon="a">Add</a>
        <hr>
    [/@showMenu]
        <table>
            <tr>
                <th>ID Type</th>
                <th>${name}</th>
                <th>ID Num</th>
                <th>Account Hoder</th>
                <th>${date}</th>
                <th>Modify Date[@pageOrder pageable=page.pageable property="modify_date"][/@pageOrder]</th>
                <th width="64">Actions</th>
            </tr>

        [#list page.content as item]
            <tr>

                <td> ${typeMap.get(item.docType).descEng} </td>
                <td> [@subString content=item.registerName length=20][/@subString] </td>
                <td> [@subString content=item.docNum length=20][/@subString]</td>
                <td> [#if item.authorisePersonId!=""]No[#else ]Yes[/#if] </td>
                <td>
                    [#if item.remindDate??]
                        <span [#if map.get(item.id)??]class="red"[/#if]>
                            [@dateFormat value=item.remindDate nullInfo="not specify"][/@dateFormat]
                            [#--[@showValue  value=item.remindDate?string("yyyy-MM-dd")][/@showValue]--]
                        </span>
                    [#--[#elseif item.issueDate??&&date=="Expire Date"]--]
                        [#--[@showValue  value=item.issueDate?string("yyyy-MM-dd")][/@showValue]--]
                    [/#if]

                    <br/>

                </td>
                <td>
                    [@dateFormat value=item.modifyDate nullInfo="not commited"][/@dateFormat]
                </td>
                <td>
                    <span class="btn_i item_menu">
                        o<span data-itemid="${item.id}">
                         [@showMenu code="030218"]
                             <a href="edit.action?id=${item.id}" class="edit" data-icon="e">Edit</a>
                         [/@showMenu]
                        [@showMenu code="030232"]
                        <a href="javascript" data-itemid="${item.id}" class="delete" data-icon="e">Delete</a>
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
//        $(".edit,.add").on("click",function(){
//            var title=$(this).is(".add")?"MerchantDoc Add":"MerchantDoc Edit";
//            alertM(this.href,{
//                title:title,
//                time:"y",
//                width:660,
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
                                        window.location.href="list.action?code=${code}";
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
        window.setAH = function(h) {
            $("#alertF").animate({
                height: h
            })
        }
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
