# TopQuestionsApp

### Author: Ricardo Montesinos Fernandez

![ScreenShot](img/topquestions.gif)

## How to use:

The project can be executed by selecting the corresponding Scheme:

![ScreenShot](img/schemes.png)

The project have three schemes, the default one *TopQuestions*, Develop and Release.

In order to make a HTTP REST request to the TopQuestions server use the Release scheme.

For developing purposes, execute the app using the Develop scheme, with this setup the request is made locally by using the mocked json files.


## Project

This project was developed without any dependency, creating a high scalable code with the most native code as possible.

The Project is implemented under VIPER Architecture.

Within the project we can find:

- API manager: Defined as protocol in order to make possible dependency injection.
- Configurations for Debug and Release modes by using `#if DEBUG`.
- Autolayout definitions taking advantage of Protocol and extensions.
- The full VIPER structure can be found on the `Protocols.swift` file
- A ViewModel is defined for populating data on the DetailView.
