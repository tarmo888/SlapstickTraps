param([Parameter(Mandatory = $true)][string]$EngineRoot)
$ErrorActionPreference = 'Stop'

$ProjectRoot = Split-Path -Parent $PSScriptRoot
$ASTCStage = "$ProjectRoot\Saved\StagedBuilds\Wasm_ASTC"
Remove-Item "$ProjectRoot\Build\Wasm", "$ProjectRoot\Build\Wasm-Debug", $ASTCStage -Recurse -Force -ErrorAction SilentlyContinue

$CommonArguments = @(
    'BuildCookRun', '-nop4', '-utf8output', '-unattended',
    "-project=$ProjectRoot\Slapstick.uproject", '-target=Slapstick', '-platform=Wasm', '-clientconfig=Shipping',
    '-cook', '-stage', '-package', '-pak', '-iostore', '-distribution', '-nodebuginfo',
    '-AdditionalIoStoreOptions=-maxPartitionSize=190000000'
)

# Pass 1 stages an ASTC texture set for mobile browsers; pass 2 cooks the default BC set and merges ASTC into it.
& "$EngineRoot\Engine\Build\BatchFiles\RunUAT.bat" @CommonArguments -build -cookflavor=ASTC
if ($LASTEXITCODE -ne 0) { throw "Wasm ASTC packaging failed (exit code $LASTEXITCODE)" }

& "$EngineRoot\Engine\Build\BatchFiles\RunUAT.bat" @CommonArguments -skipbuild "-WasmAddTextureSet=$ASTCStage" `
    -archive "-archivedirectory=$ProjectRoot\Build"
if ($LASTEXITCODE -ne 0) { throw "Wasm packaging failed (exit code $LASTEXITCODE)" }
