
let () =
  let locale = GtkMain.Main.init () in
  let osx = GOSXApplication.osxapplication () in
  let window = GWindow.window ~title:"The example" ~width:100 ~height:100 () in
  let _ = GMisc.label ~text:(osx#get_executable_path ()) ~packing:window#add () in
(*  let () = osx#connect#block_termination ~callback:(fun _ -> print_string "Au revoir" ; false) in*)
  let _ = window#connect#destroy ~callback:(fun () -> GMain.Main.quit ())  in
  let () = window#show () in
  GMain.Main.main ()
