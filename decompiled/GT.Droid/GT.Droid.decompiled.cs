using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Diagnostics;
using System.Linq;
using System.Reflection;
using System.Runtime.CompilerServices;
using System.Runtime.Versioning;
using System.Threading;
using System.Threading.Tasks;
using Microcharts.Abstracts;
using SkiaSharp;

[assembly: CompilationRelaxations(8)]
[assembly: RuntimeCompatibility(WrapNonExceptionThrows = true)]
[assembly: Debuggable(DebuggableAttribute.DebuggingModes.IgnoreSymbolStoreSequencePoints)]
[assembly: TargetFramework(".NETStandard,Version=v2.0", FrameworkDisplayName = "")]
[assembly: AssemblyCompany("Microcharts")]
[assembly: AssemblyConfiguration("Release")]
[assembly: AssemblyCopyright("Copyright 2020")]
[assembly: AssemblyDescription("Microcharts is an extremely simple charting library for a wide range of platforms (see Compatibility section below), with shared code and rendering for all of them!")]
[assembly: AssemblyFileVersion("0.9.5.1")]
[assembly: AssemblyInformationalVersion("0.9.5.1")]
[assembly: AssemblyProduct("Microcharts")]
[assembly: AssemblyTitle("Microcharts")]
[assembly: AssemblyVersion("0.9.5.1")]
namespace Microcharts
{
	public class ChartEntry
	{
		public float Value { get; }

		public string Label { get; set; }

		public string ValueLabel { get; set; }

		public SKColor Color { get; set; } = SKColors.Black;

		public SKColor TextColor { get; set; } = SKColors.Gray;

		public SKColor ValueLabelColor { get; set; } = SKColors.Black;

		public ChartEntry(float value)
		{
			//IL_0001: Unknown result type (might be due to invalid IL or missing references)
			//IL_0006: Unknown result type (might be due to invalid IL or missing references)
			//IL_000c: Unknown result type (might be due to invalid IL or missing references)
			//IL_0011: Unknown result type (might be due to invalid IL or missing references)
			//IL_0017: Unknown result type (might be due to invalid IL or missing references)
			//IL_001c: Unknown result type (might be due to invalid IL or missing references)
			Value = value;
		}
	}
	public class BarChart : PointChart
	{
		public byte BarAreaAlpha { get; set; } = 32;

		public BarChart()
		{
			base.PointSize = 0f;
		}

		public override void DrawContent(SKCanvas canvas, int width, int height)
		{
			//IL_00a0: Unknown result type (might be due to invalid IL or missing references)
			//IL_00a5: Unknown result type (might be due to invalid IL or missing references)
			//IL_00b9: Unknown result type (might be due to invalid IL or missing references)
			//IL_00ca: Unknown result type (might be due to invalid IL or missing references)
			//IL_00d7: Unknown result type (might be due to invalid IL or missing references)
			//IL_00f2: Unknown result type (might be due to invalid IL or missing references)
			//IL_0102: Unknown result type (might be due to invalid IL or missing references)
			if (base.Entries != null)
			{
				string[] labels = base.Entries.Select((ChartEntry x) => x.Label).ToArray();
				SKRect[] array = MeasureLabels(labels);
				float footerHeight = CalculateFooterHeaderHeight(array, base.LabelOrientation);
				string[] labels2 = base.Entries.Select((ChartEntry x) => x.ValueLabel).ToArray();
				SKRect[] array2 = MeasureLabels(labels2);
				float headerHeight = CalculateFooterHeaderHeight(array2, base.ValueLabelOrientation);
				SKSize itemSize = CalculateItemSize(width, height, footerHeight, headerHeight);
				float origin = CalculateYOrigin(((SKSize)(ref itemSize)).Height, headerHeight);
				SKPoint[] points = CalculatePoints(itemSize, origin, headerHeight);
				DrawBarAreas(canvas, points, itemSize, headerHeight);
				DrawBars(canvas, points, itemSize, origin, headerHeight);
				DrawPoints(canvas, points);
				DrawHeader(canvas, labels2, array2, points, itemSize, height, headerHeight);
				DrawFooter(canvas, labels, array, points, itemSize, height, footerHeight);
			}
		}

		protected void DrawBars(SKCanvas canvas, SKPoint[] points, SKSize itemSize, float origin, float headerHeight)
		{
			//IL_001d: Unknown result type (might be due to invalid IL or missing references)
			//IL_0022: Unknown result type (might be due to invalid IL or missing references)
			//IL_0023: Unknown result type (might be due to invalid IL or missing references)
			//IL_0028: Unknown result type (might be due to invalid IL or missing references)
			//IL_002f: Unknown result type (might be due to invalid IL or missing references)
			//IL_0031: Unknown result type (might be due to invalid IL or missing references)
			//IL_003c: Expected O, but got Unknown
			//IL_00bb: Unknown result type (might be due to invalid IL or missing references)
			//IL_00c0: Unknown result type (might be due to invalid IL or missing references)
			//IL_00c3: Unknown result type (might be due to invalid IL or missing references)
			if (points.Length == 0)
			{
				return;
			}
			for (int i = 0; i < base.Entries.Count(); i++)
			{
				ChartEntry chartEntry = base.Entries.ElementAt(i);
				SKPoint val = points[i];
				SKPaint val2 = new SKPaint
				{
					Style = (SKPaintStyle)0,
					Color = chartEntry.Color
				};
				try
				{
					float num = ((SKPoint)(ref val)).X - ((SKSize)(ref itemSize)).Width / 2f;
					float num2 = Math.Min(origin, ((SKPoint)(ref val)).Y);
					float num3 = Math.Max(4f, Math.Abs(origin - ((SKPoint)(ref val)).Y));
					if (num3 < 4f)
					{
						num3 = 4f;
						if (num2 + num3 > base.Margin + ((SKSize)(ref itemSize)).Height)
						{
							num2 = headerHeight + ((SKSize)(ref itemSize)).Height - num3;
						}
					}
					SKRect val3 = SKRect.Create(num, num2, ((SKSize)(ref itemSize)).Width, num3);
					canvas.DrawRect(val3, val2);
				}
				finally
				{
					((IDisposable)val2)?.Dispose();
				}
			}
		}

		protected void DrawBarAreas(SKCanvas canvas, SKPoint[] points, SKSize itemSize, float headerHeight)
		{
			//IL_0029: Unknown result type (might be due to invalid IL or missing references)
			//IL_002e: Unknown result type (might be due to invalid IL or missing references)
			//IL_002f: Unknown result type (might be due to invalid IL or missing references)
			//IL_0034: Unknown result type (might be due to invalid IL or missing references)
			//IL_003b: Unknown result type (might be due to invalid IL or missing references)
			//IL_003d: Unknown result type (might be due to invalid IL or missing references)
			//IL_0042: Unknown result type (might be due to invalid IL or missing references)
			//IL_0055: Unknown result type (might be due to invalid IL or missing references)
			//IL_0060: Expected O, but got Unknown
			//IL_00ba: Unknown result type (might be due to invalid IL or missing references)
			if (points.Length == 0 || base.PointAreaAlpha <= 0)
			{
				return;
			}
			for (int i = 0; i < points.Length; i++)
			{
				ChartEntry chartEntry = base.Entries.ElementAt(i);
				SKPoint val = points[i];
				SKPaint val2 = new SKPaint
				{
					Style = (SKPaintStyle)0
				};
				SKColor color = chartEntry.Color;
				val2.Color = ((SKColor)(ref color)).WithAlpha((byte)((float)(int)BarAreaAlpha * base.AnimationProgress));
				SKPaint val3 = val2;
				try
				{
					float num = ((chartEntry.Value > 0f) ? headerHeight : (headerHeight + ((SKSize)(ref itemSize)).Height));
					float num2 = Math.Abs(num - ((SKPoint)(ref val)).Y);
					float num3 = Math.Min(num, ((SKPoint)(ref val)).Y);
					canvas.DrawRect(SKRect.Create(((SKPoint)(ref val)).X - ((SKSize)(ref itemSize)).Width / 2f, num3, ((SKSize)(ref itemSize)).Width, num2), val3);
				}
				finally
				{
					((IDisposable)val3)?.Dispose();
				}
			}
		}
	}
	public abstract class Chart : INotifyPropertyChanged
	{
		private IEnumerable<ChartEntry> entries;

		private float animationProgress;

		private float margin = 20f;

		private float labelTextSize = 16f;

		private SKColor backgroundColor = SKColors.White;

		private SKColor labelColor = SKColors.Gray;

		private SKTypeface typeface;

		private float? internalMinValue;

		private float? internalMaxValue;

		private bool isAnimated = true;

		private bool isAnimating;

		private TimeSpan animationDuration = TimeSpan.FromSeconds(1.5);

		private Task invalidationPlanification;

		private CancellationTokenSource animationCancellation;

		public bool IsAnimated
		{
			get
			{
				return isAnimated;
			}
			set
			{
				if (Set(ref isAnimated, value, "IsAnimated") && !value)
				{
					AnimationProgress = 1f;
				}
			}
		}

		public bool IsAnimating
		{
			get
			{
				return isAnimating;
			}
			private set
			{
				Set(ref isAnimating, value, "IsAnimating");
			}
		}

		public TimeSpan AnimationDuration
		{
			get
			{
				return animationDuration;
			}
			set
			{
				Set(ref animationDuration, value, "AnimationDuration");
			}
		}

		public float Margin
		{
			get
			{
				return margin;
			}
			set
			{
				Set(ref margin, value, "Margin");
			}
		}

		public float AnimationProgress
		{
			get
			{
				return animationProgress;
			}
			set
			{
				value = Math.Min(1f, Math.Max(value, 0f));
				Set(ref animationProgress, value, "AnimationProgress");
			}
		}

		public float LabelTextSize
		{
			get
			{
				return labelTextSize;
			}
			set
			{
				Set(ref labelTextSize, value, "LabelTextSize");
			}
		}

		public SKTypeface Typeface
		{
			get
			{
				return typeface;
			}
			set
			{
				Set(ref typeface, value, "Typeface");
			}
		}

		public SKColor BackgroundColor
		{
			get
			{
				//IL_0001: Unknown result type (might be due to invalid IL or missing references)
				return backgroundColor;
			}
			set
			{
				//IL_0007: Unknown result type (might be due to invalid IL or missing references)
				Set(ref backgroundColor, value, "BackgroundColor");
			}
		}

		public SKColor LabelColor
		{
			get
			{
				//IL_0001: Unknown result type (might be due to invalid IL or missing references)
				return labelColor;
			}
			set
			{
				//IL_0007: Unknown result type (might be due to invalid IL or missing references)
				Set(ref labelColor, value, "LabelColor");
			}
		}

		public IEnumerable<ChartEntry> Entries
		{
			get
			{
				return entries;
			}
			set
			{
				UpdateEntries(value);
			}
		}

		public float MinValue
		{
			get
			{
				if (!Entries.Any())
				{
					return 0f;
				}
				if (!InternalMinValue.HasValue)
				{
					return Math.Min(0f, Entries.Min((ChartEntry x) => x.Value));
				}
				return Math.Min(InternalMinValue.Value, Entries.Min((ChartEntry x) => x.Value));
			}
			set
			{
				InternalMinValue = value;
			}
		}

		public float MaxValue
		{
			get
			{
				if (!Entries.Any())
				{
					return 0f;
				}
				if (!InternalMaxValue.HasValue)
				{
					return Math.Max(0f, Entries.Max((ChartEntry x) => x.Value));
				}
				return Math.Max(InternalMaxValue.Value, Entries.Max((ChartEntry x) => x.Value));
			}
			set
			{
				InternalMaxValue = value;
			}
		}

