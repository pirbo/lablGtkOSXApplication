open GtkOSXApplication

class osx_application_signals (obj : [`osxapplication] Gobject.obj) = object
  inherit osx_application_sigs
  method private connect sgn ~callback =
      GtkSignal.connect ~sgn ~callback ~after:false obj
end

class osxapplication obj = object
  method connect = new osx_application_signals obj
  method ready () = OSXApplication.ready obj
  method executable_path () = OSXApplication.get_executable_path obj
end

let osxapplication () = new osxapplication (OSXApplication.create [])
