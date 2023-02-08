enum CustomBaseUrls {
  authUrl("https://restful-booker.herokuapp.com/"),
  animeUrl("https://animechan.vercel.app/");

  const CustomBaseUrls(this.url);

  final String url;
}
