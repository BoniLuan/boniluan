# Repository Guidelines

## Project Structure & Module Organization

This repository contains the static portfolio at `boniluan.com` and the Nginx reverse-proxy entry point for hosted projects.

- `public/index.html`: page structure, content, and small inline browser scripts.
- `public/styles.css`: global styling, responsive layouts, and animations.
- `public/assets/` and `public/favicon.ico`: images and browser assets.
- `nginx/default.conf`: HTTP-to-HTTPS redirects, TLS settings, static-file serving, health checks, and the FinPulse proxy.
- `Dockerfile`: builds the Alpine Nginx image and copies site files.
- `compose.yaml`: runs the web and Certbot services and connects the external `web-proxy` network.

Keep site-only assets under `public/`; keep deployment and routing changes in the root or `nginx/`.

## Build, Test, and Development Commands

- `docker network create web-proxy`: creates the external network required by Compose (run once).
- `docker compose up -d --build`: rebuilds and starts the site and certificate-renewal services.
- `docker compose ps`: checks container and health status.
- `docker compose logs -f web`: follows Nginx startup and request errors.
- `curl --fail --header "Host: boniluan.com" http://127.0.0.1/health`: verifies the local HTTP health endpoint.
- `docker compose config`: validates Compose syntax before deployment.

TLS startup requires existing Certbot volumes and certificates. Never commit certificates or private keys.

## Coding Style & Naming Conventions

Use two-space indentation in HTML, CSS, YAML, and Nginx blocks. Preserve semantic HTML, accessible labels, keyboard-friendly links, and the existing responsive breakpoints. Use lowercase kebab-case for CSS classes and asset filenames (for example, `profile-avatar` and `luan-bonifacio.png`). Reuse CSS custom properties from `:root` instead of duplicating colors or layout values. No formatter is configured, so keep changes consistent with nearby code.

## Testing Guidelines

There is no automated test suite. Before submitting, run `docker compose config`, build the image, confirm `/health`, and manually inspect desktop and mobile layouts. Check navigation anchors, external links, reduced-motion behavior, static assets, redirects, and proxy routing when those areas change.

## Commit & Pull Request Guidelines

Recent history uses Conventional Commit subjects such as `feat: add site favicon`. Follow `<type>: <imperative summary>` with common types including `feat`, `fix`, `docs`, and `chore`. Keep each commit focused.

Pull requests should explain the user-visible or infrastructure impact, list validation performed, and link related issues. Include before/after screenshots for visual changes. Call out changes involving DNS, TLS, ports, Docker networks, or upstream service names.
