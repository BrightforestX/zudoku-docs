import reactDocgenTypescript from "@joshwooding/vite-plugin-react-docgen-typescript";
import { defineConfig } from "vite";

export default defineConfig({
  // ZUPLO_PUBLIC_* is required by @zuplo/zudoku-plugin-monetization (e.g. deployment name).
  envPrefix: ["VITE_", "ZUDOKU_", "ZUPLO_PUBLIC_"],
  define: {
    "process.env.ZUDOKU_PUBLIC_DOMAIN": JSON.stringify(
      process.env.ZUDOKU_PUBLIC_DOMAIN ?? "",
    ),
  },
  optimizeDeps: {
    include: ["motion/react"],
  },
  plugins: [
    reactDocgenTypescript({
      savePropValueAsString: true,
      include: ["./node_modules/zudoku/src/lib/ui/*.tsx"],
      tsconfigPath: "./tsconfig.json",
      setDisplayName: true,
      EXPERIMENTAL_useWatchProgram: false,
    }),
  ],
});
