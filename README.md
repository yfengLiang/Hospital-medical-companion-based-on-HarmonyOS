基于鸿蒙开发的医院问诊app
b站教程提供的后台：http://159.75.169.224:3322/#/dashboard

接口对应的返回数据：
http://159.75.169.224:3321/v3pz/h5/companion
```
{
"code": 10000,
"message": "success",
"data": {
"companion": [],
"hospitals": [
{
"id": 1,
"name": "湘雅分院",
"service_id": 1,
"service_price": "0.5"
},
{
"id": 2,
"name": "中医药大学",
"service_id": 1,
"service_price": "0.5"
},
{
"id": 3,
"name": "株洲市三医院",
"service_id": 1,
"service_price": "0.5"
},
{
"id": 4,
"name": "协和医院",
"service_id": 1,
"service_price": "0.5"
},
{
"id": 5,
"name": "武汉中心医院",
"service_id": 1,
"service_price": "0.5"
}
],
"service": {
"serviceName": "就医陪诊（尊享）",
"serviceImg": "http://159.75.169.224/uploads/20231105/90ded71dd1868829b08dae540412c039.jpeg"
}
}
}
```
接口对应的返回数据：
http://159.75.169.224:3321/v3pz/Index/index
```
{
    "code": 10000,
    "message": "success",
    "data": {
        "now": 1700986256,
        "slides": [
            {
                "id": 2,
                "stype": "0",
                "stype_link": "",
                "title": "banner02",
                "stype_text": "Stype 0",
                "pic_image_url": "http://159.75.169.224/uploads/20231105/80221cd6111536ab328cda2ea0eef452.jpg"
            },
            {
                "id": 1,
                "stype": "0",
                "stype_link": "",
                "title": "banner01",
                "stype_text": "Stype 0",
                "pic_image_url": "http://159.75.169.224/uploads/20231105/6a284b70666a936caca0af7f8268c9d8.jpg"
            }
        ],
        "nav2s": [
            {
                "id": 2,
                "stype": "1",
                "stype_link": "/pages/hospital/index?hid=5",
                "title": "img2",
                "tcolor": "",
                "cat_text": "",
                "stype_text": "Stype 1",
                "pic_image_url": "http://159.75.169.224/uploads/20231105/299ec231895953ff27de0f63c7703f6b.png"
            },
            {
                "id": 1,
                "stype": "1",
                "stype_link": "/pages/hospital/index?hid=4",
                "title": "img1",
                "tcolor": "",
                "cat_text": "",
                "stype_text": "Stype 1",
                "pic_image_url": "http://159.75.169.224/uploads/20231105/ac905fd8f9f1ca96ce614f0960a74820.png"
            }
        ],
        "navs": [
            {
                "id": 3,
                "stype": "1",
                "stype_link": "/pages/service/index?svid=1&hid=5",
                "title": "代跑取药",
                "tcolor": "",
                "cat_text": "",
                "stype_text": "Stype 1",
                "pic_image_url": "http://159.75.169.224/uploads/20231105/212b8060d23a23d254699debb3a8c86d.png"
            },
            {
                "id": 4,
                "stype": "1",
                "stype_link": "/pages/service/index?svid=4&hid=5",
                "title": "上门助浴",
                "tcolor": "",
                "cat_text": "",
                "stype_text": "Stype 1",
                "pic_image_url": "http://159.75.169.224/uploads/20231105/e398aab14567d1fa039d328e09f6fc6f.png"
            },
            {
                "id": 5,
                "stype": "1",
                "stype_link": "/pages/service/index?svid=4&hid=5",
                "title": "送取结果",
                "tcolor": "",
                "cat_text": "",
                "stype_text": "Stype 1",
                "pic_image_url": "http://159.75.169.224/uploads/20231105/038a12b6bb3486e79d3062b1ee1795d7.png"
            },
            {
                "id": 6,
                "stype": "1",
                "stype_link": "/pages/service/index?svid=4&hid=5",
                "title": "诊前约号",
                "tcolor": "",
                "cat_text": "",
                "stype_text": "Stype 1",
                "pic_image_url": "http://159.75.169.224/uploads/20231105/9928b17ae7981ca591629a66748f76b4.png"
            },
            {
                "id": 7,
                "stype": "1",
                "stype_link": "/pages/service/index?svid=4&hid=5",
                "title": "尊享陪诊",
                "tcolor": "",
                "cat_text": "",
                "stype_text": "Stype 1",
                "pic_image_url": "http://159.75.169.224/uploads/20231105/56c5ab7c1b579767c0733f1c3820defd.png"
            }
        ],
        "hospitals": [
            {
                "id": 5,
                "name": "武汉中心医院",
                "rank": "三甲",
                "label": "综合病院",
                "intro": "武汉市中心医院是一家位于中国湖北省武汉市的大型综合性医院。",
                "avatar_url": "http://159.75.169.224/uploads/20231105/d64c396c15bd003d45f79e939180301c.jpeg"
            },
            {
                "id": 4,
                "name": "协和医院",
                "rank": "三甲",
                "label": "综合病院",
                "intro": "协和医院是中国的一家著名综合性医院，拥有一流的医疗设施和技术。",
                "avatar_url": "http://159.75.169.224/uploads/20231105/308e36361cf273fdefe35c80c3134f92.jpeg"
            },
            {
                "id": 1,
                "name": "湘雅分院",
                "rank": "三甲",
                "label": "综合病院",
                "intro": "湘雅分院是湘雅医院的附属医院，提供全科医疗服务和各种专科诊疗服务。",
                "avatar_url": "http://159.75.169.224/uploads/20231105/341dcc6aca9679917a9fd50988a2f082.jpeg"
            },
            {
                "id": 2,
                "name": "中医药大学",
                "rank": "三甲",
                "label": "综合病院",
                "intro": "湖南中医药大学的附属医院，也是湖南省中医药系统的重点医疗机构之一。",
                "avatar_url": "http://159.75.169.224/uploads/20231105/e22cd5cd5b3481e14bbdc52d9e237999.png"
            },
            {
                "id": 3,
                "name": "株洲市三医院",
                "rank": "三甲",
                "label": "综合病院",
                "intro": "医院拥有一支专业的医疗团队，提供高质量的医疗服务。",
                "avatar_url": "http://159.75.169.224/uploads/20231105/7adb0d6877e16ace0c3725e7e42a496d.jpeg"
            }
        ]
    }
}
```