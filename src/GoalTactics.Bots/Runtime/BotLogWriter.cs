using System.Text;

namespace GoalTactics.Bots.Runtime;

public sealed class BotLogWriter : IAsyncDisposable
{
    private readonly SemaphoreSlim gate = new(1, 1);
    private readonly Dictionary<string, StreamWriter> writers = new(StringComparer.Ordinal);

    public BotLogWriter(string rootPath)
    {
        RootPath = rootPath;
        Directory.CreateDirectory(rootPath);
    }

    public string RootPath { get; }

    public async Task WriteAsync(string fileName, string line)
    {
        await gate.WaitAsync();
        try
        {
            if (!writers.TryGetValue(fileName, out var writer))
            {
                var path = Path.Combine(RootPath, fileName);
                writer = new StreamWriter(path, append: true, Encoding.UTF8) { AutoFlush = true };
                writers[fileName] = writer;
            }

            await writer.WriteLineAsync(line);
        }
        finally
        {
            gate.Release();
        }
    }

    public async ValueTask DisposeAsync()
    {
        foreach (var writer in writers.Values)
        {
            await writer.DisposeAsync();
        }

        gate.Dispose();
    }
}
