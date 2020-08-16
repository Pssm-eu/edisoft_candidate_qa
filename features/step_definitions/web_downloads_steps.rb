When(/^я скачиваю последний стабильный релиз$/) do
  #find(:css, 'li:nth-child(1) li:nth-child(2) > a')).click
   find(:xpath, "//a[contains(text(),'Ruby 2.7.1')]").click
   $logger.info('Скачивание последнего стабильного релиза Ruby начато')
   sleep 5
end


When(/^проверяю что файл находится в нужной директории$/) do
  pending
  end

When(/^проверяю что имя скачанного файла совпадает с именем файла\-установщика$/) do
end
