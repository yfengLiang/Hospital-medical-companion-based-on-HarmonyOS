import { getHomeData,return_home_type,slides,nav2s, hospitals } from "../api/home"

@Component
export default  struct home {
  @State homeData:return_home_type|null=null
  aboutToAppear() {
    getHomeData().then(data=>{
      this.homeData=data
    })
  }
  build() {
    Scroll(){
      Column(){
        Flex({justifyContent:FlexAlign.SpaceBetween,alignItems:ItemAlign.Center}){
          Text("中部地区 >").fontSize(20).fontWeight(FontWeight.Bold).fontColor("#666666")
          Search({placeholder:"请输入医院……"}).width('70%')
        }.padding({left:10,right:10})

        Swiper(){
          ForEach(this.homeData?.slides,(item:slides)=>{
            Image(item.pic_image_url).width('100%').padding(5).borderRadius(5)
          })
        }.autoPlay(true).loop(true)

        Flex(){
          ForEach(this.homeData?.nav2s,(item:nav2s)=>{
            Image(item.pic_image_url).margin({left:5,right:5})
          })
        }

        ForEach(this.homeData?.hospitals,(item:hospitals)=>{
          Flex({justifyContent:FlexAlign.SpaceBetween}){
            Image(item.avatar_url).width("30%").borderRadius(5)
            Column(){
              Text(item.name).fontSize(20).fontWeight(FontWeight.Bold)
              Row(){
                Text(item.rank).margin({right:5}).fontColor("#0ca7ac").fontWeight(FontWeight.Bold)
                Text(item.label).fontColor("#0ca7ac").fontWeight(FontWeight.Bold)
              }
              Text(item.intro).fontSize(13).fontColor("#999999").lineHeight(15)
            }.alignItems(HorizontalAlign.Start).width('70%').margin( {left:5})
          }.margin(5).padding(10).borderRadius(3).shadow({offsetX:0,offsetY:1,radius:6,color:'#66000000'})
        })
      }.alignItems(HorizontalAlign.Start)
    }
    }

}