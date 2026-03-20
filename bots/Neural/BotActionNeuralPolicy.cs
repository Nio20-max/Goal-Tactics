using System.Globalization;
using GoalTactics.Bots.Client.Database;

namespace GoalTactics.Bots.Client.Neural;

public sealed class BotActionNeuralPolicy
{
    private const string ModelVersion = "v1";
    private const string SimulationKeyState = "nn.simulation.key";
    private const string TrainModelState = "nn.model.train";
    private const string ScoutModelState = "nn.model.scout";
    private const string BidModelState = "nn.model.bid";

    private readonly BotDatabase _db;
    private readonly Random _rng;
    private readonly TinyBinaryClassifier _baseTrain;
    private readonly TinyBinaryClassifier _baseScout;
    private readonly TinyBinaryClassifier _baseBid;
    private readonly Dictionary<string, BotModelBundle> _cache = new(StringComparer.Ordinal);

    public BotActionNeuralPolicy(BotDatabase db)
    {
        _db = db;
        _rng = new Random(1337);

        (_baseTrain, var trainReport) = PretrainBestModel(TrainFeatureSize, BuildTrainDataset);
        (_baseScout, var scoutReport) = PretrainBestModel(ScoutFeatureSize, BuildScoutDataset);
        (_baseBid, var bidReport) = PretrainBestModel(BidFeatureSize, BuildBidDataset);

        TrainingReport = $"train={trainReport}; scout={scoutReport}; bid={bidReport}; version={ModelVersion}";
    }

    public string TrainingReport { get; }

    private const int TrainFeatureSize = 10;
    private const int ScoutFeatureSize = 11;
    private const int BidFeatureSize = 13;

    public void EnsureBotModels(BotRecord bot, string? simulationKey = null, bool forceReset = false)
    {
        if (simulationKey is null)
        {
            if (_cache.ContainsKey(bot.BotId) && !forceReset)
            {
                return;
            }

            simulationKey = _db.GetBotState(bot.BotId, SimulationKeyState) ?? string.Empty;
        }

        if (_cache.TryGetValue(bot.BotId, out var cached))
        {
            if (!forceReset && string.Equals(cached.SimulationKey, simulationKey, StringComparison.Ordinal))
            {
                return;
            }
        }

        var persistedSimulation = _db.GetBotState(bot.BotId, SimulationKeyState) ?? string.Empty;
        var needsReset = forceReset || !string.Equals(persistedSimulation, simulationKey, StringComparison.Ordinal);

        if (!needsReset)
        {
            var trainJson = _db.GetBotState(bot.BotId, TrainModelState);
            var scoutJson = _db.GetBotState(bot.BotId, ScoutModelState);
            var bidJson = _db.GetBotState(bot.BotId, BidModelState);
            if (!string.IsNullOrWhiteSpace(trainJson) && !string.IsNullOrWhiteSpace(scoutJson) && !string.IsNullOrWhiteSpace(bidJson))
            {
                _cache[bot.BotId] = new BotModelBundle(
                    TinyBinaryClassifier.FromJson(trainJson),
                    TinyBinaryClassifier.FromJson(scoutJson),
                    TinyBinaryClassifier.FromJson(bidJson),
                    simulationKey);
                return;
            }
        }

        var localRng = new Random(Math.Abs(HashCode.Combine(bot.BotId, simulationKey, ModelVersion)));
        var train = _baseTrain.CloneWithNoise(localRng, 0.015);
        var scout = _baseScout.CloneWithNoise(localRng, 0.015);
        var bid = _baseBid.CloneWithNoise(localRng, 0.015);

        // Lightweight personalization from pretrained weights.
        FineTuneForBotPersona(bot, train, scout, bid, localRng);

        _cache[bot.BotId] = new BotModelBundle(train, scout, bid, simulationKey);
        PersistModels(bot.BotId, simulationKey, train, scout, bid);
    }

