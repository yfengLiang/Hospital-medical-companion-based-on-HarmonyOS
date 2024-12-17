import axios, { AxiosResponse, InternalAxiosRequestConfig } from '@ohos/axios'

export interface option_type{
  method?:string,
  url:string,
  data?:object,
  params?:object,
  headers?:object
}
interface request_dataType{
  code:number,
  message?:string,
  data?:object|null
}
let request=axios.create({
  baseURL:"http://159.75.169.224:3321/v3pz",
  headers:{Terminal:"h5"}
})
request.interceptors.request.use(async(req:InternalAxiosRequestConfig)=>{
  req.headers['h-token']="16ca4a108858c856ef2444089b6ea06a"
  return req
})

function http(options:option_type){
  let method=options.method||"GET"
  if(method.toLowerCase()==="get"){
    options.params=options.data
  }
  return request(options)
}

export default async  function test<T>(options:option_type):Promise<T>{
  let result:AxiosResponse<request_dataType>=await http(options)
  let res=result.data
  let code=res.code
  console.log("输入obj请求：",JSON.stringify(res))

  if(code===10000){
    return res.data as T
  }else if(code===-2&&res.message==="token错误"){
    throw new Error(res.message)
  }else {
    throw new Error(res.message)

  }
}