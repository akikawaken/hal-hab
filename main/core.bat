@echo off
if not exist %cd%\data\setting.tscf goto first-setting 
for /F %%a in ('echo prompt $E ^| cmd') do set "ESC=%%a"
:welcome
 echo;
 echo ^|   ^|   /\   ^|       ^|   ^|   /\   ^|�P\  
 echo ^|---^|  /--\  ^|    -- ^|---^|  /--\  ^|--^< 
 echo ^|   ^| /    \ ^|___    ^|   ^| /    \ ^|__/  
 echo;
 echo �v���C���[������͂��Ă��������B(2~8)
 set /p hh_player=
 echo;
 echo %hh_player% �l�ŊJ�n���܂���?
 set /p hh_confirm=(y/n) : 
 if not %hh_confirm% == y goto welcome
 if not %hh_player% GEQ 2 goto welcome
 if not %hh_player% LEQ 8 goto welcome
 rem �J�n�ݒ�
  echo Now Loading...
 rem �A�[�J�C�u����
  set hh_player1archive=0
  set hh_player2archive=0
  set hh_player3archive=0
  set hh_player4archive=0
  set hh_player5archive=0
  set hh_player6archive=0
  set hh_player7archive=0
  set hh_player8archive=0
 rem ������
  set hh_player1star=0
  set hh_player2star=0
  set hh_player3star=0
  set hh_player4star=0
  set hh_player5star=0
  set hh_player6star=0
  set hh_player7star=0
  set hh_player8star=0
 rem ���[�U�l�[��
  set hh_player1name=Player1
  set hh_player2name=Player2
  set hh_player3name=Player3
  set hh_player4name=Player4
  set hh_player5name=Player5
  set hh_player6name=Player6
  set hh_player7name=Player7
  set hh_player8name=Player8
 rem �ݒ�t�@�C���ǂݍ���
  for /f "tokens=1-7 delims=," %%a in (%cd%\data\setting.tscf) do (
    %%a
    %%b
    %%c
    %%d
    %%e
    %%f
    %%g
  )
  rem ��`: a:���������_��,b:�����_��,c:�Q�[���I���K�v����,d:�Q�[�������I���^�[����,e:�ŋ����z,f:��ېōő吔,g:�C�[�W�[���[�h
 rem �����_��
  set hh_player1point=%hh_temp%
  set hh_player2point=%hh_temp%
  set hh_player3point=%hh_temp%
  set hh_player4point=%hh_temp%
  set hh_player5point=%hh_temp%
  set hh_player6point=%hh_temp%
  set hh_player7point=%hh_temp%
  set hh_player8point=%hh_temp%
 rem �S�̐ݒ�
  set hh_turn=0
  set hh_allturn=0
  echo Done.
  echo;
 rem ���[�U�ݒ�
  echo ���[�U�l�[���ݒ���s���܂��B
  echo ���͏����^�[�����ƂȂ�܂��B
  echo;
  echo �v���C���[1�̖��O����͂��Ă��������B ���̂܂�Enter�L�[��������Player1�ɂȂ�܂��B
  set /p hh_player1name=
  echo;
  echo �v���C���[2�̖��O����͂��Ă��������B ���̂܂�Enter�L�[��������Player2�ɂȂ�܂��B
  set /p hh_player2name=
  echo;
 if %hh_player% == 2 goto startplayer
  echo �v���C���[3�̖��O����͂��Ă��������B ���̂܂�Enter�L�[��������Player3�ɂȂ�܂��B
  set /p hh_player3name=
  echo;
 if %hh_player% == 3 goto startplayer
  echo �v���C���[4�̖��O����͂��Ă��������B ���̂܂�Enter�L�[��������Player4�ɂȂ�܂��B
  set /p hh_player4name=
  echo;
 if %hh_player% == 4 goto startplayer
  echo �v���C���[5�̖��O����͂��Ă��������B ���̂܂�Enter�L�[��������Player5�ɂȂ�܂��B
  set /p hh_player5name=
  echo;
 if %hh_player% == 5 goto startplayer
  echo �v���C���[6�̖��O����͂��Ă��������B ���̂܂�Enter�L�[��������Player6�ɂȂ�܂��B
  set /p hh_player6name=
  echo;
 if %hh_player% == 6 goto startplayer
  echo �v���C���[7�̖��O����͂��Ă��������B ���̂܂�Enter�L�[��������Player7�ɂȂ�܂��B
  set /p hh_player7name=
  echo;
 if %hh_player% == 7 goto startplayer
  echo �v���C���[8�̖��O����͂��Ă��������B ���̂܂�Enter�L�[��������Player8�ɂȂ�܂��B
  set /p hh_player8name=
  echo;
 if %hh_player% == 8 goto startplayer
 rem �J�n�ݒ�I��
 set hh_game=0
:startplayer
 rem �v���C���[�^�[����
  set hh_player1turn=0
  set hh_player2turn=0
  set hh_player3turn=0
  set hh_player4turn=0
  set hh_player5turn=0
  set hh_player6turn=0
  set hh_player7turn=0
  set hh_player8turn=0
 echo �V�������������肳��܂���!
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
 if %hh_round% == 1 if %hh_player1point% GTR %hh_nontaxlimit% echo %hh_player1name% �� %hh_taxprice% �_�̐ŋ����x�����܂����B
 if %hh_round% == 1 if %hh_player1point% GTR %hh_nontaxlimit% set /a hh_player1point=%hh_player1point% - %hh_taxprice%
 if %hh_round% == 2 if %hh_player2point% GTR %hh_nontaxlimit% echo %hh_player2name% �� %hh_taxprice% �_�̐ŋ����x�����܂����B
 if %hh_round% == 2 if %hh_player2point% GTR %hh_nontaxlimit% set /a hh_player2point=%hh_player2point% - %hh_taxprice%
 if %hh_round% == 3 if %hh_player3point% GTR %hh_nontaxlimit% echo %hh_player3name% �� %hh_taxprice% �_�̐ŋ����x�����܂����B
 if %hh_round% == 3 if %hh_player3point% GTR %hh_nontaxlimit% set /a hh_player3point=%hh_player3point% - %hh_taxprice%
 if %hh_round% == 4 if %hh_player4point% GTR %hh_nontaxlimit% echo %hh_player4name% �� %hh_taxprice% �_�̐ŋ����x�����܂����B
 if %hh_round% == 4 if %hh_player4point% GTR %hh_nontaxlimit% set /a hh_player4point=%hh_player4point% - %hh_taxprice%
 if %hh_round% == 5 if %hh_player5point% GTR %hh_nontaxlimit% echo %hh_player5name% �� %hh_taxprice% �_�̐ŋ����x�����܂����B
 if %hh_round% == 5 if %hh_player5point% GTR %hh_nontaxlimit% set /a hh_player5point=%hh_player5point% - %hh_taxprice%
 if %hh_round% == 6 if %hh_player6point% GTR %hh_nontaxlimit% echo %hh_player6name% �� %hh_taxprice% �_�̐ŋ����x�����܂����B
 if %hh_round% == 6 if %hh_player6point% GTR %hh_nontaxlimit% set /a hh_player6point=%hh_player6point% - %hh_taxprice%
 if %hh_round% == 7 if %hh_player7point% GTR %hh_nontaxlimit% echo %hh_player7name% �� %hh_taxprice% �_�̐ŋ����x�����܂����B
 if %hh_round% == 7 if %hh_player7point% GTR %hh_nontaxlimit% set /a hh_player7point=%hh_player7point% - %hh_taxprice%
 if %hh_round% == 8 if %hh_player8point% GTR %hh_nontaxlimit% echo %hh_player8name% �� %hh_taxprice% �_�̐ŋ����x�����܂����B
 if %hh_round% == 8 if %hh_player8point% GTR %hh_nontaxlimit% set /a hh_player8point=%hh_player8point% - %hh_taxprice%
 echo;
 echo ----------�^�[��:%hh_turn% , �S�Q�[���݌v�^�[��:%hh_allturn%---------- 
 echo %hh_player1name% : �_�� %hh_player1point% ^| �A�[�J�C�u %hh_player1archive% ^| �� %hh_player1star% ^| %hh_player1stardisplay%
 echo %hh_player2name% : �_�� %hh_player2point% ^| �A�[�J�C�u %hh_player2archive% ^| �� %hh_player2star% ^| %hh_player2stardisplay%
 if %hh_player% GEQ 3 echo %hh_player3name% : �_�� %hh_player3point% ^| �A�[�J�C�u %hh_player3archive% ^| �� %hh_player3star% ^| %hh_player3stardisplay%
 if %hh_player% GEQ 4 echo %hh_player4name% : �_�� %hh_player4point% ^| �A�[�J�C�u %hh_player4archive% ^| �� %hh_player4star% ^| %hh_player4stardisplay%
 if %hh_player% GEQ 5 echo %hh_player5name% : �_�� %hh_player5point% ^| �A�[�J�C�u %hh_player5archive% ^| �� %hh_player5star% ^| %hh_player5stardisplay%
 if %hh_player% GEQ 6 echo %hh_player6name% : �_�� %hh_player6point% ^| �A�[�J�C�u %hh_player6archive% ^| �� %hh_player6star% ^| %hh_player6stardisplay%
 if %hh_player% GEQ 7 echo %hh_player7name% : �_�� %hh_player7point% ^| �A�[�J�C�u %hh_player7archive% ^| �� %hh_player7star% ^| %hh_player7stardisplay%
 if %hh_player% GEQ 8 echo %hh_player8name% : �_�� %hh_player8point% ^| �A�[�J�C�u %hh_player8archive% ^| �� %hh_player8star% ^| %hh_player8stardisplay%
 echo ----------------------------------------------------------------------
 echo ��ې�: %hh_nontaxlimit% , �ŋ�: %hh_taxprice% , �K�v����: %hh_needstar% .
 echo ----------------------------------------------------------------------
 if %hh_round% == 1 echo %hh_player1name% �̃^�[���ł��B
 if %hh_round% == 2 echo %hh_player2name% �̃^�[���ł��B
 if %hh_round% == 3 echo %hh_player3name% �̃^�[���ł��B
 if %hh_round% == 4 echo %hh_player4name% �̃^�[���ł��B
 if %hh_round% == 5 echo %hh_player5name% �̃^�[���ł��B
 if %hh_round% == 6 echo %hh_player6name% �̃^�[���ł��B
 if %hh_round% == 7 echo %hh_player7name% �̃^�[���ł��B
 if %hh_round% == 8 echo %hh_player8name% �̃^�[���ł��B
 echo;
 set hh_notfirst=false
 :selectaction
 echo;
 echo �s����I�����Ă��������B
 echo "help"�ōs���̏����o�͂��܂��B
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
  echo �C�ӂ̐����ƑI�����ꂽ�����Ńn�C�A���h���[���s���܂��B
  echo;
  if %hh_easymode% == false set /p hh_temp=0~3,276,732,767�̐�������͂��Ă�������(�J���}�Ȃ�): 
  if %hh_easymode% == true set /p hh_temp=0~32,767�̐�������͂��Ă�������(�J���}�Ȃ�): 
  set /p hh_hal=High�܂���Low��I�����Ă�������(h/l): 
  if %hh_hal% == h set hh_hal=high
  if %hh_hal% == l set hh_hal=low
  set /p hh_confirm=%hh_temp%��%hh_hal%�ōs���܂���?(y/n): 
  if not %hh_confirm% == y goto selectaction
  if %hh_hal% == high set hh_confirm=GTR
  if %hh_hal% == low set hh_confirm=LSS
  if %hh_number% %hh_confirm% %hh_temp% ( set hh_halresult=true ) ELSE ( set hh_halresult=false )
  if %hh_halresult% == true echo %hh_temp%��%hh_hal%�̌��ʂ� %hh_halresult% , �������܂����B
  if %hh_halresult% == true ( if %hh_round% == 1 ( echo %hh_player1name% �� 1 �_���ǉ�����܂����B))
  if %hh_halresult% == true ( if %hh_round% == 2 ( echo %hh_player2name% �� 1 �_���ǉ�����܂����B))
  if %hh_halresult% == true ( if %hh_round% == 3 ( echo %hh_player3name% �� 1 �_���ǉ�����܂����B))
  if %hh_halresult% == true ( if %hh_round% == 4 ( echo %hh_player4name% �� 1 �_���ǉ�����܂����B))
  if %hh_halresult% == true ( if %hh_round% == 5 ( echo %hh_player5name% �� 1 �_���ǉ�����܂����B))
  if %hh_halresult% == true ( if %hh_round% == 6 ( echo %hh_player6name% �� 1 �_���ǉ�����܂����B))
  if %hh_halresult% == true ( if %hh_round% == 7 ( echo %hh_player7name% �� 1 �_���ǉ�����܂����B))
  if %hh_halresult% == true ( if %hh_round% == 8 ( echo %hh_player8name% �� 1 �_���ǉ�����܂����B))
  if %hh_halresult% == true ( if %hh_round% == 1 ( set /a hh_player1point=%hh_player1point% + 1))
  if %hh_halresult% == true ( if %hh_round% == 2 ( set /a hh_player2point=%hh_player2point% + 1))
  if %hh_halresult% == true ( if %hh_round% == 3 ( set /a hh_player3point=%hh_player3point% + 1))
  if %hh_halresult% == true ( if %hh_round% == 4 ( set /a hh_player4point=%hh_player4point% + 1))
  if %hh_halresult% == true ( if %hh_round% == 5 ( set /a hh_player5point=%hh_player5point% + 1))
  if %hh_halresult% == true ( if %hh_round% == 6 ( set /a hh_player6point=%hh_player6point% + 1))
  if %hh_halresult% == true ( if %hh_round% == 7 ( set /a hh_player7point=%hh_player7point% + 1))
  if %hh_halresult% == true ( if %hh_round% == 8 ( set /a hh_player8point=%hh_player8point% + 1))
  if %hh_halresult% == false echo %hh_temp%��%hh_hal%�̌��ʂ� %hh_halresult% , ���s���܂����B
  if %hh_halresult% == false ( if %hh_round% == 1 ( echo %hh_player1name% �� -1 �_���ǉ�����܂����B))
  if %hh_halresult% == false ( if %hh_round% == 2 ( echo %hh_player2name% �� -1 �_���ǉ�����܂����B))
  if %hh_halresult% == false ( if %hh_round% == 3 ( echo %hh_player3name% �� -1 �_���ǉ�����܂����B))
  if %hh_halresult% == false ( if %hh_round% == 4 ( echo %hh_player4name% �� -1 �_���ǉ�����܂����B))
  if %hh_halresult% == false ( if %hh_round% == 5 ( echo %hh_player5name% �� -1 �_���ǉ�����܂����B))
  if %hh_halresult% == false ( if %hh_round% == 6 ( echo %hh_player6name% �� -1 �_���ǉ�����܂����B))
  if %hh_halresult% == false ( if %hh_round% == 7 ( echo %hh_player7name% �� -1 �_���ǉ�����܂����B))
  if %hh_halresult% == false ( if %hh_round% == 8 ( echo %hh_player8name% �� -1 �_���ǉ�����܂����B))
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
  echo �����_���Ȑ����ƑI�����ꂽ�����Ńn�C�A���h���[���s���܂��B
  echo;
  set hh_temp=%random%%random%
  if %hh_easymode% == true set hh_temp=%random%
  set /p hh_hal=High�܂���Low��I�����Ă�������(h/l): 
  if %hh_hal% == h set hh_hal=high
  if %hh_hal% == l set hh_hal=low
  set /p hh_confirm=[�����_���ɑI�΂ꂽ����]��%hh_hal%�ōs���܂���?(y/n): 
  if not %hh_confirm% == y goto selectaction
  if %hh_hal% == high ( if %hh_number% GTR %hh_temp% ( set hh_halresult=true ) ELSE ( set hh_halresult=false ))
  if %hh_hal% == low ( if %hh_number% LSS %hh_temp% ( set hh_halresult=true ) ELSE ( set hh_halresult=false ))
  if %hh_number% == %hh_temp% set hh_halresult=false
  if %hh_halresult% == true echo %hh_temp%��%hh_hal%�̌��ʂ� %hh_halresult% , �������܂����B
  if %hh_halresult% == true ( if %hh_round% == 1 ( echo %hh_player1name% �� 2 �_���ǉ�����܂����B))
  if %hh_halresult% == true ( if %hh_round% == 2 ( echo %hh_player2name% �� 2 �_���ǉ�����܂����B))
  if %hh_halresult% == true ( if %hh_round% == 3 ( echo %hh_player3name% �� 2 �_���ǉ�����܂����B))
  if %hh_halresult% == true ( if %hh_round% == 4 ( echo %hh_player4name% �� 2 �_���ǉ�����܂����B))
  if %hh_halresult% == true ( if %hh_round% == 5 ( echo %hh_player5name% �� 2 �_���ǉ�����܂����B))
  if %hh_halresult% == true ( if %hh_round% == 6 ( echo %hh_player6name% �� 2 �_���ǉ�����܂����B))
  if %hh_halresult% == true ( if %hh_round% == 7 ( echo %hh_player7name% �� 2 �_���ǉ�����܂����B))
  if %hh_halresult% == true ( if %hh_round% == 8 ( echo %hh_player8name% �� 2 �_���ǉ�����܂����B))
  if %hh_halresult% == true ( if %hh_round% == 1 ( set /a hh_player1point=%hh_player1point% + 2))
  if %hh_halresult% == true ( if %hh_round% == 2 ( set /a hh_player2point=%hh_player2point% + 2))
  if %hh_halresult% == true ( if %hh_round% == 3 ( set /a hh_player3point=%hh_player3point% + 2))
  if %hh_halresult% == true ( if %hh_round% == 4 ( set /a hh_player4point=%hh_player4point% + 2))
  if %hh_halresult% == true ( if %hh_round% == 5 ( set /a hh_player5point=%hh_player5point% + 2))
  if %hh_halresult% == true ( if %hh_round% == 6 ( set /a hh_player6point=%hh_player6point% + 2))
  if %hh_halresult% == true ( if %hh_round% == 7 ( set /a hh_player7point=%hh_player7point% + 2))
  if %hh_halresult% == true ( if %hh_round% == 8 ( set /a hh_player8point=%hh_player8point% + 2))
  if %hh_halresult% == false echo %hh_temp%��%hh_hal%�̌��ʂ� %hh_halresult% , ���s���܂����B
  if %hh_halresult% == false ( if %hh_round% == 1 ( echo %hh_player1name% �� -1 �_���ǉ�����܂����B))
  if %hh_halresult% == false ( if %hh_round% == 2 ( echo %hh_player2name% �� -1 �_���ǉ�����܂����B))
  if %hh_halresult% == false ( if %hh_round% == 3 ( echo %hh_player3name% �� -1 �_���ǉ�����܂����B))
  if %hh_halresult% == false ( if %hh_round% == 4 ( echo %hh_player4name% �� -1 �_���ǉ�����܂����B))
  if %hh_halresult% == false ( if %hh_round% == 5 ( echo %hh_player5name% �� -1 �_���ǉ�����܂����B))
  if %hh_halresult% == false ( if %hh_round% == 6 ( echo %hh_player6name% �� -1 �_���ǉ�����܂����B))
  if %hh_halresult% == false ( if %hh_round% == 7 ( echo %hh_player7name% �� -1 �_���ǉ�����܂����B))
  if %hh_halresult% == false ( if %hh_round% == 8 ( echo %hh_player8name% �� -1 �_���ǉ�����܂����B))
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
  if %hh_round% == 1 ( if %hh_player1point% LEQ 9 ( echo �K�v�_��������܂���B)) 
  if %hh_round% == 2 ( if %hh_player2point% LEQ 9 ( echo �K�v�_��������܂���B)) 
  if %hh_round% == 3 ( if %hh_player3point% LEQ 9 ( echo �K�v�_��������܂���B)) 
  if %hh_round% == 4 ( if %hh_player4point% LEQ 9 ( echo �K�v�_��������܂���B)) 
  if %hh_round% == 5 ( if %hh_player5point% LEQ 9 ( echo �K�v�_��������܂���B)) 
  if %hh_round% == 6 ( if %hh_player6point% LEQ 9 ( echo �K�v�_��������܂���B)) 
  if %hh_round% == 7 ( if %hh_player7point% LEQ 9 ( echo �K�v�_��������܂���B)) 
  if %hh_round% == 8 ( if %hh_player8point% LEQ 9 ( echo �K�v�_��������܂���B)) 
  if %hh_round% == 1 ( if %hh_player1point% LEQ 9 ( goto selectaction )) 
  if %hh_round% == 2 ( if %hh_player2point% LEQ 9 ( goto selectaction )) 
  if %hh_round% == 3 ( if %hh_player3point% LEQ 9 ( goto selectaction )) 
  if %hh_round% == 4 ( if %hh_player4point% LEQ 9 ( goto selectaction )) 
  if %hh_round% == 5 ( if %hh_player5point% LEQ 9 ( goto selectaction )) 
  if %hh_round% == 6 ( if %hh_player6point% LEQ 9 ( goto selectaction )) 
  if %hh_round% == 7 ( if %hh_player7point% LEQ 9 ( goto selectaction )) 
  if %hh_round% == 8 ( if %hh_player8point% LEQ 9 ( goto selectaction )) 
  echo �C�ӂ̐����ƑI�����ꂽ�����Ń`�F�b�N���s���܂��B
  echo;
  if %hh_easymode% == false set /p hh_temp=0~3,276,732,767�̐�������͂��Ă�������(�J���}�Ȃ�): 
  if %hh_easymode% == true set /p hh_temp=0~32,767�̐�������͂��Ă�������(�J���}�Ȃ�): 
  set /p hh_confirm=%hh_temp%�ōs���܂���?(y/n): 
  if %hh_temp% == %hh_number% ( set hh_habresult=true ) ELSE ( set hh_habresult=false ) 
  if %hh_habresult% == true echo %hh_temp% �̌��ʂ� %hh_habresult% , �������܂����B
  if %hh_habresult% == true echo �I�����ꂽ������ %hh_number% �ł����B
  if %hh_habresult% == true set hh_star=true
  if %hh_habresult% == false echo %hh_temp% �̌��ʂ� %hh_habresult% , ���s���܂����B
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
  echo �N���������l�����܂���! 
  echo ��ɓ_���̐��Z���s���܂��B
  echo ----------���Z�O�̓_��---------- 
  echo %hh_player1name% : �_�� %hh_player1point% ^| �A�[�J�C�u %hh_player1archive% ^| �� %hh_player1star%
  echo %hh_player2name% : �_�� %hh_player2point% ^| �A�[�J�C�u %hh_player2archive% ^| �� %hh_player2star%
  if %hh_player% GEQ 3 echo %hh_player3name% : �_�� %hh_player3point% ^| �A�[�J�C�u %hh_player3archive% ^| �� %hh_player3star%
  if %hh_player% GEQ 4 echo %hh_player4name% : �_�� %hh_player4point% ^| �A�[�J�C�u %hh_player4archive% ^| �� %hh_player4star%
  if %hh_player% GEQ 5 echo %hh_player5name% : �_�� %hh_player5point% ^| �A�[�J�C�u %hh_player5archive% ^| �� %hh_player5star%
  if %hh_player% GEQ 6 echo %hh_player6name% : �_�� %hh_player6point% ^| �A�[�J�C�u %hh_player6archive% ^| �� %hh_player6star%
  if %hh_player% GEQ 7 echo %hh_player7name% : �_�� %hh_player7point% ^| �A�[�J�C�u %hh_player7archive% ^| �� %hh_player7star%
  if %hh_player% GEQ 8 echo %hh_player8name% : �_�� %hh_player8point% ^| �A�[�J�C�u %hh_player8archive% ^| �� %hh_player8star%

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
  echo ----------���Z��̓_��---------- 
  echo %hh_player1name% : �_�� %hh_player1point% ^| �A�[�J�C�u %hh_player1archive% ^| �� %hh_player1star% ^| %hh_player1stardisplay% 
  echo %hh_player2name% : �_�� %hh_player2point% ^| �A�[�J�C�u %hh_player2archive% ^| �� %hh_player2star% ^| %hh_player2stardisplay% 
  if %hh_player% GEQ 3 echo %hh_player3name% : �_�� %hh_player3point% ^| �A�[�J�C�u %hh_player3archive% ^| �� %hh_player3star% ^| %hh_player3stardisplay% 
  if %hh_player% GEQ 4 echo %hh_player4name% : �_�� %hh_player4point% ^| �A�[�J�C�u %hh_player4archive% ^| �� %hh_player4star% ^| %hh_player4stardisplay% 
  if %hh_player% GEQ 5 echo %hh_player5name% : �_�� %hh_player5point% ^| �A�[�J�C�u %hh_player5archive% ^| �� %hh_player5star% ^| %hh_player5stardisplay% 
  if %hh_player% GEQ 6 echo %hh_player6name% : �_�� %hh_player6point% ^| �A�[�J�C�u %hh_player6archive% ^| �� %hh_player6star% ^| %hh_player6stardisplay% 
  if %hh_player% GEQ 7 echo %hh_player7name% : �_�� %hh_player7point% ^| �A�[�J�C�u %hh_player7archive% ^| �� %hh_player7star% ^| %hh_player7stardisplay% 
  if %hh_player% GEQ 8 echo %hh_player8name% : �_�� %hh_player8point% ^| �A�[�J�C�u %hh_player8archive% ^| �� %hh_player8star% ^| %hh_player8stardisplay% 
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
   echo %hh_player1name% �������l�����܂���!
   set /a hh_player1star=%hh_player1star% + 1
   if %hh_player1star% == 1 set hh_player1stardisplay=��
   if %hh_player1star% == 2 set hh_player1stardisplay=����
   if %hh_player1star% == 3 set hh_player1stardisplay=������
   if %hh_player1star% == 4 set hh_player1stardisplay=��������
   if %hh_player1star% == 5 set hh_player1stardisplay=����������
   echo %hh_player1name% �̍��v������ %hh_player1star% �ł�!
   set hh_FinalGetStar=player1
   if %hh_player1star% GEQ %hh_needstar% goto endallgame
   goto endgame
  :star2
   echo %hh_player2name% �������l�����܂���!
   set /a hh_player2star=%hh_player2star% + 1
   if %hh_player2star% == 1 set hh_player2stardisplay=��
   if %hh_player2star% == 2 set hh_player2stardisplay=����
   if %hh_player2star% == 3 set hh_player2stardisplay=������
   if %hh_player2star% == 4 set hh_player2stardisplay=��������
   if %hh_player2star% == 5 set hh_player2stardisplay=����������
   echo %hh_player2name% �̍��v������ %hh_player2star% �ł�!
   set hh_FinalGetStar=player2
   if %hh_player2star% GEQ %hh_needstar% goto endallgame
   goto endgame
  :star%hh_needstar%
   echo %hh_player3name% �������l�����܂���!
   set /a hh_player3star=%hh_player3star% + 1
   if %hh_player3star% == 1 set hh_player3stardisplay=��
   if %hh_player3star% == 2 set hh_player3stardisplay=����
   if %hh_player3star% == 3 set hh_player3stardisplay=������
   if %hh_player3star% == 4 set hh_player3stardisplay=��������
   if %hh_player3star% == 5 set hh_player3stardisplay=����������
   echo %hh_player3name% �̍��v������ %hh_player3star% �ł�!
   set hh_FinalGetStar=player3
   if %hh_player3star% GEQ %hh_needstar% goto endallgame
   goto endgame
  :star4
   echo %hh_player4name% �������l�����܂���!
   set /a hh_player4star=%hh_player4star% + 1
   if %hh_player4star% == 1 set hh_player4stardisplay=��
   if %hh_player4star% == 2 set hh_player4stardisplay=����
   if %hh_player4star% == 3 set hh_player4stardisplay=������
   if %hh_player4star% == 4 set hh_player4stardisplay=��������
   if %hh_player4star% == 5 set hh_player4stardisplay=����������
   echo %hh_player4name% �̍��v������ %hh_player4star% �ł�!
   set hh_FinalGetStar=player4
   if %hh_player4star% GEQ %hh_needstar% goto endallgame
   goto endgame
  :star5
   echo %hh_player5name% �������l�����܂���!
   set /a hh_player5star=%hh_player5star% + 1
   if %hh_player5star% == 1 set hh_player5stardisplay=��
   if %hh_player5star% == 2 set hh_player5stardisplay=����
   if %hh_player5star% == 3 set hh_player5stardisplay=������
   if %hh_player5star% == 4 set hh_player5stardisplay=��������
   if %hh_player5star% == 5 set hh_player5stardisplay=����������
   echo %hh_player5name% �̍��v������ %hh_player5star% �ł�!
   set hh_FinalGetStar=player5
   if %hh_player5star% GEQ %hh_needstar% goto endallgame
   goto endgame
  :star6
   echo %hh_player6name% �������l�����܂���!
   set /a hh_player6star=%hh_player6star% + 1
   if %hh_player6star% == 1 set hh_player6stardisplay=��
   if %hh_player6star% == 2 set hh_player6stardisplay=����
   if %hh_player6star% == 3 set hh_player6stardisplay=������
   if %hh_player6star% == 4 set hh_player6stardisplay=��������
   if %hh_player6star% == 5 set hh_player6stardisplay=����������
   echo %hh_player6name% �̍��v������ %hh_player6star% �ł�!
   set hh_FinalGetStar=player6
   if %hh_player6star% GEQ %hh_needstar% goto endallgame
   goto endgame
  :star7
   echo %hh_player7name% �������l�����܂���!
   set /a hh_player7star=%hh_player7star% + 1
   if %hh_player7star% == 1 set hh_player7stardisplay=��
   if %hh_player7star% == 2 set hh_player7stardisplay=����
   if %hh_player7star% == 3 set hh_player7stardisplay=������
   if %hh_player7star% == 4 set hh_player7stardisplay=��������
   if %hh_player7star% == 5 set hh_player7stardisplay=����������
   echo %hh_player7name% �̍��v������ %hh_player7star% �ł�!
   set hh_FinalGetStar=player7
   if %hh_player7star% GEQ %hh_needstar% goto endallgame
   goto endgame
  :star8
   echo %hh_player8name% �������l�����܂���!
   set /a hh_player8star=%hh_player8star% + 1
   if %hh_player8star% == 1 set hh_player8stardisplay=��
   if %hh_player8star% == 2 set hh_player8stardisplay=����
   if %hh_player8star% == 3 set hh_player8stardisplay=������
   if %hh_player8star% == 4 set hh_player8stardisplay=��������
   if %hh_player8star% == 5 set hh_player8stardisplay=����������
   echo %hh_player8name% �̍��v������ %hh_player8star% �ł�!
   set hh_FinalGetStar=player8
   if %hh_player8star% GEQ %hh_needstar% goto endallgame
   goto endgame

:endgame
  echo ----------�����Z��̓_��---------- 
  echo %hh_player1name% : �_�� %hh_player1point% ^| �A�[�J�C�u %hh_player1archive% ^| �� %hh_player1star% ^| %hh_player1stardisplay% 
  echo %hh_player2name% : �_�� %hh_player2point% ^| �A�[�J�C�u %hh_player2archive% ^| �� %hh_player2star% ^| %hh_player2stardisplay% 
  if %hh_player% GEQ 3 echo %hh_player3name% : �_�� %hh_player3point% ^| �A�[�J�C�u %hh_player3archive% ^| �� %hh_player3star% ^| %hh_player3stardisplay% 
  if %hh_player% GEQ 4 echo %hh_player4name% : �_�� %hh_player4point% ^| �A�[�J�C�u %hh_player4archive% ^| �� %hh_player4star% ^| %hh_player4stardisplay% 
  if %hh_player% GEQ 5 echo %hh_player5name% : �_�� %hh_player5point% ^| �A�[�J�C�u %hh_player5archive% ^| �� %hh_player5star% ^| %hh_player5stardisplay% 
  if %hh_player% GEQ 6 echo %hh_player6name% : �_�� %hh_player6point% ^| �A�[�J�C�u %hh_player6archive% ^| �� %hh_player6star% ^| %hh_player6stardisplay% 
  if %hh_player% GEQ 7 echo %hh_player7name% : �_�� %hh_player7point% ^| �A�[�J�C�u %hh_player7archive% ^| �� %hh_player7star% ^| %hh_player7stardisplay% 
  if %hh_player% GEQ 8 echo %hh_player8name% : �_�� %hh_player8point% ^| �A�[�J�C�u %hh_player8archive% ^| �� %hh_player8star% ^| %hh_player8stardisplay% 
  echo -------------------------------- 
  goto startplayer
 
:endallgame
 echo;
 echo �K�v����: %hh_needstar% �ɓ��B�����v���C���[�������������߁A�S�Q�[�����I�����܂��B
 echo;
rem  echo ���ʂ��v�Z���Ă��܂�...
rem  set hh_1st=%hh_player1name%,%hh_player1star%
rem  set hh_1ststar=%hh_1st:~-1,1%
rem  if %hh_1ststar% == 
rem 
rem  echo ���ʂ����肳��܂���!
 echo ----------�ŏI����---------- 
 echo %hh_player1name% : �_�� %hh_player1point% ^| �A�[�J�C�u %hh_player1archive% ^| �� %hh_player1star% ^| %hh_player1stardisplay% 
 echo %hh_player2name% : �_�� %hh_player2point% ^| �A�[�J�C�u %hh_player2archive% ^| �� %hh_player2star% ^| %hh_player2stardisplay% 
 if %hh_player% GEQ 3 echo %hh_player3name% : �_�� %hh_player3point% ^| �A�[�J�C�u %hh_player3archive% ^| �� %hh_player3star% ^| %hh_player3stardisplay% 
 if %hh_player% GEQ 4 echo %hh_player4name% : �_�� %hh_player4point% ^| �A�[�J�C�u %hh_player4archive% ^| �� %hh_player4star% ^| %hh_player4stardisplay% 
 if %hh_player% GEQ 5 echo %hh_player5name% : �_�� %hh_player5point% ^| �A�[�J�C�u %hh_player5archive% ^| �� %hh_player5star% ^| %hh_player5stardisplay% 
 if %hh_player% GEQ 6 echo %hh_player6name% : �_�� %hh_player6point% ^| �A�[�J�C�u %hh_player6archive% ^| �� %hh_player6star% ^| %hh_player6stardisplay% 
 if %hh_player% GEQ 7 echo %hh_player7name% : �_�� %hh_player7point% ^| �A�[�J�C�u %hh_player7archive% ^| �� %hh_player7star% ^| %hh_player7stardisplay% 
 if %hh_player% GEQ 8 echo %hh_player8name% : �_�� %hh_player8point% ^| �A�[�J�C�u %hh_player8archive% ^| �� %hh_player8star% ^| %hh_player8stardisplay% 
 echo ----------------------------
 echo;
 echo ���s����ƃ^�C�g���ɖ߂�܂��B
 pause
 goto welcome

:first-setting
 md data
 md lib
 md save
 md temp
 echo ----�s��:1 (���[�U����: 1 )---- >>koudou1.txt
 echo �v���C���[�͔C�ӂ̐����ƑI�����ꂽ�����Ńn�C�A���h���[���s���B >>koudou1.txt
 echo  �����̏ꍇ��1�_,���s�̏ꍇ��-1�_���l������B   >>koudou1.txt
 echo  ���̍s���ŔC�ӂ̐����ƑI�����ꂽ����������̏ꍇ�A���s�Ƃ���B   >>koudou1.txt
 echo  �C�ӂ̐����Ɣ��茋�ʂ͌��J�����B   >>koudou1.txt
 echo ----�s��:2 (���[�U����: 2 )---- >>koudou2.txt
 echo 0~3,276,732,767�̃����_���Ȑ������I�΂�A�n�C�A���h���[���s���B(�C�[�W�[���[�h�̏ꍇ��0~32767) >>koudou2.txt
 echo  �����̏ꍇ��2�_,���s�̏ꍇ��-1�_���l������B    >>koudou2.txt
 echo  ���̍s���őI�΂ꂽ�����ƑI�����ꂽ����������̏ꍇ�A�����Ƃ���B   >>koudou2.txt
 echo  �I�΂ꂽ�����Ɣ��茋�ʂ͌��J�����B >>koudou2.txt
 echo ----�s��:3 (���[�U����: 3 )---- >>koudou3.txt
 echo �v���C���[�͔C�ӂ̐����ƑI�����ꂽ�����Ń`�F�b�N���s���B >>koudou3.txt
 echo  �����̏ꍇ�͐���1�t�^����,���s�̏ꍇ��-5�_���l������B   >>koudou3.txt
 echo  ���̍s����10�_�ȏ㏊�����Ă��Ȃ��ƑI���ł��Ȃ��B   >>koudou3.txt
 echo  �C�ӂ̐����Ɣ��茋�ʂ͌��J�����B   >>koudou3.txt
 echo ----�s��:4 (���[�U����: 4 )---- >>koudou4.txt
 echo 0~3,276,732,767�̃����_���Ȑ������I�΂�A�`�F�b�N���s���B(�C�[�W�[���[�h�̏ꍇ��0~32767) >>koudou4.txt
 echo  �����̏ꍇ�͐���3�t�^����,���s�̏ꍇ��0�_���l������B   >>koudou4.txt
 echo  ���̍s����-20�_�ȉ��ł̂ݑI���ł���B   >>koudou4.txt
 echo  �I�΂ꂽ�����Ɣ��茋�ʂ͌��J�����B >>koudou4.txt
 echo ----�s��:5 (���[�U����: 5 )---- >>koudou5.txt
 echo �v���C���͔C�ӂ̐����ƑI�����ꂽ�����Ńn�C�A���h���[���s���B >>koudou5.txt
 echo  ���̍s���͔��茋�ʂɂ�����炸�A3�_�������B   >>koudou5.txt
 echo  ���̍s���ŔC�ӂ̐����ƑI�����ꂽ����������̏ꍇ�A���s�Ƃ���B   >>koudou5.txt
 echo  �C�ӂ̐����Ɣ��茋�ʂ͌��J����Ȃ��B >>koudou5.txt
 echo ----�s��:6 (���[�U����: 6 )---- >>koudou6.txt
 echo 0~3276732767�̃����_���Ȑ������I�΂�A�n�C�A���h���[���s���B >>koudou6.txt
 echo  ���̍s���͔��茋�ʂɂ�����炸�A2�_�������B   >>koudou6.txt
 echo  ���̍s���őI�΂ꂽ�����ƑI�����ꂽ����������̏ꍇ�A���s�Ƃ���B   >>koudou6.txt
 echo  �I�΂ꂽ�����Ɣ��茋�ʂ͌��J����Ȃ��B   >>koudou6.txt
 echo ----�s��:7 (���[�U����: 7 )---- >>koudou7.txt
 echo ������I�����A�C�ӂ̐����ƑI�΂ꂽ�����̑I�����������Ń`�F�b�N���s���B >>koudou7.txt
 echo  �����̏ꍇ�͐����҂�10�_,���v���C���[�ɂ�3�_�t�^����,���s�̏ꍇ��-3�_���l������B >>koudou7.txt
 echo  �����̏ꍇ�A�������ɓ_�����}�C�i�X�̃v���C���[��5�_�ɐݒ肳���B >>koudou7.txt
 echo  ���̍s����1�_�ȏ㏊�����Ă��Ȃ��ƑI���ł��Ȃ��B   >>koudou7.txt
 echo  ���̍s���͑S�v���C���[��1���ɂ�2��܂ł����g�����Ƃ��ł��Ȃ��B >>koudou7.txt
 echo  �����A���݂��Ȃ�������I�������ꍇ�A��ԏ�̌��Ń`�F�b�N���s����B >>koudou7.txt
 echo ----�s��:8 (���[�U����: 8 )---- >>koudou8.txt
 echo �C�ӂ̐������I�΂ꂽ�����ɑ��݂��邩�`�F�b�N���s���B >>koudou8.txt
 echo  ���̍s���͔��茋�ʂɂ�����炸�A5�_�������B   >>koudou8.txt
 echo  ���̍s����5�_�ȏ㏊�����Ă��Ȃ��ƑI���ł��Ȃ��B >>koudou8.txt
 echo set hh_temp=5,set hh_limit=-30,set hh_needstar=3,rem hh_endturn=-1,set hh_taxprice=1,set hh_nontaxlimit=10,set hh_easymode=true >%cd%\data\setting.tscf
 call core.bat