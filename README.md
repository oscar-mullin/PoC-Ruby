# PoC-Ruby

Proof of concept for the **Spigit INC.** Web Automation Framework using Selenium,Cucumber and Ruby.

## Installation

#### Ruby 2.3.3
1. Download Ruby 2.3.3 from [RubyInstaller.org](http://rubyinstaller.org/downloads/) web page
2. Install Ruby checking all the checkboxes on every step.

#### DevKit 4.7.2
1. Download DevKit 4.7.2 from [RubyInstaller.org](http://rubyinstaller.org/downloads/) web page
2. Install DevKit following below steps:

 - Create a directory named 'Devkit' to install the DevKit artifacts into
 - Double click on the self-extracting executable (SFX)
 - From DevKit folder open a cmd console and execute below commands:

            ruby dk.rb init
            ruby dk.rb install

#### Required Gems
- Run below commands from a cmd console in order to complete the installation of all necessary gems:

        gem install cucumber -v 2.4.0
        gem install capybara -v 2.12.0
        gem install rspec -v 3.5.0'
        gem install site_prism -v 2.9
        gem install selenium-webdriver -v 3.0.5
        gem install parallel_tests -v 2.13.0

#### Selenium Server
- Download Selenium Server from [Selenium HQ](http://docs.seleniumhq.org/download/)
- Copy the *Selenium Server* .jar file anywhere on server and slave Machines

## Usage

In order to execute any command you need to open a command console from **test_specs** folder and execute one of below commands:

- Execute a feature on a **single thread**:

        cucumber features/[FeatureName].feature --format html --out output/[FeatureName][Browser][AppVersion]_%DATE:~-4%-%DATE:~4,2%-%DATE:~7,2%.html
        i.e.:
        cucumber features/LoginTest.feature --format html --out output/LoginTestCH392_%DATE:~-4%-%DATE:~4,2%-%DATE:~7,2%.html

- Execute a feature on a **parallel thread**:

        bundle exec parallel_cucumber -n 2 features/[FeatureName].feature --group-by scenarios
        i.e.:
        bundle exec parallel_cucumber -n 2 features/LoginTest.feature --group-by scenarios

**Note:** For Paralell execution you should start the Selenium Server **hub** and **node** on the corresponding machines using below commands:

- Server:

        java -jar selenium-server-standalone-3.0.1.jar -role hub

- Node:

        java -jar selenium-server-standalone-3.0.1.jar -role webdriver -hub http://[Hub IP Address]:4444/grid/register -port 5566 -browser browserName=[your preferred browser],maxInstances=[Max allowed instances] -maxSession [Max allowed sessions]
        i.e.:
        java -jar selenium-server-standalone-3.0.1.jar -role webdriver -hub http://192.168.1.10:4444/grid/register -port 5566 -browser browserName=chrome,maxInstances=2 -maxSession 2

## Contributing

 1. Create your feature branch:

 `git checkout -b my-new-feature`
 2. Commit your changes:

 `git commit -am 'Add some feature'`
 3. Push to the branch:

 `git push origin my-new-feature`
 4. Submit a *pull request*

## changelog

01/31/2017 - Walter Ramirez - First Version