# Use the Windows 10 ltsc2019 base image
FROM mcr.microsoft.com/windows:ltsc2019-amd64

# Define Env Variables
# Set the working directory for the container
ARG DOWNLOAD_DIR
ENV DOWNLOAD_DIR ${DOWNLOAD_DIR:-"C:\\office-install"}

# Set the version of the Office Deployment Tool
ARG OFFICE_DOWNLOAD_URL
ENV OFFICE_DOWNLOAD_URL ${OFFICE_DOWNLOAD_URL:-"https://download.microsoft.com/download/2/7/A/27AF1BE6-DD20-4CB4-B154-EBAB8A7D4A7E/officedeploymenttool_17531-20046.exe"}

# Set the workdir
RUN mkdir ${DOWNLOAD_DIR}
WORKDIR ${DOWNLOAD_DIR}

# Copy the XML configuration file into the container
COPY office-config.xml .

RUN echo %OFFICE_DOWNLOAD_URL%

# Download the Office Deployment Tool
RUN powershell -Command "Invoke-WebRequest -Uri '%OFFICE_DOWNLOAD_URL%' -OutFile office_install.exe"

# Run the Office Deployment Tool with the provided XML configuration
RUN office_install.exe /configure office-config.xml /log C:\\office_install.log

RUN odtsetup.exe /quiet /norestart /extract:C:\\odtsetup

# Set the working directory for the container
WORKDIR "C:\\"

# Clean up the downloaded files
RUN rmdir /s /q ${DOWNLOAD_DIR}

# https://stackoverflow.com/questions/10837437/interop-word-documents-open-is-null
RUN powershell -Command new-object -comobject word.application
RUN mkdir C:\\Windows\\SysWOW64\\config\\systemprofile\\Desktop

# Start the necessary process or application when the container starts
CMD [ "cmd" ]

VOLUME C:\\data

ADD test .