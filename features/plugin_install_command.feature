Feature: Plugin install command
  In order to use this plugin
  As a user of Busser
  I want to run the postinstall for this plugin

  Background:
    Given a test BUSSER_ROOT directory named "busser-mamba-install"

  Scenario: Running the postinstall generator
    When I run `busser plugin install busser-mamba --force-postinstall`
    Then the exit status should be 0
