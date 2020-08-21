# frozen_string_literal: true

When(/^добавляю пользователя без параметров имя фамилия пароль$/) do
  expect {
    response = $rest_wrap.post('/users')
  }.to raise_error(RuntimeError)
  $logger.info("Добавление пользователя с незаполненными полями - ошибка")
end

When(/^удаляю пользователя с несуществующим логином (\w+.\w+)$/) do |login|
  expect {
    id = find_id(login)
    response = $rest_wrap.delete('/users/' + id.to_s)
  }.to raise_error(RuntimeError)
  $logger.info("Удаление несуществующего пользователя - ошибка")
end

When(/^изменяю параметры несуществующего пользователя с логином (\w+\.\w+) на имя (\w+), фамилию (\w+), пароль ([\d\w@!#]+)$/) do
|login, name, surname, password|
  expect {
    id = find_id(login)
    response = $rest_wrap.put('/users/' + id.to_s, name: name, surname: surname, password: password)
  }.to raise_error(RuntimeError)
  $logger.info("Изменение параметров несуществующего пользователя - ошибка")
end