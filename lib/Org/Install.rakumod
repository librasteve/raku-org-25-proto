unit class Install;

use Air::Functional :BASE;
use Air::Base;

sub install-page(&basepage, &shadow) is export {
    basepage :REFRESH(10),
        main [
            shadow;
            div :align<center>, :style('position: relative; z-index: 0; padding: 20px;'), [
                h1 'rakubrew';
                tabs :align-nav<center>, [
                    linux-ish => tab linux-ish();
                    macOS     => tab macOS();
                    Windows   => tab Windows();
                ];
            ];

        ];
    }

sub linux-ish {
div [

markdown q:to/END/;

rakubrew is a [Raku](https://raku.org) installation tool. It allows you to have multiple versions of different Raku implementations installed in parallel and switch between them. It's a [perlbrew](https://perlbrew.pl/) and [plenv](https://github.com/tokuhirom/plenv) look alike and supports both flavours of commands.


# Features

    - Works about anywhere ... Windows, MacOS, Linux, BSD
    - Shell agnostic ... Powershell, CMD, Bash, Zsh, Fish ...
    - No dependencies except Perl on Unixy machines
    - Can get Raku installed and running in seconds
    - Autocomplete


# Installation

Just copy and paste the following piece of code into a console.

    curl https://rakubrew.org/install-on-perl.sh | sh


# Bare bones installation

If the above installation script somehow doesn't work for you, you can install
rakubrew manually.

First download the rakubrew executable:

    https://rakubrew.org/perl/rakubrew

Then give that file executable permissions:

    chmod +x rakubrew

Add the rakubrew and shim folders to your `PATH`:

    # Bash & ZSH
    export PATH=/path/where/rakubrew/is:$PATH
    export PATH=$(rakubrew home)/shims:$PATH

    # Fish
    fish_add_path -g /path/where/rakubrew/is
    fish_add_path -g (rakubrew home)/shims

Finally run

    rakubrew mode shim

That's all!
END

tail;
]
}

sub macOS {
div [
markdown q:to/END/;

rakubrew is a [Raku](https://raku.org) installation tool. It allows you to have multiple versions of different Raku implementations installed in parallel and switch between them. It's a [perlbrew](https://perlbrew.pl/) and [plenv](https://github.com/tokuhirom/plenv) look alike and supports both flavours of commands.


# Features

    - Works about anywhere ... Windows, MacOS, Linux, BSD
    - Shell agnostic ... Powershell, CMD, Bash, Zsh, Fish ...
    - No dependencies except Perl on Unixy machines
    - Can get Raku installed and running in seconds
    - Autocomplete


# Installation

Just copy and paste the following piece of code into a console.

    curl https://rakubrew.org/install-on-macos.sh | sh


# Bare bones installation

If the above installation script somehow doesn't work for you, you can install
rakubrew manually.

First download the rakubrew executable:

    https://rakubrew.org/macos/rakubrew     # Intel Mac
    https://rakubrew.org/macos_arm/rakubrew # ARM Mac

Then give that file executable permissions:

    chmod +x rakubrew

Now you first need to open it according to the instructions at https://support.apple.com/guide/mac-help/open-a-mac-app-from-an-unidentified-developer-mh40616 to tell MacOS' security system that you are actually sure you want to open the file.

Add the rakubrew and shim folders to your `PATH`:

    # Bash & ZSH
    export PATH=/path/where/rakubrew/is:$PATH
    export PATH=$(rakubrew home)/shims:$PATH

    # Fish
    fish_add_path -g /path/where/rakubrew/is
    fish_add_path -g (rakubrew home)/shims

Finally run

    rakubrew mode shim

That's all!
END

tail;
]
}

sub Windows {
div [
markdown q:to/END/;

rakubrew is a [Raku](https://raku.org) installation tool. It allows you to have multiple versions of different Raku implementations installed in parallel and switch between them. It's a [perlbrew](https://perlbrew.pl/) and [plenv](https://github.com/tokuhirom/plenv) look alike and supports both flavours of commands.


# Features

    - Works about anywhere ... Windows, MacOS, Linux, BSD
    - Shell agnostic ... Powershell, CMD, Bash, Zsh, Fish ...
    - No dependencies except Perl on Unixy machines
    - Can get Raku installed and running in seconds
    - Autocomplete


# Installation

On `CMD` you need to download https://rakubrew.org/install-on-cmd.bat and then
execute that script in a CMD terminal.

On `PowerShell` just copy and paste the following piece of code into a
Powershell window (Don't forget the "." at the start of the command!):

    . {iwr -useb https://rakubrew.org/install-on-powershell.ps1 } | iex

# Bare bones installation

First download the rakubrew executable:

    https://rakubrew.org/win/rakubrew.exe

Add the rakubrew and shim folders to your `PATH`:

    # Powershell
    $Env:Path = "/path/where/rakubrew/is;$Env:Path"
    $Env:Path = "$(rakubrew home)/shims;$Env:Path"

    # CMD
    SET PATH=/path/where/rakubrew/is;%PATH%
    FOR /F "delims=" %i IN ('"rakubrew" home') DO SET PATH=%i/shims;%PATH%

Finally run

    rakubrew mode shim

That's all!
END

tail;
]
}

sub tail {

markdown q:to/END/;

## Shell hook

If you want to use `env` mode, the `shell` command or have auto-completion, you need to install the shell hook. To get the instructions on how to do that type

    rakubrew init


## Installation path

To make rakubrew use a different directory to store its files set the `RAKUBREW_HOME` environment variable prior to calling it. Put the following into your `.bashrc` or similar:

    export RAKUBREW_HOME=~/rakubrew # or some other path


# How

    # list available versions
    rakubrew available

    # download and install the latest Rakudo on MoarVM version
    rakubrew download

    # switch to use that version (substitute the version you just installed)
    rakubrew switch moar-2025.05

    raku -e 'say "Now running {$*RAKU.compiler.version}!"'


# global, shell, local

rakubrew knows three different versions that can be set separately.

The `global` version is the one that is selected when neither the `shell` version nor the `local` version are active.

The `shell` version changes the active Raku version just in the current shell. Closing the current shell also looses the `shell` version.

The `local` version is specific to a folder. When CWD is in that folder or a sub folder that version of Raku is used. Only works in `shim` mode. To unset a local version one must delete the `.RAKU_VERSION` file in the respective folder.


# Modes

rakubrew can work in two distinct modes: `env` and `shim`

In `env` mode rakubrew modifies the `$PATH` variable as needed when switching between versions. This is neat because one then runs the executables directly. This is the default mode on *nix.

In `shim` mode rakubrew generates wrapper scripts called shims for all executables it can find in all the different Raku installations. These shims forward to the actual executable when called. This mechanism allows for some advanced features, such as local versions. When installing a module that adds scripts one must make rakubrew aware of these new scripts. This is done with

    rakubrew rehash

In `env` mode this is not necessary.


# Registering external versions

To add a Raku installation to rakubrew that was created outside of rakubrew one
should do:

    rakubrew register name-of-version /path/to/raku/install/directory


# Upgrading

    rakubrew self-upgrade


# Uninstall

To remove rakubrew and any Raku implementations it has installed on your
system, delete the  `~/.rakubrew` and `~/.local/share/rakubrew` directories.

# Further Info

More information on rakubrew is available [here](https://rakubrew.org/)

END

}

