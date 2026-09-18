# Setup guide

How to point this landing page at **your own Appwrite project** and paint it in
**your own brand colour**.

You do not need to know Dart. Two files and one screen in your store panel
cover the whole setup.

---

## Before you start

| You need | How to check |
|---|---|
| Dart SDK 3.10 or newer | `dart --version` |
| The Jaspr CLI | `dart pub global activate jaspr_cli` |
| Your Appwrite project, already seeded by the store panel | You can open its Databases screen |

Add the Jaspr CLI to your `PATH` once, or every command below will say
`jaspr: command not found`:

```sh
export PATH="$PATH:$HOME/.pub-cache/bin"     # add this line to ~/.zshrc or ~/.bashrc
```

Then install the project's dependencies:

```sh
dart pub get
```

---

## Step 1 — Connect it to your Appwrite project

Out of the box this project points at the **demo** backend it shipped with. Until
you change that, your site will show the demo store's name, products and photos.

Open [`lib/data/appwrite_config.dart`](lib/data/appwrite_config.dart) and replace the four
`defaultValue`s with your own:

```dart
const kAppwriteEndpoint = String.fromEnvironment(
  'APPWRITE_ENDPOINT',
  defaultValue: 'https://sgp.cloud.appwrite.io/v1',   // ← your region
);

const kAppwriteProjectId = String.fromEnvironment(
  'APPWRITE_PROJECT_ID',
  defaultValue: '694d7ed80012589bdb9c',               // ← your project id
);

const kAppwriteDatabaseId = String.fromEnvironment(
  'APPWRITE_DATABASE_ID',
  defaultValue: 'food_delivery_db',                   // ← your database id
);

const kAppwriteBucketId = String.fromEnvironment(
  'APPWRITE_BUCKET_ID',
  defaultValue: '694d812100305bf791d7',               // ← your storage bucket id
);
```

Where to find each value in the Appwrite console:

- **Endpoint** — your region's API URL. Singapore is `https://sgp.cloud.appwrite.io/v1`;
  Frankfurt, New York and Sydney have their own. Copy it from *Settings → API credentials*.
  Getting the region wrong is the most common cause of "everything fell back to defaults".
- **Project id** — *Settings → Project ID*
- **Database id** — *Databases*. The store panel creates `food_delivery_db`
- **Bucket id** — *Storage*. The bucket holding product and banner images

### Or: keep the source untouched and pass them at build time

If you would rather not edit the file — handy when one codebase serves several
stores — pass them on the command line instead. These override the defaults above:

```sh
jaspr build \
  --dart-define=APPWRITE_ENDPOINT=https://sgp.cloud.appwrite.io/v1 \
  --dart-define=APPWRITE_PROJECT_ID=your_project_id \
  --dart-define=APPWRITE_DATABASE_ID=food_delivery_db \
  --dart-define=APPWRITE_BUCKET_ID=your_bucket_id
```

### Make the tables readable

The site reads five tables. Each one needs **`Permission.read(Role.any())`** —
in the console, *Table → Settings → Permissions*, add a **Read** row for **Any**:

`business_setup` · `store_setup` · `landing_setup` · `privacy_policy` · `products`

> **Never give this project an API key.** It sends your public project id and
> nothing else. That is safe to publish; an API key is not. There is no setting
> for one, and none should be added.

If a table is missing, unreadable or empty, the build still succeeds and that
section quietly falls back to built-in placeholder text — so a permission you
forgot looks like "my content didn't save" rather than an error. Watch the build
log: every failed read prints a line naming the table.

### Check that it worked

```sh
jaspr serve
```

Open <http://localhost:8080>. Your own store name in the header means you are
connected. If you still see the demo store, re-check the endpoint region and
project id.

---

## Step 2 — Set your brand colour

Open [`lib/theme.dart`](lib/theme.dart) and change one line:

```dart
const kBrandHex = '#C6453E';   // ← your brand colour
```

That is the whole rebrand. Every button, hover state, gradient, badge, shadow,
focus ring and dark-mode tint is derived from this one value with `color-mix()`,
so nothing else needs editing — there is no second colour hiding in a gradient.

Use a **6-digit hex with the `#`** (`'#1E88E5'`). Pick a colour dark enough to
carry white text: it sits behind the main call-to-action buttons.

### Also set the same colour in your store panel

Go to **Settings → Landing Page** and put the identical hex in **Brand colour**.

The panel field drives the `theme-color` meta tag — the tint mobile browsers
paint their address bar with — while `kBrandHex` paints the page itself. Setting
only one of them leaves the phone's browser chrome a different colour from your
site.

> **Known quirk, worth knowing before you debug it.** If the two disagree, the
> **page follows `lib/theme.dart`**, not the panel. Both rules land on `:root`
> with equal weight and `theme.dart` is written second, so it wins. Changing the
> brand colour in the panel alone will *not* recolour the site. Set it in
> `lib/theme.dart` and rebuild; mirror it in the panel so the meta tag agrees.

---

## Step 3 — Fill in your content

Almost everything on the page is read from the same tables your store panel and
apps already use, so there is nothing to re-enter. Fill these in and the page
follows.

**Business Setup** — opening hours, currency symbol, delivery radius, minimum
delivery fee, free-delivery threshold, average delivery time, the Android and
iOS store links, and the copyright line.

The two module switches here decide **how much of the page exists at all**:

