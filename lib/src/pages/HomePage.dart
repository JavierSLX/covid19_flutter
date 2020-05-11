import 'package:covid_19/constants.dart';
import 'package:covid_19/src/widgets/Counter.dart';
import 'package:covid_19/src/widgets/Header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      //Agrega un scroll a la columna
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            //Barra superior
            MyHeader(
              image: "assets/icons/Drcorona.svg", 
              textTop: "Todo lo que necesitas", 
              textBottom: "es quedarte en casa",
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              height: 60,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25),
                border: Border.all(color: Color(0xFFE5E5E5))
              ),
              child: Row(
                children: <Widget>[
                  //Icono
                  SvgPicture.asset("assets/icons/maps-and-flags.svg"),
                  SizedBox(width: 20,),
                  Expanded(
                    //Crea un dropdown list con un array
                    child: DropdownButton(
                      //Le da formato al widget
                      isExpanded: true,
                      underline: SizedBox(),
                      icon: SvgPicture.asset("assets/icons/dropdown.svg"),
                      value: "Indonesia",
                      items: ["Indonesia", "Bangladesh", "Estados Unidos", "Japón"].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(), 
                      onChanged: (value){
                      }
                    )
                  )
                ],
              ),
            ),
            SizedBox(height: 20,),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "Actualización de Casos\n",
                              style: kTitleTextStyle,
                            ),
                            TextSpan(
                              text: "Nueva Actualización 28 de Marzo",
                              style: TextStyle(
                                color: kTextLightColor
                              )
                            )
                          ],
                        ),
                      ),
                      //Da un espacio entre los elementos
                      Spacer(),
                      Text(
                        "Ver Detalles",
                        style: TextStyle(
                          color: kPrimaryColor,
                          fontWeight: FontWeight.w600
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 20,),
                  Container(
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(0, 4),
                          blurRadius: 30,
                          color: kShadowColor
                        )
                      ]
                    ),
                    child: Row(
                      //Da espacio equitativo entre los elementos
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Counter(
                          color: kInfectedColor,
                          number: 1046,
                          title: "Infectados",
                        ),
                        Counter(
                          color: kDeathColor,
                          number: 87,
                          title: "Muertos",
                        ),
                        Counter(
                          color: kRecoverColor,
                          number: 46,
                          title: "Recuperados",
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20,),
                  Row(
                    //Da espacio entre los elementos
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text("Propagación del Virus", style: kTitleTextStyle,),
                      Text("Ver Detalles", style: TextStyle(color: kPrimaryColor, fontWeight: FontWeight.w600),)
                    ],
                  ),
                  //Contenedor que contiene el mapa de la app
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    padding: EdgeInsets.all(20),
                    height: 178,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(0, 10),
                          blurRadius: 30,
                          color: kShadowColor
                        ),
                      ]
                    ),
                    //Carga la imagen del mapa
                    child: Image.asset("assets/images/map.png", fit: BoxFit.contain,),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}



