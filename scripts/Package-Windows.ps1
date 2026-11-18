param([Parameter(Mandatory = $true)][string]$EngineRoot)
$ErrorActionPreference = 'Stop'

$ProjectRoot = Split-Path -Parent $PSScriptRoot
Remove-Item "$ProjectRoot\Build\Windows", "$ProjectRoot\Build\Windows-Debug" -Recurse -Force -ErrorAction SilentlyContinue
# Partition size, alignment and block size follow Valve's SteamPipe recommendations for delta patches.
& "$EngineRoot\Engine\Build\BatchFiles\RunUAT.bat" BuildCookRun -nop4 -utf8output -unattended `
    "-project=$ProjectRoot\Slapstick.uproject" -target=Slapstick -platform=Win64 -clientconfig=Shipping `
    -build -cook -stage -package -pak -iostore -prereqs -distribution -nodebuginfo `
    '-AdditionalIoStoreOptions=-maxPartitionSize=2000000000 -iostorepatchpaddingalign=1048576' `
    '-AdditionalPakOptions=-blocksize=1048576' `
    -archive "-archivedirectory=$ProjectRoot\Build"
if ($LASTEXITCODE -ne 0) { throw "Windows packaging failed (exit code $LASTEXITCODE)" }
