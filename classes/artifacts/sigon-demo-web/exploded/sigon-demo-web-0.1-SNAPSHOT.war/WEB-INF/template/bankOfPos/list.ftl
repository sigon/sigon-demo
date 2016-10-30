<!DOCTYPE html>
<html>
<head>
[#include "/include/head.ftl"]
</head>
<body>

<h2 class="page_title">BankOfPos List</h2>
<form id="listForm" action="list.action" method="post">
    <menu>
        <div class="form">

            <p class="f_1p">
                <label class="f_info">Bank</label>
                <select id="bankNameId" name="bankNameId" data-v="validate[required]">
                    <option value="" >Select All</option>
                [#list bankNameList as item]
                    <option value="${item.id}" [#if item.id==bankOfPos.bankNameId]selected[/#if]>${item.shortName}</option>
                [/#list]
                </select>
            </p>
            <p class="f_1p">
                <label class="f_info">Account</label>
                <select id="bankId" name="bankId" data-v="validate[required]">
                    <option value="" >Select All</option>
                </select>
            </p>
            <p class="f_1p">
                <label class="f_info">Currency</label>
                <select id="currency" name="currency">
                    <option value="" >Select All</option>
                    [#list currencyEnum as item]
                        <option value="${item.descEng}" [#if item.descEng==bankOfPos.currency]selected[/#if]>${item.descEng}</option>
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
            <a href="add.action" class="btn add bg_green" data-icon="a">Add</a>
            <hr>
        <table>
            <tr>
                <th>account</th>
                <th>currency</th>
                <th width="64">Actions</th>
            </tr>

        [#list bankOfPosList as item]
            <tr>

<td> ${item.account} </td>
<td> ${item.currency} </td>                <td>
                    <span class="btn_i item_menu">
                        o<span data-itemid="${item.id}">
                         <a href="edit.action?id=${item.id}" class="edit" data-icon="e">Edit</a>

                            <a href="delete.action?id=${item.id}" class="delete" data-icon="e">Delete</a>
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
        $("#bankNameId").on("change",function(){
            var $t = $(this);
            if ($t.val()==""){
                var html='<option value="" >Select All</option>';
                if ($t.is("#bankNameId")){
                    $("#bankId").html(html);
                    $("#bankId").trigger('change');
                }
                return ;
            }
            $.ajax({ type: "POST",
                url: "/bankDetail/changeAccount.action",
                dataType:"json",
                data: {id:$t.val()}
            }).done(function(data){
                var html2="";
                var list=data.data;
                html2+='<option value="" >Select All</option>';
                var select = false;
                for(var i=0;i<list.length;i++){
                    if (list[i].id=='${bankOfPos.bankId}'){select = true;}
                    html2+='<option value="'+list[i].id+'" currency="'+list[i].currency+'">'+list[i].accountNo+"-"+list[i].accountName+"-"+list[i].currency+'</option>';
                }
                $("#bankId").html(html2);
                if (select){
                    $("#bankId").val('${bankOfPos.bankId}');
                    $("#bankId").trigger('change');
                } else {
                    $("#bankId").trigger('change');
                }
            })
        })

        $(".edit,.add").on("click",function(){
            var title=$(this).is(".add")?"BankOfPos Add":"BankOfPos Edit";
            alertM(this.href,{
                title:title,
                time:"y",
                width:400,
                height:340,
                iframe:1
            })
            return false;
        });
        $("#reset").on("click",function(){
            $("#status").val("1");
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
