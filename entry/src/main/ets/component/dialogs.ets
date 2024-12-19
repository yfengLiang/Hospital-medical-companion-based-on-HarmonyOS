@CustomDialog
export  struct CustomDialogExample {
  controller?: CustomDialogController
  confirm: (data:Array<string|number>) => void = () => {
  }
  select:number=0
  // rangeList需要接受一个类似[[name,0]]的数组
  rangeList:Array<Array<string|number>>=[]
  range:string[]=['123','456']
  type_title:string="hospital_name"
  @State selectData:Array<string|number>=[]
  getTitle(){
    return this.type_title==="hospital_name"?'请选择医院':'请选择陪诊师'
  }
  aboutToAppear(): void {
    this.range=this.rangeList.map(item=>{
      return item[0] as string
    })
    this.selectData=this.rangeList[this.select]
  }
  build() {
    Column() {
      Text(this.getTitle()).fontSize(15).fontWeight(FontWeight.Bold).margin(10)
        .width("100%").border({width:{bottom:1}}).textAlign(TextAlign.Center)
        .padding({bottom:5}).borderColor('#999')
      Flex({justifyContent:FlexAlign.SpaceBetween}){
        Button("确认选择",{type:ButtonType.Normal}).borderRadius(5).backgroundColor(Color.Blue)
          .onClick(()=>{
            if(this.range.length===0){
              this.controller?.close()
            }else {
              this.confirm(this.selectData)
            }
          })
        Button("取消",{type:ButtonType.Normal}).borderRadius(5).backgroundColor(Color.Red)
          .onClick(()=>{
            this.controller?.close()
          })
      }.padding(10)
      TextPicker({ range:this.range,selected:this.select })
        .onChange((value: string | string[], index: number | number[]) => {
          console.log('66')
          this.selectData=this.rangeList[index as number]
        }).canLoop(this.range.length>3?true:false).width("70%")
      if(this.range.length===0){
        Text("暂无数据").fontSize(20).margin(50)
      }
    }
  }
}

@CustomDialog
export  struct CustomDialogData{
  controller?: CustomDialogController
  confirm: (time:Date) => void = () => {
  }
timer:Date=new Date(new Date().setDate(new Date().getDate()+1))
  @State selectTime:Date=this.timer
  build() {
    Column() {
      Text("请选择就诊时间").fontSize(15).fontWeight(FontWeight.Bold).margin(10)
        .width("100%").border({width:{bottom:1}}).textAlign(TextAlign.Center)
        .padding({bottom:5}).borderColor('#999')
      Flex({justifyContent:FlexAlign.SpaceBetween}){
        Button("确认选择",{type:ButtonType.Normal}).borderRadius(5).backgroundColor(Color.Blue)
          .onClick(()=>{
            this.confirm(this.selectTime)
          })
        Button("取消",{type:ButtonType.Normal}).borderRadius(5).backgroundColor(Color.Red)
          .onClick(()=>{
            this.controller?.close()
          })
      }.padding(10)
      DatePicker({
        start:this.timer,
        selected:this.timer
      }).onDateChange((value)=>{
        this.selectTime=value
      })
    }
  }
}
