# Use the Windows 10 ltsc2019 base image
FROM mcr.microsoft.com/windows:ltsc2019-amd64 as build

# Make directory for the Office Deployment Tool
RUN mkdir C:\\office-install

# Set the workdir
WORKDIR C:\\office-install

# Download the Office Deployment Tool
ADD https://download.microsoft.com/download/2/7/A/27AF1BE6-DD20-4CB4-B154-EBAB8A7D4A7E/officedeploymenttool_17531-20046.exe C:\\office_install.exe

# Download and extract the Office Deployment Tool
RUN C:\\office_install.exe /quiet /norestart /extract:C:\\office-install

FROM mcr.microsoft.com/windows:ltsc2019-amd64 AS download

WORKDIR C:\\office-install

# Copy setup.exe from the build stage
COPY --from=build C:\\office-install\\setup.exe .

# Copy the XML configuration file into the container
COPY ./office-install/office-config.xml .

# Run the Office Deployment Tool to download Office
RUN setup.exe /download office-config.xml

FROM mcr.microsoft.com/windows:ltsc2019-amd64

WORKDIR C:\\office-install

# Copy setup.exe and downloaded Office files from previous stages
COPY --from=build C:\\office-install\\setup.exe .
COPY --from=download C:\\office-install\\Office .

# Create desktop folders to prevent Office installation issues
RUN mkdir C:\\Windows\\SysWOW64\\config\\systemprofile\\Desktop
RUN mkdir C:\\Windows\\System32\\config\\systemprofile\\Desktop

# Copy the XML configuration file into the container
COPY ./office-install/office-config.xml .

# Run the Office Deployment Tool to install Office
RUN setup.exe /configure office-config.xml

# Set the working directory for the container
WORKDIR "C:\\"


# Create test directory
RUN mkdir C:\\test

# Create app directory and copy PowerShell script
RUN mkdir C:\\app
COPY ./app/keep_container_alive.ps1 C:\\app\\

# Set execution policy to allow script execution
RUN powershell.exe Set-ExecutionPolicy -ExecutionPolicy Bypass -Scope Process -Force

# Run PowerShell script to keep the container running
CMD ["powershell.exe", "-ExecutionPolicy", "Bypass", "-File", "C:\\app\\keep_container_alive.ps1"]
