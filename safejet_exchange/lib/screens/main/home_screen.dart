import 'package:flutter/material.dart';
import '../../config/theme/colors.dart';
import '../../widgets/custom_app_bar.dart';
import '../../widgets/custom_bottom_nav.dart';
import 'tabs/markets_tab.dart';
import 'tabs/trade_tab.dart';
import 'tabs/p2p_tab.dart';
import 'tabs/wallets_tab.dart';
import 'tabs/profile_tab.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const MarketsTab(),
    const TradeTab(),
    const P2PTab(),
    const WalletsTab(),
    const ProfileTab(),
  ];

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        extendBody: true,
        extendBodyBehindAppBar: true,
        backgroundColor: Colors.transparent,
        appBar: CustomAppBar(
          onNotificationTap: () {
            // TODO: Show notifications
          },
          onThemeToggle: () {
            // TODO: Toggle theme
          },
        ),
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                SafeJetColors.primaryBackground,
                SafeJetColors.secondaryBackground,
              ],
            ),
          ),
          child: _screens[_currentIndex],
        ),
        bottomNavigationBar: CustomBottomNav(
          currentIndex: _currentIndex,
          onTap: (index) => setState(() => _currentIndex = index),
        ),
      ),
    );
  }
} 