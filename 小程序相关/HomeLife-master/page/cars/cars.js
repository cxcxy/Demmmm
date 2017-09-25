const app = getApp();
Page({
  data:{
    count:0,
    number:0,
    selectedAllStatus: false,
    minusStatuses: ['disabled', 'disabled', 'normal', 'normal', 'disabled'],
    carts: {},
  },
  onLoad:function(options){
    // 生命周期函数--监听页面加载
    var that = this;
    // 加载购物车商品
    app.requestAuthor('api/Cart/lists',{},function(data){
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
    })
  },
  onReady:function(){
    // 生命周期函数--监听页面初次渲染完成
    
  },
  onShow:function(){
    // 生命周期函数--监听页面显示
    
  },
  onHide:function(){
    // 生命周期函数--监听页面隐藏
    
  },
  onUnload:function(){
    // 生命周期函数--监听页面卸载
    
  },
  onPullDownRefresh: function() {
    // 页面相关事件处理函数--监听用户下拉动作
    
  },
  onReachBottom: function() {
    // 页面上拉触底事件的处理函数
    
  },
  onShareAppMessage: function() {
    // 用户点击右上角分享
    return {
      title: 'title', // 分享标题
      desc: 'desc', // 分享描述
      path: 'path' // 分享路径
    }
  },
    bindMinus: function(e) {
        var index = parseInt(e.currentTarget.dataset.index);

        var num = this.data.carts[index].num;

        if (num > 0) {
        num --;
        }
        var minusStatus = num <= 0 ? 'disabled' : 'normal';
        var carts = this.data.carts;
        carts[index].num = num;

        var minusStatuses = this.data.minusStatuses;
        minusStatuses[index] = minusStatus;

        this.setData({
        carts: carts,
        minusStatuses: minusStatuses
        });
    },
    bindPlus: function(e) {
        var index = parseInt(e.currentTarget.dataset.index);
        var num = this.data[index].num; 
        num ++;
        var minusStatus = num <= 1 ? 'disabled' : 'normal';
        var carts = this.data;
        carts[index].num = num;

        var minusStatuses = this.data.minusStatuses;
        minusStatuses[index] = minusStatus;

        this.setData({
        carts: carts,
        minusStatuses: minusStatuses
        });
    },
    bindCheckbox: function(e) {
        var data = e.currentTarget.dataset;
        var brand = data.brand;
        var index = data.index;
        var cartItem = this.data.BRAND_CART[brand][index]; 
        if(!cartItem.selected){
            this.setData({
                TOTAL_PRICE:this.data.TOTAL_PRICE + cartItem.TOTAL_PRICE,
                TOTAL_NUM:this.data.TOTAL_NUM + cartItem.GOODS_NUM,
            });
        }else{
            this.setData({
                TOTAL_PRICE:this.data.TOTAL_PRICE - cartItem.TOTAL_PRICE,
                TOTAL_NUM:this.data.TOTAL_NUM - cartItem.GOODS_NUM,
            });
        }
        this.data.BRAND_CART[brand][index].selected=!cartItem.selected;
        this.setData(this.data);
    },
    bindSelectAll: function(e) {
        var data = e.currentTarget.dataset;
        var brand = data.brand;
        var index = data.index;
        var brandItem = this.data.BRAND_ARR[index];
        var arr = this.data.BRAND_CART[brandItem.brand];
        if(!brandItem.selected){
            for(var i=0, cartItem;cartItem=arr[i++];){
                if (!cartItem.selected){
                    this.setData({
                        TOTAL_PRICE:this.data.TOTAL_PRICE + cartItem.TOTAL_PRICE,
                        TOTAL_NUM:this.data.TOTAL_NUM + cartItem.GOODS_NUM,
                    });
                }
                this.data.BRAND_CART[brand][i-1].selected=true;
            }
        } else {
            for(var i=0, cartItem;cartItem=arr[i++];){
                if (cartItem.selected){
                    this.setData({
                        TOTAL_PRICE:this.data.TOTAL_PRICE - cartItem.TOTAL_PRICE,
                        TOTAL_NUM:this.data.TOTAL_NUM - cartItem.GOODS_NUM,
                    });
                }
                this.data.BRAND_CART[brand][i-1].selected=false;
            }
        }
        brandItem.selected= !brandItem.selected;
        this.setData(this.data);
    },
    setPayment:function(){
        if(this.data.TOTAL_NUM){
            var cart = this.data.BRAND_CART;
            var JSON_GOODS_ITEM = [];
            for(var brand in cart){
                var arr = cart[brand];
                for(var i=0, cartItem;cartItem=arr[i++];){
                    if(cartItem.selected){
                        JSON_GOODS_ITEM.push(cartItem);
                    }
                }
            }
            wx.navigateTo({ url: '../pay/pay?JSON_GOODS_ITEM='+JSON.stringify(JSON_GOODS_ITEM)+"&CART_TYPE="+1});
        }
    }
})

