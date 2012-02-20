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

open GtkOSXApplicationProps

external _gtk_osxapplication_init : unit -> unit = "ml_gtk_osxapplication_init"
let () = _gtk_osxapplication_init ()

module OSXApplication = OSXApplication

class virtual osx_application_sigs = object (self)
  method private virtual connect :
    'b. ('a,'b) GtkSignal.t -> callback:'b -> GtkSignal.id
  method ns_application_block_termination =
    self#connect OSXApplication.S.ns_application_block_termination
  method ns_application_did_become_active =
    self#connect OSXApplication.S.ns_application_did_become_active
  method ns_application_open_file =
    self#connect OSXApplication.S.ns_application_open_file
  method ns_application_will_resign_active =
    self#connect OSXApplication.S.ns_application_will_resign_active
end
