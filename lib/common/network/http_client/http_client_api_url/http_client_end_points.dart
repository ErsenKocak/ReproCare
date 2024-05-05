enum HttpClientEndPoints {
  Register('/auth/register'),
  Login('/auth/login'),
  Logout('/auth/logout'),
  GetNotifications('/notifications'),
  DeleteNotification('/notifications'),
  ReadNotification('/notifications'),
  InsertNotificationToken('/notifications'),
  GetUserSettings('/userSettings');

  const HttpClientEndPoints(this.URL);
  final String URL;
}
