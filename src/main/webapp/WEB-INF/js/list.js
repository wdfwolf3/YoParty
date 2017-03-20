have_data = false;
var is_scroll = true;
$(function () {

    $('ul#stage').html('<li></li>');

    var currPage = 1;
    var searchParams = serchParams();
    searchParams['pageNow'] = currPage;
    loadMore(searchParams);

    $(window).scroll(function () {

        if (!is_scroll && "Firefox" == CommnUtil.getOs()) {
            return
        }
        is_scroll = false
        //console.log($(document).height() - $(this).scrollTop() - $(this).height() )
        // PC绔綋婊氬姩鍒版渶搴曢儴浠ヤ笂100鍍忕礌鏃讹紝 鍔犺浇鏂板唴瀹�
        var btmh = 50
        if (CommnUtil.isPhone()) {
            btmh = 300
        }
        if ($(document).height() - $(this).scrollTop() - $(this).height() < btmh && have_data) {
            currPage++;
            var searchParams = serchParams();
            searchParams['pageNow'] = currPage;
            $("#stage li div.alert").remove()
            loadMore(searchParams);
        }
        if ("Firefox" == CommnUtil.getOs()) {
            is_scroll = true
        }
    });
    //棰嗛槦
    $hidenType = $('div#search-type div.fresult');
    //娲诲姩
    $showType = $('div#search-type div.f');
    //鏌ヨinput
    $searchKeyword = $('input#searchKeyword');

    $('div#search-type b.arrow').click(function () {
        $hidenType.css('display', 'inline')
    });

    $hidenType.click(function () {
        var nextType = $hidenType.attr("type");
        if (nextType == 1) {
            $showType.html('<span class="p" >鎸夐闃熸悳绱�</span>');
            $showType.attr("type", 1);
            $searchKeyword.val("");
            $searchKeyword.attr('placeholder', '璇疯緭鍏ラ闃熷悕绉�');

            $hidenType.html('<p>鎸夋椿鍔ㄦ悳绱�</p>');
            $hidenType.attr("type", 0);
            $('input#searchType').val(1);
        } else {
            $showType.html('<span class="p" >鎸夋椿鍔ㄦ悳绱�</span>');
            $showType.attr("type", 0);
            $searchKeyword.val("");
            $searchKeyword.attr('placeholder', '璇疯緭鍏ョ洰鐨勫湴銆佹櫙鐐圭瓑鍏抽敭璇�');
            $hidenType.html('<p>鎸夐闃熸悳绱�</p>');
            $hidenType.attr("type", 1);
            $('input#searchType').val(0);
        }
        $hidenType.css('display', 'none');
    });
    $searchKeyword.focus(function () {
        $hidenType.css('display', 'none');
    });
    //缁戝畾鎼滅储鎸夐挳鐐瑰嚮浜嬩欢  澶ф悳绱㈡
    $('#submit-btn').click(function () {
        // 灏嗙瓫閫夋潯浠�  閲嶇疆  鍏ㄩ儴
        $('.navmenu a').removeClass("selected");
        $("[href='#']").attr('class', "selected");
        // 鑾峰彇鏌ヨ鏉′欢,娉ㄦ剰瀵筽ageNow璧嬪€间负1
        currPage = 1;
        var searchParams = serchParams();
        searchParams['pageNow'] = currPage;
        //娓呯┖鍒楄〃
        $('ul#stage').html('<li></li>');
        // 璋冪敤loadmore鏂规硶
        loadMore(searchParams);
    });
    //缁戝畾鐐瑰嚮浜嬩欢  鍗曢€�
    $('.navmenu a').click(function () {
        //閫変腑鏍峰紡鏀瑰彉
        $(this).parent().parent().find('a.selected').removeClass('selected');
        $(this).addClass('selected');
        // 鑾峰彇鏌ヨ鏉′欢,娉ㄦ剰瀵筽ageNow璧嬪€间负1
        currPage = 1;
        var searchParams = serchParams();
        searchParams['pageNow'] = currPage;
        //娓呯┖鍒楄〃
        $('ul#stage').html('<li></li>');
        // 璋冪敤loadmore鏂规硶
        loadMore(searchParams);
    });

    //缁戝畾鐐瑰嚮浜嬩欢  鎺掑簭
    $('.orderHd a').click(function () {
        //閫変腑鏍峰紡鏀瑰彉
        $(this).parent().find('a.selected').removeClass('selected');
        $(this).addClass('selected');
        //鑾峰彇鏌ヨ鏉′欢,娉ㄦ剰瀵筽ageNow璧嬪€间负1
        currPage = 1;
        var searchParams = serchParams();
        searchParams['pageNow'] = currPage;
        //娓呯┖鍒楄〃
        $('ul#stage').html('<li></li>');
        // 璋冪敤loadmore鏂规硶
        loadMore(searchParams);
    });
    function loadMore(para) {
        var url = rootPath + "/event/findEventList.shtml";
        para['pageSize'] = 2;

        data = CommnUtil.ajax(url, para, "json");

        if (CommnUtil.notNull(data) && CommnUtil.notNull(data.records) && data.records.length > 0) {
            //璁剧疆鎬绘暟
            $('#total').html(data.rowCount);
            var oProduct, $row, iHeight, iTempHeight;
            records = data.records;
            manager_upload_prefix = $("#manager_upload_prefix").val()

            for (var i = 0, l = records.length; i < l; i++) {
                oProduct = records[i];
                // 鎵惧嚭褰撳墠楂樺害鏈€灏忕殑鍒�, 鏂板唴瀹规坊鍔犲埌璇ュ垪
                iHeight = -1;
                $('#stage li').each(function () {
                    iTempHeight = Number($(this).height());
                    if (iHeight == -1 || iHeight > iTempHeight) {
                        iHeight = iTempHeight;
                        $row = $(this);
                    }
                });

                var html = '<div class="hdItem" >' +
                    '<dl>' +
                    '<dt>' +
                    '<a href="' + rootPath + '/event/eventDetail/' + oProduct.id + '.shtml" target="_blank">' +
                    '<img src="' + manager_upload_prefix + '/' + oProduct.pic_dir + '/' + oProduct.thumb_name + '" width="200" height="150" alt="" tilte="">' +
                    '</a>' +
                    '</dt>' +
                    '<dd>' +
                    '<label>' +
                    '<a href="' + rootPath + '/event/eventDetail/' + oProduct.id + '.shtml" target="_blank" title="' + oProduct.title + '">' + oProduct.title + '</a>' +
                    '</label>' +
                    '<div class="di clearfix fll">' +
                    '<ul class="di-l fll">' +
                    '<div class="row1 fll">' +
                    '<li class="i">棰嗛槦:<span>' + CommnUtil.notEmpty(oProduct.leader_name) + '</span></li>' +
                    '<li class="i pad">鍑哄彂鏃ユ湡:<span>' + CommnUtil.notEmpty(new Date(oProduct.start_time).format("yyyy骞碝M鏈坉d鏃�")) + '</span></li>' +
                    '<li class="i pc ">缁撴潫鏃ユ湡:<span>' + CommnUtil.notEmpty(new Date(oProduct.end_time).format("yyyy骞碝M鏈坉d鏃�")) + '</span></li>' +
                    '</div>' +
                    '<div class="row2 fll">' +
                    '<li class="i phone"><label class="sdt">鍑哄彂鏃ユ湡:</label><span>' + CommnUtil.notEmpty(new Date(oProduct.start_time).format("yyyy骞碝M鏈坉d鏃�")) + '</span></li>' +
                    '<li class="i pad">' + CommnUtil.notEmpty(oProduct.type1name) + ':<span>' + CommnUtil.notEmpty(oProduct.type1) + '</span></li>' +
                    '<li class="i pad">' + CommnUtil.notEmpty(oProduct.type2name) + ':<span>' + CommnUtil.notEmpty(oProduct.type2) + '</span></li>' +
                    '<li class="i pc ">' + CommnUtil.notEmpty(oProduct.type3name) + ':<span>' + CommnUtil.notEmpty(oProduct.type3) + '</span></li>' +
                    '</div>' +
                    '<div class="row3 fll">' +
                    '<li class="i pad">鍑哄彂鍦�:<span>' + CommnUtil.notEmpty(oProduct.start_city) + '</span></li>' +
                    '<li class="i ect">鐩湴鐨�:<span>' + CommnUtil.notEmpty(oProduct.end_city) + '</span></li>' +
                    '</div>' +
                    '</ul>' +
                    '<div class="di-r flr">' +
                    '<div class="p"><span>锟�</span>' + CommnUtil.notEmpty(oProduct.price) + '</div>' +
                    '<div class="r">鐘舵€�:<span>' + CommnUtil.notEmpty(oProduct.event_status) + '</span>' +
                    '</div>' +
                    '</div>' +
                    '</div>' +
                    '</dd>' +
                    '</dl>' +
                    '</div>';
                $item = $(html).hide();
                $row.append($item);
                $item.fadeIn();
                have_data = true;
            }

            $row.append(CommnUtil.loadingImg())

        } else {
            //璁剧疆鎬绘暟
            $('#total').html(0);
            have_data = false;
        }

        if ("Firefox" == CommnUtil.getOs()) {
            // $(window).bind("scroll");
            is_scroll = true;
        }
    }

});
//鏁寸悊浼犲叆鍙傛暟
function serchParams() {
    //鎼滅储妗�
    var keyword = $('#searchKeyword').val();
    var searchType = $('#searchType').val();
    var searchParams = {"eventInfoFormMap.keyword": keyword, "eventInfoFormMap.searchType": searchType};

    //鍗曢€夋寜閽�
    $('.navmenu a.selected').each(function (i, node) {
        var eventType = $(node).attr("eventType");
        var eventKey = $(node).attr("eventKey");
        searchParams['eventInfoFormMap.type' + eventType] = eventKey;
    });
    //鎺掑簭
    $('.orderHd a.selected').each(function (i, node) {
        var eventSort = $(node).attr("eventSort");
        searchParams['column'] = eventSort;
        searchParams['sort'] = "desc";
    });
    return searchParams;
}

