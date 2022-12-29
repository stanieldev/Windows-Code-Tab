# Windows Code Tab
Adds a new folder to the current user called Code, where a user can store code and other related objects with a similar purpose as Documents, Downloads, and Pictures.

The `create.ps1` file is responsible for creating the folder, as well as the shortcut in File Explorer.

The `remove.ps1` file is responsible for removing the folder shortcut under This PC, but does not delete the directory at `%userprofile%/Code`.

## How to Create
To add the folder to File Explorer and Profile, run the `create.ps1` by right-clicking on the file -> Run With Powershell. The file explorer will be reloaded, and the folder should show under This PC.

## How to Remove
To add the folder to File Explorer and Profile, run the `remove.ps1` by right-clicking on the file -> Run With Powershell. The file explorer will be reloaded, and the folder should be removed from This PC. Note: The folder it was pointing to under `%userprofile%/Code` will remain after removal, since you may want to save the files in its.