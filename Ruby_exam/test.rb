input = "3.5"
input_string = input.to_s
  if (/[0-9]/ =~ input_string)
    if(input_string.to_i.between?(0,2))
    print "0-2整数です。"
    else
    puts "範囲外です"
    end
  else
    print "整数ではありません。"
  end
