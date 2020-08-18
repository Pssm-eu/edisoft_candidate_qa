# frozen_string_literal: true

When(/^я скачиваю последний стабильный релиз$/) do
   find(:xpath, "//a[contains(text(),'Ruby 2.7.1')]").click
   $logger.info('Скачивание последнего стабильного релиза Ruby начато')
   sleep 20
end


When(/^проверяю что файл находится в нужной директории$/) do
  expect(File).to exist('features/tmp/ruby-2.7.1.tar.gz')
  $logger.info('Файл обнаружен')
  end

When(/^проверяю что имя скачанного файла совпадает с именем файла\-установщика$/) do
end


When(/^проверить, какая версия является последним стабильным релизом$/) do
  pending
end