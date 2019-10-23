class Player
  def hand
    # コンソールを入力待ち状態にし、プレイヤーがコンソールから打ち込んだ値を出力する処理のメソッドの処理をこの中に作成する
      while true do
        puts "数字を入力してください"
        puts "0: グー"
        puts "1: チョキ"
        puts "2: パー"
        player_hand = gets.chomp#ユーザから入力を受け取る
        if (/[0-9]/ =~ player_hand)#数値か文字列かを判定
          if(player_hand.to_i.between?(0,2))#数値の範囲を判定
            player_hand = player_hand.to_i
            break
          else
            puts "0〜2の数字を入力してください。"
          end#0-2数値範囲判定
        else
           puts "0〜2の数字を入力してください。"
        end#
      end#数値・文字列判定
      return player_hand
     end
  end

class Enemy
  def hand
    enemy_hand = rand(0..2)
    # グー、チョキ、パーの値をランダムに出力するメソッドの処理をこの中に作成する
    return enemy_hand
  end
end

class Janken
  def pon(player_hand, enemy_hand)
    janken_hands = ["グー","チョキ","パー"]
    result= (player_hand - enemy_hand + 3) % 3 #（自分の手 - 相手の手 + 3）% 3
      case result #プレイヤーの出し手の判定
        when 2 #プレイヤーの勝利
          puts "相手の手は#{janken_hands[enemy_hand]}です。あなたの勝ちです。"
        when 1 #プレイヤーの負け
          puts "相手の手は#{janken_hands[enemy_hand]}です。あなたの負けです。"
        when 0 #引き分け
          puts "相手の手は#{janken_hands[enemy_hand]}です。引き分けです。"
          Janken.new.pon(Player.new.hand,Enemy.new.hand)
      end
      # プレイヤーが打ち込んだ値と、Enemyがランダムに出した値でじゃんけんをさせ、その結果をコンソール上に出力するメソッドをこの中に作成する
      # その際、あいこもしくはグー、チョキ、パー以外の値入力時には、もう一度ジャンケンをする
      # 相手がグー、チョキ、パーのうち、何を出したのかも表示させる
  end
end

player = Player.new #Playerクラスのインスタンスを生成し、変数playerに代入
#大文字Player : クラス（設計図）　小文字player : インスタンス変数（クラスから生成されたオブジェクト実体）
enemy = Enemy.new
janken = Janken.new

# 下記の記述で、ジャンケンメソッドが起動される
janken.pon(player.hand, enemy.hand)

# ここに書かれているRubyの記述はあくまでヒントとして用意された雛形なので、書かれている記述に従わずに実装したいという場合は、自分の好きに実装して構わない。課題要件を満たし、コードの品質が一定の水準にあると判定されればどのような実装でも合格になる。
