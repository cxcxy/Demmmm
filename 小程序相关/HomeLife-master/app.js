var util = require('util.js')
App({
    onLaunch:function(){
        var that = this;
        wx.login({
        success: function(res) {
            if (res.code) {
                //发起网络请求
                that.request('api/xcx/onLogin',{code: res.code},function(openId){
wx.setStorageSync('openId', openId);
    that.request('api/login_weixin',{OPEN_ID:openId,CLIENT_TOKEN:that.CLIENT_TOKEN()},function(data){
wx.setStorageSync('userInfo', data);
      });
                });
            } else {
                console.log('获取用户登录态失败！' + res.errMsg)
            }
        }
        });
    },
    request : function(url,dataJSON,successFun){
        util.request(url, dataJSON, successFun);
    },
    requestAuthor : function(url, dataJSON, successFun){
        var that = this;
        if (that.noLogin()){
           that.goLogin(); 
        }
        var userInfo = wx.getStorageSync('userInfo');
        dataJSON = dataJSON||{};
        dataJSON.TOKEN = userInfo.TOKEN;
        dataJSON.USERNAME = userInfo.USERNAME;
        that.request(url,dataJSON,successFun);
    },
    globalData:{
        openId:wx.getStorageSync('openId'),
        userInfo:wx.getStorageSync('userInfo')
    },
    noLogin:function(){
        return !wx.getStorageSync('userInfo');
    },
    goLogin:function(){
        wx.redirectTo({url: '../login/login'});
    },
    CLIENT_TOKEN: util.uuid
})