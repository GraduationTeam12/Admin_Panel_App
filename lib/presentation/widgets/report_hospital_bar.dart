import 'package:admin_panel_app/constants/app_style.dart';
import 'package:admin_panel_app/presentation/models/report_model.dart';
import 'package:flutter/material.dart';

class ReportHospitalBar extends StatelessWidget {
  const ReportHospitalBar({super.key, required this.reportModel});

  final ReportModel reportModel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10 ,vertical: 10),
      child: Container(
        height: 70,
        padding: const EdgeInsets.only(
         
          left: 15,
        ),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            boxShadow: const [
              BoxShadow(
                  color: Colors.black26, blurRadius: 4, offset: Offset(0, 4))
            ]),
        child: Row(
          // mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(reportModel.name , style: AppStyle.styleBold17(context).copyWith(color: const Color(0xFF5C5858)),),
      
              SizedBox(width: MediaQuery.sizeOf(context).width*0.0363,),
      
            Text(reportModel.email , style: AppStyle.styleBold17(context).copyWith(color: const Color(0xFF5C5858)),),
      
              SizedBox(width: MediaQuery.sizeOf(context).width*0.106,),
      
            Text(reportModel.id , style: AppStyle.styleBold17(context).copyWith(color: const Color(0xFF5C5858)),),
      
              SizedBox(width: MediaQuery.sizeOf(context).width*0.11,),
      
            Text(reportModel.firperson ?? '' , style: AppStyle.styleBold17(context).copyWith(color: const Color(0xFF5C5858)),),
      
              SizedBox(width: MediaQuery.sizeOf(context).width*0.08,),
      
            Text(reportModel.longitude ?? '' , style: AppStyle.styleBold17(context).copyWith(color: const Color(0xFF5C5858)),),
      
              SizedBox(width: MediaQuery.sizeOf(context).width*0.09,),
      
            Text(reportModel.latitude ?? '' , style: AppStyle.styleBold17(context).copyWith(color: const Color(0xFF5C5858)),),
      
              // SizedBox(width: 30,),
          ],
        ),
      ),
    );
  }
}
