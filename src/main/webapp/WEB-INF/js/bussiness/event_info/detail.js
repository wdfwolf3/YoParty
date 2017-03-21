var pageii=null
var nextUrl = null
$(function () {

    $('#hdOpBtn').click(function (){
        //获取userid查看是否登录
        var uid = $("#loginUid").val()
        if(CommnUtil.notNull(uid)){//访问报名页面
            window.location.href=rootPath+"/event/eventJoin/"+$("#event_id").val()+".shtml"
        }else{//登录成功后访问报名页面
            nextUrl=rootPath+"/event/eventJoin/"+$("#event_id").val()+".shtml"
            pageii = layer.open({
                title : "请先登录",
                type : 2,
                area : [ "400px", "300px" ],
                content : rootPath + '/loginUI.shtml'
            });

        }
    })

    $("#mbOpBtn").click(function (){
        //获取userid查看是否登录
        var uid = $("#loginUid").val()
        if(CommnUtil.notNull(uid)){//访问报名页面
            window.location.href=rootPath+"/event/eventJoin/"+$("#event_id").val()+".shtml"
        }else{//登录成功后访问报名页面
            nextUrl=rootPath+"/event/eventJoin/"+$("#event_id").val()+".shtml"
            pageii = layer.open({
                title : "请先登录",
                type : 2,
                area : [ "100%", "100%" ],
                content : rootPath + '/loginUI.shtml'
            });

        }
    })

    var intDiff = parseInt( $("#countTime").val()); //倒计时总秒数量
    timer(intDiff);
});

function showLeaderQr(str){
    layer.open({
        type: 1,
        shadeClose: true,
        title: false, //不显示标题
        content: '<img id="wechat_url" src="'+str+'" width="250px" height="250px"/>'
    });

}
function tabSelect(key) {
    selectObj(key,'content_bar',"li",'event_tab_')
    selectObj(key,'content_detail','div','event_detail_')
}

function selectObj(key,pid,htmltype,id_prefix){
    //将之前选择的元素取消选择
    $oldObj = $("#"+pid+" "+htmltype+".selected");
    selected_class = $oldObj.attr("class");
    selected_class = selected_class.replace("selected","")
    $oldObj.attr("class",selected_class);
    $thisObj = $("#"+id_prefix+key)
    this_class = CommnUtil.notEmpty($thisObj.attr("class"));
    this_class = this_class.trim()+" selected";
    $thisObj.attr("class",this_class);
}


function timer(intDiff) {
    window.setInterval(function () {
        var day = 0,
            hour = 0,
            minute = 0,
            second = 0; //时间默认值
        if (intDiff > 0) {
            day = Math.floor(intDiff / (60 * 60 * 24));
            hour = Math.floor(intDiff / (60 * 60)) - (day * 24);
            minute = Math.floor(intDiff / 60) - (day * 24 * 60) - (hour * 60);
            second = Math.floor(intDiff) - (day * 24 * 60 * 60) - (hour * 60 * 60) - (minute * 60);
        }
        if (minute <= 9) minute = '0' + minute;
        if (second <= 9) second = '0' + second;
        $('#day').html(day);
        $('#hour').html(hour );
        $('#minute').html( minute );
        $('#second').html(second );
        intDiff--;
    }, 1000);
}

