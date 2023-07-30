## React Boilerplate

> a frontend using react to experiment and learn with interacting with a rails API

<em>A React boilerplate project for spinning up a react <strong>v16.7+</strong> app using the below NPM modules</em>

## TODOs

<details>
    <summary><strong>TODOs</strong></summary>

    - [ ] `react-hot-loader` has been deprecated, wont work with react ≥ v17.0
        - find replacement
        https://github.com/gaearon/react-hot-loader

    - [ ] comprise a list of useful eslint ignore statements neeeded when building/deving out an app

        ```js
        /* eslint jsx-a11y/anchor-is-valid: 0 */
        /* eslint no-unused-vars: 0 */
        ```

    - [ ] fix **React-Hot-Loader** 

        ```shell
        React-Hot-Loader: misconfiguration detected, using production version in non-production env.
        ```

    - [x] ~~upgraded to _webpack5_ hot reloading stopped working for CSS~~
    - [x] ✅ is _react-hot-loader_ preserving state ie a _counter_ when hot reload is triggered
    - [ ] _webpack bundle analyzer_  does not generate a `.html` of bundle, when running `npm run build`
    - [x] ~~update webpack config prod file to work with **webpack-merge**~~

</details>

## Contents

<a name="contents"></a>

- [Updates](#updates)
- [Bootstrapping a new React project](#bootstrapping)
- [Course Notes](#course-notes)
- [TODOs](#todos)

## Updates

<a name="updates"></a>

### February 2021

- updated all top level pkgs in `package.json`
  - migrated project from webpack4 to webpack5, kept webpack4 conf files for preservation
  - webpack5 configuration files consist of a `5.common.js` and a `5.dev.js`

---

### feb.24.2021

- updated `webpack-dev-server@next` ie. ver4 beta, to get webpack5 working with multiport setup, ie. if port 8080 already in use `webpack-dev-server` will use next availabe port, also,
    - webpack-dever-server@4 does not use `contentBase`
    - also, updated html-webpack-plugin to v5.x

### feb.25.2021

- see below image of what a react app looks like without SSR

<details>
<summary>react app, no SSR</summary>

![no ssr example][lnkSSR]

[lnkSSR]: <https://raw.githubusercontent.com/ipatch/js-and-friends/72bc9197292b6a0c08ecedb793b3b8a567e77033/lib/images/my.react.starter.no.SSR.png?token=AAEV3LIKAJC2KP4HCPYVTNTAIFQMS&s=100>

</details>

### feb.26.2021

- **isomorphic** javascript refers to using the same type of module imports ie. either using `import` or `require` but NOT using both.


### September, 2020

- use below command to run app using **webpack-dev-server** without _webpack-merge_

    ```shell
    npm run dev4
    ```

- use below command to run app using **webpack** with _webpack-merge_

    ```shell
    npm run dev5
    ```

### May 3, 2019

- Updated all top level packages in **package.json** to latest versions.
- To analayze the size of a production webpack generated bundle

```shell
cd /path/to/prj/root
npm run build
echo "macOS specific, to see specific sizes of various pieces of the app"
open ./dist/bundle_sizes.html
```

> The above **open** command will open a webpage listing various sizes of the components that comprise a webpack bundle.

### Previous Updates

- added [**webapp-webpack-plugin**](https://www.npmjs.com/package/webapp-webpack-plugin) to generate favicons for various systems and platforms. Copied the svg that is part of **create-react-app** to be the favicon for this project.

- added **prettier** to project via NPM to make all **.js** files conform to a single Javascript code formatting standard.

To run **prettier** from a CLI

```shell
npx prettier --write "src/**/*.js"
```

- **webpack-dev-server** will default to port **8080**, and if that port is not available it will increment until it finds an available port to bind to.

```conf
http://localhost:8080
```

- Added support for CSS source maps using [extract-css-chunks-webpack-plugin](https://github.com/faceyspacey/extract-css-chunks-webpack-plugin)

<details>
<summary>📸 Example</summary>

![css-source-maps](https://github.com/ipatch/js-and-friends/blob/dev/lib/images/tech-js-friends-wp-css-source-maps.png)

</details>

### Hooks

<a id="hooks"></a>

⚠️ As of Jan 21, 2019 **hooks** has not been fully integrated into stable version of react, thus react@next is required to use **hooks**

## Bootstrapping a new React project using this boilerplate

<a id="bootstrapping"></a>

```shell
git clone --depth=1 https://github.com/ipatch/js-and-friends.git [PROJECT_NAME]
cd [PROJECT_NAME]
cp -ivr ./starters/my-react-starter ../../[NEW_PROJECT_NAME]
cd ../[NEW_PROJECT_NAME]
rm -rf .git
echo "initialzie project as a fresh git project"
git init
echo "update settings in package.json"
npm init -y
echo "install NPM modules"
npm i
```

> Runnning `git log` in the new project dir should not have any git history, and project size on local file sytem should be ~ 470K in size.

### Alternative to `cp` is `rsync`

An easier way to keep a seperate react boilerplate project updated elsewhere on a local system, ie. outside the git cloned repo is to use **rsync** after pulling in updates from the remote git repo.

```shell
rsync -ah \
--info=progress2 \
--update \
--delete \
--exclude-from./rsync-excludes \
$priavte/js-and-friends/starters/my-react-starter \
./
```

<details>
<summary>Primary NPM modules used with boilerplate</summary>

- react v16.7
- react-dom v16.7
- eslint
- webpack
  - css-loader
  - html-webpack-plugin
  - style-loader
- webpack-bundle-analyzer
- webpack-dev-server
- husky
- babel v7
  - @babel/polyfill
- jest
- react-hot-loader

</details>

<details>
<summary>Notes taken while working my way through the course</summary>

<a id=course-notes></a>

## Course Notes [🔝](#contents)

> My notes jotted down from watching the Modern JS tooling with React Egghead Course in December 2018.

[Course Link](https://egghead.io/courses/modern-javascript-tooling-with-react)

`npm run init -y` can be ran after a node project has already been intialized to update a node project with git repository information.

A shorthand way of interacting with binaries, ie. bins in the **node_modules** directory using bash is to

```shell
$(npm bin)/babel
```

<strong>fish shell</strong>

```shell
eval (npm bin)/babel ./src/greet.js --presets-@babel/preset-env
```

When interacting with local bins provided by npm such as webpack and babel, there exists a **.bin** directory within the **node_modules** dir. ie. `/path/to/some/nodejs/project/node_modules/.bin` which allows a shell to interact the JS tooling by specifying a `./node_modules/.bin/[BIN]` to use a tool via the CLI.

<strong>Ex</strong>

```shell
./node_modules/.bin/webpack ./src/index.js
```

The above command can be used to bundle a JS project using webpack from a CLI. Babel can be used in the same way if the CLI tooling has been installed via NPM or yarn.

To specifically run **webpack** in development mode

```shell
npm run build -- --mode development
```

<a id="course-notes-setup-react"></a>

### Setting up react [🔝](#contents)

To setup react, react-dom, and prop-types for a Node.js project as a runtime dependency.

```shell
npm i -S react react-dom prop-types
```

To get webpack and babel working with React's JSX
 setup a loader for a react based project.

 ```shell
npm i -D @babel/preset-react
```

To get webpack to work properly, ie. bundle HTML files / code.

```shell
npm i -D html-webpack-plugin
```

To setup webapck to serve a "webpage / site" as opposed to specifying the path to the bundle **webpack-dev-server** needs to be installed.

```shell
npm i -D webpack-dev-server
```

To use class properties, ie. local state in a class with react then a proposal NPM package will need be installed in order for node and babel to work with class properties.  One common use of class properties in a react component is setting state for a component.

```shell
npm i -D @babel/plugin-proposal-class-properties
```

Webpack does not support CSS out of the box, so an appropriate loader will be required to use webpack in conjunction with CSS.

```shell
npm i -D css-loader style-loader
```

Additionally the loaders will need to be setup in a webpack configuration file as well.

<a id="course-notes-state-in-react"></a>

## Working with State in React Components

In Video 17 Andy discusses how the state of a counter component is lost when the app is refreshed due to Hot Module Reloading. This behavior can be seen in commit [c39328f](https://github.com/ipatch/js-and-friends/commit/c39328fc65211ad632761d2927d406ecf3391418)

To get around the above mentioned issue, Andy installs **react-hot-loader** using npm

```shell
npm i -S react-hot-loader
```

<a id="course-notes-npm-modules"></a>

## NPM Modules

- webpack

```shell
npm install --save-dev webpack webpack-cli
```

- babel

```shell
npm i -D @babel/core @babel/cli @babel/preset-env
```

> `npm i -D` is a shorthand way of running `npm install --save-dev`

<a id="course-notes-unsorted"></a>

### Notes Unsorted

<a id="course-notes-unsorted-video-18"></a>

#### Video 18

**package.json** scripts can be compounded together, see commit [fb3693a](https://github.com/ipatch/js-and-friends/commit/fb3693adf5c33328bc86a836b5bfb9c21e4b8f37)

<a id="course-notes-unsorted-video-19"></a>

### Video 19

**webpack-bundle-analyzer** is a NPM module that analyzes webpack bundles.  Primarily **wba** is useful for optimizing production webpack builds, and really doesn't serve a purpose for webpack development builds.

When analyzing a production bundle built by webpack using a web browser, hover over the various elements in the web page to see various sizes of elements that comprise the bundle. Notice how there are three sizes reported by **wba**

- start size
- parsed size
- gzip size

The **parsed size** is the size of the bundle that will be processed by the browser. **wba** generates a **report.html** file within the **dist** dir of the project that is used to analyze the components of the bundle generated by webpack.  Some configuration options are set to prevent **wba** from opening the analyzer when building a production build, but the report can still be viewed by running the below command.

```shell
cd /path/to/project
open ./dist/report.html
```

> May be beneficial to rerun **wba** to get an updated report.

<a id="course-notes-unsorted-video-20"></a>

### Video 20

Andy sets up the production build of his app to use a CDN to provide React and ReactDOM as opposed to including it within the app itself, however the dev build still uses a local dev dependency of React.

<a id="course-notes-unsorted-video-21"></a>

### Video 21 / Targeting different browsers [🔝](#contents)

To save a NPM module as a runtime dependency for the project

```shell
npm i -S [PKG_NAME]
```

```shell
import '@babel/polyfill'
```

Adding the above dependency to the project can add a significant amount to a bundle size, ie. ~ 70 - 90 kilobytes.

Targeting a specific browser, ie. Chrome based browsers, ie. version 68 and above drastically reduces the bundle size.

To print a list of the last two _2_ major versions of web browsers

```shell
npx browserslist "last 2 versions"
```

To further refine the above query, only list browsers that aren't dead, and that have more than 2% market share.

```shell
npx browserslist "last 2 versions, not dead, not < 2%"
```

The above query can be provided to a webpack configuration file.

<a id="course-notes-unsorted-video-22"></a>

### Video 22 / asynchronously load webpack bundles through code splitting [🔝](#contents)

In short, Webpack has the ability to load additional bundles asynchronously when a request is made. See commit [13c8655](https://github.com/ipatch/js-and-friends/commit/13c86552988149626233804c1f669fdafdd6c055)

<a id="course-notes-unsorted-video-23"></a>

### Video 23 / Setting up Jest for a React project [🔝](#contents)

To install **Jest**

```shell
npm i -D jest
```

**NOTE** as of January 2, 2019 watchman is messing up jest testing for whatever reason on my local macOS system, that said, jest can be run without using **watchman**

```shell
jest --no-watchman
```

To append an argument to existing script located within a **package.json**

```shell
npm run test -- --no-watchman
```

#### Video 26 / tooling with prettier

Apparently I deleted this video or never downloaded it 🤷‍♂️

#### Video 27 / Setting up ESLint

**eslint** is a great tool to avoid common pitfalls while working with Javascript source.

```shell
npm i -D eslint
```

If the project uses react then **eslint-plugin-react** can be used to further aid when working with eslint and react.

```shell
npm i -D eslint-plugin-react
```

To setup a configuration file for eslint

```shell
npx eslint --init
```

To setup eslint to ignore certain files and directories for a project create a **.eslintignore** in the project root.

```shell
touch .eslintignore
```

#### Video 28 / Check for accessibility

See commit [5c9b367](https://github.com/ipatch/js-and-friends/commit/5c9b367805fbb434e64611d6ddc591da3ff67833) for more details about working with accessibility in a react app.

#### Video 29 / linting tests and git hooks with husky

To install **husky**

```shell
npm i -D husky
```

See commit [5700feb](https://github.com/ipatch/js-and-friends/commit/5700feb36f690d9b9db405dbb42223fc73ae6f51) for more info about working with **husky** and pre-commit hooks

#### Video 30 / Avoid deprecated react API's

**react** supports a _strict mode_ that will display warning messages in the browser console when a deprecated api is being used with a react app.  All that is needed to see these warning messages is to wrap the **<App/>** component within a **<React.StrictMode>** component at the root of the DOM tree.

```javascript
<React.StrictMode>
  <App/>
</React.StrictMode>
```

See commit [0914557](https://github.com/ipatch/js-and-friends/commit/5c9b367805fbb434e64611d6ddc591da3ff67833) for more info about working with _React.StrictMode_

#### Video 31 / error boundaries with React

Error boundaries are useful when working with react because if the default UI can not be displayed, an error boundary can be setup to display an alternate UI instead of rendering the entire app unrenderable.  See commit [a6c7b63](https://github.com/ipatch/js-and-friends/commit/a6c7b63b6a089aaedc65566e675483ed97775b4d)

#### Video 32 / define prop-types for a react class component

### Video 33 /check for accessibility issues in the browser

To check for specific accessibility issues related to react install **react-axe**

```shell
npm i -D react-axe
```

#### Video 33 / Working with react-axe

See commit [f926618](https://github.com/ipatch/js-and-friends/commit/f9266180322dfe364726de289cc117ccf0aaab9b)

#### Video 34 / Packaging for release

## TODOs [🔝](#contents)

<a id="todos"></a>

- [ ] add a simple counter component to project to test if `react-hot-loader` is working properly
- [ ] what is a good way to view/test a production webpack build locally?
- [ ] figure out why pre-commit hook using husky is **not** preventing git from making commits.
- [ ] figure out if **mDNS** cannot be used with Node.js without an external NPM packages.
- [x] ~~add support for working with various image formats.~~
