class LZDAPi {
  ///首页
  static const String API_GET_HOME = 'index/index';

  ///登录
  static const String API_GET_LOGIN = 'login/passLogin';

  ///验证码登录
  static const String API_GET_CODELOGIN = 'login/codeLogin';

  ///获取验证码
  static const String API_GET_SMS_SENDCODE = 'sms/sendCode';

  ///注册
  static const String API_GET_LOGIN_REGISTER = 'login/register';

  ///首页
  static const String API_GET_LOGIN_FORGET = 'login/forget';

  ///获取广告
  static const String API_index_getAdvertData = 'index/getAdvertData';

  ///文件上传
  static const String API_GET_FILEUPLOAD = 'upload/index';

  ///帖子上传
  static const String API_GET_STICK_SAVESTICK = 'stick/saveStick';

  ///获取帖子分类
  static const String API_GET_STICK_CATE = 'stick/getCate';

  ///帖子列表
  static const String API_GET_STICK_GETLIST = 'stick/getList';
}
