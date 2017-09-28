var launch_and_focus = function (target) {
    return function (win) {
        var apps = [];
        S.eachApp(function (app) { apps.push(app.name()); });
        if (! _.find(apps, function (name) { return name === target; })) {
            win.doOperation(
                S.operation('shell', {
                    command: "/usr/bin/open -a " + target,
                    waithForExit: true
                })
            );
        }
        win.doOperation(S.operation('focus', { app: target }));
    };
};
S.bind('u:cmd', launch_and_focus('Vivaldi'));
S.bind('i:cmd', launch_and_focus('Slack'));
// S.bind('o:cmd', launch_and_focus('FirefoxDeveloperEdition'));
S.bind('j:cmd', launch_and_focus('Alacritty'));
// S.bind('h:cmd', launch_and_focus('Emacs'));
// S.bind('g:cmd', launch_and_focus('Sublime Text'));
