Веб-сервис, рассчитывающий стоимость ВМ по параметрам из query.

Сборка образа:
docker build . -t sinatra_app

Запуск приложения:
docker run -it --rm -p 5678:5678 sinatra_app

Доступно по:
http://localhost:5678/
