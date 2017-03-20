function updatePasswordLayer(){
    //鍔犺浇灞�
    var index = layer.load(0, {shade: false}); //0浠ｈ〃鍔犺浇鐨勯鏍硷紝鏀寔0-2
    //iframe灞�-绂佹粴鍔ㄦ潯
    layer.open({
        type: 2,
        title:'淇敼瀵嗙爜',
        area: ['550px', '360px'],
        skin: 'layui-layer-rim', //鍔犱笂杈规
        content: [rootPath+'/user/updatePassword.shtml', 'no']
    });
    //鍏抽棴鍔犺浇鏁堟灉
    layer.close(index);
}

//鏍￠獙瀵嗙爜鏄惁鐩稿悓
function same(pwd) {
    var oldPwd = $("#newpassword").val();
    if (oldPwd == pwd){
        return false;
    }else{
        //鏇存敼琛ㄥ崟涓‘璁ゅ瘑鐮佺殑name鐨勫睘鎬у悕
        $("#confirmpassword").attr("name","userFormMap.password");
        return true;
    }
}

jQuery.validator.addMethod("same", function(value, element) {
    return this.optional(element) || same(value);
}, "鏂板瘑鐮佸拰纭瀵嗙爜涓嶄竴鑷�");

//鍔犲叆鏁版嵁鏍￠獙璇�
$(function() {
    $("#formUpdatePwd").validate({
        submitHandler : function(form) {// 蹇呴』鍐欏湪楠岃瘉鍓嶉潰锛屽惁鍒欐棤娉昦jax鎻愪氦
            ly.ajaxSubmit(form, {// 楠岃瘉鏂板鏄惁鎴愬姛
                type : "post",
                dataType : "json",//ajaxSubmi甯︽湁鏂囦欢涓婁紶鐨勩€備笉闇€瑕佽缃甹son
                success : function(data) {
                    if (data == "success") {
                        layer.confirm('淇敼瀵嗙爜鎴愬姛!鏄惁鍏抽棴绐楀彛?', function(index) {
                            layer.close(index);
                            var index = parent.layer.getFrameIndex(window.name); //鍏堝緱鍒板綋鍓峣frame灞傜殑绱㈠紩
                            parent.layer.close(index); //鍐嶆墽琛屽叧闂�
                        });
                    } else {
                        layer.msg('淇敼瀵嗙爜澶辫触锛�', {icon: 5});
                    }
                }
            });
        },
        rules : {
            "userFormMap.newpassword" : {
                minlength: 6,
                required : true
            },
            "userFormMap.confirmpassword": {
                required : true,
                minlength: 6,
//				same:true,
                equalTo: "#newpassword"
            }
        },
        messages : {
            "userFormMap.newpassword" : {
                required : "璇疯緭鍏ユ柊瀵嗙爜",
                minlength: jQuery.format("瀵嗙爜涓嶈兘灏忎簬{0}涓瓧 绗�")
            },
            "userFormMap.confirmpassword" : {
                required : "璇疯緭鍏ョ‘璁ゅ瘑鐮�",
                minlength: jQuery.format("瀵嗙爜涓嶈兘灏忎簬{0}涓瓧 绗�"),
                equalTo : "鏂板瘑鐮佸拰纭瀵嗙爜涓嶄竴鑷�"
            }
        },
        errorPlacement : function(error, element) {// 鑷畾涔夋彁绀洪敊璇綅缃�
            $(".l_err").css('display', 'block');
            // element.css('border','3px solid #FFCCCC');
            $(".l_err").html(error.html());
        },
        success : function(label) {// 楠岃瘉閫氳繃鍚�
            $(".l_err").css('display', 'none');
        }
    });
});