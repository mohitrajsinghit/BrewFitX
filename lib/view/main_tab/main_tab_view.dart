// import 'package:brewfitx/common/colo_extension.dart';
// import 'package:brewfitx/common_widget/tab_button.dart';
// import 'package:brewfitx/view/home/blank_view.dart';
// import 'package:brewfitx/view/home/home_view.dart';
// import 'package:flutter/material.dart';

// class MainTabView extends StatefulWidget {
//   const MainTabView({super.key});

//   @override
//   State<MainTabView> createState() => _MainTabViewState();
// }

// class _MainTabViewState extends State<MainTabView> {
//   int selectTab = 0;

//   final PageStorageBucket pageBucket = PageStorageBucket();
//   Widget currentTab = const HomeView();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: TColor.white,
//       body: PageStorage(bucket: pageBucket, child: currentTab),
//       floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
//       floatingActionButton: SizedBox(
//         width: 70,
//         height: 70,
//         child: InkWell(
//           onTap: () {},
//           child: Container(
//             width: 65,
//             height: 65,
//             decoration: BoxDecoration(
//                 gradient: LinearGradient(
//                   colors: TColor.primaryG,
//                 ),
//                 borderRadius: BorderRadius.circular(35),
//                 boxShadow: const [
//                   BoxShadow(
//                     color: Colors.black12,
//                     blurRadius: 2,
//                   )
//                 ]),
//             child: Icon(
//               Icons.search,
//               color: TColor.white,
//               size: 35,
//             ),
//           ),
//         ),
//       ),
//       bottomNavigationBar: BottomAppBar(
//           child: Container(
//         decoration: BoxDecoration(color: TColor.white, boxShadow: const [
//           BoxShadow(color: Colors.black12, blurRadius: 2, offset: Offset(0, -2))
//         ]),
//         height: kToolbarHeight,
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceAround,
//           children: [
//             TabButton(
//                 icon: "assets/img/home_tab.png",
//                 selectIcon: "assets/img/home_tab_select.png",
//                 isActive: selectTab == 0,
//                 onTap: () {
//                   selectTab = 0;
//                   currentTab = const HomeView();
//                   if (mounted) {
//                     setState(() {});
//                   }
//                 }),
//             TabButton(
//                 icon: "assets/img/activity_tab.png",
//                 selectIcon: "assets/img/activity_tab_select.png",
//                 isActive: selectTab == 1,
//                 onTap: () {
//                   selectTab = 1;
//                   currentTab = const BlankView();
//                   if (mounted) {
//                     setState(() {});
//                   }
//                 }),
//             const SizedBox(
//               width: 40,
//             ),
//             TabButton(
//                 icon: "assets/img/camera_tab.png",
//                 selectIcon: "assets/img/camera_tab_select.png",
//                 isActive: selectTab == 2,
//                 onTap: () {
//                   selectTab = 2;
//                   currentTab = const BlankView();
//                   if (mounted) {
//                     setState(() {});
//                   }
//                 }),
//             TabButton(
//                 icon: "assets/img/profile_tab.png",
//                 selectIcon: "assets/img/profile_tab_select.png",
//                 isActive: selectTab == 3,
//                 onTap: () {
//                   selectTab = 3;
//                   currentTab = const BlankView();
//                   if (mounted) {
//                     setState(() {});
//                   }
//                 }),
//           ],
//         ),
//       )),
//     );
//   }
// }
import 'package:brewfitx/common/colo_extension.dart';
import 'package:brewfitx/common_widget/tab_button.dart';
import 'package:brewfitx/view/home/blank_view.dart';
import 'package:brewfitx/view/home/home_view.dart';
import 'package:flutter/material.dart';

class MainTabView extends StatefulWidget {
  final String? firstName;

  const MainTabView({Key? key, this.firstName}) : super(key: key);

  @override
  State<MainTabView> createState() => _MainTabViewState();
}

class _MainTabViewState extends State<MainTabView> {
  int _selectedIndex = 0;

  final PageStorageBucket _pageBucket = PageStorageBucket();
  late List<Widget> _pages;

  @override
  void initState() {
    super.initState();
    _pages = [
      HomeView(firstName: widget.firstName),
      const BlankView(),
      const BlankView(),
      const BlankView(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TColor.white,
      body: PageStorage(bucket: _pageBucket, child: _pages[_selectedIndex]),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          decoration: BoxDecoration(
            color: TColor.white,
            boxShadow: const [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 2,
                offset: Offset(0, -2),
              ),
            ],
          ),
          height: kToolbarHeight,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(
              _pages.length,
              (index) => TabButton(
                icon: _getTabIcon(index),
                selectIcon: _getTabSelectIcon(index),
                isActive: index == _selectedIndex,
                onTap: () => _onTabTapped(index),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _onTabTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  String _getTabIcon(int index) {
    switch (index) {
      case 0:
        return "assets/img/home_tab.png";
      case 1:
        return "assets/img/activity_tab.png";
      case 2:
        return "assets/img/camera_tab.png";
      case 3:
        return "assets/img/profile_tab.png";
      default:
        return "";
    }
  }

  String _getTabSelectIcon(int index) {
    switch (index) {
      case 0:
        return "assets/img/home_tab_select.png";
      case 1:
        return "assets/img/activity_tab_select.png";
      case 2:
        return "assets/img/camera_tab_select.png";
      case 3:
        return "assets/img/profile_tab_select.png";
      default:
        return "";
    }
  }
}
