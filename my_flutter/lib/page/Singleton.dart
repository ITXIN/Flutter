class Singleton {
  static final Singleton _instance = Singleton._internal();

  factory Singleton() {
    return _instance;
  }

  Singleton._internal() {
    init();
  }

  void init() {
    print("初始化");
  }
}
