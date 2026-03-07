using Mono.Cecil;
using Mono.Cecil.Cil;

if (args.Length < 3)
{
    Console.Error.WriteLine("Usage: AssemblyUrlPatcher <input-assembly> <output-assembly> <host>");
    Console.Error.WriteLine();
    Console.Error.WriteLine("This tool only supports fixed-string backend URL patching.");
    Console.Error.WriteLine("Unsafe GT.Droid startup rewrites were removed because they produced crash-prone assemblies for the legacy Xamarin assembly store.");
    return 1;
}

var inputAssembly = Path.GetFullPath(args[0]);
var outputAssembly = Path.GetFullPath(args[1]);
var host = args[2].Trim().TrimEnd('/');
var unsupportedFlags = args
    .Skip(3)
    .Where(arg => arg is "--disable-helpshift" or "--disable-appcenter" or "--disable-appsflyer")
    .Distinct(StringComparer.Ordinal)
    .ToArray();

if (unsupportedFlags.Length > 0)
{
    Console.Error.WriteLine("Unsupported flag(s): " + string.Join(", ", unsupportedFlags));
    Console.Error.WriteLine("Behavior-changing GT.Droid rewrites are intentionally blocked.");
    Console.Error.WriteLine("Use the descriptor-index-fixed GT.Core URL patch path instead of modifying startup methods or analytics constructors.");
    return 3;
}

var unexpectedFlags = args.Skip(3).Distinct(StringComparer.Ordinal).ToArray();
if (unexpectedFlags.Length > 0)
{
    Console.Error.WriteLine("Unsupported argument(s): " + string.Join(", ", unexpectedFlags));
    return 1;
}

var replacements = new Dictionary<string, string>
{
    ["https://engine.goaltactics.de/GameEngine/"] = $"https://{host}/api/",
    ["http://goaltacticswebapp-goaltacticswebappstaging.azurewebsites.net/GameEngine/"] = $"http://{host}/api/",
    ["https://gtwebapp2.azurewebsites.net/"] = $"https://{host}/",
    ["http://gtwebapp2-gtwebapp2staging.azurewebsites.net/"] = $"http://{host}/",
};

var resolver = new DefaultAssemblyResolver();
resolver.AddSearchDirectory(Path.GetDirectoryName(inputAssembly)!);

var readerParameters = new ReaderParameters
{
    AssemblyResolver = resolver,
    ReadWrite = false,
    InMemory = true,
};

using var assembly = AssemblyDefinition.ReadAssembly(inputAssembly, readerParameters);

var replacementsApplied = 0;

foreach (var module in assembly.Modules)
{
    foreach (var type in module.GetTypes())
    {
        foreach (var field in type.Fields)
        {
            if (field.HasConstant && field.Constant is string value && replacements.TryGetValue(value, out var replacement))
            {
                field.Constant = replacement;
                replacementsApplied++;
            }
        }

        foreach (var method in type.Methods)
        {
            if (!method.HasBody)
            {
                continue;
            }

            foreach (var instruction in method.Body.Instructions)
            {
                if (instruction.OpCode != OpCodes.Ldstr || instruction.Operand is not string value)
                {
                    continue;
                }

                if (replacements.TryGetValue(value, out var replacement))
                {
                    instruction.Operand = replacement;
                    replacementsApplied++;
                }
            }
        }
    }
}

Directory.CreateDirectory(Path.GetDirectoryName(outputAssembly)!);
assembly.Write(outputAssembly);

Console.WriteLine($"Patched assembly: {outputAssembly}");
Console.WriteLine($"Replacements applied: {replacementsApplied}");

return replacementsApplied > 0 ? 0 : 2;