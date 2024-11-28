import 'package:admin_panel_app/constants/app_images.dart';
import 'package:admin_panel_app/constants/app_style.dart';
import 'package:admin_panel_app/constants/colors.dart';
import 'package:admin_panel_app/core/api/end_points.dart';
import 'package:admin_panel_app/core/cache/cache_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html;

import 'dart:convert'; // لتحويل JSON
import 'package:http/http.dart' as http; // مكتبة HTTP

void sendEmail(String name, String email, String subject, String message,
    BuildContext context) async {
  final url = Uri.parse("https://api.emailjs.com/api/v1.0/email/send");

  const String serviceId = "service_nh1b3vb";
  const String templateId = "template_hb3l35q";
  const String userId = "ELFIa2fG24VBtdyRK";

  try {
    final response = await http.post(
      url,
      headers: {
        "Content-Type": "application/json", // نوع المحتوى
      },
      body: jsonEncode({
        // تحويل الجسم إلى JSON
        "service_id": serviceId,
        "template_id": templateId,
        "user_id": userId,
        "template_params": {
          "to_name": "doaa",
          "from_name": name,
          "reply_to": email,
          "message": message,
          "subject_data": subject,
        },
      }),
    );

    // تحقق من الاستجابة
    if (response.statusCode == 200) {
      print("Email sent successfully!");
      Navigator.pop(context);
    } else {
      print("Failed to send email. Status code: ${response.statusCode}");
      print("Response body: ${response.body}");
    }
  } catch (e) {
    print("Error occurred: $e");
  }
}

void showContactUsDialog(BuildContext context) {
  TextEditingController messageController = TextEditingController();
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        scrollable: true,
        titlePadding: EdgeInsets.zero,
        backgroundColor: const Color.fromRGBO(245, 245, 245, 1),
        content: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                width: 500,
                child: Text(
                  "You can contact technical support to find a solution for your issue",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 30,
                      fontWeight: FontWeight.w600),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              const Text(
                "Contact With technical support",
                style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w500,
                    color: Color.fromRGBO(92, 88, 88, 1)),
              ),
              const SizedBox(
                height: 20,
              ),
              Form(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 200,
                      width: 500,
                      decoration: ShapeDecoration(
                          shadows: const [
                            BoxShadow(
                                blurRadius: 4,
                                offset: Offset(0, 4),
                                color: Color.fromRGBO(0, 0, 0, 0.2))
                          ],
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
                              side: const BorderSide(
                                  color: Color.fromRGBO(255, 180, 65, 1),
                                  width: 1))),
                      child: TextFormField(
                        maxLines: null,
                        controller: messageController,
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
                            hintText: "Message...",
                            hintStyle: const TextStyle(
                                fontSize: 15,
                                color: Color.fromRGBO(92, 88, 88, 1),
                                fontWeight: FontWeight.w400),
                            border: const OutlineInputBorder(
                                borderSide: BorderSide.none),
                            enabledBorder: const OutlineInputBorder(
                                borderSide: BorderSide.none),
                            focusedBorder: const OutlineInputBorder(
                                borderSide: BorderSide.none)),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              SizedBox(
                width: 500,
                height: 55,
                child: ElevatedButton(
                  onPressed: () async {
                    final emailId = CacheHelper().getData(key: ApiKeys.id);

                    sendEmail(
                        "admin app (SATARS)",
                        emailId,
                        "Please I want a solution to the problem",
                        messageController.text.trim(),
                        context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: MyColors.premiumColor,
                    elevation: 6,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  child: Text(
                    "Send",
                    style: AppStyle.styleRegular25(context).copyWith(
                        fontSize: 25, fontFamily: 'Inter', color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Stack(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Divider(color: Colors.black, height: 1),
                  ),
                  Positioned(
                    top: -5,
                    right: 0,
                    left: 0,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                              alignment: Alignment.topCenter,
                              padding:
                                  const EdgeInsets.only(right: 20, left: 20),
                              decoration: BoxDecoration(
                                  color: const Color.fromRGBO(245, 245, 245, 1),
                                  borderRadius: BorderRadius.circular(50)),
                              child: const Text(
                                "OR",
                                style: TextStyle(
                                    fontSize: 24,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w400),
                              )),
                        ]),
                  )
                ],
              ),
              const SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                      onTap: () {
                        html.window.open('https://www.twitter.com/', '_blank');
                      },
                      child: SvgPicture.asset(Assets.imagesAuthImagesX)),
                  const SizedBox(
                    width: 20,
                  ),
                  InkWell(
                      onTap: () {
                        html.window.open('https://www.tiktok.com/', '_blank');
                      },
                      child: SvgPicture.asset(Assets.imagesAuthImagesTiktok)),
                  const SizedBox(
                    width: 20,
                  ),
                  InkWell(
                      onTap: () {
                        html.window.open('https://www.facebook.com/', '_blank');
                      },
                      child: SvgPicture.asset(Assets.imagesAuthImagesFacebook))
                ],
              )
            ],
          ),
        ),
      );
    },
  );
}
