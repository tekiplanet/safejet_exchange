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
                  style: theme.textTheme.headlineMedium,
                ),
              ],
            ),
            Row(
              children: [
                _buildActionButton(
                  icon: Icons.notifications_rounded,
                  onTap: onNotificationTap,
                  hasNotification: true,
                  isDark: isDark,
                ),
                const SizedBox(width: 12),
                _buildActionButton(
                  icon: themeProvider.isDarkMode 
                    ? Icons.light_mode_rounded 
                    : Icons.dark_mode_rounded,
                  onTap: onThemeToggle,
                  isDark: isDark,
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
    required bool isDark,
    VoidCallback? onTap,
    bool hasNotification = false,
  }) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            color: isDark 
                ? SafeJetColors.primaryAccent.withOpacity(0.1)
                : SafeJetColors.lightCardBackground,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: isDark
                  ? SafeJetColors.primaryAccent.withOpacity(0.2)
                  : SafeJetColors.lightCardBorder,
            ),
          ),
          child: IconButton(
            icon: Icon(icon),
            color: isDark ? Colors.white : SafeJetColors.lightText,
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