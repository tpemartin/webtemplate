if ($('#scale-demo').length && $('#scale-demo-trigger').length) {
  $('#scale-demo-trigger').click(function() {
    $('#scale-demo').toggleClass('scale-out');
  });
}


// Fab
$('.fixed-action-btn').floatingActionButton();
$('.fixed-action-btn.horizontal').floatingActionButton({
  direction: 'left'
});
$('.fixed-action-btn.click-to-toggle').floatingActionButton({
  direction: 'left',
  hoverEnabled: false
});
$('.fixed-action-btn.toolbar').floatingActionButton({
  toolbarEnabled: true
});

// control tab
var controlTabEl=document.getElementById('myTab');
var instance = M.Tabs.init(controlTabEl);