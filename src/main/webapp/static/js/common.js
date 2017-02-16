function getPage(url, selector){
    if(url) {
        $.get(url, function (result) {
            $(selector).html(result);
            return result;
        });
    }
}

//切换tempPage1页面
function main_checkTempPage(selecter){
    $(selecter).children("div").each(function(){
        $(this).toggle();
    });
}

function ReplaceAll(str, sptr, sptr1){
    while (str.indexOf(sptr) >= 0){
        str = str.replace(sptr, sptr1);
    }
    return str;
}