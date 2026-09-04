# Kiko Mart — storefront landing page

The public marketing site that ships with Kiko Mart. This is the page a store
owner shares with **their customers** — pasted into WhatsApp and Facebook,
linked from an Instagram bio and a Google Business Profile, printed as a QR
code on packaging.

It is not a sales page for the software. Every word on it is written for a
shopper deciding whether to order dinner — or a new pair of headphones — from you.

Built with [Jaspr](https://jaspr.site) in `static` mode: one pre-rendered HTML
page, no backend, no API calls, no database.

## What the page does

The section order answers a local visitor's questions in the order they
actually ask them:

| # | Their question | Section |
|---|---|---|
| 1 | What is this? | Hero |
| 2 | Is it any good? | Reassurance strip |
| 3 | **Do you deliver to me?** | Where we deliver |
| 4 | What can I buy? | Food & Shop → Popular right now |
| 5 | How does it reach me? | How it works → Tracked to your door |
| 6 | How do I order? | Get the app (Web / Android / iPhone) |
| 7 | Can I reach a human? | Footer |

Question 3 sits high on purpose. In radius-based delivery, a visitor who reads
the whole page before discovering they're outside your zone is a wasted click.

Ordering is presented as **three equal paths** — web, Android, iPhone. On a
phone the web card moves to the top, because a first-time visitor who has
installed nothing can act immediately.

## Where the content comes from

The page is **data-driven**. It reads from the same Appwrite database the store
panel and customer apps use, at build time, and bakes the result into static
HTML — so the content is live but the site still deploys as plain files with
full SEO and working link previews.

| Shown on the page | Read from |
|---|---|
| Business name, opening hours, currency | `business_setup` / `store_setup` |
| Delivery radius, fee, free-delivery threshold | `business_setup` |
| Android / iOS app links | `business_setup.android_store_url` / `ios_store_url` |
| **Which of Food / Shop appears at all** | `business_setup.is_food_module_enabled` / `is_ecommerce_module_enabled` |
| Address, phone, email, socials | `store_setup` |
| Popular products in each tab | `products`, ordered by `order_count` |
| Everything else (hero copy, areas, screenshots, SEO, brand colour) | `landing_setup` |

Edit the last one on **Settings → Landing Page** in the store panel. The rest is
already maintained on the Store Setup and Business Setup screens — the landing
page reads them so the two can never drift apart.

### First-time setup

1. Run the seed script once so the `landing_setup` table exists:
   `dart run lib/scripts/seed_database.dart` (in the store panel repo)
2. Fill in **Settings → Landing Page**
3. Rebuild this site: `jaspr build`

Content changes need a rebuild, because the data is baked in at build time.
To make edits appear instantly instead, switch `jaspr: mode:` in `pubspec.yaml`
from `static` to `server` and host it on a Dart-capable runtime — the data code
is identical either way and needs no changes.

### Pointing it at your own Appwrite

Defaults live in `lib/data/appwrite_config.dart`. Override per deployment
without editing source:

```sh
jaspr build \
  --dart-define=APPWRITE_ENDPOINT=https://sgp.cloud.appwrite.io/v1 \
  --dart-define=APPWRITE_PROJECT_ID=your_project_id \
  --dart-define=APPWRITE_DATABASE_ID=food_delivery_db \
  --dart-define=APPWRITE_BUCKET_ID=your_bucket_id
```

The site sends **only the public project id**. It never uses an API key, and it
must not be given one — the tables it reads are all `Permission.read(Role.any())`.

**If Appwrite is unreachable, not yet seeded, or half-filled, the build still
succeeds** and every missing field falls back to the defaults below. Watch the
build log: each failed read prints a warning naming the table.

## Making it yours

The store panel is the normal way to edit content. The files below are the
fallbacks used before anything is configured.

### 1. `lib/theme.dart` — colours

Change `kBrandHex`:

```dart
const kBrandHex = '#E94B1B';   // ← your brand colour
```

Every hover shade, tint, gradient, shadow and focus ring is derived from it
with `color-mix()`, so one edit recolours the entire site including dark mode.
Nothing else needs touching unless you want to change the neutrals.

### 2. `lib/content/site_content.dart` — words and numbers

Your name, city, address, opening hours, delivery radius, covered areas,
delivery fees, and the headline stats.

Keep the numbers honest. A customer told "32 min" who waits 70 does not order
a second time.

### 3. `lib/content/site_links.dart` — destinations

Your web app, app store listings, phone, email, socials. Anything left as `'#'`
renders as a visibly disabled control rather than a dead link — the store
badges, for instance, say "Coming soon to App Store" until you fill them in.

### App screenshots

`web/images/app-food.png` and `web/images/app-shop.png` are the phone mockups
in the download section. Replace them whenever your app UI changes — they are
the fastest-dating asset on the page. Portrait screenshots around 560px wide
work well; the frame handles the rounding and the notch.

### Also worth doing

- **Share image.** Replace `_ogImage` in `lib/main.server.dart` with your own
  1200×630 picture. This is what people see when your link is pasted into a
  chat — a share with no image gets far fewer taps.
- **Your own domain.** Point a real domain at this rather than a `web.app`
  subdomain. A stranger deciding whether to trust a link notices.
- **Store badges.** Apple and Google require their *official* badge artwork on
  published listings and forbid recolouring it. The custom pills here match the
  site and are fine for marketing, but swap in the official assets before you
  submit your apps.
- **Photography.** Images are currently hotlinked from Unsplash as placeholders.
  Replace them with photos of your own food and shelves — it is the single
  biggest credibility difference on the page.

## Running it

```sh
dart pub global activate jaspr_cli
export PATH="$PATH:$HOME/.pub-cache/bin"   # add to ~/.zshrc to persist
dart pub get

jaspr serve      # http://localhost:8080, hot reload
jaspr build      # static output in build/jaspr/
```

## How the styling is organised

Jaspr writes CSS in Dart. Two rules keep that from turning into a mess:

1. **Anything shared lives in `lib/ui_kit.dart`** — `.container`, `.section`,
   `.btn*`, `.card`, `.chip`, `.icon-tile`. Anything section-local is prefixed
   with its section: `hero-`, `zone-`, `split-`, `showcase-`, `tracking-`,
   `getapp-`. If you find yourself using an unprefixed class inside one
   section, it belongs in the kit.
2. **`lib/theme.dart` and `lib/ui_kit.dart` must stay at `lib/` root.** Jaspr
   sorts `lib/*.dart` styles *before* `lib/components/*`, which is what lets a
   component override a primitive. Moving them into a subfolder inverts the
   cascade.

### Media queries — read this before adding one

Write them with the typed API:

```dart
css.media(MediaQuery.screen(maxWidth: bpLg.px), [
  css('.hero-container').styles(/* ... */),
]),
```

**Do not** write `css('@media (max-width: 992px)').styles(raw: {...})`. That
form compiles and looks right in Dart, but renders as CSS *declarations* inside
an at-rule that expects *rules* — and the browser silently discards the entire
block. The page had 29 of these and no working responsive layout at all.

Breakpoints are four constants in `lib/theme.dart`: `bpSm` 520, `bpMd` 768,
`bpLg` 992, `bpXl` 1200. Navigation and the hero both switch at `bpLg`.

## Notes

- **Only the navbar is interactive.** It is the single `@client` island
  (theme toggle, mobile menu). The Food/Shop tabs run on hidden radio inputs
  and a sibling selector, so they work with JavaScript disabled.
- **Icons are inline SVG** (`lib/components/ui/icons.dart`), stroked with
  `currentColor`. That is why dark mode needs no icon rules.
- **Deploying:** `.firebaserc` currently points at `food-app-c2fe8`, which is
  the same Firebase project hosting the Kiko Mart demo web app. Point it at
  your own project before running `firebase deploy`, or you will overwrite it.
