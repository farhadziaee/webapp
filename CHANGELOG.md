## 1.0.32
- Fixed the redirection for external links/URI

## 1.0.31
- Fixed WebApp CLI to create new project in new paths
- Fixed example

## 1.0.30
- Fixed https/http urls for requests
- Fixed layout of example
- Fixed bug Language directory
- UnitTest
- Added --path option to set path for create project in CLI
    ```bash
    webapp create --path ./project_path --name example
    ```
    ```bash
    webapp create -p ./project_path -n example
    ```

## 1.0.26
- Improved the WebApp CLI
    - Fixed bug for OpenApi
    - An example for Swagger has been added: 'https://webapp.uproid.com/swagger'
    - A utility menu has been developed for when the project is running to make controlling the project through the CLI easier.
    ```bash
    webapp run [ENTER]
    help [ENTER]
    
       WEBAPP CLI

       * Press 'r' to Reload  the project                
       * Press 'c' to clear screen                       
       * Press 'i' to write info                         
       * Press 'q' to quit the project                   
    ```

## 1.0.25
- Improved the WebApp CLI

## 1.0.24
- Fixed bug of `webapp cli` in windows platforms

## 1.0.22
- Fixed bugs
- Added webapp cli 
    ```bash
    webapp -help
    webapp create
    webapp get
    webapp run
    webapp -v
    webapp runner
    ```

## 1.0.21

- Fixed bugs.
- Improved the cron job.
- Added new examples.
- Added a `pathsEqual` function to check the equality of paths and endpoints. 

## 1.0.17

- Fixed bugs
- Added watcher to have hot reload in example file ./example/bin/watcher.dart

## 1.0.16

- Expanded `WebRoute` to include port and hostname as part of the routing configuration.

## 1.0.15

- Fixed routing bug for excluded paths
- Fixed bug for dumping variables

## 1.0.14

- Fixed routing issues
- Added variable dumping to the frontend
- Resolved SMTP bugs
- Improved documentation
- Enhanced the UI of error widgets
- Updated examples
- Refined unit tests

## 1.0.10

- Fixed various bugs
- Enhanced SMTP mail sender
- Updated example section

## 1.0.9

- Fixed bugs
- Improved configuration classes
- Updated example section

## 1.0.0

- Initial release