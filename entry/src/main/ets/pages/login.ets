import {login_submit} from "../api/api"
@Entry
@Component
struct login{
  //后台：http://159.75.169.224:3322/#/dashboard
  onPageShow(){
    login_submit({userName:"15767642951",passWord:"123456"}).then((data)=>{
      console.log("输入obj",JSON.stringify(data))
    })
  }
  build(){

  }
}