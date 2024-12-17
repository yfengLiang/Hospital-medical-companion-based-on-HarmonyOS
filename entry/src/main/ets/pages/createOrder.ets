import schedule from  '../component/schedule'
import {getCompanion,return_companion_type} from '../api/api'
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
  TextDialogController: CustomDialogController | null = new CustomDialogController({
    builder: CustomDialogExample({
      confirm: ()=> { }
    }),
  })
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
openDialog(name:string){
  console.log('777',name)
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
      Button("提交订单",{type:ButtonType.Normal}).borderRadius(5).width("100%").margin({top:10})
        .onClick(()=>{})
    }.backgroundColor("#f0f0f0").height("100%").alignItems(HorizontalAlign.Start)
  }
}

@CustomDialog
struct CustomDialogExample {
  controller?: CustomDialogController
  confirm: () => void = () => {
  }
  select:number=0
  range:string[]=['123','456']
  type_title:string="hospital_name"
  getTitle(){
    return this.type_title==="hospital_name"?'请选择医院':'请选择陪诊师'
  }
  build() {
    Column() {
      Text(this.getTitle()).fontSize(15).fontWeight(FontWeight.Bold).margin(10)
        .width("100%").border({width:{bottom:1}}).textAlign(TextAlign.Center)
        .padding({bottom:5}).borderColor('#999')
      Flex({justifyContent:FlexAlign.SpaceBetween}){
        Button("确认选择",{type:ButtonType.Normal}).borderRadius(5).backgroundColor(Color.Blue)
          .onClick(()=>{
            this.confirm()
          })
        Button("取消",{type:ButtonType.Normal}).borderRadius(5).backgroundColor(Color.Red)
          .onClick(()=>{
            this.controller?.close()
          })
      }.padding(10)
      TextPicker({ range:this.range,selected:this.select })
        .onChange((value: string | string[], index: number | number[]) => {
        }).canLoop(false).width("70%")
    }
  }
}
