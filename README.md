# dbt-sandbox

`dbt-sandbox` is a playground for dbt, useful to understand dbt concepts and testing out scripts.

All you need is Docker and VSCode, you can clone this repository in a Dev Container in VSCode and it will setup an isolated environment with a dbt project and a Postgres database with raw data.

The container build process will ask you to insert your GitHub credentials, here you can use your SDG account and it will not affect your git global configuration, since it will affect only this repository.
At the end of the build process the Postgres database will be loaded with raw data through the _dbt seed_ command and you can use the loaded tables as your sources.

## Setup
1. Install Docker on your local machine
2. Install Visual Studio Code on your local machine
3. Open VSCode and install the Dev Containers extension
4. If you don't have it, create a Github account with your SDG email
5. On Github copy repository URL
6. On VSCode press Ctrl+Shift+P or F1 and select _Dev Containers: clone Repository in Named Container Volume_
7. Paste the repository URL and write a name for the volume and the target folder
8. Follow the prompt instructions to insert your GitHub credentials
9. Done
