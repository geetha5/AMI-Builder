# AMI Builder

## Configuration

#### Config Files

There are three configuration files that will be used for various parts of process. 

1. awsVagrantConfig.json: for configuration of the vagrant machine for testing
2. awsPackerConfig.json: for configuration of packer to use the correct aws options
3. accountCopy.json: for the configuration of the account copying

There are .example files for each of the configurations. These config files will be git ignored
and will not be commited to git.

#### Gradle Config

Gradle properties can be specified in one of three ways:

1. A json config file with \<key>: \<value> where key is the gradle property name. The config file location is then
passed using the command line property -PconfigFile=\<path to config file>
2. A gradle.properties file in the working directory (gitignored so it wont be commited).
3. Any parameter can be overidden the on the command line with -P\<prop_name>=\<prop_value>

**Note:** _any property in the json config will take precedence_

## Requirements 

* Packer
* Java
* Gradle

## Usage

Below are the common gradle tasks that will need to be run and what function they preform.

#### Pulling Ansible Role
**pullUpdateCisRole** - This will pull the CIS role from git with the given gradle properties

**resyncLocalCisRole** - This will copy the the CIS role from a local directory

#### Testing

**runFullTest** - This will run a full vagrant test and run the CIS scoring

#### Build

**build** - This will run a CIS AMI build with packer and will deploy it to all accounts in the accountCopy.json file

