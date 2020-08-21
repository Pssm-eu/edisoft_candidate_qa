# frozen_string_literal: true

When(/^захожу на страницу "(.+?)"$/) do |url|
  visit url
  $logger.info("Страница #{url} открыта")
end

When(/^перехожу на вкладку скачать$/) do
    find(:xpath, '/html/body/div[1]/div/div[1]/a[2]').click
    $logger.info("Открыта страница загрузки")
  end

When(/^проверяю версию Ruby на странице$/) do
  $ver_stable = check_stable
  $logger.info("Последняя стабильная версия: #{$ver_stable}")
end

When(/^скачиваю последний стабильный релиз$/) do
  download_stable
  $logger.info("Скачивание завершено")
end

When(/^проверяю скачанный файл$/) do
  check_downloaded
  $logger.info("Файл находится в: #{$tmp_folder}")
  $logger.info("Название файла: #{$contents}")
  $logger.info("Версия установщика: #{$ver_downloaded}")
end

When(/^сравниваю версии$/) do
  compare_vers
end

When(/^очищаю временные файлы$/) do
  FileUtils.rm_rf('features/tmp/')
  $logger.info('Временные файлы удалены')
end


