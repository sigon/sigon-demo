define(function(require, exports, module) {
    require('jquery');
    var alertM = require('alert');
    return function(orderNo,type){
        alertM("loading",{cls:"loading",time:"y"});
        $.ajax({
            url: "/paperDated/judge.action",
            dataType: "json",
            method: "post",
            data: {
                "orderNo": orderNo,
                "type": type
            }
        }).done(function (data) {
            if (data.alertFtl == "1") {
                setTimeout(function(){
                    alertM("/paperDated/remind.action?receiverOrder=" + data.receiverOrder + "&payOrder=" + data.payOrder + "&orderNo=" + orderNo,
                        {time: "y", iframe: 1, width: 800, height: 480, title: "Merchant doc expire date list", close: 0});
                },1000);
            }else{
                alertM.remove();
            };
        });
    }
})