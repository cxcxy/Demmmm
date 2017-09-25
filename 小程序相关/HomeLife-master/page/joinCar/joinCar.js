Page({
  data:{
        borderSzie:'1',
        borderColor:'#dcdcdc'
      },
  clickColor:function(event){
      
      this.setData({
          borderSzie:"2",
          borderColor:'#000'
      })
  },
  ok: function() {
    wx.navigateTo({
      url: '../cars/cars'
    })
  }
})
