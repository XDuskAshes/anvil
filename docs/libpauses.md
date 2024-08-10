# ``libpauses``

## What is it?
``libpauses`` is a library for prompts such as ``Press any key to continue..``, and ``[Y/N]`` prompts.

## Functions

### ``waitForAny()``

Wait for any key to be pressed before continuing.

Usage: ``waitForAny()``

### ``waitForKey()``

Wait for a specific key to be pressed before continuing.

Usage: ``waitForKey(keys.<key>)``

### ``promptYesOrNo()``

Prompt the user to pick ``Y``es or ``N``o. Returns a true or a false.

Usage: ``promptYesOrNo(<prompt>)``