    public double PredictTrainingProbability(BotRecord bot, TrainingDecisionInput input, string? simulationKey = null)
    {
        var model = GetBundle(bot, simulationKey).TrainModel;
        return model.Predict(BuildTrainFeatures(bot, input));
    }

    public double PredictScoutProbability(BotRecord bot, ScoutDecisionInput input, string? simulationKey = null)
    {
        var model = GetBundle(bot, simulationKey).ScoutModel;
        return model.Predict(BuildScoutFeatures(bot, input));
    }

    public double PredictBidProbability(BotRecord bot, BidDecisionInput input, string? simulationKey = null)
    {
        var model = GetBundle(bot, simulationKey).BidModel;
        return model.Predict(BuildBidFeatures(bot, input));
    }

    public void LearnFromTrainingOutcome(BotRecord bot, TrainingDecisionInput input, bool success, string? simulationKey = null)
    {
        var bundle = GetBundle(bot, simulationKey);
        var label = success ? 1.0 : 0.0;
        var features = BuildTrainFeatures(bot, input);
        bundle.TrainModel.Train([features], [label], epochs: 3, learningRate: 0.03, l2: 0.0005);
        PersistModels(bot.BotId, bundle.SimulationKey, bundle.TrainModel, bundle.ScoutModel, bundle.BidModel);
    }

    public void LearnFromScoutOutcome(BotRecord bot, ScoutDecisionInput input, bool success, string? simulationKey = null)
    {
        var bundle = GetBundle(bot, simulationKey);
        var label = success ? 1.0 : 0.0;
        var features = BuildScoutFeatures(bot, input);
        bundle.ScoutModel.Train([features], [label], epochs: 3, learningRate: 0.03, l2: 0.0005);
        PersistModels(bot.BotId, bundle.SimulationKey, bundle.TrainModel, bundle.ScoutModel, bundle.BidModel);
    }

    public void LearnFromBidOutcome(BotRecord bot, BidDecisionInput input, bool success, string? simulationKey = null)
    {
        var bundle = GetBundle(bot, simulationKey);
        var label = success ? 1.0 : 0.0;
        var features = BuildBidFeatures(bot, input);
        bundle.BidModel.Train([features], [label], epochs: 4, learningRate: 0.035, l2: 0.0008);
        PersistModels(bot.BotId, bundle.SimulationKey, bundle.TrainModel, bundle.ScoutModel, bundle.BidModel);
    }

    private BotModelBundle GetBundle(BotRecord bot, string? simulationKey)
    {
        EnsureBotModels(bot, simulationKey);
        return _cache[bot.BotId];
    }

    private void PersistModels(string botId, string simulationKey, TinyBinaryClassifier train, TinyBinaryClassifier scout, TinyBinaryClassifier bid)
    {
        _db.UpsertBotState(botId, SimulationKeyState, simulationKey);
        _db.UpsertBotState(botId, TrainModelState, train.ToJson());
        _db.UpsertBotState(botId, ScoutModelState, scout.ToJson());
        _db.UpsertBotState(botId, BidModelState, bid.ToJson());
    }

    private static double[] BuildTrainFeatures(BotRecord bot, TrainingDecisionInput input)
    {
        return
        [
            Clamp01(input.Money / 4_000_000.0),
            Clamp01(input.Stars / 35_000.0),
            Clamp01(bot.YouthFocus / 100.0),
            Clamp01(bot.Activity / 100.0),
            Clamp01(bot.Risk / 100.0),
            Clamp01(input.SquadSize / 32.0),
            Clamp01(input.AverageAge / 40.0),
            Clamp01(input.YoungPlayerShare),
            Clamp01(input.AverageTalent / 100.0),
            Clamp01(input.AverageStrength / 100.0)
        ];
    }

