pageii = null
$(function () {
    var companys = $('.hdCompany');
    var personContainer = $('.hdHandle .personChoice ');
    var personInfoArr = ['name', 'sex', 'phoneNumber', 'idCard', 'idcard_typ'];
    var insuranceFlag = true;
    // 添加参与本次活动的人数
    companys.on('click', 'div.addperson', function () {
        addPersonClickFn();
    });
    $("#addBtn").click(function () {
        addPersonClickFn();
    });
    $("#managerBtn").click(function () {
        managePersonClickFn();
    });
    // 增加参与人
    companys.on('click', 'div.person', function (event) {
        var self = this;
        signUpClickFn(event, self);
    });
    // 动态绑定，删除按钮删除当前选择的人
    personContainer.on('click', '.personDelete', function (event) {
        $(this).parents('.tableInfo').remove();
        var personId = $(this).parents('.tableInfo').data('id');
        companys.find('.person[data-id=' + personId + ']').toggleClass('notselected selected');
        calculatorFn(insuranceFlag);
    });
    // 保险选择事件
    $('#insurance').on('click', function () {
        if ($(this).prop('checked')) {
            insuranceFlag = true;
            calculatorFn(insuranceFlag);
            $(this).prop('checked', true);
            $('#mb_insurance').prop('checked', true);
        } else {
            $(this).prop('checked', false);
            $('#mb_insurance').prop('checked', false);
            insuranceFlag = false;
            calculatorFn(insuranceFlag);

        }
    });
    // 保险选择事件--手机
    $('#mb_insurance').on('click', function () {
        if ($(this).prop('checked')) {
            insuranceFlag = true;
            calculatorFn(insuranceFlag);
            $(this).prop('checked', true);
            $('#insurance').prop('checked', true);
        } else {
            $(this).prop('checked', false);
            $('#insurance').prop('checked', false);
            insuranceFlag = false;
            calculatorFn(insuranceFlag);

        }
    });
    $("#subBtn").click(function () {
        submitSignUp()
    })
    $("#mb_subBtn").click(function () {
        submitSignUp()
    })

    /**
     *
     * @param event  点击事件对象
     * @param self   代理元素ele
     */
    function signUpClickFn(event, self) {
        var flag = false;
        var personId = $(self).data('id');
        //console.log(personId);
        var personInfo = getPersonInfoFn(self);
        $.each(personContainer.find('.tableInfo'), function (index, ele) {
//				console.log(personId);
            if ($(ele).data('id') === personInfo.data) {
                $(this).remove();
                companys.find('.person[data-id=' + personInfo.data + ']').toggleClass('notselected selected');
                calculatorFn(insuranceFlag);
                flag = true;

            }
        });
        if (!flag) {
            addCompanyFn(self, personInfo);
            calculatorFn(insuranceFlag);
        }
    }

    /**
     *
     * @param ele 代理元素ele
     * @returns {{}} 代理元素的信息对象包括name,sex,phoneNumber,idCard
     */
    function getPersonInfoFn(ele) {
        var obj = {};
        ele && personInfoArr.forEach(function (item, index) {
            obj[item] = $(ele).find('.' + item).text();
        });
        obj['data'] = $(ele).data('id');
        return obj;
    }

    function addPersonClickFn() {
        if (CommnUtil.isPhone()) {
            window.location.href=rootPath + '/user_partner/mb_addUI.shtml?event_id='+$("#eid").val()+"&comefrom=eventJoin"
        } else {
            this.pageii = layer.open({
                title: "新增",
                type: 2,
                zIndex: 20170215,
                area: ["600px", "70%"],
                content: rootPath + '/user_partner/addUI.shtml'
            });
        }

    }


    /**
     *
     * @param self 点击事件对象
     * @param personInfo 点击事件对象的基本信息对象
     */
    function addCompanyFn(self, personInfo) {
        var meet_places = $("#meet_places").html().split(" ");
        var meet_options = "";
        for (var i = 0; i < meet_places.length; i++) {
            if (meet_places[i] != "") {
                meet_options += '<option value="' + meet_places[i] + '">' + meet_places[i] + '</option> '
            }
        }
        var fragment = '<tr class="tableInfo" data-id= ' + personInfo.data + '>' +
            '<td>' +
            '<select class="togetherPlace"> ' +
            meet_options +
            '</select> ' +
            '</td> ' +
            '<td class="name">' + CommnUtil.notEmpty(personInfo.name) + '</td> ' +
            '<td class="sex">' + CommnUtil.notEmpty(personInfo.sex) + '</td> ' +
            '<td class="phoneNumber">' + CommnUtil.notEmpty(personInfo.phoneNumber) + '</td> ' +
            '<td>' + CommnUtil.notEmpty(personInfo.idcard_typ) + '</td> ' +
            '<td class="idCard">' + CommnUtil.notEmpty(personInfo.idCard) + '</td> ' +
            '<td><a class="personDelete" >删除</a></td>' +
            '</tr>';
        personContainer.find('table').append($(fragment));
        $(self).toggleClass('notselected selected');
    }

    function calculatorFn(insuranceFlag) {
        var personNumber = personContainer.find('.tableInfo').length;
        var price = $("#price").text();
        var insurancePrice = $('#insurancePrice').text();
        var allMoney, countMoney;
        countMoney = personNumber * price;
        allMoney = countMoney;
        if (insuranceFlag) {
            allMoney = countMoney + personNumber * insurancePrice;
        }
        $('#signupNumber').text(personNumber);
        $("#countMoney").text(countMoney.toFixed(2));
        $("#allMoney").text(allMoney.toFixed(2));
        // 获取
        var mb_price = $("#mb_price").text();
        var mb_insurancePrice = $('#mb_insurancePrice').text();
        var mb_allMoney, mb_countMoney;
        mb_countMoney = personNumber * mb_price;
        mb_allMoney = mb_countMoney;
        if (insuranceFlag) {
            mb_allMoney = mb_countMoney + personNumber * mb_insurancePrice;
        }
        $('#mb_signupNumber').text(personNumber);
        $("#mb_countMoney").text(mb_countMoney.toFixed(2));
        $("#mb_allMoney").text(mb_allMoney.toFixed(2));
    }
});

