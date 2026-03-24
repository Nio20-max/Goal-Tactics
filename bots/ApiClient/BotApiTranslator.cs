using System.Linq;

namespace GoalTactics.Bots.Client.ApiClient;

public sealed class BotApiTranslation
{
    public string Endpoint { get; init; } = "";

    public bool Success { get; init; }

    public Dictionary<string, object?> Request { get; init; } = [];

    public Dictionary<string, object?> Output { get; init; } = [];
}

public sealed class BotApiTranslator
{
    public BotApiTranslation Translate(string endpoint, object? request, object? response)
    {
        var normalized = NormalizeEndpoint(endpoint);
        return normalized switch
        {
            "Register" => Build(normalized, response is RegisterResponse r && r.Success, RegisterRequest(request), RegisterOutput(response as RegisterResponse)),
            "Login" => Build(normalized, response is LoginResponse r && r.Success, LoginRequest(request), LoginOutput(response as LoginResponse)),
            "Ping" => Build(normalized, response is PingResponse r && r.Success, Empty(), PingOutput(response as PingResponse)),
            "GetCountries" => Build(normalized, response is CountriesResponse r && r.Success, Empty(), CountriesOutput(response as CountriesResponse)),
            "GetMyResources" => Build(normalized, response is ResourcesResponse r && r.Success, Empty(), ResourcesOutput(response as ResourcesResponse)),
            "GetMyTeamExtendedInfo" => Build(normalized, response is TeamExtendedInfoResponse r && r.Success, Empty(), TeamInfoOutput(response as TeamExtendedInfoResponse)),
            "GetSquad" => Build(normalized, response is SquadResponse r && r.Success, Empty(), SquadOutput(response as SquadResponse)),
            "GetSkillCards" => Build(normalized, response is SkillCardsResponse r && r.Success, Empty(), SkillCardsOutput(response as SkillCardsResponse)),
            "UseSkillCard" => Build(normalized, true, IdRequest(request), Ack("cardApplied", true)),
            "GetLineups" => Build(normalized, response is LineupsResponse r && r.Success, Empty(), LineupsOutput(response as LineupsResponse)),
            "SaveLineup" => Build(normalized, true, SaveLineupRequest(request), Ack("lineupSaved", true)),
            "SearchTransfermarket" => Build(normalized, response is TransfermarketResponse r && r.Success, SearchTransfermarketRequest(request), TransferOutput(response as TransfermarketResponse)),
            "BidPlayer" => Build(normalized, response is BidResponse r && r.Success, BidRequest(request), BidOutput(response as BidResponse)),
            "SellPlayer" => Build(normalized, true, SellPlayerRequest(request), Ack("playerListedOrSold", true)),
            "GetTransfermarketFavourites" => Build(normalized, response is FavouritesResponse r && r.Success, Empty(), FavouritesOutput(response as FavouritesResponse)),
            "UpdateTransfermarketFavourites" => Build(normalized, true, IdRequest(request), Ack("favouritesUpdated", true)),
            "GetTeamTraining" => Build(normalized, response is TrainingResponse r && r.Success, Empty(), TrainingOutput(response as TrainingResponse)),
            "SaveTeamTraining" => Build(normalized, true, SaveTrainingRequest(request), Ack("teamTrainingSaved", true)),
            "SaveIndividualTraining" => Build(normalized, true, IndividualTrainingRequest(request), Ack("individualTrainingSaved", true)),
            "BookTrainingCamp" => Build(normalized, true, BookTrainingCampRequest(request), Ack("trainingCampBooked", true)),
            "UpdateCamps" => Build(normalized, true, Empty(), Ack("campsUpdated", true)),
            "CancelCamp" => Build(normalized, true, Empty(), Ack("campCanceled", true)),
            "GetScoutedPlayers" => Build(normalized, response is ScoutedPlayersResponse r && r.Success, Empty(), ScoutedPlayersOutput(response as ScoutedPlayersResponse)),
            "InstructScout" => Build(normalized, true, InstructScoutRequest(request), Ack("scoutInstructionSent", true)),
            "RecruitScoutedPlayer" => Build(normalized, true, IdRequest(request), Ack("scoutedPlayerRecruited", true)),
            "GetSponsorOffers" => Build(normalized, response is SponsorOffersResponse r && r.Success, Empty(), SponsorOffersOutput(response as SponsorOffersResponse)),
            "AcceptSponsor" => Build(normalized, true, IdRequest(request), Ack("sponsorAccepted", true)),
            "GetStadium" => Build(normalized, response is StadiumResponse r && r.Success, Empty(), StadiumOutput(response as StadiumResponse)),
            "BuildStadium" => Build(normalized, true, IdRequest(request), Ack("stadiumUpgradeQueued", true)),
            "BuildPlaces" => Build(normalized, true, BuildPlacesRequest(request), Ack("placeOrderQueued", true)),
            "GetFriends" => Build(normalized, response is FriendsResponse r && r.Success, TextRequest(request), FriendsOutput(response as FriendsResponse)),
            "Like" => Build(normalized, true, IdRequest(request), Ack("liked", true)),
            "Accept" => Build(normalized, true, IdRequest(request), Ack("friendAccepted", true)),
            "SendChallenge" => Build(normalized, true, IdRequest(request), Ack("challengeSent", true)),
            "PostChatMessage" => Build(normalized, true, PostChatMessageRequest(request), Ack("chatMessageSent", true)),
            "GetChatHistory" => Build(normalized, response is ChatHistoryResponse r && r.Success, Empty(), ChatHistoryOutput(response as ChatHistoryResponse)),
            "GetLadder" => Build(normalized, response is LadderResponse r && r.Success, Empty(), LadderOutput(response as LadderResponse)),
            "RunMatch" => Build(normalized, true, RunMatchRequest(request), Ack("matchStarted", true)),
            "RestoreStamina" => Build(normalized, true, Empty(), Ack("staminaRestored", true)),
            "WatchAd" => Build(normalized, response is WatchAdResponse r && r.Success, Empty(), WatchAdOutput(response as WatchAdResponse)),
            "ClaimDailyReward" => Build(normalized, response is GenericSuccessResponse r && r.Success, Empty(), ClaimDailyOutput(response as GenericSuccessResponse)),
            _ => Build(normalized, true, ObjectToDictionary(request), ObjectToDictionary(response))
        };
    }

