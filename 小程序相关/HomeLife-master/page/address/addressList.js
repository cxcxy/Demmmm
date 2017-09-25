const app  = getApp();
Page({
  data:{},
  onLoad:function(options){
    var that = this;
    that.setData(options);
    app.requestAuthor('api/getMemberAddresslist',{IS_DEFAULT:0}, function(data){
      that.setData({ADDRESS_LIST:data});
    });
  },
  chooseAddressToOrder:function(e){
    // 当前选中的地址传递回去
    var _data = JSON.parse(this.data.data);
    _data.ADDRESS= this.data.ADDRESS_LIST[e.currentTarget.dataset.index];
    if(_data.CART_TYPE){
      wx.redirectTo({url: '../pay/pay?data='+ JSON.stringify(_data) });
    }
  },
  addAddress:function(){
    wx.navigateTo({
      url: '../address/edit'
    });
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
  }
})