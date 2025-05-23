///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint, unused_import

part of 'translations.g.dart';

// Path: <root>
typedef TranslationsRu = Translations; // ignore: unused_element
class Translations implements BaseTranslations<AppLocale, Translations> {
	/// Returns the current translations of the given [context].
	///
	/// Usage:
	/// final t = Translations.of(context);
	static Translations of(BuildContext context) => InheritedLocaleData.of<AppLocale, Translations>(context).translations;

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	Translations({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.ru,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <ru>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	dynamic operator[](String key) => $meta.getTranslation(key);

	late final Translations _root = this; // ignore: unused_field

	Translations $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => Translations(meta: meta ?? this.$meta);

	// Translations
	String get app_title => 'VOX';
	String get start_title => 'Начать';
	String get continue_title => 'Продолжить';
	String get country_ru_title => 'Россия';
	String get country_kz_title => 'Казахстан';
	String get country_by_title => 'Беларусь';
	String get country_am_title => 'Армения';
	String get country_kg_title => 'Кыргызстан';
	String get wrong_code_title => 'Неверный код';
	String get incoming_call_title => 'Введите последние 4 цифры\nномера входящего звонка';
	String get did_not_receive_call_title => 'Не получили звонок?';
	String get repeat_call_title => 'Заказать повторный';
	String get confirm_title => 'Подтвердить';
	String get enter_phone_title => 'Введите номер телефона';
	String get send_code_error_title => 'Ошибка отправки кода';
	String get code_sent_success_title => 'Код подтвержден!';
	String get code_verify_error_title => 'Ошибка подтверждения';
	String get welcome_title => 'Добро пожаловать';
	String get privacy_policy_title => 'Политика конфиденциальности';
	String get agree_policy_text => 'Нажимая «Подтвердить», я прочитал и согласен \nс ';
	String get privacy_policy_link_text => 'Политикой обработки персональных данных';
	String get country_code_title => 'Код страны';
	String get health_title => 'Здоровье';
	String get health_description_title => 'Здесь скоро будет раздел, в котором можно будет отслеживать здоровье вашего питомца.';
	String get hello_user_title => 'Привет';
	String get pets_title => 'Питомцы';
	String get my_addresses_title => 'Мои адреса';
	String get my_subscriptions_title => 'Мои абонементы';
	String get orders_history_title => 'История заказов';
	String get socials_title => 'Мы в соцсетях';
	String get info_title => 'Информация';
	String get logout_title => 'Выйти';
	String get socials_footer_title => 'Мы в соцсетях:';
	String get blog_tab_title => 'Блог';
	String get chat_tab_title => 'Чаты';
	String get services_tab_title => 'Услуги';
	String get subscription_tab_title => 'Абонемент';
	String get health_tab_title => 'Здоровье';
	String get not_found_service_title => 'Не нашли нужную услугу?';
	String get not_found_service_full_text => 'Если среди наших услуг нет нужной вам, напишите нашим операторам в чат — мы постараемся помочь и всё организовать!';
	String get chat_button_title => 'Написать в чат';
	String get logout_dialog_title => 'Выход из аккаунта';
	String get logout_confirm_text => 'Вы действительно хотите выйти?';
	String get logout_confirm_button => 'Да, выйти';
	String get logout_cancel_button => 'Отмена';
	String get ai_assistant_title => 'AI-ассистент «Байт»\n';
	String get ai_assistant_subtitle => 'Спросите его о здоровье\nи уходе за питомцем.';
	String get boarding_service_info_title => 'Всё, что нужно знать о передержке\nв нашем сервисе';
	String get ask_question_button => 'Задать вопрос';
	String get pet_sitting_title => 'Передержка';
	String get day_nanny_title => 'Дневная няня';
	String get to_specialist_title => 'Отвести\nк специалисту';
	String get vet_groomer_title => 'Ветеринар/грумер';
	String get did_not_find_service_alt_title => 'Не нашли нужную\nуслугу?';
	String get take_to_vet_title => 'Отвести\nк ветеринару';
	String get per_day => 'в день';
	String get dog_services_title => 'для собак';
	String get cat_services_title => 'для кошек';
	String get other_pets_services_title => 'для других питомцев';
	String get many_pets_services_title => 'у меня много питомцев!';
	String get price_from_text => 'от';
	String get name_field_label => 'Имя';
	String get name_hint => 'Петр';
	String get field_required_error => 'Заполните поле';
	String get phone_field_label => 'Номер телефона';
	String get city_label => 'Город';
	String get save_button_title => 'Сохранить';
	String get profile_title => 'Профиль';
	String get terms_of_offer_title => 'Договор оферты';
	String get license_agreement_title => 'Лицензионное соглашение';
	String get about_title => 'О программе';
	String get city_of_residence => 'Город проживания';
	String get dog_walk_title => 'Выгул';
	String get from_30_min => 'от 30 минут';
	String get delete_account_title => 'Удалить';
	String get addresses_title => 'Адреса';
	String get no_addresses_text_title => 'У вас пока нет добавленных адресов, давайте это исправим!';
	String get add_address_button_title => 'Добавить адрес';
	String get add_address_title => 'Добавление адреса';
	String get address_name_title => 'Название адрес';
	String get address_example_name_title => 'Например, Ветеринар, Груминг, Дом';
	String get street_title => 'Улица';
	String get home_title => 'Дом';
	String get intercom_title => 'Домофон';
	String get floor_title => 'Этаж';
	String get flat_title => 'Квартира';
	String get establishment_name => 'Название заведения';
	String get establishment_example_name => 'Например, «ЛапаВет», «МурЧист»';
	String get comment_title => 'Комментарий';
	String get comment_detailed_title => 'Допишите важные детали, например особенности входа';
	String get do_you_wanna_delete_profile_title => 'Вы действительно хотите удалить профиль?';
	String get delete_profile_title => 'Удаление профиля';
	String get confirm_button_title => 'Да, удалить';
	String get cancel_button_title => 'Отмена';
	String get delete_address_title => 'Удалить адрес';
	String get where_to_take_walker_title => 'Куда привести выгульщика?';
	String get address_placeholder_title => 'Укажите адрес';
	String address_example_title({required Object address}) => 'ул. ${address}';
	String get specify_address_button_title => 'Уточнить';
	String get hide_all_button_title => 'Скрыть все';
	String get about_service_title => 'Выгул';
	String about_service_description_title({required Object duration}) => 'Длительность выгула — ${duration} минут. Если требуется больше времени, то можно сообщить об этом оператору, и он все устроит!';
}

/// Flat map(s) containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.
extension on Translations {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'app_title': return 'VOX';
			case 'start_title': return 'Начать';
			case 'continue_title': return 'Продолжить';
			case 'country_ru_title': return 'Россия';
			case 'country_kz_title': return 'Казахстан';
			case 'country_by_title': return 'Беларусь';
			case 'country_am_title': return 'Армения';
			case 'country_kg_title': return 'Кыргызстан';
			case 'wrong_code_title': return 'Неверный код';
			case 'incoming_call_title': return 'Введите последние 4 цифры\nномера входящего звонка';
			case 'did_not_receive_call_title': return 'Не получили звонок?';
			case 'repeat_call_title': return 'Заказать повторный';
			case 'confirm_title': return 'Подтвердить';
			case 'enter_phone_title': return 'Введите номер телефона';
			case 'send_code_error_title': return 'Ошибка отправки кода';
			case 'code_sent_success_title': return 'Код подтвержден!';
			case 'code_verify_error_title': return 'Ошибка подтверждения';
			case 'welcome_title': return 'Добро пожаловать';
			case 'privacy_policy_title': return 'Политика конфиденциальности';
			case 'agree_policy_text': return 'Нажимая «Подтвердить», я прочитал и согласен \nс ';
			case 'privacy_policy_link_text': return 'Политикой обработки персональных данных';
			case 'country_code_title': return 'Код страны';
			case 'health_title': return 'Здоровье';
			case 'health_description_title': return 'Здесь скоро будет раздел, в котором можно будет отслеживать здоровье вашего питомца.';
			case 'hello_user_title': return 'Привет';
			case 'pets_title': return 'Питомцы';
			case 'my_addresses_title': return 'Мои адреса';
			case 'my_subscriptions_title': return 'Мои абонементы';
			case 'orders_history_title': return 'История заказов';
			case 'socials_title': return 'Мы в соцсетях';
			case 'info_title': return 'Информация';
			case 'logout_title': return 'Выйти';
			case 'socials_footer_title': return 'Мы в соцсетях:';
			case 'blog_tab_title': return 'Блог';
			case 'chat_tab_title': return 'Чаты';
			case 'services_tab_title': return 'Услуги';
			case 'subscription_tab_title': return 'Абонемент';
			case 'health_tab_title': return 'Здоровье';
			case 'not_found_service_title': return 'Не нашли нужную услугу?';
			case 'not_found_service_full_text': return 'Если среди наших услуг нет нужной вам, напишите нашим операторам в чат — мы постараемся помочь и всё организовать!';
			case 'chat_button_title': return 'Написать в чат';
			case 'logout_dialog_title': return 'Выход из аккаунта';
			case 'logout_confirm_text': return 'Вы действительно хотите выйти?';
			case 'logout_confirm_button': return 'Да, выйти';
			case 'logout_cancel_button': return 'Отмена';
			case 'ai_assistant_title': return 'AI-ассистент «Байт»\n';
			case 'ai_assistant_subtitle': return 'Спросите его о здоровье\nи уходе за питомцем.';
			case 'boarding_service_info_title': return 'Всё, что нужно знать о передержке\nв нашем сервисе';
			case 'ask_question_button': return 'Задать вопрос';
			case 'pet_sitting_title': return 'Передержка';
			case 'day_nanny_title': return 'Дневная няня';
			case 'to_specialist_title': return 'Отвести\nк специалисту';
			case 'vet_groomer_title': return 'Ветеринар/грумер';
			case 'did_not_find_service_alt_title': return 'Не нашли нужную\nуслугу?';
			case 'take_to_vet_title': return 'Отвести\nк ветеринару';
			case 'per_day': return 'в день';
			case 'dog_services_title': return 'для собак';
			case 'cat_services_title': return 'для кошек';
			case 'other_pets_services_title': return 'для других питомцев';
			case 'many_pets_services_title': return 'у меня много питомцев!';
			case 'price_from_text': return 'от';
			case 'name_field_label': return 'Имя';
			case 'name_hint': return 'Петр';
			case 'field_required_error': return 'Заполните поле';
			case 'phone_field_label': return 'Номер телефона';
			case 'city_label': return 'Город';
			case 'save_button_title': return 'Сохранить';
			case 'profile_title': return 'Профиль';
			case 'terms_of_offer_title': return 'Договор оферты';
			case 'license_agreement_title': return 'Лицензионное соглашение';
			case 'about_title': return 'О программе';
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

