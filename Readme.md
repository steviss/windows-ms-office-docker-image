https://learn.microsoft.com/en-us/deployoffice/office-deployment-tool-configuration-options#example-of-a-standard-configuration-file

https://gist.github.com/rkttu/30c6d94ee09d912896462985c04a8daa

https://stackoverflow.com/questions/10837437/interop-word-documents-open-is-null

https://answers.microsoft.com/en-us/msoffice/forum/all/office-365-installation-inside-docker-container/776f1d7d-2bac-4b06-9d6f-281dbc9a582f

https://mcr.microsoft.com/v2/windows/tags/list

https://learn.microsoft.com/en-us/virtualization/windowscontainers/quick-start/run-your-first-container#run-a-windows-container

https://learn.microsoft.com/en-us/virtualization/windowscontainers/quick-start/run-your-first-container

https://stackoverflow.com/questions/60949149/installing-office-into-windows-container-servercoreltsc2019-failed-with-error

https://config.office.com/ <- Create a custom config

check if the process is running, go into container > Exec tab and run:

```powershell
powershell Get-Process -Name office_install
```

Please not, it takes 5GB to download Windows Container images, then some time to download and install office (~3GB). So ~8GB total downloads will be required.