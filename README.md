# Hi, I am Luan Bonifácio 👋

Backend software engineer focused on APIs, integrations, payments, and the
infrastructure that keeps applications reliable in production.

I have nearly five years of experience building and maintaining business
systems with PHP, SQL, REST APIs, webhooks, financial integrations, Docker,
Linux, Nginx, DNS, and SSL. I am currently expanding that foundation toward
cloud-native backend engineering, CI/CD, observability, and distributed systems.

## What I work with

- Backend engineering with PHP, REST APIs, SQL, MySQL, and PostgreSQL
- Payment and external-platform integrations, including Pix and PSP migrations
- Production infrastructure with Docker, Linux, Nginx, TLS, DNS, and VPS hosting
- AI-assisted systems and integrations using Gemini and modern engineering tools

## Featured project

### [FinPulse](https://finpulse.boniluan.com)

An authenticated financial assistant that combines Brazilian Central Bank data,
backend calculations, alerts, and Gemini-generated explanations. It demonstrates
clean architecture, API integrations, PostgreSQL, Redis, Docker Compose, rate
limiting, automated tests, CI, and production deployment.

- [Source code](https://github.com/BoniLuan/finpulse)
- [Live application](https://finpulse.boniluan.com)

## Find me online

- [Website](https://boniluan.com)
- [LinkedIn](https://www.linkedin.com/in/boniluan)
- [Instagram](https://www.instagram.com/boni_luan)
- Email: [bonifacio.luan.10@gmail.com](mailto:bonifacio.luan.10@gmail.com)

---

## About this repository

This repository contains the source for [boniluan.com](https://boniluan.com), my
English-language landing page and the reverse-proxy entry point for projects
hosted on the same VPS. Because the repository is named after my GitHub username,
this README also serves as my GitHub profile introduction.

### Stack

- Static semantic HTML and CSS
- Nginx on Alpine Linux
- Docker Compose
- Cloudflare-aware client IP handling
- Certbot-managed TLS certificates stored in Docker volumes
- Reverse proxy from `finpulse.boniluan.com` to the internal FinPulse gateway

### Run

The production setup expects the external Docker network used by hosted projects
and existing Certbot volumes:

```bash
docker network create web-proxy
docker compose up -d --build
```

Useful checks:

```bash
docker compose ps
docker compose logs -f web
curl --fail --header "Host: boniluan.com" http://127.0.0.1/health
```

TLS certificates and private keys are not stored in this repository.
