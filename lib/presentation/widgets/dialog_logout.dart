import 'package:flutter/material.dart';

void showLogOutDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Padding(
        padding: const EdgeInsets.only(
          top: 55,
        ),
        child: AlertDialog(
            scrollable: true,
            titlePadding: EdgeInsets.zero,
            backgroundColor: Colors.white,
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.close)),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "Are you sure you want to log out?",
                  style: TextStyle(
                      fontSize: 25,
                      color: Colors.black,
                      fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  height: 25,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      style: ButtonStyle(
                          shape: WidgetStatePropertyAll(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                          backgroundColor: const WidgetStatePropertyAll(
                            Color.fromRGBO(61, 100, 152, 1),
                          ),
                          padding: const WidgetStatePropertyAll(EdgeInsets.only(
                              right: 20, left: 20, top: 6, bottom: 6))),
                      child: const Text(
                        "NO",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                    const SizedBox(
                      width: 30,
                    ),
                    TextButton(
                      onPressed: () {},
                      style: ButtonStyle(
                          shape: WidgetStatePropertyAll(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                          side: const WidgetStatePropertyAll(
                            BorderSide(
                                color: Color.fromRGBO(255, 180, 65, 1),
                                width: 2),
                          ),
                          padding: const WidgetStatePropertyAll(EdgeInsets.only(
                              right: 20, left: 20, top: 6, bottom: 6))),
                      child: const Text(
                        "Exit",
                        style: TextStyle(
                            color: Color.fromRGBO(86, 86, 86, 1),
                            fontSize: 25,
                            fontWeight: FontWeight.w700),
                      ),
                    )
                  ],
                )
              ],
            )),
      );
    },
  );
}
