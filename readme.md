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
## Демонстрация
#### Загрузка изображений с пагинацией
https://github.com/bikmurzin/ImageGalleryApp/assets/51128795/67a37a41-24e9-46a6-a313-4f0f077fca67

#### Сохранение понравившихся изображений
https://github.com/bikmurzin/ImageGalleryApp/assets/51128795/f07026dd-7cc8-4b1a-b63f-57489f33e939

#### Удаление изображений из избранного
https://github.com/bikmurzin/ImageGalleryApp/assets/51128795/1630d568-cb4d-40ba-864a-8267988554f7

#### Синхронизация лайков между вкладками "Лента" и "Избранное"
https://github.com/bikmurzin/ImageGalleryApp/assets/51128795/6c70a573-1248-41f5-b01e-d548931e9f39

#### Работа без интернета
![Без интернета](https://github.com/bikmurzin/ImageGalleryApp/assets/51128795/47bdc0d9-e73a-4738-b45c-71f7ee2f3146)

