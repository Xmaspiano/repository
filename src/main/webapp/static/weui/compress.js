function fnMain(){
    var oCompress = function(){
    };
    oCompress.prototype = {
        fnInit : function(){
            $("#right-menu-canvas").addClass("active").siblings().removeClass("active");
            var iCanvasWidth = $("#article").width();
            $("#file").on("change" , function(){
                var file = this.files[0]; 
                if(
                    file.type ==  "image/jpeg" ||
                    file.type ==  "image/gif" ||
                    file.type ==  "image/png" ||
                    file.type ==  "image/x-icon" 
                 ){
                    var reader = new FileReader();
                    reader.readAsDataURL(file);
                    reader.onload = function(){
                        var img = $("<img>").attr({
                            "src": this.result,
                            "width": iCanvasWidth
                        });
                        $("#original").html("<h3>原图:大小" + parseInt(file.size / 1024) + "k</h3>");
                        $("#original").append(img);
                        oFunctionCase.fnCompressImg(this.result , 300 , 200, function(data){
                            var compressImg = $("<img>").attr({
                                "src": data,
                                "max-width": iCanvasWidth
                            });
                            $("#compress").html("<h3>压缩后:大小" + parseInt(data.length / 1024) + "k</h3>");
                            $("#compress").append(compressImg);
                        });
                    }
                }else{
                    oFunctionCase.fnAlert("传图片吧，谢谢");
                }
                
            })
        }
    };
    var oCompressCase = new oCompress();
    oCompressCase.fnInit();
}