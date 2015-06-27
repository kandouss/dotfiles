import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.ManageHelpers
import XMonad.Layout.NoBorders
import XMonad.Actions.NoBorders
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig(additionalKeys)
import System.IO

main = do
  xmproc <- spawnPipe "/usr/bin/xmobar /home/kamal/.xmobarrc"
  xmonad $ defaultConfig {
	modMask = mod4Mask,
	terminal = "xterm",
	manageHook = composeAll [
		manageDocks,
		isFullscreen --> doFullFloat,
		className =? "VLC" --> doFloat,
		manageHook defaultConfig
	],
	layoutHook =  smartBorders . avoidStruts $ layoutHook defaultConfig,
	logHook = dynamicLogWithPP $ xmobarPP
		{ ppOutput = hPutStrLn xmproc,
		  ppTitle = xmobarColor "green" "" .shorten 50
		}
	} `additionalKeys`
    [ ((0                     , 0x1008ff11), spawn "amixer set Master 2-"),
      ((0                     , 0x1008ff13), spawn "amixer set Master 2+"),
	  ((mod4Mask .|. shiftMask, xK_f), sendMessage ToggleStruts),
	  ((mod4Mask, xK_b), withFocused toggleBorder)
	]
	
