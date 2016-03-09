S.bind('1:ctrl', function (win) {
    win.doOperation(S.operation('focus', { app: 'Firefox' }));
});
S.bind('2:ctrl', function (win) {
    win.doOperation(S.operation('focus', { app: 'Slack' }));
});
S.bind('3:ctrl', function (win) {
    win.doOperation(S.operation('focus', { app: 'Wunderlist' }));
});
S.bind('4:ctrl', function (win) {
    win.doOperation(S.operation('focus', { app: 'iTerm' }));
});
