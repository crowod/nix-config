
{ 
  module_name
, ...
}: 
{
  home.file.".config/hypr/hyprland.conf".text = (builtins.readFile ./conf/hyprland.conf) +   
  (if "${module_name}" == "mio" then ''


    xwayland {
      force_zero_scaling = true
    }
    
    exec-once = xprop -root -f _XWAYLAND_GLOBAL_OUTPUT_SCALE 32c -set _XWAYLAND_GLOBAL_OUTPUT_SCALE 2
    exec-once = xrdb -merge ~/.Xresources

  '' else "");
}
