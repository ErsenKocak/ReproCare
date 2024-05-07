enum HttpClientEndPoints {
  Login('/User/Login'),
  Logout('/User/Logout'), //Aktif değil
  GetNotifications('/notifications'),
  DeleteNotification('/notifications'),
  ReadNotification('/notifications'),
  InsertNotificationToken('/notifications'),
  GetUserSettings('/UserSettings/GetUserSettings'),
  UpdateUserSettings('/UserSettings/UpdateUserSettings');

  const HttpClientEndPoints(this.URL);
  final String URL;
}
