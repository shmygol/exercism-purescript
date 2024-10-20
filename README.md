# Solutions for Exercism PureScript

Solutions for PureScript exercises from [exercism.org](https://exercism.org/tracks/purescript/exercises). Also published to [my Exercism Profile](https://exercism.org/profiles/shmygol/solutions).

## Description

Repository contains PureScript exercises with solutions. All solutions share the same package.json for JavaScript dependencies (PureScript compiler and Spago), but have own Spago packages.dhall for dedicated PureScript dependencies.

## Installing

To install PureScript and Spago (shared between all the exercises):

```sh
npm install
```

PureScript dependencien will be installed by Spago when needed or you can do it with:

```sh
cd hello-world
npx spago install
```

### Exercism CLI

Optionally you can install and configure Eercism CLI globally to download new exercieses and publish solutions. See [official documentation](https://exercism.org/docs/using/solving-exercises/working-locally).

## NPM Scripts

If you want to run a spago command in the current exercise folder just use `npx`:

```sh
npx spago test
```

```sh
npx spago repl
```

You can use NPM Scripts and CLI argument `--exercise` to run commands for a specific exercise regardless of the current folder.

### `spago`

Run spago command in the folder of the provided exercise

```sh
npm run spago test --exercise="hello-world"
```

```sh
npm run spago repl --exercise="hello-world"
```

### `exercism:download`

Shortcut for Exercism CLI, which has to be installed and configured. The exercise is downloaded to the configured exercism workspace.

```sh
npm run exercism:download --exercise="hello-world"
```

### `exercism:submit`

Submit an exercise.

```sh
npm run exercism:submit --exercise="hello-world"
```