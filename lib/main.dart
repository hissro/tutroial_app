import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';




void main()
{
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'News Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}







class HomePage extends StatefulWidget
{
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}





class _HomePageState extends State<HomePage>
{

  // الحين نعمل داله جديده فقط لجلب الاخبار من ال json

  Future<List<News>>  GetNewsData ()  async //    هنا التحويل بمعني يتم انتظار الداله لين ما تجلب البيانات
  {

    List <News>  newsArray = [];
    // https://newsapi.org/v2/top-headlines?country=in&apiKey=ff4cbfff719343e1b4c62ce693f022e4
    //  هذا رابط الاخبار فقط

    // تحويل ال url  العادي علي  uri
    var url = Uri.parse('https://newsapi.org/v2/top-headlines?country=in&apiKey=ff4cbfff719343e1b4c62ce693f022e4');

    // هنا بدايه الاتصال مع الرابط اللي تحطيه في ال josn


    // هنا في خطا لان الداله مفروض تكون نوعها داله تزامن اي بمعني تاخد وقت لين ما الاتصال وجلب البيانات يتم بالتالي لازم نسوي الداله و نحولها الي متزامنه
    var response = await http.get(url);


    //   responseالداتا هنا ترجع في
    // response.statusCode   هذا اذا الرابط صحيح و ماف اي مشكله في تحميل البيانات ترجع 200
    // الحين نغير في الرابط الي رابط فيه خطا
    // الرابط الحين فيه خطا و رجع رقم الخطا 401
    // print('Response status: ${response.statusCode}');


    //  البيانات المرجعه كلها ترجع في ال body
    // اذا لازم في الاول اشيك علي رقم الحاله اذا كان 200    اقدر بعدها احولها الي التطبيق و التصميم و ماتكون في مشاكل
    // print('Response body: ${response.body}');

    // ألحين نحول البيانات هذه كلها من صيغه النص josn  الي صيغه بيانات مفرده



    //  الحين التعامل معاها من نص الي مصفوفه
    // مثلا نطبع منها اجزاء زي عنوان الخبر ركزو


    /*

    {"status":"ok","totalResults":38,"articles":

    هذا اول حقل اسمه الحاله و القيمه حقته اوك
    الي بعده اسمه عدد الحقول الراجعه و هي 38 خبر
    وبعدها و هي الاهم الاخبار موجوده في العنوان او العنصر
    articles



     */
    var news =  jsonDecode(response.body);


    // print (' All articles : ${news["articles"]} ');



     if ( response.statusCode == 200 )
       {


         // الحين محتاجين الي حلقه تكرار ناخد فيها الاخبار اللي عددهم 38 ونطبع العنوان فقط




         //  الي هنا تم تجميل و الوصول الي كل البيانات بنجاح لانه تم تحويلها الي مصفوفه من نص
         //  الخطوه الاخيره نحن بنرجع قائمه اخبار  يعني لازم نعرف لست من نوع الاخبار



         // هنا عملنا لست للاخبار فارغه




         for (var row in news["articles"])
           {

             // الحين هنا نحول كل خبر بداخل اللست اللي سوينها بس اول شي لازم الخبر هذا من مصفوفه عاديه نحوله الي نوع المدويل اللي اسمه News
             var singleNewsRow = News.fromJson(row);

             // تلقائي حولها للمدويل و ظهر لنا اسم الحقل مباشر
             // print (' title :: ${singleNewsRow.title}  ');

             //  الخطوة الثانيه اضافه هذا الخبر الي اللست تبع الاخبار
             newsArray.add( singleNewsRow  );

           }

         // كذا خلصنا حلقه التكرار الحين نبي نطبع نشوف كم في List الخاصه بالاخبار

         print ('  News List Items Count : ${newsArray.length} ');
         // newsArray.length  بمعني كم عدد الطول اللي في اللست هذه



         // الحين شوفنا اللست فيها العناصر نبي نغير التصميم يناسب مع الداله و بدون الضغط علي زر //


         // ألداله هذه ترجع void

         // لازم نغير الداله و نحذ الزر

         // أول شي انا برجع اللست تبع الاخبار


         // الخطا بسيط لان الداله معرفه انها لاترجع شي و انا مسوي استرجاع

       }



     // نحن عرفنا اللست بداخل if  تبع الحاله خطا
    //  لازم تعرف اللست في اول الداله بمعني  الاسترجاع ما يكون فارغ او المتغير
    return newsArray ;

  }


  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'News Simple Apps'
          ),
        ),
      ),

      body: SingleChildScrollView(
        child: FutureBuilder<List<News>>  // حل المشكله هنا انه اعرف نوع المتغيرات فقط بعد اسم الداله مباشر مثل ما حطيت النوع لست من الاخبار
          (
          future: GetNewsData() ,   // هنا نكتب الداله اللي تغذي الصفحه بالبيانات و يكون الاستدعاء تلقائي دون الحاجه الي الزر
            builder: (BuildContext context, AsyncSnapshot snapshot) // هنا نكتب نوع البيانات المرجعه من الداله حقت جلب الاخبار وهي لست من الاخبار
            {



               // هنا نقدر نعرف اذا الداله جلبت البيانات ام في حاله الجلب او في حاله الخطا


            if (snapshot.hasData)
              {


                //  snapshot اوك الحين عندي لست من البيانات موجوده في المتغير اللي اسمه
                // Instance of 'News'  تظهر انها من اللست تبع ال  news
                // print (' Snap ${snapshot.data }');


                //  الحين نبي نستعرضها كامله


                List<News>  myrowdata = snapshot.data;

                // ألحين عندنا مشكله جديده بسبب التحديث الاخير في الفلاتر بسبب انه في احتمال المتغير ياخد null

                return ListView.builder  // هذه الداله تطبع اللست دائما و تاخد طول اللست و هي مثل حقله ال for
                  (
                  shrinkWrap: true ,
                  physics: ScrollPhysics(),
                  itemCount: myrowdata.length ,
                    itemBuilder: (BuildContext context , int Indexarray)
                    {

                      News singlerow = myrowdata[Indexarray];


                      return  Container(
                        padding: EdgeInsets.all(8) ,
                        margin: EdgeInsets.only(
                          right: 5,
                          left: 5,
                          bottom: 15
                        ),
                        decoration: BoxDecoration(
                          color: Colors.teal.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(
                            20
                          )
                        ),

                        child: Card(
                          clipBehavior: Clip.antiAlias,
                          child: Column(
                            children: [
                              ListTile(
                                leading: Icon(Icons.info),
                                title:   Text( singlerow.title , style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),),

                              ),
                              Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Text(
                                  singlerow.description,
                                  style: TextStyle(color: Colors.black.withOpacity(0.6)),
                                ),
                              ),
                              ButtonBar(
                                alignment: MainAxisAlignment.start,
                                children: [
                                  FlatButton(
                                    textColor: const Color(0xFF6200EE),
                                    onPressed: ()
                                    {
                                      // Perform some action
                                    },
                                    child: const Text('read more..'),
                                  ),

                                ],
                              ),
                              Image.network ( singlerow.urlToImage ),

                            ],
                          ),
                        ),
                      );

                    }
                ) ;  //  هنا البيانات اكتمل تحميلها كامله  //


              }
            else
              {

                return Column(
                  children: [

                    SizedBox(height: 120,),
                    Center(child: SpinKitCircle(
                      color: Colors.teal,
                      size: 50.0,
                    )),
                  ],
                );  // هنا الانتظار لتحميل البيانات
              }

            }

        ),
      ),
    );
  }
}










// هذا لتحويل النصوص من josn  الي كلاس لتسهيل عرض البيانات في التطبيق

class News
{
  final String title;
  final String description;
  final String urlToImage;

  News({required this.title, required this.description , required this.urlToImage});


  // هذه الداله تحول من حلقه التكرار  الي موديول من نوع الاخبار نستخدمها هي فقط
  factory News.fromJson(Map<String, dynamic> parsedJson)
  {

    //  هنا بياخد كل عنصر في المصفوفه و بحطه علي متغيرات الكلاس او المديول
    //  بياخد القيم اللي مررناها له من حقل التكرار و بيحطها باسم الحقل مباشر
    return News(
        title : parsedJson['title'].toString(),
        description: parsedJson['description'].toString(),
        urlToImage: parsedJson['urlToImage'].toString()
    );
  }

}







