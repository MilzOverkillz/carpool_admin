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
  final String complaintType;
  final String reporterName;
  final String reporterEmail;
  final String reporterRole;
  final String reportedUserName;
  final String reportedUserEmail;
  final String reportedUserRole;
  final String priority;
  final String status;
  final String rideStatus;
  final String description;
  final String relatedRideId;
  final String dateReported;
  final String? resolutionNotes;

  ComplaintItem({
    required this.id,
    required this.complaintType,
    required this.reporterName,
    required this.reporterEmail,
    required this.reporterRole,
    required this.reportedUserName,
    required this.reportedUserEmail,
    required this.reportedUserRole,
    required this.priority,
    required this.status,
    required this.rideStatus,
    required this.description,
    required this.relatedRideId,
    required this.dateReported,
    this.resolutionNotes,
  });
}

class NotificationDummyData {
  // Notification Stats
  static const int totalNotifications = 156;
  static const int newComplaints = 2;
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
      id: 'RD-2025-001',
      complaintType: 'Driver Behavior',
      reporterName: 'Sara Johnson',
      reporterEmail: 'saraj@shtechcorp.com',
      reporterRole: 'Rider',
      reportedUserName: 'James Trailer',
      reportedUserEmail: 'Johnsmith@shtechcorp.com',
      reportedUserRole: 'Driver',
      priority: 'High',
      status: 'New',
      rideStatus: 'New',
      description: 'Driver was rude and unprofessional during the ride',
      relatedRideId: 'RD-2025-006',
      dateReported: '2025-01-08',
      resolutionNotes: null,
    ),
    ComplaintItem(
      id: 'RD-2025-001',
      complaintType: 'Safety Concern',
      reporterName: 'Sara Johnson',
      reporterEmail: 'saraj@shtechcorp.com',
      reporterRole: 'Rider',
      reportedUserName: 'James Trailer',
      reportedUserEmail: 'Johnsmith@shtechcorp.com',
      reportedUserRole: 'Driver',
      priority: 'Critical',
      status: 'In-Progress',
      rideStatus: 'New',
      description: 'Driver was speeding and using phone while driving',
      relatedRideId: 'RD-2025-007',
      dateReported: '2025-01-28',
      resolutionNotes: null,
    ),
    ComplaintItem(
      id: 'RD-2025-001',
      complaintType: 'Rider_Behavior',
      reporterName: 'Sara Johnson',
      reporterEmail: 'saraj@shtechcorp.com',
      reporterRole: 'Driver',
      reportedUserName: 'James Trailer',
      reportedUserEmail: 'Johnsmith@shtechcorp.com',
      reportedUserRole: 'Rider',
      priority: 'Low',
      status: 'Resolved',
      rideStatus: 'New',
      description: 'Rider was late and did not communicate',
      relatedRideId: 'RD-2025-008',
      dateReported: '2025-01-28',
      resolutionNotes: 'Issue resolved after speaking with both parties',
    ),
    ComplaintItem(
      id: 'RD-2025-001',
      complaintType: 'Driver Behavior',
      reporterName: 'Sara Johnson',
      reporterEmail: 'saraj@shtechcorp.com',
      reporterRole: 'Rider',
      reportedUserName: 'James Trailer',
      reportedUserEmail: 'Johnsmith@shtechcorp.com',
      reportedUserRole: 'Driver',
      priority: 'High',
      status: 'New',
      rideStatus: 'New',
      description: 'Driver took a longer route unnecessarily',
      relatedRideId: 'RD-2025-009',
      dateReported: '2025-01-28',
      resolutionNotes: null,
    ),
    ComplaintItem(
      id: 'RD-2025-001',
      complaintType: 'Driver Behavior',
      reporterName: 'Sara Johnson',
      reporterEmail: 'saraj@shtechcorp.com',
      reporterRole: 'Rider',
      reportedUserName: 'James Trailer',
      reportedUserEmail: 'Johnsmith@shtechcorp.com',
      reportedUserRole: 'Driver',
      priority: 'High',
      status: 'New',
      rideStatus: 'New',
      description: 'Driver cancelled ride at the last minute without notice',
      relatedRideId: 'RD-2025-010',
      dateReported: '2025-01-28',
      resolutionNotes: null,
    ),
  ];

  // Filter Options
  static const List<String> statusOptions = [
    'All Status',
    'New',
    'In-Progress',
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
    'Driver Behavior',
    'Rider_Behavior',
    'Safety Concern',
    'Payment',
    'Vehicle',
    'Route',
    'Other',
  ];
}