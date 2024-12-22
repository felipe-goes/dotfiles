# How can i develop a unity project in neovim using a wsl in windows?

Developing a Unity project in Neovim using WSL (Windows Subsystem for Linux)
can be a productive setup if you're comfortable with command-line tools and
want to leverage the power of Linux within Windows. Here's a step-by-step guide
on how you can set up this development environment:

## Prerequisites

1. **Windows Subsystem for Linux (WSL)** installed and set up. If you haven't
   already done so, follow these steps to install WSL:
   - Open PowerShell as Administrator and run:
     ```bash
     wsl --install
     ```
   - Choose your preferred Linux distribution (e.g., Ubuntu) from the Microsoft Store.
2. **Unity** installed on your Windows machine.
3. **Neovim** installed on your WSL environment.
4. **Unity project created** (or you can create one through Unity Hub).
5. **X Server (for GUI apps, if you want Unity's editor to work inside WSL)**.
   However, note that Unity's editor is not directly supported inside WSL because
   it is a GUI application. You will use WSL for code editing and asset
   management, and run the Unity editor natively on Windows.

## 1. Setting Up Neovim in WSL

First, ensure that you have Neovim installed inside your WSL environment:

```bash
sudo apt update
sudo apt install neovim
```

## 2. Install Useful Plugins for Unity Development

Neovim can be extended with plugins to provide syntax highlighting,
autocompletion, and other features for C# (Unity uses C# for scripting). The
recommended plugins for Unity development are:

- **`coc.nvim`** for autocompletion (via the Language Server Protocol).
- **`nvim-lspconfig`** for setting up LSP (Language Server Protocol) servers
  for C#.
- **`vim-unity3d`** for Unity-specific syntax highlighting.

To set up these plugins, follow these steps:

### Install Plugin Manager

If you don't have a plugin manager yet, you can use **`vim-plug`** or
**`packer.nvim`**. Here’s how to set up **`vim-plug`**:

1. Install `vim-plug`:
   ```bash
   curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
     https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
   ```
2. Open Neovim and add the following to your `init.vim` or `init.lua`
   (located in `~/.config/nvim/`):

```vim
call plug#begin('~/.vim/plugged')

" C# and Unity Support
Plug 'OmniSharp/omnisharp-vim'  " OmniSharp for Unity C# support
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'nvim-lspconfig'
Plug 'sheerun/vim-polyglot'  " Syntax highlighting for many languages

call plug#end()
```

3. Run `:PlugInstall` inside Neovim to install the plugins.

### Set Up OmniSharp

To get C# IntelliSense (autocomplete and error checking), you can use
**OmniSharp** with the `omnisharp-vim` plugin. You will need to install
**OmniSharp** on your WSL:

```bash
curl -sSL https://github.com/OmniSharp/omnisharp-roslyn/releases/download/v1.37.0/omnisharp-linux-x64.tar.gz -o omnisharp.tar.gz
mkdir -p ~/.omnisharp
tar -xvzf omnisharp.tar.gz -C ~/.omnisharp
rm omnisharp.tar.gz
```

Now, configure `omnisharp-vim` to point to the correct OmniSharp executable.
Add this to your `init.vim`:

```vim
let g:omnisharp_server_path = '~/.omnisharp/OmniSharp.dll'
let g:omnisharp_server_use_mono = 1
```

### Configure LSP (Language Server Protocol)

For LSP with C#, you can use the `coc.nvim` plugin and configure it with the
**C# LSP server**.

1. Install the **coc.nvim** extension for C#:
   - Open Neovim and run:
     ```vim
     :CocInstall coc-csharp
     ```
2. Once installed, `coc.nvim` will handle autocompletion and language features
   like go-to-definition and linting.

## 3. Sync Your Unity Project with WSL

You can access your Unity project from within WSL. You have two main options:

- **Work on the files in the Windows filesystem from WSL** (not recommended for
  performance reasons, but works well for small projects).
- **Work on the files in the WSL filesystem** and sync with Unity on the
  Windows side.

### Option 1: Access Windows Files from WSL

Your Unity project folder on Windows can be accessed inside WSL under the
`/mnt/c/` directory. For example, if your Unity project is located at
`C:\Projects\UnityGame`, you can open it in WSL with:

```bash
cd /mnt/c/Projects/UnityGame
nvim .
```

### Option 2: Use `wslpath` to Sync Paths Between WSL and Windows

If you want to work inside the Linux filesystem for performance reasons, you
can store your project inside the WSL filesystem (e.g., `~/projects/UnityGame`)
and use a symbolic link in Windows to sync the project folder.

```bash
ln -s ~/projects/UnityGame /mnt/c/Projects/UnityGame
```

Then you can open Unity with the project located in Windows, but still edit the
project using WSL.

## 4. Running Unity Editor

Unfortunately, Unity's editor cannot run inside WSL because it requires a GUI.
You will need to run the Unity editor natively on Windows, while using Neovim
and your preferred Linux-based tools (via WSL) for coding and other tasks.

However, you can still manage the project files, edit code, and compile scripts
within the WSL environment.

## 5. Using Git for Version Control

You can use Git for version control, and it works seamlessly across both
environments (Windows and WSL). You can commit, push, and pull from WSL, and
Unity will still work fine with your Git setup as long as it's within the same
project directory.

## Summary of Workflow:

1. **Unity Editor**: Runs natively on Windows for managing assets, scenes, and
   compiling the project.
2. **Neovim**: Used in WSL for editing C# scripts, providing a lightweight and
   fast code editing environment.
3. **OmniSharp**: Provides C# syntax highlighting and IntelliSense features in
   Neovim.
4. **Git**: Used for version control across the two environments.
5. **Optional**: Sync project files between Windows and WSL if needed.

This setup allows you to enjoy the speed and flexibility of a Linux development
environment with the Unity editor's full power on Windows.

# Is C# a script or a compiled language?

C# is a **compiled language**.

When you write C# code, it's typically compiled into an intermediate language
(IL) by the C# compiler (`csc`). This intermediate language is not directly
executed by the computer's hardware but is instead run by the **Common Language
Runtime (CLR)**, which is part of the .NET Framework or .NET Core. The CLR
takes care of converting the IL into machine code at runtime, a process known
as **Just-In-Time (JIT) compilation**.

So, while the C# code is compiled into an intermediate form first, it is
ultimately compiled into machine code when the application is run. This is
different from purely interpreted languages, where the code is executed
directly without an intermediate compilation step.

# When I develop a game in unity, do I use UnityScript language or C#? Are they different or they are the same?

When developing a game in Unity, **you use C#**, not UnityScript.

## UnityScript vs C#

- **UnityScript**: UnityScript was a JavaScript-like language used in older
  versions of Unity. It was similar in syntax to JavaScript, but it was
  specifically designed for Unity's engine. UnityScript was deprecated and
  removed from Unity as of **Unity 2017**.
- **C#**: Since Unity 2017, **C#** has been the primary and recommended
  language for writing scripts in Unity. C# is a powerful, modern,
  object-oriented language that integrates well with Unity's engine, offering a
  rich set of features and support for the Unity API.

## Why C# Over UnityScript?

- **Performance**: C# is generally more efficient and optimized compared to
  UnityScript.
- **Industry Standard**: C# is widely used in the game development industry and
  provides greater flexibility, making it easier to transition between Unity and
  other platforms or engines.
- **Future-Proofing**: Since UnityScript is deprecated, all new features and
  updates in Unity are designed around C#.

## Conclusion

If you're starting a new Unity project or maintaining an existing one, you'll
be using **C#**. UnityScript is obsolete and no longer part of the Unity
development ecosystem. C# is the standard and preferred language for Unity game
development.

# What is the setup needed for compiling c# code in Ubuntu?

Obs: Quando fiz essa pergunta, instalei a versão 8 ao invés da 7 sugerida.

To compile and run C# code on Ubuntu, you need to set up the .NET SDK (Software
Development Kit), which includes everything necessary to develop, build, and
run C# programs. Here's a step-by-step guide to setting up C# development on
Ubuntu:

