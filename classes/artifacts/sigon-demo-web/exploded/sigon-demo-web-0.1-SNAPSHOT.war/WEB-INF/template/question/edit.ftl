[#assign title="Update Question"]
[#assign header="merchant"]
[#assign nav="profile"]
[#assign model="question"]
<!DOCTYPE html>
<html>
<head>
[#include "/include/head.ftl"]
</head>
<body>
[#assign menu="Risk"]
[#include "/basicInfo/menu.ftl"]
<h2 class="page_title">Update Question</h2>
<form id="form" method="post" class="form form_short_info">
    <input type="hidden" name="code" value="${code}" id="code">
    <input type="hidden" name="merchantType" value="${merchantType}">

        [#--<a target="_blank" href="${merchantLink}">Merchant questionnaire</a>--]
[#--[@showMenu url="/questionShow/update.action"]--]
        [#if riskLevel?? && riskLevel != 0]
        <p>
        <a href="javascript:" class="btn" id="goEmail">Send Email</a>
        </p>
        [/#if]
[#--[/@showMenu]--]

    [#list questionList as list]
        <p>
            <label class="f_info">Question${list_index+1}</label>
            [#assign itemindex=0]
            ${list.question}[#if !answerMap.get(list.id)??]<span class="red">(Not Answer)</span>[/#if]
            <br>
            [#list questionOptionList as item]
                [#if item.questionId==list.id]
                    [#assign itemindex = itemindex +1]
                    [#--[#list merchantQuestionOptionList as optionList]--]

                    <label for="id${item.id}" class="f_for">
                        <input type="radio" name="id${list.id}" id="id${item.id}" value="${item.id}"
                               [#if map.get(item.id)??]checked [/#if]>
                        [#if map.get(item.id)??]<span class="blue">${item.optionText}</span>[#else ]${item.optionText}[/#if] </label>[#--(${item.score})--]
                    [#--[#if itemindex % 3 == 0]
                    <br>
                    [/#if]--]
                [/#if]
            [/#list]
            [#--[#if itemindex==0]<span class="red">(Not Answer)</span>[/#if]--]
        </p>
    [/#list]
        <p>
            <a href="javascript:window.history.back()" target="m_body" id="cancel" class="btn" data-icon="p">Cancel</a>
            <button type="submit" class="btn bg_blue" data-icon="y">Submit</button>
        </p>
</form>
<script>
    seajs.use("alert",function(alertM){

        $("#goEmail").on("click",function(){
            $.ajax({
                url:"riskEmail.action",
                dataType:"json",
                type:"post",
                data:{
                    code:$("#code").val(),
                    token:"${token}"
                }
            }).done(function(data){
                alertM(data.msg,{cls:data.status,rf:function(){
//                    if(data.status=="succ")
//                        window.location.reload();
                }})
            });
        })

        $("#form").on("submit",function(){
            $.ajax({
                url:"update.action",
                dataType:"json",
                type:"post",
                data:$("#form").serialize()
            }).done(function(data){
                        alertM(data.msg,{cls:data.status,rf:function(){
                            if(data.status=="succ")
                                window.location.reload();
                        }})
                    });
            return false;
        })
    })
</script>
</body>
</html>