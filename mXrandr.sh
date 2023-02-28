#!/bin/bash
 source "sXrandr.sh"
 UNMARK(){ $e "\e[0m";}
 MARK(){ $e "\e[30;47m";}
#
 HEAD()
{
 for (( a=2; a<=32; a++ ))
          do
              TPUT $a 1;$E "$ma"
          done
TPUT  1 1;$E "$mb"
TPUT  3 3;$E "\e[1;36m *** xrandr ***\e[0m";
TPUT  4 3;$E "\e[2m Примитивный интерфейс командной строки для расширения RandR\e[0m";
TPUT  5 1;$E "$mc"
TPUT 11 1;$E "$mc"
TPUT 12 4;$E "Посмотреть текущие параметры, запустите утилиту без параметров:     \e[32m xrandr\e[0m";
TPUT 13 1;$E "$mc"
TPUT 20 1;$E "$mc"
TPUT 28 1;$E "$mc"
TPUT 30 1;$E "$md"
}
 FOOT(){ MARK;TPUT 33 1;$E "$me";UNMARK;}
#
  M0(){ TPUT  6 3; $e " Установка                                                          \e[32m Install \e[0m";}
  M1(){ TPUT  7 3; $e " Kраткий обзор                                                     \e[32m Synopsis \e[0m";}
  M2(){ TPUT  8 3; $e " Описание                                                       \e[32m Description \e[0m";}
  M3(){ TPUT  9 3; $e " Автор                                                               \e[32m Author \e[0m";}
  M4(){ TPUT 10 3; $e " Смотрите также                                                    \e[32m See Also \e[0m";}
#
  M5(){ TPUT 14 3; $e " Опции                                                              \e[32m Options \e[0m";}
  M6(){ TPUT 15 3; $e " Опции для RandR 1.5                              \e[32m RandR version 1.5 options \e[0m";}
  M7(){ TPUT 16 3; $e " Опции для RandR 1.3                              \e[32m RandR version 1.3 options \e[0m";}
  M8(){ TPUT 17 3; $e " Параметры для каждого выхода                            \e[32m Per-output options \e[0m";}
  M9(){ TPUT 18 3; $e " Варианты RandR версии 1.2                        \e[32m RandR version 1.2 options \e[0m";}
 M10(){ TPUT 19 3; $e " Варианты RandR версии 1.1                        \e[32m RandR version 1.1 options \e[0m";}
#
 M11(){ TPUT 21 3; $e " Позволяет указать размер экрана                                     \e[32m --size \e[0m";}
 M12(){ TPUT 22 3; $e " Утилита                                                                \e[32m cvt \e[0m";}
 M13(){ TPUT 23 3; $e " Устанавливает выход с именем LVDS                                           ";}
 M14(){ TPUT 24 3; $e " Заставляет использовать режим 1024x768 на выходе с именем VGA               ";}
 M15(){ TPUT 25 3; $e " Включает панорамирование на рабочем столе                                   ";}
 M16(){ TPUT 26 3; $e " Имейте один маленький экран LVDS 1280x800                                   ";}
 M17(){ TPUT 27 3; $e " Отображает выходной сигнал VGA в форме трапеции                             ";}
#
 M18(){ TPUT 29 3; $e "                                                                \e[32m Grannik Git \e[0m";}
#
 M19(){ TPUT 31 3; $e "                                                                       \e[32m Exit \e[0m";}
LM=19
   MENU(){ for each in $(seq 0 $LM);do M${each};done;}
    POS(){ if [[ $cur == up ]];then ((i--));fi
           if [[ $cur == dn ]];then ((i++));fi
           if [[ $i -lt 0   ]];then i=$LM;fi
           if [[ $i -gt $LM ]];then i=0;fi;}
REFRESH(){ after=$((i+1)); before=$((i-1))
           if [[ $before -lt 0  ]];then before=$LM;fi
           if [[ $after -gt $LM ]];then after=0;fi
           if [[ $j -lt $i      ]];then UNMARK;M$before;else UNMARK;M$after;fi
           if [[ $after -eq 0 ]] || [ $before -eq $LM ];then
           UNMARK; M$before; M$after;fi;j=$i;UNMARK;M$before;M$after;}
   INIT(){ R;HEAD;FOOT;MENU;}
     SC(){ REFRESH;MARK;$S;$b;cur=`ARROW`;}
