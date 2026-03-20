using System.Globalization;
using System.Text.Json;

namespace GoalTactics.Bots.Client.Neural;

public sealed class TinyBinaryClassifier
{
    private readonly bool _useHiddenLayer;
    private readonly int _inputSize;
    private readonly int _hiddenSize;
    private readonly double[] _w1;
    private readonly double[] _b1;
    private readonly double[] _w2;
    private double _b2;

    public TinyBinaryClassifier(int inputSize, int hiddenSize, Random rng)
    {
        if (inputSize <= 0)
        {
            throw new ArgumentOutOfRangeException(nameof(inputSize));
        }

        _inputSize = inputSize;
        _hiddenSize = Math.Max(0, hiddenSize);
        _useHiddenLayer = _hiddenSize > 0;

        if (_useHiddenLayer)
        {
            _w1 = new double[_inputSize * _hiddenSize];
            _b1 = new double[_hiddenSize];
            _w2 = new double[_hiddenSize];
        }
        else
        {
            _w1 = [];
            _b1 = [];
            _w2 = new double[_inputSize];
        }

        InitializeWeights(rng);
    }

    private TinyBinaryClassifier(ModelState state)
    {
        _useHiddenLayer = state.UseHiddenLayer;
        _inputSize = state.InputSize;
        _hiddenSize = state.HiddenSize;
        _w1 = state.W1;
        _b1 = state.B1;
        _w2 = state.W2;
        _b2 = state.B2;

        ValidateState();
    }

    public int ParameterCount
        => _useHiddenLayer
            ? _w1.Length + _b1.Length + _w2.Length + 1
            : _w2.Length + 1;

    public double Predict(ReadOnlySpan<double> input)
    {
        if (input.Length != _inputSize)
        {
            throw new ArgumentException($"Expected input size {_inputSize}, got {input.Length}");
        }

        if (!_useHiddenLayer)
        {
            double z = _b2;
            for (var i = 0; i < _inputSize; i++)
            {
                z += _w2[i] * input[i];
            }

            return Sigmoid(z);
        }

        Span<double> hidden = stackalloc double[_hiddenSize];
        for (var h = 0; h < _hiddenSize; h++)
        {
            double z = _b1[h];
            var baseIdx = h * _inputSize;
            for (var i = 0; i < _inputSize; i++)
            {
                z += _w1[baseIdx + i] * input[i];
            }

            hidden[h] = Relu(z);
        }

        double outZ = _b2;
        for (var h = 0; h < _hiddenSize; h++)
        {
            outZ += _w2[h] * hidden[h];
        }

        return Sigmoid(outZ);
    }

    public void Train(IReadOnlyList<double[]> features, IReadOnlyList<double> labels, int epochs, double learningRate, double l2)
    {
        if (features.Count != labels.Count)
        {
            throw new ArgumentException("Features and labels must have equal length");
        }

        if (features.Count == 0)
        {
            return;
        }

        for (var epoch = 0; epoch < epochs; epoch++)
        {
            for (var row = 0; row < features.Count; row++)
            {
                UpdateSingle(features[row], labels[row], learningRate, l2);
            }
        }
    }

    public double EvaluateBce(IReadOnlyList<double[]> features, IReadOnlyList<double> labels)
    {
        if (features.Count == 0)
        {
            return 0;
        }

        double loss = 0;
        for (var i = 0; i < features.Count; i++)
        {
            var p = Math.Clamp(Predict(features[i]), 1e-6, 1 - 1e-6);
            var y = Math.Clamp(labels[i], 0, 1);
            loss += -((y * Math.Log(p)) + ((1 - y) * Math.Log(1 - p)));
        }

        return loss / features.Count;
    }

    public TinyBinaryClassifier CloneWithNoise(Random rng, double stdDev = 0.02)
    {
        var clone = FromJson(ToJson());
        clone.PerturbWeights(rng, stdDev);
        return clone;
    }

    public string ToJson()
    {
        return JsonSerializer.Serialize(new ModelState
        {
            UseHiddenLayer = _useHiddenLayer,
            InputSize = _inputSize,
            HiddenSize = _hiddenSize,
            W1 = _w1,
            B1 = _b1,
            W2 = _w2,
            B2 = _b2
        });
    }

    public static TinyBinaryClassifier FromJson(string json)
    {
        var state = JsonSerializer.Deserialize<ModelState>(json)
            ?? throw new InvalidOperationException("Could not parse model state");
        return new TinyBinaryClassifier(state);
    }

