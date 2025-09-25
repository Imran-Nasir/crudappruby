
A tiny, **single-file** CRUD API that stores items in memory. This README explains how to run it locally and how to upload the project to GitHub step-by-step.

---

## Files in this repository

* `app.rb` — the  app
* `README.md` — this file
* (optional) `Gemfile` — example provided in the README
* (optional) `.gitignore` — example provided in the README

---

## Prerequisites

* Ruby installed (recommended 2.7+ or 3.x). Check with:

```bash
ruby -v
```

* (Optional) Bundler if you want to use a `Gemfile`:

```bash
gem install bundler
```

---

## Quick start — run the app (no Bundler)

1. From the project folder (where `app.rb` lives) run:

```bash
ruby app.rb -p 4567
```

2. Open in browser: `http://localhost:4567`

The API listens on port `4567` by default.

---

## (Optional) Use Bundler with a Gemfile

Create a `Gemfile` with this content:

```ruby
source 'https://rubygems.org'

gem 'sinatra'
gem 'sinatra-contrib'
gem 'json'
```

Install dependencies:

```bash
bundle install
```

Run with bundler (recommended for stable environments):

```bash
bundle exec ruby app.rb -p 4567
```

---

## API Endpoints

**Base URL:** `http://localhost:4567`

* `GET /` — welcome message
* `POST /items` — create an item
* `GET /items` — list all items
* `GET /items/:id` — get a single item
* `PUT /items/:id` — update an item
* `DELETE /items/:id` — delete an item

### Example `curl` calls

**Create**

```bash
curl -X POST http://localhost:4567/items \
  -H "Content-Type: application/json" \
  -d '{"name":"Book","description":"Ruby Guide"}'
```

**List all**

```bash
curl http://localhost:4567/items
```

**Get one**

```bash
curl http://localhost:4567/items/1
```

**Update**

```bash
curl -X PUT http://localhost:4567/items/1 \
  -H "Content-Type: application/json" \
  -d '{"name":"Updated Book"}'
```

**Delete**

```bash
curl -X DELETE http://localhost:4567/items/1
```

> Note: This app stores data in memory only — restarting the server clears all items. If you need persistence, let me know and I will add SQLite + ActiveRecord instructions.

---

## Example `.gitignore`

Put this in a `.gitignore` file to avoid committing local artifacts:

```
/.bundle
/vendor/bundle
*.gem
*.log
.DS_Store
.env
```

---

