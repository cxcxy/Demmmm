function formatTime(date) {
  var year = date.getFullYear()
  var month = date.getMonth() + 1
  var day = date.getDate()

  var hour = date.getHours()
  var minute = date.getMinutes()
  var second = date.getSeconds()


  return [year, month, day].map(formatNumber).join('/') + ' ' + [hour, minute, second].map(formatNumber).join(':')
}

function formatNumber(n) {
  n = n.toString()
  return n[1] ? n : '0' + n
}

function json2Form(json) {  
    var str = [];  
    for(var p in json){  
        str.push(encodeURIComponent(p) + "=" + encodeURIComponent(json[p]));  
    }  
    return str.join("&");  
}
function request(url,dataJSON,successFun){
        
        dataJSON = dataJSON||{};
        dataJSON.REQ_TYPE='03'
        wx.request({
            url: 'https://wx.mum-in-chief.com/'+url+'.wx-xcx',
            data: json2Form(dataJSON),
            header: {  
                "Content-Type": "application/x-www-form-urlencoded"  
            },
            method: 'POST',
            success: function(res){
                var result = res.data;
                if ( result.resp_code=='200') {
                    successFun(result.result);
                } else if (result.resp_code == '403'){
                    wx.showToast({
                        title: '请绑定电话号码',
                        icon: 'success',
                        duration: 2000
                    });
                    wx.setStorageSync('userInfo',true);
                    // wx.redirectTo({
                    //     url: '../login/login'
                    // });
                } else if ( res.resp_code == '500') {
                    wx.showModal({
                        title: '警告',
                        content: result.resp_msg,
                        success: function(res) {
                            if (res.confirm) {
                            console.log('用户点击确定')
                            }
                        }
                    });
                }
            },
            fail: function() {
                // fail
            },
            complete: function() {
                // complete
            }
        });
    }
function getUuid(){
  var len=32;//32长度
  var radix=16;//16进制
  var chars='0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz'.split('');var uuid=[],i;radix=radix||chars.length;if(len){for(i=0;i<len;i++)uuid[i]=chars[0|Math.random()*radix];}else{var r;uuid[8]=uuid[13]=uuid[18]=uuid[23]='-';uuid[14]='4';for(i=0;i<36;i++){if(!uuid[i]){r=0|Math.random()*16;uuid[i]=chars[(i==19)?(r&0x3)|0x8:r];}}}
  return uuid.join('');
}

module.exports = {
  formatTime: formatTime,
  request:request,
  uuid:getUuid
}
