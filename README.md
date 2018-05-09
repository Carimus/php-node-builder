# php-node-builder

Alpine docker image with:

- php7 + all extensions needed by laravel
- node 8
- yarn
- python
- pip
- aws + boto
- bash
- zip
- generic build essentials (automake, autoconf, nasm, etc.)

Caches are set up as such for use with BitBucket pipelines:

- `pip`: `/root/.cache/pip`
- `npm`: `/root/.npm`
- `yarn`: `/root/.cache/yarn`
