/**
 * js琛ㄦ牸鍒嗛〉宸ュ叿缁勪欢
 *
 * @author yoparty
 * @date 2015-03-27
 * @Email:
 * @version 3.0v
 */
;
(function() {
    lyGrid = (function(params,callback) {
        var confs = {
            l_column : [],
            dymCol : false,//鏄惁鏄剧ず鍔ㄦ€佸垪
            pagId : 'paging', // 鍔犺浇琛ㄦ牸瀛樻斁浣嶇疆鐨処D
            width : '100%', // 琛ㄦ牸楂樺害
            height : '100%', // 琛ㄦ牸瀹藉害
            theadHeight : '28px', // 琛ㄦ牸鐨則head楂樺害
            tbodyHeight : '27px',// 琛ㄦ牸body鐨勬瘡涓€琛岄珮搴�
            jsonUrl : '', // 璁块棶鍚庡彴鍦板潃
            isFixed : false,//鏄惁鍥哄畾琛ㄥご
            usePage : true,// 鏄惁鍒嗛〉
            serNumber : false,// 鏄惁鏄剧ず搴忓彿
            local:false,//鏄惁鏈湴鍒嗛〉,鍗宠繑鍥炴墍鏈夋暟鎹�,璁╁墠绔垎椤�
            localData:[],//鏈湴鏁版嵁闆�
            records : 'records',// 鍒嗛〉鏁版嵁
            pageNow : 'pageNow',// 褰撳墠椤电爜 鎴� 褰撳墠绗嚑椤�
            totalPages : 'pageCount',// 鎬婚〉鏁�
            totalRecords : 'rowCount',// 鎬昏褰曟暟
            pagecode : '10',// 鍒嗛〉鏃讹紝鏈€澶氭樉绀哄嚑涓〉鐮�
            async : false, // 榛樿涓哄悓姝�
            data : '', // 鍙戦€佺粰鍚庡彴鐨勬暟鎹� 鏄痡son鏁版嵁 渚嬪{nama:"a",age:"100"}....
            pageSize : 10, // 姣忛〉鏄剧ず澶氬皯鏉℃暟鎹�
            checkbox : false,// 鏄惁鏄剧ず澶嶉€夋
            checkValue : 'id', // 褰揷heckbox涓簍rue鏃讹紝闇€瑕佽缃瓨鏀綾heckbox鐨勫€煎瓧娈� 榛樿瀛樻斁瀛楁id鐨勫€�
            treeGrid : {
                type: 1, //1 琛ㄧず鍚庡彴宸茬粡澶勭悊濂界埗绫诲甫children闆嗗悎 2 琛ㄧず娌℃湁澶勭悊,鐢卞墠绔鐞嗘爲褰㈠紡
                tree : false,// 鏄惁鏄剧ず鏍�
                hide : false,//榛樿灞曞紑
                name : 'name',// 浠ュ摢涓瓧娈� 鐨勬爲褰㈠紡 濡傛灉鏄涓� name,key
                id: "id",
                pid: "pid"
            },
            // 鏍戝舰寮� {tree : false,//鏄惁鏄剧ず鏍� name : 'name'}//浠ュ摢涓瓧娈� 鐨勬爲褰㈠紡
        };
        var l_col = {
            colkey : null,
            name : null,
            width : 'auto',
            theadClass:'',
            tbodyClass:'',
            height : 'auto',
            align : 'center',
            hide : false,
            isSort:false,
            renderData : null
            // 娓叉煋鏁版嵁function( rowindex ,data, rowdata, colkey)
        };
        var conf = $.extend(confs, params);
        var l_tree = conf.treeGrid;
        var col = [];
        for ( var i = 0; i < conf.l_column.length; i++) {
            col.push(l_col);
        }
        // var column = jQuery.extend(true, col, confs.l_column);
        for ( var i = 0; i < col.length; i++) {
            for ( var p in col[i])
                if (col[i].hasOwnProperty(p) && (!conf.l_column[i].hasOwnProperty(p)))
                    conf.l_column[i][p] = col[i][p];
        }
        ;
        var column = conf.l_column;
        var init = function() {
            createHtml();
            //fixhead();
            if(callback)
                callback(column,currentData);//鍥炶皟鍑芥暟 column 瀛楁鍚�,褰撳墠鐣岄潰鐨勬暟鎹� currentData
        };
        var extend = function(o, n, override) {
            for ( var p in n)
                if (n.hasOwnProperty(p) && (!o.hasOwnProperty(p) || override))
                    o[p] = n[p];
        };
        var returnData = '';
        var jsonRequest = function() {
            var json = {};
            var p = {pageSize:conf.pageSize};
            var d = $.extend(p, conf.data);
            if(conf.local){
                json.records = conf.localData;
                json.pageSize = conf.pageSize;
                json.pageNow = 1;
                json.totalRecords = 0;
                json.totalPages = 0;
            }else{
                json='';
                $.ajax({
                    type : 'POST',
                    async : conf.async,
                    data : d,
                    url : conf.jsonUrl,
                    dataType : 'json',
                    success : function(data) {
                        json = data;
                    },
                    error : function(msg) {
                        alert("绯荤粺鏆傛棤鏁版嵁锛�");
                        json = '';
                    }
                });
            }
            return json;
        };
        var divid = "";
        var tee = "1-0";
        var createHtml = function() {
            var jsonData = jsonRequest();
            if (jsonData == '') {
                return;
            }
            returnData=jsonData;
            var id = conf.pagId;
            divid = typeof (id) == "string" ? document.getElementById(id) : id;
            if (divid == "" || divid == undefined || divid == null) {
                //console.error("鎵句笉鍒� id= " + id + " 閫夋嫨鍣紒");
                return;
            }

            divid.innerHTML = '';
            if(conf.isFixed){//涓嶅浐瀹氳〃澶�
                cHeadTable(divid);
            }
            cBodyTh(divid);
            cBodytb(divid, returnData);
            if (conf.usePage) {// 鏄惁鍒嗛〉
                fenyeDiv(divid, returnData);
            }
        };

        //濡傛灉鏄湰鍦板垎椤�,鎺掑簭鏃�,,瑕佸鍑轰竴涓猨s鎻掍欢underscore.js
        var replayData = function(o,key,sort){
            if(o){
                if(!(returnData!=''&&returnData.records.length>0)){
                    returnData = jsonRequest();
                }
                var _array =_.sortBy(returnData.records, key);
                if(sort=="asc"){
                    returnData.records = _array.reverse();
                }else{
                    returnData.records=_array;
                }

            }else{
                returnData = jsonRequest();
            }
            var id = conf.pagId;
            divid = typeof (id) == "string" ? document.getElementById(id) : id;
            cBodytb(divid, returnData);
            if (conf.usePage) {// 鏄惁鍒嗛〉
                fenyeDiv(divid, returnData);
            }
        }

        var cHeadTable = function(divid) {
            var table = document.createElement("table");// 1.鍒涘缓涓€涓猼able琛�
            table.id = "table_head";// 2.璁剧疆id灞炴€�
            table.className = "pp-list.ftl table table-striped table-bordered";
            table.setAttribute("style", "margin-bottom: 0px;");
            divid.appendChild(table);
            var thead = document.createElement('thead');
            table.appendChild(thead);
            var tr = document.createElement('tr');
            tr.setAttribute("style", "line-height:" + conf.tbodyHeight + ";");
            thead.appendChild(tr);
            var cn = "";
            if (!conf.serNumber) {
                cn = "none";
            }
            var th = document.createElement('th');
            th.setAttribute("style", "text-align:center;width: 15px;vertical-align: middle;display: " + cn + ";");
            tr.appendChild(th);
            var cbk = "";
            if (!conf.checkbox) {
                cbk = "none";
            }
            var cth = document.createElement('th');
            cth.setAttribute("style", "text-align:center;width: 28px;vertical-align: middle;text-align:center;display: " + cbk + ";");
            var chkbox = document.createElement("INPUT");
            chkbox.type = "checkbox";
            chkbox.setAttribute("pagId", conf.pagId);
            chkbox.onclick = checkboxbind.bind();
            cth.appendChild(chkbox); // 绗竴鍒楁坊鍔犲閫夋
            tr.appendChild(cth);
            $.each(column, function(i,o) {
                if (!column[o].hide || column[o].hide == undefined) {
                    var th = document.createElement('th');
                    th.className=column[o].theadClass;
                    th.setAttribute("style", "text-align:" + column[o].align + ";width: " + column[o].width + ";height:" + conf.theadHeight + ";vertical-align: middle;");
                    if(column[o].isSort){
                        th.innerHTML = column[o].name+'<span class="wj-glyph-up"></span>';
                    }else{
                        th.innerHTML = column[o].name;
                    }
                    tr.appendChild(th);
                }
            });
        };
        var cBodyTh = function(divid) {
            var tdiv = document.createElement("div");
            var h = '';
            var xy = "hidden";
            if (conf.height == "100%") {
                if (!conf.isFixed) {// //涓嶅浐瀹氳〃澶�
                    h= "auto";
                }else{
                    xy = "auto";
                    h = $(window).height() - $("#table_head").offset().top - $('#table_head').find('th:last').eq(0).height();
                    if (conf.usePage) {// 鏄惁鍒嗛〉
                        h -= 55;
                    }
                    h += "px";
                }
            } else {
                h = conf.height;
            }
            tdiv.setAttribute("style", 'overflow-y: ' + xy + '; height: ' + h + '; background: white;');
            tdiv.className = "t_table";
            divid.appendChild(tdiv);
            var table2 = document.createElement("table");// 1.鍒涘缓涓€涓猼able琛�

            table2.id = "mytable";
            table2.className = "pp-list.ftl table table-striped table-bordered";
            table2.setAttribute("style", "table-layout: fixed;margin-bottom: 0px;width:"+conf.width);
            tdiv.appendChild(table2);
            var thead = document.createElement("thead");// 1.鍒涘缓涓€涓猼head
            table2.appendChild(thead);

            if(!conf.isFixed){//涓嶅浐瀹氳〃澶�
                var tr = document.createElement('tr');
                tr.setAttribute("style", "line-height:" + conf.tbodyHeight + ";");
                thead.appendChild(tr);
                var cn = "";
                if (!conf.serNumber) {
                    cn = "none";
                }
                var th = document.createElement('th');
                th.setAttribute("style", "text-align:center;width: 15px;vertical-align: middle;display: " + cn + ";");
                tr.appendChild(th);
                var cbk = "";
                if (!conf.checkbox) {
                    cbk = "none";
                }
                var cth = document.createElement('th');
                cth.setAttribute("style", "text-align:center;width: 28px;vertical-align: middle;text-align:center;display: " + cbk + ";");
                var chkbox = document.createElement("INPUT");
                chkbox.type = "checkbox";
                chkbox.setAttribute("pagId", conf.pagId);
                chkbox.onclick = checkboxbind.bind();
                cth.appendChild(chkbox); // 绗竴鍒楁坊鍔犲閫夋
                tr.appendChild(cth);
                $.each(column, function(o) {
                    var th = document.createElement('th');
                    th.className=column[o].theadClass;
                    var at = "text-align:" + column[o].align + ";width: " + column[o].width + ";height:" + conf.theadHeight + ";vertical-align: middle;";
                    if(column[o].isSort){
                        th.innerHTML = column[o].name+'<span class="wj-glyph-up" title="'+column[o].colkey+',asc"></span>';
                        th.onclick = sortBind.bind();
                        at+="cursor:pointer;";
                    }else{
                        th.innerHTML = column[o].name;
                    }

                    if (column[o].hide==true)
                        at+="display:"+(column[o].hide ? 'none':'block');
                    th.setAttribute("style", at);

                    tr.appendChild(th);
                });
                if(conf.dymCol){
                    var ico = document.createElement("i");// 1.鍒涘缓涓€涓猧琛�
                    ico.className = "fa fa-thumb-tack";
                    ico.setAttribute("style", "float: right;margin-top: 3px;");
                    ico.onclick = dmycol.bind();
                    tr.lastChild.appendChild(ico);
                }
            }

        };

        var currentData;//褰撳墠椤垫暟鎹�
        var cBodytb = function(divId,jsonData){
            $('#'+divId.id+' table > tbody').remove() ;
            $('#'+divId.id+' div:eq(1)').remove() ;
            var tbody = document.createElement("tbody");// 1.鍒涘缓涓€涓猼head
            divId.getElementsByTagName('table')[0].appendChild(tbody) ;
            var json = _getValueByName(jsonData, conf.records);
            var d = 0;
            var  e = json.length;
            if(conf.local){
                pNow = parseInt(_getValueByName(jsonData, conf.pageNow),10);
                d = (pNow - 1) *conf.pageSize;
                var e = pNow * conf.pageSize - 1;
            }
            currentData = new Array();//褰撳墠椤垫暟鎹�
            for(;d<e;d++){
                var rowdata = json[d];
                currentData.push(rowdata);
                if(CommnUtil.notNull(rowdata)){
                    var tr = document.createElement('tr');
                    tr.setAttribute("style", "line-height:" + conf.tbodyHeight + ";");
                    var sm = parseInt(tee.substring(tee.lastIndexOf("-")+1),10)+1;
                    tee=tee.substring(0,tee.lastIndexOf("-"));
                    tee=tee+"-"+sm;
                    tr.setAttribute("d-tree", tee);
                    tbody.appendChild(tr);
                    var cn = "";
                    if (!conf.serNumber) {
                        cn = "none";
                    }
                    var ntd_d = tr.insertCell(-1);
                    ntd_d.setAttribute("style", "text-align:center;width: 15px;display: " + cn + ";");
                    var rowindex = tr.rowIndex;

                    ntd_d.innerHTML = rowindex;
                    var cbk = "";
                    if (!conf.checkbox) {
                        cbk = "none";
                    }
                    var td_d = tr.insertCell(-1);
                    td_d.setAttribute("style", "text-align:center;width: 28px;display: " + cbk + ";");
                    var chkbox = document.createElement("INPUT");
                    chkbox.type = "checkbox";
                    // ******** 鏍戠殑涓婁笅绉诲姩闇€瑕�
                    chkbox.setAttribute("cid", _getValueByName(rowdata, l_tree.id));
                    chkbox.setAttribute("pid", _getValueByName(rowdata, l_tree.pid));
                    // ******** 鏍戠殑涓婁笅绉诲姩闇€瑕�
                    chkbox.setAttribute("_l_key", "checkbox");
                    chkbox.value = _getValueByName(rowdata, conf.checkValue);
                    chkbox.onclick = highlight.bind(this);
                    td_d.appendChild(chkbox); // 绗竴鍒楁坊鍔犲閫夋
                    $.each(column, function(o) {
                        var td_o = tr.insertCell(-1);
                        td_o.className=column[o].tbodyClass;
                        var at="text-align:" + column[o].align + ";width: " + column[o].width + ";vertical-align: middle;word-break: keep-all;white-space: nowrap;overflow: hidden;text-overflow: ellipsis;";

                        var clm = column[o].colkey;
                        var data = CommnUtil.notEmpty(_getValueByName(rowdata, clm));

                        if (l_tree.tree) {
                            var lt = l_tree.name.split(",");
                            if(CommnUtil.in_array(lt,clm)){
                                var divtree = document.createElement("div");
                                divtree.className = "sys_tree";
                                divtree.setAttribute("style", "padding-top:5px;margin-left:5px;text-align:" + column[o].align + ";");
                                var img = document.createElement('img');
                                if(l_tree.hide||l_tree.hide!=undefined)
                                    img.src=rootPath+"/images/tree/nolines_plus.gif";
                                else
                                    img.src=rootPath+"/images/tree/nolines_minus.gif";
                                img.onclick=datatree.bind();
                                divtree.appendChild(img);
                                td_o.appendChild(divtree);
                                var divspan = document.createElement("span");
                                divspan.className = "l_test";
                                divspan.setAttribute("style", "line-height:" + conf.tbodyHeight + ";");

                                if (column[o].renderData) {
                                    divspan.innerHTML = column[o].renderData(rowindex, data, rowdata, clm);
                                } else {
                                    divspan.innerHTML = data;
                                }
                                td_o.appendChild(divspan);
                            } else {
                                if (column[o].renderData) {
                                    td_o.innerHTML = column[o].renderData(rowindex, data, rowdata, clm);
                                } else {
                                    td_o.innerHTML = data;
                                }
                            }
                            ;
                        } else {
                            if (column[o].renderData) {
                                td_o.innerHTML = column[o].renderData(rowindex, data, rowdata, clm);
                            } else {
                                td_o.innerHTML = data;
                            }
                        }
                        ;
                        if (column[o].hide==true)
                            at+="display:"+(column[o].hide ? 'none':'block');
                        td_o.setAttribute("style", at);
                    });
                    if (l_tree.tree){
                        if(l_tree.type==1){
                            tee=tee+"-0";
                            treeHtml(tbody, rowdata);// 鏍戝舰寮�
                        }else {
                            var obj = json[d];
                            delete json[d];
                            nb = 20;
                            treeSimpleHtml(tbody,json,obj);
                        }
                    }
                }
            };
        }
        var fenyeDiv = function(divid, jsonData) {
            var totalRecords = _getValueByName(jsonData, conf.totalRecords);
            var totalPages = _getValueByName(jsonData, conf.totalPages);
            var pageNow = _getValueByName(jsonData, conf.pageNow);
            if(conf.local){
                totalRecords = jsonData.records.length;//鎬昏鏁�
                totalPages = Math.ceil(totalRecords / conf.pageSize);//鎬婚〉鏁�
            }
            var bdiv = document.createElement("div");
            bdiv.setAttribute("style", "vertical-align: middle;");




            bdiv.className = "span12 center";
            divid.appendChild(bdiv);
            var btable = document.createElement("table");
            btable.width = "100%";
            bdiv.appendChild(btable);
            var btr = document.createElement("tr");
            btable.appendChild(btr);
            var btd_1 = document.createElement("td");

            if(isPhone()){
                btd_1.style.textAlign = "center";
            }else{
                btd_1.style.textAlign = "left";
            }
            btr.appendChild(btd_1);
            var btddiv = document.createElement("div");
            btddiv.className = "pagination";
            btd_1.appendChild(btddiv);
            var divul = document.createElement("ul");
            btddiv.appendChild(divul);
            var ulli = document.createElement("li");
            ulli.className = "prev";
            divul.appendChild(ulli);
            var lia = document.createElement("a");
            lia.href = "javascript:void(0);";
            ulli.appendChild(lia);
            lia.innerHTML = '鎬�&nbsp;' + totalRecords + '&nbsp;鏉�&nbsp;&nbsp;姣忛〉&nbsp;' + conf.pageSize + '&nbsp;鏉�&nbsp;&nbsp;鍏�&nbsp;' + totalPages + '&nbsp;椤�';


            var btd_1 = document.createElement("td");
            btd_1.style.textAlign = "right";
            if(isPhone()){
                btd_1.style.textAlign = "center";
                var btr_2 = document.createElement("tr");
                btable.appendChild(btr_2);
                btr_2.appendChild(btd_1);
            }else{
                btr.appendChild(btd_1);
            }

            var divul_2 = document.createElement("ul");
            divul_2.className = "dataTables_paginate paging_bootstrap pagination";
            btd_1.appendChild(divul_2);

            if (pageNow > 1) {
                var ulli_2 = document.createElement("li");
                divul_2.appendChild(ulli_2);
                var lia_2 = document.createElement("a");
                lia_2.onclick = pageBind.bind();
                lia_2.id = "pagNum_" + (pageNow - 1);
                lia_2.href = "javascript:void(0);";
                lia_2.innerHTML = '鈫� prev';
                ulli_2.appendChild(lia_2);
            } else {
                var ulli_2 = document.createElement("li");
                ulli_2.className = "prev disabled";
                divul_2.appendChild(ulli_2);
                var lia_2 = document.createElement("a");
                lia_2.href = "javascript:void(0);";
                lia_2.innerHTML = '鈫� prev';
                ulli_2.appendChild(lia_2);
            }
            var pg = pagesIndex(conf.pagecode, pageNow, totalPages);
            var startpage = pg.start;
            var endpage = pg.end;
            if (startpage != 1) {
                var ulli_3 = document.createElement("li");
                divul_2.appendChild(ulli_3);
                var lia_3 = document.createElement("a");
                lia_3.onclick = pageBind.bind();
                lia_3.href = "javascript:void(0);";
                lia_3.id = "pagNum_1";
                lia_3.innerHTML = '1...';
                ulli_3.appendChild(lia_3);
            }
            /*if (endpage - startpage <= 0) {
             var ulli_4 = document.createElement("li");
             ulli_4.className = "active";
             divul_2.appendChild(ulli_4);
             var lia_4 = document.createElement("a");
             lia_4.href = "javascript:void(0);";
             lia_4.innerHTML = '1';
             ulli_4.appendChild(lia_4);
             }*/
            for ( var i = startpage; i <= endpage; i++) {
                if (i == pageNow) {
                    var ulli_5 = document.createElement("li");
                    ulli_5.className = "active";
                    divul_2.appendChild(ulli_5);
                    var lia_5 = document.createElement("a");
                    lia_5.href = "javascript:void(0);";
                    lia_5.innerHTML = i;
                    ulli_5.appendChild(lia_5);
                } else {
                    var ulli_5 = document.createElement("li");
                    divul_2.appendChild(ulli_5);
                    var lia_5 = document.createElement("a");
                    lia_5.onclick = pageBind.bind();
                    lia_5.href = "javascript:void(0);";
                    lia_5.id = "pagNum_" + i;
                    lia_5.innerHTML = i;
                    ulli_5.appendChild(lia_5);
                }
                ;

            }
            if (endpage != totalPages) {
                var ulli_6 = document.createElement("li");
                divul_2.appendChild(ulli_6);
                var lia_6 = document.createElement("a");
                lia_6.onclick = pageBind.bind();
                lia_6.href = "javascript:void(0);";
                lia_6.id = "pagNum_" + totalPages;
                lia_6.innerHTML = '...' + totalPages;
                ulli_6.appendChild(lia_6);
            }
            if (pageNow >= totalPages) {
                var ulli_7 = document.createElement("li");
                ulli_7.className = "prev disabled";
                divul_2.appendChild(ulli_7);
                var lia_7 = document.createElement("a");
                lia_7.href = "javascript:void(0);";
                lia_7.innerHTML = 'next 鈫� ';
                ulli_7.appendChild(lia_7);
            } else {
                var ulli_7 = document.createElement("li");
                ulli_7.className = "next";
                divul_2.appendChild(ulli_7);
                var lia_7 = document.createElement("a");
                lia_7.onclick = pageBind.bind();
                lia_7.href = "javascript:void(0);";
                lia_7.id = "pagNum_" + (pageNow + 1);
                lia_7.innerHTML = 'next 鈫� ';
                ulli_7.appendChild(lia_7);
            }
            ;
        };
        var nb = '20';
        var treeHtml = function(tbody, data) {
            if (data == undefined)
                return;
            var jsonTree = data.children;
            if (jsonTree == undefined || jsonTree == '' || jsonTree == null) {
            } else {
                var tte = false;
                $.each(jsonTree, function(jt) {

                    var tte = false;
                    if (jsonTree[jt].children != undefined && jsonTree[jt].children != '' && jsonTree[jt].children != null) {
                        tte=true;
                    }
                    var tr = document.createElement('tr');
                    if(l_tree.hide||l_tree.hide!=undefined)
                        di = 'display: none;';
                    tr.setAttribute("style", "line-height:" + conf.tbodyHeight + ";"+di);
                    var sm = parseInt(tee.substring(tee.lastIndexOf("-")+1),10)+1;
                    tee=tee.substring(0,tee.lastIndexOf("-"));
                    tee=tee+"-"+sm;
                    tr.setAttribute("d-tree", tee);
                    tbody.appendChild(tr);
                    var cn = "";
                    if (!conf.serNumber) {
                        cn = "none";
                    }
                    var ntd_d = tr.insertCell(-1);
                    ntd_d.setAttribute("style", "text-align:center;width: 15px;display: " + cn + ";");
                    var rowindex = tr.rowIndex;
                    ntd_d.innerHTML = rowindex;
                    var cbk = "";
                    if (!conf.checkbox) {
                        cbk = "none";
                    }
                    var td_d = tr.insertCell(-1);
                    td_d.setAttribute("style", "text-align:center;width: 28px;display: " + cbk + ";");
                    var chkbox = document.createElement("INPUT");
                    chkbox.type = "checkbox";
                    // ******** 鏍戠殑涓婁笅绉诲姩闇€瑕�
                    chkbox.setAttribute("cid", _getValueByName(jsonTree[jt], l_tree.id));
                    chkbox.setAttribute("pid", _getValueByName(jsonTree[jt], l_tree.pid));
                    // ******** 鏍戠殑涓婁笅绉诲姩闇€瑕�
                    chkbox.setAttribute("_l_key", "checkbox");
                    chkbox.value = _getValueByName(jsonTree[jt], conf.checkValue);
                    chkbox.onclick = highlight.bind(this);
                    td_d.appendChild(chkbox); // 绗竴鍒楁坊鍔犲閫夋
                    $.each(column, function(o) {
                        if (!column[o].hide || column[o].hide == undefined) {
                            var td_o = tr.insertCell(-1);
                            td_o.setAttribute("style", "text-align:" + column[o].align + ";width: " + column[o].width + ";vertical-align: middle;");
                            var rowdata = jsonTree[jt];
                            var clm = column[o].colkey;
                            var data = CommnUtil.notEmpty(_getValueByName(rowdata, clm));

                            if (l_tree.tree) {
                                var lt = l_tree.name.split(",");
                                if(CommnUtil.in_array(lt,column[o].colkey)){
                                    var divtree = document.createElement("div");
                                    divtree.className = "sys_tree";
                                    divtree.setAttribute("style", "padding-top:5px;margin-left:5px;text-align:" + column[o].align + ";margin-left: " + nb + "px;");
                                    if(tte){
                                        var img = document.createElement('img');
                                        img.src=rootPath+"/images/tree/nolines_minus.gif";
                                        img.onclick=datatree.bind();
                                        divtree.appendChild(img);
                                    }
                                    td_o.appendChild(divtree);
                                    var divspan = document.createElement("span");
                                    divspan.className = "l_test";
                                    divspan.setAttribute("style", "line-height:" + conf.tbodyHeight + ";");
                                    if (column[o].renderData) {
                                        divspan.innerHTML = column[o].renderData(rowindex, data, rowdata, clm);
                                    } else {
                                        divspan.innerHTML = data;
                                    }
                                    td_o.appendChild(divspan);
                                } else {
                                    if (column[o].renderData) {
                                        td_o.innerHTML = column[o].renderData(rowindex, data, rowdata, clm);
                                    } else {
                                        td_o.innerHTML = data;
                                    }
                                }
                                ;
                            } else {
                                if (column[o].renderData) {
                                    td_o.innerHTML = column[o].renderData(rowindex, data, rowdata, clm);
                                } else {
                                    td_o.innerHTML = data;
                                }
                            }
                            ;
                        }
                    });
                    if (tte) {
                        //1-1
                        tee=tee+"-0";
                        nb = parseInt(nb,10) + 20;
                        treeHtml(tbody, jsonTree[jt]);
                    }

                });
                tee=tee.substring(0,tee.lastIndexOf("-"));
                nb = 20;
            }
        };
        var img ;
        var treeSimpleHtml = function(tbody, jsonTree,obj) {
            var tte = false;
            tee=tee+"-0"
            $.each(jsonTree, function(jt) {
                if(CommnUtil.notNull(jsonTree[jt])){
                    var jsb = _getValueByName(jsonTree[jt], l_tree.pid);
                    var ob = _getValueByName(obj, l_tree.id);
                    if(jsb==ob){
                        tte = true;
                        var tr = document.createElement('tr');
                        if(l_tree.hide||l_tree.hide!=undefined)
                            di = 'display: none;';
                        tr.setAttribute("style", "line-height:" + conf.tbodyHeight + ";"+di);
                        var sm = parseInt(tee.substring(tee.lastIndexOf("-")+1),10)+1;
                        tee=tee.substring(0,tee.lastIndexOf("-"));
                        tee=tee+"-"+sm;
                        tr.setAttribute("d-tree", tee);
                        tbody.appendChild(tr);
                        var cn = "";
                        if (!conf.serNumber) {
                            cn = "none";
                        }
                        var ntd_d = tr.insertCell(-1);
                        ntd_d.setAttribute("style", "text-align:center;width: 15px;display: " + cn + ";");
                        var rowindex = tr.rowIndex;
                        ntd_d.innerHTML = rowindex;
                        var cbk = "";
                        if (!conf.checkbox) {
                            cbk = "none";
                        }
                        var td_d = tr.insertCell(-1);
                        td_d.setAttribute("style", "text-align:center;width: 28px;display: " + cbk + ";");
                        var chkbox = document.createElement("INPUT");
                        chkbox.type = "checkbox";
                        // ******** 鏍戠殑涓婁笅绉诲姩闇€瑕�
                        chkbox.setAttribute("cid", _getValueByName(jsonTree[jt], l_tree.id));
                        chkbox.setAttribute("pid", _getValueByName(jsonTree[jt], l_tree.pid));
                        // ******** 鏍戠殑涓婁笅绉诲姩闇€瑕�
                        chkbox.setAttribute("_l_key", "checkbox");
                        chkbox.value = _getValueByName(jsonTree[jt], conf.checkValue);
                        chkbox.onclick = highlight.bind(this);
                        td_d.appendChild(chkbox); // 绗竴鍒楁坊鍔犲閫夋
                        $.each(column, function(o) {
                            if (!column[o].hide || column[o].hide == undefined) {
                                var td_o = tr.insertCell(-1);
                                td_o.setAttribute("style", "text-align:" + column[o].align + ";width: " + column[o].width + ";vertical-align: middle;");
                                var rowdata = jsonTree[jt];
                                var clm = column[o].colkey;
                                var data = CommnUtil.notEmpty(_getValueByName(rowdata, clm));

                                if (l_tree.tree) {
                                    var lt = l_tree.name.split(",");
                                    if(CommnUtil.in_array(lt,column[o].colkey)){
                                        var divtree = document.createElement("div");
                                        divtree.className = "sys_tree";
                                        divtree.setAttribute("style", "padding-top:5px;margin-left:5px;text-align:" + column[o].align + ";margin-left: " + nb + "px;");
                                        img = document.createElement('img');
                                        img.src=rootPath+"/images/tree/nolines_minus.gif";
                                        img.onclick=datatree.bind();
                                        divtree.appendChild(img);
                                        td_o.appendChild(divtree);
                                        var divspan = document.createElement("span");
                                        divspan.className = "l_test";
                                        divspan.setAttribute("style", "line-height:" + conf.tbodyHeight + ";");
                                        if (column[o].renderData) {
                                            divspan.innerHTML = column[o].renderData(rowindex, data, rowdata, clm);
                                        } else {
                                            divspan.innerHTML = data;
                                        }
                                        td_o.appendChild(divspan);
                                    } else {
                                        if (column[o].renderData) {
                                            td_o.innerHTML = column[o].renderData(rowindex, data, rowdata, clm);
                                        } else {
                                            td_o.innerHTML = data;
                                        }
                                    }
                                    ;
                                } else {
                                    if (column[o].renderData) {
                                        td_o.innerHTML = column[o].renderData(rowindex, data, rowdata, clm);
                                    } else {
                                        td_o.innerHTML = data;
                                    }
                                }
                                ;
                            }
                        });
                        var o = jsonTree[jt];
                        delete jsonTree[jt];
                        nb = parseInt(nb,10) + 20;
                        treeSimpleHtml(tbody, jsonTree,o)
                    }
                }
            });
            if(!tte){
                if(CommnUtil.notNull(img))
                    img.remove(img.selectedIndex);
            }
            tee=tee.substring(0,tee.lastIndexOf("-"));
            nb = parseInt(nb,10) - 20;;
        };
        Array.prototype.sys_each = function(f) { // 鏁扮粍鐨勯亶鍘�
            for ( var i = 0; i < this.length; i++)
                f(this[i], i, this);
        };
        var lyGridUp = function(jsonUrl) { // 涓婄Щ鎵€閫夎

            var upOne = function(tr) { // 涓婄Щ1琛�
                if (tr.rowIndex > 0) {
                    var ctr = divid.children[0].children.mytable.rows[tr.rowIndex - 1];
                    swapTr(tr, ctr);
                    getChkBox(tr).checked = true;
                }
            };
            var arr = $A(divid.children[0].children.mytable.rows).reverse(); // 鍙嶉€�
            if (arr.length > 0 && getChkBox(arr[arr.length - 1]).checked) {
                for ( var i = arr.length - 1; i >= 0; i--) {
                    if (getChkBox(arr[i]).checked) {
                        arr.pop();
                    } else {
                        break;
                    }
                }
            }
            ;
            arr.reverse().sys_each(function(tr) {
                var ck = getChkBox(tr);
                if (ck.checked) {
                    var cd = ck.getAttribute("cid");
                    $("input:checkbox[pid='" + cd + "']").attr('checked', 'true');// 璁╁瓙绫婚€変腑
                    upOne(tr);
                }
            });
            var row = rowline();// 鏁扮粍瀵硅薄榛樿鏄瘂"rowNum":row,"rowId":cbox};
            var data = [];
            $.each(row, function(i) {
                data.push(conf.checkValue+"[" + i + "]=" + row[i].rowId);
                data.push("rowId[" + i + "]=" + row[i].rowNum);
            });
            $.ajax({
                type : 'POST',
                data : data.join("&"),
                url : jsonUrl,
                dataType : 'json',
            });
        };
        var lyGridDown = function(jsonUrl) { // 涓嬬Щ鎵€閫夎

            var downOne = function(tr) {
                if (tr.rowIndex < divid.children[0].children.mytable.rows.length - 1) {
                    swapTr(tr, divid.children[0].children.mytable.rows[tr.rowIndex + 1]);
                    getChkBox(tr).checked = true;
                }
            };
            var arr = $A(divid.children[0].children.mytable.rows);
            if (arr.length > 0 && getChkBox(arr[arr.length - 1]).checked) {
                for ( var i = arr.length - 1; i >= 0; i--) {
                    if (getChkBox(arr[i]).checked) {
                        arr.pop();
                    } else {
                        break;
                    }
                }
            }
            arr.sys_each(function(tr) {
                var ck = getChkBox(tr);
                if (ck.checked) {
                    var cd = ck.getAttribute("cid");
                    $("input:checkbox[pid='" + cd + "']").attr('checked', 'true');// 璁╁瓙绫婚€変腑
                }
            });
            arr.reverse().sys_each(function(tr) {
                if (getChkBox(tr).checked)
                    downOne(tr);
            });
            var row = rowline();// 鏁扮粍瀵硅薄榛樿鏄瘂"rowNum":row,"rowId":cbox};
            var data = [];
            $.each(row, function(i) {
                data.push(conf.checkValue+"[" + i + "]=" + row[i].rowId);
                data.push("rowId[" + i + "]=" + row[i].rowNum);
            });
            $.ajax({
                type : 'POST',
                data : data.join("&"),
                url : jsonUrl,
                dataType : 'json',
            });
        };
        var highlight = function() { // 璁剧疆琛岀殑鑳屾櫙鑹�
            var evt = arguments[0] || window.event;
            var chkbox = evt.srcElement || evt.target;
            var tr = chkbox.parentNode.parentNode;
            chkbox.checked ? setBgColor(tr) : restoreBgColor(tr);
        };
        var selectRow = function(pagId) {
            var ck = getSelectedCheckbox(pagId);
            var json = _getValueByName(returnData, conf.records);
            var ret = [];
            $.each(json, function(d) {
                $.each(ck, function(c) {
                    if(ck[c] == _getValueByName(json[d], conf.checkValue))
                        ret.push(json[d]);
                });
            });
            return ret;
        };
        var trClick = function() { // 璁剧疆琛岀殑鑳屾櫙鑹� 鍏煎鎬ч棶棰樺緢澶�
            /*
             * var evt = arguments[0] || window.event; var tr = evt.srcElement ||
             * evt.currentTarget; var chkbox = getChkBox(tr);
             * if(chkbox.checked){ chkbox.checked = false; restoreBgColor(tr);
             * }else{ chkbox.checked=true; setBgColor(tr); }
             */
        };
        var checkboxbind = function() { // 鍏ㄩ€�/鍙嶉€�
            var evt = arguments[0] || window.event;
            var chkbox = evt.srcElement || evt.target;
            var checkboxes = $("#"+chkbox.attributes.pagId.value+" input[_l_key='checkbox']");
            if (chkbox.checked) {
                checkboxes.prop('checked', true);
            } else {
                checkboxes.prop('checked', false);
            }
            checkboxes.each(function() {
                var tr = this.parentNode.parentNode;
                var chkbox = getChkBox(tr);
                if (chkbox.checked) {
                    setBgColor(tr);
                } else {
                    restoreBgColor(tr);
                }
            });
        };

        var pageBind = function() { // 椤垫暟
            var evt = arguments[0] || window.event;
            var a = evt.srcElement || evt.target;
            var page = a.id.split('_')[1];

            if(conf.local){
                returnData.pageNow=parseInt(page,10);
                cBodytb(divid,returnData);
                if (conf.usePage) {// 鏄惁鍒嗛〉
                    fenyeDiv(divid, returnData);
                }
            }else{
                conf.data = $.extend(conf.data, {
                    pageNow : page
                });
                replayData();
            }
        };
        var sortBind = function(){
            var evt = arguments[0] || window.event;
            var th = evt.srcElement || evt.target;
            var t = th.title.split(",");
            if(t[0]==""){
                th=th.firstElementChild
                t=th.title.split(",");
            }
            var sc = "";
            if(t[1]=="asc"){
                th.className="wj-glyph-down";
                th.title=t[0]+",desc";
                sc="desc";
            }else{
                th.className="wj-glyph-up";
                th.title=t[0]+",asc";
                sc="asc";
            }
            conf.data = $.extend(conf.data, {
                column:t[0],sort:sc
            });
            if(conf.local)
                replayData('0',t[0],sc);
            else
                replayData();
        }
        var datatree = function() { // 椤垫暟
            var evt = arguments[0] || window.event;
            var img = evt.srcElement || evt.target;
            var ttr = img.parentElement.parentElement.parentElement.getAttribute('d-tree');
            if(img.src.indexOf("nolines_plus.gif")>-1){
                img.src=rootPath+"/images/tree/nolines_minus.gif";
                $("tr[d-tree^='"+ttr+"-']").show();
            }else{
                img.src=rootPath+"/images/tree/nolines_plus.gif";
                $("tr[d-tree^='"+ttr+"-']").hide();
            }
        };

        var swapTr = function(tr1, tr2) { // 浜ゆ崲tr1鍜宼r2鐨勪綅缃�
            var target = (tr1.rowIndex < tr2.rowIndex) ? tr2.nextSibling : tr2;
            var tBody = tr1.parentNode;
            tBody.replaceChild(tr2, tr1);
            tBody.insertBefore(tr1, target);
        };
        var getChkBox = function(tr) { // 浠巘r寰楀埌 checkbox瀵硅薄
            return tr.cells[1].firstChild;

        };
        var restoreBgColor = function(tr) {// 涓嶅嬀閫夎缃儗鏅壊
            for ( var i = 0; i < tr.childNodes.length; i++) {
                tr.childNodes[i].style.backgroundColor = "";
            }
        };
        var setBgColor = function(tr) { // 璁剧疆鑳屾櫙鑹�
            for ( var i = 0; i < tr.childNodes.length; i++) {
                tr.childNodes[i].style.backgroundColor = "#D4D4D4";
            }
        };
        function $A(arrayLike) { // 鏁板€肩殑濉厖
            for ( var i = 0, ret = []; i < arrayLike.length; i++)
                ret.push(arrayLike[i]);
            return ret;
        }
        ;
        Function.prototype.bind = function() { // 鏁版嵁鐨勭粦瀹�
            var __method = this, args = $A(arguments), object = args.shift();
            return function() {
                return __method.apply(object, args.concat($A(arguments)));
            };
        };

        var _getValueByName = function(data, name) {
            if (!data || !name)
                return null;
            if (name.indexOf('.') == -1) {
                return data[name];
            } else {
                try {
                    return new Function("data", "return data." + name + ";")(data);
                } catch (e) {
                    return null;
                }
            }
        };
        var rowline = function() {
            var cb = [];

            var arr = $A(divid.children[0].children.mytable.rows);
            for ( var i = arr.length - 1; i > 0; i--) {
                var cbox = getChkBox(arr[i]).value;
                var row = arr[i].rowIndex;
                var sort = {};
                sort.rowNum = row;
                sort.rowId = cbox;
                cb.push(sort);
            }
            ;
            return cb.reverse();
        };
        /**
         * 杩欐槸涓€涓垎椤靛伐鍏� 涓昏鐢ㄤ簬鏄剧ず椤电爜,寰楀埌杩斿洖鏉ョ殑 寮€濮嬮〉鐮佸拰缁撴潫椤电爜 pagecode 瑕佽幏寰楄褰曠殑寮€濮嬬储寮� 鍗� 寮€濮嬮〉鐮� pageNow
         * 褰撳墠椤� pageCount 鎬婚〉鏁�
         *
         */
        var pagesIndex = function(pagecode, pageNow, pageCount) {
            /*
             * var pagecode = _getValueByName(jsonData,conf.pagecode) ==
             * undefined ? conf.pagecode
             * :_getValueByName(jsonData,conf.pagecode); var sten =
             * pagesIndex(pagecode, pageNow,totalPages); var
             * startpage=sten.start; var endpage=sten.end;
             */
            pagecode = parseInt(pagecode,10);
            pageNow = parseInt(pageNow,10);
            pageCount = parseInt(pageCount,10);
            var startpage = pageNow - (pagecode % 2 == 0 ? pagecode / 2 - 1 : pagecode / 2);
            var endpage = pageNow + pagecode / 2;
            if (startpage < 1) {
                startpage = 1;
                if (pageCount >= pagecode)
                    endpage = pagecode;
                else
                    endpage = pageCount;
            }
            if (endpage > pageCount) {
                endpage = pageCount;
                if ((endpage - pagecode) > 0)
                    startpage = endpage - pagecode + 1;
                else
                    startpage = 1;
            }
            ;
            var se = {
                start : startpage,
                end : endpage
            };
            return se;
        };
        /**
         * 閲嶆柊鍔犺浇
         */
        var loadData = function() {
            $.extend(conf, params);
            replayData();
        };

        /**
         * 鏌ヨ鏃讹紝璁剧疆鍙傛暟鏌ヨ
         */
        var setOptions = function(params) {
            var data;
            if(params.data){
                data=$.extend(conf.data, params.data);
                params.data=data;
            }
            $.extend(conf, params);
            conf.data.pageNow=1;
            replayData();
        };
        /**
         * 鑾峰彇閫変腑鐨勫€�
         */
        var getSelectedCheckbox = function(pagId) {
            if(pagId==''||pagId==undefined){
                pagId = conf.pagId;
            }
            var arr = [];
            $("#"+pagId+" input[_l_key='checkbox']:checkbox:checked").each(function() {
                arr.push($(this).val());
            });
            return arr;
        };

        var selectTreeRow = function(pagId) {
            var ck = getSelectedCheckbox(pagId);
            var json = _getValueByName(returnData, conf.records);
            var ret = [];
            $.each(json, function(d) {
                $.each(ck, function(c) {

                    if(ck[c] == _getValueByName(json[d], conf.checkValue)) {
                        ret.push(json[d]);
                    } else {
                        $.each(json[d].children, function(child){
                            if(ck[c] == _getValueByName(json[d].children[child], conf.checkValue)) {
                                ret.push(json[d].children[child]);
                            }
                        })
                    }
                });
            });
            return ret;
        };
        var getColumn = function(){
            return column;
        };
        var exportData = function(url){
            var form=$("<form>");//瀹氫箟涓€涓猣orm琛ㄥ崟
            form.attr("style","display:none");
            form.attr("target","");
            form.attr("method","post");
            form.attr("action",rootPath + url);
            $("body").append(form);//灏嗚〃鍗曟斁缃湪web涓�
            var input1=$("<input>");
            input1.attr("type","hidden");
            input1.attr("name","exportData");
            input1.attr("value",JSON.stringify(column));
            form.append(input1);
            var par=conf.data;
            for(var p in par){
                var input1=$("<input>");
                input1.attr("type","hidden");
                input1.attr("value",par[p]);
                if(p.indexOf(".")>0){
                    p = p.split(".")[1];
                }
                input1.attr("name",p);
                form.append(input1);
            }
            form.submit();//琛ㄥ崟鎻愪氦
        };
        var getCurrentData = function(){
            return currentData;
        };
        var dmycolcheck = function(e){
            var u = $(e.target).attr("span_value");
            if($(e.target).attr("class").indexOf("checked")==-1){
                $(e.target).addClass("checked");
                $(divid).find('table:eq(0) tr th:nth-child('+(parseInt(u,10)+3)+')').hide();
                $(divid).find('table:eq(0) tr td:nth-child('+(parseInt(u,10)+3)+')').hide();
            }
            else{
                $(e.target).removeClass("checked");
                $(divid).find('table:eq(0) tr th:nth-child('+(parseInt(u,10)+3)+')').show();
                $(divid).find('table:eq(0) tr td:nth-child('+(parseInt(u,10)+3)+')').show();
            }
        };
        var dmycol = function(e){
            if($('#ul_dmycol').length > 0){
                $('#ul_dmycol').toggle();
            }else{
                var ul = document.createElement("ul");
                ul.className = "dmycol-menu";
                ul.id="ul_dmycol";
                $.each(column, function(i,o) {
                    var li = document.createElement("li");//
                    var spanbox = document.createElement("span");
                    if (o.hide==true)
                        spanbox.className = "span_checkbox checked";
                    else
                        spanbox.className = "span_checkbox";
                    spanbox.setAttribute("span_value", i);
                    spanbox.name=o.colkey;
                    spanbox.onclick=dmycolcheck.bind();
                    li.appendChild(spanbox);
                    var sp = document.createElement("span");//
                    sp.innerHTML=" "+o.name;
                    li.appendChild(sp);
                    ul.appendChild(li);
                });
                e.target.parentNode.insertBefore(ul,null);
            }

        };
        init();

        return {
            setOptions : setOptions,//鑷畾涔夋潯浠舵煡璇�
            loadData : loadData,//閲嶆柊鍔犺浇鏁版嵁
            getSelectedCheckbox : getSelectedCheckbox,//鑾峰彇閫夋嫨鐨勮鐨凜heckbox鍊�
            selectRow : selectRow,// 閫変腑琛屼簨浠�
            selectTreeRow : selectTreeRow,
            lyGridUp : lyGridUp,//涓婄Щ
            lyGridDown : lyGridDown,//涓嬬Щ
            rowline : rowline,
            resultJSONData : jsonRequest,//杩斿洖鍒楄〃鐨勬墍鏈塲son鏁版嵁
            exportData:exportData,//瀵煎嚭鏁版嵁
            getColumn :getColumn,//鑾峰彇琛ㄥご
            getCurrentData:getCurrentData//鑾峰彇琛ㄦ牸鐨勫綋鍓嶉〉json鏁版嵁
        };
    });
})();
// 鍒╃敤js璁╁ご閮ㄤ笌鍐呭瀵瑰簲鍒楀搴︿竴鑷淬€�
var fixhead = function() {
    // 鑾峰彇琛ㄦ牸鐨勫搴�
    /*
     * $('#table_head').css('width',
     * $('.t_table').find('table:first').eq(0).width());
     */
    for ( var i = 0; i <= $('.t_table .pp-list.ftl tr:last').find('td:last').index(); i++) {
        $('.pp-list.ftl th').eq(i).css('width', ($('.t_table .pp-list.ftl tr:last').find('td').eq(i).width()) + 2);
    }
    /*
     * //褰撴湁妯悜婊氬姩鏉℃椂锛岄渶瑕佹js锛屾椂鍐呭婊氬姩澶撮儴涔熻兘婊氬姩銆� //鏆傛椂涓嶅鐞嗘í鍚� $('.t_table').scroll(function() {
     * $('#table_head').css('margin-left', -($('.t_table').scrollLeft())); });
     */
};
$(window).resize(function() {
    //fixhead();
});


function isPhone() {
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
}