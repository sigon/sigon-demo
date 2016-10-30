define(function(require) {
    require('jquery');
    var upload = require('upload');
    var piczoom = require('pizoom');
    return function(opt){
        upload({
            bind: $(opt.bind),
            url: "/upload/uploadFile.action?folderName=" + opt.module,
            fileName: "file",
            succ: function (data) {

                for(var i=0;i<data.length;i++){
                    var html = '<span class="file_up">';
                    if (data[i].type == "images")
                        html += '<span class="file_up_images" style="background-image:url(' + data[i].urlS + data[i].imgUrl + ')" data-src="' + data[i].urlO + data[i].imgUrl + '"></span>';
                    else
                        html += '<a class="file_up_txt" href="/upload/down.action?fileUrlName=' + data[i].urlF + '&fileName=' + data[i].i_txt + '" target="_blank" data-icon="2"></a>';
                    html += '<a class="remove" href="javascript:" data-fid="' + data[i].key + '">&times;</a>';
                    html += '<input type="hidden" name="fileoname" value="' + data[i].i_txt + '">';
                    if(opt.hideSpan) {
                        html += '<span class="file_up_hide">' + opt.hideSpan(data) + '</span>';
                    }
                    $s.show().append(html);//<input type="checkbox" name="importAble' + data[i].key + '" value=1 id="importAble_' + data[i].key + '"> <label for="importAble_' + data[i].key + '">可以导出</label><br/><input type="checkbox" name="viewAble' + data[i].key + '" value=1 id="viewAble_' + data[i].key + '"> <label for="viewAble_' + data[i].key + '">商户可见</label><br/><input type="checkbox" name="mViewAble' + data[i].key + '" value=1 id="file_' + data[i].key + '"> <label for="file_' + data[i].key + '">对方可见</label></span><input type="text" class="file_txt" name="imgRemark' + data[i].key + '" value="' + data[i].i_txt + '"><input type="hidden" name="key" value="' + data[i].key + '">')
                }
            }
        }),$s = $(opt.showp).on("click", ".remove", function () {
            $(this).parent().remove();
            if(!$s.find(".file_up").length)
                $s.hide()
        });
        piczoom("#f_upload_p",".file_up_images");
        if($s.find(".file_up").length)
            $s.show()
    }
});