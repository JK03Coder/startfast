<script lang="ts">
  import { ArrowRight } from 'lucide-svelte';
  import { Button } from '$lib/components/ui/button';
  import * as Accordion from '$lib/components/ui/accordion/index';
  import * as Card from '$lib/components/ui/card';
  import { Checkbox } from '$lib/components/ui/checkbox';
  import { Input } from '$lib/components/ui/input';
  import * as Avatar from '$lib/components/ui/avatar';

  import CircleUser from 'lucide-svelte/icons/circle-user';
  import Menu from 'lucide-svelte/icons/menu';
  import Package2 from 'lucide-svelte/icons/package-2';
  import Search from 'lucide-svelte/icons/search';

  import * as DropdownMenu from '$lib/components/ui/dropdown-menu';
  import * as Sheet from '$lib/components/ui/sheet';

  type UserCard = {
    avatarUrl: string;
    initials: string;
    name: string;
    role: string;
    description: string;
  };
</script>

<div class="flex min-h-screen w-full flex-col">
  <header
    class="sticky z-50 top-0 w-full border-b bg-background"
  >
    <div class="flex max-w-[85rem] mx-auto h-16 w-full gap-4 items-center px-4 md:px-6">
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
        <a
          href="/"
          class="text-muted-foreground transition-colors hover:text-foreground"
        >
          Dashboard
        </a>
        <a
          href="/"
          class="text-muted-foreground transition-colors hover:text-foreground"
        >
          Pricing
        </a>
        <a
          href="/"
          class="text-foreground transition-colors hover:text-foreground"
        >
          Settings
        </a>
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
            <a href="/" class="text-muted-foreground hover:text-foreground">
              Dashboard
            </a>
            <a href="/" class="text-muted-foreground hover:text-foreground">
              Orders
            </a>
            <a href="/" class="text-muted-foreground hover:text-foreground">
              Products
            </a>
            <a href="/" class="text-muted-foreground hover:text-foreground">
              Customers
            </a>
            <a href="/" class="hover:text-foreground"> Settings </a>
          </nav>
        </Sheet.Content>
      </Sheet.Root>
      <div class="flex w-full items-center gap-4 md:ml-auto md:gap-2 lg:gap-4">
        <Button class="ml-auto">Click me</Button>
        <DropdownMenu.Root>
          <DropdownMenu.Trigger asChild let:builder>
            <Button
              builders={[builder]}
              variant="secondary"
              size="icon"
              class="rounded-full"
            >
              <CircleUser class="h-5 w-5" />
              <span class="sr-only">Toggle user menu</span>
            </Button>
          </DropdownMenu.Trigger>
          <DropdownMenu.Content align="end">
            <DropdownMenu.Label>My Account</DropdownMenu.Label>
            <DropdownMenu.Separator />
            <DropdownMenu.Item>Settings</DropdownMenu.Item>
            <DropdownMenu.Item>Support</DropdownMenu.Item>
            <DropdownMenu.Separator />
            <DropdownMenu.Item>Logout</DropdownMenu.Item>
          </DropdownMenu.Content>
        </DropdownMenu.Root>
      </div>
    </div>
  </header>

  <main
    class="flex min-h-[calc(100vh_-_theme(spacing.16))] flex-1 flex-col gap-4 bg-muted/40 p-4 md:gap-8 md:p-10"
  >
    <!-- Hero -->
    <section class="max-w-[85rem] mx-auto px-4 sm:px-6 lg:px-8">
      <!-- Grid -->
      <div class="grid md:grid-cols-2 gap-4 md:gap-8 xl:gap-20 md:items-center">
        <div>
          <h1
            class="block font-bold text-slate-800 text-4xl lg:text-6xl lg:leading-tight"
          >
            Ship your startup in <span class="text-primary">days</span>, not weeks
          </h1>
          <p class="mt-3 text-lg text-slate-800">
            The SvelteKit boilerplate with all you need to build your SaaS, AI
            tool, or any other web app and make your first $ online fast.
          </p>

          <!-- Buttons -->
          <div class="mt-7 grid gap-3 w-full sm:inline-flex">
            <Button href="/">
              Get StartFast
              <ArrowRight />
            </Button>
          </div>
          <!-- End Buttons -->
        </div>
        <!-- End Col -->

        <div class="relative ms-4">
          <img
            class="w-full rounded-md"
            src="https://images.unsplash.com/photo-1711988339530-acce2192fa80?q=80&w=2499&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=700&h=700&q=80"
            alt="Product"
          />
        </div>
      </div>
      <!-- End Grid -->
    </section>
    <!-- End Hero -->

    <section class="max-w-[85rem] mx-auto px-4 sm:px-6 lg:px-8">
      <div
        class="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 gap-6 md:[&>*:nth-child(3n-1)]:translate-y-16"
      >
        {#snippet userCard(user: UserCard)}
          <Card.Root>
            <Card.Header class="flex flex-row gap-4">
              <Avatar.Root>
                <Avatar.Image src={user.avatarUrl} />
                <Avatar.Fallback>{user.initials}</Avatar.Fallback>
              </Avatar.Root>
              <div>
                <Card.Title>{user.name}</Card.Title>
                <Card.Description>{user.role}</Card.Description>
              </div>
            </Card.Header>
            <Card.Content>{user.description}</Card.Content>
          </Card.Root>
        {/snippet}
        {@render userCard({
          avatarUrl: "https://github.com/shadcn.png",
          initials: "JK",
          name: "Justin K",
          role: "Solopreneur",
          description: "Startfast is a the best way to start a new Saas startup"
        })}
        {@render userCard({
          avatarUrl: "https://github.com/shadcn.png",
          initials: "JK",
          name: "Justin K",
          role: "Solopreneur",
          description: "Startfast is a the best way to start a new Saas "
        })}
        {@render userCard({
          avatarUrl: "",
          initials: "JK",
          name: "Justin K",
          role: "Solopreneur",
          description: "Startfast is a the best way to start a new Saas "
        })}
        {@render userCard({
          avatarUrl: "https://github.com/shadcn.png",
          initials: "JK",
          name: "Justin K",
          role: "Solopreneur",
          description: "Startfast is a the best way to start a new Saas "
        })}
        {@render userCard({
          avatarUrl: "",
          initials: "JK",
          name: "Justin K",
          role: "Solopreneur",
          description: "Startfast is a the best way to start a new Saas "
        })}
        {@render userCard({
          avatarUrl: "https://github.com/shadcn.png",
          initials: "JK",
          name: "Justin K",
          role: "Solopreneur",
          description: "Startfast is a the best way to start a new Saas "
        })}
        {@render userCard({
          avatarUrl: "https://github.com/shadcn.png",
          initials: "JK",
          name: "Justin K",
          role: "Solopreneur",
          description: "Startfast is a the best way to start a new Saas "
        })}
      </div>
    </section>

    <!-- FAQ -->
    <section
      class="max-w-none md:max-w-[85rem] md:mx-auto px-4 py-10 sm:px-6 lg:px-8 lg:py-14"
    >
      <!-- Grid -->
      <div class="grid md:grid-cols-5 gap-10">
        <div class="md:col-span-2">
          <div class="max-w-sm">
            <h2 class="text-2xl font-bold md:text-4xl md:leading-tight">
              Frequently asked questions
            </h2>
            <p class="mt-1 text-slate-600">
              Answers to the most frequently asked questions.
            </p>
          </div>
        </div>
        <!-- End Col -->

        <div class="md:col-span-3">
          <!-- Accordion -->
          <Accordion.Root class="w-full">
            <Accordion.Item value="item-1">
              <Accordion.Trigger>Is it accessible?</Accordion.Trigger>
              <Accordion.Content
                >Yes. It adheres to the WAI-ARIA design pattern.</Accordion.Content
              >
            </Accordion.Item>
            <Accordion.Item value="item-2">
              <Accordion.Trigger>Is it styled?</Accordion.Trigger>
              <Accordion.Content>
                Yes. It comes with default styles that matches the other
                components' aesthetic.
              </Accordion.Content>
            </Accordion.Item>
            <Accordion.Item value="item-3">
              <Accordion.Trigger>Is it animated?</Accordion.Trigger>
              <Accordion.Content>
                Yes. It's animated by default, but you can disable it if you
                prefer.
              </Accordion.Content>
            </Accordion.Item>
          </Accordion.Root>
          <!-- End Accordion -->
        </div>
        <!-- End Col -->
      </div>
      <!-- End Grid -->
    </section>
    <!-- End FAQ -->

    <!-- Hero -->
    <section class="max-w-[85rem] mx-auto px-4 sm:px-6 lg:px-8">
      <div class="mx-auto max-w-xl text-center">
        <h1
          class="block text-2xl font-bold text-slate-800 sm:text-3xl lg:text-5xl lg:leading-tight"
        >
          Ship your startup in <span class="text-primary">days</span>, not weeks
        </h1>
        <p class="mt-3 text-lg text-slate-800">
          Don't waste time one Stripe subscriptions or designing a pricing
          section...
        </p>

        <!-- Buttons -->
        <div class="mt-7 flex flex-wrap justify-center gap-4">
          <Button href="/">
            Get StartFast
            <ArrowRight />
          </Button>
        </div>
        <!-- End Buttons -->
      </div>
    </section>
    <!-- End Hero -->
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
        {@render footerLink({ href: "/", text: "Privacy Policy" })}
        &#x2022;
        {@render footerLink({ href: "/", text: "Terms of Service" })}
      </ul>
    </div>
  </footer>
</div>
