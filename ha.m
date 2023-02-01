A1 = [
4 2 1 3 7;
1 5 4 6 3;
5 4 8 7 2;
9 9 3 2 5;
3 4 7 8 2];%10
A2 = [
4 10 10 3 6;
5 6 2 7 4;
9 5 6 8 3;
2 3 5 4 8;
8 5 4 9 3];
A3 = [
1 4 7 9 4;
9 3 8 7 4;
3 4 6 8 2;
8 2 4 6 7;
7 6 9 8 5];
A4 = [
3 5 2 4 8;
10 10 4 3 6;
5 6 9 8 3;
6 2 5 8 4;
5 4 8 9 3];
A5 = [
9 11 3 6 6;
10 9 11 5 6;
8 10 5 6 4;
6 8 10 4 9;
11 10 9 8 7];
A6 = [
10 8 6 4 9;
11 9 10 5 6;
5 10 8 6 4;
3 11 9 6 6;
8 10 11 8 7];
A7 = [
11 4 11 6 11;
7 5 6 7 12;
9 7 8 10 10;
9 11 6 10 9;
7 10 4 8 8];
A8 = [
7 4 3 8 2;
4 5 1 6 3;
8 4 5 7 2;
1 2 4 7 2;
3 9 9 2 5];
A9 = [
4 7 1 5 5;
6 8 3 7 6;
6 4 5 7 7;
4 2 3 4 9;
8 1 8 3 8];
A10 = [
7 7 4 6 5;
3 8 1 8 8;
5 5 7 4 1;
7 6 8 6 3;
4 9 2 4 3];
A11 = [
5 6 8 2 7;
7 9 1 4 4;
6 8 3 4 2;
8 7 9 3 4;
9 8 7 6 5];
A12 = [
6 10 4 5 8;
8 10 7 9 11;
4 8 9 10 6;
5 9 6 11 10;
6 11 6 3 9];
A13 = [
10 4 9 8 5;
9 3 5 7 8;
2 5 8 10 5;
4 5 7 9 3;
8 7 10 9 6];
A14 = [
8 4 5 7 2;
7 4 3 8 2;
1 2 4 7 2;
3 9 9 2 5;
4 5 1 6 3];
A15 = [
10 12 7 11 10;
12 5 12 7 12;
8 6 7 8 13;
8 11 5 9 9;
10 8 9 11 11];
A16 = [
7 7 9 6 3;
9 9 6 8 7;
6 11 4 6 5;
5 10 3 10 10;
9 8 10 8 5];
A17 = [
8 10 5 6 4;
11 10 9 8 7;
6 8 10 4 9;
10 9 11 5 6;
9 11 3 6 6];
A18 = [6 7 3 9 9; 8 9 7 6 9; 6 11 5 4 6; 10 10 10 3 5; 8 8 5 10 9];%28
A27 = [1 1 1 1 1; 1 10 9 8 7; 1 8 10 4 2; 1 9 11 2 6; 1 11 2 6 6];
A = A18;
function show(Mi, Mj, Stars, Marks, A)
  printf("------------------------------------------------------------\n")
  n = size(A, 1);
  m = size(A, 2);
  for i = 1: n
    for j = 1: m
      if ((Stars(i,j) == 0) && (Marks(i,j) == 0))
        printf("%d \t", A(i, j))
      else
        if Stars(i,j) == 1
          printf("%d*\t", A(i, j))
        endif
        if Marks(i,j) == 1
          printf("%d\'\t", A(i, j))
        endif
      endif
      if (j == m)
        if (Mi(i, 1) == 1)
          printf("+\n")
        else
          printf(" \n")
        endif
      endif
    endfor
  endfor
  for j = 1: m
    if (Mj(1, j) == 1)
      printf("+\t")
    else
      printf(" \t")
    endif
  endfor
  printf("\n")
  printf("------------------------------------------------------------\n")
endfunction

function h = get_min(Mi, Mj, A)
  n = size(A, 1);
  m = size(A, 2);
  V = [];
  for j = 1: m
    for i = 1: n
      if (Mi(i, 1) > 0) || (Mj(1, j) > 0)
        printf("Пропустил в (%d, %d) при поиске минимума среди невыделеных элементов\n", i, j);
      else
        V = [V, A(i, j)];
      endif
    endfor
   endfor
   h = min(V);
   printf("Минимум в A = %d\n", h);
   return;
endfunction

function A = create_zero(Mi, Mj, A)
  n = size(A, 1);
  m = size(A, 2);
  h = get_min(Mi, Mj, A)
  for j = 1: m
    for i = 1: n
      if (Mi(i, 1) > 0)
        printf("Прибавил h к A(%d, %d)\n", i, j);
        A(i, j) = A(i, j) + h;
      endif
      if (Mj(1, j) == 0)
        printf("Вычел h из A(%d, %d)\n", i, j);
        A(i, j) = A(i, j) - h;
      endif
    endfor
   endfor
   return;
