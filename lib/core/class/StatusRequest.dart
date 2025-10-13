// I create the enum class contains statuse connection
enum StatusRequest {
  none, // قيمة افتراضية فارغة
  loading, // اتصال
  success,
  failure, // statues get :no data / statues post :no refresh
  serverfailure, // فشل بالسيرفر
  serverfException, // فشل بالسيرفر
  offlinefailure, // فشل اتصال
}
