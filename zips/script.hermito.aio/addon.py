import xbmcaddon
import xbmcgui
 
addon       = xbmcaddon.Addon()
addonname   = addon.getAddonInfo('name')
 
line1 = "Keine Funktion."
line2 = " "
line3 = "Addons wurden bereits installiert"
 
xbmcgui.Dialog().ok(addonname, line1, line2, line3)
