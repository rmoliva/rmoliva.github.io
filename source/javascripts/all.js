// This is where it all goes :)
//= require 'lib/jquery-3.1.0.min'
//= require 'lib/highlight.pack'
//= require 'semantic'

$(function () {
  hljs.configure({
    tabReplace: '   ',
  });

  $('pre code').each(function (i, block) {
    hljs.highlightBlock(block);
  });

  // fix menu when passed
  $('.masthead')
    .visibility({
      once: false,
      onBottomPassed: function() {
        $('.fixed.menu').transition('fade in');
      },
      onBottomPassedReverse: function() {
        $('.fixed.menu').transition('fade out');
      }
    })
  ;

  // create sidebar and attach to menu open
  $('.ui.sidebar')
    .sidebar('attach events', '.toc.item')
  ;

  $('.ui.dropdown')
    .dropdown()
  ;
});
