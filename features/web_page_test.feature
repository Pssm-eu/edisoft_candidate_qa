# encoding: UTF-8
# language: ru

  Функция: UI

    Сценарий: Работа с web-страницей

      Когда захожу на страницу "http://google.com"
      И ввожу в поисковой строке текст "cucumber.io"
      И кликаю по строке выдачи с адресом https://cucumber.io

      Тогда я должен увидеть текст на странице "Thousands of teams worldwide trust Cucumber to deliver better products, faster."