###  IMPORTS  ###


from typing import List

from libqtile import qtile, bar, layout, widget, hook
from libqtile.config import Click, Drag, Group, Key, Match, Screen
from libqtile.lazy import lazy

import os
import subprocess


###  DEFAULTS  ###


mod = "mod4"

terminal        = "alacritty"
browser         = "brave"
file_browser    = "pcmanfm"
editor          = terminal + " -e nvim"


#-------------------------------------------------------------------------------#


###  KEYBINDINGS  ###


keys = [

    ## APPLICATIONS ##

    Key([mod], "p",
        lazy.spawn("dmenu_run -p 'Run: '"),
        desc='Launches Dmenu'
        ),
    Key([mod], "Return",
        lazy.spawn(terminal),
        desc='Launches the Terminal'
        ),
    Key([mod, "shift"], "Return",
        lazy.spawn(file_browser),
        desc='Launches the File Browser'
        ),
    Key([mod], "b",
        lazy.spawn(browser),
        desc='Launches the Browser'
        ),
    Key([mod], "e",
        lazy.spawn(editor),
        desc='Launches the Editor'
        ),
    Key([mod], "d",
        lazy.spawn("discord"),
        desc='Launches Discord'
        ),

    ## WINDOW FOCUS MOVEMENT ##

    Key([mod], "h",
        lazy.layout.left(),
        desc="Move focus to left"
        ),
    Key([mod], "l",
        lazy.layout.right(),
        desc="Move focus to right"
        ),
    Key([mod], "j",
        lazy.layout.down(),
        desc="Move focus down"
        ),
    Key([mod], "k",
        lazy.layout.up(),
        desc="Move focus up"
        ),
    Key([mod], "space",
        lazy.layout.next(),
        desc="Move window focus to other window"
        ),

    ## WINDOW MOVEMENT ##

    Key([mod, "shift"], "h",
        lazy.layout.shuffle_left(),
        desc="Move window to the left"
        ),
    Key([mod, "shift"], "l",
        lazy.layout.shuffle_right(),
        desc="Move window to the right"
        ),
    Key([mod, "shift"], "j",
        lazy.layout.shuffle_down(),
        desc="Move window down"
        ),
    Key([mod, "shift"], "k",
        lazy.layout.shuffle_up(),
        desc="Move window up"
        ),

    ## WINDOW MANIPULATION ##

    Key([mod, "control"], "h",
        lazy.layout.grow_left(),
        desc="Grow window to the left"
        ),
    Key([mod, "control"], "l",
        lazy.layout.grow_right(),
        desc="Grow window to the right"
        ),
    Key([mod, "control"], "j",
        lazy.layout.grow_down(),
        desc="Grow window down"
        ),
    Key([mod, "control"], "k",
        lazy.layout.grow_up(),
        desc="Grow window up"
        ),
    Key([mod], "n",
        lazy.layout.normalize(),
        desc="Reset all window sizes"
        ),

    ## LAYOUTS ##

    Key([mod, "control"], "Return",
        lazy.layout.toggle_split(),
        desc="Toggle between split and unsplit sides of stack"
        ),
    Key([mod], "Return",
        lazy.spawn(terminal),
        desc="Launch terminal"
        ),

    Key([mod], "Tab",
        lazy.next_layout(),
        desc="Toggle between layouts"
        ),
    Key([mod, "shift"], "c",
        lazy.window.kill(),
        desc="Kill focused window"
        ),

    ## IMPORTANT ##

    Key([mod], "q",
        lazy.restart(),
        desc="Restart Qtile"
        ),
    Key([mod, "shift"], "q",
        lazy.shutdown(),
        desc="Shutdown Qtile"
        ),
    Key([mod], "r",
        lazy.spawncmd(),
        desc="Spawn a command using a prompt widget"),
]


###  MOUSE BINDINGS  ###


mouse = [
    Drag([mod], "Button1", lazy.window.set_position_floating(),
         start=lazy.window.get_position()),
    Drag([mod], "Button3", lazy.window.set_size_floating(),
         start=lazy.window.get_size()),
    Click([mod], "Button2", lazy.window.bring_to_front())
]


#-------------------------------------------------------------------------------#


###  WORKSPACES  ###


groups = [Group(group) for group in ("WWW", "DEV", "DIS", "MUS", "RAN")]

for index, group in enumerate(groups):
    keys.extend([
        Key([mod], str(index + 1), lazy.group[group.name].toscreen(),
            desc="Switch to group {}".format(group.name)),

        Key([mod, "shift"], str(index + 1), lazy.window.togroup(group.name, switch_group=True),
            desc="Switch to & move focused window to group {}".format(group.name)),
    ])


###  LAYOUTS  ###

layout_defaults = {
    "border_focus": "#83a598",
    "border_normal": "#474646",
    "border_width": 4,
    "fullscreen_border_width": 0,
    "margin": 18,
}

