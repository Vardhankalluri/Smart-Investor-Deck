import 'package:get/get.dart';
import '../bindings/login_binding.dart';
import '../bindings/screens/account_setting_screen.dart';
import '../bindings/screens/billing_address_screen.dart';
import '../bindings/screens/business_idea_screen.dart';
import '../bindings/screens/change_password_screen.dart';
import '../bindings/screens/company_profile_screen.dart';
import '../bindings/screens/dashboard_screen.dart';
import '../bindings/screens/forgot_password_screen.dart';
import '../bindings/screens/login_screen.dart';
import '../bindings/screens/my_profile_screen.dart';
import '../bindings/screens/plans_screen.dart';
import '../bindings/screens/register_screen.dart';

class AppPages {
  static const login = '/login';
  static const forgotPassword = '/forgot';
  static const register = '/register';
  static const dashboard = '/dashboard';
  static const businessIdeas = '/business-ideas';
  static const accountSettings = '/account-settings';
  static const myProfile = '/my-profile';
  static const companyProfile = '/company-profile';
  static const billingAddress = '/billing-address';
  static const changePassword = '/change-password';
  static const plans = '/plans';

  static final routes = [
    GetPage(name: login, page: () => const LoginScreen(), binding: LoginBinding()),
    GetPage(name: forgotPassword, page: () => const ForgotPasswordScreen(), binding: LoginBinding()),
    GetPage(name: register, page: () => const RegisterScreen(), binding: LoginBinding()),
    GetPage(name: dashboard, page: () => const DashboardScreen(), binding: LoginBinding()),
    GetPage(name: businessIdeas, page: () => const BusinessIdeasScreen(), binding: LoginBinding()),
    GetPage(name: accountSettings, page: () => const AccountSettingsScreen(), binding: LoginBinding()),
    GetPage(name: myProfile, page: () => const MyProfileScreen(), binding: LoginBinding()),
    GetPage(name: companyProfile, page: () => const CompanyProfileScreen(), binding: LoginBinding()),
    GetPage(name: billingAddress, page: () => const BillingAddressScreen(), binding: LoginBinding()),
    GetPage(name: changePassword, page: () => const ChangePasswordScreen(), binding: LoginBinding()),
    GetPage(name: plans, page: () => const PlansScreen(), binding: LoginBinding()),
  ];
}
