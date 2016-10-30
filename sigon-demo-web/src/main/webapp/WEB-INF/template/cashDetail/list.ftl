<!DOCTYPE html>
<html>
<head>
[#include "/include/head.ftl"]
</head>
<body>

<h2 class="page_title">${title}</h2>
<form id="listForm" action="list.action" method="post">
    <menu>
        <div class="form">
            <input type="hidden" name="title" value="${title}">
[#if title=="My Cash Transaction Details"]
            <input type="hidden" name="cashholdId" value="${cashDetail.cashholdId}">
[/#if]
            [#if title!="My Cash Transaction Details"]
            <p class="f_1p">
                <label class="f_info">Employee</label>
                <select id="cashholdId" name="cashholdId" >
                    <option value="" >Select All</option>
                [#list cashholdList as item]
                    <option value="${item.id}" [#if item.id==cashDetail.cashholdId]selected[/#if]> ${item.name}-${item.userId}</option>
                [/#list]
                </select>
            </p>
            [/#if]
            <p class="f_1p">
                <label class="f_info">Currency</label>
                <select id="currency" name="currency" >
                    <option value="" >Select All</option>
                [#list currencyEnum as item]
                    <option value="${item.descEng}" [#if item.descEng==cashDetail.currency]selected[/#if]>${item.descEng}</option>
                [/#list]
                </select>
            </p>
            <p class="f_1p">
                <label class="f_info">Order No</label>
                <input type="text" id="orderNo" name="orderNo" value="${cashDetail.orderNo}" >
            </p>
            <!--搜索和重置按钮-->
            <p  class="f_1p">
                <button type="submit" id="searchForm" class="btn bg_blue" data-icon="s">Search</button>
                <a href="javascript:" id="reset" class="btn " onclick="resetForm('#listForm')">Reset</a>
            </p>
        </div>

    </menu>
    <div class="table">

        <table>
            <tr>
                <th>Order No</th>
                <th>Trade Date[@pageOrder pageable=page.pageable property="id"][/@pageOrder]</th>
                <th>Currency</th>
                <th>Credit</th>
                <th>Debit</th>
                <th>Balance</th>
                <th>Employee</th>
            </tr>

        [#list page.content as item]
            <tr>

                <td> [@orderLink orderNo = item.orderNo userName=item.userId ]${item.orderNo}[/@orderLink]</td>
                <td> ${item.createDate?datetime}</td>
                <td> ${item.currency}</td>
                <td> [#if item.amount<0][@number num=item.amount*-1][/@number][/#if]</td>
                <td> [#if item.amount>0][@number num=item.amount][/@number][/#if]</td>
                <td> [@number num=item.balance][/@number]</td>
                <td> ${item.userId}</td>

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
