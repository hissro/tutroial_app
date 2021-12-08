import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: UserProfile(),
    );
  }
}




class UserProfile extends StatelessWidget
{
  const UserProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Column(
        children: [

          //  هنا تم التقسيم الي اعمده


          //  الداله هذه تضيف مساحه من الاعلي او من اليمين او اليسار
          SizedBox(height: 80,),



          /*
          Row(
            // هنا نحط التباعد في الايقونات
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children:
            [

              // الحين نباعد علي اليسار
               Container(
                 padding: EdgeInsets.only(left: 20 ),
                 child:Icon(Icons.home),
               ),


              Container(
                padding: EdgeInsets.only(right: 20),
                child: Icon(Icons.menu),
              )



            ],
          ),
          */

          Container(
            padding: EdgeInsets.only(
              right: 20,
              left: 20,
            ),
            child:  Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(Icons.home , color: Colors.grey,),
                Icon(Icons.menu , color: Colors.grey,),
              ],
            ),
          ),



          SizedBox(height: 20,),
          //  الحين نبدا في الصوره
          CircleAvatar(
            radius: 60,
            backgroundColor: Colors.grey,
             backgroundImage: AssetImage ('assets/imges/profile.png'),
          ),




          SizedBox(height: 20,),


          //  ايقونات التواصل الاجتماعي
          Row(
            // المحاذه الي الوسط
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              Container(
                 // padding  هو اضافة مساحه داخل الكونتيرن
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.blue,
                  // borderRadius هي تحويل الحدود الي دائريه الشكل بنسبه 30
                  borderRadius: BorderRadius.circular(30),
                ),
                child: FaIcon(FontAwesomeIcons.twitter , color: Colors.white,) ,
              ),

              //  هنا بنحاول نضيف مساحه علي مستوي العرض
              SizedBox(width: 5,),

              Container(
                // padding  هو اضافة مساحه داخل الكونتيرن
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.red,
                  // borderRadius هي تحويل الحدود الي دائريه الشكل بنسبه 30
                  borderRadius: BorderRadius.circular(30),
                ),
                child: FaIcon(FontAwesomeIcons.google , color: Colors.white,) ,
              ),

              SizedBox(width: 5,),

              Container(
                // padding  هو اضافة مساحه داخل الكونتيرن
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.blue,
                  // borderRadius هي تحويل الحدود الي دائريه الشكل بنسبه 30
                  borderRadius: BorderRadius.circular(30),
                ),
                child: FaIcon(FontAwesomeIcons.twitter , color: Colors.white,) ,
              ),

              SizedBox(width: 5,),

              Container(
                // padding  هو اضافة مساحه داخل الكونتيرن
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.blueGrey,
                  // borderRadius هي تحويل الحدود الي دائريه الشكل بنسبه 30
                  borderRadius: BorderRadius.circular(30),
                ),
                child: FaIcon(FontAwesomeIcons.linkedinIn , color: Colors.white,) ,
              ),


            ],
          ),




          SizedBox(height: 30,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(' Name ', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold ), ),
            ],
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(' @account ', style: TextStyle(fontSize: 12 , color: Colors.grey ), ),
            ],
          ),


          SizedBox(height: 15,),
          Row(
            // محاذاه الي البدايه السطر
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(' Android StudioAndroid Studio Android StudioAndroid  ', style: TextStyle(fontSize: 12 , color: Colors.grey ), ),
            ],
          ),




          SizedBox(height: 20,),


          Container(
            // margin   تعطي مسافة من خارج الكونتيرن
            margin: EdgeInsets.only(right: 20 , left:  20 , top: 15),
            // مساحه بداخل الكونتيرن
            padding: EdgeInsets.only( top: 8 , bottom: 8 , left: 15 , right: 15 ),
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.2),
              borderRadius: BorderRadius.circular(20)
            ),
            child:  Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children:
              [


                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    FaIcon(FontAwesomeIcons.shieldAlt , color: Colors.black,),
                    SizedBox(width: 10,),

                    Text(" Setting " , style: TextStyle( fontWeight: FontWeight.bold  ),),
                  ],
                ),





                Row(
                  children: [
                    FaIcon(FontAwesomeIcons.arrowRight , color: Colors.black,),
                  ],
                )






              ],
            ),
          ),


          Container(
            // margin   تعطي مسافة من خارج الكونتيرن
            margin: EdgeInsets.only(right: 20 , left:  20 , top: 15),
            // مساحه بداخل الكونتيرن
            padding: EdgeInsets.only( top: 8 , bottom: 8 , left: 15 , right: 15 ),
            decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.2),
                borderRadius: BorderRadius.circular(20)
            ),
            child:  Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children:
              [


                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    FaIcon(FontAwesomeIcons.shieldAlt , color: Colors.black,),
                    SizedBox(width: 10,),

                    Text(" Setting " , style: TextStyle( fontWeight: FontWeight.bold  ),),
                  ],
                ),





                Row(
                  children: [
                    FaIcon(FontAwesomeIcons.arrowRight , color: Colors.black,),
                  ],
                )






              ],
            ),
          ),




          Container(
            // margin   تعطي مسافة من خارج الكونتيرن
            margin: EdgeInsets.only(right: 20 , left:  20 , top: 15),
            // مساحه بداخل الكونتيرن
            padding: EdgeInsets.only( top: 8 , bottom: 8 , left: 15 , right: 15 ),
            decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.2),
                borderRadius: BorderRadius.circular(20)
            ),
            child:  Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children:
              [


                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    FaIcon(FontAwesomeIcons.shieldAlt , color: Colors.black,),
                    SizedBox(width: 10,),

                    Text(" Setting " , style: TextStyle( fontWeight: FontWeight.bold  ),),
                  ],
                ),





                Row(
                  children: [
                    FaIcon(FontAwesomeIcons.arrowRight , color: Colors.black,),
                  ],
                )






              ],
            ),
          ),


          Container(
            // margin   تعطي مسافة من خارج الكونتيرن
            margin: EdgeInsets.only(right: 20 , left:  20 , top: 15),
            // مساحه بداخل الكونتيرن
            padding: EdgeInsets.only( top: 8 , bottom: 8 , left: 15 , right: 15 ),
            decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.2),
                borderRadius: BorderRadius.circular(20)
            ),
            child:  Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children:
              [


                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    FaIcon(FontAwesomeIcons.shieldAlt , color: Colors.black,),
                    SizedBox(width: 10,),

                    Text(" Setting " , style: TextStyle( fontWeight: FontWeight.bold  ),),
                  ],
                ),





                Row(
                  children: [
                    FaIcon(FontAwesomeIcons.arrowRight , color: Colors.black,),
                  ],
                )






              ],
            ),
          ),

        ],
      ),

    );
  }
}