    public static string NormalizeEndpoint(string endpoint)
    {
        var cleaned = endpoint.Trim().TrimStart('/');
        if (cleaned.StartsWith("api/", StringComparison.OrdinalIgnoreCase))
        {
            cleaned = cleaned[4..];
        }

        return cleaned;
    }

    private static BotApiTranslation Build(string endpoint, bool success, Dictionary<string, object?> request, Dictionary<string, object?> output)
        => new()
        {
            Endpoint = endpoint,
            Success = success,
            Request = request,
            Output = output
        };

    private static Dictionary<string, object?> Ack(string key, bool value)
        => new() { [key] = value };

    private static Dictionary<string, object?> Empty() => [];

    private static Dictionary<string, object?> RegisterRequest(object? request)
    {
        if (request is not RegisterRequest r)
        {
            return Empty();
        }

        return new Dictionary<string, object?>
        {
            ["isGuest"] = r.IsGuest,
            ["email"] = r.Email,
            ["login"] = r.Login,
            ["managerName"] = r.ManagerName,
            ["teamName"] = r.TeamName,
            ["countryId"] = r.CountryId,
            ["botTag"] = r.BotTag
        };
    }

    private static Dictionary<string, object?> RegisterOutput(RegisterResponse? response)
    {
        if (response is null)
        {
            return Empty();
        }

        return new Dictionary<string, object?>
        {
            ["userId"] = response.UserId,
            ["login"] = response.Login,
            ["status"] = response.Status,
            ["message"] = response.Message
        };
    }

    private static Dictionary<string, object?> LoginRequest(object? request)
    {
        if (request is not LoginRequest r)
        {
            return Empty();
        }

        return new Dictionary<string, object?>
        {
            ["email"] = r.Email
        };
    }

    private static Dictionary<string, object?> LoginOutput(LoginResponse? response)
    {
        if (response is null)
        {
            return Empty();
        }

        return new Dictionary<string, object?>
        {
            ["token"] = response.Token,
            ["userId"] = response.UserId,
            ["managerName"] = response.ManagerName,
            ["level"] = response.Level,
            ["isAdmin"] = response.IsAdmin
        };
    }

