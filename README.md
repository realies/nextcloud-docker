# Nextcloud Docker with FFmpeg

[![GitHub Last Commit](https://img.shields.io/github/last-commit/realies/nextcloud-docker)](https://github.com/realies/nextcloud-docker/commits/main)
[![GitHub Workflow Status](https://img.shields.io/github/actions/workflow/status/realies/nextcloud-docker/nextcloud-docker.yml)](https://github.com/realies/nextcloud-docker/actions)
[![Docker Pulls](https://img.shields.io/docker/pulls/realies/nextcloud)](https://hub.docker.com/r/realies/nextcloud)
[![Docker Image Size](https://img.shields.io/docker/image-size/realies/nextcloud/latest)](https://hub.docker.com/r/realies/nextcloud)

Automated builds of official Nextcloud Docker images with FFmpeg pre-installed for video thumbnail generation and media processing (required by apps like [Memories](https://github.com/pulsejet/memories)).

## Features

- 🔄 **Automated builds** — rebuilds only when upstream Nextcloud images change
- 🏷️ **All official tags** — `latest`, `fpm`, `apache`, `stable`, `production`, alpine variants, etc.
- 🎬 **FFmpeg included** — enables video previews and transcoding
- 🖥️ **Multi-architecture** — supports all architectures where FFmpeg is available

## Usage

Drop-in replacement for the official image:

```bash
docker pull realies/nextcloud:latest
```

Or in your `docker-compose.yml`:

```yaml
services:
  nextcloud:
    image: realies/nextcloud:fpm
    # ... rest of your config
```

## Available Tags

All non-versioned tags from the [official Nextcloud image](https://hub.docker.com/_/nextcloud) are available:

| Tag | Base | Description |
|-----|------|-------------|
| `latest` | Debian | Latest stable with Apache |
| `apache` | Debian | Apache variant |
| `fpm` | Debian | PHP-FPM variant |
| `fpm-alpine` | Alpine | PHP-FPM on Alpine Linux |
| `stable` | Debian | Stable release with Apache |
| `stable-fpm` | Debian | Stable with PHP-FPM |
| `stable-fpm-alpine` | Alpine | Stable PHP-FPM on Alpine |
| `production` | Debian | Production release with Apache |
| `production-fpm` | Debian | Production with PHP-FPM |
| `production-fpm-alpine` | Alpine | Production PHP-FPM on Alpine |

## How It Works

A GitHub Actions workflow runs daily and:

1. Checks each upstream Nextcloud tag for changes
2. Tests FFmpeg package availability per architecture
3. Builds only for architectures where FFmpeg is available
4. Pushes multi-arch images to Docker Hub

Images are only rebuilt when the upstream base image actually changes, so Portainer and similar tools won't show false update notifications.
