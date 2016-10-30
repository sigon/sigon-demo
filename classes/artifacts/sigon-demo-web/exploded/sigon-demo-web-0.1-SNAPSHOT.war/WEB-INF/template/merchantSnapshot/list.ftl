<!DOCTYPE html>
<html>
<head>
[#include "/include/head.ftl"]
</head>
<body>

<h2 class="page_title">MerchantSnapshot List</h2>
<form id="listForm" action="list.action" method="post">
    <menu>
        <div class="form">
            <p class="f_1p">
                <label class="f_info">DocNum</label>
                <input type="text" id="docNum" name="docNum" value="${merchantSnapshot.docNum}" >
            </p>
            <p class="f_1p">
                <label class="f_info">Note</label>
                <input type="text" id="note" name="note" value="${merchantSnapshot.note}" >
            </p>
            <p class="f_1p">
                <label class="f_info">OrderNo</label>
                <input type="text" id="orderNo" name="orderNo" value="${merchantSnapshot.orderNo}" >
            </p>
            <p class="f_1p">
                <label class="f_info">Code</label>
                <input type="text" id="code" name="code" value="${merchantSnapshot.code}" >
            </p>
                    [@inputRegion id="nextChecklistDate" type="date" start=merchantSnapshot.nextChecklistDateStart end=merchantSnapshot.merchantSnapshotEnd]
                    [#include "/include/inputregion.ftl"]
                    [/@inputRegion]
            <p class="f_1p">
                <label class="f_info">IdType</label>
                <input type="text" id="idType" name="idType" value="${merchantSnapshot.idType}" >
            </p>
            <p class="f_1p">
                <label class="f_info">Mobile</label>
                <input type="text" id="mobile" name="mobile" value="${merchantSnapshot.mobile}" >
            </p>
            <p class="f_1p">
                <label class="f_info">AuthorisePersonId</label>
                <input type="text" id="authorisePersonId" name="authorisePersonId" value="${merchantSnapshot.authorisePersonId}" >
            </p>
                    [@inputRegion id="remindDate" type="date" start=merchantSnapshot.remindDateStart end=merchantSnapshot.merchantSnapshotEnd]
                    [#include "/include/inputregion.ftl"]
                    [/@inputRegion]
            <p class="f_1p">
                <label class="f_info">RegistrationAddress</label>
                <input type="text" id="registrationAddress" name="registrationAddress" value="${merchantSnapshot.registrationAddress}" >
            </p>
            <p class="f_1p">
                <label class="f_info">PlaceOfIssue</label>
                <input type="text" id="placeOfIssue" name="placeOfIssue" value="${merchantSnapshot.placeOfIssue}" >
            </p>
            <p class="f_1p">
                <label class="f_info">Attachment</label>
                <input type="text" id="attachment" name="attachment" value="${merchantSnapshot.attachment}" >
            </p>
            <p class="f_1p">
                <label class="f_info">Name</label>
                <input type="text" id="name" name="name" value="${merchantSnapshot.name}" >
            </p>
                    [@inputRegion id="issueDate" type="date" start=merchantSnapshot.issueDateStart end=merchantSnapshot.merchantSnapshotEnd]
                    [#include "/include/inputregion.ftl"]
                    [/@inputRegion]
            <p class="f_1p">
                <label class="f_info">RegisterName</label>
                <input type="text" id="registerName" name="registerName" value="${merchantSnapshot.registerName}" >
            </p>
            <!--搜索和重置按钮-->
            <p  class="f_1p">
                <button type="submit" id="searchForm bg_blue" class="btn" data-icon="s">Search</button>
                <a href="javascript:" id="reset" class="btn" onclick="resetForm('#listForm')">Reset</a>
            </p>
        </div>

    </menu>
    <div class="table">
            <a href="add.action" class="btn add bg_green" data-icon="a">Add</a>
            <hr>
        <table>
            <tr>
                <th>docNum</th>
                <th>note</th>
                <th>orderNo</th>
                <th>code</th>
                <th>nextChecklistDate</th>
                <th>idType</th>
                <th>mobile</th>
                <th>authorisePersonId</th>
                <th>remindDate</th>
                <th>registrationAddress</th>
                <th>placeOfIssue</th>
                <th>attachment</th>
                <th>name</th>
                <th>issueDate</th>
                <th>registerName</th>
                <th width="64">Actions</th>
            </tr>

        [#list page.content as item]
            <tr>

<td> ${item.docNum} </td>
<td> ${item.note} </td>
<td> ${item.orderNo} </td>
<td> ${item.code} </td>
<td> ${item.nextChecklistDate?datetime} </td>
<td> ${item.idType} </td>
<td> ${item.mobile} </td>
<td> ${item.authorisePersonId} </td>
<td> ${item.remindDate?datetime} </td>
<td> ${item.registrationAddress} </td>
<td> ${item.placeOfIssue} </td>
<td> ${item.attachment} </td>
<td> ${item.name} </td>
<td> ${item.issueDate?datetime} </td>
<td> ${item.registerName} </td>                <td>
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
        $(".edit,.add").on("click",function(){
            var title=$(this).is(".add")?"MerchantSnapshot Add":"MerchantSnapshot Edit";
            alertM(this.href,{
                title:title,
                time:"y",
                width:660,
                height:400,
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
