# 下記のコードが何をしているかを説明してください・・・（A）
seats_and_groups = gets.split(/\s/)
#座席数とグループ数の配列を作成
#最初の行（座席数と入店するグループの総数）の入力を受け付けます（８）

# 下記のコードが何をしているかを説明してください・・・（B）
empty_seat = [*1..(seats_and_groups[0].to_i)]
#座席番号 1から最大の座席数までの配列を作成
#座席を配列で作成します（１０）


# 下記のコードが何をしているかを説明してください・・・（C）
seats_count = empty_seat.count
#座席数を代入
#座席の数を変数に入れておきます（１３）

# 下記のコードが何をしているかを説明してください・・・（D）
number_of_visitors = seats_and_groups[1].to_i
# 数値化したグループ数をnumber_of_visitorsに代入
#何組のグループが入店するのか、その数を変数に入れておきます（１１）


# 下記のコードが何をしているかを説明してください・・・（E）
[*1..number_of_visitors].each do
#各訪問客グループごとに順次以下の処理をおこなう
#入店するグループの数だけループさせます（１５）


  # 下記のコードが何をしているかを説明してください・・・（F）
  used_seats = gets.split(/\s/)
  #グループの人数と着席開始座席番号の配列を作成し、代入
  #二行目以降の行（グループの人数と着席開始座席番号）の入力を受け付けます（４）

  # 下記のコードが何をしているかを説明してください・・・（G）
  users = used_seats[0].to_i
  # グループの人数を数値化し、usersに代入
  #来店したグループの人数を変数に代入します（６）

  # 下記のコードが何をしているかを説明してください・・・（H）
  seating_number = used_seats[1].to_i
  # 着席開始座席番号を数値化し、seating_numberに代入
  #来店したグループの着席開始座席番号を変数に代入します（１２）

  # 下記のコードが何をしているかを説明してください・・・（I）
  fill_last_number = ((seating_number + users) - 1)
  # グループの客が連続で座った座席の最後の座席番号をfill_lastに代入
  #来店したグループの最後の人間が着席した席の番号を変数に代入します（９）

  # 下記のコードが何をしているかを説明してください・・・（J）
  if fill_last_number > seats_count
    # グループの最後の客が座るであろう座席番号がお店の座席数を超えないか判定
    #来店したグループが席につけるかどうかを確認するための配列を、if文で条件分けしながら定義します。（７）

    # 下記のコードが何をしているかを説明してください・・・（K）
    # （下記のコードは理解が難しいので、下記にヒントを載せます）

    # 「今回のグループが最後に着席する席の番号」 = 「今回のグループが最後に着席する席の番号」-「そもそもの座席の総数」となる（円卓だから）。
    # 例えば、fill_last_number == 13で、seats_countが12だったら、1 = 13 - 12となり、席番号が１の席に最後の人間が座る。
    fill_last_number = fill_last_number - seats_count
    #もしも最後の人間が着席した席の番号が、最初に定義された座席の数を超えていたら、最初の席の数に戻して再計算します（円卓だから）（３）


    # （下記のコードは理解が難しいので、下記にヒントを載せます）

    # next_seat_candidateは、「その席に既に人が座っていないか？」を判断するための配列
    # ([*1..seats_count] - empty_seat)は、（「全ての席」-　「まだ人が座っていない席」）の意味。つまり、「既に人が座っている席」の数字が、([*1..seats_count] - empty_seat)
    # [*seating_number..seats_count]は、[*「今回のグループが最初に着席する席の番号」..「最後の席の番号」]の意味
    # [*1..fill_last_number]は、[*「１（最初の席）」..「今回のグループが最後に着席する席の番号」]の意味
    # なので、next_seat_candidate = ([*1..seats_count] - empty_seat) + [*seating_number..seats_count] + [*1..fill_last_number]は、
    # next_seat_candidate = 「既に人が座っている席」+ [*「今回のグループが最初に着席する席の番号」..「最後の席の番号」] + [*「１（最初の席）」..「今回のグループが最後に着席する席の番号」]となる。
    # つまり、 next_seat_candidateの配列の中に、同じ数字が含まれていれば、「既に埋まっている席に新たなグループの人間が座ろうとしている」ということになる
    next_seat_candidate = ([*1..seats_count] - empty_seat) + [*seating_number..seats_count] + [*1..fill_last_number]
  else
    # 下記のコードが何をしているかを説明してください・・・（L）
    # （下記のコードは理解が難しいので、下記にヒントを載せます）

    # next_seat_candidate = 「既に人が座っている席」+ [*「今回のグループが最初に着席する席の番号」..「今回のグループが最後に着席する席の番号」]となる
    # つまり、 next_seat_candidateの配列の中に、同じ数字が含まれていれば、「既に埋まっている席に新たなグループの人間が座ろうとしている」ということになる
    next_seat_candidate = ([*1..seats_count] - empty_seat) + [*seating_number..fill_last_number]
    #最後の人間が着席した席の番号が、最初に定義された座席の数を超えていなかったら、そのまま計算します（２）
    #
  end

  # 下記のコードが何をしているかを説明してください・・・（M）
  if next_seat_candidate.count == next_seat_candidate.uniq.count
    #来店したグループの座りたい席がすでに埋まっていないかをif文で確認します（埋まっていなければif内の処理をします）（５）

    # 下記のコードが何をしているかを説明してください・・・（N）
    if ((seating_number + users) - 1) > seats_count
      #最後の人間が着席した席の番号が、最初に定義された座席の数を超えていた場合と、そうでない場合とで座席の埋め方をif文で分岐させます（１４）

      # 下記の二行のコードが何をしているかを説明してください・・・（O）
      empty_seat = empty_seat - [*1..fill_last_number]
      empty_seat = empty_seat - [*seating_number..seats_count]
      #埋まっていない、かつ、末尾の番号が最初に定義された座席の数を超えていれば、最初の席の番号〜末尾の番号と、着席開始座席番号〜最後の席の番号、の二回に分けて席を埋めていきます（１７）

    else
      # 下記のコードが何をしているかを説明してください・・・（P）
      empty_seat = empty_seat - [*seating_number..fill_last_number]
      #埋まっていない、かつ、末尾の番号が席の数を超えていなければ、そのまま来店した人数分のシートを埋めていきます（１）
    end
  end
end

# 下記のコードが何をしているかを説明してください・・・（Q）
puts seats_count - empty_seat.count
# 最終的に席に座っている人数を出力します（１６）
