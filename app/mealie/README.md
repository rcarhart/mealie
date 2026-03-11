# Mealie

[Mealie](https://mealie.io) is a self-hosted recipe manager and meal planner. My wife and I use it to keep all of our recipes in one place, organize them into cookbooks, and build out our grocery lists together before shopping.

## What we use it for

- **Recipes** — importing recipes from the web, adding our own, and keeping everything organized with tags and categories
- **Cookbooks** — grouping recipes into themed collections (weeknight dinners, holiday baking, etc.)
- **Grocery lists** — building shared shopping lists directly from meal plans so we're both on the same page at the store
- **Meal planning** — scheduling out the week so we know what we're cooking and what we need to buy

## Running it

```bash
docker compose up -d
```

Environment variables are loaded from `.env` — copy `.env.example` if starting fresh and fill in your values.

## Stack

| Service | Image |
|---------|-------|
| Mealie  | `ghcr.io/mealie-recipes/mealie:v3.12.0` |

## Data

All recipe data, images, cookbooks, and the database are persisted in the `./data` directory (excluded from git).
