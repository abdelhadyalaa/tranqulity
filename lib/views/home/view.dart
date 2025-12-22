import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tranqulity/core/logic/helper_methods.dart';
import 'package:tranqulity/views/home/pages/chats.dart';
import 'package:tranqulity/views/home/pages/new_chat.dart';
import 'package:tranqulity/views/home/pages/profile.dart';
import 'package:tranqulity/views/home/pages/quotes.dart';
import '../../core/ui/app_drawar.dart';
import '../../core/ui/app_image.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final list = [
    _Model("chats.svg", ChatPage(), "Chats", "Chats"),
    _Model("quotes.svg", QuotesPage(), "Quotes", "Quotes"),
    _Model("profile.svg", ProfilePage(), "Profile", "Edit Profile"),
  ];

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawerBarrierDismissible: true,
      drawerEnableOpenDragGesture: true,
      drawerEdgeDragWidth: 30,
      drawerScrimColor: Colors.black.withOpacity(0.3),
      drawer: DrawerItem(),

      appBar: AppBar(
        title: Text(
          list[currentIndex].title,
          style: TextStyle(fontWeight: FontWeight.w700, fontSize: 24),
        ),
      ),
      body: list[currentIndex].pages,
      floatingActionButton: GestureDetector(
        onTap: () {
          goTo(page: NewChat());
        },

        child: Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.circular(16.r),
          ),
          child: AppImage(image: "new_chat.svg"),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,

      bottomNavigationBar: Container(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        decoration: BoxDecoration(color: Theme.of(context).primaryColor),
        child: BottomNavigationBar(
          onTap: (value) {
            currentIndex = value;
            setState(() {});
          },
          currentIndex: currentIndex,
          selectedFontSize: 12,
          unselectedFontSize: 10,
          backgroundColor: Colors.transparent,
          elevation: 0,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.grey,
          items: List.generate(
            list.length,
            (index) => BottomNavigationBarItem(
              icon: AppImage(
                image: list[index].icon,
                color: currentIndex == index ? Colors.white : Colors.grey,
              ),
              label: list[index].name,
            ),
          ),
        ),
      ),
    );
  }
}

class _Model {
  final String icon;
  final String name;
  final String title;
  final Widget pages;

  _Model(this.icon, this.pages, this.name, this.title);
}
