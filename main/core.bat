@echo off
if not exist %cd%\data\setting.tscf goto first-setting 
for /F %%a in ('echo prompt $E ^| cmd') do set "ESC=%%a"
:welcome
 echo;
 echo ^|   ^|   /\   ^|       ^|   ^|   /\   ^|￣\  
 echo ^|---^|  /--\  ^|    -- ^|---^|  /--\  ^|--^< 
 echo ^|   ^| /    \ ^|___    ^|   ^| /    \ ^|__/  
 echo;
 echo プレイヤー数を入力してください。(2~8)
 set /p hh_player=
 echo;
 echo %hh_player% 人で開始しますか?
 set /p hh_confirm=(y/n) : 
 if not %hh_confirm% == y goto welcome
 if not %hh_player% GEQ 2 goto welcome
 if not %hh_player% LEQ 8 goto welcome
 rem 開始設定
  echo Now Loading...
 rem アーカイブ口座
  set hh_player1archive=0
  set hh_player2archive=0
  set hh_player3archive=0
  set hh_player4archive=0
  set hh_player5archive=0
  set hh_player6archive=0
  set hh_player7archive=0
  set hh_player8archive=0
 rem 所持星
  set hh_player1star=0
  set hh_player2star=0
  set hh_player3star=0
  set hh_player4star=0
  set hh_player5star=0
  set hh_player6star=0
  set hh_player7star=0
  set hh_player8star=0
 rem ユーザネーム
  set hh_player1name=Player1
  set hh_player2name=Player2
  set hh_player3name=Player3
  set hh_player4name=Player4
  set hh_player5name=Player5
  set hh_player6name=Player6
  set hh_player7name=Player7
  set hh_player8name=Player8
 rem 設定ファイル読み込み
  for /f "tokens=1-7 delims=," %%a in (%cd%\data\setting.tscf) do (
    %%a
    %%b
    %%c
    %%d
    %%e
    %%f
    %%g
  )
  rem 定義: a:初期所持点数,b:下限点数,c:ゲーム終了必要星数,d:ゲーム強制終了ターン数,e:税金金額,f:非課税最大数,g:イージーモード
 rem 所持点数
  set hh_player1point=%hh_temp%
  set hh_player2point=%hh_temp%
  set hh_player3point=%hh_temp%
  set hh_player4point=%hh_temp%
  set hh_player5point=%hh_temp%
  set hh_player6point=%hh_temp%
  set hh_player7point=%hh_temp%
  set hh_player8point=%hh_temp%
 rem 全体設定
  set hh_turn=0
  set hh_allturn=0
  echo Done.
  echo;
 rem ユーザ設定
  echo ユーザネーム設定を行います。
  echo 入力順がターン順となります。
  echo;
  echo プレイヤー1の名前を入力してください。 そのままEnterキーを押すとPlayer1になります。
  set /p hh_player1name=
  echo;
  echo プレイヤー2の名前を入力してください。 そのままEnterキーを押すとPlayer2になります。
  set /p hh_player2name=
  echo;
 if %hh_player% == 2 goto startplayer
  echo プレイヤー3の名前を入力してください。 そのままEnterキーを押すとPlayer3になります。
  set /p hh_player3name=
  echo;
 if %hh_player% == 3 goto startplayer
  echo プレイヤー4の名前を入力してください。 そのままEnterキーを押すとPlayer4になります。
  set /p hh_player4name=
  echo;
 if %hh_player% == 4 goto startplayer
  echo プレイヤー5の名前を入力してください。 そのままEnterキーを押すとPlayer5になります。
  set /p hh_player5name=
  echo;
 if %hh_player% == 5 goto startplayer
  echo プレイヤー6の名前を入力してください。 そのままEnterキーを押すとPlayer6になります。
  set /p hh_player6name=
  echo;
 if %hh_player% == 6 goto startplayer
  echo プレイヤー7の名前を入力してください。 そのままEnterキーを押すとPlayer7になります。
  set /p hh_player7name=
  echo;
 if %hh_player% == 7 goto startplayer
  echo プレイヤー8の名前を入力してください。 そのままEnterキーを押すとPlayer8になります。
  set /p hh_player8name=
  echo;
 if %hh_player% == 8 goto startplayer
 rem 開始設定終了
 set hh_game=0
