# Galoy Regtest Box

[![Galoy](https://img.shields.io/badge/Galoy-Lightning%20Fast-orange)](https://github.com/GaloyMoney/galoy)
[![Docker Pulls](https://img.shields.io/docker/pulls/sandipndevgaloy/galoy-regtest-box)](https://hub.docker.com/r/sandipndevgaloy/galoy-regtest-box)

This repository provides a quick and easy way to bootstrap and run the Galoy Stack in a Regtest (Bitcoind Regtest) environment. By using this setup, you can build on top of Galoy's GraphQL APIs with all of its capabilities.

## Getting Started

To get started, follow these simple steps:

1. Make sure you have Docker installed on your system.
2. Create a `docker-compose.yml` file in your project's root directory with the following contents:

```yml
version: "3"
services:
  galoy:
    image: sandipndevgaloy/galoy-regtest-box:latest
    privileged: true
    ports:
      - "4002:4002"
```

3. Save the `docker-compose.yml` file and navigate to your project's root directory in the terminal.

4. Run the following command to start the Galoy Stack:

```bash
docker-compose up -d
```

5. The Galoy Stack will be up and running! You can now access the GraphQL APIs at `http://localhost:4002/graphql`.

---
Happy coding! 🚀
