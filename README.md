# PeerDocument

## How to run

Before trying to run this example, make sure you have **[Node](https://nodejs.org/)** v6 LTS (recommended) or earlier installed.

```sh
node -v
```

Opted to have **[MongoDB](https://www.mongodb.com)** storage for this particular example, so make sure it's installed and running. Alternatively, if you have [Docker](https://www.docker.com) installed you can spin an instance quickly by running the command:

``` Shell
docker run -p 27017:27017 mongo
```

[Clone the repository](https://help.github.com/articles/cloning-a-repository) and install dependencies. It will also run the necessary [webpack](https://webpack.js.org) build task automatically for you.

```sh
npm install
```

Run the project:

```shell
DEBUG=peerdocument:* npm start
```

#### Development watch task

For convenience while developing, a build task with watch is included:

```shell
npm run watch
```
