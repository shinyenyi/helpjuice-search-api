# README

# Helpjuice Search Project

This is a fullstack app built with Rails API and Vanilla JS. It allows users to search in real time and logs the final queries for analytics purposes.

## Features
- Real-time search logging with debounce
- Avoids pyramid problem
- Search session tracked by IP
- Analytics endpoint to view top search terms

## Ruby version
- Ruby 3.4.1
- Rails 8.0.2

## System dependencies
- PostgreSQL

## Configuration
Ensure the database config in `config/database.yml` is correct for your environment.

## Database creation
```bash
rails db:create
```

## Database initialization
```bash
rails db:migrate
```

## How to run the test suite
```bash
bundle exec rspec
```

## Services
- No external services required

## Usage
1. Start the server:
```bash
rails s
```
2. Open browser at `http://localhost:3000`
3. Begin typing in the input field
4. View analytics at `/search_entries` endpoint

---

