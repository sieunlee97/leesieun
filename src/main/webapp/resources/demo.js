/**
 * AdminLTE Demo Menu 를 수정한 내용
 * ------------------
 * 원본위치: src/main/webapp/resources/dist/js/demo.js
 */

/* 수업용 수정본(아래) */

$(document).ready(function ($) {
  var $sidebar = $('.control-sidebar')
  var $container = $('<div />', {
    class: 'p-3 control-sidebar-content text-center'
  })
  $sidebar.append($container)
  $container.append(
    '<h5>로그아웃</h5><hr class="mb-2"/>'
  )
  $container.append(
    '<button type="button" class="btn btn-lg btn-primary">로그아웃</button>'
  )
});