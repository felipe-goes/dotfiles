# Python 101

## How Python resolves imports

Python resolves imports by following a specific process known as the import
resolution algorithm. Here's a simplified overview of how Python resolves
imports:

- **Built-in Modules**: Python first checks if the module is a built-in module.
These are modules that are compiled into the Python interpreter itself. If the
module is found among the built-in modules, Python imports it directly.
- **sys.path**: If the module is not a built-in module, Python searches for it
in the directories listed in the `sys.path` variable. This variable is a list
of directory names where Python looks for modules. It typically includes the
current directory, the directories specified by the PYTHONPATH environment
variable, and the installation-dependent default.
- **Package Structure**: If the module is part of a package (i.e., it is
located within a directory containing an `__init__.py` file), Python looks for
the module inside that package directory.
- **Namespace Packages**: Starting from Python 3.3, Python supports namespace
packages, which are packages that can spread across multiple directories. When
importing from a namespace package, Python searches all directories listed in
`sys.path` and combines any modules or subpackages with the same name found in
different directories.
- **Importing Submodules**: If the imported module itself contains submodules
(i.e., it is a package), Python may need to recursively search for these
submodules following the same steps above.
`sys.modules`. If a module has already been imported, Python retrieves it from
- **Caching**: To improve performance, Python caches the imported modules in
this cache rather than searching for it again.

If Python fails to find the module following these steps, it raises an
**ImportError** exception.

Understanding how Python resolves imports is crucial for organizing your code and managing dependencies effectively.

## How to import package installed via pipx

When you use `pipx` to install packages, it installs them in separate virtual
environments, making them isolated from each other. To import a package
installed in a virtual environment created by `pipx`, you typically need to
activate that virtual environment or specify the full path to the package's
executable.

Here's how you can do it:

- **Activate the virtual environment (preferred method)**:
    - Activate the virtual environment using the `activate` script. The exact
    command depends on your operating system and shell:
        - On Unix/macOS with Bash/Zsh: `source /path/to/virtualenv/bin/activate`
        - On Windows with Command Prompt:
        `C:\path\to\virtualenv\Scripts\activate.bat`
        - On Windows with PowerShell: `C:\path\to\virtualenv\Scripts\Activate.ps1`
    - Once activated, you can import the package using Python as you normally
    would. Python will automatically search for packages installed within the
    activated virtual environment.

- **Specify the full path to the package's executable**:
    - If you don't want to activate the virtual environment, you can specify
    the full path to the package's executable. This is useful if you only need
    to use the package temporarily or in a script.
    - Find the full path to the package's executable. It's typically located in
    the `bin` (Unix/macOS) or `Scripts` (Windows) directory inside the virtual
    environment.
    - Use the full path to run the package's executable with Python. For example:

    ```
        bash

        /path/to/virtualenv/bin/python -m package_name
    ```

    Replace `/path/to/virtualenv` with the actual path to your virtual
    environment and `package_name` with the name of the package you want to
    import.

Using either of these methods, you can import and use packages installed in
virtual environments created by `pipx`. Remember that activating the virtual
environment is the preferred method for interactive use, as it sets up your
environment to use the package without needing to specify paths every time.

