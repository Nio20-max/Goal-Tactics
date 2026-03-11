using System.IO;
using System.Runtime.CompilerServices;
using Xunit;

[assembly: CollectionBehavior(DisableTestParallelization = true)]

internal static class TestAssembly
{
	[ModuleInitializer]
	internal static void ResetContractTestDatabase()
	{
		var baseDirectory = AppContext.BaseDirectory;
		foreach (var suffix in new[] { string.Empty, "-wal", "-shm" })
		{
			var path = Path.Combine(baseDirectory, $"goaltactics.db{suffix}");
			if (File.Exists(path))
			{
				File.Delete(path);
			}
		}
	}
}