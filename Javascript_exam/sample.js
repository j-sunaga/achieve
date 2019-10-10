$(document).ready(function(){//DOMがロードされて操作・解析が可能になったタイミングで関数を実行
  function score_indicate(){
    // このような記述をすることで、subject_pointsという変数の中に
    // [国語の点数,英語の点数,数学の点数,理科の点数,社会の点数]という配列を作成できる。
    let subject_points = [Number($('#national_language').val()),//国語の点数を格納する配列要素
                          Number($('#english').val()),
                          Number($('#mathematics').val()),
                          Number($('#science').val()),
                          Number($('#society').val())
                          //Numberで文字列から数値への型変換を行う
                          ];
    // さらにこのような記述をすることで、「合計点：」となっている右の部分に合計点が出力される
    // let sum = subject_points[0];
    // sum = sum + subject_points[1];
    // sum = sum + subject_points[2];
    // sum = sum + subject_points[3];
    // sum = sum + subject_points[4];

    let sum = subject_points.reduce(function(a, b) {
    return a + b;
    });

    $("#sum_indicate").text(sum);//要素に合計値のテキストを設定する

    // ここに、上記を参考にして平均点を出力する処理を書き込む
    let average = sum/(subject_points.length);
    $('#average_indicate').text(average);
  };


  function get_achievement(){
    // ここに、ランクの値の文字列（平均点が80点以上なら"A"、60点以上なら"B"、40点以上なら"C"、それ以下なら"D"）を出力する処理を書き込む
   let rank_score = document.getElementById('average_indicate').innerHTML;
       rank_score = Number(rank_score);

    //成績の判定する条件分岐
    if (rank_score >= 80) {
      $('#evaluation').text("A");
    }else if (rank_score >= 60) {
      $('#evaluation').text("B");
    }else if (rank_score >= 40) {
      $('#evaluation').text("C");
    }else {
      $('#evaluation').text("D");
    }
  }

  function get_pass_or_failure(){
    // ここに、全ての教科が60点以上なら"合格"の文字列、一つでも60点未満の教科があったら"不合格"の文字列を出す処理を書き込む
    let result = "合格";

    let pass_scores = [Number($('#national_language').val()),//国語の点数を格納する配列要素
                          Number($('#english').val()),
                          Number($('#mathematics').val()),
                          Number($('#science').val()),
                          Number($('#society').val())
                        ];

      for (var i = 0; i < pass_scores.length; i++) {
        if(pass_scores[i]<60){
          result = "不合格";
          break;
        }
      }

      $('#judge').text(result);
  }

  function judgement(){
    // ここに、「最終ジャッジ」のボタンを押したら「あなたの成績はAです。合格です」といった内容を出力する処理を書き込む
    $("#alert-indicate").remove();
    get_achievement();
    get_pass_or_failure();
    let rank = document.getElementById('evaluation').innerHTML;
    let result = document.getElementById('judge').innerHTML;

    // 下記の記述をすることで、「最終ジャッジ」のボタンを押すと「あなたの成績は（ここに「ランク」の値を入れる）です。（ここに「判定」の値を入れる）です」という文字の入った水色のフキダシが出力される処理が実装される。
    $('#declaration').append(`<label id="alert-indicate" class="alert alert-info">あなたの成績は${rank}です。${result}です</label>`);
    //受験者の成績値のテキストを追加するメソッド

  };

  $('#national_language, #english, #mathematics, #science, #society').change(function() {
    //点数が変更されたときに実行する関数
    score_indicate();
  });

  $('#btn-evaluation').click(function() {//ランクボタンのクリックイベント
    get_achievement();
  });

  $('#btn-judge').click(function() {//判定ボタンのクリックイベント
    get_pass_or_failure();
  });

  $('#btn-declaration').click(function() {//最終ジャッジボタンのクリックイベント
    judgement();
  });
});
// ここに書かれているjsの記述はあくまでヒントとして用意された雛形なので、書かれている記述に従わずに実装したいという場合は、自分の好きに実装して構わない。課題要件を満たし、コードの品質が一定の水準にあると判定されればどのような実装でも合格になる。
// 例ではJavaScriptとJqueryの両方の記述を使用しているが、どちらかに統一しても構わない
