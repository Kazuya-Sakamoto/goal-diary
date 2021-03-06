$(function(){
      function buildHTML(url,likes){
        var html = `<form class="form" action=${url}
                    accept-charset="UTF-8" data-remote="true" method="post">
                    <input name="utf8" type="hidden" value="✓">
                    <input type="hidden" name="authenticity_token" value="AwIWg/8nFaNnCX5nxHfuR99PMKdktILGQzE9Ipz1QDS5tAEFbzmdDWB58YpB4gPvjtKnJrnEj11PaOGcktptXw==">
                    <input type="submit" name="commit" value="♡" style="color:red;" class="iine" data-disable-with="♡">
                    ${likes.count}
                    </form>`
                    // debugger;
        return html;
      }
      $('.form').on('submit', function(e){
        e.preventDefault();
        var url = $(this).attr('action')
        var formData = new FormData($(this).get(0));
        $.ajax({
          url: url,
          type: "POST",
          data: formData,
          processData: false,
          contentType:false,
          dataType: 'json',
        })
        .done(function(likes){
          var html = buildHTML(url, likes);
          $('.form').empty();
          $('.form').append(html);
          // console.log('doneにいってるよ')
        })
        .done(function(data){
          // 通信に成功した場合の処理です
          $('.iine').empty(); //前回の検索結果が残っている場合はそれを消します
          data.forEach(function(html){
            $('.iine').append(html);
          }) //データは配列形式でかえってくるので、forEachで繰り返し処理をします
        })
        .fail(function(){
          console.log('失敗');
        })
      });
    });