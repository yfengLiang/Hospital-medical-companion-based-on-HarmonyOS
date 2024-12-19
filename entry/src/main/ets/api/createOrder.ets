import request from './request'
export  interface companion{
  age:number
  id:number
  mobile:string
  name:string
}
export  interface companion_hospitals{
  service_id:number
  id:number
  name:string
  service_price:string
}
export  interface service{
  serviceImg:string
  serviceName:string
}
export  interface return_companion_type{
  companion:Array<companion>,
  hospitals:Array<companion_hospitals>
  service:service
}

export function getCompanion(){
  return request<return_companion_type>({
    url:"/h5/companion",
    method:"get"
  })
}

export  interface  createOrder_type{
  hospital_name:string,
  starttime:number
  receiveAddress:string
  tel:string
  demand:string
  hospital_id:number
  companion_id:number
}
export interface return_createOrder_type {
  wx_code: string
}
export  function addOrder(data:createOrder_type){
  return request<return_createOrder_type>({
    url:"/createOrder",
    method:"post",
    data
  })
}