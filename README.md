# Overview

This boilerplate is focused on **pragmatism**: it always uses the **best available solution**, ignoring philosophies or arbitrary conventions.

The default configuration (`languageMode`) assumes `--!strict` in the `.luaurc` file.

## Features

- Pre-configured development workflow
- Modern tooling
- Minimal dependencies

## How to Use

Run the following command:

```sh
rokit install
```

To start the development environment, you have two options:

Run Lune directly:

```sh
lune run lune/dev.luau
```

Or preferably, use [Just](https://github.com/casey/just), a command runner included in this boilerplate:

```sh
just dev
```
