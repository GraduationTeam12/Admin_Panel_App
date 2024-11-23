import 'package:flutter/material.dart';

void showLogOutDialog(BuildContext context, String name, String email) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Padding(
        padding: const EdgeInsets.only(top: 55,),
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
                  width: 65,
                  height: 65,
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
                      name,
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 25,
                          fontWeight: FontWeight.w400),
                    ),
                    Text(
                      email,
                      style: const TextStyle(
                          color: Color.fromRGBO(92, 88, 88, 1),
                          fontSize: 20,
                          fontWeight: FontWeight.w400),
                    )
                  ],
                )
              ],
            )),
      );
    },
  );
}
