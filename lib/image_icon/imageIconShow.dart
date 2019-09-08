import 'package:flutter/material.dart';

class ImageIconShow extends StatelessWidget {
  ImageIconShow({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: AppBar(
        title: Text("图片和Icon"),
      ),
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Image>[
            Image(
              image: AssetImage("images/portrait.png"),
              width: 100,
              height: 100,
            ),
            Image.asset(
              "images/portrait.png",
              width: 100.0,
            ),
            Image(
              image: NetworkImage(
                  "https://image.baidu.com/search/detail?ct=503316480&z=0&ipn=d&word=%E7%B4%A0%E6%8F%8F%E5%9B%BE%E7%89%87&step_word=&hs=2&pn=11&spn=0&di=127050&pi=0&rn=1&tn=baiduimagedetail&is=0%2C0&istype=0&ie=utf-8&oe=utf-8&in=&cl=2&lm=-1&st=undefined&cs=3197897019%2C3008048467&os=2215493986%2C888598676&simid=4266213636%2C901281816&adpicid=0&lpn=0&ln=1030&fr=&fmq=1567912763840_R&fm=&ic=undefined&s=undefined&hd=undefined&latest=undefined&copyright=undefined&se=&sme=&tab=0&width=undefined&height=undefined&face=undefined&ist=&jit=&cg=&bdtype=0&oriquery=&objurl=http%3A%2F%2Fimg3.duitang.com%2Fuploads%2Fitem%2F201501%2F28%2F20150128164703_2u2sF.thumb.700_0.jpeg&fromurl=ippr_z2C%24qAzdH3FAzdH3Fooo_z%26e3B17tpwg2_z%26e3Bv54AzdH3Fks52AzdH3F%3Ft1%3Dna8nmnb00&gsm=0&rpstart=0&rpnum=0&islist=&querylist=&force=undefined"),
              width: 100.0,
            ),
            Image.network(
              "https://image.baidu.com/search/detail?ct=503316480&z=0&ipn=d&word=%E7%B4%A0%E6%8F%8F%E5%9B%BE%E7%89%87&step_word=&hs=2&pn=11&spn=0&di=127050&pi=0&rn=1&tn=baiduimagedetail&is=0%2C0&istype=0&ie=utf-8&oe=utf-8&in=&cl=2&lm=-1&st=undefined&cs=3197897019%2C3008048467&os=2215493986%2C888598676&simid=4266213636%2C901281816&adpicid=0&lpn=0&ln=1030&fr=&fmq=1567912763840_R&fm=&ic=undefined&s=undefined&hd=undefined&latest=undefined&copyright=undefined&se=&sme=&tab=0&width=undefined&height=undefined&face=undefined&ist=&jit=&cg=&bdtype=0&oriquery=&objurl=http%3A%2F%2Fimg3.duitang.com%2Fuploads%2Fitem%2F201501%2F28%2F20150128164703_2u2sF.thumb.700_0.jpeg&fromurl=ippr_z2C%24qAzdH3FAzdH3Fooo_z%26e3B17tpwg2_z%26e3Bv54AzdH3Fks52AzdH3F%3Ft1%3Dna8nmnb00&gsm=0&rpstart=0&rpnum=0&islist=&querylist=&force=undefined",
              width: 100.0,
            ),
            Image(
              image: AssetImage("images/portrait.png"),
              width: 100.0,
              color: Colors.blue,
              colorBlendMode: BlendMode.difference,
            ),
            Image(
              image: AssetImage("images/portrait.png"),
              width: 100.0,
              height: 200.0,
              repeat: ImageRepeat.repeatY,
            )
          ],
        ),
      ),
    );
  }
}
