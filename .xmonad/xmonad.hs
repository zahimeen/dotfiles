---  IMPORTS  ---

    -- Base

import XMonad
import Data.Monoid
import System.Exit
    
    -- Layout

import XMonad.Layout.Spacing
import XMonad.Layout.Fullscreen
import XMonad.Layout.NoBorders

    -- Utilities

import XMonad.Util.SpawnOnce
import XMonad.Util.Run (runProcessWithInput, safeSpawn, spawnPipe, hPutStrLn)

    -- Hooks

import XMonad.Hooks.DynamicLog (dynamicLogWithPP, wrap, xmobarPP, xmobarColor, shorten, PP(..))
import XMonad.Hooks.WorkspaceHistory
import XMonad.Hooks.FadeInactive
import XMonad.Hooks.ManageDocks 

import qualified XMonad.StackSet as W
import qualified Data.Map        as M

---  DEFAULTS  ---


myTerminal :: String
myTerminal      = "alacritty"

myBrowser :: String
myBrowser       = "brave"

myFileBrowser :: String
myFileBrowser   = "thunar"

myMenu :: String
myMenu          = "dmenu_run -p 'Run: '"

myEditor :: String
myEditor        = "emacs"

myModMask :: KeyMask
myModMask       = mod4Mask

windowCount :: X (Maybe String)
windowCount = gets $ Just . show . length . W.integrate' . W.stack . W.workspace . W.current . windowset


---  MOUSE  ---


myFocusFollowsMouse :: Bool
myFocusFollowsMouse = False

myClickJustFocuses :: Bool
myClickJustFocuses = False


---  BORDER  ---


myBorderWidth :: Dimension
myBorderWidth   = 3

myNormalBorderColor :: String
myNormalBorderColor  = "#474646"

myFocusedBorderColor :: String
myFocusedBorderColor = "#83a598"


---  WOKSPACES  ---


myWorkspaces :: [String]
myWorkspaces = ["www", "dev", "dis", "mai", "ran"]


------------------------------------------------------------------------


---  KEYBINDINGS  ---


myKeys conf@(XConfig {XMonad.modMask = modm}) = M.fromList $


    ---  APPLICATIONS  ---


    [ ((modm,               xK_Return), spawn $ XMonad.terminal conf ) -- launch terminal

    , ((modm,               xK_p     ), spawn myMenu ) -- launch menu

    , ((modm,               xK_b     ), spawn myBrowser ) -- launch browser

    , ((modm .|. shiftMask, xK_Return), spawn myFileBrowser ) -- launch file browser

    , ((modm,               xK_e     ), spawn myEditor ) -- launch editor

    , ((modm,               xK_d     ), spawn "discord" ) -- launch discord


    ---  WINDOW  ---


    , ((modm .|. shiftMask, xK_c     ), kill ) -- close focused window

    , ((modm,               xK_space ), sendMessage NextLayout ) -- next layout

    , ((modm .|. shiftMask, xK_space ), setLayout $ XMonad.layoutHook conf ) -- resets layout to defaut layout

    , ((modm,               xK_n     ), refresh ) -- resize window to default window size

    , ((modm,               xK_j     ), windows W.focusDown ) -- next window

    , ((modm,               xK_k     ), windows W.focusUp  ) -- previous window

    , ((modm,               xK_m     ), windows W.focusMaster  ) -- master window

    , ((modm .|. shiftMask, xK_j     ), windows W.swapDown  ) -- swap focused window and next window 

    , ((modm .|. shiftMask, xK_k     ), windows W.swapUp    ) -- swap focused window and previous window

    , ((modm,               xK_h     ), sendMessage Shrink) -- shrink master area

    , ((modm,               xK_l     ), sendMessage Expand) -- expand master area

    , ((modm,               xK_t     ), withFocused $ windows . W.sink) -- push window into tiling

    , ((modm              , xK_comma ), sendMessage (IncMasterN 1)) -- increment number of windows in master area

    , ((modm              , xK_period), sendMessage (IncMasterN (-1))) -- deincrement number of windows in master area


    ---  XMONAD  ---

    , ((modm .|. shiftMask, xK_q     ), io (exitWith ExitSuccess)) -- quit xmonad

    , ((modm              , xK_q     ), spawn "xmonad --recompile; xmonad --restart") -- restart xmonad

    ]
    ++

    [((m .|. modm, k), windows $ f i)
        | (i, k) <- zip (XMonad.workspaces conf) [xK_1 .. xK_9]
        , (f, m) <- [(W.greedyView, 0), (W.shift, shiftMask)]] -- switch to workspace I as in integer
    ++

    -- mod-{w,e,r}, Switch to physical/Xinerama screens 1, 2, or 3
    -- mod-shift-{w,e,r}, Move client to screen 1, 2, or 3
    [((m .|. modm, key), screenWorkspace sc >>= flip whenJust (windows . f))
        | (key, sc) <- zip [xK_w, xK_r] [0..]
        , (f, m) <- [(W.view, 0), (W.shift, shiftMask)]]


