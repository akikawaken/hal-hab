# 1. ゲームの開始
     0~3,276,732,767の数字がランダムに選ばれる。  
      これを選択された数字と呼ぶ。  
     

# 2. 行動
     プレイヤは以下の行動から1回だけ行動することができる。  
     行動後はそれぞれを参照。  
## 2.1 プレイヤは任意の数字と選択された数字でハイアンドローを行う。
     成功の場合は1点,失敗の場合は-1点を獲得する。  
     この行動で任意の数字と選択された数字が同一の場合、失敗とする。  
     任意の数字と判定結果は公開される。  
     次のプレイヤのターンに変わり、2を繰り返す。  
## 2.2 0~3276732767のランダムな数字が選ばれ、ハイアンドローを行う。 
     成功の場合は2点,失敗の場合は-1点を獲得する。   
     この行動で選ばれた数字と選択された数字が同一の場合、成功とする。  
     選ばれた数字と判定結果は公開される。  
     次のプレイヤのターンに変わり、2を繰り返す。  
## 2.3 プレイヤは任意の数字と選択された数字でチェックを行う。
     成功の場合は星が1つ付与され,失敗の場合は-5点を獲得する。  
     この行動は10点以上所持していないと選択できない。  
     チェック成功後は4.0参照。任意の数字と判定結果は公開される。  
     失敗の場合は次のプレイヤのターンに変わり、2を繰り返す。  
## 2.4 0~3276732767のランダムな数字が選ばれ、チェックを行う。
     成功の場合は無条件で星が3つ付与され,失敗の場合は0点を獲得する。  
     この行動は-20点以下でのみ選択できる。  
     選ばれた数字と判定結果は公開される。  
     失敗の場合は次のプレイヤのターンに変わり、2を繰り返す。  
## 2.5 プレイヤは任意の数字と選択された数字でハイアンドローを行う。
     この行動は判定結果にかかわらず、3点を消費する。  
     この行動で任意の数字と選択された数字が同一の場合、失敗とする。  
     任意の数字と判定結果は公開されない。  
     次のプレイヤのターンに変わり、2を繰り返す。  
## 2.6 0~3276732767のランダムな数字が選ばれ、ハイアンドローを行う。 
     この行動は判定結果にかかわらず、2点を消費する。  
     この行動で選ばれた数字と選択された数字が同一の場合、失敗とする。  
     選ばれた数字と判定結果は公開されない。  
     次のプレイヤのターンに変わり、2を繰り返す。  
## 2.7 桁数を選択し、任意の数字と選ばれた数字の選択した桁数でチェックを行う。
     成功の場合は正答者に10点,他プレイヤーには3点付与され,失敗の場合は-3点を獲得する。
     成功の場合、成功時に点数がマイナスのプレイヤーは5点に設定される。
     この行動は1点以上所持していないと選択できない。  
     この行動は全プレイヤーで1桁につき2回までしか使うことができない。
     もし、存在しない桁数を選択した場合、一番上の桁でチェックが行われる。
## 2.8 任意の数字が選ばれた数字に存在するかチェックを行う。
     この行動は判定結果にかかわらず、5点を消費する。  
     この行動は5点以上所持していないと選択できない。

# 3. ゲーム終了と精算
     成功したプレイヤに星が1つ与えられる。  
     アーカイブが行われる。(4参照)  
     誰かが3つ、星を獲得した場合、全ゲームの終了とする。(5参照)
     
# 4. アーカイブ
     ゲーム終了時に点数が精算され、点数は各プレイヤーの口座にアーカイブされる。
     口座は全ゲームで共通とする。

# 5. 終了
## 5.1 順位の決定
     最終的に星が一番多い者の勝ちとなる。


---
備考

     プレイヤは1ターンごとに1点を支払う必要がある。ただし、10~-30点の場合は支払い不要。(これは税金)
     初期所持点数は5点とする。
     点数の最低は-30点とする。
     全員がマイナス点数でかつ、ターンが1周した場合、そのゲームは全員の負けとし、誰にも星は付与されない。 
     "星"が3つ付いたものが勝利とする。(1~5で変更可)
     アーカイブされた点数からの点数引き出しは不可能とする。
     イージーモードは0~32767とする。
     口座点数が50増えるごとに、星が付与される。(例えば: 50,100,150...)
