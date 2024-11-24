import 'package:admin_panel_app/constants/app_style.dart';
import 'package:admin_panel_app/core/logic/navigation_cubit/navigation_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SelectingOwnerOrHospital extends StatefulWidget {
  const SelectingOwnerOrHospital({super.key, required this.selectedIndex});

  final int selectedIndex;
  @override
  State<SelectingOwnerOrHospital> createState() =>
      _SelectingOwnerOrHospitalState();
}

class _SelectingOwnerOrHospitalState extends State<SelectingOwnerOrHospital> {
  // void updateIndex(int index) {
  //   setState(() {
  //     widget.s = index;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        height: 70,
        padding: const EdgeInsets.only(
          // top: 15,
          // bottom: 15,
          left: 40,
        ),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            boxShadow: const [
              BoxShadow(
                  color: Colors.black26, blurRadius: 4, offset: Offset(0, 4))
            ]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            InkWell(
                onTap: () {
                 context.read<NavigationCubit>().navigateTo(10);
                 
                },
                child: Text(
                  "Owner",
                  style: AppStyle.styleBold25(context).copyWith(
                      fontFamily: 'Roboto',
                      color: widget.selectedIndex == 0
                          ? Colors.black
                          : const Color(0xFF5C5858),
                      fontWeight: widget.selectedIndex == 0
                          ? FontWeight.w700
                          : FontWeight.w400),
                )),
            // const SizedBox(
            //   width: 20,
            // ),
            InkWell(
                onTap: () {
                   context.read<NavigationCubit>().navigateTo(11);
                },
                child: Text(
                  "Hospital",
                  style: AppStyle.styleBold25(context).copyWith(
                      fontFamily: 'Roboto',
                      color: widget.selectedIndex == 1
                          ? Colors.black
                          : const Color(0xFF5C5858),
                      fontWeight: widget.selectedIndex == 1
                          ? FontWeight.w700
                          : FontWeight.w400),
                )),
            const SizedBox(
              width: 200,
            ),
            Container(
              width: 480,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 5,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Material(
                borderRadius: BorderRadius.circular(15),
                color: Colors.white,
                child: TextFormField(
                  style: AppStyle.styleRegular16(context)
                      .copyWith(color: Colors.black),
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.done,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(
                      Icons.search,
                      color: Colors.black,
                    ),
                    hintText: "Search",
                    hintStyle: AppStyle.styleRegular16(context),
                    contentPadding: const EdgeInsets.all(8),
                    enabledBorder:
                        const OutlineInputBorder(borderSide: BorderSide.none),
                    focusedBorder:
                        const OutlineInputBorder(borderSide: BorderSide.none),
                  ),
                ),
              ),
            ),

            // const SizedBox(width: 20,),

            GestureDetector(
              onTap: () {},
              child: Row(
                children: [
                  const Icon(
                    Icons.download,
                    size: 16,
                    color: Color(0xFF5C5858),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    "Download",
                    style: AppStyle.styleRegular16(context)
                        .copyWith(fontFamily: "Roboto"),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
