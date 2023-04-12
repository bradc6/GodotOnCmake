# GotdotOnCmake

## Motivation

Godot is a very cool engine that offers a great mixture of great features some users have found the process of compiling and editing the engine from source to be cumbersome due to the limitations of scons. Some of the findings that have been observed...

  * Integrated Developer Environment
    * Cmake is supported by many popular development environments; enabling better integration compared to running an external build process that is more difficult to introspect [https://cmake.org/cmake/help/latest/manual/cmake-generators.7.html]
  * Causes additional issues integrating libraries
      * While there is no official C/C++ buildsystem; Cmake has become a very popular option leaving many upstream libraries to be built with Cmake so integration takes less time
  * Performance
    * In rough no-op (no source changes) it took a magnitudes longer to complete with SCons

All of this is not to say "Everyone should use SCons" or anything of that nature and in the interest of fairness here is the official Godot SCons usage[https://docs.godotengine.org/en/stable/contributing/development/compiling/introduction_to_the_buildsystem.html]. So do your own investigation to determine the ROI on which to use.

## Features

  * Cmake scripts to build Godot [See below]
  * Debug helpers for different IDEs that we've found helpful


## Status

The Cmake build scripts are SUPER ALPHA so expect to modify and [hopefully] contribute back upstream. The scripts at time of writing work on Godot 4.0 RC1.
What builds currently? Located in the "develop" branch

 - [ ] Generators
    - [ ] GLES Shaders
    - [ ] Vulkan Shaders
 - [-] Godot Editor
    - [-] Linux (x86_64 Debug)
    - [ ] MacOS
    - [-] Windows (x86_64 Debug)
 - [ ] Godot Client Templates
    - [ ] Linux
    - [ ] MacOS
    - [ ] Windows
    - [ ] Android
    - [ ] iOS

## Contact

Please create pull requests and issues @ https://github.com/bradc6/GotdotOnCmake

If this becomes popular enough I'll move it into a org.


## Donate

If you feel so inclined.....

https://www.paypal.com/donate/?business=PKK59T52GDT3Y&no_recurring=0&item_name=Thank+you+for+supporting+the+creation+of+cool+stuff.+Who%27s+awesome?+You+awesome%21&currency_code=USD