    private static double[] BuildScoutFeatures(BotRecord bot, ScoutDecisionInput input)
    {
        return
        [
            Clamp01(input.Money / 4_000_000.0),
            Clamp01(input.Stars / 35_000.0),
            Clamp01(bot.YouthFocus / 100.0),
            Clamp01(bot.Activity / 100.0),
            Clamp01(bot.SocialScore / 100.0),
            Clamp01(input.SquadSize / 32.0),
            Clamp01(input.AverageAge / 40.0),
            Clamp01(input.YoungPlayerShare),
            Clamp01(input.PendingScouts / 5.0),
            Clamp01(input.MaxScouts / 5.0),
            Clamp01(input.ScoutIntensitySignal)
        ];
    }

    private static double[] BuildBidFeatures(BotRecord bot, BidDecisionInput input)
    {
        return
        [
            Clamp01(input.Money / 4_000_000.0),
            Clamp01(input.Stars / 35_000.0),
            Clamp01(bot.YouthFocus / 100.0),
            Clamp01(bot.Risk / 100.0),
            Clamp01(bot.Activity / 100.0),
            Clamp01(input.SquadSize / 32.0),
            Clamp01(input.AverageAge / 40.0),
            Clamp01(input.YoungPlayerShare),
            Clamp01(input.PlayerTalent / 100.0),
            Clamp01(input.PlayerStrength / 100.0),
            Clamp01(input.PlayerAge / 40.0),
            Clamp01(input.CurrentBid / Math.Max(1, input.EstimatedBudgetCap)),
            Clamp01(input.NightBidAggression / 100.0)
        ];
    }

    private static (TinyBinaryClassifier Model, string Report) PretrainBestModel(int featureSize, Func<Random, (List<double[]> X, List<double> Y)> datasetFactory)
    {
        var rng = new Random(2026 + featureSize);
        var (xTrain, yTrain) = datasetFactory(rng);
        var split = Math.Max(32, (int)(xTrain.Count * 0.8));
        var trainX = xTrain.Take(split).ToList();
        var trainY = yTrain.Take(split).ToList();
        var valX = xTrain.Skip(split).ToList();
        var valY = yTrain.Skip(split).ToList();

        var linear = new TinyBinaryClassifier(featureSize, 0, new Random(101 + featureSize));
        linear.Train(trainX, trainY, epochs: 45, learningRate: 0.045, l2: 0.0008);
        var linearLoss = linear.EvaluateBce(valX, valY);

        var hidden = new TinyBinaryClassifier(featureSize, 8, new Random(404 + featureSize));
        hidden.Train(trainX, trainY, epochs: 55, learningRate: 0.032, l2: 0.0008);
        var hiddenLoss = hidden.EvaluateBce(valX, valY);

        // Cheapness-aware model selection: prefer simpler model unless hidden is clearly better.
        var linearScore = linearLoss + (linear.ParameterCount * 0.00011);
        var hiddenScore = hiddenLoss + (hidden.ParameterCount * 0.00011);

        if (hiddenScore + 0.002 < linearScore)
        {
            return (hidden, $"hidden(loss={hiddenLoss.ToString("0.0000", CultureInfo.InvariantCulture)}, params={hidden.ParameterCount}) over linear(loss={linearLoss.ToString("0.0000", CultureInfo.InvariantCulture)}, params={linear.ParameterCount})");
        }

        return (linear, $"linear(loss={linearLoss.ToString("0.0000", CultureInfo.InvariantCulture)}, params={linear.ParameterCount}) over hidden(loss={hiddenLoss.ToString("0.0000", CultureInfo.InvariantCulture)}, params={hidden.ParameterCount})");
    }