## 1. **Install .NET SDK**

The .NET SDK includes the necessary tools to compile and run C# programs. You
can install it on Ubuntu by following these steps:

### a. **Update package list**

Open your terminal and run:

```bash
sudo apt update
```

### b. **Install the .NET SDK**

Run the following commands to install the .NET SDK (make sure you're using the
latest version of .NET):

```bash
sudo apt install -y dotnet-sdk-7.0
```

This installs the .NET SDK for .NET 7.0 (replace `7.0` with the latest version
if necessary).

You can check for the latest version of the .NET SDK on the [official Microsoft
page](https://dotnet.microsoft.com/download).

Alternatively, if you prefer to install a specific version, you can follow the
detailed instructions on the official Microsoft site for Ubuntu, which will
guide you through adding their repository to your system and installing a
particular version.

## 2. **Verify the Installation**

To verify that the installation was successful, run the following command to
check the .NET version:

```bash
dotnet --version
```

This should display the version of the .NET SDK you installed.

## 3. **Create a New C# Project**

You can now create a new C# project by using the `dotnet` command. To create a
simple console application:

```bash
dotnet new console -n MyCSharpApp
```

This creates a new directory called `MyCSharpApp` with a basic "Hello, World!"
C# program inside.

## 4. **Navigate to the Project Directory**

```bash
cd MyCSharpApp
```

## 5. **Compile and Run the C# Program**

To compile and run the program, use the following command:

```bash
dotnet run
```

This will compile and execute the `Program.cs` file, and you should see the
output on the terminal (typically "Hello, World!" for a default project).

## 6. **Optional: Install a Code Editor**

Although you can write C# code in any text editor, using a specialized editor
like **Visual Studio Code (VS Code)** can make things easier.

- Install **VS Code**:

```bash
sudo snap install --classic code
```

- Install the C# extension for VS Code:

Once VS Code is installed, open it and search for the **C# extension** by
Microsoft in the Extensions Marketplace. This extension provides IntelliSense,
debugging support, and other useful features.

## 7. **Debugging and Additional Tools**

To debug C# code in Ubuntu, you can use **Visual Studio Code** (with the C#
extension) or the **Visual Studio for Mac** (if you prefer a GUI-based IDE).

