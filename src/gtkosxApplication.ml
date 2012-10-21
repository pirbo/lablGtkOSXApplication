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

open GtkosxApplicationProps

external _gtkosx_application_init : unit -> unit = "ml_gtkosx_application_init"
let () = _gtkosx_application_init ()

module Application = struct
  include Application
  external get_bundle_path : unit -> string =
    "ml_gtkosx_application_get_bundle_path"
  external get_resource_path : unit -> string =
    "ml_gtkosx_application_get_resource_path"
  external get_executable_path : unit -> string =
    "ml_gtkosx_application_get_executable_path"
  external get_bundle_id : unit -> string =
    "ml_gtkosx_application_get_bundle_id"
  external get_bundle_info : string -> string =
    "ml_gtkosx_application_get_bundle_info"
end

class virtual application_sigs = object (self)
  method private virtual connect :
    'b. ('a,'b) GtkSignal.t -> callback:'b -> GtkSignal.id
  method ns_application_block_termination =
    self#connect Application.S.ns_application_block_termination
  method ns_application_did_become_active =
    self#connect Application.S.ns_application_did_become_active
  method ns_application_open_file =
    self#connect Application.S.ns_application_open_file
  method ns_application_will_resign_active =
    self#connect Application.S.ns_application_will_resign_active
  method ns_application_will_terminate =
    self#connect Application.S.ns_application_will_terminate
end