endfunction

function [Mi, Mj] = pluses(Mi, Mj, Stars, Marks, A)
  n = size(A, 1);
  m = size(A, 2);
  Mi = zeros(n, 1);
  Mj = zeros(1, m);
  for j = 1: m
    for i = 1: n
      if Stars(i, j) == 1
        Mj(1, j) = 1;
        printf("+ в (%d, %d)\n", i, j);
        break;
      endif
    endfor
  endfor
  return;
endfunction

function [Stars, Marks, Mi, Mj, iter] = start(Stars, Marks, A)
  n = size(A, 1);
  m = size(A, 2);
  iter = 0;
  Mi = zeros(n, 1);
  Mj = zeros(1, m);
  for j = 1: m
    for i = 1: n
      if sum(Stars(i, :)) > 0
        continue
      endif
      if A(i, j) > 0
        Stars(i, j) = 0;
      else
        Stars(i, j) = 1;
        iter = iter + 1;
        Mj(1, j) = 1;
        break;
      endif
    endfor
  endfor
  printf("Начальная позиция *:\n")
  show(Mi, Mj, Stars, Marks, A)
  iter = n - iter;
  return;
endfunction

function [Stars, Marks] = lchane(m, n, Stars, Marks, mark_i, mark_j)
  f = 0;
  L = zeros(n, m);
  L(mark_i, mark_j) = 1;
  Stars(mark_i, mark_j) = 1;
  printf("Начальный 0' в (%d, %d) выделил *\n", mark_i, mark_j);
  while(f != 2)
    if f == 0
      for i = 1: m
        %printf("Stars(i, mark_j) - Stars(%d, %d) = %d\n", i, mark_j, Stars(i, mark_j));
        if (Stars(i, mark_j) > 0) && (L(i, mark_j) == 0)%если находим в одном столбце с 0' 0*
          printf("Нашел 0* в (%d, %d) и снял выделение *\n", i, mark_j);
          Stars(i, mark_j) = 0;
          L(i, mark_j) = 1;
          mark_i = i;
          f = 1;
          break
        else
          if i == m
            %если не находим в одном столбце с 0' 0* то мы достигли конца l-цепочки и время остановиться
            printf("Конец l-цепочки\n");
            f = 2;
          endif
        endif
      endfor
    endif
    if f == 1
      for j = 1: n
        %printf("Marks(mark_i, j) - Marks(%d, %d) = %d\n", mark_i, j, Marks(mark_i, j));
        if (Marks(mark_i, j)) > 0 && (L(mark_i, j) == 0)
          printf("Нашел 0' в (%d, %d) выделил его *\n", mark_i, j);
          Stars(mark_i, j) = 1;
          L(mark_i, j) = 1;
          mark_j = j;
          f = 0;
          break
        endif
      endfor
     endif
  endwhile
  Marks = zeros(n, m);
  return;
endfunction

function [mark_i, mark_j, Marks, Mi, Mj, result, A] = put_mark(mark_i, mark_j, m, n, Mi, Mj, Stars, Marks, A)
  for j = 1: m
    for i = 1: n
      if (Mi(i, 1) > 0) || (Mj(1, j) > 0)
        printf("Пропустили в (%d, %d)\n", i, j);
      else
        printf("Проверяем есть ли среди невыделеных элементов нуль\n");
        if A(i, j) == 0 %нашли нуль
          printf("Нашли 0. Отмечаем 0 символом\' в позиции (%d, %d)\n", i, j);
          Marks(i, j) = 1;
          mark_i = i;
          mark_j = j;
          %Если в одном ряду со свеже выделенным 0\' есть 0*, то...
          if sum(Stars(i, :)) > 0
            printf("В одном ряду со свеже выделенным 0\' есть 0*\n");
            for s_j = 1: m
              if Stars(i, s_j) == 1
                %Снимаем выделение со столбца
                printf("Снимаем выделение со столбца\n");
                Mj(1, s_j) = 0;
                break
              endif
            endfor
            %Ставим выделение на ряд
            printf("Ставим выделение на ряд\n");
            Mi(i, 1) = 1;
            result = 1;
            return;
           %Если в одном ряду со свеже выделенным 0\' нет 0*, то...
          else
            printf("В одном ряду с только выделенным 0\' нет 0*\n");
            result = 2;
            return;
        endif
      endif
      endif
    endfor
  endfor
  %не нашли нуль среди невыделеных елементов
  printf("Среди не выделеных элементов нет нуля\n");
  A = create_zero(Mi, Mj, A);
  result = 0;
  return;