    private static Dictionary<string, object?> PingOutput(PingResponse? response)
    {
        if (response is null)
        {
            return Empty();
        }

        return new Dictionary<string, object?>
        {
            ["message"] = response.Message
        };
    }

    private static Dictionary<string, object?> CountriesOutput(CountriesResponse? response)
    {
        if (response is null)
        {
            return Empty();
        }

        return new Dictionary<string, object?>
        {
            ["countries"] = response.Countries.Select(c => new Dictionary<string, object?>
            {
                ["id"] = c.Id,
                ["name"] = c.Name,
                ["isoCode"] = c.IsoCode
            }).ToList()
        };
    }

    private static Dictionary<string, object?> ResourcesOutput(ResourcesResponse? response)
    {
        if (response is null)
        {
            return Empty();
        }

        return new Dictionary<string, object?>
        {
            ["money"] = response.Money,
            ["medipacks"] = response.Medipacks,
            ["gtStars"] = response.GTStars
        };
    }

    private static Dictionary<string, object?> TeamInfoOutput(TeamExtendedInfoResponse? response)
    {
        if (response is null)
        {
            return Empty();
        }

        return new Dictionary<string, object?>
        {
            ["team"] = response.TeamData is null
                ? null
                : new Dictionary<string, object?>
                {
                    ["id"] = response.TeamData.Id,
                    ["name"] = response.TeamData.Name,
                    ["country"] = response.TeamData.Country,
                    ["strength"] = response.TeamData.Strength
                },
            ["season"] = response.Season,
            ["matchday"] = response.Matchday
        };
    }

    private static Dictionary<string, object?> SquadOutput(SquadResponse? response)
    {
        if (response is null)
        {
            return Empty();
        }

        return new Dictionary<string, object?>
        {
            ["players"] = response.Players.Select(PlayerSummary).ToList(),
            ["playersOnTransfermarket"] = response.PlayersOnTransfermarket.Select(PlayerSummary).ToList()
        };
    }

    private static Dictionary<string, object?> SkillCardsOutput(SkillCardsResponse? response)
    {
        if (response is null)
        {
            return Empty();
        }

        return new Dictionary<string, object?>
        {
            ["cards"] = response.SkillCards.Select(c => new Dictionary<string, object?>
            {
                ["skill"] = c.Skill,
                ["rarity"] = c.Rarity,
                ["count"] = c.Count,
                ["bonus"] = c.Bonus
            }).ToList()
        };
    }

    private static Dictionary<string, object?> LineupsOutput(LineupsResponse? response)
    {
        if (response is null)
        {
            return Empty();
        }

        return new Dictionary<string, object?>
        {
            ["lineups"] = response.Lineups.Select(l => new Dictionary<string, object?>
            {
                ["matchId"] = l.MatchId,
                ["lineupId"] = l.Id,
                ["opponent"] = l.Opponent,
                ["isLocked"] = l.IsLocked,
                ["hasLineup"] = l.HasLineup,
                ["homeName"] = l.HomeName,
                ["awayName"] = l.AwayName
            }).ToList()
        };
    }

    private static Dictionary<string, object?> SaveLineupRequest(object? request)
    {
        if (request is not SaveLineupRequest r)
        {
            return Empty();
        }

        return new Dictionary<string, object?>
        {
            ["matchId"] = r.MatchId,
            ["playerCount"] = r.PlayerIds.Count,
            ["system"] = r.System,
            ["tactic"] = r.Tactic
        };
    }

    private static Dictionary<string, object?> SearchTransfermarketRequest(object? request)
    {
        if (request is not SearchTransfermarketRequest r)
        {
            return Empty();
        }

        return new Dictionary<string, object?>
        {
            ["talent"] = Range(r.Talent),
            ["strength"] = Range(r.Strength),
            ["age"] = Range(r.Age),
            ["skillIndex"] = r.SkillIndex,
            ["minimumBid"] = r.MinimumBid,
            ["budget"] = r.Budget,
            ["onlyKeeper"] = r.OnlyKeeper
        };
    }

