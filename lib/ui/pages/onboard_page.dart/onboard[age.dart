import 'package:chamting_app/fonts/big_fonts.dart';
import 'package:chamting_app/fonts/small_fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class Onboard_Page extends StatelessWidget {
  const Onboard_Page({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: ScreenUtil.defaultSize,
      splitScreenMode: true,
      minTextAdapt: true,
      
      builder: (context, child) {
      return Scaffold(
        backgroundColor: Color.fromARGB(255, 179, 179, 194),
        body: Container(
          height: 720.h,
          width: 1480.r,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w , vertical: 40.h  ),
              child: Container(
                margin: EdgeInsets.symmetric(horizontal:20.w, vertical:50.h ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.r),
                  color: Colors.white
                ),
                height: 300.h,
                width: 300.w,
                alignment: Alignment.centerRight,

                child: Column(
                  children: [
                    Row( 
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        small_fonts(text: 'HOME', size: 12.sp,color: Color.fromRGBO(92, 84, 107, 1.0)),
                        small_fonts(text: 'ABOUT US',size: 12.sp,color: Color.fromRGBO(92, 84, 107, 1.0)),
                        small_fonts(text: 'CONTACT US',size: 12.sp,color: Color.fromRGBO(92, 84, 107, 1.0)),
                        small_fonts(text: 'FAQ', size: 12.sp,color: Color.fromRGBO(92, 84, 107, 1.0))

                      ],
                    ),
                    SizedBox(height: 60.h,),


                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 120.w,
                          child: Column( 
                            children: [
                              Text('WELCOME TO', style: GoogleFonts.pacifico(
                                color: Color.fromRGBO(92, 84, 107, 1.0),
                                fontSize: 22.sp,
                                fontStyle: FontStyle.italic,
                                fontWeight: FontWeight.w500
                              ),),
                              Text('CHAMPTING', style: GoogleFonts.pacifico(
                                color: Color.fromRGBO(92, 84, 107, 1.0),
                                fontSize: 28.sp,
                                fontStyle: FontStyle.italic,
                                fontWeight: FontWeight.w500
                              ),),
                              SizedBox(height: 10.h,),
                            SizedBox(height: 40.h,),
                             Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                ElevatedButton(onPressed: (){

                                },
                                 child: Text('JOIN US'),
                                 style: const ButtonStyle(
                                  backgroundColor: MaterialStatePropertyAll(Color.fromRGBO(51, 50, 71, 1)),
                                  elevation: MaterialStatePropertyAll(20)
                                 )),
                                 ElevatedButton(onPressed: (){

                                },
                                 child: Text('LOG US'),
                                 style: const ButtonStyle(
                                  backgroundColor: MaterialStatePropertyAll(Color.fromRGBO(51, 50, 71, 1)),
                                  elevation: MaterialStatePropertyAll(20),
                                  shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                                    
                                  ))

                                 )),
                              ],
                             )

                              
                        
                              
                            ],
                          ),
                        ),
                        Column(
                          
                          children: [
                            Padding(
                              padding:  EdgeInsets.symmetric(horizontal: 8.w,vertical: 8.h),
                              child: Container(
                                height: 260.h,
                                width: 140.w,
                                decoration:  BoxDecoration(
                                  borderRadius: BorderRadius.circular(15.r),
                                  
                                  image: DecorationImage(
                                    fit: BoxFit.fill,
                                    image: AssetImage('assets/talking.png',)),
                                    boxShadow:[ BoxShadow(
                                      offset: Offset(0, 8),blurRadius: 1.w,
                                      color: Color.fromARGB(40, 51, 50, 71)
                                      
                                    )]
                                 ),
                                 
                              ),
                            )
                          ],
                        )
                      ],
                    )

                    
                  ],
                ),
              ),
            ) ,
        ),
      );
    });
  }
}
