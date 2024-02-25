import 'package:edugated/domain/app_url/app_url.dart';

class StaggingAppUrl implements AppUrl {
  @override
  String baseUrl = "https://www.cybernsoft.com/fyp/";
  @override
  String activityEndPoint = "pass_history.php";
  @override
  String addContactEndPoint = "add_contact.php";
  @override
  String contactsEndPoint = "get_contact.php";
  @override
  String generateGatePassEndPoint = "create_pass.php";
}
