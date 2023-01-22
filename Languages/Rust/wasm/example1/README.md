# Run rust compiled Web Assembly code in the browser 

Install `wasm-pack` with:

```
cargo install wasm-pack --features curl/static-curl
```
Compile rust code to wasm with `wasm-pack build`

Note: To solve CORS problems to access the wasm file in the browser, create a server in the working directory using:

```
python -m http.server 8080
```
