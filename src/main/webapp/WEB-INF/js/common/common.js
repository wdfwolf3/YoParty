/**
 * 工具组件 对原有的工具进行封装，自定义某方法统一处理
 *
 * @author yoparty 2014-12-12
 * @Email:
 * @version 3.0v
 */
;
(function () {
    ly = {};
    ly.ajax = (function (params) {
        var pp = {
            error: function (XMLHttpRequest, textStatus, errorThrown) {
                layer.open({
                    type: 1,
                    title: "出错啦！",
                    area: ['95%', '95%'],
                    content: "<div id='layerError' style='color:red'>"
                    + XMLHttpRequest.responseText + "</div>"
                });
            }
        };
        $.extend(pp, params);
        $.ajax(pp);
    });
    ly.ajaxSubmit = (function (form, params) {// form 表单ID. params ajax参数
        var pp = {
            error: function (XMLHttpRequest, textStatus, errorThrown) {
                layer.open({
                    type: 1,
                    title: "出错啦！",
                    area: ['95%', '95%'],
                    content: "<div id='layerError' style='color:red'>"
                    + XMLHttpRequest.responseText + "</div>"
                });
            }
        };
        $.extend(pp, params);
        $(form).ajaxSubmit(pp);
    });
    CommnUtil = {
        /**
         * ajax同步请求 返回一个html内容 dataType=html. 默认为html格式 如果想返回json.
         * CommnUtil.ajax(url, data,"json")
         *
         */
        ajax: function (url, data, dataType) {
            if (!CommnUtil.notNull(dataType)) {
                dataType = "html";
            }
            var html = '没有结果!';
            // 所以AJAX都必须使用ly.ajax..这里经过再次封装,统一处理..同时继承ajax所有属性
            if (url.indexOf("?") > -1) {
                url = url + "&_t=" + new Date();
            } else {
                url = url + "?_t=" + new Date();
            }
            ly.ajax({
                type: "post",
                data: data,
                url: url,
                dataType: dataType,// 这里的dataType就是返回回来的数据格式了html,xml,json
                async: false,
                cache: false,// 设置是否缓存，默认设置成为true，当需要每次刷新都需要执行数据库操作的话，需要设置成为false
                success: function (data) {
                    html = data;
                }
            });
            return html;
        },
        /**
         * 判断某对象不为空..返回true 否则 false
         */
        notNull: function (obj) {
            if (obj === null) {
                return false;
            } else if (obj === undefined) {
                return false;
            } else if (obj === "undefined") {
                return false;
            } else if (obj === "") {
                return false;
            } else if (obj === "[]") {
                return false;
            } else if (obj === "{}") {
                return false;
            } else {
                return true;
            }

        },

        /**
         * 判断某对象不为空..返回obj 否则 ""
         */
        notEmpty: function (obj) {
            if (obj === null) {
                return "";
            } else if (obj === undefined) {
                return "";
            } else if (obj === "undefined") {
                return "";
            } else if (obj === "") {
                return "";
            } else if (obj === "[]") {
                return "";
            } else if (obj === "{}") {
                return "";
            } else {
                return obj;
            }

        },
        loadingImg: function () {
            var html = '<div class="alert alert-warning" >'
                // + '<button type="button" class="close" data-dismiss="alert"><i class="ace-icon fa fa-times"></i></button>'
                + '<div style="text-align:center;margin:5px;">加载更多</div>'
                + '<div style="text-align:center">'
                + '<img src="' + rootPath + '/images/loading.gif"/><div>'
                + '</div>';
            return html;
        },
        /**
         * base64转html
         */
        base64tohtml: function (base64str) {
            var unicode = BASE64.decoder(base64str);
            var str = '';
            for (var i = 0, len = unicode.length; i < len; ++i) {
                str += String.fromCharCode(unicode[i]);
            }
            return str;
        }
        ,
        /**
         * html标签转义
         */
        htmlspecialchars: function (str) {
            var s = "";
            if (str.length == 0)
                return "";
            for (var i = 0; i < str.length; i++) {
                switch (str.substr(i, 1)) {
                    case "<":
                        s += "&lt;";
                        break;
                    case ">":
                        s += "&gt;";
                        break;
                    case "&":
                        s += "&amp;";
                        break;
                    case " ":
                        if (str.substr(i + 1, 1) == " ") {
                            s += " &nbsp;";
                            i++;
                        } else
                            s += " ";
                        break;
                    case "\"":
                        s += "&quot;";
                        break;
                    case "\n":
                        s += "";
                        break;
                    default:
                        s += str.substr(i, 1);
                        break;
                }
            }
        }
        ,
        /**
         * in_array判断一个值是否在数组中
         */
        in_array: function (array, string) {
            for (var s = 0; s < array.length; s++) {
                thisEntry = array[s].toString();
                if (thisEntry == string) {
                    return true;
                }
            }
            return false;
        }
        ,
        /**
         * 生成地区选择器
         */
        area_gen: function (id) {
            arr = id.split(".")
            if (arr.length < 2) {
                alert("CommnUtil.area_gen()地区选择器传入的参数:'" + id + "'有问题,请检查");
            } else {
                nm = arr[1]
                var proh = "";
                var url = rootPath + '/common/area_list.shtml';
                var data = CommnUtil.ajax(url, {
                    'sysDictFormMap.dict_level': 1
                }, "json");
                if (data != null) {
                    for (var i = 0; i < data.length; i++) {
                        proh += "<option  value='" + data[i].id + "'>" + data[i].name
                            + "</option>";
                    }
                } else {
                    layer.msg("获取字典信息错误，请联系管理员！");
                }
                html = "<select id=\"" + nm + "_provice\" onchange=\"byCommonArea(2,this,'" + nm + "')\">" +
                    "<option value='0'>--请选择省份--</option>" +
                    "" + proh + "</select>&nbsp;&nbsp; " +
                    "<select id=\"" + nm + "_city\" onchange=\"byCommonArea(3,this,'" + nm + "')\"> " +
                    "  <option value='0'>--请选择城市--</option> </select>&nbsp;&nbsp; " +
                    "<select id=\"" + nm + "_town\" onchange=\"byCommonArea(4,this,'" + nm + "')\">" +
                    "   <option value='0'>--请选择区县（可不选）--</option> </select> " +
                    "<input id=\"" + nm + "_zh\" name=\"" + id + "\" type=\"hidden\" /> " +
                    "<input id=\"" + nm + "_code\" name=\"" + id + "_code\" type=\"hidden\" />"
                $("[id='" + id + "']").html(html)
                initCommonArea(id)
            }

        }
        ,
        isPhone: function () {
            var sUserAgent = navigator.userAgent.toLowerCase();
            var bIsIpad = sUserAgent.match(/ipad/i) == "ipad";
            var bIsIphoneOs = sUserAgent.match(/iphone os/i) == "iphone os";
            var bIsMidp = sUserAgent.match(/midp/i) == "midp";
            var bIsUc7 = sUserAgent.match(/rv:1.2.3.4/i) == "rv:1.2.3.4";
            var bIsUc = sUserAgent.match(/ucweb/i) == "ucweb";
            var bIsAndroid = sUserAgent.match(/android/i) == "android";
            var bIsCE = sUserAgent.match(/windows ce/i) == "windows ce";
            var bIsWM = sUserAgent.match(/windows mobile/i) == "windows mobile";
            if (bIsIpad || bIsIphoneOs || bIsMidp || bIsUc7 || bIsUc || bIsAndroid || bIsCE || bIsWM) {
                return true;
            } else {
                return false;
            }
        },
        getOs: function () {
            var OsObject = "";
            if (navigator.userAgent.indexOf("MSIE") > 0) {
                return "MSIE";
            }
            if (isFirefox = navigator.userAgent.indexOf("Firefox") > 0) {
                return "Firefox";
            }
            if (isSafari = navigator.userAgent.indexOf("Safari") > 0) {
                return "Safari";
            }
            if (isCamino = navigator.userAgent.indexOf("Camino") > 0) {
                return "Camino";
            }
            if (isMozilla = navigator.userAgent.indexOf("Gecko/") > 0) {
                return "Gecko";
            }

        },

        /**
         * 检查文件大小
         * @param id
         * @returns
         */
        checkFile: function (id) {
            var filepath = $("input[id='" + id + "']").val();
            var extStart = filepath.lastIndexOf(".");
            var ext = filepath.substring(extStart, filepath.length).toUpperCase();
            if (ext != ".BMP" && ext != ".PNG" && ext != ".GIF" && ext != ".JPG" && ext != ".JPEG") {
                alert("图片限于bmp,png,gif,jpeg,jpg格式");
                return false;
            }
            var file_size = 0;
            if (/msie/.test(navigator.userAgent.toLowerCase())) {
                var img = new Image();
                img.src = filepath;
                while (true) {
                    if (img.fileSize > 0) {
                        if (img.fileSize > 10 * 1024 * 1024) {
                            alert("图片不大于10MB。");
                        } else {
                            var num03 = img.fileSize / 1024;
                            num04 = num03.toFixed(2)
                        }
                        break;
                    }
                }
            } else {
                file_size = document.getElementById(id).files[0].size;
                var size = file_size / 1024 / 1024;
                if (size > 10) {
                    alert("上传的图片大小不能超过10M！");
                } else {
                    var num01 = file_size / 1024;
                    num02 = num01.toFixed(2);
                }
            }
            return true;

        }
    }
    ;
})();
function initCommonArea(id) {
    code = $("[id='" + id + "']").attr("value")
    if (code != null && code != "") {
        cd = code.split(",")

        $("#" + nm + "_provice").val(cd[0])
        // 生成城市代码
        var url = rootPath + '/common/area_list.shtml';
        var data = CommnUtil.ajax(url, {
            'sysDictFormMap.dict_level': 2,
            'sysDictFormMap.parentId': cd[0]
        }, "json");
        h = genAreaOpt(data, cd[1])
        $("#" + nm + "_city").html("<option value='0' >--请选择城市--</option>" + h)
        data = CommnUtil.ajax(url, {
            'sysDictFormMap.dict_level': 3,
            'sysDictFormMap.parentId': cd[1]
        }, "json");
        h = genAreaOpt(data, cd[2])
        $("#" + nm + "_town").html("<option value='0' >--请选择区县（可不选）--</option>" + h)
    }
}

