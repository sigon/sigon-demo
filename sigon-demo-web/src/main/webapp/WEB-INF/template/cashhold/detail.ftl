<!DOCTYPE html>
<html>
<head>
[#include "/include/head.ftl"]
</head>
<body>

<h2 class="page_title">Cashhold Details</h2>
<form id="listForm" action="detail.action" method="post">
    <menu>
        <div class="form">

            <p class="f_1p">
                <label class="f_info">Employee</label>
                <select id="cashholdId" name="cashholdId" >
                    <option value="" >Select All</option>
                [#list cashholdList as item]
                    <option value="${item.id}" [#if item.id==cash.cashholdId]selected[/#if]> ${item.name}-${item.userId}</option>
                [/#list]
                </select>
            </p>
            <p class="f_1p">
                <label class="f_info">Currency</label>
                <select id="currency" name="currency" >
                    <option value="" >Select All</option>
                [#list currencyEnum as item]
                    <option value="${item.descEng}" [#if item.descEng==cash.currency]selected[/#if]>${item.descEng}</option>
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
[@showMenu code="110104"]
            <a id="adjust" class="btn add bg_green" data-icon="a">Adjust</a>
    [/@showMenu]
            <hr>
        <table>
            <tr>
                <th>Employee</th>
                <th>Balance</th>
                <th>Currency</th>
            </tr>

        [#list page.content as item]
            <tr>
                <td> ${item.userId}</td>
                <td><a  href="/cashDetail/list.action?cashholdId=${item.cashholdId}&currency=${item.currency}&title=Employee Cash Transaction Details" onclick="window.top.i_p.add(this);return false" title="Employee Cash Transaction Details">[@number num=item.balance][/@number]</a></td>
                <td> ${item.currency}</td>
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
        $("#adjust").on("click", function(){
            if ($("#cashholdId").val()==""){
                alertM("需要选择一个Employee",{cls:"error"})
                return false;
            }
            $(this).attr("href","/cashOrder/adjust.action?toCashholdId="+$("#cashholdId").val()+"&tradeType=3" );

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
