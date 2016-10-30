<form id="listForm" action="list.action" method="post">
    <input type="hidden" name="code" value="${code}">
    [#if hasStep]
        <div class="step">
            <a href="" >Step1 Merchant Profile</a>
            <a href="" class="on">Step 2 Authorise Person</a>
            <a href="">Step 3 Gateway Setting</a>
        </div>
    [/#if]
    <div class="table">
    [@showMenu code="030224"]
        <a href="/merchant/personAdd.action?code=${code}" class="btn add bg_green" data-icon="a">Add</a>
        <hr>
    [/@showMenu]
        <table>
            <tr>
                <th>Name</th>
                <th>Is Primary</th>
                <th>Role</th>
                <th>Mobile Phone</th>
                <th>Email</th>
                <th></th>
            </tr>

        [#list page.content as item]
            <tr>

                <td>${genderEnumMap.get(item.title)} [@subString content=item.firstName + " " +item.lastName length=20/] </td>
                <td> ${whetherEnumMap.get(item.primaryContact).descEng} </td>
                <td> ${item.role} </td>
                <td> ${item.mobilePhone} </td>
                <td>[@subString content=item.email length=20/] </td>
                <td>
                    <span class="btn_i item_menu">
                        o<span data-itemid="${item.id}">
                        [@showMenu code="030226"]
                            <a href="#" class="delete" data-icon="d" data-name="${item.firstName} ${item.lastName}">Delete</a>
                        [/@showMenu]
                        [@showMenu code="030225"]
                            <a href="/merchant/personEdit.action?id=${item.id}&code=${code}" data-icon="e" class="edit">Edit</a>
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
        <p>
        [#if hasAuth]
            <Button type="button" id="sbEdit" class="btn bg_blue">[#if isEdit]Back[#else]Next[/#if]</Button>
        [#--[#else]
            <Button type="button" id="backBtn" class="btn bg_blue">Finish</Button>--]
        [/#if]
        </p>
    </div>

</form>

<script>

    seajs.use(["alert","validation"], function (alertM) {
        $("#sbEdit").on("click", callback);
        $("#backBtn").on("click", function(){
            window.location.href = "/merchantView/list.action";
        });
        $(".edit,.add").on("click",function(){
            var title=$(this).is(".add")?"Merchant Authorise Person Add":"Merchant Authorise Person Edit";
            alertM(this.href,{
                title:title,
                time:"y",
                width:800,
                height:400,
                iframe:1
            })
            return false;
        });

        window.refresh=function(t){
            if(t)
                window.location.reload()
            alertM.remove()
        }
        $("table").on("click",".delete",function(){
            var $t=$(this);
            var id=$t.parent().data("itemid") ;
            var name=$t.data("name");
            alertM("Are you sure delete the Authorise Person [Name="+name+"]?",{
                time:"y",
                title:"Delete Item",
                btns:[
                    {
                        txt:$t.html(),
                        cls:"bg_red",
                        func:function(){
                            alertM("Loading",{cls:"loading",time:"y"})
                            $.ajax({
                                url:"/merchantAuthorisePerson/delete.action",
                                dataType:"json",
                                data:{
                                    id:id
                                }
                            }).done(function(data){
                                alertM(data.msg,{cls:data.status,rf:function(){
                                    if(data.status=="succ")
                                        window.location.reload();
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
    })
</script>