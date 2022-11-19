# Instructions

1. Put the ***random_wallpaper.ps1*** in the same folder as wallpaper images. (Not required but it is easier to remember this way.)

2. Create a schedule task to run at logon with,

> Action => Start Program
> 
> Program => "C:\Users\username\AppData\Local\Microsoft\WindowsApps\wt.exe"
> 
> Arguments => "pwsh -File /Users/username/Desktop/wallpaper/random_wallpaper.ps1"

  The example uses ***Windows Terminal*** to open powershell and run the script.