For advanced development, you can also use **Rider** (a cross-platform IDE by
JetBrains) for C# development, although it is a paid tool after the trial
period.

## Summary of Commands:

1. **Update system**: `sudo apt update`
2. **Install .NET SDK**: `sudo apt install dotnet-sdk-7.0`
3. **Create project**: `dotnet new console -n MyCSharpApp`
4. **Run project**: `dotnet run`

With this setup, you're ready to start writing and compiling C# programs on
Ubuntu!

# Question

Using this code and dragging and dropping it to a square object (called player)
above another square object (called ground) I was able to detect collision
between both and managed to make the player jump. explain me how this behavior
works in Unity. for example, how Unity knows when to call the method
OnCollisionEnter2D and how it works?

```cs
using UnityEngine;

public class ControlPlayer : MonoBehaviour
{
    bool isOnGround;

    void OnCollisionEnter2D(Collision2D coll) {
        if(coll.collider.name == "ground")
            isOnGround = true;
        else
            isOnGround = false;
    }

    void Jump() {
        GetComponent<Rigidbody2D>().AddForce(new Vector2(0, 400.0f));
        isOnGround = false;
    }

    // Start is called once before the first execution of Update after the MonoBehaviour is created
    void Start()
    {

    }

    // Update is called once per frame
    void Update()
    {
        if(Input.GetKeyDown(KeyCode.Space) && isOnGround)
            Jump();
    }
}
```

## Answer

In Unity, the behavior you're seeing with the `OnCollisionEnter2D` method is
related to Unity's physics system, specifically 2D collisions. Here's a
detailed explanation of how this works and why Unity knows when to call
`OnCollisionEnter2D` in your code:

## 1. **Unity's Physics System**

Unity uses a physics engine to simulate physical interactions between objects
in the game. For 2D games, Unity uses the **Box2D** physics engine, which
allows you to simulate rigid bodies, collisions, and other physical behaviors.
Unity automatically detects when two objects with appropriate colliders (like
`BoxCollider2D`, `CircleCollider2D`, etc.) come into contact.

## 2. **Colliders and Rigidbodies**

For collisions to be detected, both objects involved in the collision must have
**colliders** attached to them. In your case, you have two square objects:
**player** and **ground**.

- The **player** object must have a **collider** (e.g., `BoxCollider2D`).
- The **ground** object must also have a collider (usually a `BoxCollider2D`
  for a simple square or rectangle).

Additionally, for the physics engine to process forces like gravity and
jumping, the **player** object needs to have a `Rigidbody2D` component
attached. This is a component that allows Unity to handle the physical
simulation of the object, including movement, forces, and collisions.

## 3. **The Role of `OnCollisionEnter2D`**

The method `OnCollisionEnter2D` is a special Unity callback method that is
automatically called when the object with the attached script collides with
another object. Unity uses its physics engine to detect when two colliders make
contact, and it triggers this method. Here's a breakdown of how it works:

- **Collision Detection**: Every frame, Unity checks for collisions between
  colliders attached to game objects. If a collision is detected, it calculates
  the details of the collision, such as the objects involved, their positions,
  and the forces involved.
