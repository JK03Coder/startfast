<script lang="ts">
  import Menu from 'lucide-svelte/icons/menu';
  import Package2 from 'lucide-svelte/icons/package-2';
  
  import { Button } from '$lib/components/ui/button';
  import * as Sheet from '$lib/components/ui/sheet';

  let { children } = $props();
</script>

<div class="flex min-h-screen w-full flex-col">
  <header
    class="sticky z-50 top-0 w-full border-b bg-background"
  >
    <div class="flex max-w-[85rem] mx-auto h-16 w-full gap-4 items-center px-4 md:px-6">
      {#snippet navLink(text: string, href: string = "/", selected: boolean = false)}
        <a
          {href}
          class="transition-colors hover:text-foreground"
          class:text-foreground={selected}
          class:text-muted-foreground={!selected}
        >
          {text}
        </a>
      {/snippet}

      <nav
        class="hidden flex-col gap-6 text-lg font-medium md:flex md:flex-row md:items-center md:gap-5 md:text-base lg:gap-6"
      >
        <a
          href="/"
          class="flex items-center gap-2 text-lg font-semibold md:text-base"
        >
          <Package2 class="h-6 w-6" />
          <span class="sr-only">Acme Inc</span>
        </a>
        {@render navLink("Dashboard", "/dashboard")}
        {@render navLink("Pricing")}
        {@render navLink("Settings", "/", true)}
      </nav>
      <Sheet.Root>
        <Sheet.Trigger asChild let:builder>
          <Button
            variant="outline"
            size="icon"
            class="shrink-0 md:hidden"
            builders={[builder]}
          >
            <Menu class="h-5 w-5" />
            <span class="sr-only">Toggle navigation menu</span>
          </Button>
        </Sheet.Trigger>
        <Sheet.Content side="left">
          <nav class="grid gap-6 text-lg font-medium">
            <a href="/" class="flex items-center gap-2 text-lg font-semibold">
              <Package2 class="h-6 w-6" />
              <span class="sr-only">Acme Inc</span>
            </a>
            {@render navLink("Dashboard", "/dashboard")}
            {@render navLink("Pricing")}
            {@render navLink("Settings", "/", true)}
          </nav>
        </Sheet.Content>
      </Sheet.Root>
      <div class="flex w-full items-center gap-4 md:ml-auto md:gap-2 lg:gap-4">
        <Button class="ml-auto border" variant="secondary" href="/">Sign in</Button>
        <Button href="/">
          Get StartFast
        </Button>
      </div>
    </div>
  </header>

  <main
    class="flex flex-1 flex-col gap-4 bg-muted/40 p-4 md:gap-8 md:p-10"
  >
    {@render children()}
  </main>

  <footer class="w-full border-t">
    <div class="flex h-16 items-center justify-between gap-2 max-w-[85rem] mx-auto px-4 md:px-6">
      <div>
        <p class="text-xs text-muted-foreground">
          &copy; 2024 Startfast.
        </p>
      </div>

      {#snippet footerLink(data: { href: string, text: string })}
        <li class="list-none">
          <a href={data.href} class="underline">
            {data.text}
          </a>
        </li>
      {/snippet}

      <ul class="flex flex-wrap items-center text-xs text-muted-foreground gap-1">
        {@render footerLink({ href: "/", text: "X (Twitter)" })}
        &#x2022;
        {@render footerLink({ href: "/privacy", text: "Privacy Policy" })}
        &#x2022;
        {@render footerLink({ href: "/terms", text: "Terms of Service" })}
      </ul>
    </div>
  </footer>
</div>
