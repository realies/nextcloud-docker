ARG IMAGE
ARG TAG

FROM ${IMAGE}:${TAG}

ARG TAG

RUN if echo "${TAG}" | grep -q "alpine"; then \
        apk add --no-cache ffmpeg; \
    else \
        apt-get update && apt-get install -y --no-install-recommends ffmpeg && rm -rf /var/lib/apt/lists/*; \
    fi
