enum HttpClientEndPoints {
  Login('/User/Login'),
  Logout(''), //Aktif değil
  GetNotifications('/PushNotification/GetPushNotification'),
  DeleteNotification(''), //Aktif değil
  ReadNotification('/PushNotification/PushNotificationRead'),
  InsertNotificationToken(
      '/PushNotificationToken/AddOrUpdatePushNotificationToken'),
  GetUserSettings('/UserSettings/GetUserSettings'),
  UpdateUserSettings('/UserSettings/UpdateUserSettings'),
  InsertDevice('/Device/AddOrUpdateDevice'),
  GetAllDevice('/Device/GetAllDevice');

  const HttpClientEndPoints(this.URL);
  final String URL;
}
