using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;
using System.Text;
using GoalTactics.Application.Abstractions;
using Microsoft.Extensions.Options;
using Microsoft.IdentityModel.Tokens;
using AppTokenValidationResult = GoalTactics.Application.Abstractions.TokenValidationResult;

namespace GoalTactics.Api.Security;

public sealed class JwtTokenService(IOptions<JwtOptions> optionsAccessor) : ITokenService
{
    private readonly JwtOptions _options = optionsAccessor.Value;

    public string CreateToken(string userId, string managerName, string tokenId)
    {
        var now = DateTime.UtcNow;
        var signingKey = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(_options.SigningKey));
        var credentials = new SigningCredentials(signingKey, SecurityAlgorithms.HmacSha256);

        var claims = new[]
        {
            new Claim(JwtRegisteredClaimNames.Sub, userId),
            new Claim(JwtRegisteredClaimNames.UniqueName, managerName),
            new Claim(JwtRegisteredClaimNames.Jti, tokenId)
        };

        var token = new JwtSecurityToken(
            issuer: _options.Issuer,
            audience: _options.Audience,
            claims: claims,
            notBefore: now,
            expires: now.AddMinutes(_options.ExpiryMinutes),
            signingCredentials: credentials);

        return new JwtSecurityTokenHandler().WriteToken(token);
    }

    public DateTime GetExpiryUtc(DateTime utcNow) => utcNow.AddMinutes(_options.ExpiryMinutes);

    public AppTokenValidationResult ValidateToken(string token)
    {
        var tokenHandler = new JwtSecurityTokenHandler();
        var parameters = new TokenValidationParameters
        {
            ValidateIssuer = true,
            ValidIssuer = _options.Issuer,
            ValidateAudience = true,
            ValidAudience = _options.Audience,
            ValidateLifetime = true,
            ValidateIssuerSigningKey = true,
            IssuerSigningKey = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(_options.SigningKey)),
            ClockSkew = TimeSpan.FromMinutes(1)
        };

        try
        {
            var principal = tokenHandler.ValidateToken(token, parameters, out _);
            var userId = principal.FindFirstValue(JwtRegisteredClaimNames.Sub)
                ?? principal.FindFirstValue(ClaimTypes.NameIdentifier);
            var managerName = principal.FindFirstValue(JwtRegisteredClaimNames.UniqueName)
                ?? principal.FindFirstValue(ClaimTypes.Name);
            var tokenId = principal.FindFirstValue(JwtRegisteredClaimNames.Jti);
            return new AppTokenValidationResult(true, userId, managerName, tokenId);
        }
        catch
        {
            return new AppTokenValidationResult(false, null, null, null);
        }
    }
}
