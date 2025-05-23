///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint, unused_import

import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:slang/generated.dart';
import 'translations.g.dart';

// Path: <root>
class TranslationsKz implements Translations {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsKz({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.kz,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <kz>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key);

	late final TranslationsKz _root = this; // ignore: unused_field

	@override 
	TranslationsKz $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsKz(meta: meta ?? this.$meta);

	// Translations
	@override String get app_title => 'VOX';
	@override String get start_title => 'Бастау';
	@override String get continue_title => 'Жалғастыру';
	@override String get country_ru_title => 'Ресей';
	@override String get country_kz_title => 'Қазақстан';
	@override String get country_by_title => 'Беларусь';
	@override String get country_am_title => 'Армения';
	@override String get country_kg_title => 'Қырғызстан';
	@override String get wrong_code_title => 'Қате код';
	@override String get incoming_call_title => 'Кіріс қоңырау нөмірінің соңғы 4 цифрын енгізіңіз';
	@override String get did_not_receive_call_title => 'Қоңырау келмеді ме?';
	@override String get repeat_call_title => 'Қайта қоңырау шалу';
	@override String get confirm_title => 'Растау';
	@override String get enter_phone_title => 'Телефон нөмірін енгізіңіз';
	@override String get send_code_error_title => 'Код жіберу қатесі';
	@override String get code_sent_success_title => 'Код расталды!';
	@override String get code_verify_error_title => 'Растау қатесі';
	@override String get welcome_title => 'Қош келдіңіз';
	@override String get privacy_policy_title => 'Құпиялылық саясаты';
	@override String get agree_policy_text => '«Растау» түймесін басу арқылы мен оқып, келісемін ';
	@override String get privacy_policy_link_text => 'Жеке деректерді өңдеу саясатына';
	@override String get country_code_title => 'Ел коды';
	@override String get health_title => 'Денсаулық';
	@override String get health_description_title => 'Мұнда жақында сіздің үй жануарыңыздың денсаулығын бақылауға арналған бөлім пайда болады.';
	@override String get hello_user_title => 'Сәлем';
	@override String get pets_title => 'Үй жануарлары';
	@override String get my_addresses_title => 'Менің мекенжайларым';
	@override String get my_subscriptions_title => 'Менің жазылымдарым';
	@override String get orders_history_title => 'Тапсырыстар тарихы';
	@override String get socials_title => 'Біз әлеуметтік желілерде';
	@override String get info_title => 'Ақпарат';
	@override String get logout_title => 'Шығу';
	@override String get socials_footer_title => 'Біз әлеуметтік желілерде:';
	@override String get blog_tab_title => 'Блог';
	@override String get chat_tab_title => 'Чаттар';
	@override String get services_tab_title => 'Қызметтер';
	@override String get subscription_tab_title => 'Жазылым';
	@override String get health_tab_title => 'Денсаулық';
	@override String get not_found_service_title => 'Қажетті қызметті таппадыңыз ба?';
	@override String get not_found_service_full_text => 'Егер біздің қызметтеріміз арасында сізге қажеті болмаса, біздің операторларымызға чат арқылы жазыңыз — біз көмектесуге тырысамыз және бәрін ұйымдастырамыз!';
	@override String get chat_button_title => 'Чатқа жазу';
	@override String get logout_dialog_title => 'Аккаунттан шығу';
	@override String get logout_confirm_text => 'Сіз шынымен шығуды қалайсыз ба?';
	@override String get logout_confirm_button => 'Иә, шығу';
	@override String get logout_cancel_button => 'Бас тарту';
	@override String get ai_assistant_title => 'AI-ассистент «Байт»';
	@override String get ai_assistant_subtitle => 'Одан үй жануарыңыздың денсаулығы мен күтімі туралы сұраңыз.';
	@override String get boarding_service_info_title => 'Біздің қызметіміздегі уақытша күтім туралы білуіңіз керек барлық нәрсе';
	@override String get ask_question_button => 'Сұрақ қою';
	@override String get pet_sitting_title => 'Уақытша күтім';
	@override String get day_nanny_title => 'Күндізгі күтуші';
	@override String get to_specialist_title => 'Мамандарға апару';
	@override String get vet_groomer_title => 'Ветеринар/грумер';
	@override String get did_not_find_service_alt_title => 'Қажетті қызметті таппадыңыз ба?';
	@override String get take_to_vet_title => 'Ветеринарға апару';
	@override String get per_day => 'күніне';
	@override String get dog_services_title => 'иттерге арналған';
	@override String get cat_services_title => 'мысықтарға арналған';
	@override String get other_pets_services_title => 'басқа үй жануарларына арналған';
	@override String get many_pets_services_title => 'менде көп үй жануарлары бар!';
	@override String get price_from_text => 'бастап';
	@override String get name_field_label => 'Аты';
	@override String get name_hint => 'Петр';
	@override String get field_required_error => 'Өрісті толтырыңыз';
	@override String get phone_field_label => 'Телефон нөмірі';
	@override String get city_label => 'Қала';
	@override String get save_button_title => 'Сақтау';
	@override String get profile_title => 'Профиль';
	@override String get terms_of_offer_title => 'Ұсыныс шарты';
	@override String get license_agreement_title => 'Лицензиялық келісім';
	@override String get about_title => 'Бағдарлама туралы';
	@override String get city_of_residence => 'Город проживания';
	@override String get dog_walk_title => 'Выгул';
	@override String get from_30_min => 'от 30 минут';
	@override String get delete_account_title => 'Удалить';
	@override String get addresses_title => 'Адреса';
	@override String get no_addresses_text_title => 'У вас пока нет добавленных адресов, давайте это исправим!';
	@override String get add_address_button_title => 'Добавить адрес';
	@override String get add_address_title => 'Добавление адреса';
	@override String get address_name_title => 'Название адрес';
	@override String get address_example_name_title => 'Например, Ветеринар, Груминг, Дом';
	@override String get street_title => 'Улица';
	@override String get home_title => 'Дом';
	@override String get intercom_title => 'Домофон';
	@override String get floor_title => 'Этаж';
	@override String get flat_title => 'Квартира';
	@override String get establishment_name => 'Название заведения';
	@override String get establishment_example_name => 'Например, «ЛапаВет», «МурЧист»';
	@override String get comment_title => 'Комментарий';
	@override String get comment_detailed_title => 'Допишите важные детали, например особенности входа';
	@override String get do_you_wanna_delete_profile_title => 'Вы действительно хотите удалить профиль?';
	@override String get delete_profile_title => 'Удаление профиля';
	@override String get confirm_button_title => 'Да, удалить';
	@override String get cancel_button_title => 'Отмена';
	@override String get delete_address_title => 'Удалить адрес';
	@override String get where_to_take_walker_title => 'Куда привести выгульщика?';
	@override String get address_placeholder_title => 'Укажите адрес';
	@override String address_example_title({required Object address}) => 'ул. ${address}';
	@override String get specify_address_button_title => 'Уточнить';
	@override String get hide_all_button_title => 'Скрыть все';
	@override String get about_service_title => 'Выгул';
	@override String about_service_description_title({required Object duration}) => 'Длительность выгула — ${duration} минут. Если требуется больше времени, то можно сообщить об этом оператору, и он все устроит!';
}

/// Flat map(s) containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.
extension on TranslationsKz {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'app_title': return 'VOX';
			case 'start_title': return 'Бастау';
			case 'continue_title': return 'Жалғастыру';
			case 'country_ru_title': return 'Ресей';
			case 'country_kz_title': return 'Қазақстан';
			case 'country_by_title': return 'Беларусь';
			case 'country_am_title': return 'Армения';
			case 'country_kg_title': return 'Қырғызстан';
			case 'wrong_code_title': return 'Қате код';
			case 'incoming_call_title': return 'Кіріс қоңырау нөмірінің соңғы 4 цифрын енгізіңіз';
			case 'did_not_receive_call_title': return 'Қоңырау келмеді ме?';
			case 'repeat_call_title': return 'Қайта қоңырау шалу';
			case 'confirm_title': return 'Растау';
			case 'enter_phone_title': return 'Телефон нөмірін енгізіңіз';
			case 'send_code_error_title': return 'Код жіберу қатесі';
			case 'code_sent_success_title': return 'Код расталды!';
			case 'code_verify_error_title': return 'Растау қатесі';
			case 'welcome_title': return 'Қош келдіңіз';
			case 'privacy_policy_title': return 'Құпиялылық саясаты';
			case 'agree_policy_text': return '«Растау» түймесін басу арқылы мен оқып, келісемін ';
			case 'privacy_policy_link_text': return 'Жеке деректерді өңдеу саясатына';
			case 'country_code_title': return 'Ел коды';
			case 'health_title': return 'Денсаулық';
			case 'health_description_title': return 'Мұнда жақында сіздің үй жануарыңыздың денсаулығын бақылауға арналған бөлім пайда болады.';
			case 'hello_user_title': return 'Сәлем';
			case 'pets_title': return 'Үй жануарлары';
			case 'my_addresses_title': return 'Менің мекенжайларым';
			case 'my_subscriptions_title': return 'Менің жазылымдарым';
			case 'orders_history_title': return 'Тапсырыстар тарихы';
			case 'socials_title': return 'Біз әлеуметтік желілерде';
			case 'info_title': return 'Ақпарат';
			case 'logout_title': return 'Шығу';
			case 'socials_footer_title': return 'Біз әлеуметтік желілерде:';
			case 'blog_tab_title': return 'Блог';
			case 'chat_tab_title': return 'Чаттар';
			case 'services_tab_title': return 'Қызметтер';
			case 'subscription_tab_title': return 'Жазылым';
			case 'health_tab_title': return 'Денсаулық';
			case 'not_found_service_title': return 'Қажетті қызметті таппадыңыз ба?';
			case 'not_found_service_full_text': return 'Егер біздің қызметтеріміз арасында сізге қажеті болмаса, біздің операторларымызға чат арқылы жазыңыз — біз көмектесуге тырысамыз және бәрін ұйымдастырамыз!';
			case 'chat_button_title': return 'Чатқа жазу';
			case 'logout_dialog_title': return 'Аккаунттан шығу';
			case 'logout_confirm_text': return 'Сіз шынымен шығуды қалайсыз ба?';
			case 'logout_confirm_button': return 'Иә, шығу';
			case 'logout_cancel_button': return 'Бас тарту';
			case 'ai_assistant_title': return 'AI-ассистент «Байт»';
			case 'ai_assistant_subtitle': return 'Одан үй жануарыңыздың денсаулығы мен күтімі туралы сұраңыз.';
			case 'boarding_service_info_title': return 'Біздің қызметіміздегі уақытша күтім туралы білуіңіз керек барлық нәрсе';
			case 'ask_question_button': return 'Сұрақ қою';
			case 'pet_sitting_title': return 'Уақытша күтім';
			case 'day_nanny_title': return 'Күндізгі күтуші';
			case 'to_specialist_title': return 'Мамандарға апару';
			case 'vet_groomer_title': return 'Ветеринар/грумер';
			case 'did_not_find_service_alt_title': return 'Қажетті қызметті таппадыңыз ба?';
			case 'take_to_vet_title': return 'Ветеринарға апару';
			case 'per_day': return 'күніне';
			case 'dog_services_title': return 'иттерге арналған';
			case 'cat_services_title': return 'мысықтарға арналған';
			case 'other_pets_services_title': return 'басқа үй жануарларына арналған';
			case 'many_pets_services_title': return 'менде көп үй жануарлары бар!';
			case 'price_from_text': return 'бастап';
			case 'name_field_label': return 'Аты';
			case 'name_hint': return 'Петр';
			case 'field_required_error': return 'Өрісті толтырыңыз';
			case 'phone_field_label': return 'Телефон нөмірі';
			case 'city_label': return 'Қала';
			case 'save_button_title': return 'Сақтау';
			case 'profile_title': return 'Профиль';
			case 'terms_of_offer_title': return 'Ұсыныс шарты';
			case 'license_agreement_title': return 'Лицензиялық келісім';
			case 'about_title': return 'Бағдарлама туралы';
			case 'city_of_residence': return 'Город проживания';
			case 'dog_walk_title': return 'Выгул';
			case 'from_30_min': return 'от 30 минут';
			case 'delete_account_title': return 'Удалить';
			case 'addresses_title': return 'Адреса';
			case 'no_addresses_text_title': return 'У вас пока нет добавленных адресов, давайте это исправим!';
			case 'add_address_button_title': return 'Добавить адрес';
			case 'add_address_title': return 'Добавление адреса';
			case 'address_name_title': return 'Название адрес';
			case 'address_example_name_title': return 'Например, Ветеринар, Груминг, Дом';
			case 'street_title': return 'Улица';
			case 'home_title': return 'Дом';
			case 'intercom_title': return 'Домофон';
			case 'floor_title': return 'Этаж';
			case 'flat_title': return 'Квартира';
			case 'establishment_name': return 'Название заведения';
			case 'establishment_example_name': return 'Например, «ЛапаВет», «МурЧист»';
			case 'comment_title': return 'Комментарий';
			case 'comment_detailed_title': return 'Допишите важные детали, например особенности входа';
			case 'do_you_wanna_delete_profile_title': return 'Вы действительно хотите удалить профиль?';
			case 'delete_profile_title': return 'Удаление профиля';
			case 'confirm_button_title': return 'Да, удалить';
			case 'cancel_button_title': return 'Отмена';
			case 'delete_address_title': return 'Удалить адрес';
			case 'where_to_take_walker_title': return 'Куда привести выгульщика?';
			case 'address_placeholder_title': return 'Укажите адрес';
			case 'address_example_title': return ({required Object address}) => 'ул. ${address}';
			case 'specify_address_button_title': return 'Уточнить';
			case 'hide_all_button_title': return 'Скрыть все';
			case 'about_service_title': return 'Выгул';
			case 'about_service_description_title': return ({required Object duration}) => 'Длительность выгула — ${duration} минут. Если требуется больше времени, то можно сообщить об этом оператору, и он все устроит!';
			default: return null;
		}
	}
}

