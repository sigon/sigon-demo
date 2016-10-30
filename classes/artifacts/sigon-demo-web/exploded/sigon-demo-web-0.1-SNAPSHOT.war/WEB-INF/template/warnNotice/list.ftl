
<!DOCTYPE html>
<html>
<head>
[#include "/include/head.ftl"]

</head>
<body>

<h2 class="page_title">Warn Notice</h2>
<form id="listForm" action="list.action" method="post">
    <input type="hidden" id="queryint" name="queryint" value="1">
    <menu>
        <div class="form">
            <p class="f_1p" id="enum1">
                <label class="f_info">Warn Type</label>
                <select name="warnType" id="warnType">
                    <option value="">Please select</option>
                    <!--对枚举进行遍历-->
                    [#list warnTypeEnum as item]
                    <option value="${item.id}" [#if warnNotice.warnType==item.id]selected[/#if]>${item.descEng}</option>
                    [/#list]
                </select>
            </p>

            <p class="f_1p">
                <label class="f_info">Email</label>
                <input type="text" id="email" name="email" value="${warnNotice.email}" data-v="validate[custom[onlyLetterNumber]]">
            </p>
            [#--<p class="f_1p">
                <label class="f_info">Tel</label>
                <select id="addressEnum" name="addressEnum" class="f_short">
                    <option value="">请选择</option>
                    [#list addressEnum as item]
                        --][#--[#if warnNotice.tel!=null]--][#--
                            --][#--<option value="${item.countryCode}" [#if warnNotice.tel.substring(0,3)==item.countryCode]selected[/#if]>${item.countryCode}</option>--][#--
                        --][#--[#else ]--][#--
                            <option value="${item.countryCode}" [#if countryCode==item.countryCode]selected[/#if]>${item.countryCode}</option>
                        --][#--[/#if]--][#--
                    [/#list]
                </select>
                    <input type="text" id="phone" name="phone" value="${warnNotice.tel}" >
            </p>--]
            <p class="f_2p" >
                <label class="f_info">Tel</label>
                [@phoneNum phoneNum=phoneNumParam select="yes" style="width:112px;margin: 0;"]
                    [#include "/include/phoneNum.ftl"]
                [/@phoneNum]
            </p>
            <!--搜索和重置按钮-->
            <p class="f_1p">
                <label class="f_info">&nbsp;</label>
                <button type="submit" id="searchForm" class="btn bg_blue" data-icon="s">Search</button>
                <a href="javascript:" id="reset" class="btn" onclick="resetForm('#listForm')">Reset</a>
            </p>
        </div>

    </menu>
    <div class="table">
        <table>
        [@showMenu code="990501"]
            <a href="add.action" class="btn add bg_green" data-icon="a">Create New</a>
        [/@showMenu]
            <hr>
            <tr>
                <th>Warn Type</th>
                <th>Email</th>
                <th>Tel</th>
                <th>CreateDate</th>
                <th>操作</th>
            </tr>

        [#list page.content as item]
            <tr>
                <td>${warnTypeEnumMap.get(item.warnType).descEng}</td>
                <td>${item.email}</td>
                <td>${item.tel}</td>
                <td>[@dateFormat format="yyyy-MM-dd HH:mm:ss" value=item.createDate][/@dateFormat]</td>
                <!--修改和删除操作-->
                <td>
                    <span class="btn_i item_menu">
                        o<span data-itemid="${item.id}">
                        [@showMenu code="990502"]
                            <a target="r_body" href="edit.action?id=${item.id}"  class="edit" data-icon="e">Edit</a>
                        [/@showMenu]
                        [@showMenu code="990503"]
                            <a href="javascript:void(0);" class="chg_stu" data-icon="d">Delete</a>
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
    seajs.use("alert",function(alertM){

        $(".edit,.add").on("click",function(){
            var title=$(this).is(".add")?"WarnNotice Add":"WarnNotice Edit";
            alertM(this.href,{
                title:title,
                time:"y",
                width:350,
                height:300,
                iframe:1
            })
            return false;
        });
        $("table").on("click",".chg_stu",function(){
            var $t=$(this);
            var idForDelete=$t.parent().data("itemid") ;
            alertM("Are you sure delete the WarnNotice?",{
                time:"y",
                title:"Delete",
                btns:[
                    {
                        txt:"Cancel"
                    },
                    {
                        txt:$t.html(),
                        cls:"bg_red",
                        func:function(){
                            alertM("Loading",{cls:"loading",time:"y"});
                            $.ajax({
                                url:"delete.action",
                                dataType:"json",
                                data:{
                                    id:idForDelete
                                }
                            }).done(function(data){
                                alertM(data.msg,{cls:data.status,rf:function(){
                                    if(data.status=="succ")
                                        window.location.href="list.action";
                                }})
                            });
                            return false;
                        }
                    }

                ]
            })
        });
        $("#searchForm").click(function(){
            $("#pageNumber").val("1");
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