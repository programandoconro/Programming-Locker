import { watch } from "fs";

const watcher = watch(import.meta.dir, (event, filename) => {
  console.log(`Detected ${event} in ${filename}`);
});
