import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig(additionalKeys)
import System.IO
import XMonad.Hooks.EwmhDesktops
import XMonad.Layout.NoBorders
import XMonad.Config.Gnome
 
myTerminal = "/usr/bin/urxvt" 
main = do
    xmproc <- spawnPipe "xmobar $HOME/.xmobarrc"
    xmonad $ defaultConfig
        { manageHook = manageDocks <+> manageHook defaultConfig
        , layoutHook = avoidStruts  $ smartBorders $ layoutHook defaultConfig
        , modMask = mod4Mask
        , handleEventHook    = fullscreenEventHook
        , borderWidth = 1
	, terminal = myTerminal
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
        ]
