# vim: filetype=zsh

#
# .zxresources.zsh - Xresources configuration.
#

ECHOCAT '.zxresources.zsh - Xresources configuration.'

# Define the new theme
new_theme="
*background: #1E1E2E
*foreground: #CDD6F4
*color0: #45475A
*color8: #585B70
*color1: #F38BA8
*color9: #F38BA8
*color2: #A6E3A1
*color10: #A6E3A1
*color3: #F9E2AF
*color11: #F9E2AF
*color4: #89B4FA
*color12: #89B4FA
*color5: #F5C2E7
*color13: #F5C2E7
*color6: #94E2D5
*color14: #94E2D5
*color7: #BAC2DE
*color15: #A6ADC8"

# Get the current background and foreground from .Xresources file
current_background=$(grep -P '^\*background:' $HOME/.Xresources)
current_foreground=$(grep -P '^\*foreground:' $HOME/.Xresources)

# Check if the current background and foreground are not the new ones
if [[ "$current_background" != "*background: #1E1E2E" || "$current_foreground" != "*foreground: #CDD6F4" ]]; then
    # Remove the current colors from .Xresources file
    sed -i '/^\*(background|foreground|color[0-9]{1,2}):/d' $HOME/.Xresources

    # Append the new theme to .Xresources file
    ECHOCAT "$new_theme" >> $HOME/.Xresources

    ECHOCAT "Theme updated successfully."
else 
    ECHOCAT "The current theme is already set as desired."
fi

# Merge .Xresources to X server resource database to apply changes immediately.
xrdb -merge $HOME/.Xresources > /dev/null
