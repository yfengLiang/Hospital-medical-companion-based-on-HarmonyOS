import request from './request'
export  interface return_login_type{
  token:string,
  userInfo:userInfo
}
export  interface userInfo{
  avatar:string,
  name:string
}
interface login_type{
  passWord:string,
  userName:string
}

//是普通暴露不是默认暴露 所以要用大括号的形式引入
export function login_submit(data:login_type){
  return request<return_login_type>({
    method:"post",
    url:'/login',
    data
  })
}