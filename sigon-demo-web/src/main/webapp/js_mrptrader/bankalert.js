var bankName = "";
define(function(require) {
    require('jquery');
    var alertM = require('alert');
    $("#bankAlert").on("click",function(){
        var $t=$(this),href = "/jsonBankAccount/alert.action";
        alertM("loading",{cls:"loading",time:"y"});
        $.ajax({
            url:href
        }).done(function(data){
            alertM(data,{
                title:"Select Bank",
                time:"y",
                width:700,
                of:function(){
                    $.ajax({
                        url:"/jsonBankAccount/headBank.action",
                        dataType:"json",
                        method:"get"
                    }).done(function(data){
                        var html = "<option value=''>请选择银行</option>";
                        if(data.status=="succ"){
                            html += "";
                            for (var i = 0; i < data.data.length; i++) {
                                var item = data.data[i];
                                var key = item.code;
                                html += "<option value='" + key + "'" + (item.selected ? "selected" : "") + ">" + item.name + "</option>";

                            }
                            $("#headBank").html(html);
                            $("#headBankP").show();
                        }
                    });
                    $("#headBank").on("change", function(){
                        $("#bankCityP").hide();
                        $("#bankAreaP").hide();
                        $("#bankItemP").hide();
                        $("#bankItem").val("");
                        $.ajax({
                            url:"/jsonBankAccount/province.action",
                            dataType:"json",
                            method:"get",
                            data:{
                                headBankCode:$("#headBank").val()
                            }
                        }).done(function(data){
                            var html = "<option value=''>请选择省份</option>";
                            if(data.status=="succ"){

                                for (var i = 0; i < data.data.length; i++) {
                                    var item = data.data[i];
                                    html += "<option value='" + item + "'" + (item.selected ? "selected" : "") + ">" + item + "</option>";

                                }
                                $("#bankProvince").html(html);
                                $("#bankProvinceP").show();
                            }
                        });
                    });
                    window.bankItemChange = function(data){
                        var html = "<option value=''>请选择银行</option>";
                        for (var i = 0; i < data.data.length; i++) {
                            var item = data.data[i];
                            html += "<option value='" + item.code + "'>" + item.bankName + "</option>";

                        }
                        $("#bankItem").html(html);
                        $("#bankItemP").show();
                    };
                    $("#bankProvince").on("change", function(){
                        $("#bankCityP").hide();
                        $("#bankAreaP").hide();
                        $("#bankItemP").hide();
                        $("#bankItem").val("");
                        $.ajax({
                            url:"/jsonBankAccount/city.action",
                            dataType:"json",
                            method:"get",
                            data:{
                                headBankCode:$("#headBank").val(),
                                province:$(this).val()
                            }
                        }).done(function(data){
                            var html = "<option value=''>请选择城市</option>";
                            if(data.status=="0"){
                                for (var i = 0; i < data.data.length; i++) {
                                    var item = data.data[i];
                                    html += "<option value='" + item + "'>" + item + "</option>";
                                }
                                $("#bankCity").html(html);
                                $("#bankCityP").show();
                            }else if(data.status == "1"){
                                bankItemChange(data);
                            }
                        });
                    });

                    $("#bankCity").on("change", function(){
                        $("#bankAreaP").hide();
                        $("#bankItemP").hide();
                        $("#bankItem").val("");
                        $.ajax({
                            url:"/jsonBankAccount/area.action",
                            dataType:"json",
                            method:"get",
                            data:{
                                headBankCode:$("#headBank").val(),
                                province:$("#bankProvince").val(),
                                city:$(this).val()
                            }
                        }).done(function(data){
                            var html = "<option value=''>请选择区县</option>";
                            if(data.status=="0"){
                                for (var i = 0; i < data.data.length; i++) {
                                    var item = data.data[i];
                                    html += "<option value='" + item + "'" + (item.selected ? "selected" : "") + ">" + item + "</option>";

                                }
                                $("#bankArea").html(html);
                                $("#bankAreaP").show();
                            }else if(data.status == "1"){
                                bankItemChange(data);
                            }
                        });
                    });

                    $("#bankArea").on("change", function(){
                        $.ajax({
                            url:"/jsonBankAccount/bankItem.action",
                            dataType:"json",
                            method:"get",
                            data:{
                                headBankCode:$("#headBank").val(),
                                province:$("#bankProvince").val(),
                                city:$("#bankCity").val(),
                                area:$(this).val()
                            }
                        }).done(function(data){
                            bankItemChange(data);
                        });
                    });
                    $("#bankItem").on("change", function(){
                        bankName = $('#bankItem  option:selected').text();
                    });
                },
                btns:[
                    {
                        txt:"Submit",
                        cls:"bg_blue",
                        func:function(){
                            var bankCode = $("#bankItem").val();
                            if(bankCode == "") {
                                return false;
                            }else{
                                $("#" + $t.data("code")).val(bankCode);
                                $("#" + $t.data("codeshow")).html(bankCode);
                                $("#" + $t.data("show")).html(bankName);
                                $("#" + $t.data("name")).val(bankName);
                            }
                            alertM.remove();
                        }
                    },
                    {
                        txt:"Cancel"
                    }
                ]
            })
        });
        return false;
    })


});