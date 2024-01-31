//--GLOBAL VARIABLES
//--------------------------------------------------------------------------------
//--DBName:
final dbName = 'dbName.db';

//--Application names:
const String APP_NAME = 'Warung Ruwaiskita';
const String APP_DESC =
    'Ruwais Community Online Shop'; //'MHzPOS for Abu Rasya';
const String TAG_LINE = 'Simple but usefull for anyone';
const String WA_ADMIN = '971562681844';
const String APP_VERSI = '2.40120.01';

//--SERVICES:
const String BASE_URL = "http://10.0.2.2:8000"; // Emulator-Laravel-Localhost
// const String BASE_URL = "http://192.168.0.102:8000"; // Localhost-Chrome (58512)
// const String BASE_URL = "https://fic10.flutterdev.my.id/api/"; //--Real Web
// const String BASE_URL = 'http://10.0.2.2/ci4-kinclong/api/'; // Emulator
// const String BASE_URL = "http://10.0.2.2/tron-siode/"; // Emulator
// const String BASE_URL = "https://reqres.in/api/"; // Free API: 1. 'reqres'
// const String BASE_URL = 'http://192.168.0.181/trg-kamsya/'; // Emulator with Real Device or Website
const String API_URL_1 =
    "https://fakestoreapi.com/"; // Free API: 2. 'fakestoreapi'
const String BASE_URL_IMAGE = BASE_URL + "/uploads/";

//--SIZES:: Padding:
// --------------------------------------------------
const double kDefaultPadding = 20.0;

//--SIZES:: Responsive:
// --------------------------------------------------
const kMobileWidth = 600; // max-width
const kTabletWdth = 1200;

//--TIMES:
const int TIME_OUT_DURATION = 30; //--Seconds
const kAnimationDuration = Duration(milliseconds: 200);
const kDefaultDuration = Duration(milliseconds: 250);

//--Table Category:
final tableCategoryName = 'Category';
final colMainCategoryId = 'ID';
final colMainCategoryName = 'Name';
final colMainCategoryImage = 'Image';

//--Table Question:
final tableQuestionName = 'Question';
final colQuestionId = 'ID';
final colQuestionText = 'QuestionText';
final colQuestionIsImage = 'IsImageQuestion';
final colQuestionImage = 'QuestionImage';
final colQuestionAnswerA = 'AnswerA';
final colQuestionAnswerB = 'AnswerB';
final colQuestionAnswerC = 'AnswerC';
final colQuestionAnswerD = 'AnswerD';
final colQuestionCorrectAnswer = 'CorrectAnswer';
final colQuestionCategoryId = 'CategoryID';

// Strings Message:
//--ENGLISH--------------------------------------------------
const String sSuccess = "Great";
const String sFail = "Failed";
const String sError = "Eror";

const String sMsgSuccessExecution =
    "Process sucessfully executed"; //"Proses berhasil di eksekusi";
const String sMsgSuccessAddData =
    "New data sucessfully added"; //"Data baru berhasil di tambahkan";
const String sMsgSuccessUpdateData =
    "Data sucessfully updated"; //"Data berhasil di perbaharui";
const String sMsgSuccessDeleteData =
    "Data sucessfully deleted"; //"Data berhasil di hapus";

const String sMsgFailExecution =
    "Process failed to be executed"; //"Proses gagal di eksekusi";
const String sMsgFailAddData =
    "New data failed to be added"; //"Data baru gagal di tambahkan";
const String sMsgFailUpdateData =
    "Data failed to be updated"; //"Data gagal di perbaharui";
const String sMsgFailDeleteData =
    "Data failed to be deleted"; //"Data gagal di hapus";

const String sAuthFail = "User ID is not registered, or Wrong Password!";

//--INDO--------------------------------------------------
// const String sSuccess = "Sukses";
// const String sFail = "Gagal";
// const String sError = "Eror";

// const String sMsgSuccessExecution = "Proses berhasil di eksekusi";//"Process sucessfully executed";//
// const String sMsgSuccessAddData = "Data baru berhasil di tambahkan";
// const String sMsgSuccessUpdateData = "Data berhasil di perbaharui";
// const String sMsgSuccessDeleteData = "Data berhasil di hapus";

// const String sMsgFailExecution = "Proses gagal di eksekusi";
// const String sMsgFailAddData = "Data baru gagal di tambahkan";
// const String sMsgFailUpdateData = "Data gagal di perbaharui";
// const String sMsgFailDeleteData = "Data gagal di hapus";//"Data failed to be deleted";//

// const String sAuthFail = "Pengguna ID tidak terdaftar, atau Password Salah!";
//

// Validations:
// --------------------------------------------------
final RegExp kEmailValidatorRegExp =
    RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
const String kUserNullError = "Please Enter your User ID";
const String kPassNullError = "Please Enter your Password";
const String kEmailNullError = "Please Enter Valid Email";
const String kInvalidEmailError = "Please Enter Valid Email";
const String kFieldNullError = "The field cannot be empty";
const String kShortPassError = "Password is too short";
const String kMatchPassError = "Passwords doesn't match";
const String kNamelNullError = "Please Enter your name";
const String kPhoneNumberNullError = "Please Enter your phone number";
const String kAddressNullError = "Please Enter your address";

// const String kUserNullError =
//     "Silahkan masukan ID Pengguna";
// const String kPassNullError = "Silahkan masukan Password";
// const String kEmailNullError =
//     "Silahkan masukan email";
// const String kInvalidEmailError =
//     "Silahkan masukan format email yang benar";
// const String kFieldNullError =
//     "Kolom tidak boleh kosong";
// const String kShortPassError = "Password is too short";
// const String kMatchPassError = "Passwords doesn't match";
// const String kNamelNullError = "Please Enter your name";
// const String kPhoneNumberNullError = "Please Enter your phone number";
// const String kAddressNullError = "Please Enter your address";
