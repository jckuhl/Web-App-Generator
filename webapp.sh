#!/bin/bash

function generate() {
    if [ $# -eq 0 ]; then
        echo 'a directory name for your app is required'
        echo 'useage: webapp <directory-name> <libraries (optional)'
        echo 'example: webapp myapp lodash express'
        return
    fi
    if [ -e $1 ]; then
        echo $1 'already exists!'
        return
    else
        echo 'Generating' $1 '. . .' 
        mkdir $1
        cd $1
        mkdir 'html'
        mkdir 'scripts'
        touch 'scripts/app.js'
        mkdir 'style'
        touch 'style/style.css'
        touch 'index.html'
        echo '<!DOCTYPE html>
    <html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>Document</title>
        <link rel="stylesheet" href="./style/style.css">
    </head>
    <body>

        <script src="./scripts/app.js"></script>
    </body>
    </html>' > 'index.html'
        read -p 'Do you want a git repo? [Y/N] ' response
        if [ $response = 'Y' ] || [ $response = 'y' ]; then
            echo 'Generating git repo . . .'
            git init
        fi
    fi

    if [ $# -eq 1 ]; then
        read -p 'Do you want a package.json? [Y/N] ' response
        if [ $response = 'Y' ] || [ $response = 'y' ]; then
            npm init
        fi
    else 
        npm init
        shift
        echo 'installing' $*
        npm install $*
        touch '.gitignore'
        echo '/node_modules' > '.gitignore'
    fi

    echo 'Your web app has been generated!'
    echo 'You can find it at'
    pwd

    read -p 'Would you like to push your first commit now? [Y/N] '

    if [ $response = 'Y' ] || [ $response = 'y' ]; then
        git add .
        git commit -m 'initial commit'
        read -p 'Please enter the url to your git (.git): ' url
        git remote add origin $url
        git push -u origin master
    fi

    read -p 'Would you like to open VSCode? [Y/N] ' response
    if [ $response = 'Y' ] || [ $response = 'y' ]; then
        code .
    fi

    read -p 'Would you like to start live-server? [Y/N] ' response
    if [ $response = 'Y' ] || [ $response = 'y' ]; then
        live-server
    fi
}

generate $*