// page/goodsList/goodsList.js

// 获取全局应用程序实例对象
const app = getApp();

Page({
  data:{
    goods: null,
    
    maskDisplay: 'none',
    slideHeight: 0,
    slideRight: 0,
    slideWidth: 0,
    slideDisplay: 'block',
    screenHeight: 0,
    screenWidth: 0,
    slideAnimation: {},

    ballBottom: 20,
    ballRight: 30,
    ballOpacity: '.8',
    modalMsgHidden: true,
    themeId:0,//当前主题id
  },
  onLoad:function(options){
    var that = this;
    
    app.request('api/goods_list',{},function(data){
      that.setData({goods: data});
    });
    app.request('api/goods_type_list',{},function(data){
      that.setData({goods_list: data});
    });

    wx.getSystemInfo( {
      success: function( res ) {

        that.setData( {
          screenHeight: res.windowHeight,
          screenWidth: res.windowWidth,
          slideHeight: res.windowHeight,
          slideRight: res.windowWidth,
          slideWidth: res.windowWidth * 0.7
        });
      }
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
  },

  //浮动球点击 侧栏展开
  ballClickEvent: function() {
    slideUp.call( this );
  },

  //遮罩点击  侧栏关闭
  slideCloseEvent: function() {
    slideDown.call( this );
  },

  authorShowEvent: function() {
    this.setData({modalMsgHidden: false});
  },

  modalMsgHiddenEvent: function() {
    this.setData({modalMsgHidden: true});
  },

  onPullDownRefreash: function( e ) {
    console.log( 1 );
  }
})

//侧栏展开
function slideUp() {
  var animation = wx.createAnimation( {
    duration: 600
  });
  this.setData( { maskDisplay: 'block' });
  animation.translateX( '100%' ).step();
  this.setData( {
    slideAnimation: animation.export()
  });
}

//侧栏关闭
function slideDown() {
  var animation = wx.createAnimation( {
    duration: 800
  });
  animation.translateX( '-100%' ).step();
  this.setData( {
    slideAnimation: animation.export()
  });
  this.setData( { maskDisplay: 'none' });
}
