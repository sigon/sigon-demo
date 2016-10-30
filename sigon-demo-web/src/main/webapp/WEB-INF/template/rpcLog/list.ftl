<!DOCTYPE html>
<html>
<head>
[#include "/include/head.ftl"]
    <script src="/js_mrptrader/datepicker/wdatepicker.js" type="text/javascript"></script>
</head>
<body>
<h2 class="page_title">Rpc Log</h2>

<form id="listForm" action="/rpcLog/list.action" method="post">
    <input type="hidden" id="queryint" name="queryint" value="1">
    <menu>
        <div class="form">
            <p class="f_1p">
                <label class="f_info">Merchant Code</label>
                <input type="text" id="merchantCode" name="merchantCode" value="${merchantCode}" >
            </p>
            <p class="f_1p" id="enum">
                <label class="f_info">Interface type</label>
                <select name="type" id="type">
                    <option value="">All</option>
                    [#list rpcLogTypeEnum as item]
                        <option value="${item.rpcLogType}" [#if item.rpcLogType==rpcLogParam.type]
                                selected [/#if]>${item.desc}</option>
                    [/#list]
                </select>
            </p>
            <p class="f_1p">
                <label class="f_info">Interface Parameter</label>
                <input type="text" id="urlParam" name="urlParam" value="${urlParam}" >
            </p>
            <p class="f_2p">
                <label class="f_info">Create Date</label>
            [@inputRegion id="createTime" type="date" start=rpcLogParam.createTimeStart end=rpcLogParam.createTimeEnd]
                [#include "/include/inputregion.ftl"]
            [/@inputRegion]
            </p>
            <p class="f_1p">
                <button type="submit" id="searchForm" class="btn bg_blue" data-icon="s">Search</button>
                <a href="javascript:" id="reset" class="btn" onclick="resetForm('#listForm')">Reset</a>
            </p>
        </div>
    </menu>

    <div class="table">
        <table>
            <tr>
                <th>Merchant code</th>
                <th>Interface parameter</th>
                <th>Interface respond result</th>
                <th width="150">Interface instruction</th>
                <th width="100">Invoke time</th>
            </tr>
        [#list page.content as item]
            <tr>
                <td><a href="/basicInfo/info.action?code=${item.merchantCode}" onclick="window.top.i_p.add(this);return false">${item.merchantCode}</a></td>
                <td>[#if item.urlParam?ends_with(".txt")]
                    <a href="http://rpc.latipay.co.nz/exchange/notifyS.action?v_filename=${item.urlParam}" target="_blank">
                        [@subString content=item.urlParam length=40][/@subString]
                    </a>
                    [#else]
                        [@subString content=item.urlParam length=40][/@subString]
                    [/#if]</td>
                <td><pre>[@subString content=item.result length=40][/@subString]</pre></td>
                <td>${item.comment}</td>
                <td>${item.createTimeStr}</td>
            </tr>
        [/#list]
        </table>
    [@pagination pageNumber = page.pageNumber totalPages = page.totalPages]
        [#include "/include/pagination.ftl"]
    [/@pagination]
    </div>
</form>
<script>
    seajs.use("alert", function (alertM) {
        $("#searchForm").click(function () {
            $("#pageNumber").val("1");
        });

        $("#reset").click(function () {

        });
    })
</script>
[#include "/include/footer.ftl"]
</body>
</html>