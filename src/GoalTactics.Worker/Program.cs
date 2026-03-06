using GoalTactics.Infrastructure;
using GoalTactics.Worker;

var builder = Host.CreateApplicationBuilder(args);
builder.Services.AddGoalTacticsInfrastructure(builder.Configuration);
builder.Services.AddGoalTacticsWorkerJobs();

var host = builder.Build();
host.Run();
