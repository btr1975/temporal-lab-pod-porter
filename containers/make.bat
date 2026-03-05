@ECHO OFF
REM Make batch file to build Temporal container
REM Author: Benjamin P. Trachtenberg
REM Version: 2026.3.5.001
REM

SET option=%1
SET container_version=%2

IF "%option%" == "" (
    GOTO BAD_OPTIONS
)

IF "%container_version%" == "" (
    GOTO BAD_OPTIONS
)

IF "%option%" == "build-podman-temporal" (
    @ECHO "Building the temporal container with container_version=%container_version% in podman"
    podman build --tag temporal:latest --tag temporal:%container_version% -f Containerfile --format docker
    GOTO END
)

IF "%option%" == "build-docker-temporal" (
    @ECHO "Building the temporal container with container_version=%container_version% in docker"
    docker build --tag temporal:latest --tag temporal:%container_version% -f Containerfile .
    GOTO END
)

:OPTIONS
@ECHO make options
@ECHO     build-podman-temporal             To build the container in podman
@ECHO     build-docker-temporal             To build the container in docker
GOTO END

:BAD_OPTIONS
@ECHO Argument is missing
@ECHO Usage: make.bat option container_version
@ECHO.
GOTO OPTIONS

:END
