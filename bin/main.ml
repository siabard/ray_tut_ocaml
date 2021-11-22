

let window_width = 1280

let window_height = 720

let setup () =
  let open Raylib in
  init_window window_width window_height "my game";
  set_target_fps 60

let rec loop () =
  let open Raylib in
  match window_should_close () with
  | true -> close_window ()
  | false ->
    begin_drawing ();
    clear_background(Color.create 255  0  255  255);
    end_drawing ();
    loop ()


let () = setup() |> loop

