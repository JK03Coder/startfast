# Startfast Saas Template

Everything you need to build a Saas project, powered by [pocketbase](https://pocketbase.io).

## Cloning this project

Clone the project how you would any other project on GitHub.

```bash
# clone this project in the current directory
git clone git@github.com:JK03Coder/startfast.git

# clone this project in my-app
git clone git@github.com:JK03Coder/startfast.git my-app
```

## Developing

Once you've cloned a project and installed dependencies with `bun install` start a development server:

```bash
bun run dev

# or start the server and open the app in a new browser tab
bun run dev -- --open
```

## Building

To test a production version of your app locally:

```bash
# the build output is in pb/pb_public
bun run build
```

You can preview the production build with `bun run preview`. Then going to [`localhost:4173`](http://localhost:4173). This is running locally through the pocketbase executable. By the way this pocketbase executable is for amd64 linux so if you're developing on a different system then download the correct version from the [pocketbase docs](https://pocketbase.io/docs/).

## Production

You can use the provided docker-compose or Dockerfile how you want. I connect my GitHub project to a self hosted [Coolify](https://coolify.io) instance to automatically deploy through docker-compose. You can also use the docker files to test how your site will be in production as well.