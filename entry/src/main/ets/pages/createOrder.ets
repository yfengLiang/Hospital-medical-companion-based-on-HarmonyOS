import schedule from  '../component/schedule'
import {getCompanion,return_companion_type,addOrder} from '../api/api'
import {CustomDialogExample,CustomDialogData} from  '../component/dialogs'
interface obj_list{
  hospital_name:string,
  time:string
  companion_name:string
  receiveAddress:string
  tel:string,
}
interface form_list_type{
  hospital_name:string,
  starttime:number|undefined
  companion_name:string
  receiveAddress:string
  tel:string
  demand:string
  hospital_id:number|undefined
  companion_id:number|undefined
  time:string
}
@Entry//这个装饰器可以在预览器看效果 所以组件中可以去掉
@Component
struct createOrder {
  @State orderData:return_companion_type|undefined=undefined
  @State rangeList:Array<Array<string|number>>=[]
  @State text_dialog_type:string="hospital_name"
  @State form_list:form_list_type={
    hospital_name:"请选择医院",
    hospital_id:undefined,
    starttime:undefined,
    time:"请选择就诊时间",
    companion_name:"请选择陪诊师",
    companion_id:undefined,
    receiveAddress:"请填写就诊人地址",
    tel:"请填写您的联系方式",
    demand:"请简单描述你要就诊的科室"
  }
  list:obj_list={
    hospital_name:"就诊医院",
    time:"就诊时间",
    companion_name:"陪诊师",
    receiveAddress:"接送地址",
    tel:"联系电话",
  }
  TextDialogController: CustomDialogController | null = new CustomDialogController({
    builder: CustomDialogExample({
      confirm: (data:Array<string|number>)=> { this.textConfirmData(data) },
      type_title:this.text_dialog_type,
      rangeList:this.rangeList
    }),
    offset:{dx:0,dy:210}
  })
  DataDialogController: CustomDialogController | null = new CustomDialogController({
    builder: CustomDialogData({
      confirm: (time:Date)=> {  this.dateConfirmData(time)},
    }),
    offset:{dx:0,dy:210}
  })
  @State ruleTip:boolean=false
  textConfirmData(data:Array<string|number>){
    if(this.text_dialog_type==="hospital_name"){
      this.form_list.hospital_name=data[0] as string
      this.form_list.hospital_id=data[1] as number
      this.TextDialogController?.close()
    }else{
        this.form_list.companion_name=data[0] as string
        this.form_list.companion_id=data[1] as number
        this.TextDialogController?.close()
    }

  }
  formatDate(time:Date){
    const year=time.getFullYear().toString()
    //月份返回的是从0开始的 所以要+1
    const month=(time.getMonth()+1).toString().padStart(2,"0")
    const date=time.getDate().toString()
    return `${year}-${month}-${date}`
  }
  dateConfirmData(time:Date){
    this.form_list.time=this.formatDate(time)
    this.form_list.starttime=time.getTime()
    this.DataDialogController?.close()
  }
submit(){
    let itemArr=["hospital_id","companion_id","starttime","demand","hospital_name","receiveAddress","tel"]
for(const element of itemArr){
  if(!Reflect.get(this.form_list,element)){
    this.ruleTip=true
    return
  }
}
  addOrder({
    hospital_name:this.form_list.hospital_name,
    starttime:this.form_list.starttime as number,
    receiveAddress:this.form_list.receiveAddress,
    tel:this.form_list.tel,
    demand:this.form_list.demand,
    hospital_id:this.form_list.hospital_id as number,
    companion_id:this.form_list.companion_id as number,
  })
}
openDialog(name:string){
  if(name==="hospital_name"){
    this.text_dialog_type="hospital_name"
    this.rangeList=this.orderData?.hospitals.map((item)=>{
      return [item.name,item.id]
    })||[]
    console.log('666',this.rangeList)
    this.TextDialogController?.open()
  }else if(name==="companion_name") {
    this.text_dialog_type = "companion_name"
    this.rangeList = this.orderData?.companion.map((item) => {
      return [item.name, item.id]
    }) || []
    this.TextDialogController?.open()
  }else if(name==="time"){
    this.DataDialogController?.open()
  }
}
  onPageShow(): void {
    getCompanion().then(data=>{
      this.orderData=data
    })
  }

  build() {
    Column(){
      schedule({typeIndex:0})
      Flex({justifyContent:FlexAlign.SpaceBetween,alignItems:ItemAlign.Center}){
        Row(){
          Image(this.orderData?.service.serviceImg).width(25).margin({right:10})
          Text(this.orderData?.service.serviceName).fontSize(13)
        }
        Text("服务内容").fontSize(13).fontColor("#969799")
      }.backgroundColor(Color.White).margin(5).padding(15)
      ForEach(Object.keys(this.list),(item:string)=>{
        Flex({justifyContent:FlexAlign.SpaceBetween,alignItems:ItemAlign.Center}){
          Text(Reflect.get(this.list,item) as string).fontSize(13)
          if(item==="receiveAddress"||item==="tel"){
            TextInput({placeholder:Reflect.get(this.form_list,item)}).placeholderFont({size:13})
              .backgroundColor(Color.White)
              .fontSize(13).fontColor("#969799").width("60%").textAlign(TextAlign.End).padding(0).borderRadius(0)
              .onChange((value:string)=>{
                Reflect.set(this.form_list,item,value)
                console.log('666',JSON.stringify(this.form_list))
              })
          }else {
            Text(Reflect.get(this.form_list,item) as string +' > ').fontSize(13).fontColor("#969799")
              .onClick(()=>{
                this.openDialog(item)
              })
          }

        }.margin({left:5,right:5})
        .backgroundColor(Color.White).padding(15).border({width:{bottom:1},color:"#f0f0f0"})
      })
      Text("服务需求").margin(5).fontSize(15).fontColor("#969799")
      TextArea({placeholder:this.form_list.demand}).borderRadius(0).backgroundColor(Color.White)
        .margin(5).placeholderFont({size:13}).padding(5).fontColor("#969799").fontSize(13).height(100)
        .onChange(value=>{
          this.form_list.demand=value
        })
      if(this.ruleTip){
        Text('请确认表单数据都已填写完毕！').fontColor(Color.Red).margin(5).fontSize(13)
      }
      Button("提交订单",{type:ButtonType.Normal}).borderRadius(5).width("100%").margin({top:10})
        .onClick(()=>{})
    }.backgroundColor("#f0f0f0").height("100%").alignItems(HorizontalAlign.Start)
  }
}

