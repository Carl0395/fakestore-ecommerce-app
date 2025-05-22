class AppTextConfig {
  final String appTitle;
  final String search;
  final String categories;
  final String products;
  final String cart;
  final String details;
  final String addToCart;
  final String welcome;
  final String username;
  final String password;
  final String login;
  final String noAccount;
  final String createAccount;
  final String email;
  final String save;
  final String register;
  final String registered;
  final String adButton;
  final String category;

  AppTextConfig({
    required this.appTitle,
    required this.search,
    required this.categories,
    required this.products,
    required this.cart,
    required this.details,
    required this.addToCart,
    required this.welcome,
    required this.username,
    required this.password,
    required this.login,
    required this.noAccount,
    required this.createAccount,
    required this.email,
    required this.save,
    required this.register,
    required this.registered,
    required this.adButton,
    required this.category,
  });

  factory AppTextConfig.fromJson(Map<String, dynamic> json) {
    return AppTextConfig(
      appTitle: json['appTitle'],
      search: json['search'],
      categories: json['categories'],
      products: json['products'],
      cart: json['cart'],
      details: json['details'],
      addToCart: json['addToCart'],
      welcome: json['welcome'],
      username: json['username'],
      password: json['password'],
      login: json['login'],
      noAccount: json['noAccount'],
      createAccount: json['createAccount'],
      email: json['email'],
      save: json['save'],
      register: json['register'],
      registered: json['registered'],
      adButton: json['adButton'],
      category: json['category'],
    );
  }
}
