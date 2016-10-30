<!DOCTYPE html>
<html>
<head>
[#include "/include/head.ftl"]
</head>
<body>

<h2 class="page_title">Bank Account List</h2>
<form id="listForm" action="list.action" method="post">
    <input type="hidden" id="queryint" name="queryint" value="1">
    <menu>
        <div class="form">
            <p class="f_1p">
                <label class="f_info">Account Name</label>
                <input type="text" id="accountName" name="accountName" value="${bank.accountName}" >
            </p>


            <p class="f_1p">
                <label class="f_info">Bank</label>
                <select id="bankNameId" name="bankNameId" >
                    <option value="" >All</option>
                [#list bankNameList as item]
                    <option value="${item.id}" [#if item.id==bank.bankNameId]selected[/#if]>${item.shortName}</option>
                [/#list]
                </select>
            </p>

            <p class="f_1p">
                <label class="f_info">Account No</label>
                <input type="text" id="accountNo" name="accountNo" value="${bank.accountNo}" >
            </p>

            <p class="f_1p">
                <label class="f_info">Currency</label>
                <select id="currency" name="currency" >
                    <option value="" >All</option>
                [#list currencyEnum as item]
                    <option value="${item.descEng}" [#if item.descEng==bank.currency]selected[/#if]>${item.descEng}</option>
                [/#list]
                </select>
            </p>

            <p class="f_1p">
                <label class="f_info">Bank Type</label>
                <select id="accountType" name="accountType" >
                    <option value="" >All</option>
                [#list accountTypeEnum as item]
                    <option value="${item.code}" [#if item.code==bank.accountType]selected[/#if]>${item.desc}</option>
                [/#list]
                </select>
            </p>

            <p class="f_1p">
                <label class="f_info">Status</label>
                <select id="status" name="status" >
                    <option value="" >All</option>
                [#list priceCategoryEnum as item]
                    <option value="${item.index}" [#if item.index==bank.status]selected[/#if]>${item.descEng}</option>
                [/#list]
                </select>
            </p>

            <p>
                <input type="checkbox" name="keyExpired" value="1" id="keyExpired" [#if  bank.keyExpired??]checked[/#if]><label class="f_for" for="keyExpired">Ukey Expired</label>
            </p>

            <!--搜索和重置按钮-->
            <p  class="f_1p">
                <button type="submit" id="searchForm" class="btn bg_blue" data-icon="s">Search</button>
                <a href="javascript:" id="reset" class="btn" onclick="resetForm('#listForm')">Reset</a>
            </p>
        </div>

    </menu>
    <div class="table" style="min-width: 1200px;">
        <table>
        [@showMenu code ="050201"]
            <a href="/bank/add.action?method=insert" class="btn add bg_green" data-icon="a">Add</a>
        [/@showMenu]
        [@showMenu code ="050205"]
            <a href="javascript:" id="export" class="btn bg_blue">Export</a>
        [/@showMenu]
            <hr>
            <tr>
                <th width="50">Account Name</th>
                <th width="50">Bank</th>
                <th width="30">Country</th>
                <th width="50">Account No</th>
                <th width="50">Currency</th>
                <th width="50">Pending Balance</th>
                <th width="50">Available Balance</th>
                <th width="50">Bank Type</th>
                <th width="50">Status</th>
                <th width="50">CreateDate[@pageOrder pageable=page.pageable property="create_date"][/@pageOrder]</th>
                <th width="50">Actions</th>
            </tr>
        [#list bankVOList as item]

            <tr >
                [#--//如果keyExpired过期了--]
                [#if dateMap2.get(item.bank.id)??]
                [#if dateMap.get(item.bank.id)??]
                <td class="red" ><span class="b_tip">
                         <a href="/bank/edit.action?id=${item.bank.id}" title="Bank Edit" onclick="window.top.i_p.add(this);return false">${item.bank.accountName}</a>
                    <span class="h_tip">
                          Ukey Expiration Date<br>${item.bank.keyExpired?date}<br>passed
                        </span>
                    </span>
                </td>
                [#else]
                [#--还有三十天过期--]
                    <td style="color: blueviolet" ><span class="b_tip">
                       <a href="/bank/edit.action?id=${item.bank.id}" title="Bank Edit" onclick="window.top.i_p.add(this);return false">${item.bank.accountName}</a>
                             [#--<span class="h_tip">--]
                          [#--Key Expired<br>${item.bank.keyExpired?date}<br>unpassed--]
                        [#--</span>--]
                    </span>
                    </td>
                [/#if]
                [#--//如果keyExpired存在但不过期--]
                [#elseif item.bank.keyExpired??]
                    <td><span class="b_tip">
                        <a href="/bank/edit.action?id=${item.bank.id}" title="Bank Edit" onclick="window.top.i_p.add(this);return false">${item.bank.accountName}</a>
                    </span>
                    </td>
                [#--//如果keyExpired不存在--]
                [#else ]
                    <td> <a href="/bank/edit.action?id=${item.bank.id}" title="Bank Edit" onclick="window.top.i_p.add(this);return false">${item.bank.accountName}</a></td>
                [/#if]
                [#if dateMap2.get(item.bank.id)??]
                    [#if dateMap.get(item.bank.id)??]
                        <td class="red">${item.bankName.shortName}</td>
                        <td class="red">${item.bank.country}</td>
                        <td class="red">${item.bank.accountNo}</td>
                        <td class="red">${item.bank.currency}</td>
                        <td class="red">
                            [#if item.pendingBalance > 0]
                                <a href="/bankDetail/list.action?bankId=${item.bank.id}&bankNameId=${item.bank.bankNameId}&createDateStart=${item.pendingBalanceDateStart}&createDateEnd=${item.pendingBalanceDateEnd}&tradeTypes=7,8&fromUrl=/bank/list.action&queryint=1" title="">[@number num = item.pendingBalance][/@number]</a>
                            [#else]
                                [@number num = item.pendingBalance][/@number]
                            [/#if]
                        </td>
                        <td class="red">
                            [#if item.availableBalance != 0]
                                <a href="/bankDetailView/list.action?bankId=${item.bank.id}&bankNameId=${item.bank.bankNameId}&balanceStatus=2&fromUrl=/bank/list.action&queryint=1" title="">[@number num = item.availableBalance][/@number]</a>
                            [#else]
                                [@number num = item.availableBalance][/@number]
                            [/#if]
                        </td>
                        <td class="red">${accountTypeMap.get(item.bank.accountType).desc}</td>
                        <td class="red">${priceCategoryEnumMap.get(item.bank.status).descEng}</td>
                        <td>[@dateFormat format="yyyy-MM-dd HH:mm:ss" value=item.bank.createDate][/@dateFormat]</td>
                    [#else]
                        <td style="color: blueviolet" >${bankNameMap.get(item.bank.bankNameId)}</td>
                        <td style="color: blueviolet">${item.bank.country}</td>
                        <td style="color: blueviolet" >${item.bank.accountNo}</td>
                        <td style="color: blueviolet" >${item.bank.currency}</td>
                        <td style="color: blueviolet" >
                            [#if item.pendingBalance > 0]
                            <a href="/bankDetail/list.action?bankId=${item.bank.id}&bankNameId=${item.bank.bankNameId}&createDateStart=${item.pendingBalanceDateStart}&createDateEnd=${item.pendingBalanceDateEnd}&tradeTypes=7,8&fromUrl=/bank/list.action&queryint=1" title="">[@number num = item.pendingBalance][/@number]</a>
                            [#else]
                                [@number num = item.pendingBalance][/@number]
                            [/#if]
                        </td>
                        <td style="color: blueviolet" >
                            [#if item.availableBalance != 0]
                                <a href="/bankDetailView/list.action?bankId=${item.bank.id}&bankNameId=${item.bank.bankNameId}&balanceStatus=2&fromUrl=/bank/list.action&queryint=1" title="">[@number num = item.availableBalance][/@number]</a>
                            [#else]
                                [@number num = item.availableBalance][/@number]
                            [/#if]
                        </td>
                        <td style="color: blueviolet" >${accountTypeMap.get(item.bank.accountType).desc}</td>
                        <td style="color: blueviolet" >${priceCategoryEnumMap.get(item.bank.status).descEng}</td>
                        <td>[@dateFormat format="yyyy-MM-dd HH:mm:ss" value=item.bank.createDate][/@dateFormat]</td>

                    [/#if]
                [#else ]
                        <td >${bankNameMap.get(item.bank.bankNameId)}</td>
                        <td>${item.bank.country}</td>
                        <td >${item.bank.accountNo}</td>
                        <td >${item.bank.currency}</td>
                        <td >
                            [#if item.pendingBalance > 0]
                                <a href="/bankDetail/list.action?bankId=${item.bank.id}&bankNameId=${item.bank.bankNameId}&createDateStart=${item.pendingBalanceDateStart}&createDateEnd=${item.pendingBalanceDateEnd}&tradeTypes=7,8&fromUrl=/bank/list.action&queryint=1" title="">[@number num = item.pendingBalance][/@number]</a>
                            [#else]
                                [@number num = item.pendingBalance][/@number]
                            [/#if]
                        </td>
                        <td >
                            [#if item.availableBalance != 0]
                                <a href="/bankDetailView/list.action?bankId=${item.bank.id}&bankNameId=${item.bank.bankNameId}&balanceStatus=2&fromUrl=/bank/list.action&queryint=1" title="">[@number num = item.availableBalance][/@number]</a>
                            [#else]
                                [@number num = item.availableBalance][/@number]
                            [/#if]
                        </td>
                        <td >${accountTypeMap.get(item.bank.accountType).desc}</td>
                        <td >${priceCategoryEnumMap.get(item.bank.status).descEng}</td>
                        <td>[@dateFormat format="yyyy-MM-dd HH:mm:ss" value=item.bank.createDate][/@dateFormat]</td>
                [/#if]
                <!--修改和删除操作-->
                <td>
                    <span class="btn_i item_menu">
                        o<span data-item.bankid="${item.bank.id}">
                        [@showMenu code="050201"]
                         <a href="/bank/add.action?id=${item.bank.id}&type=addLike" class="add" data-icon="e">Add similar</a>
                        [/@showMenu]
                        [@showMenu code="050202"]
                         <a href="/bank/edit.action?id=${item.bank.id}" class="edit" data-icon="e">Modify</a>
                        [/@showMenu]
                        [#if item.bank.status==1]
                            [@showMenu code="050203"]
                        <a href="/bank/adjust.action?id=${item.bank.id}" class="adjust" data-icon="e">Adjust</a>
                            [/@showMenu]
                            [@showMenu code="050204"]
                         <a href="/bank/transfer.action?id=${item.bank.id}" class="transfer" data-icon="e">Transfer</a>
                            [/@showMenu]
                        [/#if]
                        </span>
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
        window.setAH = function(h) {
            $("#alertP").animate({
                height: h
            })
        };
        $(".adjust").on("click",function(){
            alertM(this.href,{
                title:"Bank Account Adjustment Note",
                time:"y",
                width:400,
                iframe:1
            })
            return false;
        });
        $("#reset").on("click",function(){
            $("#status").val("1");
        });
        $(".transfer").on("click",function(){
            alertM(this.href,{
                title:"Bank Account Transfer Note",
                time:"y",
                width:700,
                iframe:1
            })
            return false;
        });


        $("#export").on("click",function(){
            var $t=$(this);
            alertM("将按照列表查询条件导出，确定导出吗？",{
                time:"y",
                title:"导出",
                btns:[
                    {
                        txt:"Export",
                        cls:"bg_blue",
                        func:function(){
                            alertM("Loading",{cls:"loading",time:"y"})
                            $.ajax({
                                url:"export.action",
                                dataType:"json",
                                data: $("#listForm").serialize()
                            }).done(function(data){
                                alertM(data.msg,{cls:data.status,rf:function(){
                                        [@showMenu code="0601"]   if(data.status=="succ")
                                        alertM('已添加异步导出任务到Statistics - Asyc Export Task，请选择继续的操作：<a id="goa1" style="display: none"  href="/exportTask/list.action">Export Task List</a>',{
                                            time:"y",
                                            title:"导出",
                                            btns:[
                                                {
                                                    txt:"停留在当前页"
                                                },
                                                {
                                                cls:"bg_blue",
                                                txt:"去 Asyc Export Task 看看下载",
                                                func:function(){
                                                    window.top.i_p.add(document.getElementById("goa1"));
                                                }}
                                            ]
                                        })
                                        [/@showMenu]
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