
let () =
  let locale = GtkMain.Main.init () in
  let osx = GOSXApplication.osxapplication () in
  let window = GWindow.window ~title:"The example" ~width:300 ~height:200 () in
  let thebox = GPack.vbox ~packing:window#add () in
  let txt = GMisc.label ~text:(osx#executable_path ()) ~packing:thebox#pack () in
  let _ = GText.view ~width:100 ~packing:thebox#pack () in
  let () = osx#ready () in
  let _ = osx#connect#ns_application_open_file ~callback:(fun thefile ->  txt#set_text thefile) in
  let _ = osx#connect#ns_application_block_termination ~callback:(fun _ -> print_string "Au revoir") in
  let _ = window#connect#destroy ~callback:(fun () -> GMain.Main.quit ())  in
  let () = window#show () in
  GMain.Main.main ()
