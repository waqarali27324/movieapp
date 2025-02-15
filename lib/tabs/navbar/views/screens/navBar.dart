import 'package:flutter/material.dart';
import 'package:sample_app/routes/routes.dart';
import 'package:sample_app/tabs/watch/views/screens/watch_movies_screen.dart';
import 'package:sample_app/tabs/watch/views/widgets/text_widget.dart';
import 'package:sample_app/utils/asset_paths/assets_icons.dart';
import 'package:sample_app/utils/theme/colors.dart';
import 'package:google_fonts/google_fonts.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int currentPageIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      backgroundColor: Colors.white,
      toolbarHeight: 111 - 44,
      automaticallyImplyLeading: false, 
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomTextWidget(
            text: 'Watch',
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: AppColors.blackColor,
          ),
          IconButton(
            icon: Icon(Icons.search, color: AppColors.blackColor),
            onPressed: () {
              Routes.toSearchView();
            },
          ),
    ],
  ),
),

      body: <Widget>[
        // Dashboard page
        const SizedBox(),

        // Watch page
        MovieListScreen(),

        // Media Library page
        const SizedBox(),

        // More page
        const SizedBox(),
      ][currentPageIndex],

      // Bottom Navigation Bar with Circular Corners
      bottomNavigationBar: 
      
      
      
      Material(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
        decoration: BoxDecoration(
          color: AppColors.navBarColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(27),
            topRight: Radius.circular(27),
          ),
        ),
        clipBehavior: Clip.antiAlias,
        child: Theme(
          data: Theme.of(context).copyWith(
            splashColor: Colors.transparent,
          ),
          child: BottomNavigationBar(
            elevation: 0,
            type: BottomNavigationBarType.fixed,
            // onTap: onTap,
            backgroundColor: Colors.transparent,
            showUnselectedLabels: true,
            showSelectedLabels: true,
            selectedItemColor: AppColors.whiteColor,
            unselectedItemColor: AppColors.greyColor,
            unselectedLabelStyle: GoogleFonts.poppins(
              fontSize: 10,
              fontWeight: FontWeight.w700,
            ),
            selectedLabelStyle: GoogleFonts.poppins(
              fontSize: 10,
              fontWeight: FontWeight.w700,
            ),
            items:  <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Column(
                    children: [
                      GayaSvgAsset('assets/svgs/dashboardIcon.svg', height: 18, width: 18),
                      SizedBox(height: 6),
                    ],
                  ),
                  label: 'Dashboard',
                ),
                BottomNavigationBarItem(
                  icon: Column(
                    children: [
                      GayaSvgAsset(
                        'assets/svgs/watchIcon.svg',
                        height: 18,
                        width: 18,
                      ),
                      SizedBox(height: 6),
                    ],
                  ),
                  label: 'Watch',
                ),
                BottomNavigationBarItem(
                  icon: Column(
                    children: [
                      GayaSvgAsset(
                        'assets/svgs/mediaIcon.svg',
                        height: 18,
                        width: 18,
                      ),
                      SizedBox(height: 6),
                    ],
                  ),
                  label: 'Media Library',
                ),
                BottomNavigationBarItem(
                  icon: Column(
                    children: [
                      GayaSvgAsset(
                        'assets/svgs/moreIcon.svg',
                        height: 18,
                        width: 18,
                        color: AppColors.greyColor ,
                      ),
                      SizedBox(height: 6),
                    ],
                  ),
                  label: 'More',
                ),
              ],
            currentIndex: 1,
          ),
        ),
      ),
    ),
  
  
  
    );
  }
}