		internal bool DrawDebugRectangles { get; private set; }

		protected float? InternalMinValue
		{
			get
			{
				return internalMinValue;
			}
			set
			{
				if (Set(ref internalMinValue, value, "InternalMinValue"))
				{
					RaisePropertyChanged("MinValue");
				}
			}
		}

		protected float? InternalMaxValue
		{
			get
			{
				return internalMaxValue;
			}
			set
			{
				if (Set(ref internalMaxValue, value, "InternalMaxValue"))
				{
					RaisePropertyChanged("MaxValue");
				}
			}
		}

		protected SKRect DrawableChartArea { get; private set; }

		public event PropertyChangedEventHandler PropertyChanged;

		public event EventHandler Invalidated;

		public Chart()
		{
			//IL_0017: Unknown result type (might be due to invalid IL or missing references)
			//IL_001c: Unknown result type (might be due to invalid IL or missing references)
			//IL_0022: Unknown result type (might be due to invalid IL or missing references)
			//IL_0027: Unknown result type (might be due to invalid IL or missing references)
			PropertyChanged += OnPropertyChanged;
		}

		public void Draw(SKCanvas canvas, int width, int height)
		{
			//IL_0002: Unknown result type (might be due to invalid IL or missing references)
			//IL_001b: Unknown result type (might be due to invalid IL or missing references)
			canvas.Clear(BackgroundColor);
			DrawableChartArea = new SKRect(0f, 0f, (float)width, (float)height);
			DrawContent(canvas, width, height);
		}

		public abstract void DrawContent(SKCanvas canvas, int width, int height);

		protected void DrawCaptionElements(SKCanvas canvas, int width, int height, List<ChartEntry> entries, bool isLeft, bool isGraphCentered)
		{
			//IL_00e0: Unknown result type (might be due to invalid IL or missing references)
			//IL_00e5: Unknown result type (might be due to invalid IL or missing references)
			//IL_00eb: Unknown result type (might be due to invalid IL or missing references)
			//IL_00f0: Unknown result type (might be due to invalid IL or missing references)
			//IL_0102: Unknown result type (might be due to invalid IL or missing references)
			//IL_0107: Unknown result type (might be due to invalid IL or missing references)
			//IL_010b: Unknown result type (might be due to invalid IL or missing references)
			//IL_0110: Unknown result type (might be due to invalid IL or missing references)
			//IL_0116: Unknown result type (might be due to invalid IL or missing references)
			//IL_011b: Unknown result type (might be due to invalid IL or missing references)
			//IL_012d: Unknown result type (might be due to invalid IL or missing references)
			//IL_0132: Unknown result type (might be due to invalid IL or missing references)
			//IL_0144: Unknown result type (might be due to invalid IL or missing references)
			//IL_0149: Unknown result type (might be due to invalid IL or missing references)
			//IL_014b: Unknown result type (might be due to invalid IL or missing references)
			//IL_0150: Unknown result type (might be due to invalid IL or missing references)
			//IL_0157: Unknown result type (might be due to invalid IL or missing references)
			//IL_0158: Unknown result type (might be due to invalid IL or missing references)
			//IL_0161: Expected O, but got Unknown
			//IL_0162: Unknown result type (might be due to invalid IL or missing references)
			//IL_019c: Unknown result type (might be due to invalid IL or missing references)
			//IL_01a5: Unknown result type (might be due to invalid IL or missing references)
			//IL_01be: Unknown result type (might be due to invalid IL or missing references)
			//IL_01da: Unknown result type (might be due to invalid IL or missing references)
			//IL_01e9: Unknown result type (might be due to invalid IL or missing references)
			//IL_01ee: Unknown result type (might be due to invalid IL or missing references)
			//IL_01f5: Unknown result type (might be due to invalid IL or missing references)
			//IL_01f8: Unknown result type (might be due to invalid IL or missing references)
			//IL_0202: Unknown result type (might be due to invalid IL or missing references)
			//IL_020b: Expected O, but got Unknown
			//IL_0229: Unknown result type (might be due to invalid IL or missing references)
			//IL_022e: Unknown result type (might be due to invalid IL or missing references)
			//IL_0249: Unknown result type (might be due to invalid IL or missing references)
			//IL_024e: Unknown result type (might be due to invalid IL or missing references)
			//IL_0258: Unknown result type (might be due to invalid IL or missing references)
			//IL_025d: Unknown result type (might be due to invalid IL or missing references)
			//IL_0266: Unknown result type (might be due to invalid IL or missing references)
			//IL_020c: Unknown result type (might be due to invalid IL or missing references)
			//IL_0280: Unknown result type (might be due to invalid IL or missing references)
			//IL_0285: Unknown result type (might be due to invalid IL or missing references)
			//IL_029f: Unknown result type (might be due to invalid IL or missing references)
			//IL_02a4: Unknown result type (might be due to invalid IL or missing references)
			//IL_02ba: Unknown result type (might be due to invalid IL or missing references)
			//IL_02bf: Unknown result type (might be due to invalid IL or missing references)
			//IL_02c8: Unknown result type (might be due to invalid IL or missing references)
			//IL_02e5: Unknown result type (might be due to invalid IL or missing references)
			//IL_02ea: Unknown result type (might be due to invalid IL or missing references)
			//IL_02ff: Unknown result type (might be due to invalid IL or missing references)
			//IL_0304: Unknown result type (might be due to invalid IL or missing references)
			//IL_030e: Unknown result type (might be due to invalid IL or missing references)
			//IL_0313: Unknown result type (might be due to invalid IL or missing references)
			//IL_031c: Unknown result type (might be due to invalid IL or missing references)
			float num = 2f * Margin;
			float num2 = (float)height - 2f * num;
			if (!isLeft)
			{
				_ = Margin;
				_ = LabelTextSize;
			}
			else
			{
				_ = Margin;
			}
			float num3 = (num2 - LabelTextSize) / (float)((entries.Count <= 1) ? 1 : (entries.Count - 1));
			for (int i = 0; i < entries.Count; i++)
			{
				ChartEntry chartEntry = entries.ElementAt(i);
				float num4 = num + (float)i * num3;
				if (entries.Count <= 1)
				{
					num4 += (num2 - LabelTextSize) / 2f;
				}
				bool num5 = !string.IsNullOrEmpty(chartEntry.Label);
				bool flag = !string.IsNullOrEmpty(chartEntry.ValueLabel);
				if (!(num5 || flag))
				{
					continue;
				}
				float num6 = LabelTextSize * 0.6f;
				float num7 = (isLeft ? Margin : ((float)width - Margin - LabelTextSize));
				SKColor val = chartEntry.ValueLabelColor;
				SKColor val2 = chartEntry.ValueLabelColor;
				SKColor val3 = ((SKColor)(ref val)).WithAlpha((byte)((float)(int)((SKColor)(ref val2)).Alpha * AnimationProgress));
				val = chartEntry.TextColor;
				val2 = chartEntry.TextColor;
				SKColor val4 = ((SKColor)(ref val)).WithAlpha((byte)((float)(int)((SKColor)(ref val2)).Alpha * AnimationProgress));
				SKRect val5 = SKRect.Create(num7, num4, LabelTextSize, LabelTextSize);
				SKPaint val6 = new SKPaint
				{
					Style = (SKPaintStyle)0,
					Color = val3
				};
				try
				{
					canvas.DrawRect(val5, val6);
				}
				finally
				{
					((IDisposable)val6)?.Dispose();
				}
				CanvasExtensions.DrawCaptionLabels(point: new SKPoint((!isLeft) ? (num7 - num6) : (num7 + (LabelTextSize + num6)), num4 + LabelTextSize / 2f), canvas: canvas, label: chartEntry.Label, labelColor: val4, value: chartEntry.ValueLabel, valueColor: val3, textSize: LabelTextSize, horizontalAlignment: (SKTextAlign)((!isLeft) ? 2 : 0), typeface: Typeface, totalBounds: out var totalBounds);
				((SKRect)(ref totalBounds)).Union(val5);
				if (DrawDebugRectangles)
				{
					SKPaint val7 = new SKPaint
					{
						Style = (SKPaintStyle)0,
						Color = chartEntry.Color,
						IsStroke = true
					};
					try
					{
						canvas.DrawRect(totalBounds, val7);
					}
					finally
					{
						((IDisposable)val7)?.Dispose();
					}
				}
				SKRect drawableChartArea;
				if (isLeft)
				{
					drawableChartArea = DrawableChartArea;
					float num8 = Math.Max(((SKRect)(ref drawableChartArea)).Left, ((SKRect)(ref totalBounds)).Right);
					drawableChartArea = DrawableChartArea;
					float right = ((SKRect)(ref drawableChartArea)).Right;
					drawableChartArea = DrawableChartArea;
					DrawableChartArea = new SKRect(num8, 0f, right, ((SKRect)(ref drawableChartArea)).Bottom);
				}
				else
				{
					float num9;
					if (!isGraphCentered)
					{
						num9 = 0f;
					}
					else
					{
						float num10 = width;
						drawableChartArea = DrawableChartArea;
						num9 = Math.Abs(num10 - ((SKRect)(ref drawableChartArea)).Right);
					}
					float num11 = num9;
					drawableChartArea = DrawableChartArea;
					float num12 = Math.Min(((SKRect)(ref drawableChartArea)).Right, ((SKRect)(ref totalBounds)).Left);
					drawableChartArea = DrawableChartArea;
					DrawableChartArea = new SKRect(num11, 0f, num12, ((SKRect)(ref drawableChartArea)).Bottom);
				}
				if (entries.Count == 0 && isGraphCentered)
				{
					float num13 = width;
					drawableChartArea = DrawableChartArea;
					float num14 = Math.Abs(num13 - ((SKRect)(ref drawableChartArea)).Right);
					drawableChartArea = DrawableChartArea;
					float right2 = ((SKRect)(ref drawableChartArea)).Right;
					drawableChartArea = DrawableChartArea;
					DrawableChartArea = new SKRect(num14, 0f, right2, ((SKRect)(ref drawableChartArea)).Bottom);
				}
			}
		}

		protected virtual void OnPropertyChanged(object sender, PropertyChangedEventArgs e)
		{
			switch (e.PropertyName)
			{
			case "AnimationProgress":
				Invalidate();
				break;
			case "LabelTextSize":
			case "MaxValue":
			case "MinValue":
			case "BackgroundColor":
				PlanifyInvalidate();
				break;
			}
		}

		protected void Invalidate()
		{
			this.Invalidated?.Invoke(this, EventArgs.Empty);
		}

		protected async void PlanifyInvalidate()
		{
			if (invalidationPlanification != null)
			{
				await invalidationPlanification;
				return;
			}
			invalidationPlanification = Task.Delay(200);
			await invalidationPlanification;
			Invalidate();
			invalidationPlanification = null;
		}

		public InvalidatedWeakEventHandler<TTarget> ObserveInvalidate<TTarget>(TTarget target, Action<TTarget> onInvalidate) where TTarget : class
		{
			InvalidatedWeakEventHandler<TTarget> invalidatedWeakEventHandler = new InvalidatedWeakEventHandler<TTarget>(this, target, onInvalidate);
			invalidatedWeakEventHandler.Subsribe();
			return invalidatedWeakEventHandler;
		}