    private static Dictionary<string, object?> TransferOutput(TransfermarketResponse? response)
    {
        if (response is null)
        {
            return Empty();
        }

        return new Dictionary<string, object?>
        {
            ["players"] = response.Players.Select(TransferPlayerSummary).ToList(),
            ["favorites"] = response.Favorites.Select(TransferPlayerSummary).ToList(),
            ["sellings"] = response.Sellings.Select(TransferPlayerSummary).ToList(),
            ["myTeamId"] = response.MyTeamId
        };
    }

    private static Dictionary<string, object?> BidRequest(object? request)
    {
        if (request is not BidRequest r)
        {
            return Empty();
        }

        return new Dictionary<string, object?>
        {
            ["auctionId"] = r.Id,
            ["bid"] = r.Bid
        };
    }

    private static Dictionary<string, object?> SellPlayerRequest(object? request)
    {
        if (request is not SellPlayerRequest r)
        {
            return Empty();
        }

        return new Dictionary<string, object?>
        {
            ["id"] = r.Id,
            ["offer"] = r.Offer,
            ["hours"] = r.Hours,
            ["directSale"] = r.DirectSale
        };
    }

    private static Dictionary<string, object?> BidOutput(BidResponse? response)
    {
        if (response is null)
        {
            return Empty();
        }

        return new Dictionary<string, object?>
        {
            ["bidAccepted"] = response.Success
        };
    }

    private static Dictionary<string, object?> FavouritesOutput(FavouritesResponse? response)
    {
        if (response is null)
        {
            return Empty();
        }

        return new Dictionary<string, object?>
        {
            ["players"] = response.Players.Select(TransferPlayerSummary).ToList()
        };
    }

    private static Dictionary<string, object?> TrainingOutput(TrainingResponse? response)
    {
        if (response?.TeamTraining is null)
        {
            return Empty();
        }

        var output = new Dictionary<string, object?>
        {
            ["mainSkillIndex"] = response.TeamTraining.MainSkillIndex,
            ["subSkillIndex"] = response.TeamTraining.SubSkillIndex,
            ["efficiencyValue"] = response.TeamTraining.EfficiencyValue,
            ["noTraining"] = response.TeamTraining.NoTraining
        };

        if (response.TrainingCamp is not null)
        {
            output["trainingCamp"] = new Dictionary<string, object?>
            {
                ["bookedCampIdentifier"] = response.TrainingCamp.BookedCampIdentifier,
                ["isUpdateEnabled"] = response.TrainingCamp.IsUpdateEnabled,
                ["campItems"] = response.TrainingCamp.CampItems?.Select(item => new Dictionary<string, object?>
                {
                    ["identifier"] = item.Identifier,
                    ["bookDate"] = item.BookDate
                }).ToList() ?? new List<Dictionary<string, object?>>()
            };
        }

        return output;
    }

    private static Dictionary<string, object?> SaveTrainingRequest(object? request)
    {
        if (request is not SaveTrainingRequest r)
        {
            return Empty();
        }

        return new Dictionary<string, object?>
        {
            ["mainSkillIndex"] = r.MainSkillIndex,
            ["subSkillIndex"] = r.SubSkillIndex
        };
    }

    private static Dictionary<string, object?> IndividualTrainingRequest(object? request)
    {
        if (request is not IndividualTrainingRequest r)
        {
            return Empty();
        }

        return new Dictionary<string, object?>
        {
            ["id"] = r.Id,
            ["skillIndex"] = r.SkillIndex
        };
    }

    private static Dictionary<string, object?> BookTrainingCampRequest(object? request)
    {
        if (request is not BookTrainingCampRequest r)
        {
            return Empty();
        }

        return new Dictionary<string, object?>
        {
            ["campType"] = r.CampType
        };
    }

    private static Dictionary<string, object?> ScoutedPlayersOutput(ScoutedPlayersResponse? response)
    {
        if (response is null)
        {
            return Empty();
        }

        return new Dictionary<string, object?>
        {
            ["scoutingCost"] = response.ScoutingCost,
            ["pendingScoutCount"] = response.PendingScoutCount,
            ["maxSimultaneousScouts"] = response.MaxSimultaneousScouts,
            ["players"] = response.Players.Select(p => new Dictionary<string, object?>
            {
                ["id"] = p.Id,
                ["name"] = p.Name,
                ["position"] = p.Position,
                ["talent"] = p.Talent,
                ["strength"] = p.Strength
            }).ToList()
        };
    }

