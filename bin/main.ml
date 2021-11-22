

let (window_width, window_height) = (1280, 720)

let setup () =
  let open Raylib in
  init_window window_width window_height "my game";
  set_target_fps 60

let rotation = ref 0.0


let rec loop () =
  let open Raylib in

  match window_should_close () with
  | true -> close_window ()
  | false ->
    begin_drawing ();
    clear_background(Color.white);

    draw_rectangle 100 100 100 300 Color.red;
    draw_rectangle_v (Vector2.create 300.0  200.0) (Vector2.create 100.0 30.0) Color.blue;

    (*draw_rectangle_rec (Rectangle.create 200.0 200.0 100.0 400.0) Color.green; *)

    rotation := (!rotation) +. 0.5;
    draw_rectangle_pro (Rectangle.create 200.0 200.0 100.0 100.0) (Vector2.create 0.0 0.0) (!rotation) Color.green;
    end_drawing ();
    loop ()


let () = setup() |> loop

