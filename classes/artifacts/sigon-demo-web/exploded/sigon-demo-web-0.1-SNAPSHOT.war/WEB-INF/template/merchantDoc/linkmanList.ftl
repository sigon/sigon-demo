<!DOCTYPE html>
<html>
<head>
[#include "/include/head.ftl"]
</head>
<body class="iframe">
<form id="inputForm" action="/paper/linkmanList.action?code=${code}" method="post">
    <input type="hidden" id="queryint" name="queryint" value="1">

    <div class="table">
        [#--<a href="javascript:" class="btn selectSystemBank bg_blue">Select</a><span id="msg" class="red"></span>--]
        [#--<hr>--]
        <table>
            <tr>
                [#--<th>Choose</th>--]
                <th>Role</th>
                <th>Name</th>
                <th>Email</th>
                <th>Mobile</th>
            </tr>
            [#list list as item]
                <tr data-val="${item.id}">
                    [#--<td><input type="radio"  id="selectedSystemBank${item.no}" name="selectedSystemBank" value="${item.id}" class="radio"></td>--]
                    <td>${item.role}</td>
                    <td>${genderEnumMap.get(item.title)} ${item.firstName}&nbsp;${item.lastName}</td>
                    <td>${item.email}</td>
                    <td>${item.mobilePhone}</td>
                    [#--<td>${customerTypeEnumMap.get(item.merchantType).descEng}</td>--]
                </tr>
            [/#list]
        </table>
   [#-- [@pagination pageNumber = page.pageNumber totalPages = page.totalPages]
        [#include "/include/pagination.ftl"]
    [/@pagination]--]
    </div>
</form>
<script>
    seajs.use("alert",function(alertM){
//        $(".selectSystemBank").on("click", function () {
//            var id = $("input:checked").val();
//            $("#msg").html("");
//            if (id == null) {
//                //未选择付款银行
//                $("#msg").html("Select one");
//                return false;
//            }
//            window.parent.refersh_selectLinkman(id);
//        });
        $("td").on("dblclick",function(){
//            var id = $("input:checked").val();
//            $("#msg").html("");
//            if (id == null) {
//                //未选择付款银行
//                $("#msg").html("Select one");
//                return false;
//            }
            window.parent.refersh_selectLinkman($(this).parent().data().val);
        })
        window.parent.setAH($("body").height()+32)
    })

</script>
</body>
</html>