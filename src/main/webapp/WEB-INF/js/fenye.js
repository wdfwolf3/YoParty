/**
 * Created by user on 2017/2/15.
 */
/**
 * 寮瑰眰鎺т欢閫夋嫨鎻掍欢
 * by sunwenxiu 2016/6/28
 */
(function (w, f) {
    'use strict';
    if (typeof define === 'function') {
        //  CMD
        define('areaSelect/1.0.0/areaSelect', ['iscroll/2.0.0/iscroll-lite'], function (require) {
            return f(w, require);
        });
    } else if (typeof exports === 'object') {
        //  CommonJS
        module.exports = f(w);
    } else {
        //  browser global
        window.Pagination = f(w);
    }
})(window, function (w, require) {
    'use strict';
    var defaultInfoObj = {
        container: $('.companysInfo-detail'),
        content: $('.tableInfo'),
        pageNumber: 3,
        firstPageBtn : '.firstPageBtn',
        lastPageBtn : '.lastPageBtn',
        nextPageBtn : '.nextPageBtn',
        prevPageBtn : '.prevPageBtn',
        pageBtn: '.currentpage'
    };
    var fragement = '<ul class="buttonlist clearfix">'
        + '<li class="firstPageBtn"><span>棣栭〉</span></li> '
        + '<li class="prevPageBtn"><span>涓婁竴椤�</span></li>'
        + ' <li class="currentpage"><span>1</span></li>'
        + ' <li class="nextPageBtn"><span>涓嬩竴椤�</span></li> '
        + '<li class="lastPageBtn"><span>灏鹃〉</span></li> '
        + '</ul>';
    function Pagination(infoObj) {
        for(var pro in infoObj) {
            defaultInfoObj[pro] = infoObj[pro];
        }
        this.infoObj = defaultInfoObj;
        this.fragment = fragement;
        this.infoObj.length = this.infoObj.content.length;
        this.currentPage = 1;
        this.countPage = Math.ceil(this.infoObj.length / this.infoObj.pageNumber);
    }
    Pagination.prototype.init = function () {
        var self = this;
        // 鎶婃枃娈典唬鐮佸姞杞藉埌container
        self.infoObj.container.find('ul.buttonlist').remove();
        self.infoObj.container.append($(this.fragment));
        // 娣诲姞瀵瑰簲鎸夐挳鐨勭偣鍑讳簨浠�
        $(self.infoObj.firstPageBtn).on('click',function () {
            var $ele = self.infoObj.content.eq(self.infoObj.pageNumber - 1);
            $ele.show();
            $ele.nextAll('.tableInfo').hide();
            $ele.prevAll('.tableInfo').show();
            self.currentPage = 1;
            $(self.infoObj.pageBtn).text(self.currentPage);
        });
        $(self.infoObj.lastPageBtn).on('click',function () {
            var tail = self.infoObj.length % self.infoObj.pageNumber;
            var $ele;
            if(tail) {
                $ele = self.infoObj.content.eq(self.infoObj.length - tail);
            } else {
                $ele = self.infoObj.content.eq(self.infoObj.length - self.infoObj.pageNumber);
            }
            $ele.show();
            $ele.nextAll('.tableInfo').show();
            $ele.prevAll('.tableInfo').hide();
            self.currentPage = self.countPage;
            $(self.infoObj.pageBtn).text(self.currentPage);
        });
        $(self.infoObj.nextPageBtn).on('click',function () {
            self.currentPage ++;
            if(self.currentPage > self.countPage) {
                self.currentPage = 1;
            }
            $(self.infoObj.pageBtn).text(self.currentPage);
            var temp = self.infoObj.pageNumber * self.currentPage;
            self.infoObj.content.hide();
            self.infoObj.content.each(function (index,ele) {
                if(index >= temp - self.infoObj.pageNumber && index <= temp - 1) {
                    $(this).show();
                }
            });
        });
        $(self.infoObj.prevPageBtn).on('click',function () {
            self.currentPage --;
            if(self.currentPage <= 0) {
                self.currentPage = self.countPage;
            }
            $(self.infoObj.pageBtn).text(self.currentPage);
            var temp = self.infoObj.pageNumber * self.currentPage;
            self.infoObj.content.hide();
            self.infoObj.content.each(function (index,ele) {
                if(index >= temp - self.infoObj.pageNumber && index <= temp - 1) {
                    $(this).show();
                }
            });
        });

    };
    return Pagination;
});