    private static (List<double[]> X, List<double> Y) BuildTrainDataset(Random rng)
    {
        var x = new List<double[]>(900);
        var y = new List<double>(900);

        for (var i = 0; i < 900; i++)
        {
            var botYouth = rng.Next(0, 100);
            var botRisk = rng.Next(0, 100);
            var botActivity = rng.Next(0, 100);
            var input = new TrainingDecisionInput
            {
                Money = rng.NextDouble() * 4_000_000,
                Stars = rng.NextDouble() * 35_000,
                SquadSize = rng.Next(16, 32),
                AverageAge = 19 + (rng.NextDouble() * 15),
                YoungPlayerShare = rng.NextDouble(),
                AverageTalent = 35 + (rng.NextDouble() * 60),
                AverageStrength = 35 + (rng.NextDouble() * 55)
            };

            var f =
                (botYouth / 100.0) * 0.48 +
                (input.Stars / 35_000.0) * 0.22 +
                (1.0 - (input.AverageAge / 40.0)) * 0.10 +
                input.YoungPlayerShare * 0.10 +
                (botActivity / 100.0) * 0.06 -
                (botRisk / 100.0) * 0.04;

            x.Add(
            [
                Clamp01(input.Money / 4_000_000.0),
                Clamp01(input.Stars / 35_000.0),
                Clamp01(botYouth / 100.0),
                Clamp01(botActivity / 100.0),
                Clamp01(botRisk / 100.0),
                Clamp01(input.SquadSize / 32.0),
                Clamp01(input.AverageAge / 40.0),
                Clamp01(input.YoungPlayerShare),
                Clamp01(input.AverageTalent / 100.0),
                Clamp01(input.AverageStrength / 100.0)
            ]);
            y.Add(Clamp01(f + (rng.NextDouble() - 0.5) * 0.10));
        }

        return (x, y);
    }

    private static (List<double[]> X, List<double> Y) BuildScoutDataset(Random rng)
    {
        var x = new List<double[]>(900);
        var y = new List<double>(900);

        for (var i = 0; i < 900; i++)
        {
            var botYouth = rng.Next(0, 100);
            var botActivity = rng.Next(0, 100);
            var botSocial = rng.Next(0, 100);
            var input = new ScoutDecisionInput
            {
                Money = rng.NextDouble() * 4_000_000,
                Stars = rng.NextDouble() * 35_000,
                SquadSize = rng.Next(16, 32),
                AverageAge = 19 + (rng.NextDouble() * 15),
                YoungPlayerShare = rng.NextDouble(),
                PendingScouts = rng.Next(0, 5),
                MaxScouts = rng.Next(1, 5),
                ScoutIntensitySignal = rng.NextDouble()
            };

            var fullness = input.PendingScouts / Math.Max(1.0, input.MaxScouts);
            var f =
                (botYouth / 100.0) * 0.38 +
                (botActivity / 100.0) * 0.18 +
                input.ScoutIntensitySignal * 0.22 +
                (1.0 - fullness) * 0.20 +
                (input.Stars / 35_000.0) * 0.08 -
                (botSocial / 100.0) * 0.06;

            x.Add(
            [
                Clamp01(input.Money / 4_000_000.0),
                Clamp01(input.Stars / 35_000.0),
                Clamp01(botYouth / 100.0),
                Clamp01(botActivity / 100.0),
                Clamp01(botSocial / 100.0),
                Clamp01(input.SquadSize / 32.0),
                Clamp01(input.AverageAge / 40.0),
                Clamp01(input.YoungPlayerShare),
                Clamp01(input.PendingScouts / 5.0),
                Clamp01(input.MaxScouts / 5.0),
                Clamp01(input.ScoutIntensitySignal)
            ]);
            y.Add(Clamp01(f + (rng.NextDouble() - 0.5) * 0.08));
        }

        return (x, y);
    }