------------------------------------------------------------------------


---  MOUSE BINDINGS  ---


myMouseBindings (XConfig {XMonad.modMask = modm}) = M.fromList $

    [ ((modm, button1), (\w -> focus w >> mouseMoveWindow w
                                       >> windows W.shiftMaster)) -- set window to float mode by dragging

    , ((modm, button2), (\w -> focus w >> windows W.shiftMaster)) -- raise the window to the top of the stack

    , ((modm, button3), (\w -> focus w >> mouseResizeWindow w
                                       >> windows W.shiftMaster)) -- set window to float mode and resize by dragging
    ]

------------------------------------------------------------------------


---  LAYOUT  ---


myLayout = avoidStruts $ spacingRaw False (Border 10 10 10 10) True (Border 10 10 10 10) True $ (tiled)
  where
     -- default tiling algorithm partitions the screen into two panes
     tiled   = Tall nmaster delta ratio

     -- The default number of windows in the master pane
     nmaster = 1

     -- Default proportion of screen occupied by master pane
     ratio   = 1/2

     -- Percent of screen to increment by when resizing panes
     delta   = 3/100


------------------------------------------------------------------------


---  MANAGE HOOK  ---


myManageHook = composeAll
    [ className =? "MPlayer"        --> doFloat
    , className =? "Gimp"           --> doFloat
    , resource  =? "desktop_window" --> doIgnore
    , resource  =? "kdesktop"       --> doIgnore ]


------------------------------------------------------------------------


---  LOG HOOK  ---


myLogHook = fadeInactiveLogHook fadeAmount
    where fadeAmount = 1.0


------------------------------------------------------------------------


---  STARTUP HOOK  ---


myStartupHook = do
    spawnOnce "volumeicon &"
    spawnOnce "blueberry-tray &"
    spawnOnce "nitrogen --restore &"
    spawnOnce "picom &"
    spawnOnce "discord &"
    spawnOnce "stalonetray &"


------------------------------------------------------------------------


---  MAIN  ---


main = do 
    h <- spawnPipe "xmobar ~/.xmonad/xmobarrc"
    xmonad $ fullscreenSupport $ docks def {


        ---  DEFAULTS  ---


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
        layoutHook         = myLayout ||| noBorders Full,
        manageHook         = fullscreenManageHook,
        handleEventHook    = fullscreenEventHook,
        logHook = workspaceHistoryHook <+> myLogHook <+> dynamicLogWithPP xmobarPP
                        { ppOutput = hPutStrLn h
                        , ppCurrent = xmobarColor "#83a598" "" . wrap "[" "]"   -- #9BC1B2 #69DFFA
                        , ppExtras  = [windowCount]                                     -- # of windows current workspace
                        , ppTitle = xmobarColor "#d3869b" "" . shorten 50       -- #9BC1B2 #69DFFA
                        , ppHiddenNoWindows = xmobarColor "#c792ea" "" 
                        , ppSep =  "<fc=#666666> <fn=1> | </fn> </fc>"                  -- Separators in xmobar
                        , ppOrder  = \(ws:l:t:ex) -> [ws,l]++ex++[t]
                        , ppVisible = xmobarColor "#98be65" ""                          -- Visible but not current workspace
                        },
        startupHook        = myStartupHook
    }

