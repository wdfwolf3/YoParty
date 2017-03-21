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
        // PC端当滚动到最底部以上100像素时， 加载新内容
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
    //领队
    $hidenType = $('div#search-type div.fresult');
    //活动
    $showType = $('div#search-type div.f');
    //查询input
    $searchKeyword = $('input#searchKeyword');

    $('div#search-type b.arrow').click(function () {
        $hidenType.css('display', 'inline')
    });

    $hidenType.click(function () {
        var nextType = $hidenType.attr("type");
        if (nextType == 1) {
            $showType.html('<span class="p" >按领队搜索</span>');
            $showType.attr("type", 1);
            $searchKeyword.val("");
            $searchKeyword.attr('placeholder', '请输入领队名称');

            $hidenType.html('<p>按活动搜索</p>');
            $hidenType.attr("type", 0);
            $('input#searchType').val(1);
        } else {
            $showType.html('<span class="p" >按活动搜索</span>');
            $showType.attr("type", 0);
            $searchKeyword.val("");
            $searchKeyword.attr('placeholder', '请输入目的地、景点等关键词');
            $hidenType.html('<p>按领队搜索</p>');
            $hidenType.attr("type", 1);
            $('input#searchType').val(0);
        }
        $hidenType.css('display', 'none');
    });
    $searchKeyword.focus(function () {
        $hidenType.css('display', 'none');
    });
    //绑定搜索按钮点击事件  大搜索框
    $('#submit-btn').click(function () {
        // 将筛选条件  重置  全部
        $('.navmenu a').removeClass("selected");
        $("[href='#']").attr('class', "selected");
        // 获取查询条件,注意对pageNow赋值为1
        currPage = 1;
        var searchParams = serchParams();
        searchParams['pageNow'] = currPage;
        //清空列表
        $('ul#stage').html('<li></li>');
        // 调用loadmore方法
        loadMore(searchParams);
    });
    //绑定点击事件  单选
    $('.navmenu a').click(function () {
        //选中样式改变
        $(this).parent().parent().find('a.selected').removeClass('selected');
        $(this).addClass('selected');
        // 获取查询条件,注意对pageNow赋值为1
        currPage = 1;
        var searchParams = serchParams();
        searchParams['pageNow'] = currPage;
        //清空列表
        $('ul#stage').html('<li></li>');
        // 调用loadmore方法
        loadMore(searchParams);
    });

    //绑定点击事件  排序
    $('.orderHd a').click(function () {
        //选中样式改变
        $(this).parent().find('a.selected').removeClass('selected');
        $(this).addClass('selected');
        //获取查询条件,注意对pageNow赋值为1
        currPage = 1;
        var searchParams = serchParams();
        searchParams['pageNow'] = currPage;
        //清空列表
        $('ul#stage').html('<li></li>');
        // 调用loadmore方法
        loadMore(searchParams);
    });
    function loadMore(para) {
        var url = rootPath + "/event/findEventList.shtml";
        para['pageSize'] = 2;

        data = CommnUtil.ajax(url, para, "json");

        if (CommnUtil.notNull(data) && CommnUtil.notNull(data.records) && data.records.length > 0) {
            //设置总数
            $('#total').html(data.rowCount);
            var oProduct, $row, iHeight, iTempHeight;
            records = data.records;
            manager_upload_prefix = $("#manager_upload_prefix").val()

            for (var i = 0, l = records.length; i < l; i++) {
                oProduct = records[i];
                // 找出当前高度最小的列, 新内容添加到该列
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
                    '<li class="i">领队:<span>' + CommnUtil.notEmpty(oProduct.leader_name) + '</span></li>' +
                    '<li class="i pad">出发日期:<span>' + CommnUtil.notEmpty(new Date(oProduct.start_time).format("yyyy年MM月dd日")) + '</span></li>' +
                    '<li class="i pc ">结束日期:<span>' + CommnUtil.notEmpty(new Date(oProduct.end_time).format("yyyy年MM月dd日")) + '</span></li>' +
                    '</div>' +
                    '<div class="row2 fll">' +
                    '<li class="i phone"><label class="sdt">出发日期:</label><span>' + CommnUtil.notEmpty(new Date(oProduct.start_time).format("yyyy年MM月dd日")) + '</span></li>' +
                    '<li class="i pad">' + CommnUtil.notEmpty(oProduct.type1name) + ':<span>' + CommnUtil.notEmpty(oProduct.type1) + '</span></li>' +
                    '<li class="i pad">' + CommnUtil.notEmpty(oProduct.type2name) + ':<span>' + CommnUtil.notEmpty(oProduct.type2) + '</span></li>' +
                    '<li class="i pc ">' + CommnUtil.notEmpty(oProduct.type3name) + ':<span>' + CommnUtil.notEmpty(oProduct.type3) + '</span></li>' +
                    '</div>' +
                    '<div class="row3 fll">' +
                    '<li class="i pad">出发地:<span>' + CommnUtil.notEmpty(oProduct.start_city) + '</span></li>' +
                    '<li class="i ect">目地的:<span>' + CommnUtil.notEmpty(oProduct.end_city) + '</span></li>' +
                    '</div>' +
                    '</ul>' +
                    '<div class="di-r flr">' +
                    '<div class="p"><span>￥</span>' + CommnUtil.notEmpty(oProduct.price) + '</div>' +
                    '<div class="r">状态:<span>' + CommnUtil.notEmpty(oProduct.event_status) + '</span>' +
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
            //设置总数
            $('#total').html(0);
            have_data = false;
        }

        if ("Firefox" == CommnUtil.getOs()) {
            // $(window).bind("scroll");
            is_scroll = true;
        }
    }

});
//整理传入参数
function serchParams() {
    //搜索框
    var keyword = $('#searchKeyword').val();
    var searchType = $('#searchType').val();
    var searchParams = {"eventInfoFormMap.keyword": keyword, "eventInfoFormMap.searchType": searchType};

    //单选按钮
    $('.navmenu a.selected').each(function (i, node) {
        var eventType = $(node).attr("eventType");
        var eventKey = $(node).attr("eventKey");
        searchParams['eventInfoFormMap.type' + eventType] = eventKey;
    });
    //排序
    $('.orderHd a.selected').each(function (i, node) {
        var eventSort = $(node).attr("eventSort");
        searchParams['column'] = eventSort;
        searchParams['sort'] = "desc";
    });
    return searchParams;
}

