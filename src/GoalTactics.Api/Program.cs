using System.Text;
using GoalTactics.Application.Common;
using GoalTactics.Application.Auth;
using GoalTactics.Application.Abstractions;
using GoalTactics.Application.Tutorial;
using GoalTactics.Application.User;
using GoalTactics.Application.Team;
using GoalTactics.Application.League;
using GoalTactics.Application.Friends;
using GoalTactics.Application.Ladder;
using GoalTactics.Application.Chat;
using GoalTactics.Application.Lineup;
using GoalTactics.Application.Live;
using GoalTactics.Application.Scouting;
using GoalTactics.Application.Shop;
using GoalTactics.Application.Sponsors;
using GoalTactics.Application.Squad;
using GoalTactics.Application.Stadium;
using GoalTactics.Application.Training;
using GoalTactics.Application.TransferMarket;
using GoalTactics.Api.Middleware;
using GoalTactics.Api.Security;
using GoalTactics.Api.Validation;
using GoalTactics.Infrastructure;
using GoalTactics.Infrastructure.Persistence;
using GoalTactics.Realtime;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Microsoft.IdentityModel.Tokens;
using System.IdentityModel.Tokens.Jwt;
using System.Threading.RateLimiting;

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.

builder.Services
    .AddControllers()
    .ConfigureApiBehaviorOptions(options =>
    {
        options.InvalidModelStateResponseFactory = ValidationErrorFactory.Create;
    });
builder.Services.AddSingleton<ICountryCatalog, InMemoryCountryCatalog>();
builder.Services.Configure<JwtOptions>(builder.Configuration.GetSection(JwtOptions.SectionName));
var jwtOptions = builder.Configuration.GetSection(JwtOptions.SectionName).Get<JwtOptions>() ?? new JwtOptions();
builder.Services.AddGoalTacticsInfrastructure(builder.Configuration);
builder.Services.AddGoalTacticsRealtime();
builder.Services.AddGoalTacticsRealtimeFilters();
builder.Services
    .AddAuthentication(JwtBearerDefaults.AuthenticationScheme)
    .AddJwtBearer(options =>
    {
        options.TokenValidationParameters = new TokenValidationParameters
        {
            ValidateIssuer = true,
            ValidIssuer = jwtOptions.Issuer,
            ValidateAudience = true,
            ValidAudience = jwtOptions.Audience,
            ValidateLifetime = true,
            ValidateIssuerSigningKey = true,
            IssuerSigningKey = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(jwtOptions.SigningKey)),
            ClockSkew = TimeSpan.FromMinutes(1)
        };

        options.Events = new JwtBearerEvents
        {
            OnTokenValidated = async context =>
            {
                var tokenId = context.Principal?.FindFirst(JwtRegisteredClaimNames.Jti)?.Value;
                if (string.IsNullOrWhiteSpace(tokenId))
                {
                    context.Fail("Token is missing jti claim.");
                    return;
                }

                var dbContext = context.HttpContext.RequestServices.GetRequiredService<GoalTacticsDbContext>();
                var now = DateTime.UtcNow;
                var isActive = await dbContext.UserSessions.AnyAsync(x => x.TokenId == tokenId && x.RevokedAtUtc == null && x.ExpiresAtUtc > now);

                if (!isActive)
                {
                    context.Fail("Session is revoked or expired.");
                }
            }
        };
    });
builder.Services.AddAuthorization();
builder.Services.AddRateLimiter(options =>
{
    options.RejectionStatusCode = StatusCodes.Status429TooManyRequests;
    options.AddPolicy("auth-sensitive", httpContext =>
    {
        var key = httpContext.Connection.RemoteIpAddress?.ToString() ?? "unknown";
        return RateLimitPartition.GetFixedWindowLimiter(
            partitionKey: key,
            factory: _ => new FixedWindowRateLimiterOptions
            {
                PermitLimit = 20,
                Window = TimeSpan.FromMinutes(1),
                QueueLimit = 0,
                AutoReplenishment = true
            });
    });
});
builder.Services.AddSingleton<IPasswordHasher, Pbkdf2PasswordHasher>();
builder.Services.AddSingleton<ITokenService, JwtTokenService>();
builder.Services.AddScoped<IAuthService, AuthService>();
builder.Services.AddScoped<ITutorialService, TutorialService>();
builder.Services.AddScoped<IUserService, UserService>();
builder.Services.AddScoped<ITeamService, TeamService>();
builder.Services.AddScoped<ILeagueService, LeagueService>();
builder.Services.AddScoped<IFriendsService, FriendsService>();
builder.Services.AddScoped<ILadderService, LadderService>();
builder.Services.AddScoped<IChatService, ChatService>();
builder.Services.AddScoped<ILineupService, LineupService>();
builder.Services.AddScoped<ILiveService, LiveService>();
builder.Services.AddScoped<IScoutingService, ScoutingService>();
builder.Services.AddScoped<IShopService, ShopService>();
builder.Services.AddScoped<ISponsorService, SponsorService>();
builder.Services.AddScoped<ISquadService, SquadService>();
builder.Services.AddScoped<IStadiumService, StadiumService>();
builder.Services.AddScoped<ITrainingService, TrainingService>();
builder.Services.AddScoped<ITransferMarketService, TransferMarketService>();
// Learn more about configuring OpenAPI at https://aka.ms/aspnet/openapi
builder.Services.AddOpenApi();

var app = builder.Build();

// Configure the HTTP request pipeline.
if (app.Environment.IsDevelopment())
{
    app.MapOpenApi();
}

using (var scope = app.Services.CreateScope())
{
    var dbContext = scope.ServiceProvider.GetRequiredService<GoalTacticsDbContext>();
    dbContext.Database.Migrate();
}

app.UseMiddleware<ErrorEnvelopeMiddleware>();

if (!app.Environment.IsDevelopment())
{
    app.UseHttpsRedirection();
}

app.UseRateLimiter();
app.UseAuthentication();
app.UseAuthorization();

app.MapControllers();
app.MapGoalTacticsRealtime();

app.Run();

public partial class Program;
