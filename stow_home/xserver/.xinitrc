# Enabling clipboard on virtualbox.
VBoxClient --clipboard
# Applying keymap layout.
test -f ~/.config/Keyboard__HdnExtended_xorgLayout/.Xkeymap.xkb && xkbcomp ~/.config/Keyboard__HdnExtended_xorgLayout/.Xkeymap.xkb $DISPLAY
# Running window manager (should be last in this script).
exec awesome
test -f ~/.config/Keyboard__HdnExtended_xorgLayout/.Xkeymap.xkb && xkbcomp ~/.config/Keyboard__HdnExtended_xorgLayout/.Xkeymap.xkb $DISPLAY

