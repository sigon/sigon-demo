[#if historyList?size>0]
<div class="table">
    <h4>Payment History</h4>
    [#if onPage == null]
        [/#if]
        <table id="table_1">
            <tr>
                <th width="135">Date</th>
                <th width="40"></th>
                <th>Bank</th>
                <th>Bank Branch</th>
                <th>Account name</th>
                <th>Account no</th>
                <th>Currency</th>
                <th>Amount</th>
                <th>Fee</th>
                <th>Processed by</th>
            </tr>
            [#list historyList as item]
                <tr>
                    <td>[#if item.gateway==null]${item.createDate?date}[#else ]${item.createDate?datetime}[/#if]</td>
               <td> [#if item.gateway==null]<a href="javascript:" class="btn_i td_down">M</a> [/#if]</td>
                    <td>${item.bankName}</td>
                    <td>${item.bankBranch}</td>
                    <td>${item.accountName}</td>
                    <td>${item.accountNo}</td>
                    <td>${item.currency}</td>
                    <td> [@number num = item.amount][/@number]</td>
                    <td> [@number num = item.fee][/@number]</td>
                    <td>${item.user}</td>
                </tr>

                <tr class="tr_hide">
                    <td colspan="99">
                        <div class="form_detail">
                            <p>
                                <label>Country:</label> <b>${item.country}</b>
                                <i class="orange icon-close"></i>
                            </p>
                            <p>
                                <label>Remark:</label>
                                <b>[@showValue value=item.remark][/@showValue]</b>
                            </p>
                        </div>
                        <div class="form_detail">
                            <p class="form_detail_margin">
                                <label>CNAPS code/Swift Code:</label>
                                <b>${item.unionCode}</b>
                            </p>

                        </div>
                    </td>
                </tr>

            [/#list]
        </table>
        [#if onPage]
        <p class="f_2p">
            [#if type]
                <a href="${type}" class="btn " data-icon="p">Back</a>
            [#else]
                <a href="javascript:history.go(-1)" class="btn " data-icon="p">Back</a>
            [/#if]
        </p>
        [/#if]
    </div>
[/#if]