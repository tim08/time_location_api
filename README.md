# README
Тестовое для offsidegaming.com

Написать сервис API.

Сервис должен работать c двумя сущностями:
1) 'Time' - временная метка с указанием минут, часов, дней, месяцев
2) 'Location' - именованная локация, имеющая название, широту, долготу и указание временной зоны, в которой она расположена.

Реализовать следующий функционал:
1) Добавление 'time', для указания времени могут использоваться: значения в формате 'hour:minutes day.month' (19:25 13.11); 'end' (конец текущего дня), 'beginning' (начало текущего дня)
2) Добавление 'location', все указанные в описании сущности параметры обязательны, кроме временной зоны (в случае отсутствия, считать +00:00)
3) Получение списка всех сохраненных временных меток. Доступен один query параметр: название 'location' => временные метки возвращаются с поправкой на временную зону данного 'location'. Если параметр отсутствует или не существует 'location' с таким названием, временные метки возвращаются в utc.

Использовать JSON API формат ответов. Добавить ошибки по своему усмотрению. Покрыть код тестами. Указать используемую database и web server.


Things you may want to cover:


* Deployment instructions - Успользуйте secrets.example.yml для создания secrets.yml с настройками для бд

* Services (job queues, cache servers, search engines, etc.) - 

    locations POST /locations(.:format)  
   пример: post request body {"location":{"name":"loc1",   "latitude": "41.40338",   "longitude":"2.17403", "time_zone": "Moscow"}}
   
    time_stamps 
    GET  /time_stamps(.:format) 
    
    пример: request /time_stamps?location=loc1
    
            response [{"id":1,"signature_with_time_zone":"2016-11-02T19:25:13.000Z"},{"id":2,"signature_with_time_zone":"2016-11-02T19:25:13.000Z"},
            {"id":3,"signature_with_time_zone":"2016-11-02T19:25:13.000Z"},{"id":4,"signature_with_time_zone":"2016-11-02T19:25:13.000Z"}]
            
    POST /time_stamps(.:format) 
            
    пример: post request body {"time_stamp":{"signature":"19:25 13.11"}}        