    private static Dictionary<string, object?> InstructScoutRequest(object? request)
    {
        if (request is not InstructScoutRequest r)
        {
            return Empty();
        }

        return new Dictionary<string, object?>
        {
            ["scoutType"] = r.ScoutType,
            ["positionFilter"] = r.PositionFilter,
            ["position"] = r.Position,
            ["price"] = r.Price
        };
    }

    private static Dictionary<string, object?> SponsorOffersOutput(SponsorOffersResponse? response)
    {
        if (response is null)
        {
            return Empty();
        }

        return new Dictionary<string, object?>
        {
            ["negotiateCost"] = response.NegotiateCost,
            ["offers"] = response.Offers.Select(o => new Dictionary<string, object?>
            {
                ["id"] = o.Id,
                ["name"] = o.Name,
                ["money"] = o.Money,
                ["stars"] = o.Stars,
                ["bonusPerWin"] = o.BonusPerWin,
                ["bonusPerGoal"] = o.BonusPerGoal,
                ["contractDays"] = o.ContractDays,
                ["isActive"] = o.IsActive
            }).ToList()
        };
    }

    private static Dictionary<string, object?> StadiumOutput(StadiumResponse? response)
    {
        if (response is null)
        {
            return Empty();
        }

        return new Dictionary<string, object?>
        {
            ["stadium"] = response.Stadium is null
                ? null
                : new Dictionary<string, object?>
                {
                    ["name"] = response.Stadium.Name,
                    ["capacity"] = response.Stadium.Capacity,
                    ["grassQuality"] = response.Stadium.GrassQuality,
                    ["earningsAverage"] = response.Stadium.EarningsAverage
                },
            ["buildings"] = response.Buildings.Select(b => new Dictionary<string, object?>
            {
                ["id"] = b.Id,
                ["name"] = b.Name,
                ["currentValue"] = b.CurrentValue,
                ["maxValue"] = b.MaxValue,
                ["upgradeCost"] = b.UpgradeCost,
                ["capacity"] = b.Capacity,
                ["utilization"] = b.Utilization
            }).ToList(),
            ["maxBuildingLevel"] = response.MaxBuildingLevel
        };
    }

    private static Dictionary<string, object?> BuildPlacesRequest(object? request)
    {
        if (request is not BuildPlacesRequest r)
        {
            return Empty();
        }

        return new Dictionary<string, object?>
        {
            ["orderCount"] = r.Places.Count,
            ["places"] = r.Places.Select(p => new Dictionary<string, object?>
            {
                ["id"] = p.Id,
                ["count"] = p.Count
            }).ToList()
        };
    }

    private static Dictionary<string, object?> TextRequest(object? request)
    {
        if (request is not TextRequest r)
        {
            return Empty();
        }

        return new Dictionary<string, object?>
        {
            ["text"] = r.Text
        };
    }

    private static Dictionary<string, object?> FriendsOutput(FriendsResponse? response)
    {
        if (response is null)
        {
            return Empty();
        }

        return new Dictionary<string, object?>
        {
            ["friends"] = response.Friends.Select(f => new Dictionary<string, object?>
            {
                ["id"] = f.Id,
                ["userName"] = f.UserName,
                ["teamName"] = f.TeamName,
                ["teamId"] = f.TeamId,
                ["isFriend"] = f.IsFriend,
                ["incoming"] = f.IsRequestIncoming,
                ["outgoing"] = f.IsRequestOutgoing,
                ["myLike"] = f.MyLike,
                ["likesMe"] = f.LikesMe,
                ["strength"] = f.Strength,
                ["challengeStatus"] = f.ChallengeStatus
            }).ToList()
        };
    }

    private static Dictionary<string, object?> PostChatMessageRequest(object? request)
    {
        if (request is not PostChatMessageRequest r)
        {
            return Empty();
        }

        return new Dictionary<string, object?>
        {
            ["message"] = r.Message,
            ["channel"] = r.Channel,
            ["targetUserId"] = r.TargetUserId,
            ["length"] = r.Message.Length
        };
    }

