class LinkApp {
  static String server = "https://syriasell.app/syriasell";
  //static String server = "http://10.0.2.2/syriasell";
  static String users = "$server/users";
  static String admins = "$server/Admins";
  static String uploadItems = "$server/upload/proxy.php?file=Items/";
  static String uploadCategories = "$server/upload/proxy.php?file=categories/";
  static String SlidersCompany =
      "$server/upload/proxy.php?file=SlidersCompany/";
  static String JobOpportunities =
      "$server/upload/proxy.php?file=JobOpportunities/";

  static String testData = "$server/test.php";

// Auth
  static String signup = "$users/Auth/SignUp.php";
  static String signin = "$users/Auth/signin.php";
  static String reSendVerifycode = "$users/Auth/reSendVerifycode.php";
  static String confirmVerifyCode = "$users/Auth/confirmVerifyCode.php";
// اضاقي///////////
  static String accessCode = "$server/SuperAdmin/Auth/AccessCode.php";

  // ForgetPassword
  static String checkEmailPass = "$users/Auth/Forgetpass/checkemailgetpass.php";
  static String resetPass = "$users/Auth/Forgetpass/resetpass.php";
  static String verifiCodePass = "$users/Auth/Forgetpass/verificodepass.php";

  // ForgetAccessCode
  static String checkEmailAccessCode =
      "$server/SuperAdmin/Auth/ForgetAccessCode/checkemailgetAccessCode.php";
  static String verifiCodeAccessCode =
      "$server/SuperAdmin/Auth/ForgetAccessCode/verifiAccessCode.php";
  static String resetAccessCode =
      "$server/SuperAdmin/Auth/ForgetAccessCode/resetAccessCode.php";
// Items
  static String addItem = "$users/Items/add.php";
  static String deleteItem = "$users/Items/delete.php";
  static String editItem = "$users/Items/edit.php";
  static String viewItem = "$users/Items/view.php";
  static String viewItemId = "$users/Items/viewId.php";
  static String viewItemsCategId = "$users/Items/viewItemsCategId.php";
  static String searchItems = "$users/Items/search.php";

// Categories
  static String viewCategories = "$admins/Categories/view.php";

// Status
  static String viewStatus = "$admins/Status/view.php";
  // address
  static String viewCity = "$admins/Address/viewCity.php";
  // users
  static String viewUser = "$users/view.php";
  static String editUser = "$users/editUser.php";
  static String deleteUser = "$users/deleteUser.php";

  //-------orders-------
  static String viewReviewOrders = "$users/Orders/viewReviewOrders.php";
  static String viewPublishedOrders = "$users/Orders/viewPublishedOrders.php";
  static String deleteOrder = "$users/Orders/deleteOrder.php";
  // -------cars-------
  static String viewCarColors = "$users/Car/colors.php";
  static String viewCarCylinders = "$users/Car/cylinders.php";
  static String viewCarEngineCapacity = "$users/Car/engineCapacity.php";
  static String viewCarFuel = "$users/Car/fuel.php";
  static String viewCarMakers = "$users/Car/makers.php";
  static String viewCarTransmission = "$users/Car/transmission.php";
  static String viewCarYears = "$users/Car/years.php";

  // More Page
  static String viewAbout = "$users/MorePages/viewAbout.php";
  static String viewPrivacy = "$users/MorePages/viewPrivacy.php";
  static String viewTerms = "$users/MorePages/viewTerms.php";
  static String viewSupport = "$users/MorePages/viewSupport.php";

  // Favorite
  static String addFavorite = "$users/Favorite/AddFavorite.php";
  static String removeFavorite = "$users/Favorite/RemoveFavorite.php";
  static String viewFavorite = "$users/Favorite/viewFavorite.php";
  static String deleteFavorite = "$users/Favorite/deleteFavorite.php";

  //-----------Currency--------
  static String viewCurrency = "$users/currencies/viewcurrencies.php";

  //-----------SliderCompany--------
  static String viewsliderscompany = "$admins/SlidersCompany/view.php";

  //-----------JobOpp--------
  static String addJobOpportunity = "$users/Jobs/JobOpportunities/add.php";

  static String deleteJobOpportunity =
      "$users/Jobs/JobOpportunities/delete.php";
  static String editJobOpportunity = "$users/Jobs/JobOpportunities/edit.php";
  static String viewJobOpportunitiesUser =
      "$users/Jobs/JobOpportunities/view.php";

  static String viewallJobOpportunities =
      "$users/Jobs/viewJobOpportunities.php";

  static String viewJobOpportunitiesId =
      "$users/Jobs/JobOpportunities/viewJobOppId.php";

  // jobOppFavorite
  static String addFavoriteJobOpp = "$users/Jobs/Favorite/add.php";
  static String removeFavoriteJobOpp = "$users/Jobs/Favorite/remove.php";
  static String viewFavoriteJobOpp = "$users/Jobs/Favorite/view.php";
  static String deleteFavoriteJobOpp = "$users/Jobs/Favorite/delete.php";

//-----------JobAppliocation--------
  static String addJobApplication = "$users/Jobs/JobApplication/add.php";
  static String deleteJobApplication = "$users/Jobs/JobApplication/delete.php";
  static String editJobApplication = "$users/Jobs/JobApplication/edit.php";
  static String viewJobApplicationUser =
      "$users/Jobs/JobApplication/viewUser.php";

  static String viewallJobApplication =
      "$users/Jobs/JobApplication/viewJobAppAddress.php";

  static String viewJobApplicationId =
      "$users/Jobs/JobApplication/viewJobAppId.php";
  //---------Favorite App-----------------
  // jobAppFavorite
  static String addFavoriteJobApp = "$users/Jobs/FavoriteApp/add.php";
  static String removeFavoriteJobApp = "$users/Jobs/FavoriteApp/remove.php";
  static String viewFavoriteJobApp = "$users/Jobs/FavoriteApp/view.php";
  static String deleteFavoriteJobApp = "$users/Jobs/FavoriteApp/delete.php";

//----------------Likes-----------
  static String addLike = "$users/Likes/add.php";
  static String deleteLike = "$users/Likes/delete.php";
  static String countLike = "$users/Likes/count.php";

//----------------Comments-----------
  static String getComments = "$users/Comments/view.php";
  static String addComment = "$users/Comments/add.php";
  static String deleteComment = "$users/Comments/delete.php";
  static String updateComment = "$users/Comments/edit.php";
  static String getCommentsCount = "$users/Comments/count.php";
}
