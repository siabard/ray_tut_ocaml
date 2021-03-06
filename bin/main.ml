
let (window_width, window_height) = (1280, 720)

(* game objects *)


(* setup *)
let setup () =
  let open Raylib in
  init_window window_width window_height "my game";
  let texture = load_texture "./assets/GodotPlayer.png" in
  let pos = Vector2.create 0.0 0.0 in
  set_target_fps 60;
  (texture, 0.0, 0 , 0.0, pos)
    


(* game loop *)
let rec loop texture rotation frame timer pos =
  let open Raylib in

  match window_should_close () with
  | true -> close_window ()
  | false ->
    begin_drawing ();
    clear_background(Color.white);

    draw_rectangle 100 100 100 300 Color.red;
    draw_rectangle_v (Vector2.create 300.0  200.0) (Vector2.create 100.0 30.0) Color.blue;

    (*draw_rectangle_rec (Rectangle.create 200.0 200.0 100.0 400.0) Color.green; *)

    let rotation' = if rotation >= 360.0 then 0.0 else rotation +. (get_frame_time () *. 60.0) in
    let pos = if is_key_down Key.W then Vector2.(create (x pos) ((y pos) -. 0.1)) else pos in
    let pos = if is_key_down Key.S then Vector2.(create (x pos) ((y pos) +. 0.1)) else pos in
    draw_rectangle_pro (Rectangle.create 200.0 200.0 100.0 100.0) (Vector2.create 50.0 50.0) (rotation) Color.green;

    draw_circle 400 300 64.0 Color.orange;

    draw_triangle (Vector2.create 50.0  0.0) (Vector2.create 100.0 50.0) (Vector2.create 100.0 0.0) Color.blue;

    draw_rectangle_lines 100 100 100 100 Color.black;
    draw_rectangle_lines_ex (Rectangle.create 100.0 400.0 100.0 100.0) 10 Color.gray;

    draw_poly ( Vector2.create 300.0 300.0 ) 6 20.0 0.0 Color.blue;

    let frame' = if timer >= 0.2 then (frame + 1) mod 2 else frame in
    let timer' = if timer >= 0.2 then 0.0 else timer +. (get_frame_time ()) in

    
    draw_texture_rec texture (Rectangle.create (16.0 *. float_of_int frame) 0.0 16.0 16.0) (Vector2.(create (x pos) (y pos))) Color.white;

    end_drawing ();
    loop texture rotation' frame' timer' pos


let () =
  let (texture, rotation, frame, timer, pos) = setup () in
  loop texture rotation frame timer pos

