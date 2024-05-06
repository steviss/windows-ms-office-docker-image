# Instructions

- If you want to create a custom config, please visit this page: https://config.office.com/

- To support this image, you need to be running Docker with **Windows Containers**, _not WSL or Linux ones._

# Get Process

- Get any process inside of a Windows Docker container

```powershell
powershell Get-Process -Name word.application
```

Check if MS Word Instance is running.

`word.application` is COM Object name.

# Installation process

**Please note:**

- Windows image is around _10GB_
- Office install is around _2GB_
- Total image size is around **13GB**

It will take a **long period** of time to install everything.

Keep in mind the build process will hang on download step and install step.

# Resources / Research

- https://learn.microsoft.com/en-us/deployoffice/office-deployment-tool-configuration-options#example-of-a-standard-configuration-file
- https://gist.github.com/rkttu/30c6d94ee09d912896462985c04a8daa
- https://stackoverflow.com/questions/10837437/interop-word-documents-open-is-null
- https://answers.microsoft.com/en-us/msoffice/forum/all/office-365-installation-inside-docker-container/776f1d7d-2bac-4b06-9d6f-281dbc9a582f
- https://mcr.microsoft.com/v2/windows/tags/list
- https://learn.microsoft.com/en-us/virtualization/windowscontainers/quick-start/run-your-first-container#run-a-windows-container
- https://learn.microsoft.com/en-us/virtualization/windowscontainers/quick-start/run-your-first-container
- https://stackoverflow.com/questions/60949149/installing-office-into-windows-container-servercoreltsc2019-failed-with-error
- https://stackoverflow.com/questions/28481811/how-to-correctly-check-if-a-process-is-running-and-stop-it
- https://stackoverflow.com/questions/32612650/how-to-get-docker-compose-to-always-re-create-containers-from-fresh-images
- https://stackoverflow.com/questions/1006923/automating-office-via-windows-service-on-server-2008/1680214#1680214
- https://learn.microsoft.com/en-us/deployoffice/overview-office-deployment-tool#install-microsoft-365-apps
