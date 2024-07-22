import adapter from "@sveltejs/adapter-static";
import { vitePreprocess } from "@sveltejs/vite-plugin-svelte";

/** @type {import('@sveltejs/kit').Config} */
const config = {
  preprocess: [vitePreprocess({})],

  kit: {
    // adapter-static, see https://kit.svelte.dev/docs/adapter-static for more info.
    adapter: adapter({
      pages: 'pb/pb_public',
      assets: 'pb/pb_public',
      fallback: 'index.html',
      precompress: false,
      strict: true,
    }),
  },
};

export default config;
