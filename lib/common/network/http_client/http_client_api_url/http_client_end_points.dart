enum HttpClientEndPoints {
  Register('/auth/register'),
  Login('/auth/login'),
  Logout('/auth/logout'),
  GetUserSettings('/auth/logout');

  const HttpClientEndPoints(this.URL);
  final String URL;
}
