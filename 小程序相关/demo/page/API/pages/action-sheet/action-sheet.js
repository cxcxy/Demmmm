// Page({
//   actionSheetTap: function () {
//     wx.showActionSheet({
//       itemList: ['item1', 'item2', 'item3', 'item4'],
//       success: function (e) {
//         console.log(e.tapIndex)
//       }
//     })
//   }
// })
Page({
 actionSheetTap: function (){
  wx.showActionSheet({
    itemList: ['item11', 'item22', 'item33', 'item44'],
    itemColor: 'red',
    success: function(res) {
      console.log('adf ')
    },
    fail: function(res) {

    },
    complete: function(res) {}
    ,
  })
   
 }

})