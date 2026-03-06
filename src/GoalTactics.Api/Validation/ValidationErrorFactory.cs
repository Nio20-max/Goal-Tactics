using Microsoft.AspNetCore.Mvc;

namespace GoalTactics.Api.Validation;

public static class ValidationErrorFactory
{
    public static IActionResult Create(ActionContext context)
    {
        var errors = context.ModelState
            .Where(x => x.Value?.Errors.Count > 0)
            .SelectMany(kvp => kvp.Value!.Errors.Select(error => new
            {
                field = kvp.Key,
                message = string.IsNullOrWhiteSpace(error.ErrorMessage) ? "Invalid value." : error.ErrorMessage
            }))
            .ToArray();

        return new BadRequestObjectResult(new
        {
            success = false,
            error = new
            {
                code = "validation_error",
                message = "Request validation failed.",
                details = errors
            }
        });
    }
}
