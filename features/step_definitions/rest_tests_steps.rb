# frozen_string_literal: true

When(/^получаю информацию о пользователях$/) do
  users_full_information = $rest_wrap.get('/users')

  $logger.info('Информация о пользователях получена')
  @scenario_data.users_full_info = users_full_information
  $logger.info("#{users_full_information}")
end

When(/^проверяю (наличие|отсутствие) логина (\w+\.\w+) в списке пользователей$/) do |presence, login|
  search_login_in_list = true
  presence == 'отсутствие' ? search_login_in_list = !search_login_in_list : search_login_in_list

  logins_from_site = @scenario_data.users_full_info.map { |f| f.try(:[], 'login') }
  login_presents = logins_from_site.include?(login)

  if login_presents
    message = "Логин #{login} присутствует в списке пользователей"
    search_login_in_list ? $logger.info(message) : raise(message)
  else
    message = "Логин #{login} отсутствует в списке пользователей"
    search_login_in_list ? raise(message) : $logger.info(message)
  end
end

When(/^добавляю пользователя c логином (\w+\.\w+) именем (\w+) фамилией (\w+) паролем ([\d\w@!#]+)$/) do
|login, name, surname, password|

  response = $rest_wrap.post('/users', login: login,
                             name: name,
                             surname: surname,
                             password: password,
                             active: 1)
  $logger.info(response.inspect)
end


When(/^нахожу пользователя с логином (\w+\.\w+)$/) do |login|
  step %(получаю информацию о пользователях)
  if @scenario_data.users_id[login].nil?
    @scenario_data.users_id[login] = find_user_id(users_information: @scenario_data
                                                                         .users_full_info,
                                                  user_login: login)
  end

  $logger.info("Найден пользователь #{login} с id:#{@scenario_data.users_id[login]}")
end


When(/^удаляю пользователя с логином (\w+\.\w+)$/) do |login|
  #Находим пользователя с запрошенным логином
  users_full_information = $rest_wrap.get('/users')
  @scenario_data.users_full_info = users_full_information
  @scenario_data.users_id[login] = find_user_id(users_information: @scenario_data
                                                                       .users_full_info,
                                                user_login: login)
  $logger.info("Найден пользователь #{login} с id:#{@scenario_data.users_id[login]}")


  delete_url = "https://testing4qa.ediweb.ru/api/users/#{@scenario_data.users_id[login]}"
  url = URI(delete_url)
  https = Net::HTTP.new(url.host, url.port)
  https.use_ssl = true
  request = Net::HTTP::Delete.new(url)

  request["Authorization"] = "Basic Yy50ZXN0ZXI6ZDNATGQwM2t1dj93VjN4OEV6Yjs="
  response = https.request(request)
  puts response.read_body
end