function genAreaOpt(data, value) {
    h = ""
    for (var i = 0; i < data.length; i++) {
        if (data[i].id == value) {
            h += "<option  value='" + data[i].id + "' selected='selected' >" + data[i].name
                + "</option>";
        } else {
            h += "<option  value='" + data[i].id + "'>" + data[i].name
                + "</option>";
        }
    }
    return h
}

function byCommonArea(opt, obj, id) {
    selectOpt = $(obj).find("option:selected")
    pid = selectOpt.val()
    if (opt < 4) {
        var url = rootPath + '/common/area_list.shtml';
        var data = CommnUtil.ajax(url, {
            'sysDictFormMap.dict_level': opt,
            'sysDictFormMap.parentId': pid
        }, "json");
        if (data != null) {
            var h = "";
            for (var i = 0; i < data.length; i++) {
                h += "<option  value='" + data[i].id + "'>" + data[i].name
                    + "</option>";
            }
            if (opt == 2) {// 省份选择了之后做的操作
                // 给城市添加下拉框显示的option
                h = "<option value='0' >--请选择城市--</option>" + h
                $("#" + id + "_city").html(h);
                // 给区县添加下拉框显示的option
                townOpt = "<option value='0' >--请选择区县（可不选）--</option>"
                $("#" + id + "_town").html(townOpt);
            } else if (opt == 3) {// 城市选择了之后做的操作
                // 给区县添加下拉框显示的option
                h = "<option value='0' >--请选择区县（可不选）--</option>" + h
                $("#" + id + "_town").html(h);
            }
        } else {
            layer.msg("获取地域信息错误，请联系管理员！");
        }
    }
    prod = $("#" + id + "_provice").find("option:selected")
    pron = prod.val() == 0 ? "" : prod.html()
    proc = prod.val()
    // 获取选择城市的名称和code
    cityd = $("#" + id + "_city").find("option:selected")
    cityn = cityd.val() == 0 ? "" : " " + cityd.html()
    cityc = cityd.val()
    // 获取选择区县的名称和code
    townd = $("#" + id + "_town").find("option:selected")
    townn = townd.val() == 0 ? "" : " " + townd.html()
    townc = townd.val()
    zh = pron + " " + cityn + " " + townn
    cd = proc + "," + cityc + "," + townc
    $("#" + id + "_zh").val(zh.trim())
    $("#" + id + "_code").val(cd)
    // alert($("#"+id+"_zh").val()+" || "+$("#"+id+"_code").val())
}


