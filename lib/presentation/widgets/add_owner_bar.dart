import 'package:admin_panel_app/constants/app_style.dart';
import 'package:admin_panel_app/constants/colors.dart';
import 'package:admin_panel_app/presentation/models/add_owner_model.dart';
import 'package:flutter/material.dart';

class AddOwnerBar extends StatefulWidget {
  const AddOwnerBar({super.key, required this.index});

  final int index;
  @override
  State<AddOwnerBar> createState() => _AddOwnerBarState();
}

class _AddOwnerBarState extends State<AddOwnerBar> {
  final List<AddOwnerModel> items = [
    AddOwnerModel(number: '01', title: 'Email or phone', subtitle: 'Number'),
    AddOwnerModel(number: '02', title: 'OTP ', subtitle: 'validition'),
    AddOwnerModel(number: '03', title: 'User ', subtitle: 'Information'),
    AddOwnerModel(number: '04', title: 'ID', subtitle: 'Board'),
     
  ];

  // int index = 0;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  items[0].number,
                  style: AppStyle.styleRegular25(context)
                      .copyWith(fontFamily: 'Inter', color: Colors.black),
                ),
                const SizedBox(
                  width: 5,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      items[0].title,
                      style: AppStyle.styleRegular16(context).copyWith(
                          fontFamily: 'Roboto',
                          color: MyColors.premiumColor,
                          fontSize: 15),
                    ),
                    Text(
                      items[0].subtitle,
                      style: AppStyle.styleRegular16(context).copyWith(
                          fontFamily: 'Roboto', color: MyColors.premiumColor),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.15,
              child: Row(
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration: const ShapeDecoration(
                      shape: OvalBorder(),
                      color: MyColors.premiumColor,
                    ),
                    child: widget.index > 0
                        ? Icon(
                            Icons.check,
                            color: Colors.white,
                          )
                        : null,
                  ),
                  const SizedBox(width: 1),
                  Expanded(
                    child: Container(
                      height: 2.0,
                      color: widget.index > 0
                          ? MyColors.premiumColor
                          : const Color(0xFFD9D9D9),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  items[1].number,
                  style: AppStyle.styleRegular25(context)
                      .copyWith(fontFamily: 'Inter', color: Colors.black),
                ),
                const SizedBox(
                  width: 5,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      items[1].title,
                      style: AppStyle.styleRegular16(context)
                          .copyWith(fontFamily: 'Roboto', fontSize: 15,
                          color: widget.index >=1 ? MyColors.premiumColor : null
                          ),
                    ),
                    Text(
                      items[1].subtitle,
                      style: AppStyle.styleRegular16(context).copyWith(
                        fontFamily: 'Roboto',
                        color: widget.index >=1 ? MyColors.premiumColor : null
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width *0.15,
              child: Row(
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration: ShapeDecoration(
                      shape: const OvalBorder(),
                      color:
                          widget.index > 0 ? MyColors.premiumColor : Color(0xFFD9D9D9),
                    ),
                    child: widget.index > 1
                        ? Icon(
                            Icons.check,
                            color: Colors.white,
                          )
                        : null,
                  ),
                  const SizedBox(width: 1),
                  Expanded(
                    child: Container(
                      height: 2.0,
                      color: widget.index > 1
                          ? MyColors.premiumColor
                          : const Color(0xFFD9D9D9),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  items[2].number,
                  style: AppStyle.styleRegular25(context)
                      .copyWith(fontFamily: 'Inter', color: Colors.black),
                ),
                const SizedBox(
                  width: 5,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      items[2].title,
                      style: AppStyle.styleRegular16(context)
                          .copyWith(fontFamily: 'Roboto', fontSize: 15,
                          color: widget.index >=2 ? MyColors.premiumColor : null
                          ),
                    ),
                    Text(
                      items[2].subtitle,
                      style: AppStyle.styleRegular16(context).copyWith(
                        fontFamily: 'Roboto',
                        color: widget.index >=2 ? MyColors.premiumColor : null
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.15,
              child: Row(
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration: ShapeDecoration(
                      shape: const OvalBorder(),
                      color:
                          widget.index > 1 ? MyColors.premiumColor : Color(0xFFD9D9D9),
                    ),
                    child: widget.index > 2
                        ? const Icon(
                            Icons.check,
                            color: Colors.white,
                          )
                        : null,
                  ),
                  const SizedBox(width: 1),
                  Expanded(
                    child: Container(
                      height: 2.0,
                      color: widget.index >= 2
                          ? MyColors.premiumColor
                          : const Color(0xFFD9D9D9),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  items[3].number,
                  style: AppStyle.styleRegular25(context)
                      .copyWith(fontFamily: 'Inter', color: Colors.black,),
                ),
                const SizedBox(
                  width: 5,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      items[3].title,
                      style: AppStyle.styleRegular16(context)
                          .copyWith(fontFamily: 'Roboto', fontSize: 15,
                          color: widget.index >=3 ? MyColors.premiumColor : null
                          ),
                    ),
                    Text(
                      items[3].subtitle,
                      style: AppStyle.styleRegular16(context).copyWith(
                        fontFamily: 'Roboto',
                        color: widget.index >=3 ? MyColors.premiumColor : null
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Row(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: ShapeDecoration(
                    shape: const OvalBorder(),
                    color: widget.index >= 3
                        ? MyColors.premiumColor
                        : const Color(0xFFD9D9D9),
                  ),
                  child: widget.index > 3
                      ? const Icon(
                          Icons.check,
                          color: Colors.white,
                        )
                      : null,
                ),
                // const SizedBox(width: 1),
                // Expanded(
                //   child: Container(
                //     height: 2.0,
                //     color: widget.index > 3
                //         ? MyColors.premiumColor
                //         : const Color(0xFFD9D9D9),
                //   ),
                // ),
              ],
            )
          ],
        ),
        // Column(
        //   crossAxisAlignment: CrossAxisAlignment.start,
        //   children: [
        //     Row(
        //       children: [
        //         Text(
        //           items[4].number,
        //           style: AppStyle.styleRegular25(context)
        //               .copyWith(fontFamily: 'Inter', color: Colors.black),
        //         ),
        //         const SizedBox(
        //           width: 5,
        //         ),
        //         Column(
        //           crossAxisAlignment: CrossAxisAlignment.start,
        //           children: [
        //             Text(
        //               items[4].title,
        //               style: AppStyle.styleRegular16(context)
        //                   .copyWith(fontFamily: 'Roboto', fontSize: 15,
        //                   color: widget.index >=4 ? MyColors.premiumColor : null
        //                   ),
        //             ),
        //             Text(
        //               items[4].subtitle,
        //               style: AppStyle.styleRegular16(context).copyWith(
        //                 fontFamily: 'Roboto',
        //                 color: widget.index >=4 ? MyColors.premiumColor : null
        //               ),
        //             ),
        //           ],
        //         ),
        //       ],
        //     ),
        //     Row(
        //       children: [
        //         Container(
        //           width: 40,
        //           height: 40,
        //           decoration: ShapeDecoration(
        //             shape: const OvalBorder(),
        //             color:
        //                 widget.index >= 4 ? MyColors.premiumColor : Color(0xFFD9D9D9),
        //           ),
        //           child: widget.index > 4
        //               ? const Icon(
        //                   Icons.check,
        //                   color: Colors.white,
        //                 )
        //               : null,
        //         ),
        //         const SizedBox(width: 1),
        //         // Expanded(
        //         //   child: Container(
        //         //     height: 2.0,
        //         //     color: index >0? MyColors.premiumColor : const Color(0xFFD9D9D9),
        //         //   ),
        //         // ),
        //       ],
        //     )
        //   ],
        // ),
      ],
    );
  }
}
