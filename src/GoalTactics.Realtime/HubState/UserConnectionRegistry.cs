using System.Collections.Concurrent;

namespace GoalTactics.Realtime.HubState;

public sealed class UserConnectionRegistry
{
    private readonly ConcurrentDictionary<string, HashSet<string>> map = new(StringComparer.Ordinal);
    private readonly object gate = new();

    public void Add(string userId, string connectionId)
    {
        lock (gate)
        {
            if (!map.TryGetValue(userId, out var connections))
            {
                connections = new HashSet<string>(StringComparer.Ordinal);
                map[userId] = connections;
            }

            connections.Add(connectionId);
        }
    }

    public void Remove(string userId, string connectionId)
    {
        lock (gate)
        {
            if (!map.TryGetValue(userId, out var connections))
            {
                return;
            }

            connections.Remove(connectionId);
            if (connections.Count == 0)
            {
                map.TryRemove(userId, out _);
            }
        }
    }

    public IReadOnlyList<string> GetConnections(string userId)
    {
        lock (gate)
        {
            return map.TryGetValue(userId, out var connections)
                ? connections.ToArray()
                : [];
        }
    }
}
