--imports
import XMonad hiding((|||))

--used for xmobar, DynamicLog contains status information
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks

--allows for <=< in main function, not sure exactly what it does but allows addition of withUrgencyHook
import Control.Monad

--urgency -> highlight a workspace when an im is recieved
import XMonad.Hooks.UrgencyHook

--for fullscreen --> float (playing a youtube video fullscreen without issues)
--hiding gets rid of conflict with different defn. for CW in XMonad.Layout.Spiral
import XMonad.Hooks.ManageHelpers hiding (CW)
import XMonad.Hooks.EwmhDesktops

--needed for viewShift
import Control.Monad (liftM2)
import System.IO
import qualified XMonad.StackSet as W

--additional layouts
import XMonad.Layout.NoBorders
import XMonad.Layout.Spiral
import XMonad.Layout.Tabbed
import XMonad.Layout.Accordion
import XMonad.Layout.ThreeColumns
import XMonad.Layout.Grid
import XMonad.Layout.LayoutCombinators -- switch to a specific layout

--correctly exit xserver
import System.Exit

--used for custom key/mouse  bindings (don't have to use xK_b format)
--have to specify the module you want to use such as additonalKeys or removeKeys etc.
import XMonad.Util.EZConfig(additionalKeysP,additionalMouseBindings)

import XMonad.Layout.WindowNavigation

--Dragging and resizing floating windows
import XMonad.Actions.FlexibleManipulate as Flex

--set the window manager name
import XMonad.Hooks.SetWMName

--use urxvt terminal emulator
myTerminal = "urxvt"

--set workspace names and how many
myWorkspaces = ["1:term","2:web","3:docs","4:mail","5:misc"] -- ++ map show [5..8]

--border width in pixels
myBorderWidth = 2

--hide/show taskbar
toggleStrutsKey XConfig {XMonad.modMask = modMask} = (modMask, xK_b)

--what is written to taskbar (PP = pretty printer)  ->  stdinReader in xmobarrc
--see http://xmonad.org/xmonad-docs/xmonad-contrib/XMonad-Hooks-DynamicLog.html#v:ppOrder
myPP = xmobarPP 
--good examples at https://pbrisbin.com/posts/xmonad_statusbars/
	{
	--	ppTitle = xmobarColor "#657b83" "" . shorten 100 -- title of currently active process, how many chars to use
		ppCurrent = xmobarColor "#c0c0c0" "" . wrap "<" ">" --how the currently selected window is shown i.e.  <1:term>
		,ppHiddenNoWindows = xmobarColor "#657b83" "" --show windows with no running app
		,ppSep = xmobarColor "#c0c0c0" "" " | " --what charcters seperate one reading from the next
		,ppUrgent = xmobarColor "#ff69b4" "" --format to be applied to tags of urgent workspaces.
	--	,ppLayout = const "" -- don't display the current layout i.e. Tall or Full
		,ppOrder = \(ws:l:t:_) -> [ws,l] -- only display workspaces	
	}

--set xmobar as the taskbar and give it correct settings
--xmobarPP and sjanssenPP are some built in options if you don't want to create a custom PP
--statusBar requires the 3 args.
xmobarConfig = statusBar "xmobar" myPP toggleStrutsKey

--custom colors
myNormalBorderColor = "#002b36"
myFocusedBorderColor = "#cb4b16"
xmobarTitleColor = "green" --current window title color
xmobarCurrentWorkspaceColor = "#CEFFAC" --current workspace color

--layout hook specifies all layouts that are available including any customizations
	--some layouts require arguments, if layout doesn't change on recompile double check
	--run xmonad --recompile from command line to view errors
	--each layout seperated by |||
	--after recompile with mod-q need to press mod-shift-space to reload layout
myLayoutHook = 	avoidStruts $ windowNavigation $ smartBorders  --struts have to do with spacing between menu bar 
	(
		Tall 1 (3/100) (1/2) |||  --- args: num panes in master pane, size inc/dec %, initial size of master pan 
		Full ||| -- fullscreen
		Grid |||
		--Accordion ||| -- main pane with others stacked at bottom
		--noBorders (simpleTabbed) |||
		noBorders (tabbed shrinkText tabConfig) |||
		ThreeCol 1 (3/100) (1/2) |||  -- args: num panes in master pane, size inc/dec %, initial size of master pane
		spiralWithDir North CW  (4/5)  -- args: start dir, spiral dir, ratio of panes in spiral: 0-aspect ratio	
	)

-- Colors for text and backgrounds of each tab when in "Tabbed" layout.
tabConfig = defaultTheme {
	activeBorderColor = "#657b83",
	activeTextColor = "#b58900",
    	activeColor = "#002b36",
    	inactiveBorderColor = "#1c1c1c",
    	inactiveTextColor = "#b58900",
    	inactiveColor = "#002b36"
}

--manage hook is run each time a new window is created 
	--can be used to specify custom actions for a specific program etc.
	--install xorg-utils
	--use: xprop | grep WM_CLASS and then use mouse to click on desired program to get its name
myManageHook = composeAll 
	[
		className =? "Subl3" --> viewShift "3:docs"
		,className =? "Thunderbird" --> viewShift "4:mail"
		,className =? "Nylas N1" --> viewShift "4:mail"
		,className =? "google-chrome" --> viewShift "2:web"
		,className =? "Firefox" --> viewShift "2:web"
	--	,className =? "Firefox" --> doShift "2:web"
	--	,className =? "Thunderbird" --> doShift "4:mail"
		,isFullscreen --> doFullFloat
		,className =? "processing-app-Base" --> doFloat -- arduino
	]
	--shifts focus and moves you to new window
	where viewShift = doF . liftM2 (.) W.greedyView W.shift

--event hook -> specifies what should happen for certain X11 events
myEventHook = mconcat
	[
		docksEventHook --lets xmobar appear correctly
		,fullscreenEventHook --helps with fullscreeen video
		,handleEventHook defaultConfig
	]

--custom keybindings
--M = mod, S=escape
myModMask = mod4Mask --set windows key as the mod key
myKeys =
	[
		("M-w", kill)	-- close focused window
		,("M-<space>-q", io (exitWith ExitSuccess))  -- Quit xmonad
		,("M-u", focusUrgent) -- switch to urgent window
		--navigate through open panes with mod-arrowkeys
		,("M-<L>", sendMessage $ Go L)
                ,("M-<R>", sendMessage $ Go R)
                ,("M-<U>", sendMessage $ Go U)
                ,("M-<D>", sendMessage $ Go D)
		,("M-f", sendMessage $ JumpToLayout "Full") --switch to a specific layout, must use layout name displayed in status bar
		,("M-p", spawn "dmenu_run -i -fn 'Anonymous Pro:pixelsize=18' -nb '#002b36' -nf '#839496' -sb '#b58900' -sf '#002b36'") 
	]

--custom mouse bindings
myMouse =
	[
		((mod4Mask, button1), (Flex.mouseWindow Flex.discrete)) --drag and resize floating window
	]

--action to perform when xmonad is started
--use <+> for additional items, each item in ()
myStartupHook = 
	(setWMName "LG3D") -- set workspace name (was needed for matlab)

--structure to hold custom settings
mySettings = defaultConfig 
	{
		terminal = myTerminal
		,modMask = myModMask
		,workspaces = myWorkspaces
		,borderWidth = myBorderWidth
		,normalBorderColor = myNormalBorderColor
		,focusedBorderColor = myFocusedBorderColor
		,handleEventHook = myEventHook
		,layoutHook = myLayoutHook
		,manageHook = myManageHook <+> manageDocks <+> manageHook defaultConfig
		,startupHook = myStartupHook
	}

--main
main = xmonad <=< xmobarConfig $ withUrgencyHook NoUrgencyHook $ mySettings `additionalKeysP` myKeys `additionalMouseBindings` myMouse


