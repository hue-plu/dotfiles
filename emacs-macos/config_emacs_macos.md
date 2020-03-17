from: https://korewanetadesu.com/emacs-on-os-x.html

Configuring Emacs on Mac OS X

I wanted a nice experience using Emacs for Mac OS X. By "nice" I
mean:

Emacs runs in server mode. It's started like other OS X software
  by Launch Services.
I can connect to it with graphical or terminal-based clients easily.
Graphical clients use Cocoa and not X11.
There's an icon on my dock to pop up a new graphical frame.
There's a shell command I can type to open a new graphical frame.
There's something I can type into Spotlight to open a new graphical frame.
If the server is dead for some reason, there's a way to start it in
  a small number of clicks.
If the server is dead for some reason, as many as the above features
  as possible still work.
It's easy, but not the default, to start standalone (non-client)
  Emacs instances as well.

You too can bring several hours and three separate scripting tools to
bear on this, or follow the simple (hah hah) instructions below.
First, install Emacs For Mac OS X. The Emacs that comes with OS X is
old and crusty, and the one at that site is new and Cocoa-ready and
Retina-enabled and so on. Put it in /Applications - if you put it
somewhere else, you'll need to correct all the other scripts I'm
mentioning in this post.
Emacs Server at Login
Open up the AppleScript Editor. If you're an Emacs user this probably
looks awful and confusing to you. Paste the following into it:

```code
tell application "Terminal"
   do shell script "/Applications/Emacs.app/Contents/MacOS/Emacs --daemon"
end tell
```

Press ⌘K to compile it, then ⌘S and save it in
/Applications/Development. (This subfolder keeps your Applications
menu clean, and has an important effect on sort order later.) To give
it a nice icon, select the original Emacs.app; press ⌘I; click the
icon in the top-left; press ⌘C; select on your new Emacs Server.app
bundle; press ⌘I; click the icon in the top-left; press ⌘V.
Open up System Preferences &gt; Users &amp; Groups &gt; Login Items and now
you can press the + button and choose Emacs Server.
The server is invisible until you first connect a client to it. Then
it will appear in the dock, as the regular Emacs.app.
New Frame Dock Icon
To make a dock icon that opens up a new Emacs frame - a client if the
server is available, a standalone instance otherwise - create the
following script in the AppleScript Editor and save it as an
Application named Emacs Client. in /Applications/Development.

```code
tell application "Terminal"
    try
        do shell script "/Applications/Emacs.app/Contents/MacOS/bin/emacsclient -c -n &amp;"
        tell application "Emacs" to activate
    on error
        do shell script "/Applications/Emacs.app/Contents/MacOS/Emacs"
    end try
end tell
```

Then drag this from the Applications folder to your dock. This will
also make it so typing emacs into Spotlight selects this as the
first item ("Development" sorts before "Emacs", "Client" sorts before
"Server").
If connected to the server, this opens up a new client frame each
click, by design. To just raise existing frames, click the other
Emacs icon on the dock, representing the running application.
Server-aware Shell Scripts
I put these in ~/local/bin. You'll need to add that to your $PATH
if you haven't already. First, two simple ones. These will start new
instances, not clients, but they're necessary to properly handle shell
arguments for fallbacks for clients. They're also nice to have if you
actually want to start a new instance.
Start a new Cocoa instance - emacsc:

```code
#!/bin/sh
set -e
/Applications/Emacs.app/Contents/MacOS/Emacs "$@"
```

Start a new terminal instance - emacst:

```code
#!/bin/sh
set -e
/Applications/Emacs.app/Contents/MacOS/Emacs -nw "$@"
```

Now for something ma little ore complicated - ec, start a Cocoa
client or fall back to a new instance (via the above emacsc) if the
server is unavailable.

```code
set -e
EMACSCLIENT=/Applications/Emacs.app/Contents/MacOS/bin/emacsclient
exec $EMACSCLIENT -c -a ~/local/bin/emacsc "$@"
```

Similarly, et, for a terminal client or new terminal instance.

```code
set -e
EMACSCLIENT=/Applications/Emacs.app/Contents/MacOS/bin/emacsclient
exec $EMACSCLIENT -t -a ~/local/bin/emacst "$@"
```

Why are ec and et scripts instead of aliases? Many tools will fail
if $EDITOR does not resolve to an actual executable somewhere in
$PATH because they invoke the tool directly instead of invoking a
shell to run it.
Finally: Some aliases for ~/.bash_profile, to override the ancient
version of Emacs that Mac OS X comes with by default.

```code
alias emacsclient="/Applications/Emacs.app/Contents/MacOS/bin/emacsclient"
alias emacs="ec"
export EDITOR="ec"
```

Activate Emacs on New Frames
If you start emacsc or ec from Terminal, Mac OS X doesn't realize
you probably want to switch focus to the Emacs session automatically.
There are also plenty of other ways you might start Emacs besides
typing a command into Terminal, and you probably want the new frames
focused then as well.
To do this, we can take advantage of the ns features in Emacs Lisp
and the frame-creation hooks. Add the following to your ~/.emacs or
some file it loads:

```code
(when (featurep 'ns)
  (defun ns-raise-emacs ()
    "Raise Emacs."
    (ns-do-applescript "tell application \"Emacs\" to activate"))

  (defun ns-raise-emacs-with-frame (frame)
    "Raise Emacs and select the provided frame."
    (with-selected-frame frame
      (when (display-graphic-p)
        (ns-raise-emacs))))

  (add-hook 'after-make-frame-functions 'ns-raise-emacs-with-frame)

  (when (display-graphic-p)
    (ns-raise-emacs)))
```

Now anything that opens or selects a frame will also activate Emacs
for Finder. The featurep check means this is harmless to load on
non-OS X platforms, and ns-raise-emacs is not (interactive) for
reasons that will be self-evident if you think about them.
Remaining Issues
Launch Services is happy to start the Emacs Server instance but loses
track of it afterwards. This is mostly harmless but annoying.
The second Emacs icon on the dock (the one for the main Emacs.app
rather than your custom Emacs Client.app) behaves oddly when no
frames are visible. Its menu bar and context menu don't work, and you
can't start a new frame from it directly. This is likely an issue
because both Emacs and Finder assume any graphical application has at
least one main window / frame, even if it might not be visible.
(Thanks to Dan Gerrity for pointing out a typo in the original posted
emacst script, and Sean B. Palmer for Emacs Lisp improvements that
led to much simpler shell scripts.)

- Joe Wreschnig

unless otherwise noted,

all source code - cc0

other content - cc-by-sa
