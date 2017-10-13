set showmatch   "показывать первую парную скобку после ввода второй
set t_Co=256    "использовать больше цветов в терминале
set undolevels=2048 "хранить историю изменений числом N

"set pastetoggle=
                "подсвечивает все слова, которые совпадают со словом под курсором.
"autocmd CursorMoved * silent! exe printf("match Search /\\<%s\\>/", expand('<cword>'))
set incsearch   "поиск фрагмента по мере его набора
                "поиск выделенного текста (начинать искать фрагмент при его выделении)
vnoremap <silent>* <ESC>:call VisualSearch()<CR>/<C-R>/<CR>
vnoremap <silent># <ESC>:call VisualSearch()<CR>?<C-R>/<CR>

                "Настроим кол-во символов пробелов, которые будут заменять \t
set tabstop=4
set shiftwidth=4
set smarttab
set paste        "При копипасте корректно проставляются все отступы
set smartcase    "Vim ищет игнорируя регистр если искомое выражение не содержит большие буквы,
                 " в противном случае учитывает регистр.
set number 
set et           "включим автозамену по умолчанию
set wrap         "попросим Vim переносить длинные строки
set ai           "включим автоотступы для новых строк
set cin          "включим отступы в стиле Си
syntax on        "активирует syntax highlighting
                 "Далее настроим поиск и подсветку результатов поиска и совпадения скобок
set showmatch
set hlsearch
set incsearch
set ignorecase

set lz           "ленивая перерисовка экрана при выполнении скриптов

                 "Показываем табы в начале строки точками
set listchars=tab:··
set list

                 "Порядок применения кодировок и формата файлов

set ffs=unix,dos,mac
set fencs=utf-8,cp1251,koi8-r,ucs-2,cp866

                 "Взаимодействие и элементы интерфейса

                 "Я часто выделяю мышкой содержимое экрана в Putty, но перехват мышки в Vim 
                 "мне иногда мешает. Отключаем функционал вне графического режима:
if !has('gui_running')
set mouse=
endif

                 "Избавляемся от меню и тулбара:
set guioptions-=T
set guioptions-=m

                 "В разных графических системах используем разные шрифты:
if has('gui')
colorscheme darkblue
if has('win32')
set guifont=Lucida_Console:h12:cRUSSIAN::
else
set guifont=Terminus\ 14
endif
endif

                  "Пытаемся занять максимально большое пространство на экране. Как водится,
                  "по-разному на разных системах:
if has('gui')
if has('win32')
au GUIEnter * call libcallnr('maximize', 'Maximize', 1)
elseif has('gui_gtk2')
au GUIEnter * :set lines=99999 columns=99999
endif
endif

                  "Опять же, системы сборки для разных платформ могут быть переопределены:
if has('win32')
set makeprg=nmake
compiler msvc
else
set makeprg=make
compiler gcc
endif
set history=512     "хранить больше истории команд

