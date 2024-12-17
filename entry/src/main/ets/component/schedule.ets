@Entry
@Component
export  default  struct schedule{
  @Prop typeIndex:number=4
  typeList:Array<string>=["填写订单","在线支付","专人服务","服务完成"]
  typeWidth:Array<number>=[15,35,65,100]
  build() {
    Column(){
      Row(){
        if(this.typeIndex>=this.typeList.length||this.typeIndex<0){
          Text().borderRadius(20).width("100%").backgroundColor("#999").height("100%")
        }else {
          Text().backgroundImageSize({width:"100%"}).borderRadius(2).width(this.typeWidth[this.typeIndex]+"%").height("100%").backgroundImage('data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAyAAAAABCAIAAACpCl0xAAAABGdBTUEAAK/INwWK6QAAABl0RVh0U29mdHdhcmUAQWRvYmUgSW1hZ2VSZWFkeXHJZTwAAAHrSURBVHjadFVBcgMxCEP3Prtv6vfUrI1A2JvMtJPYGIQQgJ+/X0YgPh+uv/V1nTCI9ZORJthGaVyWrFehU9qX/cvP9d+d9Ieyf4uVqMxPRpf/jfm5SRs+vsxVzOd19Yq8gbmZrnaUJueJtrBjPHd+klJ3aNSRA8uAF0o8rnJg1ihOTizZ5tKeJttN7AHvKNYNu3jAWeJWyMVJKJ2T/9e4h+dR4vPJi4eLik2Rp4uhZOabjTNLK1IhreUzp8MFB8Mj06YaSwxU0Z8LsYQkVDfLmNWe1ZhWTHwcwcCYp0MNb9pbqt0pmkyWu4aBBdy0yLNXXorl6nbGfdqEpQydLz4oTm7N4xgFEXkUUhst68VhkpTw6YKpFnB+8CrLcZ6xNnMFuSLegU51Cm/pBkbOaLpVSND4FgbUcCihz5Igrh68dSL9LoaiNIxWqJ17W4XNjcLcspF2JbMYhLSQtvjwOmu6UZl9wtUEPX811zn1CGt1Sxv3KknFbZcZBTWqsqjDLHAkqx66V0mSUOqh2kmnsHL4oCHjy3iTWrLv1bYs1bF7xJpq20Snfw4T06EG+15qFJ3FftQIDMYlqeRjLC8czUWtbFiXsReJ+FVKYcSf67sHQl/5KGkaplpt/aiWyeK39WS2tJWL6CmUMv8XYABQPZBxCZSO0gAAAABJRU5ErkJggg==',ImageRepeat.Y)
        }
      }.padding(2).width("100%").height(15).backgroundColor(Color.White).borderRadius(20)
      Flex({justifyContent:FlexAlign.SpaceBetween}){
        ForEach(this.typeList,(item:string,index)=>{
          Text(item).opacity(this.typeIndex===index?1:0.7).fontColor(Color.White).fontSize(15).fontWeight(FontWeight.Bold)
        })
      }.padding(15)
    }.padding({top:"10%",left:10,right:10}).width("100%").height(120).backgroundImageSize({width:"100%"}).backgroundImage('data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAyAAAAABCAIAAACpCl0xAAAABGdBTUEAAK/INwWK6QAAABl0RVh0U29mdHdhcmUAQWRvYmUgSW1hZ2VSZWFkeXHJZTwAAAHrSURBVHjadFVBcgMxCEP3Prtv6vfUrI1A2JvMtJPYGIQQgJ+/X0YgPh+uv/V1nTCI9ZORJthGaVyWrFehU9qX/cvP9d+d9Ieyf4uVqMxPRpf/jfm5SRs+vsxVzOd19Yq8gbmZrnaUJueJtrBjPHd+klJ3aNSRA8uAF0o8rnJg1ihOTizZ5tKeJttN7AHvKNYNu3jAWeJWyMVJKJ2T/9e4h+dR4vPJi4eLik2Rp4uhZOabjTNLK1IhreUzp8MFB8Mj06YaSwxU0Z8LsYQkVDfLmNWe1ZhWTHwcwcCYp0MNb9pbqt0pmkyWu4aBBdy0yLNXXorl6nbGfdqEpQydLz4oTm7N4xgFEXkUUhst68VhkpTw6YKpFnB+8CrLcZ6xNnMFuSLegU51Cm/pBkbOaLpVSND4FgbUcCihz5Igrh68dSL9LoaiNIxWqJ17W4XNjcLcspF2JbMYhLSQtvjwOmu6UZl9wtUEPX811zn1CGt1Sxv3KknFbZcZBTWqsqjDLHAkqx66V0mSUOqh2kmnsHL4oCHjy3iTWrLv1bYs1bF7xJpq20Snfw4T06EG+15qFJ3FftQIDMYlqeRjLC8czUWtbFiXsReJ+FVKYcSf67sHQl/5KGkaplpt/aiWyeK39WS2tJWL6CmUMv8XYABQPZBxCZSO0gAAAABJRU5ErkJggg==',ImageRepeat.Y)
  }
}