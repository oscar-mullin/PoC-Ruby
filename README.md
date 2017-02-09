# PoC-Ruby

Proof of concept for the **Spigit INC.** Web Automation Framework using Selenium,Cucumber and Ruby.

## Environment Setup

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
Run below commands from a cmd console in order to complete the installation of all necessary gems:

        gem install cucumber -v 2.4.0
        gem install capybara -v 2.12.0
        gem install rspec -v 3.5.0
        gem install site_prism -v 2.9
        gem install selenium-webdriver -v 3.0.5
        gem install parallel_tests -v 2.13.0
        gem install gmail
        gem install report_builder
        gem install bundler
        bundle install

#### Java Development Kit
1. Download Java SE Development Kit 8 from [orale.com](http://www.oracle.com/technetwork/java/javase/downloads/jdk8-downloads-2133151.html) web page
2. Run the downloaded installer (e.g., "jdk-8u{xx}-windows-x64.exe"), which installs both the JDK and JRE. By default, the JDK will be installed in directory "C:\Program Files\Java\jdk1.8.0_xx", where xx denotes the upgrade number; and JRE in "C:\Program Files\Java\jre1.8.0_xx".
3. Accept the defaults and follow the screen instructions to install JDK and JRE.
4. Include **"<JAVA_HOME>\bin"** bin directory to the Environment Variables, where **<JAVA_HOME>** denotes the JDK installed directory

#### Selenium Server & Browser Drivers
Download latest versions of Selenium Server & Browser Drivers, and include them to the Environment Variables following below steps:

1. Download the latest Selenium Server Standalone jar from [Selenium HQ](http://docs.seleniumhq.org/download/) web page

2. Download the latest Chrome and IE Drivers from:
 - [Google Chrome Driver](https://sites.google.com/a/chromium.org/chromedriver/downloads)
 - [Internet Explorer Driver](http://selenium-release.storage.googleapis.com/index.html)

3. Unzip if needed and copy all files into a folder (e.g., "C:\Drivers")

4. Include *Drivers* directory to the *PATH* Environment Variable

**Note:** For Parallel execution you should repeat below steps for the **hub** and each **node** machines

## Usage

In order to execute any command you should open a command console, navigate to **test_specs** folder and execute one of below commands:

- Execute a feature on a **single thread**:

        bundle exec cucumber features/[FeatureName].feature --format json --out output/[FeatureName][Browser][AppVersion]_%DATE:~-4%-%DATE:~4,2%-%DATE:~7,2%.json
        e.g.:
        bundle exec cucumber features/LoginTest.feature --format json --out output/LoginTestCH392_%DATE:~-4%-%DATE:~4,2%-%DATE:~7,2%.json

- Execute a feature on a **parallel thread**:

        bundle exec parallel_cucumber -n 2 features/[FeatureName].feature --group-by scenarios
        e.g.:
        bundle exec parallel_cucumber -n 2 features/LoginTest.feature --group-by scenarios

**Note:** For *parallel executions* you should start the Selenium Server **hub** and **node** on the corresponding machines using below commands:

- Hub:

        java -jar selenium-server-standalone-3.0.1.jar -role hub

- Node:

        java -jar selenium-server-standalone-3.0.1.jar -role webdriver -hub http://[Hub IP Address]:4444/grid/register -port 5566 -browser browserName=[your preferred browser],maxInstances=[Max allowed instances] -maxSession [Max allowed sessions]
        e.g.:
        java -jar selenium-server-standalone-3.0.1.jar -role webdriver -hub http://192.168.1.10:4444/grid/register -port 5566 -browser browserName=chrome,maxInstances=2 -maxSession 2

Further, If you want to use a different Machine to the **hub**, you should replace the current Ip Address on `test_specs\cucumber.yml` file under **Remote > HUB_URL** section, with the correct **hub** ip address.

## Contributing

 1. Create your branch:

 `git checkout -b my-branch`
 2. Commit your changes:

 `git commit -m 'Add some feature'`
 3. Push to the branch:

 `git push origin my-branch`
 4. Submit a *pull request* to `development` branch 

## changelog

- 01/31/2017 - Walter Ramirez - First Version
- 02/01/2017 - Walter Ramirez - Included Java and Browser Drivers