layouts = [
    layout.MonadTall(**layout_defaults),
    layout.Max(),
    # Try more layouts by unleashing below layouts.
    # layout.Columns(border_focus_stack='#d75f5f'),
    # layout.Stack(num_stacks=2),
    # layout.Bsp(),
    # layout.Matrix(),
    # layout.MonadWide(),
    # layout.RatioTile(),
    # layout.Tile(),
    # layout.TreeTab(),
    # layout.VerticalTile(),
    # layout.Zoomy(),
]


###  BAR  ###


widget_defaults = dict(
    font='Ubuntu',
    fontsize=12,
    padding=4,
)

extension_defaults = widget_defaults.copy()

screens = [
    Screen(
        top=bar.Bar(
            [
                widget.Sep(
                       linewidth = 0,
                       padding = 6,
                       foreground = "#83a598",
                       background = "#282828"
                       ),
                widget.GroupBox(
                       font = "Ubuntu Bold",
                       fontsize = 9,
                       margin_y = 3,
                       margin_x = 0,
                       padding_y = 5,
                       padding_x = 3,
                       borderwidth = 3,
                       active = "#83a598",
                       inactive = "#c792ea",
                       rounded = False,
                       highlight_method = "line",
                       this_current_screen_border = "#98be65",
                       this_screen_border = "#c792ea",
                       other_current_screen_border = "#98be65",
                       other_screen_border = "#c792ea",
                       foreground = "#83a598",
                       background = "#282828"
                       ),
                widget.Prompt(
                       font = "Ubuntu Mono",
                       padding = 10,
                       foreground = "#d3869b",
                       background = "#282828"
                       ),
                widget.Sep(
                       linewidth = 0,
                       padding = 40,
                       foreground = "#83a598",
                       background = "#282828"
                       ),
                widget.WindowName(
                       foreground = "#282828",
                       background = "#282828",
                       padding = 0,
                       max_chars = 40
                       ),
                widget.Systray(
                       background = "#282828",
                       padding = 5
                       ),
                widget.Sep(
                       linewidth = 0,
                       padding = 10,
                       foreground = "#83a598",
                       background = "#282828"
                       ),
                widget.TextBox(
                       text = '',
                       background = "#282828",
                       foreground = "#83a598",
                       padding = 0,
                       fontsize = 37
                       ),
                widget.CurrentLayoutIcon(
                       foreground = "#282828",
                       background = "#83a598"
                       ),
                widget.CurrentLayout(
                       foreground = "#282828",
                       background = "#83a598"
                       ),
                widget.TextBox(
                       text = '',
                       foreground = "#282828",
                       background = "#83a598",
                       padding = 0,
                       fontsize = 37
                       ),
                widget.CapsNumLockIndicator(
                       background = "#282828",
                       foreground = "#83a598",
                       ),
                widget.TextBox(
                       text = '',
                       background = "#282828",
                       foreground = "#83a598",
                       padding = 0,
                       fontsize = 37
                       ),
                widget.Memory(
                       foreground = "#282828",
                       background = "#83a598",
                       ),
                widget.TextBox(
                       text = '',
                       foreground = "#282828",
                       background = "#83a598",
                       padding = 0,
                       fontsize = 37
                       ),
                widget.CPU(
                       background = "#282828",
                       foreground = "#83a598",
                       ),
                widget.TextBox(
                       text = '',
                       background = "#282828",
                       foreground = "#83a598",
                       padding = 0,
                       fontsize = 37
                       ),
                widget.Battery(
                       foreground = "#282828",
                       background = "#83a598",
                       ),
                widget.TextBox(
                       text = '',
                       foreground = "#282828",
                       background = "#83a598",
                       padding = 0,
                       fontsize = 37
                       ),
                widget.Clock(
                       foreground = "#83a598",
                       background = "#282828",
                       format = "%A, %B %d - %H:%M "
                       ),
            ],
            20,
        ),
    ),
]

# Drag floating layouts.

dgroups_key_binder = None
dgroups_app_rules = []  # type: List
main = None  # WARNING: this is deprecated and will be removed soon
follow_mouse_focus = True
bring_front_click = False
cursor_warp = False
floating_layout = layout.Floating(float_rules=[
    # Run the utility of `xprop` to see the wm class and name of an X client.
    *layout.Floating.default_float_rules,
    Match(wm_class='confirmreset'),  # gitk
    Match(wm_class='makebranch'),  # gitk
    Match(wm_class='maketag'),  # gitk
    Match(wm_class='ssh-askpass'),  # ssh-askpass
    Match(title='branchdialog'),  # gitk
    Match(title='pinentry'),  # GPG key password entry
])
auto_fullscreen = True
focus_on_window_activation = "smart"

@hook.subscribe.startup_once
def autostart():
    home = os.path.expanduser('~/.config/qtile/autostart.sh')
    subprocess.call([home])

# XXX: Gasp! We're lying here. In fact, nobody really uses or cares about this
# string besides java UI toolkits; you can see several discussions on the
# mailing lists, GitHub issues, and other WM documentation that suggest setting
# this string if your java app doesn't work correctly. We may as well just lie
# and say that we're a working one by default.
#
# We choose LG3D to maximize irony: it is a 3D non-reparenting WM written in
# java that happens to be on java's whitelist.
wmname = "LG3D"
