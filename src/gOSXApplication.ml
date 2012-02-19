open GtkOSXApplication

class osxapplication obj = object
  method get_executable_path () = OSXApplication.get_executable_path obj
end

let osxapplication () = new osxapplication (OSXApplication.create [])
