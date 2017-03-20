/**
 * 宸ュ叿缁勪欢 瀵瑰師鏈夌殑宸ュ叿杩涜灏佽锛岃嚜瀹氫箟鏌愭柟娉曠粺涓€澶勭悊
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
                    title: "鍑洪敊鍟︼紒",
                    area: ['95%', '95%'],
                    content: "<div id='layerError' style='color:red'>"
                    + XMLHttpRequest.responseText + "</div>"
                });
            }
        };
        $.extend(pp, params);
        $.ajax(pp);
    });
    ly.ajaxSubmit = (function (form, params) {// form 琛ㄥ崟ID. params ajax鍙傛暟
        var pp = {
            error: function (XMLHttpRequest, textStatus, errorThrown) {
                layer.open({
                    type: 1,
                    title: "鍑洪敊鍟︼紒",
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
         * ajax鍚屾璇锋眰 杩斿洖涓€涓猦tml鍐呭 dataType=html. 榛樿涓篽tml鏍煎紡 濡傛灉鎯宠繑鍥瀓son.
         * CommnUtil.ajax(url, data,"json")
         *
         */
        ajax: function (url, data, dataType) {
            if (!CommnUtil.notNull(dataType)) {
                dataType = "html";
            }
            var html = '娌℃湁缁撴灉!';
            // 鎵€浠JAX閮藉繀椤讳娇鐢╨y.ajax..杩欓噷缁忚繃鍐嶆灏佽,缁熶竴澶勭悊..鍚屾椂缁ф壙ajax鎵€鏈夊睘鎬�
            if (url.indexOf("?") > -1) {
                url = url + "&_t=" + new Date();
            } else {
                url = url + "?_t=" + new Date();
            }
            ly.ajax({
                type: "post",
                data: data,
                url: url,
                dataType: dataType,// 杩欓噷鐨刣ataType灏辨槸杩斿洖鍥炴潵鐨勬暟鎹牸寮忎簡html,xml,json
                async: false,
                cache: false,// 璁剧疆鏄惁缂撳瓨锛岄粯璁よ缃垚涓簍rue锛屽綋闇€瑕佹瘡娆″埛鏂伴兘闇€瑕佹墽琛屾暟鎹簱鎿嶄綔鐨勮瘽锛岄渶瑕佽缃垚涓篺alse
                success: function (data) {
                    html = data;
                }
            });
            return html;
        },
        /**
         * 鍒ゆ柇鏌愬璞′笉涓虹┖..杩斿洖true 鍚﹀垯 false
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
         * 鍒ゆ柇鏌愬璞′笉涓虹┖..杩斿洖obj 鍚﹀垯 ""
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
                + '<div style="text-align:center;margin:5px;">鍔犺浇鏇村</div>'
                + '<div style="text-align:center">'
                + '<img src="' + rootPath + '/images/loading.gif"/><div>'
                + '</div>';
            return html;
        },
        /**
         * base64杞琱tml
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
         * html鏍囩杞箟
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
         * in_array鍒ゆ柇涓€涓€兼槸鍚﹀湪鏁扮粍涓�
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
         * 鐢熸垚鍦板尯閫夋嫨鍣�
         */
        area_gen: function (id) {
            arr = id.split(".")
            if (arr.length < 2) {
                alert("CommnUtil.area_gen()鍦板尯閫夋嫨鍣ㄤ紶鍏ョ殑鍙傛暟:'" + id + "'鏈夐棶棰�,璇锋鏌�");
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
                    layer.msg("鑾峰彇瀛楀吀淇℃伅閿欒锛岃鑱旂郴绠＄悊鍛橈紒");
                }
                html = "<select id=\"" + nm + "_provice\" onchange=\"byCommonArea(2,this,'" + nm + "')\">" +
                    "<option value='0'>--璇烽€夋嫨鐪佷唤--</option>" +
                    "" + proh + "</select>&nbsp;&nbsp; " +
                    "<select id=\"" + nm + "_city\" onchange=\"byCommonArea(3,this,'" + nm + "')\"> " +
                    "  <option value='0'>--璇烽€夋嫨鍩庡競--</option> </select>&nbsp;&nbsp; " +
                    "<select id=\"" + nm + "_town\" onchange=\"byCommonArea(4,this,'" + nm + "')\">" +
                    "   <option value='0'>--璇烽€夋嫨鍖哄幙锛堝彲涓嶉€夛級--</option> </select> " +
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
         * 妫€鏌ユ枃浠跺ぇ灏�
         * @param id
         * @returns
         */
        checkFile: function (id) {
            var filepath = $("input[id='" + id + "']").val();
            var extStart = filepath.lastIndexOf(".");
            var ext = filepath.substring(extStart, filepath.length).toUpperCase();
            if (ext != ".BMP" && ext != ".PNG" && ext != ".GIF" && ext != ".JPG" && ext != ".JPEG") {
                alert("鍥剧墖闄愪簬bmp,png,gif,jpeg,jpg鏍煎紡");
                return false;
            }
            var file_size = 0;
            if (/msie/.test(navigator.userAgent.toLowerCase())) {
                var img = new Image();
                img.src = filepath;
                while (true) {
                    if (img.fileSize > 0) {
                        if (img.fileSize > 10 * 1024 * 1024) {
                            alert("鍥剧墖涓嶅ぇ浜�10MB銆�");
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
                    alert("涓婁紶鐨勫浘鐗囧ぇ灏忎笉鑳借秴杩�10M锛�");
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
        // 鐢熸垚鍩庡競浠ｇ爜
        var url = rootPath + '/common/area_list.shtml';
        var data = CommnUtil.ajax(url, {
            'sysDictFormMap.dict_level': 2,
            'sysDictFormMap.parentId': cd[0]
        }, "json");
        h = genAreaOpt(data, cd[1])
        $("#" + nm + "_city").html("<option value='0' >--璇烽€夋嫨鍩庡競--</option>" + h)
        data = CommnUtil.ajax(url, {
            'sysDictFormMap.dict_level': 3,
            'sysDictFormMap.parentId': cd[1]
        }, "json");
        h = genAreaOpt(data, cd[2])
        $("#" + nm + "_town").html("<option value='0' >--璇烽€夋嫨鍖哄幙锛堝彲涓嶉€夛級--</option>" + h)
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
            if (opt == 2) {// 鐪佷唤閫夋嫨浜嗕箣鍚庡仛鐨勬搷浣�
                // 缁欏煄甯傛坊鍔犱笅鎷夋鏄剧ず鐨刼ption
                h = "<option value='0' >--璇烽€夋嫨鍩庡競--</option>" + h
                $("#" + id + "_city").html(h);
                // 缁欏尯鍘挎坊鍔犱笅鎷夋鏄剧ず鐨刼ption
                townOpt = "<option value='0' >--璇烽€夋嫨鍖哄幙锛堝彲涓嶉€夛級--</option>"
                $("#" + id + "_town").html(townOpt);
            } else if (opt == 3) {// 鍩庡競閫夋嫨浜嗕箣鍚庡仛鐨勬搷浣�
                // 缁欏尯鍘挎坊鍔犱笅鎷夋鏄剧ず鐨刼ption
                h = "<option value='0' >--璇烽€夋嫨鍖哄幙锛堝彲涓嶉€夛級--</option>" + h
                $("#" + id + "_town").html(h);
            }
        } else {
            layer.msg("鑾峰彇鍦板煙淇℃伅閿欒锛岃鑱旂郴绠＄悊鍛橈紒");
        }
    }
    prod = $("#" + id + "_provice").find("option:selected")
    pron = prod.val() == 0 ? "" : prod.html()
    proc = prod.val()
    // 鑾峰彇閫夋嫨鍩庡競鐨勫悕绉板拰code
    cityd = $("#" + id + "_city").find("option:selected")
    cityn = cityd.val() == 0 ? "" : " " + cityd.html()
    cityc = cityd.val()
    // 鑾峰彇閫夋嫨鍖哄幙鐨勫悕绉板拰code
    townd = $("#" + id + "_town").find("option:selected")
    townn = townd.val() == 0 ? "" : " " + townd.html()
    townc = townd.val()
    zh = pron + " " + cityn + " " + townn
    cd = proc + "," + cityc + "," + townc
    $("#" + id + "_zh").val(zh.trim())
    $("#" + id + "_code").val(cd)
    // alert($("#"+id+"_zh").val()+" || "+$("#"+id+"_code").val())
}


// 琛ㄥ崟json鏍煎紡鍖栨柟娉曗€︹€︿笉浣跨敤&鎷兼帴
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









