import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('en'),
  ];

  /// No description provided for @appName.
  ///
  /// In ar, this message translates to:
  /// **'PrintVox'**
  String get appName;

  /// No description provided for @navCategories.
  ///
  /// In ar, this message translates to:
  /// **'الأقسام'**
  String get navCategories;

  /// No description provided for @navServices.
  ///
  /// In ar, this message translates to:
  /// **'نبذة عنا'**
  String get navServices;

  /// No description provided for @navPortfolio.
  ///
  /// In ar, this message translates to:
  /// **'أعمالنا'**
  String get navPortfolio;

  /// No description provided for @navWhyUs.
  ///
  /// In ar, this message translates to:
  /// **'لماذا نحن'**
  String get navWhyUs;

  /// No description provided for @navContact.
  ///
  /// In ar, this message translates to:
  /// **'تواصل'**
  String get navContact;

  /// No description provided for @btnOrderNow.
  ///
  /// In ar, this message translates to:
  /// **'اطلب الآن'**
  String get btnOrderNow;

  /// No description provided for @heroTitle.
  ///
  /// In ar, this message translates to:
  /// **'جاهزين لطباعة\nمشروعك القادم؟'**
  String get heroTitle;

  /// No description provided for @heroSubtitle.
  ///
  /// In ar, this message translates to:
  /// **'اترك بياناتك وسنتواصل معك خلال ساعة عمل، أو راسلنا مباشرة على واتساب\nلعرض سعر فوري.'**
  String get heroSubtitle;

  /// No description provided for @heroGetQuote.
  ///
  /// In ar, this message translates to:
  /// **'اطلب عرض سعر'**
  String get heroGetQuote;

  /// No description provided for @heroFullName.
  ///
  /// In ar, this message translates to:
  /// **'الاسم الكامل'**
  String get heroFullName;

  /// No description provided for @heroPhone.
  ///
  /// In ar, this message translates to:
  /// **'رقم الجوال'**
  String get heroPhone;

  /// No description provided for @heroOrderDetails.
  ///
  /// In ar, this message translates to:
  /// **'تفاصيل طلبك'**
  String get heroOrderDetails;

  /// No description provided for @heroSendOrder.
  ///
  /// In ar, this message translates to:
  /// **'أرسل الطلب'**
  String get heroSendOrder;

  /// No description provided for @btnWhatsapp.
  ///
  /// In ar, this message translates to:
  /// **'راسلنا على واتساب'**
  String get btnWhatsapp;

  /// No description provided for @lblLocation.
  ///
  /// In ar, this message translates to:
  /// **'الموقع'**
  String get lblLocation;

  /// No description provided for @valLocation.
  ///
  /// In ar, this message translates to:
  /// **'شارع ناهيا، بولاق الدكرور'**
  String get valLocation;

  /// No description provided for @lblPhone.
  ///
  /// In ar, this message translates to:
  /// **'الجوال'**
  String get lblPhone;

  /// No description provided for @valPhone.
  ///
  /// In ar, this message translates to:
  /// **'+20 110 011 3901'**
  String get valPhone;

  /// No description provided for @lblEmail.
  ///
  /// In ar, this message translates to:
  /// **'البريد'**
  String get lblEmail;

  /// No description provided for @valEmail.
  ///
  /// In ar, this message translates to:
  /// **'hello@printvox.sa'**
  String get valEmail;

  /// No description provided for @sectCategoriesTitle.
  ///
  /// In ar, this message translates to:
  /// **'القطاعات التي نخدمها'**
  String get sectCategoriesTitle;

  /// No description provided for @catCorporate.
  ///
  /// In ar, this message translates to:
  /// **'الشركات والمؤسسات'**
  String get catCorporate;

  /// No description provided for @catCorporateSub.
  ///
  /// In ar, this message translates to:
  /// **'Corporate'**
  String get catCorporateSub;

  /// No description provided for @catBakeries.
  ///
  /// In ar, this message translates to:
  /// **'المخابز والمطاعم'**
  String get catBakeries;

  /// No description provided for @catBakeriesSub.
  ///
  /// In ar, this message translates to:
  /// **'Bakeries & Food'**
  String get catBakeriesSub;

  /// No description provided for @catRetail.
  ///
  /// In ar, this message translates to:
  /// **'الأزياء والتجزئة'**
  String get catRetail;

  /// No description provided for @catRetailSub.
  ///
  /// In ar, this message translates to:
  /// **'Retail & Fashion'**
  String get catRetailSub;

  /// No description provided for @catBeach.
  ///
  /// In ar, this message translates to:
  /// **'البحر والمنتجعات'**
  String get catBeach;

  /// No description provided for @catBeachSub.
  ///
  /// In ar, this message translates to:
  /// **'Beach & Resorts'**
  String get catBeachSub;

  /// No description provided for @catPharma.
  ///
  /// In ar, this message translates to:
  /// **'الصيدلة والعناية'**
  String get catPharma;

  /// No description provided for @catPharmaSub.
  ///
  /// In ar, this message translates to:
  /// **'Pharma & Medical'**
  String get catPharmaSub;

  /// No description provided for @btnSeeMore.
  ///
  /// In ar, this message translates to:
  /// **'عرض المزيد'**
  String get btnSeeMore;

  /// No description provided for @ideasTitle1.
  ///
  /// In ar, this message translates to:
  /// **'نطبع'**
  String get ideasTitle1;

  /// No description provided for @ideasTitle2.
  ///
  /// In ar, this message translates to:
  /// **'أفكارك'**
  String get ideasTitle2;

  /// No description provided for @ideasTitle3.
  ///
  /// In ar, this message translates to:
  /// **'بجرأة'**
  String get ideasTitle3;

  /// No description provided for @ideasSubtitle.
  ///
  /// In ar, this message translates to:
  /// **'من تصميم الفكرة حتى وصولها بين يدي عميلك - حلول طباعة وتغليف بريميوم للمطاعم والمتاجر والشركات، بألوان تنبض وجودة تترك انطباعًا.'**
  String get ideasSubtitle;

  /// No description provided for @btnExploreServices.
  ///
  /// In ar, this message translates to:
  /// **'استكشف الخدمات'**
  String get btnExploreServices;

  /// No description provided for @statYears.
  ///
  /// In ar, this message translates to:
  /// **'سنوات خبرة'**
  String get statYears;

  /// No description provided for @statPrinted.
  ///
  /// In ar, this message translates to:
  /// **'قطعة مطبوعة سنوياً'**
  String get statPrinted;

  /// No description provided for @statClients.
  ///
  /// In ar, this message translates to:
  /// **'عميل سعيد'**
  String get statClients;

  /// No description provided for @statTime.
  ///
  /// In ar, this message translates to:
  /// **'متوسط التسليم'**
  String get statTime;

  /// No description provided for @portfolioTitle.
  ///
  /// In ar, this message translates to:
  /// **'أعمالنا'**
  String get portfolioTitle;

  /// No description provided for @tabLargeFormat.
  ///
  /// In ar, this message translates to:
  /// **'الإعلانات الكبيرة'**
  String get tabLargeFormat;

  /// No description provided for @tabPrint.
  ///
  /// In ar, this message translates to:
  /// **'المطبوعات'**
  String get tabPrint;

  /// No description provided for @tabBranding.
  ///
  /// In ar, this message translates to:
  /// **'البراندينج'**
  String get tabBranding;

  /// No description provided for @tabPackaging.
  ///
  /// In ar, this message translates to:
  /// **'التغليف'**
  String get tabPackaging;

  /// No description provided for @tabAll.
  ///
  /// In ar, this message translates to:
  /// **'الكل'**
  String get tabAll;

  /// No description provided for @whyUsTitle.
  ///
  /// In ar, this message translates to:
  /// **'لماذا يختارنا العملاء؟'**
  String get whyUsTitle;

  /// No description provided for @whyUsSubtitle.
  ///
  /// In ar, this message translates to:
  /// **'نحن لا نطبع فقط - نساعدك تبني تجربة علامة تجارية متكاملة، من أول لمسة تصميم حتى وصول المنتج.'**
  String get whyUsSubtitle;

  /// No description provided for @whyUsFastTitle.
  ///
  /// In ar, this message translates to:
  /// **'تسليم سريع'**
  String get whyUsFastTitle;

  /// No description provided for @whyUsFastDesc.
  ///
  /// In ar, this message translates to:
  /// **'خلال 48 ساعة للطلبات القياسية داخل القاهرة.'**
  String get whyUsFastDesc;

  /// No description provided for @whyUsQualityTitle.
  ///
  /// In ar, this message translates to:
  /// **'جودة مضمونة'**
  String get whyUsQualityTitle;

  /// No description provided for @whyUsQualityDesc.
  ///
  /// In ar, this message translates to:
  /// **'أحبار صديقة للغذاء ومواد معتمدة دولياً.'**
  String get whyUsQualityDesc;

  /// No description provided for @whyUsDesignTitle.
  ///
  /// In ar, this message translates to:
  /// **'تصميم لا يُنسى'**
  String get whyUsDesignTitle;

  /// No description provided for @whyUsDesignDesc.
  ///
  /// In ar, this message translates to:
  /// **'فريق مصممين يحوّل فكرتك إلى هوية بصرية متكاملة.'**
  String get whyUsDesignDesc;

  /// No description provided for @whyUsDeliveryTitle.
  ///
  /// In ar, this message translates to:
  /// **'توصيل للمدن'**
  String get whyUsDeliveryTitle;

  /// No description provided for @whyUsDeliveryDesc.
  ///
  /// In ar, this message translates to:
  /// **'شحن آمن لجميع المدن مع تتبع مباشر.'**
  String get whyUsDeliveryDesc;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['ar', 'en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar':
      return AppLocalizationsAr();
    case 'en':
      return AppLocalizationsEn();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
