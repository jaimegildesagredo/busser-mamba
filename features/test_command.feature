Feature: Test command
  In order to run tests written with mamba
  As a user of Busser
  I want my tests to run when the mamba runner plugin is installed

  Background:
    Given a test BUSSER_ROOT directory named "busser-mamba-test"
    When I successfully run `busser plugin install busser-mamba --force-postinstall`
    Given a suite directory named "mamba"

  Scenario: A passing test suite
    Given a file in suite "mamba" named "default_spec.py" with:
    """
    with describe('default'):
        with it('succeed'):
            assert True
    """
    When I run `busser test mamba`
    Then the output should contain:
    """
    1 examples ran
    """
    And the exit status should be 0

  Scenario: A failing test suite
    Given a file in suite "mamba" named "default_spec.py" with:
    """
    with describe('default'):
        with it('fail'):
            assert False
    """
    When I run `busser test mamba`
    Then the output should contain:
    """
    1 examples failed of 1 ran
    """
    And the exit status should not be 0

  Scenario: A suite with requirements.txt file
    Given a file in suite "mamba" named "requirements.txt" with:
    """
    expects
    """
    When I run `busser test mamba`
    Then the output should contain:
    """
    expects
    """
