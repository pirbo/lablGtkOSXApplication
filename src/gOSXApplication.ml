(* LablGtkOSXApplication *)
(* Copyright (C) 2012 Pierre Boutillier *)

(* This library is free software; you can redistribute it and/or *)
(* modify it under the terms of the GNU Lesser General Public *)
(* License as published by the Free Software Foundation; *)
(* version 2.1 of the License. *)

(* This library is distributed in the hope that it will be useful, *)
(* but WITHOUT ANY WARRANTY; without even the implied warranty of *)
(* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU *)
(* Lesser General Public License for more details. *)

(* You should have received a copy of the GNU Lesser General Public *)
(* License along with this library; if not, write to the Free Software *)
(* Foundation, Inc., 51 Franklin Street, Fifth Floor, *)
(* Boston, MA  02110-1301  USA *)

open GtkOSXApplication

class osx_application_signals (obj : [`osxapplication] Gobject.obj) = object
  inherit osx_application_sigs
  method private connect sgn ~callback =
      GtkSignal.connect ~sgn ~callback ~after:false obj
end

class osxapplication obj = object
  method connect = new osx_application_signals obj
  method ready () = OSXApplication.ready obj
  method cleanup () = OSXApplication.cleanup obj
  method set_use_quartz_accelerators = OSXApplication.set_use_quartz_accelerators obj
  method use_quartz_accelerators () = OSXApplication.use_quartz_accelerators obj
  method set_menu_bar = OSXApplication.set_menu_bar obj
  method sync_menubar () = OSXApplication.sync_menubar obj
  method set_dock_menu = OSXApplication.set_dock_menu obj
  method set_dock_icon_pixbuf = OSXApplication.set_dock_icon_pixbuf obj
  method set_dock_icon_resource = OSXApplication.set_dock_icon_resource obj
  method attention_request = OSXApplication.attention_request obj
  method cancel_attention_request = OSXApplication.cancel_attention_request obj
  method bundle_path () = OSXApplication.get_bundle_path obj
  method resource_path () = OSXApplication.get_resource_path obj
  method executable_path () = OSXApplication.get_executable_path obj
  method bundle_id () = OSXApplication.get_bundle_id obj
  method bundle_info = OSXApplication.get_bundle_info obj
end

let osxapplication () = new osxapplication (OSXApplication.create [])
