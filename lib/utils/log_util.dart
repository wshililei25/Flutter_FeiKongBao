class Log {
  ///日志级别
  static int level = debug;

  ///无日志
  static final int none = 999;

  static final int verbose = 1;
  static final int debug = 2;
  static final int info = 3;
  static final int warn = 4;
  static final int error = 5;

  static void v(String log) {
    if (level <= verbose) {
      print(log);
    }
  }

  static void d(String log) {
    if (level <= debug) {
      print(log);
    }
  }

  static void i(String log) {
    if (level <= info) {
      print(log);
    }
  }

  static void w(String log) {
    if (level <= warn) {
      print(log);
    }
  }

  static void e(String log) {
    if (level <= error) {
      print(log);
    }
  }
}
