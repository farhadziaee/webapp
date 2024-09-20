import 'package:dotenv/dotenv.dart';
import 'package:webapp/src/tools/convertor/string_validator.dart';
import 'package:webapp/src/tools/path.dart';

var env = DotEnv(includePlatformEnvironment: true)..load();

/// A class representing configuration settings for the web application.
///
/// The [WaConfigs] class provides a comprehensive configuration setup for
/// various aspects of the web application, including paths, server settings,
/// database configuration, and more. It uses environment variables and default
/// values to initialize its properties.
class WaConfigs {
  /// Creates an instance of [WaConfigs].
  ///
  /// Initializes configuration properties with values from environment variables
  /// or defaults provided in the parameters.
  WaConfigs({
    this.version = '1.0.0',
    String? appPath,
    String? dbPath,
    String? backupPath,
    String? widgetsPath,
    String? languagePath,
    this.port = 8080,
    this.portSocket = 8083,
    this.portNginx = 80,
    this.ip = '0.0.0.0',
    this.dbName = "database_name",
    this.noStop = true,
    this.serverName = "webserver",
    this.pathFilemanager = '/upload/filemanager',
    String? publicDir,
    String? domain,
    String? domainScheme,
    int? domainPort,
    WaDBConfig? dbConfig,
    this.widgetsType = 'html',
    this.fakeDelay = 0,
    List<String>? languages,
    this.mailDefault = "example@uproid.com",
    this.mailHost = "smtp.zoho.eu",
    this.blockStart = '<?',
    this.blockEnd = "?>",
    this.variableStart = "<?=",
    this.variableEnd = "?>",
    this.commentStart = '<?#',
    this.commentEnd = '?>',
    this.cookiePassword = "password",
  }) {
    this.appPath = appPath ?? pathApp;
    this.dbPath = dbPath ?? pathTo("db");
    this.backupPath = backupPath ?? pathTo("backup");
    this.widgetsPath = widgetsPath ?? pathTo("bin/widgets");
    this.languagePath = languagePath ?? pathTo("languages");
    this.domain = domain ?? env['DOMAIN'] ?? 'localhost';
    this.domainScheme = domainScheme ?? env['DOMAIN_SCHEME'] ?? "http";
    this.domainPort = domainPort ?? int.parse(env['DOMAIN_PORT'] ?? "$port");
    this.publicDir = publicDir ?? (env['PUBLIC_DIR'] ?? "public");
    uri = Uri(
      scheme: this.domainScheme,
      host: this.domain,
      port: this.domainPort,
    );
    this.dbConfig = dbConfig ?? WaDBConfig();
    this.languages = languages ?? WaDBConfig.defaultLanguages.keys.toList();
  }

  final String version;
  late final List<String> languages;
  late final String appPath;
  late final String dbPath;
  late final String backupPath;
  late final String widgetsPath;
  late final String languagePath;
  final int port;
  final int portSocket;
  final int portNginx;
  final String ip;
  final String dbName;
  final bool noStop;
  final String serverName;
  late final String publicDir;
  final String pathFilemanager;
  late final int fakeDelay;

  /// DOMAIN CONFIG
  late final String domain;
  late final String domainScheme;
  late final int domainPort;

  late final Uri uri;

  late final String mailDefault;
  late final String mailHost;
  late final String widgetsType;
  late final String blockStart;
  late final String blockEnd;
  late final String variableStart;
  late final String variableEnd;
  late final String commentStart;
  late final String commentEnd;
  late final String cookiePassword;
  late final WaDBConfig dbConfig;

  bool get isLocalDebug {
    return env['LOCAL_DEBUG'].toString().toBool;
  }

  String url({String? path}) {
    if (uri.port == 80 && uri.scheme.toLowerCase() == "https") {
      return uri.replace(port: 443, path: path).toString();
    }

    /// When the path is a full url
    if (path != null && path.startsWith('http')) {
      return path;
    }

    return uri.replace(path: path).toString();
  }
}