# Функция возвращения в меню
     ES(){ MARK;$e " ENTER = main menu ";$b;read;INIT;};INIT
  while [[ "$O" != " " ]]; do case $i in
  0) S=M0;SC; if [[ $cur == enter ]];then R;echo -e "\e[32m
 sudo apt install xrandr
\e[0m";ES;fi;;
  1) S=M1;SC; if [[ $cur == enter ]];then R;echo -e "
 Синтаксис утилиты очень прост: xrandr опции параметры
\e[32m
 xrandr [--help] [--display display] [-q] [-v] [--verbose] [--dryrun] [--screen
 snum] [--q1] [--q12] [--current] [--noprimary] [--panning widthx‐height
 [+x+y[/track_widthxtrack_height+track_x+track_y[/border_left/border_top/border
 _right/border_bottom]]]] [--scale x[xy]] [--scale-from wxh] [--transform a,b,c,d,
 e,f,g,h,i] [--primary] [--prop] [--fb widthxheight] [--fbmm widthxheight]
 [--dpi dpi] [--dpi from-output] [--newmode name mode] [--rmmode name]
 [--addmode output name] [--delmode output name] [--output output] [--auto]
 [--mode mode] [--preferred] [--pos xxy] [--rate rate] [--reflect reflection]
 [--rotate orientation] [--left-of output] [--right-of output] [--above output]
 [--below output] [--same-as output] [--set property value] [--off] [--crtc crtc]
 [--gamma red[:green:blue]] [--brightness brightness] [-o orientation] [-s size]
 [-r rate] [-x] [-y] [--listproviders] [--setprovideroutputsource provider source]
 [--setprovideroffloadsink provider sink] [--listmonitors] [--listactivemonitors]
 [--setmonitor name geometry outputs] [--delmonitor name]
\e[0m";ES;fi;;
  2) S=M2;SC; if [[ $cur == enter ]];then R;echo -e "
 Если старые экраны показывали 640х800 пикселей,
 то более новые отображают уже 1920х1080. У последних моделей разрешение ещё выше.
 Для управления настройками экрана из терминала можно использовать утилиту xrandr.
 Xrandr используется для установки размера, ориентации и/или отражения выходных
 данных на экране. Он также может установить размер экрана. Если он вызывается без
 каких-либо опций, он выводит состояние выходов, показывая существующие режимы для
 каждого из них, со знаком '+' после предпочтительных режимов и '*' после текущего
 режима. Есть несколько глобальных вариантов. Другие параметры изменяют последний
 вывод, указанный в предыдущих параметрах командной строки. Несколько выходов могут
 быть изменены одновременно путем передачи нескольких параметров --output,
 за которыми сразу же следуют соответствующие параметры модификации.
";ES;fi;;
  3) S=M3;SC; if [[ $cur == enter ]];then R;echo -e "
 Keith Packard, Центр технологий с открытым исходным кодом, корпорация Intel
 и Jim Gettys, Кембриджская исследовательская лаборатория, HP Labs, HP.
";ES;fi;;
  4) S=M4;SC; if [[ $cur == enter ]];then R;echo -e "\e[32m
 Xrandr, cvt, xkeystone, xbacklight
\e[0m";ES;fi;;
  5) S=M5;SC; if [[ $cur == enter ]];then R;./nXrandr.sh;ES;fi;;
  6) S=M6;SC; if [[ $cur == enter ]];then R;./nXrandr.sh;ES;fi;;
  7) S=M7;SC; if [[ $cur == enter ]];then R;./nXrandr.sh;ES;fi;;
  8) S=M8;SC; if [[ $cur == enter ]];then R;./nXrandr.sh;ES;fi;;
  9) S=M9;SC; if [[ $cur == enter ]];then R;./nXrandrRandR.sh;ES;fi;;
 10) S=M10;SC;if [[ $cur == enter ]];then R;./nXrandrRandR.sh;ES;fi;;
#
 11) S=M11;SC;if [[ $cur == enter ]];then R;echo -e "
 Позволяет указать размер экрана.