:startplayer
 rem プレイヤーターン数
  set hh_player1turn=0
  set hh_player2turn=0
  set hh_player3turn=0
  set hh_player4turn=0
  set hh_player5turn=0
  set hh_player6turn=0
  set hh_player7turn=0
  set hh_player8turn=0
 echo 新しい数字が決定されました!
 set hh_number=%random%%random%
 if %hh_easymode% == true set hh_number=%random%
 set hh_round=0
 set /a hh_game=%hh_game% + 1
 :thinkingtime
 set hh_star=false
 set /a hh_round=%hh_round% + 1
 set /a hh_turn=%hh_turn% + 1
 set /a hh_allturn= %hh_allturn% + 1
 if %hh_player1point% LEQ -30 set hh_player1point=-30
 if %hh_player2point% LEQ -30 set hh_player2point=-30
 if %hh_player3point% LEQ -30 set hh_player3point=-30
 if %hh_player4point% LEQ -30 set hh_player4point=-30
 if %hh_player5point% LEQ -30 set hh_player5point=-30
 if %hh_player6point% LEQ -30 set hh_player6point=-30
 if %hh_player7point% LEQ -30 set hh_player7point=-30
 if %hh_player8point% LEQ -30 set hh_player8point=-30
 echo;
 if %hh_round% == 1 if %hh_player1point% GTR %hh_nontaxlimit% echo %hh_player1name% は %hh_taxprice% 点の税金を支払いました。
 if %hh_round% == 1 if %hh_player1point% GTR %hh_nontaxlimit% set /a hh_player1point=%hh_player1point% - %hh_taxprice%
 if %hh_round% == 2 if %hh_player2point% GTR %hh_nontaxlimit% echo %hh_player2name% は %hh_taxprice% 点の税金を支払いました。
 if %hh_round% == 2 if %hh_player2point% GTR %hh_nontaxlimit% set /a hh_player2point=%hh_player2point% - %hh_taxprice%
 if %hh_round% == 3 if %hh_player3point% GTR %hh_nontaxlimit% echo %hh_player3name% は %hh_taxprice% 点の税金を支払いました。
 if %hh_round% == 3 if %hh_player3point% GTR %hh_nontaxlimit% set /a hh_player3point=%hh_player3point% - %hh_taxprice%
 if %hh_round% == 4 if %hh_player4point% GTR %hh_nontaxlimit% echo %hh_player4name% は %hh_taxprice% 点の税金を支払いました。
 if %hh_round% == 4 if %hh_player4point% GTR %hh_nontaxlimit% set /a hh_player4point=%hh_player4point% - %hh_taxprice%
 if %hh_round% == 5 if %hh_player5point% GTR %hh_nontaxlimit% echo %hh_player5name% は %hh_taxprice% 点の税金を支払いました。
 if %hh_round% == 5 if %hh_player5point% GTR %hh_nontaxlimit% set /a hh_player5point=%hh_player5point% - %hh_taxprice%
 if %hh_round% == 6 if %hh_player6point% GTR %hh_nontaxlimit% echo %hh_player6name% は %hh_taxprice% 点の税金を支払いました。
 if %hh_round% == 6 if %hh_player6point% GTR %hh_nontaxlimit% set /a hh_player6point=%hh_player6point% - %hh_taxprice%
 if %hh_round% == 7 if %hh_player7point% GTR %hh_nontaxlimit% echo %hh_player7name% は %hh_taxprice% 点の税金を支払いました。
 if %hh_round% == 7 if %hh_player7point% GTR %hh_nontaxlimit% set /a hh_player7point=%hh_player7point% - %hh_taxprice%
 if %hh_round% == 8 if %hh_player8point% GTR %hh_nontaxlimit% echo %hh_player8name% は %hh_taxprice% 点の税金を支払いました。
 if %hh_round% == 8 if %hh_player8point% GTR %hh_nontaxlimit% set /a hh_player8point=%hh_player8point% - %hh_taxprice%
 echo;
 echo ----------ターン:%hh_turn% , 全ゲーム累計ターン:%hh_allturn%---------- 
 echo %hh_player1name% : 点数 %hh_player1point% ^| アーカイブ %hh_player1archive% ^| 星 %hh_player1star% ^| %hh_player1stardisplay%
 echo %hh_player2name% : 点数 %hh_player2point% ^| アーカイブ %hh_player2archive% ^| 星 %hh_player2star% ^| %hh_player2stardisplay%
 if %hh_player% GEQ 3 echo %hh_player3name% : 点数 %hh_player3point% ^| アーカイブ %hh_player3archive% ^| 星 %hh_player3star% ^| %hh_player3stardisplay%
 if %hh_player% GEQ 4 echo %hh_player4name% : 点数 %hh_player4point% ^| アーカイブ %hh_player4archive% ^| 星 %hh_player4star% ^| %hh_player4stardisplay%
 if %hh_player% GEQ 5 echo %hh_player5name% : 点数 %hh_player5point% ^| アーカイブ %hh_player5archive% ^| 星 %hh_player5star% ^| %hh_player5stardisplay%
 if %hh_player% GEQ 6 echo %hh_player6name% : 点数 %hh_player6point% ^| アーカイブ %hh_player6archive% ^| 星 %hh_player6star% ^| %hh_player6stardisplay%
 if %hh_player% GEQ 7 echo %hh_player7name% : 点数 %hh_player7point% ^| アーカイブ %hh_player7archive% ^| 星 %hh_player7star% ^| %hh_player7stardisplay%
 if %hh_player% GEQ 8 echo %hh_player8name% : 点数 %hh_player8point% ^| アーカイブ %hh_player8archive% ^| 星 %hh_player8star% ^| %hh_player8stardisplay%
 echo ----------------------------------------------------------------------
 echo 非課税: %hh_nontaxlimit% , 税金: %hh_taxprice% , 必要星数: %hh_needstar% .
 echo ----------------------------------------------------------------------
 if %hh_round% == 1 echo %hh_player1name% のターンです。
 if %hh_round% == 2 echo %hh_player2name% のターンです。
 if %hh_round% == 3 echo %hh_player3name% のターンです。
 if %hh_round% == 4 echo %hh_player4name% のターンです。
 if %hh_round% == 5 echo %hh_player5name% のターンです。
 if %hh_round% == 6 echo %hh_player6name% のターンです。
 if %hh_round% == 7 echo %hh_player7name% のターンです。
 if %hh_round% == 8 echo %hh_player8name% のターンです。
 echo;
 set hh_notfirst=false
 :selectaction
 echo;
 echo 行動を選択してください。
 echo "help"で行動の情報を出力します。
 set /p hh_userinput=(1/2/3/help) : 
 set hh_notfirst=true
 if %hh_userinput% == 1 goto action1
 if %hh_userinput% == 2 goto action2
 if %hh_userinput% == 3 goto action3
 if %hh_userinput% == 4 goto action4
 if %hh_userinput% == help more %cd%\data\koudou1.txt %cd%\data\koudou2.txt %cd%\data\koudou3.txt
 if %hh_userinput% == set set hh_
 goto selectaction
 :action1
  echo 任意の数字と選択された数字でハイアンドローを行います。
  echo;
  if %hh_easymode% == false set /p hh_temp=0~3,276,732,767の数字を入力してください(カンマなし): 
  if %hh_easymode% == true set /p hh_temp=0~32,767の数字を入力してください(カンマなし): 
  set /p hh_hal=HighまたはLowを選択してください(h/l): 
  if %hh_hal% == h set hh_hal=high
  if %hh_hal% == l set hh_hal=low
  set /p hh_confirm=%hh_temp%の%hh_hal%で行いますか?(y/n): 
  if not %hh_confirm% == y goto selectaction
  if %hh_hal% == high set hh_confirm=GTR
  if %hh_hal% == low set hh_confirm=LSS
  if %hh_number% %hh_confirm% %hh_temp% ( set hh_halresult=true ) ELSE ( set hh_halresult=false )
  if %hh_halresult% == true echo %hh_temp%の%hh_hal%の結果は %hh_halresult% , 成功しました。
  if %hh_halresult% == true ( if %hh_round% == 1 ( echo %hh_player1name% に 1 点が追加されました。))
  if %hh_halresult% == true ( if %hh_round% == 2 ( echo %hh_player2name% に 1 点が追加されました。))
  if %hh_halresult% == true ( if %hh_round% == 3 ( echo %hh_player3name% に 1 点が追加されました。))
  if %hh_halresult% == true ( if %hh_round% == 4 ( echo %hh_player4name% に 1 点が追加されました。))
  if %hh_halresult% == true ( if %hh_round% == 5 ( echo %hh_player5name% に 1 点が追加されました。))
  if %hh_halresult% == true ( if %hh_round% == 6 ( echo %hh_player6name% に 1 点が追加されました。))
  if %hh_halresult% == true ( if %hh_round% == 7 ( echo %hh_player7name% に 1 点が追加されました。))
  if %hh_halresult% == true ( if %hh_round% == 8 ( echo %hh_player8name% に 1 点が追加されました。))
  if %hh_halresult% == true ( if %hh_round% == 1 ( set /a hh_player1point=%hh_player1point% + 1))
  if %hh_halresult% == true ( if %hh_round% == 2 ( set /a hh_player2point=%hh_player2point% + 1))
  if %hh_halresult% == true ( if %hh_round% == 3 ( set /a hh_player3point=%hh_player3point% + 1))
  if %hh_halresult% == true ( if %hh_round% == 4 ( set /a hh_player4point=%hh_player4point% + 1))
  if %hh_halresult% == true ( if %hh_round% == 5 ( set /a hh_player5point=%hh_player5point% + 1))
  if %hh_halresult% == true ( if %hh_round% == 6 ( set /a hh_player6point=%hh_player6point% + 1))
  if %hh_halresult% == true ( if %hh_round% == 7 ( set /a hh_player7point=%hh_player7point% + 1))
  if %hh_halresult% == true ( if %hh_round% == 8 ( set /a hh_player8point=%hh_player8point% + 1))
  if %hh_halresult% == false echo %hh_temp%の%hh_hal%の結果は %hh_halresult% , 失敗しました。
  if %hh_halresult% == false ( if %hh_round% == 1 ( echo %hh_player1name% に -1 点が追加されました。))
  if %hh_halresult% == false ( if %hh_round% == 2 ( echo %hh_player2name% に -1 点が追加されました。))
  if %hh_halresult% == false ( if %hh_round% == 3 ( echo %hh_player3name% に -1 点が追加されました。))
  if %hh_halresult% == false ( if %hh_round% == 4 ( echo %hh_player4name% に -1 点が追加されました。))
  if %hh_halresult% == false ( if %hh_round% == 5 ( echo %hh_player5name% に -1 点が追加されました。))
  if %hh_halresult% == false ( if %hh_round% == 6 ( echo %hh_player6name% に -1 点が追加されました。))
  if %hh_halresult% == false ( if %hh_round% == 7 ( echo %hh_player7name% に -1 点が追加されました。))
  if %hh_halresult% == false ( if %hh_round% == 8 ( echo %hh_player8name% に -1 点が追加されました。))
  if %hh_halresult% == false ( if %hh_round% == 1 ( set /a hh_player1point=%hh_player1point% - 1))
  if %hh_halresult% == false ( if %hh_round% == 2 ( set /a hh_player2point=%hh_player2point% - 1))
  if %hh_halresult% == false ( if %hh_round% == 3 ( set /a hh_player3point=%hh_player3point% - 1))
  if %hh_halresult% == false ( if %hh_round% == 4 ( set /a hh_player4point=%hh_player4point% - 1))
  if %hh_halresult% == false ( if %hh_round% == 5 ( set /a hh_player5point=%hh_player5point% - 1))
  if %hh_halresult% == false ( if %hh_round% == 6 ( set /a hh_player6point=%hh_player6point% - 1))
  if %hh_halresult% == false ( if %hh_round% == 7 ( set /a hh_player7point=%hh_player7point% - 1))
  if %hh_halresult% == false ( if %hh_round% == 8 ( set /a hh_player8point=%hh_player8point% - 1))
  goto starcheck

 :action2
  echo ランダムな数字と選択された数字でハイアンドローを行います。
  echo;
  set hh_temp=%random%%random%
  if %hh_easymode% == true set hh_temp=%random%
  set /p hh_hal=HighまたはLowを選択してください(h/l): 
  if %hh_hal% == h set hh_hal=high
  if %hh_hal% == l set hh_hal=low
  set /p hh_confirm=[ランダムに選ばれた数字]の%hh_hal%で行いますか?(y/n): 
  if not %hh_confirm% == y goto selectaction
  if %hh_hal% == high ( if %hh_number% GTR %hh_temp% ( set hh_halresult=true ) ELSE ( set hh_halresult=false ))
  if %hh_hal% == low ( if %hh_number% LSS %hh_temp% ( set hh_halresult=true ) ELSE ( set hh_halresult=false ))
  if %hh_number% == %hh_temp% set hh_halresult=false
  if %hh_halresult% == true echo %hh_temp%の%hh_hal%の結果は %hh_halresult% , 成功しました。
  if %hh_halresult% == true ( if %hh_round% == 1 ( echo %hh_player1name% に 2 点が追加されました。))
  if %hh_halresult% == true ( if %hh_round% == 2 ( echo %hh_player2name% に 2 点が追加されました。))
  if %hh_halresult% == true ( if %hh_round% == 3 ( echo %hh_player3name% に 2 点が追加されました。))
  if %hh_halresult% == true ( if %hh_round% == 4 ( echo %hh_player4name% に 2 点が追加されました。))
  if %hh_halresult% == true ( if %hh_round% == 5 ( echo %hh_player5name% に 2 点が追加されました。))
  if %hh_halresult% == true ( if %hh_round% == 6 ( echo %hh_player6name% に 2 点が追加されました。))
  if %hh_halresult% == true ( if %hh_round% == 7 ( echo %hh_player7name% に 2 点が追加されました。))
  if %hh_halresult% == true ( if %hh_round% == 8 ( echo %hh_player8name% に 2 点が追加されました。))
  if %hh_halresult% == true ( if %hh_round% == 1 ( set /a hh_player1point=%hh_player1point% + 2))
  if %hh_halresult% == true ( if %hh_round% == 2 ( set /a hh_player2point=%hh_player2point% + 2))
  if %hh_halresult% == true ( if %hh_round% == 3 ( set /a hh_player3point=%hh_player3point% + 2))
  if %hh_halresult% == true ( if %hh_round% == 4 ( set /a hh_player4point=%hh_player4point% + 2))
  if %hh_halresult% == true ( if %hh_round% == 5 ( set /a hh_player5point=%hh_player5point% + 2))
  if %hh_halresult% == true ( if %hh_round% == 6 ( set /a hh_player6point=%hh_player6point% + 2))
  if %hh_halresult% == true ( if %hh_round% == 7 ( set /a hh_player7point=%hh_player7point% + 2))
  if %hh_halresult% == true ( if %hh_round% == 8 ( set /a hh_player8point=%hh_player8point% + 2))
  if %hh_halresult% == false echo %hh_temp%の%hh_hal%の結果は %hh_halresult% , 失敗しました。
  if %hh_halresult% == false ( if %hh_round% == 1 ( echo %hh_player1name% に -1 点が追加されました。))
  if %hh_halresult% == false ( if %hh_round% == 2 ( echo %hh_player2name% に -1 点が追加されました。))
  if %hh_halresult% == false ( if %hh_round% == 3 ( echo %hh_player3name% に -1 点が追加されました。))
  if %hh_halresult% == false ( if %hh_round% == 4 ( echo %hh_player4name% に -1 点が追加されました。))
  if %hh_halresult% == false ( if %hh_round% == 5 ( echo %hh_player5name% に -1 点が追加されました。))
  if %hh_halresult% == false ( if %hh_round% == 6 ( echo %hh_player6name% に -1 点が追加されました。))
  if %hh_halresult% == false ( if %hh_round% == 7 ( echo %hh_player7name% に -1 点が追加されました。))
  if %hh_halresult% == false ( if %hh_round% == 8 ( echo %hh_player8name% に -1 点が追加されました。))
  if %hh_halresult% == false ( if %hh_round% == 1 ( set /a hh_player1point=%hh_player1point% - 1))
  if %hh_halresult% == false ( if %hh_round% == 2 ( set /a hh_player2point=%hh_player2point% - 1))
  if %hh_halresult% == false ( if %hh_round% == 3 ( set /a hh_player3point=%hh_player3point% - 1))
  if %hh_halresult% == false ( if %hh_round% == 4 ( set /a hh_player4point=%hh_player4point% - 1))
  if %hh_halresult% == false ( if %hh_round% == 5 ( set /a hh_player5point=%hh_player5point% - 1))
  if %hh_halresult% == false ( if %hh_round% == 6 ( set /a hh_player6point=%hh_player6point% - 1))
  if %hh_halresult% == false ( if %hh_round% == 7 ( set /a hh_player7point=%hh_player7point% - 1))
  if %hh_halresult% == false ( if %hh_round% == 8 ( set /a hh_player8point=%hh_player8point% - 1))
  goto starcheck
 :action3
  if %hh_round% == 1 ( if %hh_player1point% LEQ 9 ( echo 必要点数が足りません。)) 
  if %hh_round% == 2 ( if %hh_player2point% LEQ 9 ( echo 必要点数が足りません。)) 
  if %hh_round% == 3 ( if %hh_player3point% LEQ 9 ( echo 必要点数が足りません。)) 
  if %hh_round% == 4 ( if %hh_player4point% LEQ 9 ( echo 必要点数が足りません。)) 
  if %hh_round% == 5 ( if %hh_player5point% LEQ 9 ( echo 必要点数が足りません。)) 
  if %hh_round% == 6 ( if %hh_player6point% LEQ 9 ( echo 必要点数が足りません。)) 
  if %hh_round% == 7 ( if %hh_player7point% LEQ 9 ( echo 必要点数が足りません。)) 
  if %hh_round% == 8 ( if %hh_player8point% LEQ 9 ( echo 必要点数が足りません。)) 
  if %hh_round% == 1 ( if %hh_player1point% LEQ 9 ( goto selectaction )) 
  if %hh_round% == 2 ( if %hh_player2point% LEQ 9 ( goto selectaction )) 
  if %hh_round% == 3 ( if %hh_player3point% LEQ 9 ( goto selectaction )) 
  if %hh_round% == 4 ( if %hh_player4point% LEQ 9 ( goto selectaction )) 
  if %hh_round% == 5 ( if %hh_player5point% LEQ 9 ( goto selectaction )) 
  if %hh_round% == 6 ( if %hh_player6point% LEQ 9 ( goto selectaction )) 
  if %hh_round% == 7 ( if %hh_player7point% LEQ 9 ( goto selectaction )) 
  if %hh_round% == 8 ( if %hh_player8point% LEQ 9 ( goto selectaction )) 
  echo 任意の数字と選択された数字でチェックを行います。
  echo;
  if %hh_easymode% == false set /p hh_temp=0~3,276,732,767の数字を入力してください(カンマなし): 
  if %hh_easymode% == true set /p hh_temp=0~32,767の数字を入力してください(カンマなし): 
  set /p hh_confirm=%hh_temp%で行いますか?(y/n): 
  if %hh_temp% == %hh_number% ( set hh_habresult=true ) ELSE ( set hh_habresult=false ) 
  if %hh_habresult% == true echo %hh_temp% の結果は %hh_habresult% , 成功しました。
  if %hh_habresult% == true echo 選択された数字は %hh_number% でした。
  if %hh_habresult% == true set hh_star=true
  if %hh_habresult% == false echo %hh_temp% の結果は %hh_habresult% , 失敗しました。
  if %hh_habresult% == false set hh_star=false
  goto starcheck
 :action4
 :action5
 :action6
 :action7


 :starcheck
  if %hh_star% == true goto star
  if %hh_player% == %hh_round% set hh_round=0
  goto thinkingtime

 :star
  echo 誰かが星を獲得しました! 
  echo 先に点数の精算を行います。
  echo ----------精算前の点数---------- 
  echo %hh_player1name% : 点数 %hh_player1point% ^| アーカイブ %hh_player1archive% ^| 星 %hh_player1star%
  echo %hh_player2name% : 点数 %hh_player2point% ^| アーカイブ %hh_player2archive% ^| 星 %hh_player2star%
  if %hh_player% GEQ 3 echo %hh_player3name% : 点数 %hh_player3point% ^| アーカイブ %hh_player3archive% ^| 星 %hh_player3star%
  if %hh_player% GEQ 4 echo %hh_player4name% : 点数 %hh_player4point% ^| アーカイブ %hh_player4archive% ^| 星 %hh_player4star%
  if %hh_player% GEQ 5 echo %hh_player5name% : 点数 %hh_player5point% ^| アーカイブ %hh_player5archive% ^| 星 %hh_player5star%
  if %hh_player% GEQ 6 echo %hh_player6name% : 点数 %hh_player6point% ^| アーカイブ %hh_player6archive% ^| 星 %hh_player6star%
  if %hh_player% GEQ 7 echo %hh_player7name% : 点数 %hh_player7point% ^| アーカイブ %hh_player7archive% ^| 星 %hh_player7star%
  if %hh_player% GEQ 8 echo %hh_player8name% : 点数 %hh_player8point% ^| アーカイブ %hh_player8archive% ^| 星 %hh_player8star%

  set /a hh_player1archive= %hh_player1archive%+%hh_player1point%
  set /a hh_player2archive= %hh_player2archive%+%hh_player2point%
  set /a hh_player3archive= %hh_player3archive%+%hh_player3point%
  set /a hh_player4archive= %hh_player4archive%+%hh_player4point%
  set /a hh_player5archive= %hh_player5archive%+%hh_player5point%
  set /a hh_player6archive= %hh_player6archive%+%hh_player6point%
  set /a hh_player7archive= %hh_player7archive%+%hh_player7point%
  set /a hh_player8archive= %hh_player8archive%+%hh_player8point%

  set /a hh_player1starpoint=%hh_player1archive%/50
  set /a hh_player2starpoint=%hh_player2archive%/50
  set /a hh_player3starpoint=%hh_player3archive%/50
  set /a hh_player4starpoint=%hh_player4archive%/50
  set /a hh_player5starpoint=%hh_player5archive%/50
  set /a hh_player6starpoint=%hh_player6archive%/50
  set /a hh_player7starpoint=%hh_player7archive%/50
  set /a hh_player8starpoint=%hh_player8archive%/50

  set /a hh_player1archive= %hh_player1archive%-%hh_player1starpoint%*25
  set /a hh_player2archive= %hh_player2archive%-%hh_player2starpoint%*25
  set /a hh_player3archive= %hh_player3archive%-%hh_player3starpoint%*25
  set /a hh_player4archive= %hh_player4archive%-%hh_player4starpoint%*25
  set /a hh_player5archive= %hh_player5archive%-%hh_player5starpoint%*25
  set /a hh_player6archive= %hh_player6archive%-%hh_player6starpoint%*25
  set /a hh_player7archive= %hh_player7archive%-%hh_player7starpoint%*25
  set /a hh_player8archive= %hh_player8archive%-%hh_player8starpoint%*25

  set /a hh_player1star=%hh_player1starpoint% + %hh_player1star%
  set /a hh_player2star=%hh_player2starpoint% + %hh_player2star%
  set /a hh_player3star=%hh_player3starpoint% + %hh_player3star%
  set /a hh_player4star=%hh_player4starpoint% + %hh_player4star%
  set /a hh_player5star=%hh_player5starpoint% + %hh_player5star%
  set /a hh_player6star=%hh_player6starpoint% + %hh_player6star%
  set /a hh_player7star=%hh_player7starpoint% + %hh_player7star%
  set /a hh_player8star=%hh_player8starpoint% + %hh_player8star%

  set hh_player1point=0
  set hh_player2point=0
  set hh_player3point=0
  set hh_player4point=0
  set hh_player5point=0
  set hh_player6point=0
  set hh_player7point=0
  set hh_player8point=0
  set hh_player1starpoint=0
  set hh_player2starpoint=0
  set hh_player3starpoint=0
  set hh_player4starpoint=0
  set hh_player5starpoint=0
  set hh_player6starpoint=0
  set hh_player7starpoint=0
  set hh_player8starpoint=0
  echo ----------精算後の点数---------- 
  echo %hh_player1name% : 点数 %hh_player1point% ^| アーカイブ %hh_player1archive% ^| 星 %hh_player1star% ^| %hh_player1stardisplay% 
  echo %hh_player2name% : 点数 %hh_player2point% ^| アーカイブ %hh_player2archive% ^| 星 %hh_player2star% ^| %hh_player2stardisplay% 
  if %hh_player% GEQ 3 echo %hh_player3name% : 点数 %hh_player3point% ^| アーカイブ %hh_player3archive% ^| 星 %hh_player3star% ^| %hh_player3stardisplay% 
  if %hh_player% GEQ 4 echo %hh_player4name% : 点数 %hh_player4point% ^| アーカイブ %hh_player4archive% ^| 星 %hh_player4star% ^| %hh_player4stardisplay% 
  if %hh_player% GEQ 5 echo %hh_player5name% : 点数 %hh_player5point% ^| アーカイブ %hh_player5archive% ^| 星 %hh_player5star% ^| %hh_player5stardisplay% 
  if %hh_player% GEQ 6 echo %hh_player6name% : 点数 %hh_player6point% ^| アーカイブ %hh_player6archive% ^| 星 %hh_player6star% ^| %hh_player6stardisplay% 
  if %hh_player% GEQ 7 echo %hh_player7name% : 点数 %hh_player7point% ^| アーカイブ %hh_player7archive% ^| 星 %hh_player7star% ^| %hh_player7stardisplay% 
  if %hh_player% GEQ 8 echo %hh_player8name% : 点数 %hh_player8point% ^| アーカイブ %hh_player8archive% ^| 星 %hh_player8star% ^| %hh_player8stardisplay% 
  echo -------------------------------- 
  if %hh_round% == 1 goto star1
  if %hh_round% == 2 goto star2
  if %hh_round% == 3 goto star3
  if %hh_round% == 4 goto star4
  if %hh_round% == 5 goto star5
  if %hh_round% == 6 goto star6
  if %hh_round% == 7 goto star7
  if %hh_round% == 8 goto star8
  :star1
   echo %hh_player1name% が星を獲得しました!
   set /a hh_player1star=%hh_player1star% + 1
   if %hh_player1star% == 1 set hh_player1stardisplay=★
   if %hh_player1star% == 2 set hh_player1stardisplay=★★
   if %hh_player1star% == 3 set hh_player1stardisplay=★★★
   if %hh_player1star% == 4 set hh_player1stardisplay=★★★★
   if %hh_player1star% == 5 set hh_player1stardisplay=★★★★★
   echo %hh_player1name% の合計星数は %hh_player1star% です!
   set hh_FinalGetStar=player1
   if %hh_player1star% GEQ %hh_needstar% goto endallgame
   goto endgame
  :star2
   echo %hh_player2name% が星を獲得しました!
   set /a hh_player2star=%hh_player2star% + 1
   if %hh_player2star% == 1 set hh_player2stardisplay=★
   if %hh_player2star% == 2 set hh_player2stardisplay=★★
   if %hh_player2star% == 3 set hh_player2stardisplay=★★★
   if %hh_player2star% == 4 set hh_player2stardisplay=★★★★
   if %hh_player2star% == 5 set hh_player2stardisplay=★★★★★
   echo %hh_player2name% の合計星数は %hh_player2star% です!
   set hh_FinalGetStar=player2
   if %hh_player2star% GEQ %hh_needstar% goto endallgame
   goto endgame
  :star%hh_needstar%
   echo %hh_player3name% が星を獲得しました!
   set /a hh_player3star=%hh_player3star% + 1
   if %hh_player3star% == 1 set hh_player3stardisplay=★
   if %hh_player3star% == 2 set hh_player3stardisplay=★★
   if %hh_player3star% == 3 set hh_player3stardisplay=★★★
   if %hh_player3star% == 4 set hh_player3stardisplay=★★★★
   if %hh_player3star% == 5 set hh_player3stardisplay=★★★★★
   echo %hh_player3name% の合計星数は %hh_player3star% です!
   set hh_FinalGetStar=player3
   if %hh_player3star% GEQ %hh_needstar% goto endallgame
   goto endgame
  :star4
   echo %hh_player4name% が星を獲得しました!
   set /a hh_player4star=%hh_player4star% + 1
   if %hh_player4star% == 1 set hh_player4stardisplay=★
   if %hh_player4star% == 2 set hh_player4stardisplay=★★
   if %hh_player4star% == 3 set hh_player4stardisplay=★★★
   if %hh_player4star% == 4 set hh_player4stardisplay=★★★★
   if %hh_player4star% == 5 set hh_player4stardisplay=★★★★★
   echo %hh_player4name% の合計星数は %hh_player4star% です!
   set hh_FinalGetStar=player4
   if %hh_player4star% GEQ %hh_needstar% goto endallgame
   goto endgame
  :star5
   echo %hh_player5name% が星を獲得しました!
   set /a hh_player5star=%hh_player5star% + 1
   if %hh_player5star% == 1 set hh_player5stardisplay=★
   if %hh_player5star% == 2 set hh_player5stardisplay=★★
   if %hh_player5star% == 3 set hh_player5stardisplay=★★★
   if %hh_player5star% == 4 set hh_player5stardisplay=★★★★
   if %hh_player5star% == 5 set hh_player5stardisplay=★★★★★
   echo %hh_player5name% の合計星数は %hh_player5star% です!
   set hh_FinalGetStar=player5
   if %hh_player5star% GEQ %hh_needstar% goto endallgame
   goto endgame
  :star6
   echo %hh_player6name% が星を獲得しました!
   set /a hh_player6star=%hh_player6star% + 1
   if %hh_player6star% == 1 set hh_player6stardisplay=★
   if %hh_player6star% == 2 set hh_player6stardisplay=★★
   if %hh_player6star% == 3 set hh_player6stardisplay=★★★
   if %hh_player6star% == 4 set hh_player6stardisplay=★★★★
   if %hh_player6star% == 5 set hh_player6stardisplay=★★★★★
   echo %hh_player6name% の合計星数は %hh_player6star% です!
   set hh_FinalGetStar=player6
   if %hh_player6star% GEQ %hh_needstar% goto endallgame
   goto endgame
  :star7
   echo %hh_player7name% が星を獲得しました!
   set /a hh_player7star=%hh_player7star% + 1
   if %hh_player7star% == 1 set hh_player7stardisplay=★
   if %hh_player7star% == 2 set hh_player7stardisplay=★★
   if %hh_player7star% == 3 set hh_player7stardisplay=★★★
   if %hh_player7star% == 4 set hh_player7stardisplay=★★★★
   if %hh_player7star% == 5 set hh_player7stardisplay=★★★★★
   echo %hh_player7name% の合計星数は %hh_player7star% です!
   set hh_FinalGetStar=player7
   if %hh_player7star% GEQ %hh_needstar% goto endallgame
   goto endgame
  :star8
   echo %hh_player8name% が星を獲得しました!
   set /a hh_player8star=%hh_player8star% + 1
   if %hh_player8star% == 1 set hh_player8stardisplay=★
   if %hh_player8star% == 2 set hh_player8stardisplay=★★
   if %hh_player8star% == 3 set hh_player8stardisplay=★★★
   if %hh_player8star% == 4 set hh_player8stardisplay=★★★★
   if %hh_player8star% == 5 set hh_player8stardisplay=★★★★★
   echo %hh_player8name% の合計星数は %hh_player8star% です!
   set hh_FinalGetStar=player8
   if %hh_player8star% GEQ %hh_needstar% goto endallgame
   goto endgame

