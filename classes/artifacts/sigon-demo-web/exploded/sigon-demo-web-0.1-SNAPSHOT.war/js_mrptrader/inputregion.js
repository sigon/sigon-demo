define(function(require) {
    require('jquery');
    $(".region").each(function(){
        var $t = $(this);
        var id = $t.data("id");
        if($t.val() == 0){
            $("#" + id + "Region0").show();
            $("#" + id + "Region1").hide();
        }else{
            $("#" + id + "Region0").hide();
            $("#" + id + "Region1").show();
        }
        $t.on("change", function(){
            if($t.val() == 0){
                $("#" + id + "Region0").show();
                $("#" + id + "Region1").hide();
                $("#" + id + "Region").val("");
            }else{
                $("#" + id + "Region0").hide();
                $("#" + id + "Region1").show();
                $("#" + id + "End").val($("#" + id + "Start").val());
            }
        });

    });
    $(".regionV").each(function(){
        var $t = $(this);
        var id = $t.data("id");
        $t.on("keyup", function(){
            var v = $t.val();
            $("#" + id + "Start").val(v);
            $("#" + id + "End").val(v);
        }).on("blur", function(){
            var v = $t.val();
            $("#" + id + "Start").val(v);
            $("#" + id + "End").val(v);
        });
    });
});