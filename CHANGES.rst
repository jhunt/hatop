*********
Changelog
*********

This is a brief overview of the changes introduced by each version.


HATop 0.8
=========

HATop is now compatible with Python 3.

James Hunt has officially taken over maintainership of this project.
Work will continue on GitHub at https://github.com/jhunt/hatop.


HATop 0.8.2
-----------

:Date: May 21, 2022

- Bugfix: in CLI mode, pressing the down arrow no longer crashes Python 2.x


HATop 0.8.1
-----------

:Date: Apr 14, 2021

- Feature: F1/F2 hot keys now affect ALL backends

- Feature: New F9/F10 hot keys implement legacy F1/F2 behavior


HATop 0.8.0
-----------

:Date: Jul 30, 2020

- Feature: Support for Python3

- Feature: Bump max services from 100 -> 1000

- Feature: Support for connecting to HAProxy via a TCP socket.
  (Andrew Hayworth)


HATop 0.7
=========

This is the first public series after reaching a feature complete state.


HATop 0.7.7
-----------

:Date: Oct 05, 2010

- Feature: Display hotkey footer when pressing ENTER on selected service.

- Feature: Use string identifier ("pxname/svname") instead of numerical
  identifier ("#iid/#sid") for hotkey actions.

- Bugfix: Display cursor and focus input if started in CLI mode.

- Bugfix: Reload stat data if number of proxies or services has changed.

- Bugfix: Prevent infinite size sync if screen size is larger than supported.
  (Jérémy Bonnet)

- Docs: Add notes to INSTALL for the man page. (James Briggs)

- Docs: Fix hatop(1) man page and document the new hotkey footer.


HATop 0.7.6
-----------

:Date: Aug 20, 2010

- Bugfix: Support terminals lacking different cursor visibilities.
  (Matt Behrens)

- Bugfix: Handle empty or incomplete info and stat data.

- Bugfix: Handle unknown proxy names with the -p / --proxy filter options.

- Docs: Add initial hatop(1) man page


HATop 0.7.5
-----------

:Date: Aug 18, 2010

- Bugfix: Pressing ENTER on the embedded CLI could result in display
  corruption. (Cyril Bonté)

- Docs: Add common packaging files CHANGES and INSTALL

- Docs: Add keybind reference in KEYBINDS


HATop 0.7.4
-----------

:Date: Aug 16, 2010

- Bugfix: Fix the expected stat CSV format. (Jim Riggs)


HATop 0.7.3
-----------

:Date: Aug 16, 2010

- Bugfix: Restore compatibility with Python 2.4 and 2.5.


HATop 0.7.2
-----------

:Date: Aug 16, 2010

- Bugfix: Handle socket connections to incompatible HAProxy versions.


HATop 0.7.1
-----------

:Date: Aug 16, 2010

- Bugfix: Prevent timeout changes to the internal interactive session used to
  query for stats.


HATop 0.7.0
-----------

:Date: Aug 15, 2010

- The first public and feature complete version.

.. vim: tw=78
