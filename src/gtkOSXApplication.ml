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
