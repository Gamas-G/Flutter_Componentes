import 'package:flutter/material.dart';


class AvatarPage extends StatelessWidget {
  const AvatarPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Avater Page"),
        actions: [

          Container(
            padding: EdgeInsets.only(top: 4.0, right: 10.0, bottom: 4.0),
            child: CircleAvatar(
              radius: 25.0,
              backgroundImage: NetworkImage('https://i.pinimg.com/originals/65/74/c6/6574c6439f3598580cdf7ee36e17ef35.jpg')
            ),
          ),

          Container(
            margin: EdgeInsets.only(right: 10.0, top: 4.0, bottom: 4.0),
            child: CircleAvatar(
              radius: 25.0,
              child: Text("OP"),
              backgroundColor: Colors.brown,
            ),
          )

        ],
      ),

      body: Center(
          child: FadeInImage(
            placeholder: AssetImage('images/wait.gif'),
            // image: NetworkImage('https://a-static.besthdwallpaper.com/transformers-el-ultimo-caballero-optimus-prime-y-bumblebee-papel-pintado-828x1792-15629_218.jpg'),
            image: NetworkImage('https://s1.1zoom.me/big0/602/Transformers_The_Last_Knight_Optimus_Prime_Robot_525930_725x1024.jpg'),
            fadeInDuration: Duration(milliseconds: 200),
            ),
        ),
    );
  }
}