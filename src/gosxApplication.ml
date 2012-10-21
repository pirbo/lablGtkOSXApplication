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

open OgtkosxApplicationProps
open GtkosxApplication

class osxapplication_signals (obj : [`application] Gobject.obj) = object
  inherit application_sigs
  method private connect sgn ~callback =
      GtkSignal.connect ~sgn ~callback ~after:false obj
end

class osxapplication obj = object
  val obj = obj
  inherit application_props

  method as_osxapplication = obj
  method connect = new osxapplication_signals obj
  method ready () = Application.ready obj
  method set_help_menu ?(item : GMenu.menu_item option) () = Application.set_help_menu obj
 (match item with None -> None | Some x -> Some x#as_item)
  method set_window_menu ?(item : GMenu.menu_item option) () = Application.set_window_menu obj
 (match item with None -> None | Some x -> Some x#as_item)
  method insert_app_menu_item (mi: GMenu.menu_item) = Application.insert_app_menu_item obj mi#as_widget
  method set_menu_bar (ms: GMenu.menu_shell) = Application.set_menu_bar obj (Gobject.try_cast ms#as_widget "GtkMenuShell")
  method sync_menubar () = Application.sync_menubar obj
  method set_dock_menu (ms: GMenu.menu_shell) = Application.set_dock_menu obj (Gobject.try_cast ms#as_widget "GtkMenuShell")
  method set_dock_icon_pixbuf = Application.set_dock_icon_pixbuf obj
  method set_dock_icon_resource = Application.set_dock_icon_resource obj
  method attention_request = Application.attention_request obj
  method cancel_attention_request = Application.cancel_attention_request obj
  method bundle_path () = Application.get_bundle_path ()
  method resource_path () = Application.get_resource_path ()
  method executable_path () = Application.get_executable_path ()
  method bundle_id () = Application.get_bundle_id ()
  method bundle_info = Application.get_bundle_info
end

let osxapplication () = new osxapplication (Application.create [])
