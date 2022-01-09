# CI / CD Status

[![Run MATLAB Tests on GitHub-Hosted Runner](https://github.com/cavediverchris/Manager-for-MATLAB-Projects/actions/workflows/runMatlabTests.yml/badge.svg)](https://github.com/cavediverchris/Manager-for-MATLAB-Projects/actions/workflows/runMatlabTests.yml)

# Table of Contents

1. [Purpose](#purpose)
2. [Instructions](#instructions)
3. [Compatability](#compatability)

# Purpose <a name="purpose"></a>

The Manager for MATLAB Projects is a suite of functions as well as a MATLAB App interface that is used to automate some routine and borderline mandraulic tasks in order to ensure a consistent application.

The Manager for MATLAB Projects is primarily designed to interact with MATLAB Projects that have been set up using the templates that ship with the Manager for MATLAB Projects which are based upon the templates here:

1. [MATLAB Template for Designing Systems](https://github.com/cavediverchris/MATLAB-template-for-designing-systems)
2. [MATLAB Template for Data Science](https://github.com/cavediverchris/MATLAB-template-for-data-science)
3. [MATLAB Template for App Development](https://github.com/cavediverchris/MATLAB-template-for-app-development)

MATLAB Projects are a great way to manage and organise your work.

# Instructions <a name="instructions"></a>

## Packaging Instructions

In order to build the Manager for MATLAB Projects into a toolbox, you will need to:

- Rebuild the template projects by first "pull"-ing in any new versions and then running the "buildProjectTemplates" utility
- Update the description and details of the "Manager for MATLAB Projects" app packaging project appropriately
- Then package up the app using the app packaging project to create a toolbox.

## Installation Instructions

The Manager for MATLAB Projects is shipped as a MATLAB Toolbox. Simply double-click on the file from within MATLAB to start the toolbox installation process. Once it has completed you should find an icon in your app tray.

## Launching Instructions

The most interactive way of using the Manager is to launch the app from your app tray.

To do this, go to MATLAB, and click on "APPS" in the toolstrip at the top of the screen.

The app tray then covers the bulk of the toolstrip, you will want to click on the down-arrow on the far right hand side this will open the app tray to show the full set of apps you have available.

You may need to scroll down before you are able to see "Manager for MATLAB Projects". 

TIP: If you click the star next to the app icon, you will be able to pin the app to the top of your app tray to save you having to scroll through all the apps again. 

TIP #2: You may wish to unpin other apps that are pinned by default if they are filling up your app tray so that you can't easily see the Manager for MATLAB Projects app.

## Usage Instructions

Once the Manager for MATLAB Projects has launched you will see a simple interface with buttons to the included functionality. It is also possible to use the same functionality programmatically if you do not wish to use the GUI.

- Create a script package. When I refer to a package here I am referring to building up: 1) a MATLAB script as intended, placed within its own dedicated folder 2) a unit test harness placed in the tests folder and 3) a requirements module alongside the MATLAB script.

# Compatability <a name="compatability"></a>
This MATLAB Project is built using MATLAB R2021A and MATLAB Projects are not typically backward compatible.

Once the toolbox has been packaged into a toolbox, it should be generally compatable with most versions of MATLAB, however it is only expected to work reliably in the same version that it has been built with i.e. R2021A.