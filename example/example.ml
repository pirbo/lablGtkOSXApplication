let info_menu osx label =
  let title = GMenu.menu_item ~label:"Print info" () in
  let menu = GMenu.menu () in
  let path = GMenu.menu_item ~label:"bundle path" ~packing:menu#append () in
  let resource = GMenu.menu_item ~label:"resource path" ~packing:menu#append () in
  let executable = GMenu.menu_item ~label:"executable path" ~packing:menu#append () in
  let id = GMenu.menu_item ~label:"bundle id" ~packing:menu#append () in
  let info = GMenu.menu_item ~label:"bundle info version" ~packing:menu#append () in
  let _ = path#connect#activate (fun () -> label#set_text (osx#bundle_path ())) in
  let _ = resource#connect#activate (fun () -> label#set_text (osx#resource_path ())) in
  let _ = executable#connect#activate (fun () -> label#set_text (osx#executable_path ())) in
  let _ = id#connect#activate (fun () -> label#set_text (osx#bundle_id ())) in
  let _ = info#connect#activate (fun () -> label#set_text (osx#bundle_info "CFBundleVersion")) in
  let () = title#set_submenu menu in
  title

let help_menu label =
  let title = GMenu.menu_item ~label:"SOS" () in
  let menu = GMenu.menu () in
  let () = title#set_submenu menu in
  let question = GMenu.menu_item ~label:"What's for ?" ~packing:menu#append () in
  let _ = question#connect#activate (fun () -> label#set_text "Nothing !!!") in
  title

let themenus osx label =
  let bar = GMenu.menu_bar () in
  let play_title = GMenu.menu_item ~packing:bar#append ~label:"playground" () in
  let play = GMenu.menu () in
  let () = play#append (info_menu osx label) in
  let () = play_title#set_submenu play in
  bar

let att_req = ref None

let get_attention osx () =
  let () = Glib.usleep 5000000 in
  att_req := Some (osx#attention_request `CRITICAL_REQUEST)

let drop_attention osx () =
  match !att_req with
    | None -> ()
    | Some id ->
      let () = osx#cancel_attention_request id in
      att_req := None

let () =
  let locale = GtkMain.Main.init () in
  let osx = GOSXApplication.osxapplication () in
  let window = GWindow.window ~title:"The example" ~width:300 ~height:200 () in
  let thebox = GPack.vbox ~packing:window#add () in
  let txt = GMisc.label ~text:"No info to show" ~packing:thebox#pack () in
  let status = GMisc.label ~text:"Lost in space" ~packing:thebox#pack () in
  let menu_b = themenus osx txt in
  let help_m = help_menu txt in
  let () = menu_b#append help_m in
  let () = osx#set_menu_bar (menu_b) in
  let () = osx#set_help_menu ~item:help_m () in
  let () = osx#set_window_menu () in
  let () = osx#ready () in
  let _ = osx#connect#ns_application_open_file ~callback:(fun thefile ->  txt#set_text thefile) in
  let _ = osx#connect#ns_application_did_become_active ~callback:(drop_attention osx) in
  let _ = osx#connect#ns_application_will_resign_active ~callback:(get_attention osx) in
  let _ = osx#connect#ns_application_block_termination ~callback:(fun _ -> Format.printf "Bye\n%!") in
  let _ = window#connect#destroy ~callback:(fun () -> GMain.Main.quit ()) in
  let () = window#show () in
  GMain.Main.main ()
