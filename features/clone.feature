# language: ru

Функционал: Клонирование существующего репозитория гит (команда clone)
    Как Пользователь
    Я хочу выполнить клонирование существующего репозитория гит
    Чтобы выполнять автоматическую выгрузку конфигураций из хранилища

Контекст: Тестовый контекст
    Когда Я очищаю параметры команды "gitsync" в контексте
    И Я создаю новый объект ГитРепозиторий
    И Я устанавливаю путь выполнения команды "gitsync" к текущей библиотеке
    И Я создаю временный каталог и сохраняю его в контекст
    И я скопировал каталог тестового хранилища конфигурации во временный каталог
    И Я сохраняю значение временного каталога в переменной "КаталогХранилища1С"
    И Я создаю временный каталог и сохраняю его в контекст
    И Я сохраняю значение временного каталога в переменной "ПутьКаталогаИсходников"
    И Я устанавливаю рабочей каталог во временный каталог
    И Я создаю временный каталог и сохраняю его в контекст
    И Я инициализирую bare репозиторий во временном каталоге
    И Я сохраняю значение временного каталога в переменной "URLРепозитория"
    И Я наполняю bare репозиторий из переменной "URLРепозитория" тестовыми данными
    И я включаю отладку лога с именем "oscript.app.gitsync"
    И Я выключаю все плагины
  
Сценарий: Клонирование репозитория гит и наполнение его служебными данными
    Допустим Я добавляю параметр "-v" для команды "gitsync"
    И Я добавляю параметр "clone" для команды "gitsync"
    И Я добавляю позиционный параметр для команды "gitsync" из переменной "КаталогХранилища1С"
    И Я добавляю позиционный параметр для команды "gitsync" из переменной "URLРепозитория"
    И Я добавляю позиционный параметр для команды "gitsync" из переменной "ПутьКаталогаИсходников"
    Когда Я выполняю команду "gitsync"
    Тогда Вывод команды "gitsync" содержит "ИНФОРМАЦИЯ - Клонирование завершено"
    И Вывод команды "gitsync" не содержит "Внешнее исключение"
    И Код возврата команды "gitsync" равен 0
    И В каталоге из переменной "ПутьКаталогаИсходников" создается файл или каталог "AUTHORS"
    И В каталоге из переменной "ПутьКаталогаИсходников" создается файл или каталог "VERSION"

Сценарий: Клонирование репозитория с использованием текущего рабочего каталога
    Допустим Я добавляю параметр "-v" для команды "gitsync"
    И Я добавляю параметр "clone" для команды "gitsync"
    И Я добавляю позиционный параметр для команды "gitsync" из переменной "КаталогХранилища1С"
    И Я добавляю позиционный параметр для команды "gitsync" из переменной "URLРепозитория"
    И Я устанавливаю рабочей каталог из переменной "ПутьКаталогаИсходников"
    Когда Я выполняю команду "gitsync"
    Тогда Вывод команды "gitsync" содержит "ИНФОРМАЦИЯ - Клонирование завершено"
    И Вывод команды "gitsync" не содержит "Внешнее исключение"
    И Код возврата команды "gitsync" равен 0
    И В каталоге из переменной "ПутьКаталогаИсходников" создается файл или каталог "AUTHORS"
    И В каталоге из переменной "ПутьКаталогаИсходников" создается файл или каталог "VERSION"

Сценарий: Клонирование репозитория с использованием переменных окружения
    Допустим Я добавляю параметр "-v" для команды "gitsync"
    И Я добавляю параметр "clone" для команды "gitsync"
    И Я устанавливаю переменную окружения "GITSYNC_REPO_URL" из переменной "URLРепозитория"
    И Я устанавливаю переменную окружения "GITSYNC_STORAGE_PATH" из переменной "КаталогХранилища1С"
    И Я устанавливаю переменную окружения "GITSYNC_WORKDIR" из переменной "ПутьКаталогаИсходников"
    Когда Я выполняю команду "gitsync"
    Тогда Вывод команды "gitsync" содержит "ИНФОРМАЦИЯ - Клонирование завершено"
    И Вывод команды "gitsync" не содержит "Внешнее исключение"
    И Код возврата команды "gitsync" равен 0
    И В каталоге из переменной "ПутьКаталогаИсходников" создается файл или каталог "AUTHORS"
    И В каталоге из переменной "ПутьКаталогаИсходников" создается файл или каталог "VERSION"
    И Я очищаю значение переменных окружения 
    |GITSYNC_STORAGE_PATH|
    |GITSYNC_WORKDIR|