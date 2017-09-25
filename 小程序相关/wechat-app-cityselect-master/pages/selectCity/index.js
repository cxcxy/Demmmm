var $v = require('../../utils/validate.js');
var $citys = require('../../utils/citys.js');
var cityData = $citys.data;
var app = getApp();

var provinces = [];
var citys = [];
var countys = [];
const date = new Date()
const years = []
const months = []
const days = []
const hours = []

//城市
for (let i = 0; i < cityData.length; i++) {
    provinces.push(cityData[i].name);
}

for (let i = 0; i < cityData[0].sub.length; i++) {
    citys.push(cityData[0].sub[i].name)
}

for (let i = 0; i < cityData[0].sub[0].sub.length; i++) {
    countys.push(cityData[0].sub[0].sub[i].name)
}

//时间日期
for (let i = 1920; i <= date.getFullYear(); i++) {
    years.push(i)
}

for (let i = 1; i <= 12; i++) {
    var j = i;
    if( j < 10){
        j = "0" + String(j);
    }
    months.push(j)
}

for (let i = 1; i <= 31; i++) {
    var j = i;
    if (j < 10) {
        j = "0" + String(j);
    }
    days.push(j)
}

for (let i = 1; i <= 60; i++) {
    var j = i;
    if (j < 10) {
        j = "0" + String(j);
    }
    hours.push(j)
}


Page({

    /**
     * 页面的初始数据
     */
    data: {var y = 1980, m = 1, d = 1, h = 0, i = 0, dateTime = null, sex = 0, photoList = [], provinceName = cityData[0].name, cityName = cityData[0].sub[0].name, countyName = cityData[0].sub[0].sub[0].name, address = cityData[0].name + ' ' + cityData[0].sub[0].name + ' ' + cityData[0].sub[0].sub[0].name;

        provinces: provinces,
        citys: citys,
        countys: countys,
        cityValue: [0,0,0],
        years: years,
        months: months,
        days: days,
        hours: hours,
        dateValue:[60,0,0,0,0],
        dateText:'请选择阳历生日',
        sexText:'请选择性别',
        cityText:'请选择出生地',
        isDate: true,
        isCity: true,
        isTip: false,
        isBtn: false,
        photoList: [],
    },

    /**
     * 生命周期函数--监听页面加载
     */
    onLoad: function (options) {
       
    },

    /**
     * 生命周期函数--监听页面初次渲染完成
     */
    onReady: function () {
    
    },

    /**
     * 生命周期函数--监听页面显示
     */
    onShow: function () {
    
    },

    /**
     * 生命周期函数--监听页面隐藏
     */
    onHide: function () {
        sex = 0;
        photoList = [];
    },

    /**
     * 生命周期函数--监听页面卸载
     */
    onUnload: function () {
        sex = 0;
        photoList = [];
    },




   
    //调起选择器
    risePicker: function(e){
        var that = this;
        var $mold = e.currentTarget.dataset.mold;
        if($mold == 'dateTime'){
            that.setData({
                isDate: false
            })
        }
        if($mold == 'city'){
            that.setData({
                isCity: false
            })
        }
        
    },
  
    //城市选择器
    cityChange: function (e) {
        console.log('改变' + e);
        var val = e.detail.value
        var t = this.data.cityValue;
        address = '';
        if (val[0] != t[0]) {
            citys = [];
            countys = [];
            for (let i = 0; i < cityData[val[0]].sub.length; i++) {
                citys.push(cityData[val[0]].sub[i].name)
            }
            for (let i = 0; i < cityData[val[0]].sub[0].sub.length; i++) {
                countys.push(cityData[val[0]].sub[0].sub[i].name)
            }

            this.setData({
                citys: citys,
                countys: countys,
                cityValue: [val[0], 0, 0]
            })
            provinceName = cityData[val[0]].name;
            cityName = cityData[val[0]].sub[0].name;
            countyName = cityData[val[0]].sub[0].sub[0].name;
            address += cityData[val[0]].name + " " + cityData[val[0]].sub[0].name + " " + cityData[val[0]].sub[0].sub[0].name; 
            return;
        }
        if (val[1] != t[1]) {
            countys = [];
            for (let i = 0; i < cityData[val[0]].sub[val[1]].sub.length; i++) {
                countys.push(cityData[val[0]].sub[val[1]].sub[i].name)
            }
            this.setData({
                countys: countys,
                cityValue: [val[0], val[1], 0]
            })
            cityName = cityData[val[0]].sub[val[1]].name;
            countyName = cityData[val[0]].sub[val[1]].sub[0].name;
            address += cityData[val[0]].name + " " + cityData[val[0]].sub[val[1]].name + " " + cityData[val[0]].sub[val[1]].sub[0].name; 
            return;
        }
        if (val[2] != t[2]) {
            this.setData({
                county: this.data.countys[val[2]],
                cityValue: val
            })
            countyName = cityData[val[0]].sub[val[1]].sub[val[2]].name;
            address += cityData[val[0]].name + " " + cityData[val[0]].sub[val[1]].name + " " + cityData[val[0]].sub[val[1]].sub[val[2]].name;
            return;
        }
        

    },

    //确定选择
    ideChoice: function(e){
        var that = this;
        var $act = e.currentTarget.dataset.act;
        var $mold = e.currentTarget.dataset.mold;

        //时间日期
        if ($act == 'confirm' && $mold == 'dateTime'){
            dateTime = y + '-' + m + '-' + d + ' ' + h + ':' + i;
            that.setData({
                dateText: dateTime,
                
            })
        }
        //城市
        if ($act == 'confirm' && $mold == 'city') {
            that.setData({
                cityText: provinceName + ' ' + cityName + ' ' + countyName,
            })
        }
        that.setData({
            isCity:true,
            isDate: true
        })
    }




})