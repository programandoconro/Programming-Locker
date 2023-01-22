# Run wasm in browser compiling rust with wasm-build

Create rust code and run `wasm-pack build --target web`

Create index.html and call the created js code. Serve pkg directory using `python -m http.server 8080`.

Call WebAssembly code from js using `WebAssembly` object.

Do not forget to wait `init`:

```
init().then((wasm) => {
    let result = wasm.get_month_days(); // wasm function created with Rust
    console.log(result);
    });
```
