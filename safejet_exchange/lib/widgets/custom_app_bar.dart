import 'package:flutter/material.dart';
import '../config/theme/colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback? onNotificationTap;
  final VoidCallback? onThemeToggle;
  final String? title;

  const CustomAppBar({
    super.key,
    this.onNotificationTap,
    this.onThemeToggle,
    this.title,
  });

  @override
  Size get preferredSize => const Size.fromHeight(70);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: SafeJetColors.primaryBackground,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 20,
          ),
        ],
      ),
      child: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        SafeJetColors.secondaryHighlight,
                        SafeJetColors.secondaryHighlight.withOpacity(0.8),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: const Icon(
                    Icons.rocket_launch_rounded,
                    color: Colors.black,
                    size: 20,
                  ),
                ),
                const SizedBox(width: 12),
                Text(
                  title ?? 'SafeJet',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                    letterSpacing: -0.5,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                _buildActionButton(
                  icon: Icons.notifications_rounded,
                  onTap: onNotificationTap,
                  hasNotification: true,
                ),
                const SizedBox(width: 12),
                _buildActionButton(
                  icon: Icons.dark_mode_rounded,
                  onTap: onThemeToggle,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActionButton({
    required IconData icon,
    VoidCallback? onTap,
    bool hasNotification = false,
  }) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            color: SafeJetColors.primaryAccent.withOpacity(0.1),
            borderRadius: BorderRadius.circular(12),
          ),
          child: IconButton(
            icon: Icon(icon),
            color: Colors.white,
            iconSize: 24,
            onPressed: onTap,
          ),
        ),
        if (hasNotification)
          Positioned(
            right: 8,
            top: 8,
            child: Container(
              width: 8,
              height: 8,
              decoration: BoxDecoration(
                color: SafeJetColors.secondaryHighlight,
                shape: BoxShape.circle,
              ),
            ),
          ),
      ],
    );
  }
} 