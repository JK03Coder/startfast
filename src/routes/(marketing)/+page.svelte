<script lang="ts">
  import { Button } from '$lib/components/ui/button';
  import * as Accordion from '$lib/components/ui/accordion/index';
  import * as Card from '$lib/components/ui/card';
  import * as Avatar from '$lib/components/ui/avatar';

  type UserCard = {
    avatarUrl: string;
    initials: string;
    name: string;
    role: string;
    description: string;
  };
</script>

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
      </Button>
    </div>
    <!-- End Buttons -->
  </div>
</section>
<!-- End Hero -->
