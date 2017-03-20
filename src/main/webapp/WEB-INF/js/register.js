

$(function() {

});

//浜х敓楠岃瘉鐮�
function checkcode(){
    $("#checkcode").attr("src",rootPath+"/register/checkCodeUI.shtml"+'?'+new Date())
}


//鏍￠獙楠岃瘉鐮�
function validateCode(){
    if(!CommnUtil.notNull($("#accountName").val())){
        alert("璇疯緭鍏ョ敤鎴峰悕锛�")
        return
    }
    password = $("#password").val()
    if(!CommnUtil.notNull(password)){
        alert("璇疯緭鍏ュ瘑鐮侊紒")
        return
    }
    confirmPassword= $("#confirmPassword").val()
    if(confirmPassword!=password){
        alert("涓ゆ杈撳叆鐨勫瘑鐮佷笉涓€鑷达紒")
        return
    }

    code = $("#code").val()
    if(!CommnUtil.notNull(code)){
        alert("璇疯緭鍏ラ獙璇佺爜锛�")
        return
    }
    data = CommnUtil.ajax(rootPath+"/register/addEntity.shtml",$("#form").serializeJson(),"json")
    if(data.status=='error'){
        alert(data.msg)
    }else if(data.status=='success'){
        alert("娉ㄥ唽鎴愬姛锛�")
        location.href=rootPath+"/home.shtml"
    }

}