:endgame
  echo ----------星精算後の点数---------- 
  echo %hh_player1name% : 点数 %hh_player1point% ^| アーカイブ %hh_player1archive% ^| 星 %hh_player1star% ^| %hh_player1stardisplay% 
  echo %hh_player2name% : 点数 %hh_player2point% ^| アーカイブ %hh_player2archive% ^| 星 %hh_player2star% ^| %hh_player2stardisplay% 
  if %hh_player% GEQ 3 echo %hh_player3name% : 点数 %hh_player3point% ^| アーカイブ %hh_player3archive% ^| 星 %hh_player3star% ^| %hh_player3stardisplay% 
  if %hh_player% GEQ 4 echo %hh_player4name% : 点数 %hh_player4point% ^| アーカイブ %hh_player4archive% ^| 星 %hh_player4star% ^| %hh_player4stardisplay% 
  if %hh_player% GEQ 5 echo %hh_player5name% : 点数 %hh_player5point% ^| アーカイブ %hh_player5archive% ^| 星 %hh_player5star% ^| %hh_player5stardisplay% 
  if %hh_player% GEQ 6 echo %hh_player6name% : 点数 %hh_player6point% ^| アーカイブ %hh_player6archive% ^| 星 %hh_player6star% ^| %hh_player6stardisplay% 
  if %hh_player% GEQ 7 echo %hh_player7name% : 点数 %hh_player7point% ^| アーカイブ %hh_player7archive% ^| 星 %hh_player7star% ^| %hh_player7stardisplay% 
  if %hh_player% GEQ 8 echo %hh_player8name% : 点数 %hh_player8point% ^| アーカイブ %hh_player8archive% ^| 星 %hh_player8star% ^| %hh_player8stardisplay% 
  echo -------------------------------- 
  goto startplayer
 