    private static (List<double[]> X, List<double> Y) BuildBidDataset(Random rng)
    {
        var x = new List<double[]>(1200);
        var y = new List<double>(1200);

        for (var i = 0; i < 1200; i++)
        {
            var botYouth = rng.Next(0, 100);
            var botRisk = rng.Next(0, 100);
            var botActivity = rng.Next(0, 100);
            var input = new BidDecisionInput
            {
                Money = rng.NextDouble() * 4_000_000,
                Stars = rng.NextDouble() * 35_000,
                SquadSize = rng.Next(16, 32),
                AverageAge = 19 + (rng.NextDouble() * 15),
                YoungPlayerShare = rng.NextDouble(),
                PlayerTalent = 35 + (rng.NextDouble() * 65),
                PlayerStrength = 35 + (rng.NextDouble() * 60),
                PlayerAge = 16 + (rng.NextDouble() * 19),
                CurrentBid = 1_000 + (rng.NextDouble() * 2_000_000),
                EstimatedBudgetCap = 5_000 + (rng.NextDouble() * 2_200_000),
                NightBidAggression = rng.Next(0, 100)
            };

            var affordability = 1.0 - Clamp01(input.CurrentBid / Math.Max(1, input.EstimatedBudgetCap));
            var playerQuality = (input.PlayerTalent / 100.0) * 0.6 + (input.PlayerStrength / 100.0) * 0.4;
            var youthFit = Clamp01((botYouth / 100.0) - ((input.PlayerAge - 18) / 35.0));

            var f =
                affordability * 0.36 +
                playerQuality * 0.28 +
                (botRisk / 100.0) * 0.14 +
                (input.NightBidAggression / 100.0) * 0.12 +
                youthFit * 0.08 +
                (input.Stars / 35_000.0) * 0.06 -
                (botActivity / 100.0) * 0.04;

            x.Add(
            [
                Clamp01(input.Money / 4_000_000.0),
                Clamp01(input.Stars / 35_000.0),
                Clamp01(botYouth / 100.0),
                Clamp01(botRisk / 100.0),
                Clamp01(botActivity / 100.0),
                Clamp01(input.SquadSize / 32.0),
                Clamp01(input.AverageAge / 40.0),
                Clamp01(input.YoungPlayerShare),
                Clamp01(input.PlayerTalent / 100.0),
                Clamp01(input.PlayerStrength / 100.0),
                Clamp01(input.PlayerAge / 40.0),
                Clamp01(input.CurrentBid / Math.Max(1, input.EstimatedBudgetCap)),
                Clamp01(input.NightBidAggression / 100.0)
            ]);
            y.Add(Clamp01(f + (rng.NextDouble() - 0.5) * 0.10));
        }

        return (x, y);
    }

