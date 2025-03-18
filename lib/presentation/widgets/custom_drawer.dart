import 'package:admin_panel_app/constants/app_images.dart';
import 'package:admin_panel_app/constants/app_style.dart';
import 'package:admin_panel_app/constants/colors.dart';
import 'package:admin_panel_app/core/logic/navigation_cubit/navigation_cubit.dart';
import 'package:admin_panel_app/presentation/dash_board/overview.dart';
import 'package:admin_panel_app/presentation/widgets/add_hospital.dart';
import 'package:admin_panel_app/presentation/widgets/add_owner.dart';
import 'package:admin_panel_app/presentation/widgets/dialog_contact_us.dart';
import 'package:admin_panel_app/presentation/widgets/dialog_logout.dart';
import 'package:admin_panel_app/presentation/widgets/drawer_item_listview.dart';
import 'package:admin_panel_app/routing/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer(
      {super.key,
      required this.activeIndex,
      required this.onTap,
      this.isOwner});

  final Function(int) onTap;
  final int activeIndex;
  final String? isOwner;
  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  late int activeIndex = widget.activeIndex;
  bool isActiveAddButton = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width < 1201
          ? MediaQuery.of(context).size.width * 0.5
          : MediaQuery.of(context).size.width * .7,
      color: Colors.white,
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: SizedBox(
              height: MediaQuery.sizeOf(context).width < 800 ? 50 : 0,
            ),
          ),
          SliverToBoxAdapter(
            child: Align(
                alignment: AlignmentDirectional.centerStart,
                child: Row(
                  children: [
                    Image.asset(Assets.imagesAuthImagesLogooooo),
                    Text(
                      "SATARS",
                      style: AppStyle.styleRegular25(context)
                          .copyWith(fontSize: 30),
                    )
                  ],
                )),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 8,
            ),
          ),
          DrawerItemListview(
            activeIndex: activeIndex,
            onTap: widget.onTap,
            isOwner: widget.isOwner,
          ),
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 50,
            ),
          ),
          SliverToBoxAdapter(
              child: Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Align(
                alignment: AlignmentDirectional.centerStart,
                child: SvgPicture.asset(Assets.imagesAuthImagesLineDrawer)),
          )),
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 30,
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(left: 15),
              child: InkWell(
                onTap: () {},
                child: Row(
                  children: [
                    SvgPicture.asset(Assets.imagesAuthImagesSettingsDrawer),
                    const SizedBox(
                      width: 15,
                    ),
                    Text(
                      "Settings",
                      style: AppStyle.styleRegular25(context),
                    )
                  ],
                ),
              ),
            ),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 20,
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(left: 15),
              child: InkWell(
                onTap: () {
                  showContactUsDialog(context);
                },
                child: Row(
                  children: [
                    SvgPicture.asset(Assets.imagesAuthImagesContactUsDrawer),
                    const SizedBox(
                      width: 15,
                    ),
                    Text(
                      "Contact us",
                      style: AppStyle.styleRegular25(context),
                    )
                  ],
                ),
              ),
            ),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 50,
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(left: 15),
              child: isActiveAddButton == true
                  ? Row(
                      children: [
                        InkWell(
                            onTap: () {
                              //go to overview
                              // context.read<NavigationCubit>().navigateTo(0);
                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: (context) => const Overview()));
                              isActiveAddButton = false;
                              setState(() {});
                            },
                            child: SvgPicture.asset(
                                Assets.imagesAuthImagesAddButton)),
                        InkWell(
                          onTap: () {
                            //go to owner page
                            // context.read<NavigationCubit>().navigateTo(4);
                            // Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: (context) => const AddOwner()));
                            GoRouter.of(context)
                                .pushReplacementNamed(AppRouter.addOwner);
                            isActiveAddButton = false;
                            setState(() {});
                          },
                          child: SvgPicture.asset(
                              Assets.imagesAuthImagesIconOwnerSidebar),
                        ),
                        InkWell(
                          onTap: () {
                            //go to owner page
                            // context.read<NavigationCubit>().navigateTo(5);
                            // Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: (context) => const AddHospital()));
                            GoRouter.of(context)
                                .pushReplacementNamed(AppRouter.addHospital);
                            isActiveAddButton = false;
                            setState(() {});
                          },
                          child: SvgPicture.asset(
                              Assets.imagesAuthImagesIconHospitalSidebar),
                        )
                      ],
                    )
                  : InkWell(
                      onTap: () {
                        isActiveAddButton = true;
                        setState(() {});
                      },
                      child: Align(
                          alignment: Alignment.centerLeft,
                          child: SvgPicture.asset(
                              Assets.imagesAuthImagesAddButton)),
                    ),
            ),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 30,
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Align(
                alignment: Alignment.centerLeft,
                child: SizedBox(
                  width: 150,
                  height: 47,
                  child: ElevatedButton(
                      onPressed: () {
                        showLogOutDialog(context);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: MyColors.premiumColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                      ),
                      child: Row(
                        children: [
                          SvgPicture.asset(Assets.imagesAuthImagesLogoutDrawer),
                          const SizedBox(width: 10),
                          Text(
                            'Logout',
                            style: AppStyle.styleBold17(context),
                          )
                        ],
                      )),
                ),
              ),
            ),
          ),
          const SliverToBoxAdapter(
              child: SizedBox(
            height: 48,
          ))
        ],
      ),
    );
  }
}
