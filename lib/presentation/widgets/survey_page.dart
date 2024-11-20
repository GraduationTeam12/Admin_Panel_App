import 'package:admin_panel_app/constants/app_images.dart';
import 'package:admin_panel_app/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SurveyPage extends StatelessWidget {
  const SurveyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Container(
          padding:const EdgeInsets.symmetric(horizontal: 150),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: MediaQuery.sizeOf(context).height*0.02,),
               SizedBox(
                height:  MediaQuery.sizeOf(context).height*0.20,
                 child:  Text(
                   "You have the authority as an admin to create and send a periodic survey to all customers to ensure their satisfaction with our service",
                   style: TextStyle(
                       fontSize: 210*( MediaQuery.sizeOf(context).height*0.25)/MediaQuery.sizeOf(context).width,
                       fontWeight: FontWeight.w400,
                       color: const Color.fromRGBO(61, 100, 152, 1)),
                   textAlign: TextAlign.center,
                 ),
               ),
                
              SizedBox(height: MediaQuery.sizeOf(context).height*0.5,width: MediaQuery.sizeOf(context).width*0.3,child: SvgPicture.asset(Assets.imagesAuthImagesBroSurvey)),
              SizedBox(height: MediaQuery.sizeOf(context).height*0.02,),
              Container(
              height: MediaQuery.sizeOf(context).height*0.08,
                width: MediaQuery.sizeOf(context).width*0.3,
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  color: MyColors.premiumColor,
                  borderRadius: BorderRadius.circular(20)
                ),
                child: const Text("Get Now",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w400,fontSize: 22),)),
              
            ],
          ),
        ),
      ),
    );
  }
}