class WaDBConfig {
  late final bool enable;
  late final String user;
  late final String pass;
  late final String host;
  late final String port;
  late final String auth;
  late final String dbName;

  String get link =>
      'mongodb://$user:$pass@$host:$port/$dbName/?authSource=$auth';

  WaDBConfig({
    String? user,
    String? pass,
    String? host,
    String? port,
    String? dbName,
    String? auth,
    bool? enable,
  }) {
    this.user =
        user ?? env['MONGO_INITDB_ROOT_USERNAME'] ?? 'database_username';
    this.pass =
        pass ?? env['MONGO_INITDB_ROOT_PASSWORD'] ?? 'database_password';
    this.auth = auth ?? env['MONGO_INITDB_ROOT_AUTH'] ?? 'admin';
    this.host = host ?? env['MONGO_CONNECTION'] ?? 'localhost';
    this.port = port ?? env['MONGO_PORT'] ?? '27017';
    this.dbName = env['MONGO_INITDB_DATABASE'] ?? 'database_name';
    this.enable = enable ?? true;
  }

  static const defaultLanguages = {
    "aa": "Afar",
    "ab": "Abkhazian",
    "ae": "Avestan",
    "af": "Afrikaans",
    "ak": "Akan",
    "am": "Amharic",
    "an": "Aragonese",
    "ar-ae": "Arabic (U.A.E.)",
    "ar-bh": "Arabic (Bahrain)",
    "ar-dz": "Arabic (Algeria)",
    "ar-eg": "Arabic (Egypt)",
    "ar-iq": "Arabic (Iraq)",
    "ar-jo": "Arabic (Jordan)",
    "ar-kw": "Arabic (Kuwait)",
    "ar-lb": "Arabic (Lebanon)",
    "ar-ly": "Arabic (Libya)",
    "ar-ma": "Arabic (Morocco)",
    "ar-om": "Arabic (Oman)",
    "ar-qa": "Arabic (Qatar)",
    "ar-sa": "Arabic (Saudi Arabia)",
    "ar-sy": "Arabic (Syria)",
    "ar-tn": "Arabic (Tunisia)",
    "ar-ye": "Arabic (Yemen)",
    "ar": "Arabic",
    "as": "Assamese",
    "av": "Avaric",
    "ay": "Aymara",
    "az": "Azeri",
    "ba": "Bashkir",
    "be": "Belarusian",
    "bg": "Bulgarian",
    "bh": "Bihari",
    "bi": "Bislama",
    "bm": "Bambara",
    "bn": "Bengali",
    "bo": "Tibetan",
    "br": "Breton",
    "bs": "Bosnian",
    "ca": "Catalan",
    "ce": "Chechen",
    "ch": "Chamorro",
    "co": "Corsican",
    "cr": "Cree",
    "cs": "Czech",
    "cu": "Church Slavonic",
    "cv": "Chuvash",
    "cy": "Welsh",
    "da": "Danish",
    "de-at": "German (Austria)",
    "de-ch": "German (Switzerland)",
    "de-de": "German (Germany)",
    "de-li": "German (Liechtenstein)",
    "de-lu": "German (Luxembourg)",
    "de": "German",
    "div": "Divehi",
    "dv": "Divehi",
    "dz": "Bhutani",
    "ee": "Ewe",
    "el": "Greek",
    "en-au": "English (Australia)",
    "en-bz": "English (Belize)",
    "en-ca": "English (Canada)",
    "en-cb": "English (Caribbean)",
    "en-gb": "English (United Kingdom)",
    "en-ie": "English (Ireland)",
    "en-jm": "English (Jamaica)",
    "en-nz": "English (New Zealand)",
    "en-ph": "English (Philippines)",
    "en-tt": "English (Trinidad and Tobago)",
    "en-us": "English (United States)",
    "en-za": "English (South Africa)",
    "en-zw": "English (Zimbabwe)",
    "en": "English",
    "eo": "Esperanto",
    "es-ar": "Spanish (Argentina)",
    "es-bo": "Spanish (Bolivia)",
    "es-cl": "Spanish (Chile)",
    "es-co": "Spanish (Colombia)",
    "es-cr": "Spanish (Costa Rica)",
    "es-do": "Spanish (Dominican Republic)",
    "es-ec": "Spanish (Ecuador)",
    "es-es": "Spanish (Spain)",
    "es-gt": "Spanish (Guatemala)",
    "es-hn": "Spanish (Honduras)",
    "es-mx": "Spanish (Mexico)",
    "es-ni": "Spanish (Nicaragua)",
    "es-pa": "Spanish (Panama)",
    "es-pe": "Spanish (Peru)",
    "es-pr": "Spanish (Puerto Rico)",
    "es-py": "Spanish (Paraguay)",
    "es-sv": "Spanish (El Salvador)",
    "es-us": "Spanish (United States)",
    "es-uy": "Spanish (Uruguay)",
    "es-ve": "Spanish (Venezuela)",
    "es": "Spanish",
    "et": "Estonian",
    "eu": "Basque",
    "fa": "Farsi",
    "ff": "Fulah",
    "fi": "Finnish",
    "fj": "Fiji",
    "fo": "Faroese",
    "fr-be": "French (Belgium)",
    "fr-ca": "French (Canada)",
    "fr-ch": "French (Switzerland)",
    "fr-fr": "French (France)",
    "fr-lu": "French (Luxembourg)",
    "fr-mc": "French (Monaco)",
    "fr": "French",
    "fy": "Frisian",
    "ga": "Irish",
    "gd": "Gaelic",
    "gl": "Galician",
    "gn": "Guarani",
    "gu": "Gujarati",
    "gv": "Manx",
    "ha": "Hausa",
    "he": "Hebrew",
    "hi": "Hindi",
    "ho": "Hiri Motu",
    "hr-ba": "Croatian (Bosnia and Herzegovina)",
    "hr-hr": "Croatian (Croatia)",
    "hr": "Croatian",
    "ht": "Haitian",
    "hu": "Hungarian",
    "hy": "Armenian",
    "hz": "Herero",
    "ia": "Interlingua",
    "id": "Indonesian",
    "ie": "Interlingue",
    "ig": "Igbo",
    "ii": "Sichuan Yi",
    "ik": "Inupiak",
    "in": "Indonesian",
    "io": "Ido",
    "is": "Icelandic",
    "it-ch": "Italian (Switzerland)",
    "it-it": "Italian (Italy)",
    "it": "Italian",
    "iu": "Inuktitut",
    "iw": "Hebrew",
    "ja": "Japanese",
    "ji": "Yiddish",
    "jv": "Javanese",
    "jw": "Javanese",
    "ka": "Georgian",
    "kg": "Kongo",
    "ki": "Kikuyu",
    "kj": "Kuanyama",
    "kk": "Kazakh",
    "kl": "Greenlandic",
    "km": "Cambodian",
    "kn": "Kannada",
    "ko": "Korean",
    "kok": "Konkani",
    "kr": "Kanuri",
    "ks": "Kashmiri",
    "ku": "Kurdish",
    "kv": "Komi",
    "kw": "Cornish",
    "ky": "Kirghiz",
    "kz": "Kyrgyz",
    "la": "Latin",
    "lb": "Luxembourgish",
    "lg": "Ganda",
    "li": "Limburgan",
    "ln": "Lingala",
    "lo": "Laothian",
    "ls": "Slovenian",
    "lt": "Lithuanian",
    "lu": "Luba-Katanga",
    "lv": "Latvian",
    "mg": "Malagasy",
    "mh": "Marshallese",
    "mi": "Maori",
    "mk": "FYRO Macedonian",
    "ml": "Malayalam",
    "mn": "Mongolian",
    "mo": "Moldavian",
    "mr": "Marathi",
    "ms-bn": "Malay (Brunei Darussalam)",
    "ms-my": "Malay (Malaysia)",
    "ms": "Malay",
    "mt": "Maltese",
    "my": "Burmese",
    "na": "Nauru",
    "nb": "Norwegian (Bokmal)",
    "nd": "North Ndebele",
    "ne": "Nepali (India)",
    "ng": "Ndonga",
    "nl-be": "Dutch (Belgium)",
    "nl-nl": "Dutch (Netherlands)",
    "nl": "Dutch",
    "nn": "Norwegian (Nynorsk)",
    "no": "Norwegian",
    "nr": "South Ndebele",
    "ns": "Northern Sotho",
    "nv": "Navajo",
    "ny": "Chichewa",
    "oc": "Occitan",
    "oj": "Ojibwa",
    "om": "(Afan)/Oromoor/Oriya",
    "or": "Oriya",
    "os": "Ossetian",
    "pa": "Punjabi",
    "pi": "Pali",
    "pl": "Polish",
    "ps": "Pashto/Pushto",
    "pt-br": "Portuguese (Brazil)",
    "pt-pt": "Portuguese (Portugal)",
    "pt": "Portuguese",
    "qu-bo": "Quechua (Bolivia)",
    "qu-ec": "Quechua (Ecuador)",
    "qu-pe": "Quechua (Peru)",
    "qu": "Quechua",
    "rm": "Rhaeto-Romanic",
    "rn": "Kirundi",
    "ro": "Romanian",
    "ru": "Russian",
    "rw": "Kinyarwanda",
    "sa": "Sanskrit",
    "sb": "Sorbian",
    "sc": "Sardinian",
    "sd": "Sindhi",
    "se-fi": "Sami (Finland)",
    "se-no": "Sami (Norway)",
    "se-se": "Sami (Sweden)",
    "se": "Sami",
    "sg": "Sangro",
    "sh": "Serbo-Croatian",
    "si": "Singhalese",
    "sk": "Slovak",
    "sl": "Slovenian",
    "sm": "Samoan",
    "sn": "Shona",
    "so": "Somali",
    "sq": "Albanian",
    "sr-ba": "Serbian (Bosnia and Herzegovina)",
    "sr-sp": "Serbian (Serbia and Montenegro)",
    "sr": "Serbian",
    "ss": "Siswati",
    "st": "Sesotho",
    "su": "Sundanese",
    "sv-fi": "Swedish (Finland)",
    "sv-se": "Swedish (Sweden)",
    "sv": "Swedish",
    "sw": "Swahili",
    "sx": "Sutu",
    "syr": "Syriac",
    "ta": "Tamil",
    "te": "Telugu",
    "tg": "Tajik",
    "th": "Thai",
    "ti": "Tigrinya",
    "tk": "Turkmen",
    "tl": "Tagalog",
    "tn": "Tswana",
    "to": "Tonga",
    "tr": "Turkish",
    "ts": "Tsonga",
    "tt": "Tatar",
    "tw": "Twi",
    "ty": "Tahitian",
    "ug": "Uighur",
    "uk": "Ukrainian",
    "ur": "Urdu",
    "us": "English",
    "uz": "Uzbek",
    "ve": "Venda",
    "vi": "Vietnamese",
    "vo": "Volapuk",
    "wa": "Walloon",
    "wo": "Wolof",
    "xh": "Xhosa",
    "yi": "Yiddish",
    "yo": "Yoruba",
    "za": "Zhuang",
    "zh-cn": "Chinese (China)",
    "zh-hk": "Chinese (Hong Kong SAR)",
    "zh-mo": "Chinese (Macau SAR)",
    "zh-sg": "Chinese (Singapore)",
    "zh-tw": "Chinese (Taiwan)",
    "zh": "Chinese",
    "zu": "Zulu"
  };
}