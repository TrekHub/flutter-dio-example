import 'package:github_api/services/web_http.dart';

Future<void> main() async {
  var user = await WebHttp().getUser('Trekhub');
  var response =
      await WebHttp().getLanguageUseCountByRegion('flutter', 'Kenya', '2022');
  print(user.data);
  print("=====================================");
  print(response.data);
}
