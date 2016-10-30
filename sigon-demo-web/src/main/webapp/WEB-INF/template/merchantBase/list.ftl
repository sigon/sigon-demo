<!DOCTYPE html>
<html>
<head>
[#include "/include/head.ftl"]
</head>
<body>

<h2 class="page_title">MerchantBase List</h2>
<form id="listForm" action="list.action" method="post">
    <menu>
        <div class="form">
            <p class="f_1p">
                <label class="f_info">Password</label>
                <input type="text" id="password" name="password" value="${merchantBase.password}" >
            </p>
            <p class="f_1p">
                <label class="f_info">Code</label>
                <input type="text" id="code" name="code" value="${merchantBase.code}" >
            </p>
            <p class="f_1p">
                <label class="f_info">Salt</label>
                <input type="text" id="salt" name="salt" value="${merchantBase.salt}" >
            </p>
            <p class="f_1p">
                <label class="f_info">Level</label>
                <input type="text" id="level" name="level" value="${merchantBase.level}" >
            </p>
            <p class="f_1p">
                <label class="f_info">Tel</label>
                <input type="text" id="tel" name="tel" value="${merchantBase.tel}" >
            </p>
            <p class="f_1p">
                <label class="f_info">MerchantType</label>
                <input type="text" id="merchantType" name="merchantType" value="${merchantBase.merchantType}" >
            </p>
            <p class="f_1p">
                <label class="f_info">Email</label>
                <input type="text" id="email" name="email" value="${merchantBase.email}" >
            </p>
            <p class="f_1p">
                <label class="f_info">LockState</label>
                <input type="text" id="lockState" name="lockState" value="${merchantBase.lockState}" >
            </p>
            <p class="f_1p">
                <label class="f_info">Status</label>
                <input type="text" id="status" name="status" value="${merchantBase.status}" >
            </p>
            <!--搜索和重置按钮-->
            <p  class="f_1p">
                <button type="submit" id="searchForm" class="btn" data-icon="s">Search</button>
                <a href="javascript:" id="reset" class="btn" onclick="resetForm('#listForm')">Reset</a>
            </p>
        </div>
    </menu>
    <div class="table">
        <table>
            <tr>
                <th>password</th>
                <th>code</th>
                <th>salt</th>
                <th>level</th>
                <th>tel</th>
                <th>merchantType</th>
                <th>email</th>
                <th>lockState</th>
                <th>status</th>
                <th width="64">Actions</th>
            </tr>

        [#list page.content as item]
            <tr>

<td> ${item.password} </td>
<td> ${item.code} </td>
<td> ${item.salt} </td>
<td> ${item.level} </td>
<td> ${item.tel} </td>
<td> ${item.merchantType} </td>
<td> ${item.email} </td>
<td> ${item.lockState} </td>
<td> ${item.status} </td>                <td>
                    <span class="btn_i item_menu">
                        o<span data-itemid="${item.id}">
                         <a href="edit.action?id=${item.id}" class="edit" data-icon="e">Edit</a>
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
