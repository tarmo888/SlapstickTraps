using UnrealBuildTool;

public class SlapstickTarget : TargetRules
{
	public SlapstickTarget(TargetInfo Target) : base(Target)
	{
		Type = TargetType.Game;
		DefaultBuildSettings = BuildSettingsVersion.V8;
		IncludeOrderVersion = EngineIncludeOrderVersion.Unreal5_9;
		ExtraModuleNames.Add("Slapstick");
	}
}