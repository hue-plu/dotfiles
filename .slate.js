var launch_and_focus = function (target) {
    return function (win) {
        var apps = [];
        S.eachApp(function (app) { apps.push(app.name()); });
        if (! _.find(apps, function (name) { return name === target; })) {
            win.doOperation(
                S.operation('shell', {
                    command: "/usr/bin/open -a " + target,
                    waithFoeExit: true
                })
            );
        }
        win.doOperation(S.operation('focus', { app: target }));
    };
};
S.bind('1:ctrl', launch_and_focus('Firefox'));
S.bind('2:ctrl', launch_and_focus('Slack'));
S.bind('3:ctrl', launch_and_focus('Wunderlist'));
S.bind('4:ctrl', launch_and_focus('iTerm'));
