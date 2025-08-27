import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../controllers/login_controller.dart';
import '../../routes/app_pages.dart';
import '../../utilities/styles.dart';
import '../../widgets/logout_confirmation_dialog.dart';
import 'business_idea_screen.dart';
import 'login_screen.dart';
import 'plans_screen.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // State is now managed by GetX observables (.obs)
    final LoginController loginController = Get.put(LoginController());
    final selectedIndex = 0.obs;

    final List<Widget> screens = [
      const DashboardContent(),
      const BusinessIdeasScreen(),
      const PlansScreen(),
      const Center(child: Text("Support Screen")),
    ];

    // The Obx widget will automatically rebuild when selectedIndex changes
    return Obx(() {
      return Scaffold(
        backgroundColor: Colors.white,
        key: GlobalKey<ScaffoldState>(),
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 1,
          iconTheme: const IconThemeData(color: AppStyles.redColor),
        ),
        drawer: SizedBox(
          width: 280,
          child: _buildDrawer(context, selectedIndex, loginController),
        ),
        body: screens[selectedIndex.value],
      );
    });
  }

  Widget _buildDrawer(BuildContext context, RxInt selectedIndex, LoginController loginController) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: AppStyles.skyBlueColor.withOpacity(0.5),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/your_logo.png',
                  height: 60,
                  errorBuilder: (context, error, stackTrace) {
                    return const Text("Smart Investor Deck", style: TextStyle(fontWeight: FontWeight.bold));
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.menu, color: AppStyles.redColor),
                  onPressed: () {
                    Get.back();
                  },
                ),
              ],
            ),
          ),
          _buildDrawerItem(
            icon: Icons.dashboard_outlined,
            text: "Dashboard",
            isSelected: selectedIndex.value == 0,
            onTap: () => selectedIndex.value = 0,
          ),
          _buildDrawerItem(
            icon: Icons.lightbulb_outline,
            text: "Business Ideas",
            isSelected: selectedIndex.value == 1,
            onTap: () => selectedIndex.value = 1,
          ),
          _buildDrawerItem(
            icon: Icons.description_outlined,
            text: "Plans",
            isSelected: selectedIndex.value == 2,
            onTap: () => selectedIndex.value = 2,
          ),
          _buildDrawerItem(
            icon: Icons.support_agent_outlined,
            text: "Support",
            isSelected: selectedIndex.value == 3,
            onTap: () => selectedIndex.value = 3,
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: _buildProfileMenu(context, loginController),
          ),
        ],
      ),
    );
  }

  Widget _buildDrawerItem({
    required IconData icon,
    required String text,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: isSelected ? AppStyles.redColor : Colors.transparent,
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListTile(
        leading: Icon(icon, color: isSelected ? Colors.white : AppStyles.lightTextColor),
        title: Text(
          text,
          style: AppStyles.label.copyWith(
            color: isSelected ? Colors.white : AppStyles.darkTextColor,
          ),
        ),
        onTap: () {
          onTap();
          Get.back();
        },
      ),
    );
  }

  Widget _buildProfileMenu(BuildContext context, LoginController loginController) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: AppStyles.redColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          const CircleAvatar(
            radius: 16,
            backgroundImage: NetworkImage('https://placehold.co/100x100/png'),
          ),
          const SizedBox(width: 8),
          Flexible(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Vardhan",
                  style: AppStyles.label.copyWith(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.white),
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  "vardhan.k@example.com",
                  style: AppStyles.subtitle.copyWith(fontSize: 10, color: Colors.white70),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          PopupMenuButton<String>(
            onSelected: (value) {
              if (value == 'logout') {
                showLogoutConfirmationDialog(context);
              } else if (value == 'profile') {
                Get.toNamed(AppPages.accountSettings);
              }
            },
            icon: const Icon(Icons.more_vert, color: Colors.white),
            itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
              PopupMenuItem<String>(
                value: 'profile',
                child: Text('My Profile', style: AppStyles.label.copyWith(color: AppStyles.darkTextColor)),
              ),
              PopupMenuItem<String>(
                value: 'billing',
                child: Text('Billing', style: AppStyles.label.copyWith(color: AppStyles.darkTextColor)),
              ),
              PopupMenuItem<String>(
                value: 'logout',
                child: Text('Logout', style: AppStyles.label.copyWith(color: AppStyles.darkTextColor)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class DashboardContent extends StatelessWidget {
  const DashboardContent({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Welcome to SmartInvestorDeck, Vardhan",
            style: GoogleFonts.poppins(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: AppStyles.darkTextColor,
            ),
          ),
          const SizedBox(height: 24),
          _buildNewProjectCard(),
        ],
      ),
    );
  }

  Widget _buildNewProjectCard() {
    return DottedBorder(
      color: AppStyles.defaultBorderColor,
      strokeWidth: 1.5,
      dashPattern: const [6, 4],
      borderType: BorderType.RRect,
      radius: const Radius.circular(12),
      child: Container(
        width: 200,
        height: 120,
        decoration: BoxDecoration(
          color: AppStyles.skyBlueColor.withOpacity(0.5),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircleAvatar(
              radius: 18,
              backgroundColor: AppStyles.blueColor,
              child: Icon(Icons.add, color: Colors.white, size: 20),
            ),
            const SizedBox(height: 8),
            Text("New Project", style: AppStyles.label.copyWith(fontWeight: FontWeight.bold, fontSize: 12)),
            const SizedBox(height: 4),
            Text("Start building something amazing", style: AppStyles.subtitle.copyWith(fontSize: 10)),
          ],
        ),
      ),
    );
  }
}