    private static Dictionary<string, object?> ChatHistoryOutput(ChatHistoryResponse? response)
    {
        if (response is null)
        {
            return Empty();
        }

        return new Dictionary<string, object?>
        {
            ["userId"] = response.UserId,
            ["messages"] = response.Messages.Select(m => new Dictionary<string, object?>
            {
                ["userId"] = m.UserId,
                ["name"] = m.Name,
                ["message"] = m.Message,
                ["date"] = m.Date,
                ["isMine"] = m.IsMine
            }).ToList()
        };
    }

    private static Dictionary<string, object?> LadderOutput(LadderResponse? response)
    {
        if (response is null)
        {
            return Empty();
        }

        return new Dictionary<string, object?>
        {
            ["ladderId"] = response.LadderId,
            ["endDate"] = response.EndDate,
            ["teams"] = response.Teams.Select(t => new Dictionary<string, object?>
            {
                ["teamId"] = t.TeamId,
                ["teamName"] = t.TeamName,
                ["rank"] = t.Rank,
                ["points"] = t.Points,
                ["strength"] = t.Strength,
                ["isMine"] = t.IsMine
            }).ToList()
        };
    }

    private static Dictionary<string, object?> RunMatchRequest(object? request)
    {
        if (request is not RunMatchRequest r)
        {
            return Empty();
        }

        return new Dictionary<string, object?>
        {
            ["teamId"] = r.TeamId
        };
    }

    private static Dictionary<string, object?> WatchAdOutput(WatchAdResponse? response)
    {
        if (response is null)
        {
            return Empty();
        }

        return new Dictionary<string, object?>
        {
            ["rewardValue"] = response.Value
        };
    }

    private static Dictionary<string, object?> ClaimDailyOutput(GenericSuccessResponse? response)
    {
        if (response is null)
        {
            return Empty();
        }

        return new Dictionary<string, object?>
        {
            ["claimed"] = response.Success
        };
    }

    private static Dictionary<string, object?> IdRequest(object? request)
    {
        if (request is not IdRequest r)
        {
            return Empty();
        }

        return new Dictionary<string, object?>
        {
            ["id"] = r.Id
        };
    }

    private static Dictionary<string, object?> TransferPlayerSummary(TransferPlayerDto p)
        => new()
        {
            ["playerId"] = p.Id,
            ["name"] = p.Name,
            ["position"] = p.Position,
            ["strength"] = p.Strength,
            ["talent"] = p.Talent,
            ["age"] = p.Age,
            ["auctionId"] = p.AuctionId,
            ["bid"] = p.Bid,
            ["bidTeamName"] = p.BidTeamName,
            ["minimumBid"] = p.MinimumBid,
            ["isFrozen"] = p.IsFrozen
        };

    private static Dictionary<string, object?> PlayerSummary(PlayerDto p)
        => new()
        {
            ["id"] = p.Id,
            ["name"] = p.Name,
            ["position"] = p.Position,
            ["strength"] = p.Strength,
            ["talent"] = p.Talent,
            ["age"] = p.Age,
            ["experience"] = p.Experience,
            ["fitness"] = p.Fitness,
            ["salary"] = p.Salary,
            ["marketValue"] = p.MarketValue,
            ["country"] = p.Country,
            ["origin"] = p.Origin,
            ["hasIndividualTraining"] = p.HasIndividualTraining,
            ["mainSkill"] = p.MainSkill,
            ["bonusSkills"] = p.BonusSkills,
            ["skills"] = p.Skills,
            ["yellowCards"] = p.YellowCards,
            ["hasRedCard"] = p.HasRedCard,
            ["injured"] = p.Injured
        };

    private static Dictionary<string, object?>? Range(RangeFilter? range)
        => range is null
            ? null
            : new Dictionary<string, object?>
            {
                ["min"] = range.Min,
                ["max"] = range.Max
            };

    private static Dictionary<string, object?> ObjectToDictionary(object? value)
    {
        if (value is null)
        {
            return Empty();
        }

        return new Dictionary<string, object?>
        {
            ["value"] = value
        };
    }
}