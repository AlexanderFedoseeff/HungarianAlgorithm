# HungarianAlgorithm
ЭТО НЕ СОВЕМ МАТЛАБ! Это OCTAVE. Для работы в матлаб нужны некоторые косметические изменения (типа не "endfunction", a "end").

Краткое описание венгерского метода	

Минимизация:

1. В каждом столбце матрицы стоимостей находим наименьший элемент и вычитаем его из этого столбца.
2. В каждой строке полученной матрицы находим наименьший элемент и вычитаем его из всех элементов этой строки.
Строим начальную систему независимых нулей (СНН) просматривая столбцы сверху вниз в поисках нового нуля в одной строке с которым нет уже ранее отмеченного знаком «*» и если находим таковой, то отмечаем  знаком «*».
3. Если  число выделенных нулей равно рангу матрицы, то переходим к 9-у пункту.
4. Выделить столбцы содержащие 0* символом «+»
5. Если среди не выделенных  элементов есть 0, то отмечаем его знаком «`» и переходим к следующему, 6-у пункту. А если нет, то делаем следующее. Выбираем наименьший элемент среди не выделенных знаком «+» строк и столбцов. Вычитаем его из не выделенных столбцов и прибавляем к выделенным строкам. Возвращаемся к началу этого пункта.
6. Если в одной строке с только выделенным 0` есть 0*, то снимаем выделение «+» со столбца с этим 0*  и выделяем знаком «+» строку с 0`. Возвращаемся к 5-у пункту. Если же в одной строке с только выделенным 0` нет  0*, то переходим к 7-у пункту.
7. Строим не продолжаемую l-цепочку от 0`, по столбцу к 0*, далее по строке к следующему 0` … и так далее до 0`. L-цепочка может состоять из одного 0`.
8. В пределах l-цепочки заменяем 0` на 0*, а с 0* снимаем знак «*». Возвращаемся к пункту 3.
9. Записываем оптимальное решение. Создаем матрицу, где на место 0* ставим 1, иначе 0. Сумма элементов в тех позициях матрицы стоимостей, которые соответствуют единицам и будут оптимальным решением задачи.

Максимизация:
1. Выбрать самый большой элемент матрицы.
2. Умножить каждый элемент матрицы на -1 и сложить с этим выбранным элементом.
3. Далее все делать как в задаче минимизации.
