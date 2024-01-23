# ImageGalleryApp

## О приложении
Приложение для вывода картинок с ресурса https://picsum.photos/ (открывается с VPN)
 
В приложении две вкладки:
1) случайные картинки
2) любимые картинки

На 1 вкладке по мере прокрутки подгружаются новые картинки и их можно лайкать, подгрузка автоматическая с пагинацией.
На 2 вкладке лежат любимые (лайкнутые) картинки. Любимые так же доступны для просмотра без интернета.
Код покрыт юнит-тестами
## Об архитектуре
В приложении использована архитектура CleanSwift
## Реализация работы без интернета
Понравившиеся картинки сохраняются в директорию Documents, а путь к файлу - в БД Realm
