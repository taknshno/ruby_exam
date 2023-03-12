# プレイヤー(自分)に「0~2」を入力させるロジック
class Player
  def hand
    while true
      # プレイヤーにじゃんけんの手を選択させる文章を表示
      puts "数字を入力してください。"
      puts "0:グー, 1:チョキ, 2:パー"

      # 変数「input_hand」にプレイヤーの入力値を代入
      input_hand = gets.chomp

      # 入力文字が"0","1","2"なら整数化して返す
      if ["0","1","2"].include?(input_hand)
        return input_hand.to_i
      end
    end
  end
end

# 相手が「0~2」の値をランダムに生成するロジック
class Enemy
  def hand
    # グー、チョキ、パーの値をランダムに取得
    hand = rand(0..2)
  end
end

# プレイヤー(自分)が入力した「0~2」と、敵がランダムで生成した「0~2」をじゃんけんをさせて、その結果をコンソール上に出力するロジック
class Janken
  def pon(player_hand, enemy_hand)

    # 変数「janken」に["グー", "チョキ", "パー"]を代入
    janken = ["グー", "チョキ", "パー"]

    #「相手の手は#{相手の手}です。」と出力
    puts "相手の手は#{janken[enemy_hand]}です。"

    # Playerクラスの戻り値とEnemyクラスの戻り値からじゃんけんするロジック
    # Playerクラスの戻り値(player_hand)とEnemyクラスの戻り値(enemy_hand)の値が同じだった場合
    if player_hand == enemy_hand
      # 「あいこ」を出力
      puts "あいこ"
      true
    elsif (player_hand == 0 && enemy_hand == 1) || (player_hand == 1 && enemy_hand == 2) || (player_hand == 2 && enemy_hand == 0)
      #「あなたの勝ちです」を出力
      #「false」を返してじゃんけんを終了
      puts "あなたの勝ちです"
      false
    else
      #「あなたの負けです」を出力
      #「false」を返してじゃんけんを終了
      puts "あなたの負けです"
      false
    end
  end
end

# じゃんけんゲームを実行するロジック
class GameStart
  def self.jankenpon

    # 変数「player」にPlayerをインスタンス化したものを代入
    player = Player.new

    # 変数「enemy」にEnemyをインスタンス化したものを代入
    enemy = Enemy.new

    # 変数「janken」にJankenをインスタンス化したものを代入
    janken = Janken.new

    # 変数「next_game」に「true」を代入
    next_game = true

    # 「next_game」が「false」だと繰り返し処理を終了し、「true」だと繰り返し処理を継続
    while next_game
      # 変数「next_game」にじゃんけんを実行して返ってきた値(戻り値)を代入
      next_game = janken.pon(player.hand, enemy.hand)
    end
  end
end

# クラス名を使ってjankenponメソッドを呼び出し
GameStart.jankenpon