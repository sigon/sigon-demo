<!DOCTYPE html>
<html>
<head>
[#include "/include/head.ftl"]
</head>
<body>

<h2 class="page_title">Cashhold List</h2>
<form id="listForm" action="list.action" method="post">
    <menu>
        <div class="form">

            <p class="f_1p">
                <label class="f_info">Employee</label>
                <select id="userId" name="userId" >
                    <option value="" >Select All</option>
                [#list cashholdList as item]
                    <option value="${item.userId}" [#if item.userId==cashhold.userId]selected[/#if]> ${item.name}-${item.userId}</option>
                [/#list]
                </select>
            </p>
            <p class="f_1p">
                <label class="f_info">Status</label>
                <select id="status" name="status" >
                    <option value="" >Select All</option>
                [#list activeEnum as item]
                    <option value="${item.index}" [#if item.index==cashhold.status]selected[/#if]>${item.descEng}</option>
                [/#list]
                </select>
            </p>
            <!--搜索和重置按钮-->
            <p  class="f_1p">
                <button type="submit" id="searchForm" class="btn bg_blue" data-icon="s">Search</button>
                <a href="javascript:" id="reset" class="btn " onclick="resetForm('#listForm')">Reset</a>
            </p>
        </div>

    </menu>
    <div class="table">
        [@showMenu code="110101"]
            <a href="add.action" class="btn add bg_green" data-icon="a">Add</a>
        [/@showMenu]
            <hr>
        <table>
            <tr>
                <th>name</th>
                <th>Employee</th>
                <th>status</th>
                <th width="64">Actions</th>
            </tr>

        [#list page.content as item]
            <tr>

                <td> ${item.name}</td>
                <td> ${item.userId}</td>
                <td> ${activeMap.get(item.status).descEng}</td>
                <td>
                    <span class="btn_i item_menu">
                        o<span data-itemid="${item.id}">
                         [@showMenu code="110102"]
                         <a href="edit.action?id=${item.id}" class="edit" data-icon="e">Edit</a>
                         [/@showMenu]
                        [@showMenu code="110103"]
                            <a href="detail.action?cashholdId=${item.id} " onclick="window.top.i_p.add(this);return false" title="Cashhold Details" class="detail" data-icon="e">Detail</a>
                        [/@showMenu]
                        [@showMenu code="110104"]
                            <a href="/cashOrder/adjust.action?userId=${item.userId}&toCashholdId=${item.id}&tradeType=3" class="adjust" data-icon="e">Adjust</a>
                        [/@showMenu]
                    </span>
                </td></tr>
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
            var title=$(this).is(".add")?"Cashhold Add":"Cashhold Edit";
            alertM(this.href,{
                title:title,
                time:"y",
                width:400,
                height:360,
                iframe:1
            })
            return false;
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
