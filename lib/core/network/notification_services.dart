
//! Uses the flutter local notification package

// import 'dart:async';
// import 'dart:convert';
// import 'dart:math';

// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';

// import '../utils/logger/logger.dart';

// const _channelId = '<your_channel_id>';
// const _channelDeception = '<your_channel_desc>';
// const _channelTitle = '<your_channel_title>';
// const _topicKey = 'general';

// class NotificationService {
//   factory NotificationService() {
//     return _instance ??= NotificationService._();
//   }

//   NotificationService._();
//   static NotificationService? _instance;

//   final _firebaseMessaging = FirebaseMessaging.instance;

//   final _flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

//   var _didInitializeNotificationService = false;
//   Future<void> initialize() async {
//     if (_didInitializeNotificationService) {
//       Logger.w('You already initialized the notification service. '
//           'Ignoring the reinitialize request!');
//       return;
//     }

//     final settings = await _firebaseMessaging.requestPermission();

//     if (settings.authorizationStatus != AuthorizationStatus.authorized) {
//       return;
//     }

//     unawaited(_firebaseMessaging.subscribeToTopic(_topicKey));

//     await _initLocalNotificationPackage();

//     _startNotificationsListener();

//     _didInitializeNotificationService = true;
//   }

//   Future<void> _initLocalNotificationPackage() async {
//     await _flutterLocalNotificationsPlugin
//         .resolvePlatformSpecificImplementation<
//             AndroidFlutterLocalNotificationsPlugin>()
//         ?.createNotificationChannel(
//           const AndroidNotificationChannel(
//             _channelId,
//             _channelTitle,
//             description: _channelDeception,
//             importance: Importance.max,
//             enableLights: true,
//           ),
//         );

//     const initializationSettingsAndroid =
//         AndroidInitializationSettings('@mipmap/ic_stat_notification_icon');

//     const darwinInitializationSettings = DarwinInitializationSettings();

//     const initializationSettings = InitializationSettings(
//       android: initializationSettingsAndroid,
//       iOS: darwinInitializationSettings,
//     );

//     await _flutterLocalNotificationsPlugin.initialize(
//       initializationSettings,
//       onDidReceiveNotificationResponse: (details) {
//         if (details.payload != null) {
//           _handleNotificationTap(
//             json.decode(details.payload!) as Map<String, dynamic>,
//           );
//         }
//       },
//     );
//   }

//   bool _isNotificationListenerInitialized = false;

//   void _startNotificationsListener() {
//     if (_isNotificationListenerInitialized) {
//       Logger.w('You already started the notification Listener. '
//           'Ignoring the start request!');
//       return;
//     }
//     _isNotificationListenerInitialized = true;

//     // show notifications
//     FirebaseMessaging.onMessage.listen(_showNotification);
//   }

//   bool _isTapListenersInitialized = false;

//   Future<void> startTapNotificationsListener() async {
//     assert(
//       _didInitializeNotificationService,
//       'Did you forget to initialize the notification service?',
//     );

//     if (_isTapListenersInitialized) {
//       return;
//     }
//     _isTapListenersInitialized = true;

//     // handle notification tap

//     final remoteInitialMessage =
//         await FirebaseMessaging.instance.getInitialMessage();
//     if (remoteInitialMessage != null) {
//       _handleNotificationTap(remoteInitialMessage.data);
//     }

//     FirebaseMessaging.onMessageOpenedApp.listen((remoteMessage) {
//       _handleNotificationTap(remoteMessage.data);
//     });

//     final notificationAppLaunchDetails = await _flutterLocalNotificationsPlugin
//         .getNotificationAppLaunchDetails();

//     if (notificationAppLaunchDetails != null) {
//       final payload =
//           notificationAppLaunchDetails.notificationResponse?.payload;
//       if (payload != null) {
//         _handleNotificationTap(json.decode(payload) as Map<String, dynamic>);
//       }
//     }
//   }

//   Future<void> _showNotification(RemoteMessage message) async {
//     final bigTextStyleInformation = BigTextStyleInformation(
//       message.notification?.body.toString() ?? '',
//       contentTitle: message.notification?.title.toString(),
//     );

//     final androidPlatformChannelSpecifics = AndroidNotificationDetails(
//       _channelId,
//       _channelTitle,
//       channelDescription: _channelDeception,
//       importance: Importance.max,
//       styleInformation: bigTextStyleInformation,
//       priority: Priority.max,
//     );

//     final platformChannelSpecifics =
//         NotificationDetails(android: androidPlatformChannelSpecifics);

//     await _flutterLocalNotificationsPlugin.show(
//       Random().nextInt(99999),
//       message.notification?.title,
//       message.notification?.body,
//       platformChannelSpecifics,
//       payload: json.encode(message.data),
//     );
//   }
// }

// void _handleNotificationTap(Map<String, dynamic> payload) {
//   // handel notification tap
// }