function addNewPartner(data) {

    var position = ($('.hdCompany div.person').size() + 1) % 4
    var fragment = '<div class="person ' + (position == 0 ? '' : 'marginR') + ' notselected"'
        + 'data-id="' + data.id + '">'
        + '<div class="basicInfo">'
        + '<ul class="clearfix">'
        + '<li class="name">' + CommnUtil.notEmpty(data.nickname) + '</li>'
        + '<li class="idCard" style="display:none">' + CommnUtil.notEmpty(data.idcard_no) + '</li>'
        + '</ul>'
        + '</div>'
        + '<div class="line line-dashed "></div>'
        + '<div class="otherInfo">'
        + '<dl class="clearfix">'
        + '<dt>性别:</dt>'
        + '<dd class="sex">' + CommnUtil.notEmpty(data.gender) + '</dd>'
        + '</dl>'
        + '<dl>'
        + '<dt class="phone_title">电话号码:</dt>'
        + '<dd class="phoneNumber">' + CommnUtil.notEmpty(data.phone_no) + '</dd>'
        + '</dl>'
        + '</div>'
        + '</div>'
    $addUP = $('#addUP')
    $addUP.before(fragment)

}

function managePersonClickFn() {
    if(CommnUtil.isPhone()){
        window.open(rootPath+"/user_partner/list.shtml")
    }else{
        window.open(rootPath + '/user_info/personalEdit/companys.shtml')
    }
}

function submitSignUp() {
    var participates = $('.hdHandle .personChoice ')
    var id_meet_map = {}
    var partnerIds = ""
    $.each(participates.find('.tableInfo'), function (index, ele) {
        var partnerId = $(ele).data('id')
        var togetherPlace = $(ele).find('td select.togetherPlace').val()
        id_meet_map[partnerId] = togetherPlace
        partnerIds += partnerId + ","
    });
    if (partnerIds == "") {
        layer.alert("请选择参与人")
        return;
    }
    var is_insurance = $("#insurance").is(':checked')
    var eid = $("#eid").val()
    var comment = $("#comment").val()
    var result = CommnUtil.ajax(rootPath + "/event/eventAddBill.shtml", {
        "eventOrderFormMap.partners": JSON.stringify(id_meet_map),
        "eventOrderFormMap.is_insurance": is_insurance,
        "eventOrderFormMap.eid": eid,
        "eventOrderFormMap.partnerIds": partnerIds,
        "eventOrderFormMap.comment": comment,
    }, 'json')

    console.log(result)

    if (result.status == "error") {
        layer.alert(result.msg)
    } else if (result.status == "success") {
        layer.confirm('欢迎您报名参加本次活动,正在打开支付页面',
            {
                btn: ['成功付款', '支付出现问题'],

            }, function (index, layero) {
                //按钮【按钮一】的回调
                window.location.href = rootPath + "/event/eventOrderUI/" + result['eventOrderFormMap.order_id'] + ".shtml"
            }, function () {
                //右上角关闭回�?
                alert("关闭")
            })
    }

}


