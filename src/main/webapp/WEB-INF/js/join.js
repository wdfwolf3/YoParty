pageii = null
$(function () {
    var companys = $('.hdCompany');
    var personContainer = $('.hdHandle .personChoice ');
    var personInfoArr = ['name', 'sex', 'phoneNumber', 'idCard', 'idcard_typ'];
    var insuranceFlag = true;
    // 娣诲姞鍙備笌鏈娲诲姩鐨勪汉鍛�
    companys.on('click', 'div.addperson', function () {
        addPersonClickFn();
    });
    $("#addBtn").click(function () {
        addPersonClickFn();
    });
    $("#managerBtn").click(function () {
        managePersonClickFn();
    });
    // 澧炲姞鍙備笌浜�
    companys.on('click', 'div.person', function (event) {
        var self = this;
        signUpClickFn(event, self);
    });
    // 鍔ㄦ€佺粦瀹氾紝鍒犻櫎鎸夐挳鍒犻櫎褰撳墠閫夋嫨鐨勪汉鍛�
    personContainer.on('click', '.personDelete', function (event) {
        $(this).parents('.tableInfo').remove();
        var personId = $(this).parents('.tableInfo').data('id');
        companys.find('.person[data-id=' + personId + ']').toggleClass('notselected selected');
        calculatorFn(insuranceFlag);
    });
    // 淇濋櫓閫夋嫨浜嬩欢
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
    // 淇濋櫓閫夋嫨浜嬩欢--鎵嬫満
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
     * @param event  鐐瑰嚮浜嬩欢瀵硅薄
     * @param self   浠ｇ悊鍏冪礌ele
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
     * @param ele 浠ｇ悊鍏冪礌ele
     * @returns {{}} 浠ｇ悊鍏冪礌鐨勪俊鎭璞″寘鎷琻ame,sex,phoneNumber,idCard
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
                title: "鏂板",
                type: 2,
                zIndex: 20170215,
                area: ["600px", "70%"],
                content: rootPath + '/user_partner/addUI.shtml'
            });
        }

    }


    /**
     *
     * @param self 鐐瑰嚮浜嬩欢瀵硅薄
     * @param personInfo 鐐瑰嚮浜嬩欢瀵硅薄鐨勫熀鏈俊鎭璞�
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
            '<td><a class="personDelete" >鍒犻櫎</a></td>' +
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
        // 鑾峰彇
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
        + '<dt>鎬у埆锛�</dt>'
        + '<dd class="sex">' + CommnUtil.notEmpty(data.gender) + '</dd>'
        + '</dl>'
        + '<dl>'
        + '<dt class="phone_title">鐢佃瘽鍙风爜锛�</dt>'
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
        layer.alert("璇烽€夋嫨鍙備笌浜�.")
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
        layer.confirm('娆㈣繋鎮ㄦ姤鍚嶅弬鍔犳湰娆℃椿鍔�,姝ｅ湪鎵撳紑鏀粯椤甸潰',
            {
                btn: ['鎴愬姛浠樻', '鏀粯鍑虹幇闂'],

            }, function (index, layero) {
                //鎸夐挳銆愭寜閽竴銆戠殑鍥炶皟
                window.location.href = rootPath + "/event/eventOrderUI/" + result['eventOrderFormMap.order_id'] + ".shtml"
            }, function () {
                //鍙充笂瑙掑叧闂洖璋�
                alert("鍏抽棴")
            })
    }

}

