a = [1,7,3,4,2,2,6,5,7,8,0,1,8]
b = [2,6,5,7,8,1,7,3,4,2,0,1,8,4,9,9,2,6,3]
c = [1,8,4,9,5,7,8,4,2,0]

def bucket_sort(arr)
  # ここに処理を書く

  max_number = 0  #arrから最大値を探し、max_numberに代入
  arr.each do |i|
   if max_number < i
     max_number = i
   end
  end

  #0 - max_numberまでの連番の配列を作成し、配列の添え字をキーとするハッシュを作成
  bucket = (0..max_number).to_a.map{|i| [i, Array.new]}.to_h

  #引数の配列の要素を取り出し、引数の要素とbucketのキーが一致する要素をbucketのバリューに代入。
  arr.each do |i|
    bucket[i] << i
  end

  #新しい配列を作成し、bucketのvalueを順次、入れていく
  new_bucket = []
  bucket.each do |key, value|
      new_bucket << value
  end

  #配列の入れ子になっている要素を平滑化する
  new_bucket.flatten

end

p bucket_sort(a)
p bucket_sort(b)
p bucket_sort(c)

# 下記の出力値が出力されればOK
# => [0, 1, 1, 2, 2, 3, 4, 5, 6, 7, 7, 8, 8]
# => [0, 1, 1, 2, 2, 2, 3, 3, 4, 4, 5, 6, 6, 7, 7, 8, 8, 9, 9]
# => [0, 1, 2, 4, 4, 5, 7, 8, 8, 9]
