import 'package:admin_panel_app/core/api/end_points.dart';
import 'package:admin_panel_app/core/cache/cache_helper.dart';
import 'package:flutter/material.dart';

void showInfoAdminDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Padding(
        padding:  EdgeInsets.only(
          top: MediaQuery.of(context).size.width<1201?40:55,
        ),
        child: AlertDialog(
            scrollable: true,
            alignment: Alignment.topRight,
            titlePadding: EdgeInsets.zero,
            backgroundColor: Colors.white,
            content: Row(
              children: [
                Container(
                  // height: MediaQuery.of(context).size.height * .08,
                  // width: MediaQuery.of(context).size.height * .08,
                  width:MediaQuery.of(context).size.width<1201?50:65,
                  height: MediaQuery.of(context).size.width<1201?50:65,
                  decoration:
                      const BoxDecoration(shape: BoxShape.circle, boxShadow: [
                    BoxShadow(
                        color: Color.fromRGBO(0, 0, 0, 0.25),
                        blurRadius: 4,
                        offset: Offset(0, 4))
                  ]),
                  child: ClipOval(
                      child: Image.asset(
                    "assets/images/auth_images/person_image.jpeg",
                    fit: BoxFit.cover,
                  )),
                ),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                     Text(
                      "Ahmed Ayman",
                      style:  TextStyle(
                          color:const Color.fromRGBO(0, 0, 0, 1),
                          fontSize: MediaQuery.of(context).size.width<1201?22: 25,
                          fontWeight: FontWeight.w400),
                    ),
                    FutureBuilder<String>(
                      future: Future.value(
                          CacheHelper().getData(key: ApiKeys.id)),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const SizedBox();
                        } else if (snapshot.hasError) {
                          return Center(
                              child: Text('Error: ${snapshot.error}'));
                        } else if (!snapshot.hasData ||
                            snapshot.data!.isEmpty) {
                          return const Center(child: Text('No id Found'));
                        } else {
                          return Center(
                            child: Text(
                              snapshot.data!,
                              style: TextStyle(
                                  fontSize:MediaQuery.of(context).size.width<1201?18: 20, fontWeight: FontWeight.bold),
                            ),
                          );
                        }
                      },
                    )
                  ],
                )
              ],
            )),
      );
    },
  );
}