    private void InitializeWeights(Random rng)
    {
        if (_useHiddenLayer)
        {
            var s1 = Math.Sqrt(2.0 / _inputSize);
            for (var i = 0; i < _w1.Length; i++)
            {
                _w1[i] = NextGaussian(rng) * s1;
            }

            var s2 = Math.Sqrt(2.0 / _hiddenSize);
            for (var i = 0; i < _w2.Length; i++)
            {
                _w2[i] = NextGaussian(rng) * s2;
            }

            return;
        }

        var s = Math.Sqrt(2.0 / _inputSize);
        for (var i = 0; i < _w2.Length; i++)
        {
            _w2[i] = NextGaussian(rng) * s;
        }
    }

    private void PerturbWeights(Random rng, double stdDev)
    {
        if (_useHiddenLayer)
        {
            for (var i = 0; i < _w1.Length; i++)
            {
                _w1[i] += NextGaussian(rng) * stdDev;
            }

            for (var i = 0; i < _w2.Length; i++)
            {
                _w2[i] += NextGaussian(rng) * stdDev;
            }

            for (var i = 0; i < _b1.Length; i++)
            {
                _b1[i] += NextGaussian(rng) * stdDev * 0.5;
            }
        }
        else
        {
            for (var i = 0; i < _w2.Length; i++)
            {
                _w2[i] += NextGaussian(rng) * stdDev;
            }
        }

        _b2 += NextGaussian(rng) * stdDev * 0.5;
    }

    private void UpdateSingle(double[] input, double label, double learningRate, double l2)
    {
        if (input.Length != _inputSize)
        {
            return;
        }

        if (!_useHiddenLayer)
        {
            var pred = Predict(input);
            var error = pred - Math.Clamp(label, 0, 1);

            for (var i = 0; i < _inputSize; i++)
            {
                _w2[i] -= learningRate * ((error * input[i]) + (l2 * _w2[i]));
            }

            _b2 -= learningRate * error;
            return;
        }

        var z1 = new double[_hiddenSize];
        var a1 = new double[_hiddenSize];
        for (var h = 0; h < _hiddenSize; h++)
        {
            double z = _b1[h];
            var baseIdx = h * _inputSize;
            for (var i = 0; i < _inputSize; i++)
            {
                z += _w1[baseIdx + i] * input[i];
            }

            z1[h] = z;
            a1[h] = Relu(z);
        }

        double z2 = _b2;
        for (var h = 0; h < _hiddenSize; h++)
        {
            z2 += _w2[h] * a1[h];
        }

        var pred2 = Sigmoid(z2);
        var error2 = pred2 - Math.Clamp(label, 0, 1);

        for (var h = 0; h < _hiddenSize; h++)
        {
            _w2[h] -= learningRate * ((error2 * a1[h]) + (l2 * _w2[h]));
        }
        _b2 -= learningRate * error2;

        for (var h = 0; h < _hiddenSize; h++)
        {
            var reluGrad = z1[h] > 0 ? 1.0 : 0.0;
            var back = error2 * _w2[h] * reluGrad;
            var baseIdx = h * _inputSize;

            for (var i = 0; i < _inputSize; i++)
            {
                _w1[baseIdx + i] -= learningRate * ((back * input[i]) + (l2 * _w1[baseIdx + i]));
            }

            _b1[h] -= learningRate * back;
        }
    }

    private void ValidateState()
    {
        if (_inputSize <= 0)
        {
            throw new InvalidOperationException("Model input size must be positive");
        }

        if (_useHiddenLayer)
        {
            if (_hiddenSize <= 0 || _w1.Length != _inputSize * _hiddenSize || _b1.Length != _hiddenSize || _w2.Length != _hiddenSize)
            {
                throw new InvalidOperationException("Invalid hidden model state dimensions");
            }

            return;
        }

        if (_w2.Length != _inputSize)
        {
            throw new InvalidOperationException("Invalid linear model state dimensions");
        }
    }

    private static double Sigmoid(double x)
        => 1.0 / (1.0 + Math.Exp(-Math.Clamp(x, -35, 35)));

    private static double Relu(double x)
        => x > 0 ? x : 0;

    private static double NextGaussian(Random rng)
    {
        var u1 = Math.Clamp(rng.NextDouble(), 1e-12, 1.0);
        var u2 = rng.NextDouble();
        return Math.Sqrt(-2.0 * Math.Log(u1)) * Math.Cos(2.0 * Math.PI * u2);
    }

    private sealed class ModelState
    {
        public bool UseHiddenLayer { get; set; }
        public int InputSize { get; set; }
        public int HiddenSize { get; set; }
        public double[] W1 { get; set; } = [];
        public double[] B1 { get; set; } = [];
        public double[] W2 { get; set; } = [];
        public double B2 { get; set; }
    }
}
