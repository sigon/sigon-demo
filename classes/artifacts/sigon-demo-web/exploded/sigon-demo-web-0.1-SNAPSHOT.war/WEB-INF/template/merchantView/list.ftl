<!DOCTYPE html>
<html>
<head>
[#include "/include/head.ftl"]
</head>
<body>

<h2 class="page_title">Merchant List</h2>
<form id="listForm" action="list.action" method="post">
    <input type="hidden" name="queryint" value="1">
    <menu>
        <div class="form">
            <p class="f_1p">
                <label class="f_info">Code</label>
                <input type="text" id="code" name="code" value="${param.code}" >
            </p>
            <p class="f_1p">
                <label class="f_info">Mobile</label>
                <input type="text" id="tel" name="tel" value="${param.tel}" >
            </p>
            <p class="f_1p">
                <label class="f_info">Email</label>
                <input type="text" id="email" name="email" value="${param.email}" >
            </p>
            <p class="f_1p">
                <label class="f_info">Merchant Type</label>
                <select id="merchantType" name="merchantType">
                    <option value="">All</option>
                    [#list merchantTypeEnumList as item]
                    <option value="${item.code}" [#if param.merchantType == item.code]selected[/#if]>${item.desc}</option>
                    [/#list]
                </select>
            </p>
            <p class="f_1p">
                <label class="f_info">System Type</label>
                <select id="systemType" name="systemType">
                    <option value="">All</option>
                [#list systemTypeEnumList as item]
                    <option value="${item.code}" [#if param.systemType == item.code]selected[/#if]>${item.desc}</option>
                [/#list]
                </select>
            </p>
            <p class="f_1p">
                <label class="f_info">Risk Level</label>
                <select id="riskLevel" name="riskLevel">
                    <option value="">All</option>
                    <option value="0" [#if param.riskLevel == 0]selected[/#if]>unspecified</option>
                    [#list riskLevelEnumList as item]
                    <option value="${item.id}" [#if param.riskLevel == item.id]selected[/#if]>${item.desc}</option>
                    [/#list]
                </select>
            </p>
            <p class="f_1p">
                <label class="f_info">Status</label>
                <select id="status" name="status">
                    <option value="">All</option>
                    [#list merchantStatusEnumList as item]
                    <option value="${item.id}" [#if param.status == item.id]selected[/#if]>${item.desc}</option>
                    [/#list]
                </select>
            </p>
            <p class="f_1p">
                <label class="f_info">First Name</label>
                <input type="text" id="firstName" name="firstName" value="${param.firstName}" >
            </p>
            <p class="f_1p">
                <label class="f_info">Last Name</label>
                <input type="text" id="lastName" name="lastName" value="${param.lastName}" >
            </p>
            <p class="f_1p">
                <label class="f_info">Business Name</label>
                <input type="text" id="businessName" name="businessName" value="${param.businessName}" >
            </p>
            <!--搜索和重置按钮-->
            <p  class="f_1p">
                <button type="submit" id="searchForm" class="btn bg_blue" data-icon="s">Search</button>
                <a href="javascript:" id="reset" class="btn" onclick="resetForm('#listForm')">Reset</a>
            </p>
        </div>

    </menu>
    <div class="table">
    [@showMenu code="030201"]
        <a href="/merchant/infoAdd.action" class="btn add bg_green" data-icon="a">Add</a>
        <hr>
    [/@showMenu]
        <table>
            <tr>
                <th>Merchant Code(Risk level)</th>
                <th>Merchant Type</th>
                <th>Name</th>
                <th>email</th>
                <th>Mobile</th>
                <th>Status[@pageOrder pageable=page.pageable property="status"][/@pageOrder]</th>
                <th>LockState</th>
                <th>Onboarding Date[@pageOrder pageable=page.pageable property="create_date"][/@pageOrder]</th>
                <th width="64">Actions</th>
            </tr>

        [#list page.content as item]
            <tr>

                <td><a href="/basicInfo/info.action?code=${item.code}" onclick="window.top.i_p.add(this);return false"> ${item.code} </a> [#if item.status==2]<span class="verfired"></span>[/#if] [#if item.riskLevel??]<span style="color:${riskLevelEnumMap.get(item.riskLevel).color}">(Level ${riskLevelEnumMap.get(item.riskLevel).desc})</span>[#else](Level Unspecified) [/#if]</td>
                <td>${merchantTypeEnumMap.get(item.merchantType).desc}</td>
                <td>[#if item.merchantType == 1]
                        [#assign name=genderEnumMap.get(item.companyType).desc + " " + item.businessName + " " + item.registNumber]
                    [#else]
                        [#assign name=item.businessName]
                    [/#if]
                    [@subString content=name length=20/]
                    </td>
                <td>[@subString content=item.email length=20][/@subString]</td>
                <td> ${item.tel} </td>
                <td> ${merchantStatusEnumMap.get(item.status).desc} </td>
                <td> ${merchantLockStateEnumMap.get(item.lockState).desc} </td>
                <td> ${item.createDate?string("dd/MM/yy")} </td>
                <td>
                    <span class="btn_i item_menu">
                        o<span data-item="${item.code}">
                        [@showMenu code="030202"]
                         <a href="/merchant/addSame.action?code=${item.code}" class="add" data-icon="e">Add similar</a>
                        [/@showMenu]
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

        $("#merchantType").on("change", function(){
            if($(this).val() == 1){
                $("#businessName").hide();
                $("#firstName").show();
                $("#lastName").show();
            }else if($(this).val() == 2){
                $("#businessName").show();
                $("#firstName").hide();
                $("#lastName").hide();
            }else{
                $("#businessName").show();
                $("#firstName").show();
                $("#lastName").show();
            }
        }).trigger("change");
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
