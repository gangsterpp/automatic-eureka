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
class TranslationsAm implements Translations {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsAm({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.am,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <am>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key);

	late final TranslationsAm _root = this; // ignore: unused_field

	@override 
	TranslationsAm $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsAm(meta: meta ?? this.$meta);

	// Translations
	@override String get app_title => 'VOX';
	@override String get start_title => 'Սկսել';
	@override String get continue_title => 'Շարունակել';
	@override String get country_ru_title => 'Ռուսաստան';
	@override String get country_kz_title => 'Ղազախստան';
	@override String get country_by_title => 'Բելառուս';
	@override String get country_am_title => 'Հայաստան';
	@override String get country_kg_title => 'Ղրղզստան';
	@override String get wrong_code_title => 'Սխալ կոդ';
	@override String get incoming_call_title => 'Մուտքային զանգի համարի վերջին 4 թվանշանները մուտքագրեք';
	@override String get did_not_receive_call_title => 'Չե՞ք ստացել զանգը։';
	@override String get repeat_call_title => 'Պատվիրել կրկնակի զանգ';
	@override String get confirm_title => 'Հաստատել';
	@override String get enter_phone_title => 'Մուտքագրեք հեռախոսահամարը';
	@override String get send_code_error_title => 'Կոդի ուղարկման սխալ';
	@override String get code_sent_success_title => 'Կոդը հաստատվել է։';
	@override String get code_verify_error_title => 'Հաստատման սխալ';
	@override String get welcome_title => 'Բարի գալուստ';
	@override String get privacy_policy_title => 'Գաղտնիության քաղաքականություն';
	@override String get agree_policy_text => 'Սեղմելով «Հաստատել», ես կարդացել եմ և համաձայն եմ ';
	@override String get privacy_policy_link_text => 'Անձնական տվյալների մշակման քաղաքականությանը';
	@override String get country_code_title => 'Երկրի կոդ';
	@override String get health_title => 'Առողջություն';
	@override String get health_description_title => 'Շուտով այստեղ կլինի բաժին, որտեղ կարող եք հետևել ձեր ընտանի կենդանու առողջությանը։';
	@override String get hello_user_title => 'Բարև';
	@override String get pets_title => 'Ընտանի կենդանիներ';
	@override String get my_addresses_title => 'Իմ հասցեները';
	@override String get my_subscriptions_title => 'Իմ բաժանորդագրությունները';
	@override String get orders_history_title => 'Պատվերների պատմություն';
	@override String get socials_title => 'Մենք սոցիալական ցանցերում';
	@override String get info_title => 'Տեղեկություն';
	@override String get logout_title => 'Դուրս գալ';
	@override String get socials_footer_title => 'Մենք սոցիալական ցանցերում։';
	@override String get blog_tab_title => 'Բլոգ';
	@override String get chat_tab_title => 'Զրույցներ';
	@override String get services_tab_title => 'Ծառայություններ';
	@override String get subscription_tab_title => 'Բաժանորդագրություն';
	@override String get health_tab_title => 'Առողջություն';
	@override String get not_found_service_title => 'Չե՞ք գտել անհրաժեշտ ծառայությունը։';
	@override String get not_found_service_full_text => 'Եթե մեր ծառայությունների մեջ չկա անհրաժեշտը, գրեք մեր օպերատորներին զրույցում — մենք կփորձենք օգնել և ամեն ինչ կազմակերպել։';
	@override String get chat_button_title => 'Գրել զրույցում';
	@override String get logout_dialog_title => 'Դուրս գալ հաշիվից';
	@override String get logout_confirm_text => 'Իսկապե՞ս ցանկանում եք դուրս գալ։';
	@override String get logout_confirm_button => 'Այո, դուրս գալ';
	@override String get logout_cancel_button => 'Չեղարկել';
	@override String get ai_assistant_title => 'AI օգնական «Բայթ»';
	@override String get ai_assistant_subtitle => 'Հարցրեք նրան ձեր ընտանի կենդանու առողջության և խնամքի մասին։';
	@override String get boarding_service_info_title => 'Ամեն ինչ, ինչ պետք է իմանալ մեր ծառայությունում ժամանակավոր խնամքի մասին';
	@override String get ask_question_button => 'Տալ հարց';
	@override String get pet_sitting_title => 'Ժամանակավոր խնամք';
	@override String get day_nanny_title => 'Օրվա դայակ';
	@override String get to_specialist_title => 'Տանել մասնագետի մոտ';
	@override String get vet_groomer_title => 'Վետերինար/գրումեր';
	@override String get did_not_find_service_alt_title => 'Չե՞ք գտել անհրաժեշտ ծառայությունը։';
	@override String get take_to_vet_title => 'Տանել վետերինարի մոտ';
	@override String get per_day => 'օրական';
	@override String get dog_services_title => 'շների համար';
	@override String get cat_services_title => 'կատուների համար';
	@override String get other_pets_services_title => 'այլ ընտանի կենդանիների համար';
	@override String get many_pets_services_title => 'ես ունեմ շատ ընտանի կենդանիներ։';
	@override String get price_from_text => 'սկսած';
	@override String get name_field_label => 'Անուն';
	@override String get name_hint => 'Պետրոս';
	@override String get field_required_error => 'Լրացրեք դաշտը';
	@override String get phone_field_label => 'Հեռախոսահամար';
	@override String get city_label => 'Քաղաք';
	@override String get save_button_title => 'Պահպանել';
	@override String get profile_title => 'Պրոֆիլ';
	@override String get terms_of_offer_title => 'Առաջարկի պայմանագիր';
	@override String get license_agreement_title => 'Լիցենզիայի համաձայնագիր';
	@override String get about_title => 'Ծրագրի մասին';
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
extension on TranslationsAm {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'app_title': return 'VOX';
			case 'start_title': return 'Սկսել';
			case 'continue_title': return 'Շարունակել';
			case 'country_ru_title': return 'Ռուսաստան';
			case 'country_kz_title': return 'Ղազախստան';
			case 'country_by_title': return 'Բելառուս';
			case 'country_am_title': return 'Հայաստան';
			case 'country_kg_title': return 'Ղրղզստան';
			case 'wrong_code_title': return 'Սխալ կոդ';
			case 'incoming_call_title': return 'Մուտքային զանգի համարի վերջին 4 թվանշանները մուտքագրեք';
			case 'did_not_receive_call_title': return 'Չե՞ք ստացել զանգը։';
			case 'repeat_call_title': return 'Պատվիրել կրկնակի զանգ';
			case 'confirm_title': return 'Հաստատել';
			case 'enter_phone_title': return 'Մուտքագրեք հեռախոսահամարը';
			case 'send_code_error_title': return 'Կոդի ուղարկման սխալ';
			case 'code_sent_success_title': return 'Կոդը հաստատվել է։';
			case 'code_verify_error_title': return 'Հաստատման սխալ';
			case 'welcome_title': return 'Բարի գալուստ';
			case 'privacy_policy_title': return 'Գաղտնիության քաղաքականություն';
			case 'agree_policy_text': return 'Սեղմելով «Հաստատել», ես կարդացել եմ և համաձայն եմ ';
			case 'privacy_policy_link_text': return 'Անձնական տվյալների մշակման քաղաքականությանը';
			case 'country_code_title': return 'Երկրի կոդ';
			case 'health_title': return 'Առողջություն';
			case 'health_description_title': return 'Շուտով այստեղ կլինի բաժին, որտեղ կարող եք հետևել ձեր ընտանի կենդանու առողջությանը։';
			case 'hello_user_title': return 'Բարև';
			case 'pets_title': return 'Ընտանի կենդանիներ';
			case 'my_addresses_title': return 'Իմ հասցեները';
			case 'my_subscriptions_title': return 'Իմ բաժանորդագրությունները';
			case 'orders_history_title': return 'Պատվերների պատմություն';
			case 'socials_title': return 'Մենք սոցիալական ցանցերում';
			case 'info_title': return 'Տեղեկություն';
			case 'logout_title': return 'Դուրս գալ';
			case 'socials_footer_title': return 'Մենք սոցիալական ցանցերում։';
			case 'blog_tab_title': return 'Բլոգ';
			case 'chat_tab_title': return 'Զրույցներ';
			case 'services_tab_title': return 'Ծառայություններ';
			case 'subscription_tab_title': return 'Բաժանորդագրություն';
			case 'health_tab_title': return 'Առողջություն';
			case 'not_found_service_title': return 'Չե՞ք գտել անհրաժեշտ ծառայությունը։';
			case 'not_found_service_full_text': return 'Եթե մեր ծառայությունների մեջ չկա անհրաժեշտը, գրեք մեր օպերատորներին զրույցում — մենք կփորձենք օգնել և ամեն ինչ կազմակերպել։';
			case 'chat_button_title': return 'Գրել զրույցում';
			case 'logout_dialog_title': return 'Դուրս գալ հաշիվից';
			case 'logout_confirm_text': return 'Իսկապե՞ս ցանկանում եք դուրս գալ։';
			case 'logout_confirm_button': return 'Այո, դուրս գալ';
			case 'logout_cancel_button': return 'Չեղարկել';
			case 'ai_assistant_title': return 'AI օգնական «Բայթ»';
			case 'ai_assistant_subtitle': return 'Հարցրեք նրան ձեր ընտանի կենդանու առողջության և խնամքի մասին։';
			case 'boarding_service_info_title': return 'Ամեն ինչ, ինչ պետք է իմանալ մեր ծառայությունում ժամանակավոր խնամքի մասին';
			case 'ask_question_button': return 'Տալ հարց';
			case 'pet_sitting_title': return 'Ժամանակավոր խնամք';
			case 'day_nanny_title': return 'Օրվա դայակ';
			case 'to_specialist_title': return 'Տանել մասնագետի մոտ';
			case 'vet_groomer_title': return 'Վետերինար/գրումեր';
			case 'did_not_find_service_alt_title': return 'Չե՞ք գտել անհրաժեշտ ծառայությունը։';
			case 'take_to_vet_title': return 'Տանել վետերինարի մոտ';
			case 'per_day': return 'օրական';
			case 'dog_services_title': return 'շների համար';
			case 'cat_services_title': return 'կատուների համար';
			case 'other_pets_services_title': return 'այլ ընտանի կենդանիների համար';
			case 'many_pets_services_title': return 'ես ունեմ շատ ընտանի կենդանիներ։';
			case 'price_from_text': return 'սկսած';
			case 'name_field_label': return 'Անուն';
			case 'name_hint': return 'Պետրոս';
			case 'field_required_error': return 'Լրացրեք դաշտը';
			case 'phone_field_label': return 'Հեռախոսահամար';
			case 'city_label': return 'Քաղաք';
			case 'save_button_title': return 'Պահպանել';
			case 'profile_title': return 'Պրոֆիլ';
			case 'terms_of_offer_title': return 'Առաջարկի պայմանագիր';
			case 'license_agreement_title': return 'Լիցենզիայի համաձայնագիր';
			case 'about_title': return 'Ծրագրի մասին';
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