- **Calling `OnCollisionEnter2D`**: When a collision occurs, Unity
  automatically calls `OnCollisionEnter2D` on the script attached to the
  `GameObject` that has a `Collider2D` (in this case, the `player` object). The
  `Collision2D` parameter (`coll`) that is passed into the method contains
  information about the other object involved in the collision, such as the
  collider that was hit.

## 4. **What Happens in Your Code**

- The `OnCollisionEnter2D` method is triggered whenever the player object
  collides with another collider (like the ground).
- Inside `OnCollisionEnter2D`, you are checking if the collider that the player
  collided with is the "ground" (using `coll.collider.name == "ground"`). If this
  is true, the `isOnGround` flag is set to `true`, indicating that the player is
  on the ground. Otherwise, `isOnGround` is set to `false`.

## 5. **The Jumping Logic**

- The `Jump()` method is called when the spacebar (`KeyCode.Space`) is pressed,
  and the player is confirmed to be on the ground (`isOnGround` is `true`).
- Inside `Jump()`, the player's Rigidbody2D component is used to apply a force
  upwards (`AddForce(new Vector2(0, 400.0f))`). This force simulates a jump.
  After the jump, `isOnGround` is set to `false`, preventing the player from
  jumping again until they land.

## 6. **How Unity Knows When to Call `OnCollisionEnter2D`**

Unity calls the `OnCollisionEnter2D` method automatically during the physics
simulation, when:

- The player’s collider (attached to the player) comes into contact with
  another collider (attached to the ground).
- The collision is detected by the physics engine.
- Unity triggers the `OnCollisionEnter2D` method and passes in a `Collision2D`
  object, which contains data about the other collider involved (e.g., the
  ground).

In summary:

- **Unity detects the collision** between two objects based on their colliders.
- When the player object collides with the ground, the `OnCollisionEnter2D`
  method is called.
- You check the collider's name to see if it’s the ground and update the
  `isOnGround` flag.
- When the player presses space and is on the ground, the `Jump()` method is
  invoked to apply a force and simulate the jump.

This interaction is all driven by Unity’s physics system, which automatically
handles collision detection and triggers the appropriate callbacks.

# Build Settings

Unity's **Build Settings** are crucial for specifying which scenes will be
included when you build your game. The Build Settings manage the configuration
of the game's build, determining things like the scenes to include, the
platform you're building for, and other project settings. Here's a breakdown of
how the Build Settings work and whether you need to update them for every new
scene:

## How Build Settings Work:

1. **Scenes in Build:**

   - In Unity, each scene you create is not automatically included in your
     final build.
   - The Build Settings window allows you to add or remove scenes from the list
     of scenes that will be included when you build the game.
   - The **Scenes In Build** section shows all the scenes that will be included
     in your game. These are listed with their file paths and checkboxes next to
     them to indicate whether they will be part of the build.

2. **Adding Scenes:**

   - When you create a new scene, it won’t be added to the build automatically.
     You’ll need to manually add it to the Build Settings.
   - To do this, go to `File > Build Settings...` and then click the "Add Open
     Scenes" button to add the currently open scene to the list. You can also
     drag and drop scene files directly into the "Scenes In Build" list.

3. **Scene Order:**

   - The order of scenes in the list matters, as the first scene listed is
     typically your game’s starting scene (i.e., the scene that will be loaded
     first when the game runs).
   - You can change the order by selecting a scene in the list and using the up
     or down arrows to reorder them.

4. **Platform Configuration:**

   - The Build Settings window also allows you to choose the platform you are
     building for (PC, iOS, Android, WebGL, etc.). Each platform may have
     different requirements, such as different settings or optimizations, so be
     sure to check your settings based on the platform you're targeting.

## Do You Need to Update the Build Settings for Every New Scene?

Yes, you need to update the Build Settings whenever you add a new scene that
you want to include in your build.

- **When you create a new scene**, it won’t be automatically included in the
  Build Settings.
- If you want that scene to be part of the final build, you must add it
  manually to the **Scenes In Build** section of the Build Settings.
- If the scene is not in the Build Settings, it won’t be accessible in the
  game, even though you can still navigate to it in the editor.

## To Summarize:

- **New Scene**: Add it manually to the Build Settings (via "Add Open Scenes"
  or drag-and-drop).
- **Build Settings**: You need to manually update the Build Settings for each
  new scene you want to include in your game build.
- **Order**: Make sure the order of the scenes reflects the desired flow of
  your game, especially the first scene that gets loaded.

By keeping the Build Settings updated, you ensure that all necessary scenes are
compiled into the build and that the game runs as intended.