endfunction

function [Amin, Amax, R] = prep(A)
  n = size(A, 1);
  m = size(A, 2);
  R = A;
  Amin = A;
  Amax = A;
  h = max(Amax);
  h = max(h);
  for j = 1: m
    for i = 1: n
      Amax(i, j) = h - Amax(i, j);
    endfor
  endfor
  disp("Исходная матрица:\n ")
  disp(R);
  min_i_min = [];
  min_j_min = [];
  Bmin = zeros(n, m);
  Cmin = zeros(n, m);
  min_i_max = [];
  min_j_max = [];
  Bmax = zeros(n, m);
  Cmax = zeros(n, m);
  for j = 1: m
    min_i_min = [min_i_min, min(Amin(:,j))];
    min_i_max = [min_i_max, min(Amax(:,j))];
  endfor
  for i = 1: n
    for j = 1: m
      Bmin(i, j) = min_i_min(1, j);
      Bmax(i, j) = min_i_max(1, j);
    endfor
  endfor
  Amin = Amin - Bmin;
  Amax = Amax - Bmax;
  for i = 1: n
    min_j_min = [min_j_min; min(Amin(i,:))];
    min_j_max = [min_j_max; min(Amax(i,:))];
  endfor
  for i = 1: n
    for j = 1: m
      Cmin(i, j) = min_j_min(i, 1);
      Cmax(i, j) = min_j_max(i, 1);
    endfor
  endfor
  Amin = Amin - Cmin;
  Amax = Amax - Cmax;
  disp("Mатрица-0 для задачи по минимизации:\n ")
  disp(Amin);
  disp("Mатрица-0 для задачи по максимизации:\n ")
  disp(Amax);
  return;
endfunction

function todo(A, R)
  n = size(A, 1);
  m = size(A, 2);
  Stars = zeros(n, m);
  Marks = zeros(n, m);
  [Stars, Marks, Mi, Mj, iter] = start(Stars, Marks, A);
  mark_i = -1;
  mark_j = -1;
  result = 0;
  total_iter = iter;
  printf("Расчет займет итераций: %d\n", total_iter);
  current_iter = iter;
    printf("Осталось %d итераций из %d\n", current_iter, total_iter);
  while (current_iter > 0)
    if result == 0
      %Среди невыделеных элементов не было нуля
      [mark_i, mark_j, Marks, Mi, Mj, result, A] = put_mark(mark_i, mark_j, m, n, Mi, Mj, Stars, Marks, A);
      show(Mi, Mj, Stars, Marks, A);
    endif
    if result == 1
      %В одном ряду с только что выделенным 0\' был 0*
      [mark_i, mark_j, Marks, Mi, Mj, result, A] = put_mark(mark_i, mark_j, m, n, Mi, Mj, Stars, Marks, A);
      show(Mi, Mj, Stars, Marks, A)
    endif
    if result == 2
      disp("В одном ряду со только что выделенным 0\' не было 0*\n");
      disp("и следовательно начинаем строить l-цепочку\n")
      printf("До построения l-цепочки:\n");
      show(Mi, Mj, Stars, Marks, A);
      [Stars, Marks] = lchane(m, n, Stars, Marks, mark_i, mark_j);
      disp("Построена l-цепочка\n")
      printf("После построения l-цепочки:\n");
      show(Mi, Mj, Stars, Marks, A);
      current_iter = current_iter - 1;
      result = 0;
      if iter > 0
        disp("Перестраиваем выделения + после построения l-цепочки\n");
        [Mi, Mj] = pluses(Mi, Mj, Stars, Marks, A);
        show(Mi, Mj, Stars, Marks, A);
        disp("Выделения + перестроены\n");
        printf("Осталось %d итераций из %d\n", current_iter, total_iter);
      endif
    endif
  endwhile
  r = 0;
  RR = R;
  for j = 1: m
    for i = 1: n
      if Stars(i, j) == 1
        r = r + R(i, j);
      endif
      RR(i,j) = R(i,j) * Stars(i, j);
    endfor
  endfor
  printf("****************************\n");
  printf("Результат:\n")
  disp(RR);
  printf("Сумма =  %d\n", r);
  printf("****************************\n");
endfunction
[Amin, Amax, R] = prep(A);
printf("\nПриступили к поиску opt решения при минимизации\n");
todo(Amin, R);
printf("\nЗавершили поиск opt решения при минимизации\n");
printf("\nПриступили к поиску opt решения при максимизации\n");
todo(Amax, R);
printf("\nЗавершили поиск opt решения при максимизации\n");
