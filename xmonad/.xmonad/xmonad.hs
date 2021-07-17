------------------------------------------------------------------------
---  IMPORTS
------------------------------------------------------------------------


-- Base
import XMonad
import System.Exit
import qualified Codec.Binary.UTF8.String              as UTF8
import qualified XMonad.StackSet as W

    -- Data
import Data.Monoid
import qualified Data.Map        as M

    -- Hooks
import XMonad.Hooks.EwmhDesktops
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.FadeInactive
import XMonad.Hooks.ManageHelpers

    -- Layout
import XMonad.Layout.Spacing
import XMonad.Layout.NoBorders
import XMonad.Layout.MultiToggle
import XMonad.Layout.MultiToggle.Instances
import qualified XMonad.Layout.MultiToggle as MT (Toggle(..))

    -- Utilities
import XMonad.Util.SpawnOnce
import XMonad.Util.Run


------------------------------------------------------------------------
---  DEFAULTS
------------------------------------------------------------------------


myModMask :: KeyMask
myModMask           = mod4Mask

myAltMask :: KeyMask
myAltMask           = mod1Mask

myTerminal :: String
myTerminal          = "kitty -e zsh"

myEditor :: String
myEditor            = "kitty -e nvim"

myBrowser :: String
myBrowser           = "brave"

myFileBrowser :: String
myFileBrowser       = "thunar"

myMenu :: String
myMenu              = "rofi -show run -theme $HOME/.config/rofi/themes/launcher.rasi"


------------------------------------------------------------------------
---  MOUSE
------------------------------------------------------------------------


myFocusFollowsMouse :: Bool
myFocusFollowsMouse = False

myClickJustFocuses :: Bool
myClickJustFocuses = False


------------------------------------------------------------------------
---  BORDER
------------------------------------------------------------------------


myBorderWidth :: Dimension
myBorderWidth           = 1

myNormalBorderColor :: String
myNormalBorderColor     = "#232732"

myFocusedBorderColor :: String
myFocusedBorderColor    = "#cccccc"


------------------------------------------------------------------------
---  WOKSPACES
------------------------------------------------------------------------


myWorkspaces :: [String]
myWorkspaces = ["1", "2", "3", "4", "5"]


------------------------------------------------------------------------


------------------------------------------------------------------------
---  KEYBINDINGS
------------------------------------------------------------------------


myKeys conf@(XConfig {XMonad.modMask = modm}) = M.fromList $

    --  APPLICATIONS  --

    [ ((modm,               xK_Return), spawn myTerminal ) -- launch terminal

    , ((modm,               xK_e     ), spawn myEditor ) -- launch editor

    , ((modm,               xK_p     ), spawn myMenu ) -- launch menu

    , ((modm,               xK_b     ), spawn myBrowser ) -- launch browser

    , ((modm .|. shiftMask, xK_Return), spawn myFileBrowser ) -- launch file browser

    , ((modm,               xK_d     ), spawn "element-desktop-nightly" ) -- launch element

    , ((modm,               xK_o     ), spawn "loffice" ) -- launch libreoffice

    --  SETTINGS?  --

    , ((myAltMask,          xK_a     ), spawn "pavucontrol" ) -- launch audio settings manager

    , ((myAltMask,          xK_b     ), spawn "blueberry" ) -- launch bluetooth manager

    , ((myAltMask,          xK_m     ), spawn "alacritty -e ncmpcpp" ) -- launch ncmpcpp (music manager for mpd)

    --  WINDOW  --

    , ((modm .|. shiftMask, xK_c     ), kill ) -- close focused window

    , ((modm,               xK_Tab   ), sendMessage NextLayout ) -- next layout

    , ((modm .|. shiftMask, xK_space ), setLayout $ XMonad.layoutHook conf ) -- resets layout to defaut layout

    , ((modm,               xK_n     ), refresh ) -- resize window to default window size

    , ((modm,               xK_j     ), windows W.focusDown ) -- next window

    , ((modm,               xK_k     ), windows W.focusUp  ) -- previous window

    , ((modm,               xK_m     ), windows W.focusMaster  ) -- master window

    -- , ((modm,               xK_Return), windows W.swapMaster) -- swap focused window and master window

    , ((modm .|. shiftMask, xK_j     ), windows W.swapDown  ) -- swap focused window and next window

    , ((modm .|. shiftMask, xK_k     ), windows W.swapUp    ) -- swap focused window and previous window

    , ((modm,               xK_h     ), sendMessage Shrink) -- shrink master area

    , ((modm,               xK_l     ), sendMessage Expand) -- expand master area

    , ((modm,               xK_t     ), withFocused $ windows . W.sink) -- push window into tiling

    -- , ((modm              , xK_comma ), sendMessage (IncMasterN 1)) -- increment number of windows in master area

    -- , ((modm              , xK_period), sendMessage (IncMasterN (-1))) -- deincrement number of windows in master area

    --  XMONAD  --

    , ((modm .|. shiftMask, xK_q     ), io (exitWith ExitSuccess)) -- quit xmonad

    , ((modm              , xK_q     ), spawn "xmonad --recompile; xmonad --restart") -- restart xmonad

    ]
    ++

    [((m .|. modm, k), windows $ f i)
        | (i, k) <- zip (XMonad.workspaces conf) [xK_1 .. xK_9]
        , (f, m) <- [(W.greedyView, 0), (W.shift, shiftMask)]] -- switch to workspace I as in integer
    ++

    --
    -- mod-{w,e,r}, Switch to physical/Xinerama screens 1, 2, or 3
    -- mod-shift-{w,e,r}, Move client to screen 1, 2, or 3
    --
    [((m .|. modm, key), screenWorkspace sc >>= flip whenJust (windows . f))
        | (key, sc) <- zip [xK_w, xK_r] [0..]
        , (f, m) <- [(W.view, 0), (W.shift, shiftMask)]]


