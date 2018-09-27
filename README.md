# Notes Scripts

This is something to ideally help with the patterns of daily notes I take. Hopefully it is helpful in some way for you as well.

### Setup

1. run these commands:
```
git clone https://github.com/TyGuy/notes-scripts.git
cd notes-scripts
bundle
cp .env.sample .env
```

2. customize your .env file

### WARNINGS
Use this code at your own risk. This repo is super early stage and I make no claims for the functionality or safety of this code.
* Specifically, it writes files to whatever path you specify without doing any checking whether the file exists or not first. So ten cuidado.

### TODO
* [x] add dotenv and environment variables for tags, folders, etc.
* [x] open files in preferred application
  - [x] could be defined in dotenv
* [ ] copy unresolved asks from last standup => into today's "daily"
* [ ] copy unresolved todos from last daily => into today's "daily"
* [ ] check for files first before writing them
* [ ] add "init" script (create folders, etc.)
* [ ] other useful metadata (could be useful for searching maybe?)

### Known issues
* This probably only works on mac. Not sure about other *nix systems.