";ES;fi;;
 12) S=M12;SC;if [[ $cur == enter ]];then R;echo -e "
 Хорошо, мы разобрались с тем, как добавить одно из существующих разрешений.
 По сути, то же самое, что и в графическом интерфейсе.
 Но если нужного разрешения в списке нет, то его можно добавить.
 Для этого сначала нужно конвертировать обычную запись в формат VESA.
 Для этого используйте утилиту\e[32m cvt\e[0m 
 Например, создадим режим с разрешением 2000х1100
 и частотой обновления 60:\e[32m cvt 2000 1100 60\e[0m
 Дальше надо скопировать из вывода утилиты всё, что написано после\e[32m Modeline\e[0m
 Осталось использовать скопированный текст в xrandr:\e[32m xrandr --newmode
 \"2000x1100_60.00\" 183.75 2000 2136 2344 2688 1100 1103 1113 1141 -hsync +vsync\e[0m
 Добавляем только созданное разрешение к списку доступных для нужного нам экрана:
\e[32m xrandr --addmode HDMI-1 2000x1100_60.00\e[0m
 А затем активируем, как описывалось выше:
\e[32m xrandr --output HDMI-1 --mode 2000x1100_60.00 xrandr\e[0m
 Но будьте аккуратны с новыми разрешениями.
 Если вы устанавливаете разрешение выше, чем поддерживает ваш монитор,
 то он просто не будет показывать.
 Но такая штука может быть полезна с VirtualBox, или если компьютер не определяет,
 что ваш монитор поддерживает более высокое разрешение.
";ES;fi;;
 13) S=M13;SC;if [[ $cur == enter ]];then R;echo -e "
 Устанавливает выход с именем LVDS в его предпочтительный режим,
 а справа переводит выход с именем VGA в предпочтительный режим экрана,
 который физически повернут по часовой стрелке:
\e[32m
 xrandr --output LVDS --auto --rotate normal --pos 0x0 --output VGA --auto --rotate
 left --right-of LVDS
\e[0m";ES;fi;;
 14) S=M14;SC;if [[ $cur == enter ]];then R;echo -e "
 Заставляет использовать режим 1024x768 на выходе с именем VGA:
\e[32m
 xrandr --newmode "1024x768" 63.50  1024 1072 1176 1328  768 771 775 798 -hsync +vsync
 xrandr --addmode VGA 1024x768
 xrandr --output VGA --mode 1024x768
\e[0m";ES;fi;;
 15) S=M15;SC;if [[ $cur == enter ]];then R;echo -e "
 Включает панорамирование на рабочем столе с разрешением 1600x768
 при отображении режима 1024x768 на выходе, называемом VGA:
\e[32m
 xrandr --fb 1600x768 --output VGA --mode 1024x768 --panning 1600x0
\e[0m";ES;fi;;
 16) S=M16;SC;if [[ $cur == enter ]];then R;echo -e "
 Имейте один маленький экран LVDS 1280x800, показывающий уменьшенную версию
 огромного рабочего стола 3200x2000, и большой экран VGA,
 отображающий окружение мыши в нормальном размере.
\e[32m
 xrandr --fb 3200x2000 --output LVDS --scale 2.5x2.5 --output VGA --pos 0x0
 --panning 3200x2000+0+0/3200x2000+0+0/64/64/64/64
\e[0m";ES;fi;;
 17) S=M17;SC;if [[ $cur == enter ]];then R;echo -e "
 Отображает выходной сигнал VGA в форме трапеции, чтобы скорректировать
 трапецеидальные искажения, когда проектор находится немного выше экрана:
\e[32m
 xrandr --fb 1024x768 --output VGA --transform 1.24,0.16,-124,0,1.24,0,0,0.000316,1
 \e[0m";ES;fi;;
#
 18) S=M18;SC;if [[ $cur == enter ]];then R;echo -e "
 Wed Feb 15 11:04:12 PM CET 2023
 Описание утилиты xrandr.
 Примитивный интерфейс командной строки для расширения RandR
 Asciinema:  \e[36m https://asciinema.org/a/89Mntuu8eviAWU9etyXCq61p2\e[0m
 Github:     \e[36m \e[0m
 Gitlab:     \e[36m \e[0m
 Sourceforge:\e[36m \e[0m
 Notabug:    \e[36m \e[0m
 Bitbucket:  \e[36m \e[0m
 Framagit:   \e[36m \e[0m
 Gitea:      \e[36m \e[0m
 GFogs: The owner has reached maximum creation limit of 10 repositories.
 Codeberg | 
";ES;fi;;
 19) S=M19;SC;if [[ $cur == enter ]];then R;clear;ls -l;exit 0;fi;;
 esac;POS;done
