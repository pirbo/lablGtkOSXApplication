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
    method set_dock_menu : Gtk.menu_shell Gobject.obj -> unit
    method set_menu_bar : Gtk.menu_shell Gobject.obj -> unit
    method set_use_quartz_accelerators : bool -> unit
    method sync_menubar : unit -> unit
    method use_quartz_accelerators : unit -> bool
  end
val osxapplication : unit -> osxapplication
