
// 获取全局应用程序实例对象
const app = getApp();

Page({
  data:{
  },
  onLoad:function(options){
    var that = this;
    app.request('api/goods_base_info',{GOODS_ID:options.GOODS_ID,REQ_TYPE:"03"},function(date){
      that.setData({date});
    });
  }
})
