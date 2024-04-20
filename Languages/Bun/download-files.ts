// This script downloads my security camera videos for backup purposes

console.log("init");

const BASE_URL = "http://192.168.11.4:8082";

(async function main() {
  const dirPaths = await getPaths(BASE_URL);
  dirPaths.forEach(getFiles);
})();

async function getPaths(url: string) {
  const response = await fetch(url);
  const pageText = await response.text();
  const textLines = pageText.split("\n");

  const paths = textLines.reduce((acc, line) => {
    if (line.match("href")) {
      const path = line.split('"')[1];
      console.log(path);
      acc.push(path);
    }

    return acc;
  }, [] as string[]);

  return paths;
}

async function getFiles(dirPath: string) {
  const dirUrl = `${BASE_URL}/${dirPath}`;
  const paths = await getPaths(dirUrl);
  paths.forEach((path) => {
    const fullUrl = dirUrl + path;
    fetchFiles(fullUrl, path);
  });
}

async function fetchFiles(url: string, name: string) {
  const response = await fetch(url);
  const path = `security_cam_videos/${name}`;
  try {
    const exists = await Bun.file(path).exists();
    if (exists) {
      console.log(`${name} file already exists`);
      return;
    }
    writeFile(path, response);
    console.log(`Successfully saved ${name}`);
  } catch (e) {
    console.error(e);
  }
}

async function writeFile(path: string, response: Response) {
  Bun.write(path, response);
}
