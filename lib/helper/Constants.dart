import 'dart:convert';

String baseUrl = "https://datascienceplc.com/apps/manager/api/items/blog/post?app_id=7";
String baseUrlGetQuoteByTag = "https://datascienceplc.com/apps/manager/api/items/blog/search?app_id=7&rand=234544&tag=";
String baseUrlGetQuoteDetail = "https://datascienceplc.com/apps/manager/api/items/blog/post?app_id=7";

String username = 'bloger_api@datascienceplc.com';
String password = 'public-password';
String basicAuth = 'Basic ' + base64Encode(utf8.encode('$username:$password'));

String exampleUrl = "https://jsonplaceholder.typicode.com/posts?_start=";
