          # Josh Gold
          # This Powershell script cleans up Windows Server Update Services (WSUS) by removing obsolete updates, among other things.  
          # It is important to automate this using scheduled tasks as the WSUS database can quickly get too large to be functional.

          #If you are running this script locally, you do not need to specify anything, but if you need to run it against a remote WSUS server, 
          # then specifying the –Name and –Port parameter will be required.
          
          #Use these two lines if you want to force the script to follow Powershell best practices
          Set-StrictMode -Version Latest

          #Use this line if you want to push through any errors without screen output
          #$ErrorActionPreference = "SilentlyContinue"

          Get-WSUSServer | Invoke-WsusServerCleanup -CleanupObsoleteUpdates -CleanupUnneededContentFiles -CompressUpdates -DeclineExpiredUpdates  -DeclineSupersededUpdates |
           Out-file -FilePath C:\WSUS\cleanup_results.txt
