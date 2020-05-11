import 'package:covid_19/src/pages/InfoPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MyHeader extends StatelessWidget {

  final String image;
  final String textTop;
  final String textBottom;
  
  const MyHeader({
    Key key,
    this.image, this.textTop, this.textBottom,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    final size = MediaQuery.of(context).size;

    return ClipPath(
      //Le da un efecto circular a la base de la barra
      clipper: MyClipper(),
      child: Container(
        padding: EdgeInsets.only(left: 40, top: 50, right: 20),
        //Toma el 40% del alto del equipo para mostrar la barra
        height: size.height * 0.4,
        width: double.infinity,
        //Color gradiente que comienza desde arriba a la derecha y termina al fondo a la izquierda
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Color(0xFF3383CD),
              Color(0xFF11249F)
            ]
          ),
          image: DecorationImage(image: AssetImage("assets/images/virus.png"))
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Align(
              alignment: Alignment.topRight,
              //Al hacer click sobre el simbolo de menu se irá a la pagina de Info
              child: GestureDetector(
                child: SvgPicture.asset("assets/icons/menu.svg"),
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context){
                        return InfoPage();
                      }
                    ),
                  );
                },
              )
            ),
            SizedBox(height: 20,),
            Expanded(
              //Pila de elementos
              child: Stack(
                children: <Widget>[
                  SvgPicture.asset(
                    image,
                    width: 230,
                    fit: BoxFit.fitWidth,
                    alignment: Alignment.topCenter,
                  ),
                  Positioned(
                    top: 20,
                    left: 150,
                    child: Text(
                      "$textTop\n$textBottom",
                      style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.w600),
                    ),
                  ),
                  Container(), //Si no se coloca ocasiona un bug con el Positioned
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

//Efecto circular a la barra
class MyClipper extends CustomClipper<Path>
{
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0, size.height - 80);
    path.quadraticBezierTo(size.width / 2, size.height, size.width, size.height - 80);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
  
}