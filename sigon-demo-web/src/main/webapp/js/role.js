define(function(require, exports, module) {
    require('jquery');
    var alertM=require('alert');
    return function (id,title,types,msgName) {
        if(title==undefined) title = "New Role";
        if(types==undefined) types = "mrp-roles";
        if(types==undefined) msgName = "角色";

        $(id).on("change",function(){
            var $t = $(this);
            var val = $t.val();
            if(val != "new"){
                return;
            }
            alertM('<input type="text" id="newType" maxlength="50" style="width:200px"><br><span class="red" id="msg" style="display:none">不能为空</span>',{
                title:title,
                time:"y",
                width:300,
                btns:[
                    {
                        txt:"Cancel",
                        func:function(){
                            $t.find("option:first").prop("selected", "selected");
                        }
                    },{
                        txt:"Submit",
                        cls:"bg_blue",
                        func:function(){
                            // var type = $t.data("type");
                            var option = $t.find("option:last");
                            var copy = option.clone();
                            var newValue = $("#newType").val();
                            $("#msg").hide();
                            if(newValue.trim().length==0){
                                $("#msg").show();
                                return false;
                            }
                            alertM("Loading",{cls:"loading",time:"y"})
                            $.ajax({
                                url:"/user/newtype.action",
                                dataType:"json",
                                type:"post",
                                data:{
                                    newType:newValue,
                                    types:types,
                                    msgName:msgName
                                }
                            }).done(function(data){
                                alertM(data.msg,{cls:data.status,time:1000,rf:function(){
                                    if(data.status=="succ"){
                                        option.val(newValue);
                                        option.html(newValue);
                                        $t.append(copy);
                                        $t.val(newValue);
                                    }else{
                                        $("#role").val("");
                                    }
                                }
                                })
                            })
                            return false;
                        }
                    }
                ]
            })
        })
    }
});