// 表单json格式化方法……不使用&拼接
(function ($) {
    $.fn.serializeJson = function () {
        var serializeObj = {};
        var array = this.serializeArray();
        $(array).each(
            function () {
                if (serializeObj[this.name]) {
                    if ($.isArray(serializeObj[this.name])) {
                        serializeObj[this.name].push(this.value);
                    } else {
                        serializeObj[this.name] = [
                            serializeObj[this.name], this.value];
                    }
                } else {
                    serializeObj[this.name] = this.value;
                }
            });
        return serializeObj;
    };
    Date.prototype.format = function (format) {
        var o = {
            "M+": this.getMonth() + 1, // month
            "d+": this.getDate(), // day
            "h+": this.getHours(), // hour
            "m+": this.getMinutes(), // minute
            "s+": this.getSeconds(), // second
            "q+": Math.floor((this.getMonth() + 3) / 3), // quarter
            "S": this.getMilliseconds()// millisecond
        }
        if (/(y+)/.test(format)) {
            format = format.replace(RegExp.$1, (this.getFullYear() + "")
                .substr(4 - RegExp.$1.length));
        }
        for (var k in o) {
            if (new RegExp("(" + k + ")").test(format)) {
                format = format.replace(RegExp.$1, RegExp.$1.length == 1 ? o[k]
                    : ("00" + o[k]).substr(("" + o[k]).length));
            }
        }
        return format;
    }
})(jQuery);









