<!DOCTYPE html>
<html>
<head>
[#include "/include/head.ftl"]
</head>
<body>

<h2 class="page_title">MerchantAttachment List</h2>
<form id="listForm" action="list.action" method="post">
    <menu>
        <div class="form">
            <p class="f_1p">
                <label class="f_info">AttachmentType</label>
                <input type="text" id="attachmentType" name="attachmentType" value="${merchantAttachment.attachmentType}" >
            </p>
            <p class="f_1p">
                <label class="f_info">Name</label>
                <input type="text" id="name" name="name" value="${merchantAttachment.name}" >
            </p>
            <p class="f_1p">
                <label class="f_info">ModuleId</label>
                <input type="text" id="moduleId" name="moduleId" value="${merchantAttachment.moduleId}" >
            </p>
            <p class="f_1p">
                <label class="f_info">FileType</label>
                <input type="text" id="fileType" name="fileType" value="${merchantAttachment.fileType}" >
            </p>
            <p class="f_1p">
                <label class="f_info">Url</label>
                <input type="text" id="url" name="url" value="${merchantAttachment.url}" >
            </p>
            <!--搜索和重置按钮-->
            <p  class="f_1p">
                <button type="submit" id="searchForm" class="btn" data-icon="s">Search</button>
                <a href="javascript:" id="reset" class="btn" onclick="resetForm('#listForm')">Reset</a>
            </p>
        </div>
        <a href="add.action" class="btn add" data-icon="a">Add</a>
    </menu>
    <div class="table">
        <table>
            <tr>
                <th>attachmentType</th>
                <th>name</th>
                <th>moduleId</th>
                <th>fileType</th>
                <th>url</th>
                <th width="64">Actions</th>
            </tr>

        [#list page.content as item]
            <tr>

<td> ${item.attachmentType} </td>
<td> ${item.name} </td>
<td> ${item.moduleId} </td>
<td> ${item.fileType} </td>
<td> ${item.url} </td>                <td>
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
