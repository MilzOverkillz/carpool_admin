class NotificationItem {
  final String title;
  final String subtitle;
  final String type;
  final String typeLabel;
  final String recipients;
  final String recipientsSubtitle;
  final List<String> channels;
  final String sentDate;
  final String status;

  NotificationItem({
    required this.title,
    required this.subtitle,
    required this.type,
    required this.typeLabel,
    required this.recipients,
    required this.recipientsSubtitle,
    required this.channels,
    required this.sentDate,
    required this.status,
  });
}

class ComplaintItem {
  final String id;
  final String title;
  final String description;
  final String type;
  final String priority;
  final String status;
  final String submittedDate;
  final String assignedTo;

  ComplaintItem({
    required this.id,
    required this.title,
    required this.description,
    required this.type,
    required this.priority,
    required this.status,
    required this.submittedDate,
    required this.assignedTo,
  });
}

class NotificationDummyData {
  // Notification Stats
  static const int totalNotifications = 156;
  static const int newComplaints = 1;
  static const int inProgress = 1;
  static const int resolved = 1;

  // Notifications List
  static List<NotificationItem> notifications = [
    NotificationItem(
      title: 'Schedule Maintenance',
      subtitle: 'Platform will be under maintenance on Jan 25,2025 from...',
      type: 'general',
      typeLabel: 'General',
      recipients: 'All Users',
      recipientsSubtitle: '',
      channels: ['Email', 'Push', 'sms'],
      sentDate: '2025-01-28',
      status: 'Sent',
    ),
    NotificationItem(
      title: 'Refund Process',
      subtitle: 'Your refund of \$28.00 has been processed successfully',
      type: 'refund',
      typeLabel: 'Refund',
      recipients: 'Specific User',
      recipientsSubtitle: 'John Smith',
      channels: ['Email', 'Push', 'sms'],
      sentDate: '2025-01-28',
      status: 'Sent',
    ),
    NotificationItem(
      title: 'New Company Onboarded',
      subtitle: 'Welcome to our carpool platform start inviting your empl...',
      type: 'account_update',
      typeLabel: 'Account Update',
      recipients: 'Specific Company',
      recipientsSubtitle: 'Retail Group',
      channels: ['Email', 'Push', 'sms'],
      sentDate: '2025-01-28',
      status: 'Sent',
    ),
    NotificationItem(
      title: 'Schedule Maintenance',
      subtitle: 'Platform will be under maintenance on Jan 25,2025 from...',
      type: 'general',
      typeLabel: 'General',
      recipients: 'All Users',
      recipientsSubtitle: '',
      channels: ['Email', 'Push', 'sms'],
      sentDate: '2025-01-28',
      status: 'Sent',
    ),
    NotificationItem(
      title: 'Payment Reminder',
      subtitle: 'Your monthly subscription payment is due tomorrow',
      type: 'payment',
      typeLabel: 'Payment',
      recipients: 'All Users',
      recipientsSubtitle: '',
      channels: ['Email', 'sms'],
      sentDate: '2025-01-27',
      status: 'Sent',
    ),
    NotificationItem(
      title: 'Ride Cancellation',
      subtitle: 'Your scheduled ride for tomorrow has been cancelled',
      type: 'ride',
      typeLabel: 'Ride',
      recipients: 'Specific User',
      recipientsSubtitle: 'Emma Wilson',
      channels: ['Push', 'sms'],
      sentDate: '2025-01-27',
      status: 'Sent',
    ),
  ];

  // Complaints List
  static List<ComplaintItem> complaints = [
    ComplaintItem(
      id: 'CMP-001',
      title: 'Driver was rude',
      description: 'The driver was very unprofessional during my ride',
      type: 'Behavior',
      priority: 'High',
      status: 'New',
      submittedDate: '2025-01-28',
      assignedTo: 'Support Team A',
    ),
    ComplaintItem(
      id: 'CMP-002',
      title: 'Payment issue',
      description: 'Double charged for the same ride',
      type: 'Payment',
      priority: 'Critical',
      status: 'Inprogress',
      submittedDate: '2025-01-27',
      assignedTo: 'Finance Team',
    ),
  ];

  // Filter Options
  static const List<String> statusOptions = [
    'All Status',
    'New',
    'Inprogress',
    'Escalated',
    'Resolved',
  ];

  static const List<String> typeOptions = [
    'All Type',
    'General',
    'Refund',
    'Account Update',
    'Payment',
    'Ride',
    'Behavior',
  ];

  static const List<String> priorityOptions = [
    'All Priority',
    'Critical',
    'High',
    'Medium',
    'Low',
  ];

  // Type options for complaints
  static const List<String> complaintTypeOptions = [
    'All Type',
    'Behavior',
    'Payment',
    'Safety',
    'Vehicle',
    'Route',
    'Other',
  ];
}