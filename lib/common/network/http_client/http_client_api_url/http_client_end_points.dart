enum HttpClientEndPoints {
  Login('/User/Login'),
  Logout('/User/Logout'), //Aktif değil
  GetNotifications('/notifications'),
  DeleteNotification('/notifications'),
  ReadNotification('/notifications'),
  InsertNotificationToken(
      '/PushNotificationToken/AddOrUpdatePushNotificationToken'),
  GetUserSettings('/UserSettings/GetUserSettings'),
  UpdateUserSettings('/UserSettings/UpdateUserSettings'),
  InsertDevice('/Device/AddOrUpdateDevice'),
  GetAllDevice('/Device/GetAllDevice');

  const HttpClientEndPoints(this.URL);
  final String URL;
}
