// page/me/me.js
const app = getApp();
Page({
  data:{
    imgSrc:"../../resources/mePhoto.jpg"
  },
  onLoad:function(options){
    // 用openid 去登录试试，看有没有对应的用户
    
    // 页面初始化 options为页面跳转所带来的参数
    // if(!wx.getStorageSync('userInfo')){
    //   wx.showToast({
    //     title: '请绑定电话号码',
    //     icon: 'success',
    //     duration: 2000
    //   });
    //   wx.redirectTo({
    //    url: '../login/login',success:function(e){
    //      console.log(e);
    //   },fail:function(e){

    //   }
    //   });
    // }
  },
  onReady:function(){
    // 页面渲染完成
  },
  onShow:function(){
    // 页面显示
  },
  onHide:function(){
    // 页面隐藏
  },
  onUnload:function(){
    // 页面关闭
  },

  //自定义
})