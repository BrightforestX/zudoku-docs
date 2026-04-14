/**
 * After `pnpm exec zudoku build` fails at prerender (or stops before cleanup),
 * run: node scripts/find-prerender-fail.mjs
 * Finds the first static route whose SSR render throws.
 */
import { existsSync, readFileSync } from "node:fs";
import path from "node:path";
import { fileURLToPath } from "node:url";
import { pathToFileURL } from "node:url";

const __dirname = path.dirname(fileURLToPath(import.meta.url));
const docsRoot = path.join(__dirname, "..");
const distServer = path.join(docsRoot, "dist", "server");
const indexHtml = path.join(docsRoot, "dist", "index.html");
const joinUrlMod = path.join(
  docsRoot,
  "node_modules/zudoku/src/lib/util/joinUrl.js",
);

if (!existsSync(path.join(distServer, "entry.server.js"))) {
  console.error("Missing dist/server/entry.server.js — run a build that produces the SSR bundle first.");
  process.exit(1);
}
if (!existsSync(indexHtml)) {
  console.error("Missing dist/index.html");
  process.exit(1);
}

const { joinUrl } = await import(pathToFileURL(joinUrlMod).href);
const entryUrl = pathToFileURL(path.join(distServer, "entry.server.js")).href;
const configUrl = pathToFileURL(path.join(distServer, "zudoku.config.js")).href;

const template = readFileSync(indexHtml, "utf8");
const server = await import(entryUrl);
const config = (await import(configUrl)).default;
const routes = server.getRoutesByConfig(config);

function routesToPaths(routeList) {
  const paths = [];
  const addPaths = (rs) => {
    for (const route of rs) {
      if (route.path?.includes("*") || route.path?.includes(":")) continue;
      if (route.path && /^\d+$/.test(route.path)) continue;
      if (route.path) {
        paths.push(route.path.startsWith("/") ? route.path : `/${route.path}`);
      }
      if (route.children) addPaths(route.children);
    }
  };
  addPaths(routeList);
  return paths;
}

class InMemoryResponse {
  resolve = () => {};
  resolved = new Promise((res) => {
    this.resolve = res;
  });
  buffer = "";
  redirectedTo;
  statusCode = 200;
  set() {}
  status(s) {
    this.statusCode = s;
  }
  on() {}
  redirect(status, url) {
    this.statusCode = status;
    this.redirectedTo = url;
    void this.end();
  }
  async send(chunk) {
    this.write(chunk);
    await this.end();
  }
  write(chunk) {
    this.buffer += chunk;
  }
  async end(chunk = "") {
    this.buffer += chunk;
    this.resolve();
  }
  isSent() {
    return this.resolved;
  }
}

const paths = routesToPaths(routes);
const basePath = config.basePath ?? "";

console.error(`Testing ${paths.length} paths (basePath=${JSON.stringify(basePath)})...`);

let i = 0;
for (const urlPath of paths) {
  i++;
  const pathname = joinUrl(basePath, urlPath);
  const url = joinUrl("http://localhost", pathname);
  const response = new InMemoryResponse();
  try {
    await server.render({
      template,
      request: new Request(url),
      response,
      routes,
      basePath,
    });
    await response.isSent();
    if (response.statusCode >= 500) {
      console.error(`\nFAIL (status ${response.statusCode}): ${urlPath}`);
      process.exit(1);
    }
    if (i % 20 === 0) process.stderr.write(`  ${i}/${paths.length}\r`);
  } catch (e) {
    console.error(`\nFAIL: ${urlPath}`);
    console.error(e);
    process.exit(1);
  }
}

console.error("\nAll paths rendered without throw.");
