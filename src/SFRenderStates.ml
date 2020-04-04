type u

external create:
  ?blendMode:SFBlendMode.t ->
  ?transform:SFTransform.t ->
  ?texture:SFTexture.t ->
  ?shader:SFShader.t ->
  unit -> u
  = "caml_create_sfRenderStates"

external destroy: u -> unit = "caml_sfRenderStates_destroy"

(* ================ *)

type t = { u:u; s:string }

let destroy states =
  destroy states.u

let create ?blendMode ?transform ?texture ?shader () =
  let u = create ?blendMode ?transform ?texture ?shader () in
  let t = { u = u; s = " " } in
  Gc.finalise destroy t;
  (t)
