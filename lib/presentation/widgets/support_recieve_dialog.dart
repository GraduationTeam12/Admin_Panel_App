import 'package:admin_panel_app/constants/app_style.dart';
import 'package:admin_panel_app/constants/colors.dart';
import 'package:flutter/material.dart';

void showSupportReplyDialog(BuildContext context, String title, String subtitle, 
    String img, VoidCallback callback , String? initialMessage , String titleButton,) {
  // final _formKey = GlobalKey<FormState>();
  // String? name;
  // String? email;

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        scrollable: true,
        titlePadding: EdgeInsets.zero,
        backgroundColor: Colors.white,
        title: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            leading: Container(
              width: 50,
              height: 50,
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                color: Colors.white,
                image: DecorationImage(
                  image: AssetImage(img),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(50),
                boxShadow: const [
                  BoxShadow(
                    color: Color(0x3F000000),
                    spreadRadius: 0,
                    offset: Offset(0, 4),
                    blurRadius: 4,
                  )
                ],
              ),
            ),
            title: Text(
              title,
              style: AppStyle.styleRegular25(context),
            ),
            subtitle: Text(
              subtitle,
              style: AppStyle.styleRegular25(context)
                  .copyWith(color: Colors.grey, fontSize: 20),
            ),
          ),
        ),
        content: Column(
          children: [
            Container(
              height: 80,
              width: 400,
              decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  color: MyColors.premiumColor),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Please i need a help there is a problem , i can't login by using my mail",
                  style: AppStyle.styleRegular25(context)
                      .copyWith(color: Colors.white),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Form(
              // key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 200,
                    width: 400,
                    decoration: ShapeDecoration(shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: const BorderSide(color: Colors.black , width: 1)
                    )),
                    child: TextFormField(
                      maxLines: null,
                      initialValue: initialMessage,
                      style: AppStyle.styleRegular16(context)
                          .copyWith(color: Colors.black),
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.done,
                     
                      decoration: InputDecoration(
                        errorStyle: AppStyle.styleRegular16(context)
                            .copyWith(color: Colors.red),
                        prefixIconConstraints: const BoxConstraints(
                          minWidth: 0,
                          minHeight: 0,
                        ),
                        hintText: "message...",
                        hintStyle: AppStyle.styleRegular17(context),
                        border: const OutlineInputBorder(borderSide: BorderSide.none),
                       enabledBorder:  const OutlineInputBorder(borderSide: BorderSide.none),
                        focusedBorder:  const OutlineInputBorder(borderSide: BorderSide.none)
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            SizedBox(
              width: 140,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  callback();
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.amber,
                  elevation: 6,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                child: Text(
                  titleButton,
                  style: AppStyle.styleRegular25(context).copyWith(
                      fontSize: 25, fontFamily: 'Inter', color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      );
    },
  );
}
