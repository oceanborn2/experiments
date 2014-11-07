@echo off

rem https://www.packer.io/
rem http://blog.ippon.fr/2014/03/24/du-dev-a-la-prod-avec-vagrant-et-packer/

rem recuperer (via un clone git) les definitions pour les distributions Linux
rem https://github.com/jedi4ever/veewee/tree/master/templates
rem git clone https://github.com/jedi4ever/veewee/tree/master/templates

rem declaration VAGRANT_HOME et ajout dans le PATH
rem https://github.com/mitchellh/veewee-to-packer
rem $ gem install veewee-to-packer
rem Fetching: veewee-to-packer-0.3.0.gem (100%)
rem Successfully installed veewee-to-packer-0.3.0
rem 1 gem installed
rem Installing ri documentation for veewee-to-packer-0.3.0...
rem Installing RDoc documentation for veewee-to-packer-0.3.0..


REM Pascal.Munerot@PAR-LAP-1168 /cygdrive/d/GitHub/experiments/devops/make-archlinux-box/archlinux-x86_64
REM $ veewee-to-packer definition.rb
REM There were some non-critical warnings during the conversion process.
REM Your template will function despite these warnings, but they're noted
REM here so you can understand some aspects of the Veewee definition that
REM may not have carried over perfectly to the Packer template:

REM * ':postinstall_timeout' doesn't exist in Packer.
REM * :params are not supported by Packer.

REM Success! Your Veewee definition was converted to a Packer template!
REM The template can be found in the `template.json` file in the output
REM directory: output

REM Please be sure to run 'packer validate' against the new template
REM to verify settings are correct.


set PACKER=D:\software\VagrantPacker
set OLDPATH=%PATH%

%PACKER%\packer.exe build -only=virtualbox-iso template.json

set PATH=%OLDPATH%

