var ObjectHeight = '100%', ObjectWith = '100%'

function SetSize(Height, Width) {
    ObjectWith = Width
    ObjectHeight = Height
}

function CreateInlineFile(Src) {
    let style = 'width: ' + ObjectWith + '; height: ' + ObjectHeight +'; border:none;'
    $("#controlAddIn").empty();
    $("#controlAddIn").append('<object id="FilePreview" style="' + style +'"></object>');
    $('#FilePreview').attr('data', Src);
}