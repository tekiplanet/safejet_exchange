import 'package:flutter/material.dart';
import '../config/theme/colors.dart';
import 'package:provider/provider.dart';
import '../config/theme/theme_provider.dart';

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
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final themeProvider = Provider.of<ThemeProvider>(context);
    
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: isDark 
            ? SafeJetColors.primaryBackground
            : SafeJetColors.lightBackground,
      ),
      child: SafeArea(
        child: SizedBox(
          height: 56,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Logo Section
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: SafeJetColors.secondaryHighlight,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Icon(
                      Icons.rocket_launch_rounded,
                      color: Colors.black,
                      size: 20,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Text(
                    'SafeJet',
                    style: theme.textTheme.titleLarge?.copyWith(
                      color: isDark ? Colors.white : SafeJetColors.lightText,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              
              // Action Buttons
              Row(
                children: [
                  _buildActionButton(
                    icon: Icons.notifications_outlined,
                    onTap: onNotificationTap,
                    hasNotification: true,
                    isDark: isDark,
                  ),
                  const SizedBox(width: 8),
                  _buildActionButton(
                    icon: isDark 
                        ? Icons.light_mode_outlined
                        : Icons.dark_mode_outlined,
                    onTap: onThemeToggle,
                    isDark: isDark,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildActionButton({
    required IconData icon,
    required bool isDark,
    VoidCallback? onTap,
    bool hasNotification = false,
  }) {
    return Stack(
      children: [
        IconButton(
          icon: Icon(icon),
          color: isDark ? Colors.white : SafeJetColors.lightText,
          iconSize: 24,
          onPressed: onTap,
        ),
        if (hasNotification)
          Positioned(
            right: 8,
            top: 8,
            child: Container(
              width: 8,
              height: 8,
              decoration: const BoxDecoration(
                color: SafeJetColors.secondaryHighlight,
                shape: BoxShape.circle,
              ),
            ),
          ),
      ],
    );
  }
} 