:endallgame
 echo;
 echo 必要星数: %hh_needstar% に到達したプレイヤーが発生したため、全ゲームを終了します。
 echo;
rem  echo 順位を計算しています...
rem  set hh_1st=%hh_player1name%,%hh_player1star%
rem  set hh_1ststar=%hh_1st:~-1,1%
rem  if %hh_1ststar% == 
rem 
rem  echo 順位が決定されました!
 echo ----------最終結果---------- 
 echo %hh_player1name% : 点数 %hh_player1point% ^| アーカイブ %hh_player1archive% ^| 星 %hh_player1star% ^| %hh_player1stardisplay% 
 echo %hh_player2name% : 点数 %hh_player2point% ^| アーカイブ %hh_player2archive% ^| 星 %hh_player2star% ^| %hh_player2stardisplay% 
 if %hh_player% GEQ 3 echo %hh_player3name% : 点数 %hh_player3point% ^| アーカイブ %hh_player3archive% ^| 星 %hh_player3star% ^| %hh_player3stardisplay% 
 if %hh_player% GEQ 4 echo %hh_player4name% : 点数 %hh_player4point% ^| アーカイブ %hh_player4archive% ^| 星 %hh_player4star% ^| %hh_player4stardisplay% 
 if %hh_player% GEQ 5 echo %hh_player5name% : 点数 %hh_player5point% ^| アーカイブ %hh_player5archive% ^| 星 %hh_player5star% ^| %hh_player5stardisplay% 
 if %hh_player% GEQ 6 echo %hh_player6name% : 点数 %hh_player6point% ^| アーカイブ %hh_player6archive% ^| 星 %hh_player6star% ^| %hh_player6stardisplay% 
 if %hh_player% GEQ 7 echo %hh_player7name% : 点数 %hh_player7point% ^| アーカイブ %hh_player7archive% ^| 星 %hh_player7star% ^| %hh_player7stardisplay% 
 if %hh_player% GEQ 8 echo %hh_player8name% : 点数 %hh_player8point% ^| アーカイブ %hh_player8archive% ^| 星 %hh_player8star% ^| %hh_player8stardisplay% 
 echo ----------------------------
 echo;
 echo 続行するとタイトルに戻ります。
 pause
 goto welcome

