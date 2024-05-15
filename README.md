# Node Starter

## 🏗️ Prerequisites

- [nix](https://nix.dev/tutorials/install-nix)
- [direnv](https://direnv.net/docs/installation.html)

Setup direnv with [shell](https://direnv.net/docs/hook.html)

Run `direnv allow`

```
Node: 20.12.2
Yarn: 1.22.22
```

`nix flake show https://github.com/rakshans1/node-starter`

```
github:rakshans1/node-starter/main
└───devShells
    ├───aarch64-darwin
    │   └───default: development environment 'nix-shell'
    ├───aarch64-linux
    │   └───default: development environment 'nix-shell'
    ├───x86_64-darwin
    │   └───default: development environment 'nix-shell'
    └───x86_64-linux
        └───default: development environment 'nix-shell'
```