const app = getApp();
Page({
  data:{},
  onLoad:function(options){
    // 页面初始化 options为页面跳转所带来的参数
    var that = this;
    if (options.data){
      that.setData(JSON.parse(options.data));
    } else {
      var JSON_GOODS_ITEM = options.JSON_GOODS_ITEM;
      var CART_TYPE= options.CART_TYPE;
      var _data = {
        JSON_GOODS_ITEM:JSON_GOODS_ITEM,
        CART_TYPE:CART_TYPE,
        CLIENT_TOKEN:app.CLIENT_TOKEN()
      };
      app.requestAuthor('api/Cart/checkOutLists',_data,function(data){
        if (data.BRAND_CART) {
            data.BRAND_ARR = [];
            for(var brand in data.BRAND_CART){
                var brandBean={brand:brand,selected:true};
                data.BRAND_ARR.push(brandBean);
                var arr = data.BRAND_CART[brand];
                for(var i=0, cartItem;cartItem=arr[i++];){
                    data.BRAND_CART[brand][i-1].selected=true;
                }
            }
        }
        that.setData(data);
      });
      that.setData(_data);
    }
  },
  primary:function(){
    console.log(xxx);
  },
  // 去选址地址
  goChooseAddress:function(){
    var that = this;
    wx.navigateTo({ url: '../address/addressList?data='+JSON.stringify(that.data) });
  }
})