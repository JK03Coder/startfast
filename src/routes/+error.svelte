<script lang="ts">
  import { page } from '$app/stores';
  import { Button } from '$lib/components/ui/button';
</script>

<div class="flex flex-col flex-1 items-center justify-center">
  <h1 class="font-bold" style="font-size: 3rem;">{$page.status}</h1>
  <p class="mb-4">{$page.error?.message}</p>
  <Button variant='link' href='/'>Back to Home</Button>
</div>
