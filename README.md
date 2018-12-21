# Web App Generator

This is a simple web app generator to construct a file directory skeleton for a web app.  It will set up directories for your html, css and javascript files, initialize a git repository (if you decide to) and install any dependencies you desire.

This is designed for basic web pages.  If you're creating something in Vue or React or using the Express generator, you'll be better off using their CLI tools.

If you have VSCode installed, it will, if prompted, open the files in VSCode so you can get started.  If you have live-server installed, it will, if prompted, run the live-server dev server.

## Basic usage

Minimal use:

    webapp myapp

This will create an application with the following structure:

    /myapp 
        /html
        /scripts
            app.js
        /style
            style.css
        index.html

`index.html` is prepopulated with basic html 5 boiler plate and already has `<link>` tags and `<script>` tags for your CSS and JavaScript

Any arguments after the name of the application will be NPM packages.  The generator will create a package.json file and then install all the NPM packages.

    webapp myapp jquery lodash date-fns

This will create an application called `myapp` and install jquery, lodash and date-fns.  If there is a git repo, this will also generate a `.gitignore` with `/node_modules` ignored.

## Installation

There are two ways to install

### NPM

As an NPM module it can be installed globally

    npm i -g webapp

[Link to NPM](deadurl)

**UNTIL THIS NOTICE IS TAKEN DOWN, THIS IS NOT ON NPM YET**

As a shell file, just download the `webapp.sh` file and install as follows: