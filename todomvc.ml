open Js_of_ocaml

let data = object%js
  val message = string "Hello Vue.js!"
end

let methods = Mjs.L [
  "reverseMessage", Mjs.to_any (wrap_meth_callback (fun this () ->
      let s = Js.to_string this##.message in
      let n = String.length s in
      let s = String.mapi (fun i _c -> String.get s (n-i-1)) s in
      this##.message := Js.string s ]

let () =
  Vue_js.make ~data ~methods "app"
