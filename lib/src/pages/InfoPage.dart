import 'package:covid_19/constants.dart';
import 'package:covid_19/src/widgets/Header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class InfoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            MyHeader(
              image: "assets/icons/coronadr.svg",
              textTop: "Que saber",
              textBottom: "acerca del Covid-19",
            ),
            //Cuerpo de la app
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("Síntomas", style: kTitleTextStyle,),
                  SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      SintomaCard(image: "assets/images/headache.png", title: "Dolor de Cabeza", isActive: true,),
                      SintomaCard(image: "assets/images/caugh.png", title: "Tos",),
                      SintomaCard(image: "assets/images/fever.png", title: "Fiebre",)
                    ],
                  ),
                  SizedBox(height: 20,),
                  Text("Prevención", style: kTitleTextStyle,),
                  PreventCard(
                    image: "assets/images/wear_mask.png", 
                    title: "Mascarilla", 
                    text: "Desde el comienzo del coronavirus se recomienda el uso de mascarillas",
                  ),
                  PreventCard(
                    image: "assets/images/wash_hands.png", 
                    title: "Lava tus manos", 
                    text: "Lava tus manos por lo menos durante 20 segundos",
                  ),
                  SizedBox(height: 50,)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class PreventCard extends StatelessWidget {

  final String image;
  final String title;
  final String text;
  
  const PreventCard({
    Key key, this.image, this.title, this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: SizedBox(
        height: 156,
        child: Stack(
          alignment: Alignment.centerLeft,
          children: <Widget>[
            Container(
              height: 136,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 8),
                    blurRadius: 24,
                    color: kShadowColor,
                  )
                ]
              ),
            ),
            Image.asset(image),
            Positioned(
              left: 130,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                height: 136,
                width: MediaQuery.of(context).size.width - 170,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(title, style: kTitleTextStyle.copyWith(fontSize: 16),),
                    Text(text, style: TextStyle(fontSize: 12),),
                    //Coloca un icono de flecha del lado derecho del texto
                    Align(
                      alignment: Alignment.topRight,
                      child: SvgPicture.asset("assets/icons/forward.svg")
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class SintomaCard extends StatelessWidget {

  final String image;
  final String title;
  final bool isActive;
  
  const SintomaCard({
    Key key, this.image, this.title, this.isActive = false
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
        boxShadow: [
          isActive ? BoxShadow(
            offset: Offset(0, 10),
            blurRadius: 20,
            color: kActiveShadowColor
          )
          : BoxShadow(
            offset: Offset(0, 3),
            blurRadius: 6,
            color: kShadowColor
          )
        ]
      ),
      child: Column(
        children: <Widget>[
          Image.asset(image, height: 90,),
          Text(title, style: TextStyle(fontWeight: FontWeight.bold),),
        ],
      ),
    );
  }
}