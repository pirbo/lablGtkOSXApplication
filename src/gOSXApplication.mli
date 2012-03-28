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

class osx_application_signals :
  [ `osxapplication ] Gobject.obj ->
  object
    method private connect :
      'a.
        ([ `osxapplication ], 'a) GtkSignal.t -> callback:'a -> GtkSignal.id
    method ns_application_block_termination :
      callback:(unit -> unit) -> GtkSignal.id
    method ns_application_did_become_active :
      callback:(unit -> unit) -> GtkSignal.id
    method ns_application_open_file :
      callback:(string -> unit) -> GtkSignal.id
    method ns_application_will_resign_active :
      callback:(unit -> unit) -> GtkSignal.id
  end
class osxapplication :
  [ `osxapplication ] Gobject.obj ->
  object
    method attention_request : GtkosxapplicationEnums.attention_type -> int
    method bundle_id : unit -> string
    method bundle_info : string -> string
    method bundle_path : unit -> string
    method cancel_attention_request : int -> unit
    method cleanup : unit -> unit
    method connect : osx_application_signals
    method executable_path : unit -> string
    method ready : unit -> unit
    method resource_path : unit -> string
    method set_dock_icon_pixbuf : GdkPixbuf.pixbuf -> unit
    method set_dock_icon_resource : string -> string -> string -> unit
    method set_dock_menu : GMenu.menu_shell -> unit
    method set_menu_bar : GMenu.menu_shell -> unit
    method set_use_quartz_accelerators : bool -> unit
    method sync_menubar : unit -> unit
    method use_quartz_accelerators : unit -> bool
  end
val osxapplication : unit -> osxapplication