:first-setting
 md data
 md lib
 md save
 md temp
 echo ----行動:1 (ユーザ入力: 1 )---- >>koudou1.txt
 echo プレイヤーは任意の数字と選択された数字でハイアンドローを行う。 >>koudou1.txt
 echo  成功の場合は1点,失敗の場合は-1点を獲得する。   >>koudou1.txt
 echo  この行動で任意の数字と選択された数字が同一の場合、失敗とする。   >>koudou1.txt
 echo  任意の数字と判定結果は公開される。   >>koudou1.txt
 echo ----行動:2 (ユーザ入力: 2 )---- >>koudou2.txt
 echo 0~3,276,732,767のランダムな数字が選ばれ、ハイアンドローを行う。(イージーモードの場合は0~32767) >>koudou2.txt
 echo  成功の場合は2点,失敗の場合は-1点を獲得する。    >>koudou2.txt
 echo  この行動で選ばれた数字と選択された数字が同一の場合、成功とする。   >>koudou2.txt
 echo  選ばれた数字と判定結果は公開される。 >>koudou2.txt
 echo ----行動:3 (ユーザ入力: 3 )---- >>koudou3.txt
 echo プレイヤーは任意の数字と選択された数字でチェックを行う。 >>koudou3.txt
 echo  成功の場合は星が1つ付与され,失敗の場合は-5点を獲得する。   >>koudou3.txt
 echo  この行動は10点以上所持していないと選択できない。   >>koudou3.txt
 echo  任意の数字と判定結果は公開される。   >>koudou3.txt
 echo ----行動:4 (ユーザ入力: 4 )---- >>koudou4.txt
 echo 0~3,276,732,767のランダムな数字が選ばれ、チェックを行う。(イージーモードの場合は0~32767) >>koudou4.txt
 echo  成功の場合は星が3つ付与され,失敗の場合は0点を獲得する。   >>koudou4.txt
 echo  この行動は-20点以下でのみ選択できる。   >>koudou4.txt
 echo  選ばれた数字と判定結果は公開される。 >>koudou4.txt
 echo ----行動:5 (ユーザ入力: 5 )---- >>koudou5.txt
 echo プレイヤは任意の数字と選択された数字でハイアンドローを行う。 >>koudou5.txt
 echo  この行動は判定結果にかかわらず、3点を消費する。   >>koudou5.txt
 echo  この行動で任意の数字と選択された数字が同一の場合、失敗とする。   >>koudou5.txt
 echo  任意の数字と判定結果は公開されない。 >>koudou5.txt
 echo ----行動:6 (ユーザ入力: 6 )---- >>koudou6.txt
 echo 0~3276732767のランダムな数字が選ばれ、ハイアンドローを行う。 >>koudou6.txt
 echo  この行動は判定結果にかかわらず、2点を消費する。   >>koudou6.txt
 echo  この行動で選ばれた数字と選択された数字が同一の場合、失敗とする。   >>koudou6.txt
 echo  選ばれた数字と判定結果は公開されない。   >>koudou6.txt
 echo ----行動:7 (ユーザ入力: 7 )---- >>koudou7.txt
 echo 桁数を選択し、任意の数字と選ばれた数字の選択した桁数でチェックを行う。 >>koudou7.txt
 echo  成功の場合は正答者に10点,他プレイヤーには3点付与され,失敗の場合は-3点を獲得する。 >>koudou7.txt
 echo  成功の場合、成功時に点数がマイナスのプレイヤーは5点に設定される。 >>koudou7.txt
 echo  この行動は1点以上所持していないと選択できない。   >>koudou7.txt
 echo  この行動は全プレイヤーで1桁につき2回までしか使うことができない。 >>koudou7.txt
 echo  もし、存在しない桁数を選択した場合、一番上の桁でチェックが行われる。 >>koudou7.txt
 echo ----行動:8 (ユーザ入力: 8 )---- >>koudou8.txt
 echo 任意の数字が選ばれた数字に存在するかチェックを行う。 >>koudou8.txt
 echo  この行動は判定結果にかかわらず、5点を消費する。   >>koudou8.txt
 echo  この行動は5点以上所持していないと選択できない。 >>koudou8.txt
 echo set hh_temp=5,set hh_limit=-30,set hh_needstar=3,rem hh_endturn=-1,set hh_taxprice=1,set hh_nontaxlimit=10,set hh_easymode=true >%cd%\data\setting.tscf
 call core.bat