------------------------------------------------------------------------


------------------------------------------------------------------------
---  MOUSE BINDINGS
------------------------------------------------------------------------


myMouseBindings (XConfig {XMonad.modMask = modm}) = M.fromList $

    [ ((modm, button1), (\w -> focus w >> mouseMoveWindow w
                                       >> windows W.shiftMaster)) -- set window to float mode by dragging

    , ((modm, button2), (\w -> focus w >> windows W.shiftMaster)) -- raise the window to the top of the stack

    , ((modm, button3), (\w -> focus w >> mouseResizeWindow w
                                       >> windows W.shiftMaster)) -- set window to float mode and resize by dragging
    ]


------------------------------------------------------------------------


------------------------------------------------------------------------
---  LAYOUT
------------------------------------------------------------------------


myLayout = mkToggle (NBFULL ?? NOBORDERS ?? EOT) $ avoidStruts (smartBorders (mySpacing (Tall 1 0.03 0.5)))
        ||| avoidStruts (Tall 1 0.03 0.5)
        ||| noBorders (Full)
    where
        mySpacing   = spacingRaw False (Border 10 10 10 10) True (Border 10 10 10 10) True


------------------------------------------------------------------------


------------------------------------------------------------------------
---  MANAGE HOOK
------------------------------------------------------------------------


myManageHook = composeAll . concat $
    [ [isDialog --> doCenterFloat]
    , [className =? c --> doCenterFloat | c <- myCFloats]
    , [ className =? "Alacritty"              --> doCenterFloat ]
    , [title =? t --> doFloat | t <- myTFloats]
    , [resource =? r --> doFloat | r <- myRFloats]
    , [resource =? i --> doIgnore | i <- myIgnores]
    , [isFullscreen -->  doFullFloat]
    -- , [(className =? x <||> title =? x <||> resource =? x) --> doShiftAndGo "\61612" | x <- my1Shifts]
    -- , [(className =? x <||> title =? x <||> resource =? x) --> doShiftAndGo "\61899" | x <- my2Shifts]
    -- , [(className =? x <||> title =? x <||> resource =? x) --> doShiftAndGo "\61947" | x <- my3Shifts]
    -- , [(className =? x <||> title =? x <||> resource =? x) --> doShiftAndGo "\61635" | x <- my4Shifts]
    -- , [(className =? x <||> title =? x <||> resource =? x) --> doShiftAndGo "\61502" | x <- my5Shifts]
    -- , [(className =? x <||> title =? x <||> resource =? x) --> doShiftAndGo "\61501" | x <- my6Shifts]
    -- , [(className =? x <||> title =? x <||> resource =? x) --> doShiftAndGo "\61705" | x <- my7Shifts]
    -- , [(className =? x <||> title =? x <||> resource =? x) --> doShiftAndGo "\61564" | x <- my8Shifts]
    -- , [(className =? x <||> title =? x <||> resource =? x) --> doShiftAndGo "\62150" | x <- my9Shifts]
    -- , [(className =? x <||> title =? x <||> resource =? x) --> doShiftAndGo "\61872" | x <- my10Shifts]
    ]
    where
    -- doShiftAndGo = doF . liftM2 (.) W.greedyView W.shift
    myCFloats = []
    myTFloats = ["Downloads", "Save As..."]
    myRFloats = []
    myIgnores = []



------------------------------------------------------------------------
---  LOG HOOK
------------------------------------------------------------------------


myLogHook = fadeInactiveLogHook fadeAmount
    where fadeAmount = 1.0


------------------------------------------------------------------------


------------------------------------------------------------------------
---  STARTUP HOOK
------------------------------------------------------------------------


myStartupHook = do
    spawnOnce "picom &"
    spawnOnce "nitrogen --restore &"
    spawnOnce "polybar main &"
    spawnOnce "mpd &"
    spawnOnce "blueman-applet &"
    spawnOnce "nm-applet &"


------------------------------------------------------------------------


------------------------------------------------------------------------
---  MAIN
------------------------------------------------------------------------


main = xmonad $ docks $ ewmh $ def {
      -- simple stuff
        terminal           = myTerminal,
        focusFollowsMouse  = myFocusFollowsMouse,
        clickJustFocuses   = myClickJustFocuses,
        borderWidth        = myBorderWidth,
        modMask            = myModMask,
        workspaces         = myWorkspaces,
        normalBorderColor  = myNormalBorderColor,
        focusedBorderColor = myFocusedBorderColor,

      -- key bindings
        keys               = myKeys,
        mouseBindings      = myMouseBindings,

      -- hooks, layouts
        -- layoutHook         = myLayout ||| noBorders Full,
        layoutHook         = myLayout,
        manageHook         = myManageHook,
        handleEventHook    = fullscreenEventHook,
        logHook            = myLogHook,
        startupHook        = myStartupHook
    }
