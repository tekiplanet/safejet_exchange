import 'package:flutter/material.dart';
import '../config/theme/colors.dart';

class CustomBottomNav extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const CustomBottomNav({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            SafeJetColors.primaryBackground.withOpacity(0.9),
            SafeJetColors.primaryBackground,
          ],
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 20,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: Stack(
        children: [
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              height: 80,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildNavItem(0, Icons.candlestick_chart_rounded, Icons.candlestick_chart_rounded, 'Markets'),
                  _buildNavItem(1, Icons.sync_alt_rounded, Icons.sync_alt_rounded, 'Trade'),
                  const SizedBox(width: 60),
                  _buildNavItem(3, Icons.account_balance_wallet_rounded, Icons.account_balance_wallet_rounded, 'Wallets'),
                  _buildNavItem(4, Icons.person_rounded, Icons.person_rounded, 'Profile'),
                ],
              ),
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: GestureDetector(
              onTap: () => onTap(2),
              child: Center(
                child: Container(
                  width: 58,
                  height: 58,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        SafeJetColors.secondaryHighlight,
                        SafeJetColors.secondaryHighlight.withOpacity(0.8),
                      ],
                    ),
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: SafeJetColors.secondaryHighlight.withOpacity(0.3),
                        blurRadius: 12,
                        spreadRadius: 2,
                        offset: const Offset(0, -2),
                      ),
                    ],
                  ),
                  child: Icon(
                    currentIndex == 2 ? Icons.group_rounded : Icons.group_outlined,
                    color: Colors.black,
                    size: 26,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem(int index, IconData icon, IconData activeIcon, String label) {
    final isSelected = currentIndex == index;
    return Expanded(
      child: GestureDetector(
        onTap: () => onTap(index),
        behavior: HitTestBehavior.opaque,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: isSelected ? SafeJetColors.primaryAccent.withOpacity(0.1) : Colors.transparent,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(
                isSelected ? activeIcon : icon,
                color: isSelected ? SafeJetColors.secondaryHighlight : Colors.grey[600],
                size: 26,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                color: isSelected ? SafeJetColors.secondaryHighlight : Colors.grey[600],
                fontSize: 12,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
} 