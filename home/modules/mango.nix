{ pkgs, ... }:


{
  home.file.".config/mango/init-layouts.sh" = {
    executable = true;
    text = ''
      #!${pkgs.bash}/bin/bash

      sleep 0.3
      
      fog tag in {1..9}; do
        mmsg dispatch view,$tag,0
        mmsg dispatch setlayout,scroller
      done

      mmsg dispatch view,1,0
    '';
  }; 
 
  wayland.windowManager.mango = {
    enable = true;

    settings = ''

      exec-once=~/.config/mango/init-layouts.sh

      # ==========================================
      # KEYBOARD
      # ==========================================

      xkb_rules_layout=us,ru
      xkb_rules_options=grp:alt_shift_toggle

      repeat_rate=35
      repeat_delay=300

      # ==========================================
      # MONITORS
      # ==========================================

      monitorrule=name:^HDMI-A-1$,width:1920,height:1080,refresh:144,x:0,y:0,scale:1

      # ==========================================
      # AUTOSTART
      # ==========================================

      exec-once=noctalia

      # ==========================================
      # APPEARANCE
      # ==========================================

      # gaps between windows
      gappih=8
      gappiv=8

      # gaps from screen edges
      gappoh=12
      gappov=12

      borderpx=2
      border_radius=12

      no_radius_when_single=0
      no_border_when_single=0

      # don't throw the mouse cursor around
      warpcursor=0


      # ==========================================
      # BLUR
      # ==========================================
      
      blur=1
      blur_layer=0

      blur_optimized=1

      blur_params_num_passes=2
      blur_params_radius=6
      blur_params_noise=0.02
      blur_params_brightness=0.9
      blur_params_saturation=1.15


      # ==========================================
      # ANIMATIONS
      # ==========================================

      animations=1
      layer_animations=1

      animation_type_open=zoom
      animation_type_close=zoom

      animation_fade_in=1
      animation_fade_out=1

      zoom_initial_ratio=0.92
      zoom_end_ratio=0.92
      
      fadein_begin_opacity=0.5
      fadeout_begin_opacity=0.8

      animation_duration_open=220
      animation_duration_close=180
      animation_duration_move=180
      animation_duration_tag=220

      animation_curve_open=0.46,1.0,0.29,1
      animation_curve_close=0.46,1.0,0.29,1
      animation_curve_move=0.46,1.0,0.29,1
      animation_curve_tag=0.46,1.0,0.29,1


      # ==========================================
      # SHADOWS
      # ==========================================

      shadows=1
      layer_shadows=0
      shadow_only_floating=0
      shadows_size=12
      shadows_blur=18
      shadows_position_x=0
      shadows_position_y=2
      shadowscolor=0x00000066


      # ==========================================
      # OPACITY
      # ==========================================
      
      focused_opacity=1.0
      unfocused_opacity=0.96


      # ==========================================
      # LAYOUTS
      # ==========================================

      #settings layout
      #scroller
      scroller_structs=20
      scroller_default_proportion=0.8
      scroller_proportion_preset=0.5,0.8,1.0
      scroller_default_proportion_single=1
      scroller_ignore_proportion_single=0
      scroller_focus_center=0
      scroller_prefer_center=1
      
      #therestoftheshit
      default_mfact=0.60
      default_nmaster=1
      new_is_master=1

      tag_num=9

      bind=SUPER+ALT,S,setlayout,scroller
      bind=SUPER+ALT,T,setlayout,right_tile
      bind=SUPER+ALT,D,setlayout,dwindle
      bind=SUPER+ALT,M,setlayout,monocle
      bind=SUPER+ALT,G,setlayout,grid

      #monocle and stack binds
      bind=SUPER,Tab,focusstack,next
      bind=SUPER+SHIFT,Tab,focusstack,prev

      # ==========================================
      # NOCTALIA COLORS
      # ==========================================

      source=~/.config/mango/noctalia.conf


      # ==========================================
      # PROGRAMS
      # ==========================================

      # terminal
      bind=SUPER,t,spawn,kitty

      # Noctalia launcher
      bind=SUPER,d,spawn,noctalia msg panel-toggle launcher


      # ==========================================
      # WALLPAPERS
      # ==========================================

      # wallpaper picker
      bind=SUPER,w,spawn_shell,noctalia msg panel-toggle wallpaper

      # wallpaper ->
      bind=SUPER+CTRL,Right,spawn_shell,noctalia msg wallpaper-next

      # wallpaper <-
      bind=SUPER+CTRL,Left,spawn_shell,noctalia msg wallpaper-previous

  
      # ==========================================
      # WINDOWS
      # ==========================================

      bind=SUPER,q,killclient
      bind=SUPER,f,togglefullscreen

      # reload Mango config
      bind=SUPER,r,reload_config

      # cycle layouts
      bind=SUPER,n,switch_layout


      # ==========================================
      # FOCUS WINDOWS
      # ==========================================

      bind=SUPER,Left,focusdir,left
      bind=SUPER,Right,focusdir,right
      bind=SUPER,Up,focusdir,up
      bind=SUPER,Down,focusdir,down


      # ==========================================
      # MOVE WINDOWS
      # ==========================================

      bind=SUPER+SHIFT,Left,exchange_client,left
      bind=SUPER+SHIFT,Right,exchange_client,right
      bind=SUPER+SHIFT,Up,exchange_client,up
      bind=SUPER+SHIFT,Down,exchange_client,down


      # ==========================================
      # TAGS
      # ==========================================

      bind=SUPER,1,view,1,0
      bind=SUPER,2,view,2,0
      bind=SUPER,3,view,3,0
      bind=SUPER,4,view,4,0
      bind=SUPER,5,view,5,0
      bind=SUPER,6,view,6,0
      bind=SUPER,7,view,7,0
      bind=SUPER,8,view,8,0
      bind=SUPER,9,view,9,0

      bind=SUPER+SHIFT,1,tag,1,0
      bind=SUPER+SHIFT,2,tag,2,0
      bind=SUPER+SHIFT,3,tag,3,0
      bind=SUPER+SHIFT,4,tag,4,0
      bind=SUPER+SHIFT,5,tag,5,0
      bind=SUPER+SHIFT,6,tag,6,0
      bind=SUPER+SHIFT,7,tag,7,0
      bind=SUPER+SHIFT,8,tag,8,0
      bind=SUPER+SHIFT,9,tag,9,0

   
      # ==========================================
      # SCROLLER CONTROL
      # ==========================================

      scroller_default_proportion=0.8
      scroller_proportion_preset=0.5,0.8,1.0

      bind=SUPER,x,switch_proportion_preset,


      # Втащить / вытащить окно 
      bind=SUPER+ALT,Left,scroller_stack,left
      bind=SUPER+ALT,Right,scroller_stack,right
      bind=SUPER+ALT,Up,scroller_stack,up
      bind=SUPER+ALT,Down,scroller_stack,down


      # ==========================================
      # MOUSE
      # ==========================================

      # Super + LMB = move floating window
      mousebind=SUPER,btn_left,moveresize,curmove

      # Super + RMB = resize floating window
      mousebind=SUPER,btn_right,moveresize,curresize
    '';
  };
}
