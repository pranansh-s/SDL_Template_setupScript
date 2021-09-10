#!/bin/sh

echo -n "Project Name: "
read NAME

git clone https://github.com/pranansh-s/SDL_Template

sed -i "s/untitled/$NAME/g" SDL_Template/.vscode/tasks.json
sed -i "s/untitled/$NAME/g" SDL_Template/.vscode/launch.json
sed -i "s/untitled/$NAME/g" SDL_Template/src/main.cpp

echo -n "MinGW-64 bin path(C:\Program Files\...\bin): "
read -r PATHMin

PATHMin="$(sed 's,\\,\/,g' <<<"$PATHMin")"
WRLPATH="$(sed 's,/,\\\\\\\\,g' <<<"$PATHMin")"

sed -i "s,pathMin,$WRLPATH,g" SDL_Template/.vscode/tasks.json
sed -i "s,pathMin,$WRLPATH,g" SDL_Template/.vscode/launch.json
sed -i "s,pathMin,$PATHMin,g" SDL_Template/.vscode/c_cpp_properties.json

# echo "You have successfully created your project!"
# echo "Open VSCode and run the your program using F5"