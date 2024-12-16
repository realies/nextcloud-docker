# Nextcloud Docker with FFmpeg

This repository provides automated builds of Nextcloud Docker images with FFmpeg support. It tracks the official Nextcloud Docker images and automatically adds FFmpeg capabilities to all non-versioned tags (latest, fpm, apache, etc.).

## Features

- Automated daily builds
- Follows official Nextcloud Docker tags (non-versioned only)
- Adds FFmpeg support for video preview generation
- Multi-architecture support (matches upstream architectures)
- Maintains parity with official images while adding essential media functionality

## Tags

The same tags as the official Nextcloud Docker images are available, excluding version-specific tags:
- latest
- fpm
- fpm-alpine
- apache
- stable
- production
etc.

## Usage

```
bash
docker pull realies/nextcloud:latest
```

Replace `latest` with your preferred tag.

## Automation

The workflow automatically checks for updates daily and rebuilds images when upstream changes are detected.
