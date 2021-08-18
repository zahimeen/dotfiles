------------------------------------------------------------------------
---  IMPORTS
------------------------------------------------------------------------


-- Base
import XMonad
import System.Exit ( exitSuccess )
import qualified Codec.Binary.UTF8.String as UTF8
import qualified XMonad.StackSet as W
import Control.Monad ( join, when )
import Graphics.X11.Xlib.Cursor

    -- Data
import Data.Monoid
import Data.Maybe ( maybeToList )
import qualified Data.Map as M

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
import XMonad.Layout.Gaps
import XMonad.Layout.MultiToggle.Instances (StdTransformers(NBFULL, MIRROR, NOBORDERS))
import XMonad.Layout.ResizableTile
import qualified XMonad.Layout.MultiToggle as MT ( Toggle(..) )

    -- Utilities
import XMonad.Util.SpawnOnce
import XMonad.Util.Run
import XMonad.Util.EZConfig (additionalKeysP)
import XMonad.Util.Cursor


------------------------------------------------------------------------
---  DEFAULTS
------------------------------------------------------------------------


myModMask :: KeyMask
myModMask           = mod4Mask

myTerminal :: String
myTerminal          = "kitty -e zsh"

myBrowser :: String
myBrowser           = "brave"

myMenu :: String
myMenu              = "rofi -theme launcher.rasi"


------------------------------------------------------------------------
---  MOUSE
------------------------------------------------------------------------


myFocusFollowsMouse :: Bool
myFocusFollowsMouse = False

myClickJustFocuses :: Bool
myClickJustFocuses = True


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
---  WORKSPACES
------------------------------------------------------------------------


myWorkspaces :: [String]
myWorkspaces = ["1", "2", "3", "4", "5", "6"]


------------------------------------------------------------------------
---  KEYBINDINGS
------------------------------------------------------------------------


myKeys :: [(String, X ())]
myKeys =
    -- XMonad
    [ ("M-S-q", io exitSuccess )
    , ("M-q",   spawn "xmonad --recompile; xmonad --restart")

    -- Layout
    , ("M-<Tab>", sendMessage NextLayout)

    -- Resizing
    , ("M-M1-h", sendMessage Shrink)
    , ("M-M1-l", sendMessage Expand)
    , ("M-M1-j", sendMessage MirrorShrink)
    , ("M-M1-k", sendMessage MirrorExpand)

    -- Applications
    , ("M-<Return>", spawn (myTerminal))
    , ("M-b M-b", spawn (myBrowser))
    , ("M-b M-c", spawn ("chromium"))
    , ("M-s", spawn ("spotify"))

    -- Setting Applications
    , ("C-M-a", spawn ("pavucontrol"))
    , ("C-M-b", spawn ("blueman-manager"))

    -- Menu
    , ("M-S-<Return>", spawn (myMenu ++ " -show run"))
    , ("M-p w", spawn (myMenu ++ " -show window"))
    ]


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
---  LAYOUT
------------------------------------------------------------------------


myLayout = mkToggle (NBFULL ?? NOBORDERS ?? EOT) $ avoidStruts (smartBorders (mySpacing (Tall 1 0.03 0.5)))
        ||| avoidStruts (Tall 1 0.03 0.5)
        ||| noBorders (Full)
    where
        mySpacing   = spacingRaw False (Border 25 25 25 25) True (Border 5 5 5 5) True

addNETSupported :: Atom -> X ()
addNETSupported x   = withDisplay $ \dpy -> do
    r               <- asks theRoot
    a_NET_SUPPORTED <- getAtom "_NET_SUPPORTED"
    a               <- getAtom "ATOM"
    liftIO $ do
       sup <- (join . maybeToList) <$> getWindowProperty32 dpy a_NET_SUPPORTED r
       when (fromIntegral x `notElem` sup) $
         changeProperty32 dpy r a_NET_SUPPORTED a propModeAppend [fromIntegral x]

addEWMHFullscreen :: X ()
addEWMHFullscreen   = do
    wms <- getAtom "_NET_WM_STATE"
    wfs <- getAtom "_NET_WM_STATE_FULLSCREEN"
    mapM_ addNETSupported [wms, wfs]


------------------------------------------------------------------------
---  MANAGE HOOK
------------------------------------------------------------------------


myManageHook = composeAll . concat $
    [ [isDialog --> doCenterFloat]
    , [className =? c --> doCenterFloat | c <- myCFloats]
    , [title =? t --> doFloat | t <- myTFloats]
    , [resource =? r --> doFloat | r <- myRFloats]
    , [resource =? i --> doIgnore | i <- myIgnores]
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
---  STARTUP HOOK
------------------------------------------------------------------------


myStartupHook = do
    spawnOnce "picom &"
    spawnOnce "nitrogen --restore &"
    spawnOnce "blueman-applet &"
    spawnOnce "nm-applet &"
    spawn     "$HOME/.config/polybar/launcher.sh &"
    spawnOnce "spotify &"
    setDefaultCursor xC_arrow


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
    mouseBindings      = myMouseBindings,

    -- hooks, layouts
    layoutHook         = myLayout,
    manageHook         = myManageHook,
    handleEventHook    = fullscreenEventHook,
    logHook            = myLogHook,
    startupHook        = myStartupHook >> addEWMHFullscreen
} `additionalKeysP` myKeys
