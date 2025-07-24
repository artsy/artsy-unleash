# artsy-unleash

This repository is responsible for configuring and deploying Artsy's unleash service (both server and proxy).

- **State**: Development
- **Production**:
  * server: https://unleash.artsy.net
  * proxy: https://unleashprx.artsy.net (proxies to production server with a "production" key)
- **Staging**:
  * server: https://unleash.stg.artsy.systems 🔒
  * proxy: https://unleashprx-staging.artsy.net (proxies to **production** server with a "development" key)
- **GitHub**: https://github.com/artsy/artsy-unleash
- **[CircleCI](https://circleci.com/gh/artsy/artsy-unleash):** Merged PRs to artsy/artsy-unleash#main are automatically deployed to staging. PRs from `staging` to `release` are automatically deployed to production. [Start a deploy...](https://github.com/artsy/artsy-unleash/compare/release...staging?expand=1)
- **Point People**: [@mc-jones]([https://github.com/joeyAghion/](https://github.com/mc-jones))

### A note about environments

Artsy applications all [ultimately] depend on the production Unleash server instance to decide feature state, whether running in development, staging, or production environments themselves.

**Development** environments of server-side applications should connect to [the production server](https://unleash.artsy.net) with a "development" key, while client-side applications should connect to [the staging proxy](https://unleashprx-staging.artsy.net) which itself connects to the production server with a "development" key.

**Staging** environments of server-side applications should also connect to [the production server](https://unleash.artsy.net) with a "development" key, while client-side applications should connect to [the staging proxy](https://unleashprx-staging.artsy.net) which itself connects to the production server with a "development" key.

**Production** environments of server-side applications should connect to [the production server](https://unleash.artsy.net) with a "production" key, while client-side applications should connect to [the production proxy](https://unleashprx.artsy.net) which itself connects to the production server with a "production" key.
