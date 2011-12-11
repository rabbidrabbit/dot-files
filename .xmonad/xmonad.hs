import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig(additionalKeys)
import System.IO
 
 
main = do
    xmproc <- spawnPipe "xmobar $HOME/.xmobarrc"
    xmonad $ defaultConfig
        { manageHook = manageDocks <+> myManageHook
                        <+> manageHook defauonad/ltConfig
        , layoutHook = avoidStruts  $  layoutHook defaultConfig
        , borderWidth = 1 
        , terminal = myTerminal
        , focusedBorderColor = "#d74b73"
        , normalBorderColor = "#3d3d3d"
        , logHook = dynamicLogWithPP xmobarPP
                        { ppOutput = hPutStrLn xmproc
                        , ppTitle = xmobarColor "#d74b73" "" . shorten 50
                        }
        } `additionalKeys`
        [((controlMask, xK_Print), spawn "sleep 0.2; scrot -s")
        , ((0, xK_Print), spawn "scrot")
        , ((modMask, xK_P), spawn "dmenu_run")
        ]
