using Mono.Cecil;
using Mono.Cecil.Cil;

if (args.Length < 3)
{
    Console.Error.WriteLine("Usage: AssemblyUrlPatcher <input-assembly> <output-assembly> <host> [--disable-helpshift] [--disable-appcenter] [--disable-appsflyer]");
    return 1;
}

var inputAssembly = Path.GetFullPath(args[0]);
var outputAssembly = Path.GetFullPath(args[1]);
var host = args[2].Trim().TrimEnd('/');
var disableHelpshift = args.Skip(3).Any(arg => arg == "--disable-helpshift");
var disableAppCenter = args.Skip(3).Any(arg => arg == "--disable-appcenter");
var disableAppsFlyer = args.Skip(3).Any(arg => arg == "--disable-appsflyer");

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

static void ReplaceMethodWithReturn(MethodDefinition method)
{
    method.Body.Instructions.Clear();
    method.Body.Variables.Clear();
    method.Body.ExceptionHandlers.Clear();
    method.Body.InitLocals = false;
    method.Body.GetILProcessor().Append(Instruction.Create(OpCodes.Ret));
}

static void ReplaceConstructorWithBaseCall(MethodDefinition method)
{
    var baseConstructor = method.DeclaringType.BaseType?.Resolve()?.Methods.FirstOrDefault(
        candidate => candidate.IsConstructor && !candidate.IsStatic && candidate.Parameters.Count == 0);
    if (baseConstructor is null)
    {
        throw new InvalidOperationException($"Could not resolve parameterless base constructor for {method.FullName}");
    }

    method.Body.Instructions.Clear();
    method.Body.Variables.Clear();
    method.Body.ExceptionHandlers.Clear();
    method.Body.InitLocals = false;

    var il = method.Body.GetILProcessor();
    il.Append(Instruction.Create(OpCodes.Ldarg_0));
    il.Append(Instruction.Create(OpCodes.Call, method.Module.ImportReference(baseConstructor)));
    il.Append(Instruction.Create(OpCodes.Ret));
}

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

            if (disableHelpshift && type.Name == "MainActivity" && method.Name == "InitializeHelpshift" && method.Parameters.Count == 0)
            {
                ReplaceMethodWithReturn(method);
                replacementsApplied++;
            }

            if (disableAppCenter && type.Name == "AppCenterAnalyticsService" && method.IsConstructor && !method.IsStatic && method.Parameters.Count == 0)
            {
                ReplaceConstructorWithBaseCall(method);
                replacementsApplied++;
            }

            if (disableAppsFlyer && type.Name == "AppsFlyerAnalyticsService" && method.IsConstructor && !method.IsStatic && method.Parameters.Count == 1)
            {
                ReplaceConstructorWithBaseCall(method);
                replacementsApplied++;
            }
        }
    }
}

Directory.CreateDirectory(Path.GetDirectoryName(outputAssembly)!);
assembly.Write(outputAssembly);

Console.WriteLine($"Patched assembly: {outputAssembly}");
Console.WriteLine($"Replacements applied: {replacementsApplied}");
Console.WriteLine($"Disable Helpshift: {disableHelpshift}");
Console.WriteLine($"Disable AppCenter: {disableAppCenter}");
Console.WriteLine($"Disable AppsFlyer: {disableAppsFlyer}");

return replacementsApplied > 0 ? 0 : 2;