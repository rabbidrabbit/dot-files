import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.EwmhDesktops
import XMonad.Hooks.ManageHelpers
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig(additionalKeys)
import XMonad.Layout.NoBorders
import XMonad.Layout.ResizableTile
import XMonad.Layout.Renamed
import XMonad.Config.Gnome
import System.IO
 
myManageHooks = composeAll
    [ isFullscreen --> doFullFloat
    ]

myLayout = renamed [Replace "Tall"] tiled ||| renamed [Replace "Mirror Tall"] (Mirror tiled) ||| Full
  where
    tiled = ResizableTall 1 (3/100) (1/2) []

main = do
    xmproc <- spawnPipe "xmobar $HOME/.xmobarrc"
    xmonad $ defaultConfig
        { manageHook = manageDocks <+> myManageHooks <+> manageHook defaultConfig
        , layoutHook = avoidStruts  $ smartBorders myLayout

        , modMask = mod4Mask
        , handleEventHook = fullscreenEventHook
        , borderWidth = 1
        , terminal = "/usr/bin/urxvt"
        , focusedBorderColor = "#d74b73"
        , normalBorderColor = "#3d3d3d"
        , logHook = dynamicLogWithPP xmobarPP
                        { ppOutput = hPutStrLn xmproc
                        , ppTitle = xmobarColor "#d74b73" "" . shorten 50
                        }
        } `additionalKeys`
        [((mod4Mask, xK_Print), spawn "sleep 0.2; scrot -s")
        , ((0, xK_Print), spawn "scrot")
	    , ((mod4Mask, xK_Delete), spawn "dbus-send --system --print-reply --dest=\"org.freedesktop.ConsoleKit\" /org/freedesktop/ConsoleKit/Manager org.freedesktop.ConsoleKit.Manager.Stop")
	    , ((mod4Mask, xK_Pause), spawn "dbus-send --system --print-reply --dest=\"org.freedesktop.UPower\" /org/freedesktop/UPower org.freedesktop.UPower.Suspend")
        , ((mod4Mask, xK_a), sendMessage MirrorShrink)
        , ((mod4Mask, xK_z), sendMessage MirrorExpand)
        ]
