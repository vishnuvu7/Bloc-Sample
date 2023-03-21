enum CustomBaseUrls {
  authUrl("https://restful-booker.herokuapp.com/"),
  animeUrl("https://animechan.vercel.app/");

  const CustomBaseUrls(this.url);
  final String url;
}


class ApiEndPoints{

  static const fileURL = "http://";

  static const getAnime = "api/quotes";

  static const login = "auth";
}
