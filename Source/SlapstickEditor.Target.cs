using UnrealBuildTool;

public class SlapstickEditorTarget : TargetRules
{
	public SlapstickEditorTarget(TargetInfo Target) : base(Target)
	{
		Type = TargetType.Editor;
		DefaultBuildSettings = BuildSettingsVersion.V8;
		IncludeOrderVersion = EngineIncludeOrderVersion.Unreal5_9;
		ExtraModuleNames.Add("Slapstick");
	}
}