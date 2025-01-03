import 'package:flutter/material.dart';
import '../../../config/theme/colors.dart';

class WalletsTab extends StatefulWidget {
  const WalletsTab({super.key});

  @override
  State<WalletsTab> createState() => _WalletsTabState();
}

class _WalletsTabState extends State<WalletsTab> {
  String _selectedFilter = 'All';
  final List<String> _filters = ['All', 'Spot', 'Funding'];
  bool _showInUSD = true;

  final double _ngnRate = 1200.0;

  String _formatBalance(bool inUSD) {
    if (inUSD) {
      return '\$12,384.21';
    }
    final ngnBalance = 12384.21 * _ngnRate;
    return '₦${ngnBalance.toStringAsFixed(2)}';
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return SafeArea(
      child: CustomScrollView(
        slivers: [
          // Portfolio Value Card
          SliverToBoxAdapter(
            child: Container(
              margin: const EdgeInsets.all(16),
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: isDark
                      ? [
                          SafeJetColors.secondaryHighlight.withOpacity(0.15),
                          SafeJetColors.primaryAccent.withOpacity(0.05),
                        ]
                      : [
                          SafeJetColors.lightCardBackground,
                          SafeJetColors.lightCardBackground,
                        ],
                ),
                borderRadius: BorderRadius.circular(24),
                border: Border.all(
                  color: isDark
                      ? SafeJetColors.secondaryHighlight.withOpacity(0.2)
                      : SafeJetColors.lightCardBorder,
                ),
              ),
              child: Column(
                children: [
                  // Currency Toggle
                  Container(
                    padding: const EdgeInsets.all(4),
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
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        _buildCurrencyToggle('USD', true, isDark),
                        _buildCurrencyToggle('NGN', false, isDark),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Total Balance',
                    style: theme.textTheme.bodyLarge?.copyWith(
                      color: isDark ? Colors.grey[400] : SafeJetColors.lightTextSecondary,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    _formatBalance(_showInUSD),
                    style: theme.textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: SafeJetColors.success.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      '+\$234.12 (1.93%)',
                      style: TextStyle(
                        color: SafeJetColors.success,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            // TODO: Handle deposit
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: SafeJetColors.success,
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            elevation: 0,
                          ),
                          child: const Text('Deposit'),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            // TODO: Handle withdraw
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: isDark
                                ? SafeJetColors.primaryAccent.withOpacity(0.1)
                                : SafeJetColors.lightCardBackground,
                            foregroundColor: isDark ? Colors.white : SafeJetColors.lightText,
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                              side: BorderSide(
                                color: isDark
                                    ? SafeJetColors.primaryAccent.withOpacity(0.2)
                                    : SafeJetColors.lightCardBorder,
                              ),
                            ),
                            elevation: 0,
                          ),
                          child: const Text('Withdraw'),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          // Wallet Type Filter
          SliverToBoxAdapter(
            child: Container(
              height: 40,
              margin: const EdgeInsets.symmetric(horizontal: 16),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: _filters.length,
                itemBuilder: (context, index) {
                  final isSelected = _filters[index] == _selectedFilter;
                  return GestureDetector(
                    onTap: () => setState(() => _selectedFilter = _filters[index]),
                    child: Container(
                      margin: const EdgeInsets.only(right: 8),
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      decoration: BoxDecoration(
                        color: isSelected
                            ? SafeJetColors.secondaryHighlight
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: isSelected
                              ? SafeJetColors.secondaryHighlight
                              : (isDark
                                  ? SafeJetColors.primaryAccent.withOpacity(0.2)
                                  : SafeJetColors.lightCardBorder),
                        ),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        _filters[index],
                        style: TextStyle(
                          color: isSelected
                              ? Colors.black
                              : (isDark ? Colors.white : SafeJetColors.lightText),
                          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),

          // Assets List
          SliverPadding(
            padding: const EdgeInsets.all(16),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) => _buildAssetItem(isDark, theme),
                childCount: 10,
              ),
            ),
          ),

          // Bottom Padding
          const SliverPadding(
            padding: EdgeInsets.only(bottom: 100),
          ),
        ],
      ),
    );
  }

  Widget _buildAssetItem(bool isDark, ThemeData theme) {
    final usdBalance = 10123.45;
    final ngnBalance = usdBalance * _ngnRate;
    
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isDark 
            ? SafeJetColors.primaryAccent.withOpacity(0.1)
            : SafeJetColors.lightCardBackground,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: isDark
              ? SafeJetColors.primaryAccent.withOpacity(0.2)
              : SafeJetColors.lightCardBorder,
        ),
      ),
      child: Row(
        children: [
          // Coin Icon
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  SafeJetColors.secondaryHighlight,
                  SafeJetColors.secondaryHighlight.withOpacity(0.8),
                ],
              ),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(Icons.currency_bitcoin, color: Colors.black, size: 24),
          ),
          const SizedBox(width: 12),
          
          // Coin Info
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Bitcoin',
                  style: theme.textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'BTC',
                  style: TextStyle(
                    color: isDark ? Colors.grey[400] : SafeJetColors.lightTextSecondary,
                  ),
                ),
              ],
            ),
          ),
          
          // Balance Info
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                '0.2384 BTC',
                style: theme.textTheme.bodyLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                _showInUSD 
                    ? '\$${usdBalance.toStringAsFixed(2)}'
                    : '₦${ngnBalance.toStringAsFixed(2)}',
                style: TextStyle(
                  color: isDark ? Colors.grey[400] : SafeJetColors.lightTextSecondary,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCurrencyToggle(String currency, bool isUSD, bool isDark) {
    final isSelected = _showInUSD == isUSD;
    
    return GestureDetector(
      onTap: () => setState(() => _showInUSD = isUSD),
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 8,
        ),
        decoration: BoxDecoration(
          color: isSelected ? SafeJetColors.secondaryHighlight : Colors.transparent,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          currency,
          style: TextStyle(
            color: isSelected ? Colors.black : (isDark ? Colors.white : SafeJetColors.lightText),
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ),
    );
  }
} 