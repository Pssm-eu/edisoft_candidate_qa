### Тестовое задание QA, Корнеев Евгений

Тесты:

	Проверка функционала скачивания: /features/web_download_test.feature 
	Проверка функционала REST API: /features/rest_api_test.feature
	Негативные тесты REST API: /features/rest_api_negative_tests.feature

Шаги:

	/features/step_definitions/web_download_steps.rb
	/features/step_definitions/rest_tests_steps.rb
	/features/step_definitions/rest_api_negative_tests_steps.rb


Конфигурационные файлы для запуска тестов в RubyMine:

	.idea/runConfigurations/rest_api_test_feature.xml
	.idea/runConfigurations/web_download_test_feature.xml
	.idea/runConfigurations/rest_api_negative_tests_feature.xml

Дополнительный помощник для проверки функционала скачивания:
	/features/support/download_helper.rb
