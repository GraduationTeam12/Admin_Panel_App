import 'package:admin_panel_app/constants/app_images.dart';
import 'package:admin_panel_app/constants/app_style.dart';
import 'package:admin_panel_app/constants/colors.dart';
import 'package:admin_panel_app/presentation/models/support_model.dart';
import 'package:admin_panel_app/presentation/widgets/support_recieve_dialog.dart';
import 'package:flutter/material.dart';

class SelectingReadedOrInreaded extends StatefulWidget {
  const SelectingReadedOrInreaded({super.key});

  @override
  State<SelectingReadedOrInreaded> createState() =>
      _SelectingReadedOrInreadedState();
}

class _SelectingReadedOrInreadedState extends State<SelectingReadedOrInreaded> {
  int selectedIndex = 0;

  void updateIndex(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  final List<SupportModel> unReaded = [
    SupportModel(
      img: Assets.imagesAuthImagesOwnerReportEditing,
      title: 'Ahmed Samy',
      subtitle: 'please,ineed a help there....',
    ),
    SupportModel(
      img: Assets.imagesAuthImagesSalma,
      title: 'Salma Samy',
      subtitle: 'please,ineed a help there....',
    ),
    SupportModel(
      img: Assets.imagesAuthImagesSaly,
      title: 'Saly Samy',
      subtitle: 'please,ineed a help there....',
    ),
    SupportModel(
      img: Assets.imagesAuthImagesAhmed,
      title: 'Ahmed Samy',
      subtitle: 'please,ineed a help there....',
    ),
    SupportModel(
      img: Assets.imagesAuthImagesAnas,
      title: 'Annas Samy',
      subtitle: 'please,ineed a help there....',
    ),
    SupportModel(
      img: Assets.imagesAuthImagesSaad,
      title: 'Saad Samy',
      subtitle: 'please,ineed a help there....',
    ),
  ];

  final List<SupportModel> readed = [];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
              child: Container(
                width: double.infinity,
                height: 70,
                decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  color: MyColors.premiumColor,
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () {
                          updateIndex(0);
                        },
                        child: Text(
                          "Unreaded",
                          style: AppStyle.styleSemiBold25(context).copyWith(
                            fontWeight: FontWeight.w500,
                            fontSize: 27,
                            decoration: selectedIndex == 0
                                ? TextDecoration.underline
                                : null,
                            decorationColor: Colors.white,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 40,
                      ),
                      InkWell(
                        onTap: () {
                          updateIndex(1);
                        },
                        child: Text(
                          "Readed",
                          style: AppStyle.styleSemiBold25(context).copyWith(
                            fontSize: 27,
                            fontWeight: FontWeight.w500,
                            decoration: selectedIndex == 1
                                ? TextDecoration.underline
                                : null,
                            decorationColor: Colors.white,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            // const SizedBox(
            //   height: 20,
            // ),
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: selectedIndex == 0 ? unReaded.length : readed.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                  child: selectedIndex == 0
                      ? Container(
                          height: 100,
                          padding: MediaQuery.sizeOf(context).width < 800
                              ? EdgeInsets.zero
                              : const EdgeInsets.only(
                                  top: 15,
                                  bottom: 15,
                                  left: 15,
                                ),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.black26,
                                blurRadius: 4,
                                offset: Offset(0, 4),
                              )
                            ],
                          ),
                          child: Row(children: [
                            const SizedBox(
                              width: 5,
                            ),
                            ClipOval(
                              child: Image.asset(
                                unReaded[index].img,
                                width: MediaQuery.sizeOf(context).width < 800
                                    ? 60
                                    : 50,
                                height: MediaQuery.sizeOf(context).width < 800
                                    ? 60
                                    : 50,
                                fit: BoxFit.cover,
                              ),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Text(
                                unReaded[index].title,
                                style: AppStyle.styleRegular25(context),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),

                            const Spacer(),

                            SizedBox(
                              width: 100,
                              height: 50,
                              child: ElevatedButton(
                                onPressed: () {
                                  showSupportReplyDialog(
                                      context,
                                      unReaded[index].title,
                                      unReaded[index].subtitle,
                                      unReaded[index].img, () {
                                    setState(() {
                                      readed.add(unReaded[index]);
                                      unReaded.remove(unReaded[index]);
                                    });
                                  }, '', 'Send');
                                },
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.amber,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10))),
                                child: FittedBox(
                                  child: Text(
                                    'Reply',
                                    style: AppStyle.styleRegular25(context)
                                        .copyWith(
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),

                            const SizedBox(
                              width: 10,
                            )
                            // title: Text(
                          ]
                              // subtitle: Text(
                              //   unReaded[index].subtitle,
                              //   style: AppStyle.styleRegular25(context)
                              //       .copyWith(color: Colors.grey, fontSize: 20),
                              // ),

                              ),
                        )
                      : readed.isEmpty
                          ? null
                          : Container(
                              height: 100,
                              padding: MediaQuery.sizeOf(context).width < 800
                                  ? EdgeInsets.zero
                                  : const EdgeInsets.only(
                                      top: 15,
                                      bottom: 15,
                                      left: 15,
                                    ),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(12),
                                boxShadow: const [
                                  BoxShadow(
                                    color: Colors.black26,
                                    blurRadius: 4,
                                    offset: Offset(0, 4),
                                  )
                                ],
                              ),
                              child: Row(children: [
                                const SizedBox(
                                  width: 5,
                                ),
                                ClipOval(
                                  child: Image.asset(
                                    readed[index].img,
                                    width:
                                        MediaQuery.sizeOf(context).width < 800
                                            ? 60
                                            : 50,
                                    height:
                                        MediaQuery.sizeOf(context).width < 800
                                            ? 60
                                            : 50,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Expanded(
                                  child: Text(
                                    readed[index].title,
                                    style: AppStyle.styleRegular25(context),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),

                                const Spacer(),

                                SizedBox(
                                  width: 100,
                                  height: 50,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      showSupportReplyDialog(
                                          context,
                                          readed[index].title,
                                          readed[index].subtitle,
                                          readed[index].img,
                                          () {},
                                          'Thanks for sending us , we checked your problem and you can sign in by your email now 😊',
                                          'Change');
                                    },
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.amber,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10))),
                                    child: FittedBox(
                                      child: Text(
                                        'See',
                                        style: AppStyle.styleRegular25(context)
                                            .copyWith(
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),

                                const SizedBox(
                                  width: 10,
                                )
                                // title: Text(
                              ]
                                  // subtitle: Text(
                                  //   unReaded[index].subtitle,
                                  //   style: AppStyle.styleRegular25(context)
                                  //       .copyWith(color: Colors.grey, fontSize: 20),
                                  // ),

                                  ),
                            ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
