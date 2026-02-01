# Документация (для редакторов)

Пример находится в `/docs/sample`.

## Особенности

В конце конспекта находится предметный указатель, который генерируется
автоматически при помощи [команд](#команды) или `\index{...}`. Реализуется при
помощи пакета `imakeidx`. Для дополнительной настройки используется файл
`style.ist`.

Для создания изображений используется библиотека Tikz.

## Структура

В допущении, что техается только матан в папке `matan`

- /
  - matan/
    - preamble/
      - appendices.tex
      - general_config.tex -> /docs/sample/preamble/general_config.tex
      - introduction.tex
      - specific_config.tex
      - style.ist
      - title.tex -> /docs/sample/preamble/general_config.tex
    - src/
      - Файлы с техом лекций
    - matan.tex
    - Служебные файлы
  - docs/
    - sample/
      - то же, что и в /matan/
    - README.md
  - pdf
    - PDF files
  - scripts
    - clean_pdf.sh
    - prepare_pdf.sh
  - .gitignore
  - CONTRIBUTING.md
  - LICENSE
  - README.md

Пояснения:

- `appendices.tex` содержит приложения
- `general_config.tex` содержит глобальные настройки, которые применяются ко
  всем техаемым предметам.
- `introduction.tex` содержит введение
- `specific_config.tex` содержит локальные настройки, которые применяются только
  для данного предмета
- `style.ist` содержит настройки форматирования предметного указателя
- `title.tex` содержит титульную страницу

При копировании `/docs/sample` в (например) `/algem`, не забудьте заменить
`general_config.tex` и `title.tex` на ссылки.

## Команды

### Команды окружений

Для удобства, вместо громоздких окружений используются укороченные команды.
Например, `\begin{equation}blah\end{equation}` заменяется на `\jeq{blah}`. Все
команды окружений начинаются на `\j` для удобства запоминания. Если у команды
есть версия без нумерации, то она будет начинаться с `\k`.

Также некоторые команды автоматически добавляются в [предметный
указатель](#особенности) и объявляют названия для cross-reference обращения.
Версия команды без нумерации не добавляется в предметный указатель.

Например, для обращения к теореме (`\jth`) 15 из главы 1 параграфа 4 можно
использовать `\hyperref[theorem1.4.15]{теоремка}`, при этом нет необходимости
ставить `\label`, ведь он уже поставлен внутри `\jth`.

В квадратных скобках после объявления теорем, лемм, утверждений и определений,
можно написать, название теоремы (будет находится в скобках).

Пример использования теоремы, с cross-reference:

```latex
\jeq[О свойствах новогодних елок]{
  Наряженная новогодняя елка увеличивает вероятность появления новогоднего
  настроения на 15\%.
}

\keq[Теорема без номера]{
  Как понятно из \hyperref[theorem0.0.1]{предыдущей теоремы}, елки --- это
  круто.
}

\jeq{
  У данной теоремы нет названия, но есть номер.
}
```

Некоторые команды:

- Теоремы, леммы, и так далее
  - `\jtheorem` или `\jth` --- теорема с нумерацией
  - `\ktheorem` или `\kth` --- теорема без нумерации (нет в пред. указ.)
  - `\jproof` или `\jprf` --- доказательство
- Перечисления
  - `\jenumerate` или `\jen` --- упорядоченный список
  - `\jitemize` или `\jit` --- неупорядоченный список
- Математика
  - `\jequation` или `\jeq` --- аналог `\begin{equation}\end{equation}`
  - `\kequation` или `\keq` --- аналог `\begin{equation*}\end{equation*}`
  - `\jarray` или `\jarr` --- аналог `\begin{array}\end{array}`
- Остальное
  - `\jcustom` или `\jcst` --- например `\jcst[center]{}`

Полный список команд, а также все их укороченные версии можно посмотреть в
`/docs/sample/preamble/general_config.tex`.

Обращения происходят по самому подробному названию.

### Команды скобок

Начинаются с `f`.

| Команда | Пояснение             | Результат |
| ------- | --------------------- | :-------: |
| `\fd`   | parentheses (Default) |    (a)    |
| `\fb`   | Brackets              |    [a]    |
| `\fp`   | Pipes                 |   \|a\|   |
| `\fpp`  | double PiPes          | \|\|a\|\| |
| `\fdp`  | Double Pipes          | \|\|a\|\| |
| `\fP`   | double Pipes          | \|\|a\|\| |
| `\fc`   | Curly braces          |    {a}    |
| `\fa`   | Angles                |   \<a\>   |

Все эти скобки масштабируемы.

Пример:

```latex
\jeq{
  \fd{\jarr{c c}{1 & 2 \\ 3 & 4}} + \fd{\jarr{c c}{5 & 6 \\ 7 & 8}} =
  \fd{\jarr{c c}{6 & 8 \\ 10 & 12}}
}
```

Аналогичный листинг без данных функций:

```latex
\begin{equation}
  \left(\begin{array}{c c}1 & 2 \\ 3 & 4\end{array}\right) +
  \left(\begin{array}{c c}5 & 6 \\ 7 & 8\end{array}\right) =
  \left(\begin{array}{c c}6 & 8 \\ 10 & 12\end{array}\right)
\end{equation}
```

Результат:

$$
\begin{equation}
  \left(\begin{array}{c c}1 & 2 \\ 3 & 4\end{array}\right) +
  \left(\begin{array}{c c}5 & 6 \\ 7 & 8\end{array}\right) =
  \left(\begin{array}{c c}6 & 8 \\ 10 & 12\end{array}\right)
\end{equation}
$$

### Команды Tikz

WIP!!!!

Команды для рисования графики.

| Название                               | Пояснение                        |
| -------------------------------------- | -------------------------------- |
| `\tpic [opts]{caption}{...}`           | Окружение Tikz с подписью        |
| `\dpic [opts]{...}`                    | Окружение Tikz без подписи       |
| `\twrap[opts]{caption}{mod}{len}{...}` | `\tpic`, обернутый текстом       |
| `\dwrap[opts]{mod}{len}{...}`          | `\dpic`, обернутый текстом       |
| `\tdraw[opts]{...}`                    | `\draw[opts] ...;`               |
| `\tfor [opts]{var}{it}{...}`           | `\foreach[opts] var in {it} ...` |
| ...                                    | ...                              |

Пример рисования линий, стрелок и подписей:

```latex
\tpic{листинг 1}{
  % Стрелочки :3
  \tdraw{(0, 0)--(1, 1)}
  \tdraw[-Stealth]{(0, 1)--(3, 1)}
  \tdraw[-Stealth, dashed]{(1, 1)--(2, 0)}
  \tdraw[-Stealth, dashed, color=red]{(1, 1)--(3, 0)}

  % Подписи :3
  \tnode{0, -1}{We}
  \tnode[color=violet]{1, -1}{Love}
  \tnode[color=red!50, anchor=north west]{2, -1}{Arrows}

  % Стрелочки и подписи :3
  \tdraw[color=green!50!black]{
    (0, -3)--(1, -2)
    node {o}
    node[pos=.5, sloped, above] {a}
  }
  \tdraw[-Stealth]{
    (0, -3)--(.3, -5)
      node[pos=.7, sloped, below] {$\sum$}
      node[pos=.7, sloped, above] {$\displaystyle \sum$}
      node[pos=.3, below] {c}
      node[pos=.3, color=red] {\texttt{o}}
  }
}
```

В Tikz есть особые точки:

- current bounding box
- current path bounding box
- current page

Последнюю можно использовать для абсолютного позиционирования:

```latex

```

### Остальные команды

- `\vc` - векторы, аналогично `\vv` из пакета `esvect`, но с нормальным
  оформлением (см. примеры в sample.pdf).