		public async Task AnimateAsync(bool entrance, CancellationToken token = default(CancellationToken))
		{
			Stopwatch watch = new Stopwatch();
			int start = ((!entrance) ? 1 : 0);
			int end = (entrance ? 1 : 0);
			_ = end;
			_ = start;
			AnimationProgress = start;
			IsAnimating = true;
			watch.Start();
			TaskCompletionSource<bool> source = new TaskCompletionSource<bool>();
			Timer.Create().Start(TimeSpan.FromSeconds(1.0 / 30.0), delegate
			{
				if (token.IsCancellationRequested)
				{
					source.SetCanceled();
					return false;
				}
				float t = (float)(watch.Elapsed.TotalSeconds / animationDuration.TotalSeconds);
				t = (entrance ? Ease.In(t) : Ease.Out(t));
				AnimationProgress = (float)start + t * (float)(end - start);
				int num;
				if (!entrance || !(AnimationProgress < 1f))
				{
					if (!entrance)
					{
						num = ((AnimationProgress > 0f) ? 1 : 0);
						if (num != 0)
						{
							goto IL_00c3;
						}
					}
					else
					{
						num = 0;
					}
					source.SetResult(result: true);
				}
				else
				{
					num = 1;
				}
				goto IL_00c3;
				IL_00c3:
				return (byte)num != 0;
			});
			await source.Task;
			watch.Stop();
			IsAnimating = false;
		}

		private async void UpdateEntries(IEnumerable<ChartEntry> value)
		{
			_ = 1;
			try
			{
				if (animationCancellation != null)
				{
					animationCancellation.Cancel();
				}
				CancellationTokenSource cancellation = (animationCancellation = new CancellationTokenSource());
				if (!cancellation.Token.IsCancellationRequested && entries != null && IsAnimated)
				{
					await AnimateAsync(entrance: false, cancellation.Token);
				}
				else
				{
					AnimationProgress = 0f;
				}
				if (Set(ref entries, value, "UpdateEntries"))
				{
					RaisePropertyChanged("MinValue");
					RaisePropertyChanged("MaxValue");
				}
				if (!cancellation.Token.IsCancellationRequested && entries != null && IsAnimated)
				{
					await AnimateAsync(entrance: true, cancellation.Token);
				}
				else
				{
					AnimationProgress = 1f;
				}
			}
			catch
			{
				if (Set(ref entries, value, "UpdateEntries"))
				{
					RaisePropertyChanged("MinValue");
					RaisePropertyChanged("MaxValue");
				}
				Invalidate();
			}
			finally
			{
				animationCancellation = null;
			}
		}

		protected void RaisePropertyChanged([CallerMemberName] string property = null)
		{
			this.PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(property));
		}

