import 'package:carpool_admin/utils/models/notification_dummy_data.dart';
import 'package:flutter/material.dart';
import '../../../utils/theme/colors.dart';
import '../../../utils/theme/fonts.dart';
import '../../../utils/theme/text_styles.dart';

class NotificationsTable extends StatelessWidget {
  final List<NotificationItem> notifications;

  const NotificationsTable({
    Key? key,
    required this.notifications,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Table Header
        _buildTableHeader(),
        
        // Table Rows
        if (notifications.isEmpty)
          _buildEmptyState()
        else
          ...notifications.asMap().entries.map((entry) {
            final index = entry.key;
            final notification = entry.value;
            return _buildTableRow(
              notification,
              isLast: index == notifications.length - 1,
            );
          }).toList(),
      ],
    );
  }

  Widget _buildTableHeader() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: AppColors.divider,
            width: 1,
          ),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: _buildHeaderCell('TITLE'),
          ),
          Expanded(
            flex: 2,
            child: _buildHeaderCell('TYPE'),
          ),
          Expanded(
            flex: 2,
            child: _buildHeaderCell('RECIPIENTS'),
          ),
          Expanded(
            flex: 2,
            child: _buildHeaderCell('CHANNELS'), // ✅ Fixed typo: was "CANNELS"
          ),
          Expanded(
            flex: 2,
            child: _buildHeaderCell('SENT DATE'),
          ),
          Expanded(
            flex: 1,
            child: _buildHeaderCell('STATUS'),
          ),
        ],
      ),
    );
  }

  Widget _buildHeaderCell(String text) {
    return Text(
      text,
      style: AppTextStyles.tableHeader, // ✅ Using AppTextStyles instead of inline
    );
  }

  Widget _buildTableRow(NotificationItem notification, {bool isLast = false}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 18),
      decoration: BoxDecoration(
        border: isLast
            ? null
            : const Border(
                bottom: BorderSide(
                  color: AppColors.divider,
                  width: 1,
                ),
              ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title Column
          Expanded(
            flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  notification.title,
                  style: AppTextStyles.bodyMedium.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  notification.subtitle,
                  style: AppTextStyles.caption,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          
          // Type Column
          Expanded(
            flex: 2,
            child: Align(
              alignment: Alignment.centerLeft,
              child: _buildTypeTag(notification.typeLabel),
            ),
          ),
          
          // Recipients Column
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  notification.recipients,
                  style: AppTextStyles.bodySmall.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                ),
                if (notification.recipientsSubtitle.isNotEmpty) ...[
                  const SizedBox(height: 2),
                  Text(
                    notification.recipientsSubtitle,
                    style: AppTextStyles.caption,
                  ),
                ],
              ],
            ),
          ),
          
          // Channels Column
          Expanded(
            flex: 2,
            child: Wrap(
              spacing: 6,
              runSpacing: 6,
              children: notification.channels.map((channel) {
                return _buildChannelPill(channel);
              }).toList(),
            ),
          ),
          
          // Sent Date Column
          Expanded(
            flex: 2,
            child: Text(
              notification.sentDate,
              style: AppTextStyles.bodySmall,
            ),
          ),
          
          // Status Column
          Expanded(
            flex: 1,
            child: _buildStatusBadge(notification.status),
          ),
        ],
      ),
    );
  }

  Widget _buildTypeTag(String type) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: AppColors.textPrimary,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        type,
        style: AppTextStyles.statusTag.copyWith(
          color: Colors.white,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _buildChannelPill(String channel) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(4),
        border: Border.all(
          color: AppColors.border,
          width: 1,
        ),
      ),
      child: Text(
        channel,
        style: const TextStyle(
          fontFamily: AppFonts.primary,
          fontSize: 11,
          fontWeight: FontWeight.w500,
          color: AppColors.textSecondary,
        ),
      ),
    );
  }

  Widget _buildStatusBadge(String status) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: AppColors.tagBg,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        status,
        style: AppTextStyles.statusTag,
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _buildEmptyState() {
    return Padding(
      padding: const EdgeInsets.all(48.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.notifications_off_outlined,
              size: 48,
              color: AppColors.textTertiary,
            ),
            const SizedBox(height: 16),
            Text(
              'No notifications found',
              style: AppTextStyles.bodyMedium.copyWith(
                fontWeight: FontWeight.w500,
                color: AppColors.textTertiary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}