    private static void FineTuneForBotPersona(BotRecord bot, TinyBinaryClassifier train, TinyBinaryClassifier scout, TinyBinaryClassifier bid, Random rng)
    {
        var samples = 120;
        var trainX = new List<double[]>(samples);
        var trainY = new List<double>(samples);
        var scoutX = new List<double[]>(samples);
        var scoutY = new List<double>(samples);
        var bidX = new List<double[]>(samples);
        var bidY = new List<double>(samples);

        for (var i = 0; i < samples; i++)
        {
            var sharedMoney = rng.NextDouble() * 4_000_000;
            var sharedStars = rng.NextDouble() * 35_000;
            var squadSize = rng.Next(18, 31);
            var avgAge = 20 + (rng.NextDouble() * 13);
            var youngShare = rng.NextDouble();

            var trainInput = new TrainingDecisionInput
            {
                Money = sharedMoney,
                Stars = sharedStars,
                SquadSize = squadSize,
                AverageAge = avgAge,
                YoungPlayerShare = youngShare,
                AverageTalent = 40 + (rng.NextDouble() * 55),
                AverageStrength = 35 + (rng.NextDouble() * 55)
            };

            var scoutInput = new ScoutDecisionInput
            {
                Money = sharedMoney,
                Stars = sharedStars,
                SquadSize = squadSize,
                AverageAge = avgAge,
                YoungPlayerShare = youngShare,
                PendingScouts = rng.Next(0, 4),
                MaxScouts = rng.Next(1, 5),
                ScoutIntensitySignal = rng.NextDouble()
            };

            var bidInput = new BidDecisionInput
            {
                Money = sharedMoney,
                Stars = sharedStars,
                SquadSize = squadSize,
                AverageAge = avgAge,
                YoungPlayerShare = youngShare,
                PlayerTalent = 40 + (rng.NextDouble() * 55),
                PlayerStrength = 35 + (rng.NextDouble() * 55),
                PlayerAge = 16 + (rng.NextDouble() * 20),
                CurrentBid = 1_000 + (rng.NextDouble() * 1_500_000),
                EstimatedBudgetCap = 100_000 + (rng.NextDouble() * 1_800_000),
                NightBidAggression = (int)Math.Clamp(bot.Risk + rng.Next(-20, 21), 0, 100)
            };

            var trainLabel = Clamp01((bot.YouthFocus / 100.0) * 0.55 + (sharedStars / 35_000.0) * 0.20 + (youngShare * 0.15) + ((100 - bot.Risk) / 100.0) * 0.10);
            var scoutLabel = Clamp01((bot.YouthFocus / 100.0) * 0.45 + (bot.Activity / 100.0) * 0.25 + scoutInput.ScoutIntensitySignal * 0.2 + (1.0 - scoutInput.PendingScouts / Math.Max(1.0, scoutInput.MaxScouts)) * 0.10);
            var bidLabel = Clamp01((bot.Risk / 100.0) * 0.30 + (bidInput.PlayerTalent / 100.0) * 0.30 + (bidInput.PlayerStrength / 100.0) * 0.15 + (1.0 - bidInput.CurrentBid / Math.Max(1, bidInput.EstimatedBudgetCap)) * 0.25);

            trainX.Add(BuildTrainFeatures(bot, trainInput));
            trainY.Add(trainLabel);
            scoutX.Add(BuildScoutFeatures(bot, scoutInput));
            scoutY.Add(scoutLabel);
            bidX.Add(BuildBidFeatures(bot, bidInput));
            bidY.Add(bidLabel);
        }

        train.Train(trainX, trainY, epochs: 18, learningRate: 0.028, l2: 0.0005);
        scout.Train(scoutX, scoutY, epochs: 18, learningRate: 0.028, l2: 0.0005);
        bid.Train(bidX, bidY, epochs: 22, learningRate: 0.032, l2: 0.0006);
    }

    private static double Clamp01(double value)
        => Math.Clamp(value, 0.0, 1.0);

    private sealed record BotModelBundle(
        TinyBinaryClassifier TrainModel,
        TinyBinaryClassifier ScoutModel,
        TinyBinaryClassifier BidModel,
        string SimulationKey);
}

public sealed class TrainingDecisionInput
{
    public double Money { get; set; }
    public double Stars { get; set; }
    public int SquadSize { get; set; }
    public double AverageAge { get; set; }
    public double YoungPlayerShare { get; set; }
    public double AverageTalent { get; set; }
    public double AverageStrength { get; set; }
}

public sealed class ScoutDecisionInput
{
    public double Money { get; set; }
    public double Stars { get; set; }
    public int SquadSize { get; set; }
    public double AverageAge { get; set; }
    public double YoungPlayerShare { get; set; }
    public int PendingScouts { get; set; }
    public int MaxScouts { get; set; }
    public double ScoutIntensitySignal { get; set; }
}

public sealed class BidDecisionInput
{
    public double Money { get; set; }
    public double Stars { get; set; }
    public int SquadSize { get; set; }
    public double AverageAge { get; set; }
    public double YoungPlayerShare { get; set; }
    public double PlayerTalent { get; set; }
    public double PlayerStrength { get; set; }
    public double PlayerAge { get; set; }
    public double CurrentBid { get; set; }
    public double EstimatedBudgetCap { get; set; }
    public int NightBidAggression { get; set; }
}
