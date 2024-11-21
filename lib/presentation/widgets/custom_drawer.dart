import 'package:admin_panel_app/constants/app_images.dart';
import 'package:admin_panel_app/constants/app_style.dart';
import 'package:admin_panel_app/constants/colors.dart';
import 'package:admin_panel_app/constants/pages_name.dart';
import 'package:admin_panel_app/presentation/widgets/drawer_item_listview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * .7,
      color: Colors.white,
      child: CustomScrollView(
        slivers: [
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
          const DrawerItemListview(),
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
              child: GestureDetector(
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
              child: GestureDetector(
                onTap: () {},
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
              child: GestureDetector(
                  onTap: () {
                    Navigator.pushReplacementNamed(
                      context, addOwnerScreen
                    );
                  },
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child:
                          SvgPicture.asset(Assets.imagesAuthImagesAddButton))),
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
                      onPressed: () {},
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
