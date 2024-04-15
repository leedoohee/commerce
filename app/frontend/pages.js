import Layout from "./Layouts/default.vue";

const pages = import.meta.env.SSR
  ? import.meta.globEagerDefault("./Pages/**/*.vue", { eager: true })
  : import.meta.glob("./Pages/**/*.vue", { eager: true });

export async function resolvePage(name) {
  const page = pages[`./Pages/${name}.vue`];
  const show_page = String(name).split("/")[1] == "show" ? true : false;

  if (!page) {
    throw new Error(
      `Unknown page ${name}. Is it located under Pages with a .vue extension?`,
    );
  }

  if (!(name.startsWith("login/") || show_page)) {
    page.default.layout = page.default.layout || Layout;
  }

  return import.meta.env.SSR ? page : (await page).default;
}
