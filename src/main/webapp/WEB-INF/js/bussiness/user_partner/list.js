var pageii = null;
var grid = null;
$(function () {
    var g_title = []

    if (CommnUtil.isPhone()) {
        g_title = [{
            colkey: "nickname",
            name: "昵称",
            renderData: function (rowindex, data, rowdata, column) {
                return "<a class='cursor_a' onclick='detailPartner(\"" + rowdata.id + "\")'>" + data + "</a>"
            }
        }, {
            colkey: "gender",
            name: "性别"
        }, {
            colkey: "phone_no",
            name: "手机号码"
        }]
    } else {
        g_title = [{
            colkey: "nickname",
            name: "昵称",
            renderData: function (rowindex, data, rowdata, column) {
                return "<a class='cursor_a' onclick='detailPartner(\"" + rowdata.id + "\")'>" + data + "</a>"
            }
        }, {
            colkey: "truename",
            name: "姓名"
        }, {
            colkey: "gender",
            name: "性别"
        }, {
            colkey: "phone_no",
            name: "手机号码"
        }, {
            colkey: "idcard_type",
            name: "证件类型"
        }, {
            colkey: "idcard_no",
            name: "证件号码"
        }]
    }
    grid = lyGrid({
        id: 'paging',
        l_column: g_title,
        jsonUrl: rootPath + '/user_partner/findByPage.shtml',
        dymCol: false,
        checkbox: true
    });

    $("#addPartner").click(function () {
        addPartner()
    })
    $("#editPartner").click(function () {
        editPartner()
    })

    $("#delPartner").click(function () {
        delPartner()
    })
});

function addPartner() {
    if (CommnUtil.isPhone()){
        window.location.href=rootPath + '/user_partner/mb_addUI.shtml?comefrom=u_list"'
    }else{
        parent.pageii = parent.layer.open({
            title: "新增",
            type: 2,
            area: ["600px", "80%"],
            content: rootPath + '/user_partner/addUI.shtml'
        });
    }

}

function editPartner() {
    var cbox = grid.getSelectedCheckbox();
    if (cbox.length > 1 || cbox == "") {
        layer.msg("只能选中�?�?");
        return;
    }
    if (CommnUtil.isPhone()){
        window.location.href=rootPath + '/user_partner/mb_editUI/' + cbox + '.shtml'
    }else{
        parent.pageii = parent.layer.open({
            title: "修改",
            type: 2,
            area: ["600px", "80%"],
            content: rootPath + '/user_partner/editUI/' + cbox + '.shtml'
        });
    }

}

function delPartner() {
    var cbox = grid.getSelectedCheckbox();
    if (cbox == "") {
        parent.layer.msg("请选择删除项！");
        return;
    }
    if (CommnUtil.isPhone()) {
        pageii = layer.confirm('是否删除?', function (index) {
            var url = rootPath + '/user_partner/deleteEntity.shtml';
            var s = CommnUtil.ajax(url, {
                ids: cbox.join(",")
            }, "json");
            layer.close(parent.pageii);
            if (s == "success") {
                layer.msg('删除成功');
                grid.loadData();

            } else {
                layer.msg('删除失败');
            }

        });
    } else {

        parent.pageii = parent.layer.confirm('是否删除?', function (index) {
            var url = rootPath + '/user_partner/deleteEntity.shtml';
            var s = CommnUtil.ajax(url, {
                ids: cbox.join(",")
            }, "json");
            parent.layer.close(parent.pageii);
            if (s == "success") {
                parent.layer.msg('删除成功');
                grid.loadData();

            } else {
                layer.msg('删除失败');
            }

        });
    }
}

function detailPartner(id) {
    if (CommnUtil.isPhone()) {
        pageii = parent.layer.open({
            title: "详情",
            type: 2,
            area: ["100%", "100%"],
            content: rootPath + '/user_partner/detailUI/' + id + '.shtml'
        });
    } else {

        parent.pageii = parent.layer.open({
            title: "详情",
            type: 2,
            area: ["600px", "405px"],
            content: rootPath + '/user_partner/detailUI/' + id + '.shtml'
        });
    }
}