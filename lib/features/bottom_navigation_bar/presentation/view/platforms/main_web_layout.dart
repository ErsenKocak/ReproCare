import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:reprocare/common/widgets/svg_picture/app_svg_picture.dart';
import 'package:reprocare/core/constants/colors/app_light_colors.dart';
import 'package:reprocare/core/constants/theme/app_themes.dart';
import 'package:reprocare/features/bottom_navigation_bar/presentation/mixin/bottom_navigation_bar_mixin.dart';
import 'package:reprocare/features/notification/presentation/widgets/notification_list_widget.dart';
import 'package:reprocare/generated/assets.gen.dart';
import 'package:reprocare/generated/locale_keys.g.dart';

class MainWebLayout extends StatefulWidget {
  final Widget navigationShell;

  const MainWebLayout({required this.navigationShell, super.key});

  @override
  State<MainWebLayout> createState() => _MainWebLayoutState();
}

class _MainWebLayoutState extends State<MainWebLayout>
    with BottomNavigationBarMixin<MainWebLayout> {
  final LayerLink _layerLink = LayerLink();
  OverlayEntry? _overlayEntry;
  bool _isNotificationOpen = false;
  bool _isSidebarExpanded = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          _buildSidebar(),
          Expanded(
            child: Column(
              children: [
                _buildTopBar(),
                Expanded(child: widget.navigationShell),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTopBar() {
    return Container(
      height: 70,
      padding: const EdgeInsets.symmetric(horizontal: 32),
      decoration: BoxDecoration(
        color: AppThemes.currentTheme.cardColor,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            offset: const Offset(0, 2),
            blurRadius: 10,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          CompositedTransformTarget(
            link: _layerLink,
            child: Material(
              color: Colors.transparent,
              shape: const CircleBorder(),
              clipBehavior: Clip.hardEdge,
              child: IconButton(
                onPressed: _toggleNotificationPopup,
                icon: AppSvgPicture(
                  path: Assets.icons.general.iconAppBarNotification.path,
                  height: 24,
                  color: _isNotificationOpen
                      ? AppLightColors.primaryColor
                      : AppLightColors.secondaryTextColor,
                ),
              ),
            ),
          ),
          const SizedBox(width: 20),
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppLightColors.primaryColor.withOpacity(0.1),
            ),
            child: const Icon(Icons.person, color: AppLightColors.primaryColor),
          ),
        ],
      ),
    );
  }

  Widget _buildSidebar() {
    return ValueListenableBuilder(
      valueListenable: activeIndexNotifier,
      builder: (context, activeIndex, child) {
        return AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          width: _isSidebarExpanded ? 260 : 80,
          decoration: BoxDecoration(
            color: AppThemes.currentTheme.cardColor,
            border: Border(
              right: BorderSide(
                color: AppThemes.currentTheme.dividerColor,
                width: 1,
              ),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 32),
              // Logo Section
              // Logo & Toggle Section
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Row(
                  mainAxisAlignment: _isSidebarExpanded
                      ? MainAxisAlignment.spaceBetween
                      : MainAxisAlignment.center,
                  children: [
                    // Logo (Visible when Expanded, or Icon when Collapsed?)
                    // User said: "kapatıldığında sadece icon gözüksün" (referring to menu items usually, but maybe logo too)
                    // Let's keep Logo Icon always visible on left (or center if collapsed).
                    // And Toggle Button on right.

                    if (_isSidebarExpanded) ...[
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Colors.red.withOpacity(0.1),
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(Icons.hub,
                                color: Colors.red, size: 28),
                          ),
                          const SizedBox(width: 12),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'DSO Control',
                                style: AppThemes
                                    .currentTheme.textTheme.titleMedium
                                    ?.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                'v2.4.1',
                                style: AppThemes
                                    .currentTheme.textTheme.bodySmall
                                    ?.copyWith(
                                  color: AppLightColors.secondaryTextColor,
                                  fontSize: 10,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      // Toggle Button (Right aligned)
                      InkWell(
                        onTap: () {
                          setState(() {
                            _isSidebarExpanded = false;
                          });
                        },
                        child: Icon(Icons.keyboard_double_arrow_left,
                            color: Colors.grey),
                      ),
                    ] else ...[
                      // Collapsed State: Show Icon acting as Toggle? Or separate?
                      // User: "sağ üstine icon ekle"
                      // If collapsed, width is small. One icon fits.
                      // Let's make the Logo Icon be the toggle OR show a "Open" icon.
                      // Let's show the Logo Icon, and tapping it expands? Or a specific Menu icon.
                      // User said "add icon to top right".
                      // I'll show the Toggle Icon (Arrow Right) which expands it.
                      InkWell(
                        onTap: () {
                          setState(() {
                            _isSidebarExpanded = true;
                          });
                        },
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Colors.red.withOpacity(0.1),
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(Icons.hub,
                              color: Colors.red, size: 28),
                        ),
                      ),
                    ]
                  ],
                ),
              ),
              const SizedBox(height: 40),
              // Menu Items
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  children: [
                    _buildSidebarItem(
                      index: 0,
                      icon: Icons.dashboard_outlined,
                      label: 'Dashboard',
                      isSelected: activeIndex == 0,
                    ),
                    _buildSidebarItem(
                      index: 99, // Dummy
                      icon: Icons.show_chart,
                      label: 'İzleme',
                      isSelected: false,
                    ),
                    _buildSidebarItem(
                      index: 98,
                      icon: Icons.pie_chart_outline,
                      label: 'Cihaz Grafikleri',
                      isSelected: false,
                    ),
                    _buildSidebarItem(
                      index: 97, // Dummy
                      icon: Icons.list_alt,
                      label: 'Veri Günlükleri',
                      isSelected: false,
                    ),
                    _buildSidebarItem(
                      index: 96,
                      icon: Icons.notifications_none,
                      label: 'Alarmlar',
                      isSelected: false,
                    ),
                    _buildSidebarItem(
                      index: 95,
                      icon: Icons.people_outline,
                      label: 'Kullanıcılar',
                      isSelected: false,
                    ),
                    _buildSidebarItem(
                      index: 94,
                      icon: Icons.description_outlined,
                      label: 'Raporlar',
                      isSelected: false,
                    ),
                    _buildSidebarItem(
                      index: 2,
                      icon: Icons.settings_outlined,
                      label: LocaleKeys.Settings_Settings.tr(),
                      isSelected: activeIndex == 2,
                    ),
                  ],
                ),
              ),
              // Bottom Section
              Container(
                margin: const EdgeInsets.all(16),
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: AppThemes.currentTheme.scaffoldBackgroundColor,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                      color: AppThemes.currentTheme.dividerColor, width: 0.5),
                ),
                child: Row(
                  mainAxisAlignment: _isSidebarExpanded
                      ? MainAxisAlignment.start
                      : MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: const BoxDecoration(
                        color: Colors.blueAccent,
                        shape: BoxShape.circle,
                      ),
                      child: const Text('OG',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 12)),
                    ),
                    if (_isSidebarExpanded) ...[
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Oğuzhan GÖRKEM',
                              style: AppThemes.currentTheme.textTheme.bodyMedium
                                  ?.copyWith(
                                fontWeight: FontWeight.w600,
                                fontSize: 13,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                            Text(
                              'Administrator',
                              style: AppThemes.currentTheme.textTheme.bodySmall
                                  ?.copyWith(
                                fontSize: 11,
                                color: AppLightColors.secondaryTextColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ]
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildSidebarItem({
    required int index,
    required IconData icon,
    required String label,
    required bool isSelected,
  }) {
    final color = isSelected
        ? AppLightColors.primaryColor
        : AppLightColors.secondaryTextColor;

    return Material(
      color: Colors.transparent,
      child: Tooltip(
        message: _isSidebarExpanded ? '' : label,
        child: ListTile(
          leading: Icon(
            icon,
            color: color,
            size: 22,
          ),
          title: _isSidebarExpanded
              ? Text(
                  label,
                  style: AppThemes.currentTheme.textTheme.bodyMedium?.copyWith(
                    color: color,
                    fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
                    fontSize: 15,
                  ),
                  overflow: TextOverflow.ellipsis,
                )
              : null,
          selected: isSelected,
          onTap: () => navigate(index),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          hoverColor: AppLightColors.primaryColor.withOpacity(0.05),
          tileColor:
              isSelected ? AppLightColors.primaryColor.withOpacity(0.1) : null,
          minLeadingWidth: 20,
        ),
      ),
    );
  }

  void _toggleNotificationPopup() {
    if (_isNotificationOpen) {
      _closeNotificationPopup();
    } else {
      _openNotificationPopup();
    }
  }

  void _openNotificationPopup() {
    _overlayEntry = _createOverlayEntry();
    Overlay.of(context).insert(_overlayEntry!);
    setState(() {
      _isNotificationOpen = true;
    });
  }

  void _closeNotificationPopup() {
    _overlayEntry?.remove();
    _overlayEntry = null;
    setState(() {
      _isNotificationOpen = false;
    });
  }

  OverlayEntry _createOverlayEntry() {
    return OverlayEntry(
      builder: (context) => Positioned(
        width: 400,
        height: 500,
        child: CompositedTransformFollower(
          link: _layerLink,
          showWhenUnlinked: false,
          offset: const Offset(-360, 50), // Position to the left-bottom of icon
          child: Material(
            elevation: 8,
            borderRadius: BorderRadius.circular(12),
            color: AppThemes.currentTheme.cardColor,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        LocaleKeys.Notification_Notifications.tr(),
                        style: AppThemes.currentTheme.textTheme.titleMedium,
                      ),
                      IconButton(
                        icon: const Icon(Icons.close, size: 20),
                        onPressed: _closeNotificationPopup,
                      )
                    ],
                  ),
                ),
                const Divider(height: 1),
                Expanded(child: const NotificationListWidget()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
