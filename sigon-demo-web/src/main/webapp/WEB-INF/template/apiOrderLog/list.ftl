<!DOCTYPE html>
<html>
<head>
[#include "/include/head.ftl"]
    <script src="/js_mrptrader/datepicker/wdatepicker.js" type="text/javascript"></script>
</head>
<body>

<h2 class="page_title">ApiOrder Log</h2>
<form id="listForm" action="list.action" method="post">
    <input type="hidden" id="queryint" name="queryint" value="1">
    <menu>
        <div class="form">
            <p class="f_1p">
                <label class="f_info">Merchant Code</label>
                <input type="text" id="merchantCode" name="merchantCode" value="${apiOrderLog.merchantCode}" >
            </p>
            <p class="f_1p">
                <label class="f_info">IP</label>
                <input type="text" id="ip" name="ip" value="${apiOrderLog.ip}" >
            </p>
            <p class="f_1p">
                <label class="f_info">Type</label>
                <select name="type">
                    <option value="">All</option>
                    [#list typeMap as item]
                        <option value="${item.descEng}" [#if item.descEng == apiOrderLog.type]selected[/#if]> ${item.desc}</option>
                    [/#list]
                </select>
            </p>
            <p class="f_2p">
                <label class="f_info">Date</label>
                [@inputRegion id="date" type="date" start=dateStart end=dateEnd]
                    [#include "/include/inputregion.ftl"]
                [/@inputRegion]
            </p>
            <p class="f_1p">
                <button id="searchForm" type="submit" class="btn bg_blue" data-icon="s">Search</button>
                <a href="javascript:" id="reset" class="btn" onclick="resetForm('#listForm')">Reset</a>
            </p>
        </div>
    </menu>
    <div class="table">
        <table>
            <tr>
                <th>MerchantCode</th>
                <th>Ip</th>
                <th>UserAgent</th>
                <th>params</th>
                <th>Desc</th>
                <th width="80">Type</th>
                <th width="160">createTime[@pageOrder pageable=page.pageable property="createTime"][/@pageOrder]</th>
            </tr>
        [#list page.content as item]
            <tr>
                <td><a href="/basicInfo/info.action?code=${item.merchantCode}" onclick="window.top.i_p.add(this);return false">${item.merchantCode}</a></td>
                <td>${item.ip}</td>
                <td>[@subString content=item.userAgent length=40][/@subString]</td>
                <td>[@subString content=item.signParams length=40][/@subString]</td>
                <td>${item.logDesc}</td>
                <td>${getTypeMap.get(item.type)}</td>
                <td>${item.createTimeStr}</td>
            </tr>
        [/#list]
        </table>
    [@pagination pageNumber = page.pageNumber totalPages = page.totalPages]
        [#include "/include/pagination.ftl"]
    [/@pagination]
    </div>
</form>
[#include "/include/footer.ftl"]
</body>
</html>