		protected bool Set<T>(ref T field, T value, [CallerMemberName] string property = null)
		{
			if (!object.Equals(field, property))
			{
				field = value;
				RaisePropertyChanged(property);
				return true;
			}
			return false;
		}
	}
	public class DonutChart : Chart
	{
		public float HoleRadius { get; set; } = 0.5f;

		public LabelMode LabelMode { get; set; } = LabelMode.LeftAndRight;

		public GraphPosition GraphPosition { get; set; }

		public override void DrawContent(SKCanvas canvas, int width, int height)
		{
			//IL_0015: Unknown result type (might be due to invalid IL or missing references)
			//IL_001b: Expected O, but got Unknown
			//IL_005a: Unknown result type (might be due to invalid IL or missing references)
			//IL_005f: Unknown result type (might be due to invalid IL or missing references)
			//IL_0069: Unknown result type (might be due to invalid IL or missing references)
			//IL_006e: Unknown result type (might be due to invalid IL or missing references)
			//IL_0023: Unknown result type (might be due to invalid IL or missing references)
			//IL_0028: Unknown result type (might be due to invalid IL or missing references)
			//IL_0029: Unknown result type (might be due to invalid IL or missing references)
			//IL_0033: Unknown result type (might be due to invalid IL or missing references)
			//IL_003c: Expected O, but got Unknown
			//IL_00b3: Unknown result type (might be due to invalid IL or missing references)
			//IL_00b8: Unknown result type (might be due to invalid IL or missing references)
			//IL_00c2: Unknown result type (might be due to invalid IL or missing references)
			//IL_00c7: Unknown result type (might be due to invalid IL or missing references)
			//IL_003e: Unknown result type (might be due to invalid IL or missing references)
			//IL_0137: Unknown result type (might be due to invalid IL or missing references)
			//IL_013c: Unknown result type (might be due to invalid IL or missing references)
			//IL_0143: Unknown result type (might be due to invalid IL or missing references)
			//IL_0146: Unknown result type (might be due to invalid IL or missing references)
			//IL_0150: Unknown result type (might be due to invalid IL or missing references)
			//IL_0159: Expected O, but got Unknown
			if (base.Entries == null)
			{
				return;
			}
			DrawCaption(canvas, width, height);
			SKAutoCanvasRestore val = new SKAutoCanvasRestore(canvas);
			try
			{
				if (base.DrawDebugRectangles)
				{
					SKPaint val2 = new SKPaint
					{
						Color = SKColors.Red,
						IsStroke = true
					};
					try
					{
						canvas.DrawRect(base.DrawableChartArea, val2);
					}
					finally
					{
						((IDisposable)val2)?.Dispose();
					}
				}
				SKRect drawableChartArea = base.DrawableChartArea;
				float left = ((SKRect)(ref drawableChartArea)).Left;
				drawableChartArea = base.DrawableChartArea;
				canvas.Translate(left + ((SKRect)(ref drawableChartArea)).Width / 2f, (float)(height / 2));
				float num = base.Entries.Sum((ChartEntry x) => Math.Abs(x.Value));
				drawableChartArea = base.DrawableChartArea;
				float width2 = ((SKRect)(ref drawableChartArea)).Width;
				drawableChartArea = base.DrawableChartArea;
				float num2 = (Math.Min(width2, ((SKRect)(ref drawableChartArea)).Height) - 2f * base.Margin) / 2f;
				float num3 = 0f;
				for (int num4 = 0; num4 < base.Entries.Count(); num4++)
				{
					ChartEntry chartEntry = base.Entries.ElementAt(num4);
					float num5 = num3 + Math.Abs(chartEntry.Value) / num * base.AnimationProgress;
					SKPath val3 = RadialHelpers.CreateSectorPath(num3, num5, num2, num2 * HoleRadius);
					SKPaint val4 = new SKPaint
					{
						Style = (SKPaintStyle)0,
						Color = chartEntry.Color,
						IsAntialias = true
					};
					try
					{
						canvas.DrawPath(val3, val4);
					}
					finally
					{
						((IDisposable)val4)?.Dispose();
					}
					num3 = num5;
				}
			}
			finally
			{
				((IDisposable)val)?.Dispose();
			}
		}

		private void DrawCaption(SKCanvas canvas, int width, int height)
		{
			bool isGraphCentered = GraphPosition == GraphPosition.Center;
			base.Entries.Sum((ChartEntry x) => Math.Abs(x.Value));
			switch (LabelMode)
			{
			case LabelMode.None:
				break;
			case LabelMode.RightOnly:
				DrawCaptionElements(canvas, width, height, base.Entries.ToList(), isLeft: false, isGraphCentered);
				break;
			case LabelMode.LeftAndRight:
				DrawCaptionLeftAndRight(canvas, width, height, isGraphCentered);
				break;
			}
		}

		private void DrawCaptionLeftAndRight(SKCanvas canvas, int width, int height, bool isGraphCentered)
		{
			float num = base.Entries.Sum((ChartEntry x) => Math.Abs(x.Value));
			List<ChartEntry> list = new List<ChartEntry>();
			List<ChartEntry> list2 = new List<ChartEntry>();
			int num2 = 0;
			float num3 = 0f;
			for (; num2 < base.Entries.Count(); num2++)
			{
				if (!(num3 < num / 2f))
				{
					break;
				}
				ChartEntry chartEntry = base.Entries.ElementAt(num2);
				list.Add(chartEntry);
				num3 += Math.Abs(chartEntry.Value);
			}
			for (; num2 < base.Entries.Count(); num2++)
			{
				ChartEntry item = base.Entries.ElementAt(num2);
				list2.Add(item);
			}
			list2.Reverse();
			DrawCaptionElements(canvas, width, height, list, isLeft: false, isGraphCentered);
			DrawCaptionElements(canvas, width, height, list2, isLeft: true, isGraphCentered);
		}
	}
	public class LineChart : PointChart
	{
		public float LineSize { get; set; } = 3f;

		public LineMode LineMode { get; set; } = LineMode.Spline;

		public byte LineAreaAlpha { get; set; } = 32;

		public bool EnableYFadeOutGradient { get; set; }

		public LineChart()
		{
			base.PointSize = 10f;
		}

		public override void DrawContent(SKCanvas canvas, int width, int height)
		{
			//IL_00a0: Unknown result type (might be due to invalid IL or missing references)
			//IL_00a5: Unknown result type (might be due to invalid IL or missing references)
			//IL_00b9: Unknown result type (might be due to invalid IL or missing references)
			//IL_00ca: Unknown result type (might be due to invalid IL or missing references)
			//IL_00d7: Unknown result type (might be due to invalid IL or missing references)
			//IL_00ee: Unknown result type (might be due to invalid IL or missing references)
			//IL_00fe: Unknown result type (might be due to invalid IL or missing references)
			if (base.Entries != null)
			{
				string[] labels = base.Entries.Select((ChartEntry x) => x.Label).ToArray();
				SKRect[] array = MeasureLabels(labels);
				float footerHeight = CalculateFooterHeaderHeight(array, base.LabelOrientation);
				string[] labels2 = base.Entries.Select((ChartEntry x) => x.ValueLabel).ToArray();
				SKRect[] array2 = MeasureLabels(labels2);
				float headerHeight = CalculateFooterHeaderHeight(array2, base.ValueLabelOrientation);
				SKSize itemSize = CalculateItemSize(width, height, footerHeight, headerHeight);
				float origin = CalculateYOrigin(((SKSize)(ref itemSize)).Height, headerHeight);
				SKPoint[] points = CalculatePoints(itemSize, origin, headerHeight);
				DrawArea(canvas, points, itemSize, origin);
				DrawLine(canvas, points, itemSize);
				DrawPoints(canvas, points);
				DrawHeader(canvas, labels2, array2, points, itemSize, height, headerHeight);
				DrawFooter(canvas, labels, array, points, itemSize, height, footerHeight);
			}
		}

		protected void DrawLine(SKCanvas canvas, SKPoint[] points, SKSize itemSize)
		{
			//IL_0014: Unknown result type (might be due to invalid IL or missing references)
			//IL_0019: Unknown result type (might be due to invalid IL or missing references)
			//IL_0020: Unknown result type (might be due to invalid IL or missing references)
			//IL_0021: Unknown result type (might be due to invalid IL or missing references)
			//IL_002b: Unknown result type (might be due to invalid IL or missing references)
			//IL_0037: Unknown result type (might be due to invalid IL or missing references)
			//IL_003f: Expected O, but got Unknown
			//IL_0053: Unknown result type (might be due to invalid IL or missing references)
			//IL_0059: Expected O, but got Unknown
			//IL_005b: Unknown result type (might be due to invalid IL or missing references)
			//IL_00a9: Unknown result type (might be due to invalid IL or missing references)
			//IL_00b4: Unknown result type (might be due to invalid IL or missing references)
			//IL_00bb: Unknown result type (might be due to invalid IL or missing references)
			//IL_00c2: Unknown result type (might be due to invalid IL or missing references)
			//IL_00db: Unknown result type (might be due to invalid IL or missing references)
			if (points.Length <= 1 || LineMode == LineMode.None)
			{
				return;
			}
			SKPaint val = new SKPaint
			{
				Style = (SKPaintStyle)1,
				Color = SKColors.White,
				StrokeWidth = LineSize,
				IsAntialias = true
			};
			try
			{
				SKShader val2 = CreateXGradient(points);
				try
				{
					val.Shader = val2;
					SKPath val3 = new SKPath();
					val3.MoveTo(points.First());
					int num = ((LineMode == LineMode.Spline) ? (points.Length - 1) : points.Length);
					for (int i = 0; i < num; i++)
					{
						if (LineMode == LineMode.Spline)
						{
							base.Entries.ElementAt(i);
							base.Entries.ElementAt(i + 1);
							(SKPoint, SKPoint, SKPoint, SKPoint) tuple = CalculateCubicInfo(points, i, itemSize);
							val3.CubicTo(tuple.Item2, tuple.Item4, tuple.Item3);
						}
						else if (LineMode == LineMode.Straight)
						{
							val3.LineTo(points[i]);
						}
					}
					canvas.DrawPath(val3, val);
				}
				finally
				{
					((IDisposable)val2)?.Dispose();
				}
			}
			finally
			{
				((IDisposable)val)?.Dispose();
			}
		}

		protected void DrawArea(SKCanvas canvas, SKPoint[] points, SKSize itemSize, float origin)
		{
			//IL_0015: Unknown result type (might be due to invalid IL or missing references)
			//IL_001a: Unknown result type (might be due to invalid IL or missing references)
			//IL_0021: Unknown result type (might be due to invalid IL or missing references)
			//IL_0022: Unknown result type (might be due to invalid IL or missing references)
			//IL_002c: Unknown result type (might be due to invalid IL or missing references)
			//IL_0034: Expected O, but got Unknown
			//IL_007b: Unknown result type (might be due to invalid IL or missing references)
			//IL_0081: Expected O, but got Unknown
			//IL_0083: Unknown result type (might be due to invalid IL or missing references)
			//IL_0088: Unknown result type (might be due to invalid IL or missing references)
			//IL_009a: Unknown result type (might be due to invalid IL or missing references)
			//IL_0133: Unknown result type (might be due to invalid IL or missing references)
			//IL_0138: Unknown result type (might be due to invalid IL or missing references)
			//IL_00e9: Unknown result type (might be due to invalid IL or missing references)
			//IL_00f4: Unknown result type (might be due to invalid IL or missing references)
			//IL_00fb: Unknown result type (might be due to invalid IL or missing references)
			//IL_0102: Unknown result type (might be due to invalid IL or missing references)
			//IL_011b: Unknown result type (might be due to invalid IL or missing references)
			if (LineAreaAlpha <= 0 || points.Length <= 1)
			{
				return;
			}
			SKPaint val = new SKPaint
			{
				Style = (SKPaintStyle)0,
				Color = SKColors.White,
				IsAntialias = true
			};
			try
			{
				SKShader val2 = CreateXGradient(points, (byte)((float)(int)LineAreaAlpha * base.AnimationProgress));
				try
				{
					SKShader val3 = CreateYGradient(points, (byte)((float)(int)LineAreaAlpha * base.AnimationProgress));
					try
					{
						val.Shader = (EnableYFadeOutGradient ? SKShader.CreateCompose(val3, val2, (SKBlendMode)7) : val2);
						SKPath val4 = new SKPath();
						SKPoint val5 = points.First();
						val4.MoveTo(((SKPoint)(ref val5)).X, origin);
						val4.LineTo(points.First());
						int num = ((LineMode == LineMode.Spline) ? (points.Length - 1) : points.Length);
						for (int i = 0; i < num; i++)
						{
							if (LineMode == LineMode.Spline)
							{
								base.Entries.ElementAt(i);
								base.Entries.ElementAt(i + 1);
								(SKPoint, SKPoint, SKPoint, SKPoint) tuple = CalculateCubicInfo(points, i, itemSize);
								val4.CubicTo(tuple.Item2, tuple.Item4, tuple.Item3);
							}
							else if (LineMode == LineMode.Straight)
							{
								val4.LineTo(points[i]);
							}
						}
						val5 = points.Last();
						val4.LineTo(((SKPoint)(ref val5)).X, origin);
						val4.Close();
						canvas.DrawPath(val4, val);
					}
					finally
					{
						((IDisposable)val3)?.Dispose();
					}
				}
				finally
				{
					((IDisposable)val2)?.Dispose();
				}
			}
			finally
			{
				((IDisposable)val)?.Dispose();
			}
		}

		private (SKPoint point, SKPoint control, SKPoint nextPoint, SKPoint nextControl) CalculateCubicInfo(SKPoint[] points, int i, SKSize itemSize)
		{
			//IL_0002: Unknown result type (might be due to invalid IL or missing references)
			//IL_000b: Unknown result type (might be due to invalid IL or missing references)
			//IL_0010: Unknown result type (might be due to invalid IL or missing references)
			//IL_002a: Unknown result type (might be due to invalid IL or missing references)
			//IL_002b: Unknown result type (might be due to invalid IL or missing references)
			//IL_002c: Unknown result type (might be due to invalid IL or missing references)
			//IL_0031: Unknown result type (might be due to invalid IL or missing references)
			//IL_0032: Unknown result type (might be due to invalid IL or missing references)
			//IL_0033: Unknown result type (might be due to invalid IL or missing references)
			//IL_0034: Unknown result type (might be due to invalid IL or missing references)
			//IL_0039: Unknown result type (might be due to invalid IL or missing references)
			//IL_003a: Unknown result type (might be due to invalid IL or missing references)
			//IL_003b: Unknown result type (might be due to invalid IL or missing references)
			//IL_003c: Unknown result type (might be due to invalid IL or missing references)
			SKPoint val = points[i];
			SKPoint val2 = points[i + 1];
			SKPoint val3 = default(SKPoint);
			((SKPoint)(ref val3))..ctor(((SKSize)(ref itemSize)).Width * 0.8f, 0f);
			SKPoint item = val + val3;
			SKPoint item2 = val2 - val3;
			return (point: val, control: item, nextPoint: val2, nextControl: item2);
		}

		private SKShader CreateXGradient(SKPoint[] points, byte alpha = byte.MaxValue)
		{
			//IL_000e: Unknown result type (might be due to invalid IL or missing references)
			//IL_0013: Unknown result type (might be due to invalid IL or missing references)
			//IL_001d: Unknown result type (might be due to invalid IL or missing references)
			//IL_0022: Unknown result type (might be due to invalid IL or missing references)
			//IL_0031: Unknown result type (might be due to invalid IL or missing references)
			//IL_003c: Unknown result type (might be due to invalid IL or missing references)
			SKPoint val = points.First();
			float x = ((SKPoint)(ref val)).X;
			val = points.Last();
			float x2 = ((SKPoint)(ref val)).X;
			return SKShader.CreateLinearGradient(new SKPoint(x, 0f), new SKPoint(x2, 0f), base.Entries.Select(delegate(ChartEntry chartEntry)
			{
				//IL_0001: Unknown result type (might be due to invalid IL or missing references)
				//IL_0006: Unknown result type (might be due to invalid IL or missing references)
				//IL_000f: Unknown result type (might be due to invalid IL or missing references)
				SKColor color = chartEntry.Color;
				return ((SKColor)(ref color)).WithAlpha(alpha);
			}).ToArray(), (float[])null, (SKShaderTileMode)0);
		}

		private SKShader CreateYGradient(SKPoint[] points, byte alpha = byte.MaxValue)
		{
			//IL_002e: Unknown result type (might be due to invalid IL or missing references)
			//IL_003a: Unknown result type (might be due to invalid IL or missing references)
			//IL_004d: Unknown result type (might be due to invalid IL or missing references)
			//IL_0052: Unknown result type (might be due to invalid IL or missing references)
			//IL_005f: Unknown result type (might be due to invalid IL or missing references)
			//IL_0064: Unknown result type (might be due to invalid IL or missing references)
			float num = points.Max((SKPoint i) => ((SKPoint)(ref i)).Y);
			int num2 = 0;
			return SKShader.CreateLinearGradient(new SKPoint(0f, num), new SKPoint(0f, (float)num2), (SKColor[])(object)new SKColor[2]
			{
				((SKColor)(ref SKColors.White)).WithAlpha(alpha),
				((SKColor)(ref SKColors.White)).WithAlpha((byte)0)
			}, (float[])null, (SKShaderTileMode)0);
		}
	}
	public class PieChart : DonutChart
	{
		public PieChart()
		{
			base.HoleRadius = 0f;
		}
	}
	public class PointChart : Chart
	{
		private Orientation labelOrientation;

		private Orientation valueLabelOrientation;

		public float PointSize { get; set; } = 14f;

		public PointMode PointMode { get; set; } = PointMode.Circle;

		public byte PointAreaAlpha { get; set; } = 100;

		public Orientation LabelOrientation
		{
			get
			{
				return labelOrientation;
			}
			set
			{
				labelOrientation = ((value == Orientation.Default) ? Orientation.Vertical : value);
			}
		}

		public Orientation ValueLabelOrientation
		{
			get
			{
				return valueLabelOrientation;
			}
			set
			{
				valueLabelOrientation = ((value == Orientation.Default) ? Orientation.Vertical : value);
			}
		}

		private float ValueRange => base.MaxValue - base.MinValue;

		public PointChart()
		{
			LabelOrientation = Orientation.Default;
			ValueLabelOrientation = Orientation.Default;
		}

		public override void DrawContent(SKCanvas canvas, int width, int height)
		{
			//IL_00a0: Unknown result type (might be due to invalid IL or missing references)
			//IL_00a5: Unknown result type (might be due to invalid IL or missing references)
			//IL_00b9: Unknown result type (might be due to invalid IL or missing references)
			//IL_00e1: Unknown result type (might be due to invalid IL or missing references)
			//IL_00f1: Unknown result type (might be due to invalid IL or missing references)
			if (base.Entries != null)
			{
				string[] labels = base.Entries.Select((ChartEntry x) => x.Label).ToArray();
				SKRect[] array = MeasureLabels(labels);
				float footerHeight = CalculateFooterHeaderHeight(array, LabelOrientation);
				string[] labels2 = base.Entries.Select((ChartEntry x) => x.ValueLabel).ToArray();
				SKRect[] array2 = MeasureLabels(labels2);
				float headerHeight = CalculateFooterHeaderHeight(array2, ValueLabelOrientation);
				SKSize itemSize = CalculateItemSize(width, height, footerHeight, headerHeight);
				float origin = CalculateYOrigin(((SKSize)(ref itemSize)).Height, headerHeight);
				SKPoint[] points = CalculatePoints(itemSize, origin, headerHeight);
				DrawPointAreas(canvas, points, origin);
				DrawPoints(canvas, points);
				DrawHeader(canvas, labels2, array2, points, itemSize, height, headerHeight);
				DrawFooter(canvas, labels, array, points, itemSize, height, footerHeight);
			}
		}

		protected float CalculateYOrigin(float itemHeight, float headerHeight)
		{
			if (base.MaxValue <= 0f)
			{
				return headerHeight;
			}
			if (base.MinValue > 0f)
			{
				return headerHeight + itemHeight;
			}
			return headerHeight + base.MaxValue / ValueRange * itemHeight;
		}

		protected SKSize CalculateItemSize(int width, int height, float footerHeight, float headerHeight)
		{
			//IL_002d: Unknown result type (might be due to invalid IL or missing references)
			int num = base.Entries.Count();
			float num2 = ((float)width - (float)(num + 1) * base.Margin) / (float)num;
			float num3 = (float)height - base.Margin - footerHeight - headerHeight;
			return new SKSize(num2, num3);
		}

		protected SKPoint[] CalculatePoints(SKSize itemSize, float origin, float headerHeight)
		{
			//IL_0084: Unknown result type (might be due to invalid IL or missing references)
			List<SKPoint> list = new List<SKPoint>();
			SKPoint item = default(SKPoint);
			for (int i = 0; i < base.Entries.Count(); i++)
			{
				float value = base.Entries.ElementAt(i).Value;
				float num = base.Margin + ((SKSize)(ref itemSize)).Width / 2f + (float)i * (((SKSize)(ref itemSize)).Width + base.Margin);
				float num2 = headerHeight + ((1f - base.AnimationProgress) * (origin - headerHeight) + (base.MaxValue - value) / ValueRange * ((SKSize)(ref itemSize)).Height * base.AnimationProgress);
				((SKPoint)(ref item))..ctor(num, num2);
				list.Add(item);
			}
			return list.ToArray();
		}

		protected void DrawHeader(SKCanvas canvas, string[] labels, SKRect[] labelSizes, SKPoint[] points, SKSize itemSize, int height, float headerHeight)
		{
			//IL_0054: Unknown result type (might be due to invalid IL or missing references)
			DrawLabels(canvas, labels, ((IEnumerable<SKPoint>)points).Select((Func<SKPoint, SKPoint>)((SKPoint p) => new SKPoint(((SKPoint)(ref p)).X, headerHeight - base.Margin))).ToArray(), labelSizes, base.Entries.Select(delegate(ChartEntry x)
			{
				//IL_0001: Unknown result type (might be due to invalid IL or missing references)
				//IL_0006: Unknown result type (might be due to invalid IL or missing references)
				//IL_001b: Unknown result type (might be due to invalid IL or missing references)
				SKColor valueLabelColor = x.ValueLabelColor;
				return ((SKColor)(ref valueLabelColor)).WithAlpha((byte)(255f * base.AnimationProgress));
			}).ToArray(), ValueLabelOrientation, isTop: true, itemSize, height);
		}

		protected void DrawFooter(SKCanvas canvas, string[] labels, SKRect[] labelSizes, SKPoint[] points, SKSize itemSize, int height, float footerHeight)
		{
			//IL_005c: Unknown result type (might be due to invalid IL or missing references)
			DrawLabels(canvas, labels, ((IEnumerable<SKPoint>)points).Select((Func<SKPoint, SKPoint>)((SKPoint p) => new SKPoint(((SKPoint)(ref p)).X, (float)height - footerHeight + base.Margin))).ToArray(), labelSizes, base.Entries.Select((ChartEntry x) => base.LabelColor).ToArray(), LabelOrientation, isTop: false, itemSize, height);
		}

		protected void DrawPoints(SKCanvas canvas, SKPoint[] points)
		{
			//IL_001f: Unknown result type (might be due to invalid IL or missing references)
			//IL_0024: Unknown result type (might be due to invalid IL or missing references)
			//IL_0026: Unknown result type (might be due to invalid IL or missing references)
			//IL_0028: Unknown result type (might be due to invalid IL or missing references)
			if (points.Length != 0 && PointMode != PointMode.None)
			{
				for (int i = 0; i < points.Length; i++)
				{
					ChartEntry chartEntry = base.Entries.ElementAt(i);
					SKPoint point = points[i];
					canvas.DrawPoint(point, chartEntry.Color, PointSize, PointMode);
				}
			}
		}

		protected void DrawPointAreas(SKCanvas canvas, SKPoint[] points, float origin)
		{
			//IL_0029: Unknown result type (might be due to invalid IL or missing references)
			//IL_002e: Unknown result type (might be due to invalid IL or missing references)
			//IL_0043: Unknown result type (might be due to invalid IL or missing references)
			//IL_0054: Unknown result type (might be due to invalid IL or missing references)
			//IL_0062: Unknown result type (might be due to invalid IL or missing references)
			//IL_0067: Unknown result type (might be due to invalid IL or missing references)
			//IL_0071: Unknown result type (might be due to invalid IL or missing references)
			//IL_0076: Unknown result type (might be due to invalid IL or missing references)
			//IL_007e: Unknown result type (might be due to invalid IL or missing references)
			//IL_0083: Unknown result type (might be due to invalid IL or missing references)
			//IL_0090: Unknown result type (might be due to invalid IL or missing references)
			//IL_0095: Unknown result type (might be due to invalid IL or missing references)
			//IL_00a3: Unknown result type (might be due to invalid IL or missing references)
			//IL_00a8: Unknown result type (might be due to invalid IL or missing references)
			//IL_00af: Unknown result type (might be due to invalid IL or missing references)
			//IL_00b1: Unknown result type (might be due to invalid IL or missing references)
			//IL_00b6: Unknown result type (might be due to invalid IL or missing references)
			//IL_00c0: Unknown result type (might be due to invalid IL or missing references)
			//IL_00cc: Expected O, but got Unknown
			//IL_010d: Unknown result type (might be due to invalid IL or missing references)
			if (points.Length == 0 || PointAreaAlpha <= 0)
			{
				return;
			}
			for (int i = 0; i < points.Length; i++)
			{
				ChartEntry chartEntry = base.Entries.ElementAt(i);
				SKPoint val = points[i];
				float num = Math.Min(origin, ((SKPoint)(ref val)).Y);
				SKPoint val2 = new SKPoint(0f, origin);
				SKPoint val3 = new SKPoint(0f, ((SKPoint)(ref val)).Y);
				SKColor[] array = new SKColor[2];
				SKColor color = chartEntry.Color;
				array[0] = ((SKColor)(ref color)).WithAlpha(PointAreaAlpha);
				color = chartEntry.Color;
				array[1] = ((SKColor)(ref color)).WithAlpha((byte)(PointAreaAlpha / 3));
				SKShader val4 = SKShader.CreateLinearGradient(val2, val3, (SKColor[])(object)array, (float[])null, (SKShaderTileMode)0);
				try
				{
					SKPaint val5 = new SKPaint
					{
						Style = (SKPaintStyle)0
					};
					color = chartEntry.Color;
					val5.Color = ((SKColor)(ref color)).WithAlpha(PointAreaAlpha);
					SKPaint val6 = val5;
					try
					{
						val6.Shader = val4;
						float num2 = Math.Max(2f, Math.Abs(origin - ((SKPoint)(ref val)).Y));
						canvas.DrawRect(SKRect.Create(((SKPoint)(ref val)).X - PointSize / 2f, num, PointSize, num2), val6);
					}
					finally
					{
						((IDisposable)val6)?.Dispose();
					}
				}
				finally
				{
					((IDisposable)val4)?.Dispose();
				}
			}
		}

		protected void DrawLabels(SKCanvas canvas, string[] texts, SKPoint[] points, SKRect[] sizes, SKColor[] colors, Orientation orientation, bool isTop, SKSize itemSize, float height)
		{
			//IL_001c: Unknown result type (might be due to invalid IL or missing references)
			//IL_0021: Unknown result type (might be due to invalid IL or missing references)
			//IL_0032: Unknown result type (might be due to invalid IL or missing references)
			//IL_0038: Expected O, but got Unknown
			//IL_0038: Unknown result type (might be due to invalid IL or missing references)
			//IL_003e: Expected O, but got Unknown
			//IL_0055: Unknown result type (might be due to invalid IL or missing references)
			//IL_0075: Unknown result type (might be due to invalid IL or missing references)
			//IL_007a: Unknown result type (might be due to invalid IL or missing references)
			if (points.Length == 0)
			{
				return;
			}
			for (int i = 0; i < points.Length; i++)
			{
				ChartEntry chartEntry = base.Entries.ElementAt(i);
				SKPoint val = points[i];
				if (string.IsNullOrEmpty(chartEntry.ValueLabel))
				{
					continue;
				}
				SKAutoCanvasRestore val2 = new SKAutoCanvasRestore(canvas);
				try
				{
					SKPaint val3 = new SKPaint();
					try
					{
						val3.TextSize = base.LabelTextSize;
						val3.IsAntialias = true;
						val3.Color = colors[i];
						val3.IsStroke = false;
						val3.Typeface = base.Typeface;
						SKRect val4 = sizes[i];
						string text = texts[i];
						if (orientation == Orientation.Vertical)
						{
							float num = ((SKPoint)(ref val)).Y;
							if (isTop)
							{
								num -= ((SKRect)(ref val4)).Width;
							}
							canvas.RotateDegrees(90f);
							canvas.Translate(num, 0f - ((SKPoint)(ref val)).X + ((SKRect)(ref val4)).Height / 2f);
						}
						else
						{
							if (((SKRect)(ref val4)).Width > ((SKSize)(ref itemSize)).Width)
							{
								text = text.Substring(0, Math.Min(3, text.Length));
								val3.MeasureText(text, ref val4);
							}
							if (((SKRect)(ref val4)).Width > ((SKSize)(ref itemSize)).Width)
							{
								text = text.Substring(0, Math.Min(1, text.Length));
								val3.MeasureText(text, ref val4);
							}
							float num2 = ((SKPoint)(ref val)).Y;
							if (isTop)
							{
								num2 -= ((SKRect)(ref val4)).Height;
							}
							canvas.Translate(((SKPoint)(ref val)).X - ((SKRect)(ref val4)).Width / 2f, num2);
						}
						canvas.DrawText(text, 0f, 0f, val3);
					}
					finally
					{
						((IDisposable)val3)?.Dispose();
					}
				}
				finally
				{
					((IDisposable)val2)?.Dispose();
				}
			}
		}

		protected float CalculateFooterHeaderHeight(SKRect[] valueLabelSizes, Orientation orientation)
		{
			float num = base.Margin;
			if (base.Entries.Any((ChartEntry e) => !string.IsNullOrEmpty(e.Label)))
			{
				if (orientation == Orientation.Vertical)
				{
					float num2 = valueLabelSizes.Max((SKRect x) => ((SKRect)(ref x)).Width);
					if (num2 > 0f)
					{
						num += num2 + base.Margin;
					}
				}
				else
				{
					num += base.LabelTextSize + base.Margin;
				}
			}
			return num;
		}

		protected SKRect[] MeasureLabels(string[] labels)
		{
			//IL_0007: Unknown result type (might be due to invalid IL or missing references)
			//IL_0011: Expected O, but got Unknown
			SKPaint paint = new SKPaint();
			try
			{
				paint.TextSize = base.LabelTextSize;
				return ((IEnumerable<string>)labels).Select((Func<string, SKRect>)delegate(string text)
				{
					//IL_0010: Unknown result type (might be due to invalid IL or missing references)
					//IL_0025: Unknown result type (might be due to invalid IL or missing references)
					//IL_0008: Unknown result type (might be due to invalid IL or missing references)
					if (string.IsNullOrEmpty(text))
					{
						return SKRect.Empty;
					}
					SKRect result = default(SKRect);
					paint.MeasureText(text, ref result);
					return result;
				}).ToArray();
			}
			finally
			{
				if (paint != null)
				{
					((IDisposable)paint).Dispose();
				}
			}
		}
	}
	public class RadarChart : Chart
	{
		private const float Epsilon = 0.01f;

		public float LineSize { get; set; } = 3f;

		public SKColor BorderLineColor { get; set; } = ((SKColor)(ref SKColors.LightGray)).WithAlpha((byte)110);

		public float BorderLineSize { get; set; } = 2f;

		public PointMode PointMode { get; set; } = PointMode.Circle;

		public float PointSize { get; set; } = 14f;

		private float AbsoluteMinimum => base.Entries.Select((ChartEntry x) => x.Value).Concat(new float[3]
		{
			base.MaxValue,
			base.MinValue,
			base.InternalMinValue.GetValueOrDefault()
		}).Min((float x) => Math.Abs(x));

		private float AbsoluteMaximum => base.Entries.Select((ChartEntry x) => x.Value).Concat(new float[3]
		{
			base.MaxValue,
			base.MinValue,
			base.InternalMinValue.GetValueOrDefault()
		}).Max((float x) => Math.Abs(x));

		private float ValueRange => AbsoluteMaximum - AbsoluteMinimum;

		public override void DrawContent(SKCanvas canvas, int width, int height)
		{
			//IL_0095: Unknown result type (might be due to invalid IL or missing references)
			//IL_0099: Unknown result type (might be due to invalid IL or missing references)
			//IL_009e: Unknown result type (might be due to invalid IL or missing references)
			//IL_00a2: Unknown result type (might be due to invalid IL or missing references)
			//IL_00a9: Unknown result type (might be due to invalid IL or missing references)
			//IL_00b0: Expected O, but got Unknown
			//IL_00d7: Unknown result type (might be due to invalid IL or missing references)
			//IL_00d9: Unknown result type (might be due to invalid IL or missing references)
			//IL_010c: Unknown result type (might be due to invalid IL or missing references)
			//IL_0110: Unknown result type (might be due to invalid IL or missing references)
			//IL_0115: Unknown result type (might be due to invalid IL or missing references)
			//IL_0128: Unknown result type (might be due to invalid IL or missing references)
			//IL_012d: Unknown result type (might be due to invalid IL or missing references)
			//IL_0134: Unknown result type (might be due to invalid IL or missing references)
			//IL_0140: Unknown result type (might be due to invalid IL or missing references)
			//IL_0142: Unknown result type (might be due to invalid IL or missing references)
			//IL_014c: Unknown result type (might be due to invalid IL or missing references)
			//IL_0155: Expected O, but got Unknown
			//IL_015c: Unknown result type (might be due to invalid IL or missing references)
			//IL_0160: Unknown result type (might be due to invalid IL or missing references)
			//IL_0165: Unknown result type (might be due to invalid IL or missing references)
			//IL_0199: Unknown result type (might be due to invalid IL or missing references)
			//IL_01a0: Expected O, but got Unknown
			//IL_01b9: Unknown result type (might be due to invalid IL or missing references)
			//IL_01be: Unknown result type (might be due to invalid IL or missing references)
			//IL_01c4: Unknown result type (might be due to invalid IL or missing references)
			//IL_01c9: Unknown result type (might be due to invalid IL or missing references)
			//IL_01e1: Unknown result type (might be due to invalid IL or missing references)
			//IL_026b: Unknown result type (might be due to invalid IL or missing references)
			//IL_026e: Unknown result type (might be due to invalid IL or missing references)
			//IL_0273: Unknown result type (might be due to invalid IL or missing references)
			//IL_0278: Unknown result type (might be due to invalid IL or missing references)
			//IL_027d: Unknown result type (might be due to invalid IL or missing references)
			//IL_0281: Unknown result type (might be due to invalid IL or missing references)
			//IL_0286: Unknown result type (might be due to invalid IL or missing references)
			//IL_028c: Unknown result type (might be due to invalid IL or missing references)
			//IL_0291: Unknown result type (might be due to invalid IL or missing references)
			//IL_02a2: Unknown result type (might be due to invalid IL or missing references)
			//IL_02b3: Unknown result type (might be due to invalid IL or missing references)
			//IL_02b7: Unknown result type (might be due to invalid IL or missing references)
			//IL_02bc: Unknown result type (might be due to invalid IL or missing references)
			//IL_02c0: Unknown result type (might be due to invalid IL or missing references)
			//IL_02d1: Unknown result type (might be due to invalid IL or missing references)
			//IL_02d5: Unknown result type (might be due to invalid IL or missing references)
			//IL_0314: Unknown result type (might be due to invalid IL or missing references)
			//IL_0319: Unknown result type (might be due to invalid IL or missing references)
			//IL_031b: Unknown result type (might be due to invalid IL or missing references)
			//IL_031e: Unknown result type (might be due to invalid IL or missing references)
			//IL_0320: Unknown result type (might be due to invalid IL or missing references)
			//IL_0325: Unknown result type (might be due to invalid IL or missing references)
			//IL_032a: Unknown result type (might be due to invalid IL or missing references)
			//IL_032d: Unknown result type (might be due to invalid IL or missing references)
			//IL_036e: Unknown result type (might be due to invalid IL or missing references)
			//IL_0391: Unknown result type (might be due to invalid IL or missing references)
			//IL_039f: Unknown result type (might be due to invalid IL or missing references)
			//IL_03a4: Unknown result type (might be due to invalid IL or missing references)
			//IL_03b5: Unknown result type (might be due to invalid IL or missing references)
			//IL_03c0: Unknown result type (might be due to invalid IL or missing references)
			//IL_03c2: Unknown result type (might be due to invalid IL or missing references)
			//IL_0385: Unknown result type (might be due to invalid IL or missing references)
			int num = base.Entries?.Count() ?? 0;
			if (num <= 0)
			{
				return;
			}
			float num2 = base.Entries.Max(delegate(ChartEntry x)
			{
				float num11 = 0f;
				bool flag = !string.IsNullOrEmpty(x.Label);
				bool flag2 = !string.IsNullOrEmpty(x.ValueLabel);
				if (flag || flag2)
				{
					_ = flag && flag2;
					float num12 = base.LabelTextSize * 0.6f;
					if (flag)
					{
						num11 += base.LabelTextSize;
					}
					if (flag2)
					{
						num11 += base.LabelTextSize;
					}
				}
				return num11;
			});
			SKPoint val = default(SKPoint);
			((SKPoint)(ref val))..ctor((float)(width / 2), (float)(height / 2));
			float num3 = ((float)Math.Min(width, height) - 2f * base.Margin) / 2f - num2;
			float num4 = (float)(Math.PI * 2.0 / (double)num);
			float num5 = (float)Math.PI;
			ChartEntry chartEntry = base.Entries.First();
			float num6 = num5;
			SKPoint point = GetPoint(chartEntry.Value * base.AnimationProgress, val, num6, num3);
			DrawBorder(canvas, val, num3);
			SKPath val2 = new SKPath();
			try
			{
				val2.AddCircle(((SKPoint)(ref val)).X, ((SKPoint)(ref val)).Y, num3, (SKPathDirection)0);
				SKPoint val7 = default(SKPoint);
				for (int num7 = 0; num7 < num; num7++)
				{
					float num8 = num6;
					ChartEntry chartEntry2 = chartEntry;
					SKPoint val3 = point;
					int num9 = (num7 + 1) % num;
					num6 = num5 + num4 * (float)num9;
					chartEntry = base.Entries.ElementAt(num9);
					point = GetPoint(chartEntry.Value * base.AnimationProgress, val, num6, num3);
					canvas.Save();
					canvas.ClipPath(val2, (SKClipOperation)1, false);
					SKPaint val4 = new SKPaint
					{
						Style = (SKPaintStyle)1,
						StrokeWidth = BorderLineSize,
						Color = BorderLineColor,
						IsAntialias = true
					};
					try
					{
						SKPoint point2 = GetPoint(base.MaxValue, val, num8, num3);
						canvas.DrawLine(((SKPoint)(ref val3)).X, ((SKPoint)(ref val3)).Y, ((SKPoint)(ref point2)).X, ((SKPoint)(ref point2)).Y, val4);
					}
					finally
					{
						((IDisposable)val4)?.Dispose();
					}
					SKPaint val5 = new SKPaint();
					val5.Style = (SKPaintStyle)1;
					val5.StrokeWidth = BorderLineSize;
					SKColor color = chartEntry2.Color;
					SKColor color2 = chartEntry2.Color;
					val5.Color = ((SKColor)(ref color)).WithAlpha((byte)((float)(int)((SKColor)(ref color2)).Alpha * 0.75f * base.AnimationProgress));
					val5.PathEffect = SKPathEffect.CreateDash(new float[2]
					{
						BorderLineSize,
						BorderLineSize * 2f
					}, 0f);
					val5.IsAntialias = true;
					SKPaint val6 = val5;
					try
					{
						float num10 = Math.Abs(chartEntry2.Value - AbsoluteMinimum) / ValueRange;
						canvas.DrawCircle(((SKPoint)(ref val)).X, ((SKPoint)(ref val)).Y, num3 * num10, val6);
					}
					finally
					{
						((IDisposable)val6)?.Dispose();
					}
					SKPoint startPoint = val;
					color = chartEntry2.Color;
					SKColor startColor = ((SKColor)(ref color)).WithAlpha((byte)0);
					SKPoint endPoint = val3;
					color = chartEntry2.Color;
					color2 = chartEntry2.Color;
					canvas.DrawGradientLine(startPoint, startColor, endPoint, ((SKColor)(ref color)).WithAlpha((byte)((float)(int)((SKColor)(ref color2)).Alpha * 0.75f)), LineSize);
					canvas.DrawGradientLine(val3, chartEntry2.Color, point, chartEntry.Color, LineSize);
					canvas.DrawPoint(val3, chartEntry2.Color, PointSize, PointMode);
					canvas.Restore();
					((SKPoint)(ref val7))..ctor(0f, num3 + base.LabelTextSize + PointSize / 2f);
					SKMatrix val8 = SKMatrix.CreateRotation(num8);
					val7 = val + ((SKMatrix)(ref val8)).MapPoint(val7);
					SKTextAlign horizontalAlignment = (SKTextAlign)0;
					if (Math.Abs((double)num8 - ((double)num5 + Math.PI)) < 0.009999999776482582 || Math.Abs((double)num8 - Math.PI) < 0.009999999776482582)
					{
						horizontalAlignment = (SKTextAlign)1;
					}
					else if (num8 > (float)((double)num5 + Math.PI))
					{
						horizontalAlignment = (SKTextAlign)2;
					}
					string label = chartEntry2.Label;
					SKColor textColor = chartEntry2.TextColor;
					string valueLabel = chartEntry2.ValueLabel;
					color = chartEntry2.Color;
					canvas.DrawCaptionLabels(label, textColor, valueLabel, ((SKColor)(ref color)).WithAlpha((byte)(255f * base.AnimationProgress)), base.LabelTextSize, val7, horizontalAlignment, base.Typeface, out var _);
				}
			}
			finally
			{
				((IDisposable)val2)?.Dispose();
			}
		}

		private SKPoint GetPoint(float value, SKPoint center, float angle, float radius)
		{
			//IL_0026: Unknown result type (might be due to invalid IL or missing references)
			//IL_002b: Unknown result type (might be due to invalid IL or missing references)
			//IL_002c: Unknown result type (might be due to invalid IL or missing references)
			//IL_002f: Unknown result type (might be due to invalid IL or missing references)
			//IL_0030: Unknown result type (might be due to invalid IL or missing references)
			//IL_0035: Unknown result type (might be due to invalid IL or missing references)
			float num = Math.Abs(value - AbsoluteMinimum) / ValueRange;
			SKPoint val = default(SKPoint);
			((SKPoint)(ref val))..ctor(0f, radius * num);
			SKMatrix val2 = SKMatrix.CreateRotation(angle);
			return center + ((SKMatrix)(ref val2)).MapPoint(val);
		}

		private void DrawBorder(SKCanvas canvas, SKPoint center, float radius)
		{
			//IL_0000: Unknown result type (might be due to invalid IL or missing references)
			//IL_0005: Unknown result type (might be due to invalid IL or missing references)
			//IL_000c: Unknown result type (might be due to invalid IL or missing references)
			//IL_0018: Unknown result type (might be due to invalid IL or missing references)
			//IL_001a: Unknown result type (might be due to invalid IL or missing references)
			//IL_0024: Unknown result type (might be due to invalid IL or missing references)
			//IL_002c: Expected O, but got Unknown
			SKPaint val = new SKPaint
			{
				Style = (SKPaintStyle)1,
				StrokeWidth = BorderLineSize,
				Color = BorderLineColor,
				IsAntialias = true
			};
			try
			{
				canvas.DrawCircle(((SKPoint)(ref center)).X, ((SKPoint)(ref center)).Y, radius, val);
			}
			finally
			{
				((IDisposable)val)?.Dispose();
			}
		}
	}
	public class RadialGaugeChart : Chart
	{
		public float LineSize { get; set; } = -1f;

		public byte LineAreaAlpha { get; set; } = 52;

		public float StartAngle { get; set; } = -90f;

		private float AbsoluteMinimum => base.Entries?.Select((ChartEntry x) => x.Value).Concat(new float[3]
		{
			base.MaxValue,
			base.MinValue,
			base.InternalMinValue.GetValueOrDefault()
		}).Min((float x) => Math.Abs(x)) ?? 0f;

		private float AbsoluteMaximum => base.Entries?.Select((ChartEntry x) => x.Value).Concat(new float[3]
		{
			base.MaxValue,
			base.MinValue,
			base.InternalMinValue.GetValueOrDefault()
		}).Max((float x) => Math.Abs(x)) ?? 0f;

		private float ValueRange => AbsoluteMaximum - AbsoluteMinimum;

		public void DrawGaugeArea(SKCanvas canvas, ChartEntry entry, float radius, int cx, int cy, float strokeWidth)
		{
			//IL_0000: Unknown result type (might be due to invalid IL or missing references)
			//IL_0005: Unknown result type (might be due to invalid IL or missing references)
			//IL_000c: Unknown result type (might be due to invalid IL or missing references)
			//IL_0014: Unknown result type (might be due to invalid IL or missing references)
			//IL_0016: Unknown result type (might be due to invalid IL or missing references)
			//IL_001b: Unknown result type (might be due to invalid IL or missing references)
			//IL_0024: Unknown result type (might be due to invalid IL or missing references)
			//IL_002e: Unknown result type (might be due to invalid IL or missing references)
			//IL_0036: Expected O, but got Unknown
			SKPaint val = new SKPaint
			{
				Style = (SKPaintStyle)1,
				StrokeWidth = strokeWidth
			};
			SKColor color = entry.Color;
			val.Color = ((SKColor)(ref color)).WithAlpha(LineAreaAlpha);
			val.IsAntialias = true;
			SKPaint val2 = val;
			try
			{
				canvas.DrawCircle((float)cx, (float)cy, radius, val2);
			}
			finally
			{
				((IDisposable)val2)?.Dispose();
			}
		}

		public void DrawGauge(SKCanvas canvas, ChartEntry entry, float radius, int cx, int cy, float strokeWidth)
		{
			//IL_0000: Unknown result type (might be due to invalid IL or missing references)
			//IL_0005: Unknown result type (might be due to invalid IL or missing references)
			//IL_000c: Unknown result type (might be due to invalid IL or missing references)
			//IL_0014: Unknown result type (might be due to invalid IL or missing references)
			//IL_001b: Unknown result type (might be due to invalid IL or missing references)
			//IL_001d: Unknown result type (might be due to invalid IL or missing references)
			//IL_0027: Unknown result type (might be due to invalid IL or missing references)
			//IL_002f: Expected O, but got Unknown
			//IL_002f: Unknown result type (might be due to invalid IL or missing references)
			//IL_0035: Expected O, but got Unknown
			//IL_0075: Unknown result type (might be due to invalid IL or missing references)
			SKPaint val = new SKPaint
			{
				Style = (SKPaintStyle)1,
				StrokeWidth = strokeWidth,
				StrokeCap = (SKStrokeCap)1,
				Color = entry.Color,
				IsAntialias = true
			};
			try
			{
				SKPath val2 = new SKPath();
				try
				{
					float num = base.AnimationProgress * 360f * (Math.Abs(entry.Value) - AbsoluteMinimum) / ValueRange;
					val2.AddArc(SKRect.Create((float)cx - radius, (float)cy - radius, 2f * radius, 2f * radius), StartAngle, num);
					canvas.DrawPath(val2, val);
				}
				finally
				{
					((IDisposable)val2)?.Dispose();
				}
			}
			finally
			{
				((IDisposable)val)?.Dispose();
			}
		}

		public override void DrawContent(SKCanvas canvas, int width, int height)
		{
			if (base.Entries != null)
			{
				DrawCaption(canvas, width, height);
				base.Entries.Sum((ChartEntry x) => Math.Abs(x.Value));
				float num = ((float)Math.Min(width, height) - 2f * base.Margin) / 2f;
				int cx = width / 2;
				int cy = height / 2;
				float num2 = ((LineSize < 0f) ? (num / (float)((base.Entries.Count() + 1) * 2)) : LineSize);
				float num3 = num2 * 2f;
				for (int num4 = 0; num4 < base.Entries.Count(); num4++)
				{
					ChartEntry entry = base.Entries.ElementAt(num4);
					float radius = (float)(num4 + 1) * num3;
					DrawGaugeArea(canvas, entry, radius, cx, cy, num2);
					DrawGauge(canvas, entry, radius, cx, cy, num2);
				}
			}
		}

		private void DrawCaption(SKCanvas canvas, int width, int height)
		{
			List<ChartEntry> source = base.Entries.Take(base.Entries.Count() / 2).ToList();
			List<ChartEntry> list = base.Entries.Skip(source.Count()).ToList();
			list.Reverse();
			DrawCaptionElements(canvas, width, height, source, isLeft: false, isGraphCentered: false);
			DrawCaptionElements(canvas, width, height, list, isLeft: true, isGraphCentered: false);
		}
	}
	public enum GraphPosition
	{
		AutoFill,
		Center
	}
	public enum LabelMode
	{
		None,
		LeftAndRight,
		RightOnly
	}
	public enum LineMode
	{
		None,
		Spline,
		Straight
	}
	public enum Orientation
	{
		Default,
		Horizontal,
		Vertical
	}
	public enum PointMode
	{
		None,
		Circle,
		Square
	}
	internal static class CanvasExtensions
	{
		public static void DrawCaptionLabels(this SKCanvas canvas, string label, SKColor labelColor, string value, SKColor valueColor, float textSize, SKPoint point, SKTextAlign horizontalAlignment, SKTypeface typeface, out SKRect totalBounds)
		{
			//IL_0016: Unknown result type (might be due to invalid IL or missing references)
			//IL_0041: Unknown result type (might be due to invalid IL or missing references)
			//IL_0046: Unknown result type (might be due to invalid IL or missing references)
			//IL_004e: Unknown result type (might be due to invalid IL or missing references)
			//IL_0055: Unknown result type (might be due to invalid IL or missing references)
			//IL_0056: Unknown result type (might be due to invalid IL or missing references)
			//IL_005c: Unknown result type (might be due to invalid IL or missing references)
			//IL_0063: Unknown result type (might be due to invalid IL or missing references)
			//IL_0064: Unknown result type (might be due to invalid IL or missing references)
			//IL_006b: Unknown result type (might be due to invalid IL or missing references)
			//IL_0075: Expected O, but got Unknown
			//IL_00f6: Unknown result type (might be due to invalid IL or missing references)
			//IL_00fb: Unknown result type (might be due to invalid IL or missing references)
			//IL_0103: Unknown result type (might be due to invalid IL or missing references)
			//IL_010a: Unknown result type (might be due to invalid IL or missing references)
			//IL_0111: Unknown result type (might be due to invalid IL or missing references)
			//IL_0112: Unknown result type (might be due to invalid IL or missing references)
			//IL_0119: Unknown result type (might be due to invalid IL or missing references)
			//IL_0120: Unknown result type (might be due to invalid IL or missing references)
			//IL_0121: Unknown result type (might be due to invalid IL or missing references)
			//IL_0128: Unknown result type (might be due to invalid IL or missing references)
			//IL_0132: Expected O, but got Unknown
			//IL_0077: Unknown result type (might be due to invalid IL or missing references)
			//IL_00c9: Unknown result type (might be due to invalid IL or missing references)
			//IL_00cb: Unknown result type (might be due to invalid IL or missing references)
			//IL_00cd: Unknown result type (might be due to invalid IL or missing references)
			//IL_00d2: Unknown result type (might be due to invalid IL or missing references)
			//IL_00d8: Unknown result type (might be due to invalid IL or missing references)
			//IL_00dd: Unknown result type (might be due to invalid IL or missing references)
			//IL_0134: Unknown result type (might be due to invalid IL or missing references)
			//IL_0186: Unknown result type (might be due to invalid IL or missing references)
			//IL_0188: Unknown result type (might be due to invalid IL or missing references)
			//IL_018a: Unknown result type (might be due to invalid IL or missing references)
			//IL_018f: Unknown result type (might be due to invalid IL or missing references)
			//IL_01a7: Unknown result type (might be due to invalid IL or missing references)
			//IL_019c: Unknown result type (might be due to invalid IL or missing references)
			//IL_019e: Unknown result type (might be due to invalid IL or missing references)
			bool flag = !string.IsNullOrEmpty(label);
			bool flag2 = !string.IsNullOrEmpty(value);
			totalBounds = default(SKRect);
			if (!(flag || flag2))
			{
				return;
			}
			bool num = flag && flag2;
			float num2 = textSize * 0.6f;
			float num3 = (num ? num2 : 0f);
			if (flag)
			{
				SKPaint val = new SKPaint
				{
					TextSize = textSize,
					IsAntialias = true,
					Color = labelColor,
					IsStroke = false,
					TextAlign = horizontalAlignment,
					Typeface = typeface
				};
				try
				{
					SKRect bounds = default(SKRect);
					val.MeasureText(label, ref bounds);
					float num4 = ((SKPoint)(ref point)).Y - (((SKRect)(ref bounds)).Top + ((SKRect)(ref bounds)).Bottom) / 2f - num3;
					canvas.DrawText(label, ((SKPoint)(ref point)).X, num4, val);
					SKRect absolutePositionRect = GetAbsolutePositionRect(((SKPoint)(ref point)).X, num4, bounds, horizontalAlignment);
					totalBounds = ((SKRect)(ref absolutePositionRect)).Standardized;
				}
				finally
				{
					((IDisposable)val)?.Dispose();
				}
			}
			if (!flag2)
			{
				return;
			}
			SKPaint val2 = new SKPaint
			{
				TextSize = textSize,
				IsAntialias = true,
				FakeBoldText = true,
				Color = valueColor,
				IsStroke = false,
				TextAlign = horizontalAlignment,
				Typeface = typeface
			};
			try
			{
				SKRect bounds2 = default(SKRect);
				val2.MeasureText(value, ref bounds2);
				float num5 = ((SKPoint)(ref point)).Y - (((SKRect)(ref bounds2)).Top + ((SKRect)(ref bounds2)).Bottom) / 2f + num3;
				canvas.DrawText(value, ((SKPoint)(ref point)).X, num5, val2);
				SKRect absolutePositionRect2 = GetAbsolutePositionRect(((SKPoint)(ref point)).X, num5, bounds2, horizontalAlignment);
				if (((SKRect)(ref totalBounds)).IsEmpty)
				{
					totalBounds = absolutePositionRect2;
				}
				else
				{
					((SKRect)(ref totalBounds)).Union(absolutePositionRect2);
				}
			}
			finally
			{
				((IDisposable)val2)?.Dispose();
			}
		}

		public static void DrawPoint(this SKCanvas canvas, SKPoint point, SKColor color, float size, PointMode mode)
		{
			//IL_0000: Unknown result type (might be due to invalid IL or missing references)
			//IL_0005: Unknown result type (might be due to invalid IL or missing references)
			//IL_000c: Unknown result type (might be due to invalid IL or missing references)
			//IL_0013: Unknown result type (might be due to invalid IL or missing references)
			//IL_0014: Unknown result type (might be due to invalid IL or missing references)
			//IL_001b: Expected O, but got Unknown
			//IL_0048: Unknown result type (might be due to invalid IL or missing references)
			SKPaint val = new SKPaint
			{
				Style = (SKPaintStyle)0,
				IsAntialias = true,
				Color = color
			};
			try
			{
				switch (mode)
				{
				case PointMode.Square:
					canvas.DrawRect(SKRect.Create(((SKPoint)(ref point)).X - size / 2f, ((SKPoint)(ref point)).Y - size / 2f, size, size), val);
					break;
				case PointMode.Circle:
					val.IsAntialias = true;
					canvas.DrawCircle(((SKPoint)(ref point)).X, ((SKPoint)(ref point)).Y, size / 2f, val);
					break;
				}
			}
			finally
			{
				((IDisposable)val)?.Dispose();
			}
		}

		public static void DrawGradientLine(this SKCanvas canvas, SKPoint startPoint, SKColor startColor, SKPoint endPoint, SKColor endColor, float size)
		{
			//IL_0000: Unknown result type (might be due to invalid IL or missing references)
			//IL_0001: Unknown result type (might be due to invalid IL or missing references)
			//IL_000a: Unknown result type (might be due to invalid IL or missing references)
			//IL_000b: Unknown result type (might be due to invalid IL or missing references)
			//IL_0012: Unknown result type (might be due to invalid IL or missing references)
			//IL_0014: Unknown result type (might be due to invalid IL or missing references)
			//IL_0021: Unknown result type (might be due to invalid IL or missing references)
			//IL_0026: Unknown result type (might be due to invalid IL or missing references)
			//IL_002d: Unknown result type (might be due to invalid IL or missing references)
			//IL_0035: Unknown result type (might be due to invalid IL or missing references)
			//IL_003c: Unknown result type (might be due to invalid IL or missing references)
			//IL_0044: Expected O, but got Unknown
			SKShader val = SKShader.CreateLinearGradient(startPoint, endPoint, (SKColor[])(object)new SKColor[2] { startColor, endColor }, (float[])null, (SKShaderTileMode)0);
			try
			{
				SKPaint val2 = new SKPaint
				{
					Style = (SKPaintStyle)1,
					StrokeWidth = size,
					Shader = val,
					IsAntialias = true
				};
				try
				{
					canvas.DrawLine(((SKPoint)(ref startPoint)).X, ((SKPoint)(ref startPoint)).Y, ((SKPoint)(ref endPoint)).X, ((SKPoint)(ref endPoint)).Y, val2);
				}
				finally
				{
					((IDisposable)val2)?.Dispose();
				}
			}
			finally
			{
				((IDisposable)val)?.Dispose();
			}
		}

		private static SKRect GetAbsolutePositionRect(float x, float y, SKRect bounds, SKTextAlign horizontalAlignment)
		{
			//IL_0002: Unknown result type (might be due to invalid IL or missing references)
			//IL_0028: Unknown result type (might be due to invalid IL or missing references)
			//IL_0029: Unknown result type (might be due to invalid IL or missing references)
			//IL_002a: Unknown result type (might be due to invalid IL or missing references)
			//IL_003c: Expected I4, but got Unknown
			//IL_00a0: Unknown result type (might be due to invalid IL or missing references)
			SKRect val = default(SKRect);
			((SKRect)(ref val)).Left = x + ((SKRect)(ref bounds)).Left;
			((SKRect)(ref val)).Top = y + ((SKRect)(ref bounds)).Top;
			SKRect result = val;
			switch ((int)horizontalAlignment)
			{
			case 0:
				((SKRect)(ref result)).Right = ((SKRect)(ref result)).Left + ((SKRect)(ref bounds)).Width;
				break;
			case 1:
				((SKRect)(ref result)).Right = ((SKRect)(ref result)).Left + ((SKRect)(ref bounds)).Width / 2f;
				break;
			case 2:
				((SKRect)(ref result)).Right = ((SKRect)(ref result)).Left - ((SKRect)(ref bounds)).Width;
				break;
			}
			((SKRect)(ref result)).Bottom = ((SKRect)(ref result)).Top + ((SKRect)(ref bounds)).Height;
			return result;
		}
	}
	public class DelayTimer : Microcharts.Abstracts.ITimer
	{
		public async void Start(TimeSpan interval, Func<bool> step)
		{
			bool flag = step();
			while (flag)
			{
				await Task.Delay(interval);
				flag = step();
			}
		}
	}
	internal static class Ease
	{
		public static float Out(float t)
		{
			return t * t * t;
		}

		public static float In(float t)
		{
			return (t -= 1f) * t * t + 1f;
		}
	}
	internal static class RadialHelpers
	{
		public const float PI = (float)Math.PI;

		private const float UprightAngle = (float)Math.PI / 2f;

		private const float TotalAngle = (float)Math.PI * 2f;

		public static SKPoint GetCirclePoint(float r, float angle)
		{
			//IL_0014: Unknown result type (might be due to invalid IL or missing references)
			return new SKPoint(r * (float)Math.Cos(angle), r * (float)Math.Sin(angle));
		}

		public static SKPath CreateSectorPath(float start, float end, float outerRadius, float innerRadius = 0f, float margin = 0f)
		{
			//IL_0000: Unknown result type (might be due to invalid IL or missing references)
			//IL_0006: Expected O, but got Unknown
			//IL_006d: Unknown result type (might be due to invalid IL or missing references)
			//IL_00c9: Unknown result type (might be due to invalid IL or missing references)
			//IL_00ce: Unknown result type (might be due to invalid IL or missing references)
			//IL_00d5: Unknown result type (might be due to invalid IL or missing references)
			//IL_00da: Unknown result type (might be due to invalid IL or missing references)
			//IL_00e1: Unknown result type (might be due to invalid IL or missing references)
			//IL_00e6: Unknown result type (might be due to invalid IL or missing references)
			//IL_00ed: Unknown result type (might be due to invalid IL or missing references)
			//IL_00f2: Unknown result type (might be due to invalid IL or missing references)
			//IL_00f5: Unknown result type (might be due to invalid IL or missing references)
			//IL_0104: Unknown result type (might be due to invalid IL or missing references)
			//IL_011a: Unknown result type (might be due to invalid IL or missing references)
			//IL_013b: Unknown result type (might be due to invalid IL or missing references)
			//IL_012a: Unknown result type (might be due to invalid IL or missing references)
			SKPath val = new SKPath();
			if (start == end)
			{
				return val;
			}
			if (end - start == 1f)
			{
				val.AddCircle(0f, 0f, outerRadius, (SKPathDirection)0);
				val.AddCircle(0f, 0f, innerRadius, (SKPathDirection)0);
				val.FillType = (SKPathFillType)1;
				return val;
			}
			float num = (float)Math.PI * 2f * start - (float)Math.PI / 2f;
			float num2 = (float)Math.PI * 2f * end - (float)Math.PI / 2f;
			SKPathArcSize val2 = (SKPathArcSize)(num2 - num > (float)Math.PI);
			_ = (num2 - num) / 2f;
			_ = (outerRadius - innerRadius) / 2f;
			float num3 = ((outerRadius == 0f) ? 0f : (margin / ((float)Math.PI * 2f * outerRadius) * ((float)Math.PI * 2f)));
			float num4 = ((innerRadius == 0f) ? 0f : (margin / ((float)Math.PI * 2f * innerRadius) * ((float)Math.PI * 2f)));
			SKPoint circlePoint = GetCirclePoint(outerRadius, num + num3);
			SKPoint circlePoint2 = GetCirclePoint(outerRadius, num2 - num3);
			SKPoint circlePoint3 = GetCirclePoint(innerRadius, num2 - num4);
			SKPoint circlePoint4 = GetCirclePoint(innerRadius, num + num4);
			val.MoveTo(circlePoint);
			val.ArcTo(outerRadius, outerRadius, 0f, val2, (SKPathDirection)0, ((SKPoint)(ref circlePoint2)).X, ((SKPoint)(ref circlePoint2)).Y);
			val.LineTo(circlePoint3);
			if (innerRadius == 0f)
			{
				val.LineTo(circlePoint4);
			}
			else
			{
				val.ArcTo(innerRadius, innerRadius, 0f, val2, (SKPathDirection)1, ((SKPoint)(ref circlePoint4)).X, ((SKPoint)(ref circlePoint4)).Y);
			}
			val.Close();
			return val;
		}
	}
	public static class Timer
	{
		public static Func<Microcharts.Abstracts.ITimer> Create { get; set; } = () => new DelayTimer();
	}
	public class InvalidatedWeakEventHandler<TTarget> : IDisposable where TTarget : class
	{
		private readonly WeakReference<Chart> sourceReference;

		private readonly WeakReference<TTarget> targetReference;

		private readonly Action<TTarget> targetMethod;

		private bool isSubscribed;

		public bool IsAlive
		{
			get
			{
				TTarget target2;
				if (sourceReference.TryGetTarget(out var _))
				{
					return targetReference.TryGetTarget(out target2);
				}
				return false;
			}
		}

		public InvalidatedWeakEventHandler(Chart source, TTarget target, Action<TTarget> targetMethod)
		{
			sourceReference = new WeakReference<Chart>(source);
			targetReference = new WeakReference<TTarget>(target);
			this.targetMethod = targetMethod;
		}

		public void Subsribe()
		{
			if (!isSubscribed && sourceReference.TryGetTarget(out var target))
			{
				target.Invalidated += OnEvent;
				isSubscribed = true;
			}
		}

		public void Unsubscribe()
		{
			if (isSubscribed)
			{
				if (sourceReference.TryGetTarget(out var target))
				{
					target.Invalidated -= OnEvent;
				}
				isSubscribed = false;
			}
		}

		public void Dispose()
		{
			Unsubscribe();
		}

		private void OnEvent(object sender, EventArgs args)
		{
			if (targetReference.TryGetTarget(out var target))
			{
				targetMethod(target);
			}
			else
			{
				Unsubscribe();
			}
		}
	}
}
namespace Microcharts.Abstracts
{
	public interface ITimer
	{
		void Start(TimeSpan interval, Func<bool> step);
	}
}
