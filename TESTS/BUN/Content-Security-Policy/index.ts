const server = Bun.serve({
  async fetch(req, res) {
    const path = new URL(req.url).pathname;

    // EXAMPLE 1
    if (path === "/example-1") {
      const pathToFile = "example-1.html";
      const file = Bun.file(pathToFile);
      const nonce = 123;
      const resp = new Response(file, {
        headers: {
          // set the CSP
          "Content-Security-Policy": `script-src 'self' 'nonce-${nonce}'`,
        },
      });
      return resp;
    }

    // EXAMPLE 2
    if (path === "/example-2") {
      const pathToFile = "example-2.html";
      const file = Bun.file(pathToFile);
      const nonce = 123;
      const resp = new Response(file, {
        headers: {
          // set the CSP
          // "Content-Security-Policy": `script-src 'self' 'nonce-${nonce}'`,
        },
      });
      return resp;
    }

    return new Response("Page not found", { status: 404 });
  },
});

console.log(`Listening on ${server.url}`);