| Column | Effect when off |
|---|---|
| `is_food_module_enabled` | The Food card and the Food tab disappear entirely |
| `is_ecommerce_module_enabled` | The Shop card and Shop tab disappear entirely |

**Store Setup** — store name, logo, cover image, city, address, phone, email,
website, and the Facebook / Instagram / X links in the footer.

**Settings → Landing Page** — everything written specifically for this page:
hero badge, title, accent word and subtitle; the headline stats; covered areas;
the Food and Shop card copy; the rider section; app screenshots; your WhatsApp
link; and the four switches that show or hide the delivery, showcase, rider and
app sections.

Four fields on that screen matter more than the rest, and all four ship empty:

| Field | Fill it in or… |
|---|---|
| **Site URL** | your canonical link and share links point at `https://kikomart.example`, a placeholder domain |
| **OG image URL** | pasted links show no preview picture — set a 1200×630 image |
| **Meta title** / **Meta description** | Google shows a generic auto-generated sentence |

**Products** — a product appears under *What's available* when it has
`module_type` set to `food` or `ecommerce`, `is_available` set to `true`, and a
name. Each tab shows four products, taken in descending `order_count` order — so
that column is what decides *which* four, and what "Popular right now" actually
means.

**Policies** — writing Terms, Privacy or About copy in the panel creates
`/terms`, `/privacy` and `/about` as real pages at the next build. Leave one
blank and that page is simply never generated.

---

## Step 4 — Replace the brand assets

All of these live in [`web/images/`](web/images/):

| File | Used for |
|---|---|
| `logo.png` | the source for every icon below |
| `app-food.png`, `app-shop.png` | the phone mockups in the download section |

After replacing `logo.png`, regenerate the five icon sizes in [`web/`](web/) from
it — `favicon-32.png`, `favicon-96.png`, `icon-192.png`, `icon-512.png` and
`apple-touch-icon.png`. Two details are easy to get wrong:

- **Centre the logo on a square canvas**, don't stretch it. A wide logo squeezed
  into a square favicon comes out visibly distorted.
- **Give `apple-touch-icon.png` a white background.** iOS composites a
  transparent icon onto black.

The food and shelf photography ships as placeholders. Replacing it with photos of
your own kitchen and stock is the single biggest credibility difference on the
page.

---

## Step 5 — Run it locally

```sh
jaspr serve      # http://localhost:8080, reloads as you edit
```

---

## Step 6 — Build and publish

```sh
jaspr build      # writes the finished site to build/jaspr/
```

Everything in `build/jaspr/` is plain HTML, CSS, JS and images. Upload it to any
static host — cPanel or shared hosting, Firebase Hosting, Netlify, S3, Cloudflare
Pages. No Dart, no Node and no server is needed to run it.

### If you deploy to Firebase

[`.firebaserc`](.firebaserc) ships pointing at the vendor's demo project. **Change
it to your own before your first deploy**, or you will overwrite that demo:

```json
{ "projects": { "default": "your-firebase-project-id" } }
```

Then:

```sh
jaspr build && firebase deploy
```

Run the build **every time**, in that order. `firebase deploy` on its own only
uploads whatever is already sitting in `build/jaspr`, so deploying without
rebuilding re-publishes your previous snapshot and looks exactly like the change
you just made in the panel was ignored.

---

## How updates reach the page

The page renders twice, and that is what lets you host it on plain static hosting
and still have live content:

1. **At build time**, `jaspr build` reads Appwrite and writes the result straight
   into `index.html`. That is what Google, WhatsApp and Facebook read — they see
   real content without running any JavaScript.
2. **On every page load**, the browser re-reads Appwrite and refreshes the page
   in place. It starts from a copy of the data embedded in the HTML, so the first
   frame matches exactly with no flicker, then swaps in anything you have changed
   since.

So for day-to-day edits — prices, hero copy, areas, opening hours — **edit in the
panel and reload the page**. No rebuild, no redeploy.

**Three things only update on a rebuild**, because crawlers and chat apps read
them straight from the HTML: the browser-tab title, the meta description, and the
link-preview (Open Graph) tags. Those rarely change. If you rename your business,
rebuild once so your link previews catch up.

If Appwrite is unreachable, the refresh does nothing and the built-in content
stays on screen — an outage shows a slightly stale page, never a broken one.

---

## Troubleshooting

**The site shows the demo store, not mine.** Step 1 was skipped or the endpoint
region is wrong. Re-check the endpoint URL, project id and database id, then
rebuild.

**Everything shows placeholder text.** The tables are not readable. Add
`Permission.read(Role.any())` to all five, then check the build log — each failed
read names its table.

**I changed the brand colour in the panel and nothing happened.** Expected —
see the quirk in Step 2. Change `kBrandHex` in `lib/theme.dart` and rebuild.

**"What's available" is empty.** No product in that module has
`is_available: true`, or the matching module is switched off in Business Setup.

**A whole section is missing.** Either its switch is off under *Settings →
Landing Page*, or — for the Food or Shop half — the matching module is disabled
in Business Setup.

**I edited the panel and deployed, but the live site is unchanged.** You deployed
without rebuilding. Run `jaspr build` first, then `firebase deploy`.

**Pasting my link in WhatsApp shows no preview image.** Set **OG image URL**
under *Settings → Landing Page* to a 1200×630 picture, then rebuild.
