using System;
using System.Buffers;
using System.CodeDom.Compiler;
using System.Collections;
using System.Collections.Generic;
using System.Diagnostics;
using System.IO;
using System.IO.Pipelines;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Net.WebSockets;
using System.Reflection;
using System.Resources;
using System.Runtime.CompilerServices;
using System.Runtime.InteropServices;
using System.Runtime.Versioning;
using System.Security.Cryptography.X509Certificates;
using System.Text;
using System.Text.Encodings.Web;
using System.Threading;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Connections;
using Microsoft.AspNetCore.Connections.Features;
using Microsoft.AspNetCore.Http.Connections.Client.Internal;
using Microsoft.AspNetCore.Http.Features;
using Microsoft.CodeAnalysis;
using Microsoft.Extensions.Logging;
using Microsoft.Extensions.Logging.Abstractions;
using Microsoft.Extensions.Options;

[assembly: CompilationRelaxations(8)]
[assembly: RuntimeCompatibility(WrapNonExceptionThrows = true)]
[assembly: Debuggable(DebuggableAttribute.DebuggingModes.IgnoreSymbolStoreSequencePoints)]
[assembly: TargetFramework(".NETStandard,Version=v2.1", FrameworkDisplayName = ".NET Standard 2.1")]
[assembly: InternalsVisibleTo("Microsoft.AspNetCore.SignalR.Microbenchmarks, PublicKey=0024000004800000940000000602000000240000525341310004000001000100f33a29044fa9d740c9b3213a93e57c84b472c84e0b8a0e1ae48e67a9f8f6de9d5f7f3d52ac23e48ac51801f1dc950abe901da34d2a9e3baadb141a17c77ef3c565dd5ee5054b91cf63bb3c6ab83f72ab3aafe93d0fc3c2348b764fafb0b1c0733de51459aeab46580384bf9d74c4e28164b7cde247f891ba07891c9d872ad2bb")]
[assembly: InternalsVisibleTo("Microsoft.AspNetCore.SignalR.Tests, PublicKey=0024000004800000940000000602000000240000525341310004000001000100f33a29044fa9d740c9b3213a93e57c84b472c84e0b8a0e1ae48e67a9f8f6de9d5f7f3d52ac23e48ac51801f1dc950abe901da34d2a9e3baadb141a17c77ef3c565dd5ee5054b91cf63bb3c6ab83f72ab3aafe93d0fc3c2348b764fafb0b1c0733de51459aeab46580384bf9d74c4e28164b7cde247f891ba07891c9d872ad2bb")]
[assembly: InternalsVisibleTo("Microsoft.AspNetCore.SignalR.Client.Tests, PublicKey=0024000004800000940000000602000000240000525341310004000001000100f33a29044fa9d740c9b3213a93e57c84b472c84e0b8a0e1ae48e67a9f8f6de9d5f7f3d52ac23e48ac51801f1dc950abe901da34d2a9e3baadb141a17c77ef3c565dd5ee5054b91cf63bb3c6ab83f72ab3aafe93d0fc3c2348b764fafb0b1c0733de51459aeab46580384bf9d74c4e28164b7cde247f891ba07891c9d872ad2bb")]
[assembly: InternalsVisibleTo("DynamicProxyGenAssembly2, PublicKey=0024000004800000940000000602000000240000525341310004000001000100c547cac37abd99c8db225ef2f6c8a3602f3b3606cc9891605d02baa56104f4cfc0734aa39b93bf7852f7d9266654753cc297e7d2edfe0bac1cdcf9f717241550e0a7b191195b7667bb4f64bcb8e2121380fd1d9d46ad2d92d2d15605093924cceaf74c4861eff62abf69b9291ed0a340e113be11e6a7d3113e92484cf7045cc7")]
[assembly: AssemblyMetadata("CommitHash", "bb01bbf4433e27289b99001b7de6a582879d1835")]
[assembly: AssemblyMetadata("SourceCommitUrl", "https://github.com/dotnet/aspnetcore/tree/bb01bbf4433e27289b99001b7de6a582879d1835")]
[assembly: AssemblyMetadata("Serviceable", "True")]
[assembly: AssemblyCompany("Microsoft Corporation")]
[assembly: AssemblyConfiguration("Release")]
[assembly: AssemblyCopyright("© Microsoft Corporation. All rights reserved.")]
[assembly: AssemblyDescription("Client for ASP.NET Core Connection Handlers")]
[assembly: AssemblyFileVersion("7.0.22.51819")]
[assembly: AssemblyInformationalVersion("7.0.0+bb01bbf4433e27289b99001b7de6a582879d1835")]
[assembly: AssemblyProduct("Microsoft ASP.NET Core")]
[assembly: AssemblyTitle("Microsoft.AspNetCore.Http.Connections.Client")]
[assembly: AssemblyMetadata("RepositoryUrl", "https://github.com/dotnet/aspnetcore")]
[assembly: NeutralResourcesLanguage("en-US")]
[assembly: AssemblyVersion("7.0.0.0")]
[module: RefSafetyRules(11)]
[module: NullablePublicOnly(true)]
namespace Microsoft.CodeAnalysis
{
	[CompilerGenerated]
	[Microsoft.CodeAnalysis.Embedded]
	internal sealed class EmbeddedAttribute : Attribute
	{
	}
}
namespace System.Runtime.CompilerServices
{
	[CompilerGenerated]
	[Microsoft.CodeAnalysis.Embedded]
	[AttributeUsage(AttributeTargets.Class | AttributeTargets.Property | AttributeTargets.Field | AttributeTargets.Event | AttributeTargets.Parameter | AttributeTargets.ReturnValue | AttributeTargets.GenericParameter, AllowMultiple = false, Inherited = false)]
	internal sealed class NullableAttribute : Attribute
	{
		public readonly byte[] NullableFlags;

		public NullableAttribute(byte P_0)
		{
			NullableFlags = new byte[1] { P_0 };
		}

		public NullableAttribute(byte[] P_0)
		{
			NullableFlags = P_0;
		}
	}
	[CompilerGenerated]
	[Microsoft.CodeAnalysis.Embedded]
	[AttributeUsage(AttributeTargets.Class | AttributeTargets.Struct | AttributeTargets.Method | AttributeTargets.Interface | AttributeTargets.Delegate, AllowMultiple = false, Inherited = false)]
	internal sealed class NullableContextAttribute : Attribute
	{
		public readonly byte Flag;

		public NullableContextAttribute(byte P_0)
		{
			Flag = P_0;
		}
	}
	[CompilerGenerated]
	[Microsoft.CodeAnalysis.Embedded]
	[AttributeUsage(AttributeTargets.Module, AllowMultiple = false, Inherited = false)]
	internal sealed class NullablePublicOnlyAttribute : Attribute
	{
		public readonly bool IncludesInternals;

		public NullablePublicOnlyAttribute(bool P_0)
		{
			IncludesInternals = P_0;
		}
	}
	[CompilerGenerated]
	[Microsoft.CodeAnalysis.Embedded]
	[AttributeUsage(AttributeTargets.Module, AllowMultiple = false, Inherited = false)]
	internal sealed class RefSafetyRulesAttribute : Attribute
	{
		public readonly int Version;

		public RefSafetyRulesAttribute(int P_0)
		{
			Version = P_0;
		}
	}
}
namespace System.Diagnostics.CodeAnalysis
{
	[AttributeUsage(AttributeTargets.Method | AttributeTargets.Property, Inherited = false, AllowMultiple = true)]
	internal sealed class MemberNotNullAttribute : Attribute
	{
		public string[] Members { get; }

		public MemberNotNullAttribute(string member)
		{
			Members = new string[1] { member };
		}

		public MemberNotNullAttribute(params string[] members)
		{
			Members = members;
		}
	}
	[AttributeUsage(AttributeTargets.Method | AttributeTargets.Property, Inherited = false, AllowMultiple = true)]
	internal sealed class MemberNotNullWhenAttribute : Attribute
	{
		public bool ReturnValue { get; }

		public string[] Members { get; }

		public MemberNotNullWhenAttribute(bool returnValue, string member)
		{
			ReturnValue = returnValue;
			Members = new string[1] { member };
		}

		public MemberNotNullWhenAttribute(bool returnValue, params string[] members)
		{
			ReturnValue = returnValue;
			Members = members;
		}
	}
}
namespace System.Runtime.CompilerServices
{
	internal static class IsExternalInit
	{
	}
}
namespace System.Runtime.Versioning
{
	internal abstract class OSPlatformAttribute : Attribute
	{
		public string PlatformName { get; }

		private protected OSPlatformAttribute(string platformName)
		{
			PlatformName = platformName;
		}
	}
	[AttributeUsage(AttributeTargets.Assembly, AllowMultiple = false, Inherited = false)]
	internal sealed class TargetPlatformAttribute : OSPlatformAttribute
	{
		public TargetPlatformAttribute(string platformName)
			: base(platformName)
		{
		}
	}
	[AttributeUsage(AttributeTargets.Assembly | AttributeTargets.Module | AttributeTargets.Class | AttributeTargets.Struct | AttributeTargets.Enum | AttributeTargets.Constructor | AttributeTargets.Method | AttributeTargets.Property | AttributeTargets.Field | AttributeTargets.Event, AllowMultiple = true, Inherited = false)]
	internal sealed class SupportedOSPlatformAttribute : OSPlatformAttribute
	{
		public SupportedOSPlatformAttribute(string platformName)
			: base(platformName)
		{
		}
	}
	[AttributeUsage(AttributeTargets.Assembly | AttributeTargets.Module | AttributeTargets.Class | AttributeTargets.Struct | AttributeTargets.Enum | AttributeTargets.Constructor | AttributeTargets.Method | AttributeTargets.Property | AttributeTargets.Field | AttributeTargets.Event, AllowMultiple = true, Inherited = false)]
	internal sealed class UnsupportedOSPlatformAttribute : OSPlatformAttribute
	{
		public UnsupportedOSPlatformAttribute(string platformName)
			: base(platformName)
		{
		}
	}
}
namespace System.Net.WebSockets
{
	internal static class WebSocketExtensions
	{
		public static ValueTask SendAsync(this WebSocket webSocket, ReadOnlySequence<byte> buffer, WebSocketMessageType webSocketMessageType, CancellationToken cancellationToken = default(CancellationToken))
		{
			if (buffer.IsSingleSegment)
			{
				MemoryMarshal.TryGetArray(buffer.First, out var segment);
				return new ValueTask(webSocket.SendAsync(segment, webSocketMessageType, endOfMessage: true, cancellationToken));
			}
			return SendMultiSegmentAsync(webSocket, buffer, webSocketMessageType, cancellationToken);
		}

		private static async ValueTask SendMultiSegmentAsync(WebSocket webSocket, ReadOnlySequence<byte> buffer, WebSocketMessageType webSocketMessageType, CancellationToken cancellationToken = default(CancellationToken))
		{
			SequencePosition position = buffer.Start;
			buffer.TryGet(ref position, out var memory);
			ReadOnlyMemory<byte> segment;
			while (buffer.TryGet(ref position, out segment))
			{
				MemoryMarshal.TryGetArray(memory, out var segment2);
				await webSocket.SendAsync(segment2, webSocketMessageType, endOfMessage: false, cancellationToken).ConfigureAwait(continueOnCapturedContext: false);
				memory = segment;
			}
			MemoryMarshal.TryGetArray(memory, out var segment3);
			await webSocket.SendAsync(segment3, webSocketMessageType, endOfMessage: true, cancellationToken).ConfigureAwait(continueOnCapturedContext: false);
		}
	}
}
namespace System.IO
{
	internal static class StreamExtensions
	{
		public static ValueTask WriteAsync(this Stream stream, ReadOnlySequence<byte> buffer, CancellationToken cancellationToken = default(CancellationToken))
		{
			if (buffer.IsSingleSegment)
			{
				return stream.WriteAsync(buffer.First, cancellationToken);
			}
			return WriteMultiSegmentAsync(stream, buffer, cancellationToken);
		}

		private static async ValueTask WriteMultiSegmentAsync(Stream stream, ReadOnlySequence<byte> buffer, CancellationToken cancellationToken)
		{
			SequencePosition position = buffer.Start;
			ReadOnlyMemory<byte> memory;
			while (buffer.TryGet(ref position, out memory))
			{
				await stream.WriteAsync(memory, cancellationToken).ConfigureAwait(continueOnCapturedContext: false);
			}
		}
	}
}
namespace System.IO.Pipelines
{
	internal sealed class PipeWriterStream : Stream
	{
		private long _length;

		private readonly PipeWriter _pipeWriter;

		public override bool CanRead => false;

		public override bool CanSeek => false;

		public override bool CanWrite => true;

		public override long Length => _length;

		public override long Position
		{
			get
			{
				throw new NotSupportedException();
			}
			set
			{
				throw new NotSupportedException();
			}
		}

		public PipeWriterStream(PipeWriter pipeWriter)
		{
			_pipeWriter = pipeWriter;
		}

		public override void Flush()
		{
		}

		public override int Read(byte[] buffer, int offset, int count)
		{
			throw new NotSupportedException();
		}

		public override long Seek(long offset, SeekOrigin origin)
		{
			throw new NotSupportedException();
		}

		public override void SetLength(long value)
		{
			throw new NotSupportedException();
		}

		public override void Write(byte[] buffer, int offset, int count)
		{
			((IBufferWriter<byte>)_pipeWriter).Write(new ReadOnlySpan<byte>(buffer, offset, count));
			_length += count;
		}

		public override Task WriteAsync(byte[] buffer, int offset, int count, CancellationToken cancellationToken)
		{
			return WriteCoreAsync(buffer.AsMemory(offset, count), cancellationToken).AsTask();
		}

		public override ValueTask WriteAsync(ReadOnlyMemory<byte> source, CancellationToken cancellationToken = default(CancellationToken))
		{
			return WriteCoreAsync(source, cancellationToken);
		}

		private ValueTask WriteCoreAsync(ReadOnlyMemory<byte> source, CancellationToken cancellationToken = default(CancellationToken))
		{
			//IL_0043: Unknown result type (might be due to invalid IL or missing references)
			//IL_0048: Unknown result type (might be due to invalid IL or missing references)
			if (cancellationToken.IsCancellationRequested)
			{
				return new ValueTask(Task.FromCanceled(cancellationToken));
			}
			_length += source.Length;
			ValueTask<FlushResult> flushTask = _pipeWriter.WriteAsync(source, cancellationToken);
			if (flushTask.IsCompletedSuccessfully)
			{
				FlushResult result = flushTask.Result;
				if (((FlushResult)(ref result)).IsCanceled)
				{
					throw new OperationCanceledException();
				}
				return default(ValueTask);
			}
			return WriteSlowAsync(flushTask);
			static async ValueTask WriteSlowAsync(ValueTask<FlushResult> valueTask)
			{
				FlushResult val = await valueTask.ConfigureAwait(continueOnCapturedContext: false);
				if (((FlushResult)(ref val)).IsCanceled)
				{
					throw new OperationCanceledException();
				}
			}
		}

		public void Reset()
		{
			_length = 0L;
		}
	}
	internal sealed class DuplexPipe : IDuplexPipe
	{
		public readonly struct DuplexPipePair
		{
			public IDuplexPipe Transport { get; }

			public IDuplexPipe Application { get; }

			public DuplexPipePair(IDuplexPipe transport, IDuplexPipe application)
			{
				Transport = transport;
				Application = application;
			}
		}

		public PipeReader Input { get; }

		public PipeWriter Output { get; }

		public DuplexPipe(PipeReader reader, PipeWriter writer)
		{
			Input = reader;
			Output = writer;
		}

		public static DuplexPipePair CreateConnectionPair(PipeOptions inputOptions, PipeOptions outputOptions)
		{
			//IL_0001: Unknown result type (might be due to invalid IL or missing references)
			//IL_0007: Expected O, but got Unknown
			//IL_0008: Unknown result type (might be due to invalid IL or missing references)
			//IL_000e: Expected O, but got Unknown
			Pipe val = new Pipe(inputOptions);
			Pipe val2 = new Pipe(outputOptions);
			DuplexPipe application = new DuplexPipe(val2.Reader, val.Writer);
			return new DuplexPipePair((IDuplexPipe)(object)new DuplexPipe(val.Reader, val2.Writer), (IDuplexPipe)(object)application);
		}
	}
}
namespace System.Threading.Tasks
{
	internal static class TaskExtensions
	{
		public static async Task NoThrow(this Task task)
		{
			await new NoThrowAwaiter(task);
		}
	}
	internal readonly struct NoThrowAwaiter : ICriticalNotifyCompletion, INotifyCompletion
	{
		private readonly Task _task;

		public bool IsCompleted => _task.IsCompleted;

		public NoThrowAwaiter(Task task)
		{
			_task = task;
		}

		public NoThrowAwaiter GetAwaiter()
		{
			return this;
		}

		public void GetResult()
		{
			_ = _task.Exception;
		}

		public void OnCompleted(Action continuation)
		{
			_task.GetAwaiter().OnCompleted(continuation);
		}

		public void UnsafeOnCompleted(Action continuation)
		{
			OnCompleted(continuation);
		}
	}
}
namespace Microsoft.AspNetCore
{
	internal sealed class OperatingSystem
	{
		private static readonly bool _isBrowser = RuntimeInformation.IsOSPlatform(OSPlatform.Create("browser"));

		public static bool IsBrowser()
		{
			return _isBrowser;
		}
	}
}
namespace Microsoft.AspNetCore.Http.Connections.Client
{
	public class HttpConnection : ConnectionContext, IConnectionInherentKeepAliveFeature
	{
		internal static class Log
		{
			[GeneratedCode("Microsoft.Extensions.Logging.Generators", "7.0.7.1805")]
			private static readonly Action<ILogger, Exception> __StartingCallback = LoggerMessage.Define((LogLevel)1, new EventId(1, "Starting"), "Starting HttpConnection.", new LogDefineOptions
			{
				SkipEnabledCheck = true
			});

			[GeneratedCode("Microsoft.Extensions.Logging.Generators", "7.0.7.1805")]
			private static readonly Action<ILogger, Exception> __SkippingStartCallback = LoggerMessage.Define((LogLevel)1, new EventId(2, "SkippingStart"), "Skipping start, connection is already started.", new LogDefineOptions
			{
				SkipEnabledCheck = true
			});

			[GeneratedCode("Microsoft.Extensions.Logging.Generators", "7.0.7.1805")]
			private static readonly Action<ILogger, Exception> __StartedCallback = LoggerMessage.Define((LogLevel)2, new EventId(3, "Started"), "HttpConnection Started.", new LogDefineOptions
			{
				SkipEnabledCheck = true
			});

			[GeneratedCode("Microsoft.Extensions.Logging.Generators", "7.0.7.1805")]
			private static readonly Action<ILogger, Exception> __DisposingHttpConnectionCallback = LoggerMessage.Define((LogLevel)1, new EventId(4, "DisposingHttpConnection"), "Disposing HttpConnection.", new LogDefineOptions
			{
				SkipEnabledCheck = true
			});

			[GeneratedCode("Microsoft.Extensions.Logging.Generators", "7.0.7.1805")]
			private static readonly Action<ILogger, Exception> __SkippingDisposeCallback = LoggerMessage.Define((LogLevel)1, new EventId(5, "SkippingDispose"), "Skipping dispose, connection is already disposed.", new LogDefineOptions
			{
				SkipEnabledCheck = true
			});

			[GeneratedCode("Microsoft.Extensions.Logging.Generators", "7.0.7.1805")]
			private static readonly Action<ILogger, Exception> __DisposedCallback = LoggerMessage.Define((LogLevel)2, new EventId(6, "Disposed"), "HttpConnection Disposed.", new LogDefineOptions
			{
				SkipEnabledCheck = true
			});

			[GeneratedCode("Microsoft.Extensions.Logging.Generators", "7.0.7.1805")]
			private static readonly Action<ILogger, string, Uri, Exception> __StartingTransportCallback = LoggerMessage.Define<string, Uri>((LogLevel)1, new EventId(7, "StartingTransport"), "Starting transport '{Transport}' with Url: {Url}.", new LogDefineOptions
			{
				SkipEnabledCheck = true
			});

			[GeneratedCode("Microsoft.Extensions.Logging.Generators", "7.0.7.1805")]
			private static readonly Action<ILogger, Uri, Exception> __EstablishingConnectionCallback = LoggerMessage.Define<Uri>((LogLevel)1, new EventId(8, "EstablishingConnection"), "Establishing connection with server at '{Url}'.", new LogDefineOptions
			{
				SkipEnabledCheck = true
			});

			[GeneratedCode("Microsoft.Extensions.Logging.Generators", "7.0.7.1805")]
			private static readonly Action<ILogger, string, Exception> __ConnectionEstablishedCallback = LoggerMessage.Define<string>((LogLevel)1, new EventId(9, "Established"), "Established connection '{ConnectionId}' with the server.", new LogDefineOptions
			{
				SkipEnabledCheck = true
			});

			[GeneratedCode("Microsoft.Extensions.Logging.Generators", "7.0.7.1805")]
			private static readonly Action<ILogger, Uri, Exception> __ErrorWithNegotiationCallback = LoggerMessage.Define<Uri>((LogLevel)4, new EventId(10, "ErrorWithNegotiation"), "Failed to start connection. Error getting negotiation response from '{Url}'.", new LogDefineOptions
			{
				SkipEnabledCheck = true
			});

			[GeneratedCode("Microsoft.Extensions.Logging.Generators", "7.0.7.1805")]
			private static readonly Action<ILogger, HttpTransportType, Exception> __ErrorStartingTransportCallback = LoggerMessage.Define<HttpTransportType>((LogLevel)4, new EventId(11, "ErrorStartingTransport"), "Failed to start connection. Error starting transport '{Transport}'.", new LogDefineOptions
			{
				SkipEnabledCheck = true
			});

			[GeneratedCode("Microsoft.Extensions.Logging.Generators", "7.0.7.1805")]
			private static readonly Action<ILogger, string, Exception> __TransportNotSupportedCallback = LoggerMessage.Define<string>((LogLevel)1, new EventId(12, "TransportNotSupported"), "Skipping transport {TransportName} because it is not supported by this client.", new LogDefineOptions
			{
				SkipEnabledCheck = true
			});

			[GeneratedCode("Microsoft.Extensions.Logging.Generators", "7.0.7.1805")]
			private static readonly Action<ILogger, string, string, Exception> __TransportDoesNotSupportTransferFormatCallback = LoggerMessage.Define<string, string>((LogLevel)1, new EventId(13, "TransportDoesNotSupportTransferFormat"), "Skipping transport {TransportName} because it does not support the requested transfer format '{TransferFormat}'.", new LogDefineOptions
			{
				SkipEnabledCheck = true
			});

			[GeneratedCode("Microsoft.Extensions.Logging.Generators", "7.0.7.1805")]
			private static readonly Action<ILogger, string, Exception> __TransportDisabledByClientCallback = LoggerMessage.Define<string>((LogLevel)1, new EventId(14, "TransportDisabledByClient"), "Skipping transport {TransportName} because it was disabled by the client.", new LogDefineOptions
			{
				SkipEnabledCheck = true
			});

			[GeneratedCode("Microsoft.Extensions.Logging.Generators", "7.0.7.1805")]
			private static readonly Action<ILogger, string, Exception> __TransportFailedCallback = LoggerMessage.Define<string>((LogLevel)1, new EventId(15, "TransportFailed"), "Skipping transport {TransportName} because it failed to initialize.", new LogDefineOptions
			{
				SkipEnabledCheck = true
			});

			[GeneratedCode("Microsoft.Extensions.Logging.Generators", "7.0.7.1805")]
			private static readonly Action<ILogger, Exception> __WebSocketsNotSupportedByOperatingSystemCallback = LoggerMessage.Define((LogLevel)1, new EventId(16, "WebSocketsNotSupportedByOperatingSystem"), "Skipping WebSockets because they are not supported by the operating system.", new LogDefineOptions
			{
				SkipEnabledCheck = true
			});

			[GeneratedCode("Microsoft.Extensions.Logging.Generators", "7.0.7.1805")]
			private static readonly Action<ILogger, Exception> __TransportThrewExceptionOnStopCallback = LoggerMessage.Define((LogLevel)4, new EventId(17, "TransportThrewExceptionOnStop"), "The transport threw an exception while stopping.", new LogDefineOptions
			{
				SkipEnabledCheck = true
			});

			[GeneratedCode("Microsoft.Extensions.Logging.Generators", "7.0.7.1805")]
			private static readonly Action<ILogger, HttpTransportType, Exception> __TransportStartedCallback = LoggerMessage.Define<HttpTransportType>((LogLevel)1, new EventId(18, "TransportStarted"), "Transport '{Transport}' started.", new LogDefineOptions
			{
				SkipEnabledCheck = true
			});

			[GeneratedCode("Microsoft.Extensions.Logging.Generators", "7.0.7.1805")]
			private static readonly Action<ILogger, Exception> __ServerSentEventsNotSupportedByBrowserCallback = LoggerMessage.Define((LogLevel)1, new EventId(19, "ServerSentEventsNotSupportedByBrowser"), "Skipping ServerSentEvents because they are not supported by the browser.", new LogDefineOptions
			{
				SkipEnabledCheck = true
			});

			[GeneratedCode("Microsoft.Extensions.Logging.Generators", "7.0.7.1805")]
			private static readonly Action<ILogger, Exception> __CookiesNotSupportedCallback = LoggerMessage.Define((LogLevel)0, new EventId(20, "CookiesNotSupported"), "Cookies are not supported on this platform.", new LogDefineOptions
			{
				SkipEnabledCheck = true
			});

			[GeneratedCode("Microsoft.Extensions.Logging.Generators", "7.0.7.1805")]
			private static readonly Action<ILogger, HttpStatusCode, Exception> __RetryAccessTokenCallback = LoggerMessage.Define<HttpStatusCode>((LogLevel)1, new EventId(21, "RetryAccessToken"), "{StatusCode} received, getting a new access token and retrying request.", new LogDefineOptions
			{
				SkipEnabledCheck = true
			});

			[LoggerMessage(/*Could not decode attribute arguments.*/)]
			[GeneratedCode("Microsoft.Extensions.Logging.Generators", "7.0.7.1805")]
			public static void Starting(ILogger logger)
			{
				if (logger.IsEnabled((LogLevel)1))
				{
					__StartingCallback(logger, null);
				}
			}

			[LoggerMessage(/*Could not decode attribute arguments.*/)]
			[GeneratedCode("Microsoft.Extensions.Logging.Generators", "7.0.7.1805")]
			public static void SkippingStart(ILogger logger)
			{
				if (logger.IsEnabled((LogLevel)1))
				{
					__SkippingStartCallback(logger, null);
				}
			}

			[LoggerMessage(/*Could not decode attribute arguments.*/)]
			[GeneratedCode("Microsoft.Extensions.Logging.Generators", "7.0.7.1805")]
			public static void Started(ILogger logger)
			{
				if (logger.IsEnabled((LogLevel)2))
				{
					__StartedCallback(logger, null);
				}
			}

			[LoggerMessage(/*Could not decode attribute arguments.*/)]
			[GeneratedCode("Microsoft.Extensions.Logging.Generators", "7.0.7.1805")]
			public static void DisposingHttpConnection(ILogger logger)
			{
				if (logger.IsEnabled((LogLevel)1))
				{
					__DisposingHttpConnectionCallback(logger, null);
				}
			}

			[LoggerMessage(/*Could not decode attribute arguments.*/)]
			[GeneratedCode("Microsoft.Extensions.Logging.Generators", "7.0.7.1805")]
			public static void SkippingDispose(ILogger logger)
			{
				if (logger.IsEnabled((LogLevel)1))
				{
					__SkippingDisposeCallback(logger, null);
				}
			}

			[LoggerMessage(/*Could not decode attribute arguments.*/)]
			[GeneratedCode("Microsoft.Extensions.Logging.Generators", "7.0.7.1805")]
			public static void Disposed(ILogger logger)
			{
				if (logger.IsEnabled((LogLevel)2))
				{
					__DisposedCallback(logger, null);
				}
			}

			public unsafe static void StartingTransport(ILogger logger, HttpTransportType transportType, Uri url)
			{
				if (logger.IsEnabled((LogLevel)1))
				{
					StartingTransport(logger, ((object)(*(HttpTransportType*)(&transportType))/*cast due to .constrained prefix*/).ToString(), url);
				}
			}

			[LoggerMessage(/*Could not decode attribute arguments.*/)]
			[GeneratedCode("Microsoft.Extensions.Logging.Generators", "7.0.7.1805")]
			private static void StartingTransport(ILogger logger, string transport, Uri url)
			{
				__StartingTransportCallback(logger, transport, url, null);
			}

			[LoggerMessage(/*Could not decode attribute arguments.*/)]
			[GeneratedCode("Microsoft.Extensions.Logging.Generators", "7.0.7.1805")]
			public static void EstablishingConnection(ILogger logger, Uri url)
			{
				if (logger.IsEnabled((LogLevel)1))
				{
					__EstablishingConnectionCallback(logger, url, null);
				}
			}

			[LoggerMessage(/*Could not decode attribute arguments.*/)]
			[GeneratedCode("Microsoft.Extensions.Logging.Generators", "7.0.7.1805")]
			public static void ConnectionEstablished(ILogger logger, string connectionId)
			{
				if (logger.IsEnabled((LogLevel)1))
				{
					__ConnectionEstablishedCallback(logger, connectionId, null);
				}
			}

			[LoggerMessage(/*Could not decode attribute arguments.*/)]
			[GeneratedCode("Microsoft.Extensions.Logging.Generators", "7.0.7.1805")]
			public static void ErrorWithNegotiation(ILogger logger, Uri url, Exception exception)
			{
				if (logger.IsEnabled((LogLevel)4))
				{
					__ErrorWithNegotiationCallback(logger, url, exception);
				}
			}

			[LoggerMessage(/*Could not decode attribute arguments.*/)]
			[GeneratedCode("Microsoft.Extensions.Logging.Generators", "7.0.7.1805")]
			public static void ErrorStartingTransport(ILogger logger, HttpTransportType transport, Exception exception)
			{
				//IL_000f: Unknown result type (might be due to invalid IL or missing references)
				if (logger.IsEnabled((LogLevel)4))
				{
					__ErrorStartingTransportCallback(logger, transport, exception);
				}
			}

			[LoggerMessage(/*Could not decode attribute arguments.*/)]
			[GeneratedCode("Microsoft.Extensions.Logging.Generators", "7.0.7.1805")]
			public static void TransportNotSupported(ILogger logger, string transportName)
			{
				if (logger.IsEnabled((LogLevel)1))
				{
					__TransportNotSupportedCallback(logger, transportName, null);
				}
			}

			public unsafe static void TransportDoesNotSupportTransferFormat(ILogger logger, HttpTransportType transport, TransferFormat transferFormat)
			{
				if (logger.IsEnabled((LogLevel)1))
				{
					TransportDoesNotSupportTransferFormat(logger, ((object)(*(HttpTransportType*)(&transport))/*cast due to .constrained prefix*/).ToString(), ((object)(*(TransferFormat*)(&transferFormat))/*cast due to .constrained prefix*/).ToString());
				}
			}

			[LoggerMessage(/*Could not decode attribute arguments.*/)]
			[GeneratedCode("Microsoft.Extensions.Logging.Generators", "7.0.7.1805")]
			private static void TransportDoesNotSupportTransferFormat(ILogger logger, string transportName, string transferFormat)
			{
				__TransportDoesNotSupportTransferFormatCallback(logger, transportName, transferFormat, null);
			}

			public unsafe static void TransportDisabledByClient(ILogger logger, HttpTransportType transport)
			{
				if (logger.IsEnabled((LogLevel)1))
				{
					TransportDisabledByClient(logger, ((object)(*(HttpTransportType*)(&transport))/*cast due to .constrained prefix*/).ToString());
				}
			}

			[LoggerMessage(/*Could not decode attribute arguments.*/)]
			[GeneratedCode("Microsoft.Extensions.Logging.Generators", "7.0.7.1805")]
			public static void TransportDisabledByClient(ILogger logger, string transportName)
			{
				__TransportDisabledByClientCallback(logger, transportName, null);
			}

			public unsafe static void TransportFailed(ILogger logger, HttpTransportType transport, Exception ex)
			{
				if (logger.IsEnabled((LogLevel)1))
				{
					TransportFailed(logger, ((object)(*(HttpTransportType*)(&transport))/*cast due to .constrained prefix*/).ToString(), ex);
				}
			}

			[LoggerMessage(/*Could not decode attribute arguments.*/)]
			[GeneratedCode("Microsoft.Extensions.Logging.Generators", "7.0.7.1805")]
			public static void TransportFailed(ILogger logger, string transportName, Exception ex)
			{
				__TransportFailedCallback(logger, transportName, ex);
			}

			[LoggerMessage(/*Could not decode attribute arguments.*/)]
			[GeneratedCode("Microsoft.Extensions.Logging.Generators", "7.0.7.1805")]
			public static void WebSocketsNotSupportedByOperatingSystem(ILogger logger)
			{
				if (logger.IsEnabled((LogLevel)1))
				{
					__WebSocketsNotSupportedByOperatingSystemCallback(logger, null);
				}
			}

			[LoggerMessage(/*Could not decode attribute arguments.*/)]
			[GeneratedCode("Microsoft.Extensions.Logging.Generators", "7.0.7.1805")]
			public static void TransportThrewExceptionOnStop(ILogger logger, Exception ex)
			{
				if (logger.IsEnabled((LogLevel)4))
				{
					__TransportThrewExceptionOnStopCallback(logger, ex);
				}
			}

			[LoggerMessage(/*Could not decode attribute arguments.*/)]
			[GeneratedCode("Microsoft.Extensions.Logging.Generators", "7.0.7.1805")]
			public static void TransportStarted(ILogger logger, HttpTransportType transport)
			{
				//IL_000f: Unknown result type (might be due to invalid IL or missing references)
				if (logger.IsEnabled((LogLevel)1))
				{
					__TransportStartedCallback(logger, transport, null);
				}
			}

			[LoggerMessage(/*Could not decode attribute arguments.*/)]
			[GeneratedCode("Microsoft.Extensions.Logging.Generators", "7.0.7.1805")]
			public static void ServerSentEventsNotSupportedByBrowser(ILogger logger)
			{
				if (logger.IsEnabled((LogLevel)1))
				{
					__ServerSentEventsNotSupportedByBrowserCallback(logger, null);
				}
			}

			[LoggerMessage(/*Could not decode attribute arguments.*/)]
			[GeneratedCode("Microsoft.Extensions.Logging.Generators", "7.0.7.1805")]
			public static void CookiesNotSupported(ILogger logger)
			{
				if (logger.IsEnabled((LogLevel)0))
				{
					__CookiesNotSupportedCallback(logger, null);
				}
			}

			[LoggerMessage(/*Could not decode attribute arguments.*/)]
			[GeneratedCode("Microsoft.Extensions.Logging.Generators", "7.0.7.1805")]
			public static void RetryAccessToken(ILogger logger, HttpStatusCode statusCode)
			{
				if (logger.IsEnabled((LogLevel)1))
				{
					__RetryAccessTokenCallback(logger, statusCode, null);
				}
			}
		}

		private const int _maxRedirects = 100;

		private const int _protocolVersionNumber = 1;

		private static readonly Task<string> _noAccessToken = Task.FromResult<string>(null);

		private static readonly TimeSpan HttpClientTimeout = TimeSpan.FromSeconds(120.0);

		internal readonly ILogger _logger;

		private readonly SemaphoreSlim _connectionLock = new SemaphoreSlim(1, 1);

		private bool _started;

		private bool _disposed;

		private bool _hasInherentKeepAlive;

		private readonly HttpClient _httpClient;

		private readonly HttpConnectionOptions _httpConnectionOptions;

		private ITransport _transport;

		private readonly ITransportFactory _transportFactory;

		private string _connectionId;

		private readonly ConnectionLogScope _logScope;

		private readonly ILoggerFactory _loggerFactory;

		private readonly Uri _url;

		private Func<Task<string>> _accessTokenProvider;

		public override IDuplexPipe Transport
		{
			get
			{
				CheckDisposed();
				if (_transport == null)
				{
					throw new InvalidOperationException("Cannot access the Transport pipe before the connection has started.");
				}
				return (IDuplexPipe)_transport;
			}
			set
			{
				throw new NotSupportedException("The transport pipe isn't settable.");
			}
		}

		public override IFeatureCollection Features { get; } = (IFeatureCollection)new FeatureCollection();

		public override string? ConnectionId
		{
			get
			{
				return _connectionId;
			}
			set
			{
				throw new InvalidOperationException("The ConnectionId is set internally and should not be set by user code.");
			}
		}

		public override IDictionary<object, object?> Items { get; set; } = (IDictionary<object, object>)new ConnectionItems();

		bool IConnectionInherentKeepAliveFeature.HasInherentKeepAlive => _hasInherentKeepAlive;

		public HttpConnection(Uri url)
			: this(url, HttpTransports.All)
		{
		}//IL_0002: Unknown result type (might be due to invalid IL or missing references)


		public HttpConnection(Uri url, HttpTransportType transports)
			: this(url, transports, null)
		{
		}//IL_0002: Unknown result type (might be due to invalid IL or missing references)


		public HttpConnection(Uri url, HttpTransportType transports, ILoggerFactory? loggerFactory)
			: this(CreateHttpOptions(url, transports), loggerFactory)
		{
		}//IL_0002: Unknown result type (might be due to invalid IL or missing references)


		private static HttpConnectionOptions CreateHttpOptions(Uri url, HttpTransportType transports)
		{
			//IL_0021: Unknown result type (might be due to invalid IL or missing references)
			if (url == null)
			{
				throw new ArgumentNullException("url");
			}
			return new HttpConnectionOptions
			{
				Url = url,
				Transports = transports
			};
		}

		public HttpConnection(HttpConnectionOptions httpConnectionOptions, ILoggerFactory? loggerFactory)
		{
			//IL_000e: Unknown result type (might be due to invalid IL or missing references)
			//IL_0018: Expected O, but got Unknown
			//IL_0019: Unknown result type (might be due to invalid IL or missing references)
			//IL_0023: Expected O, but got Unknown
			//IL_0097: Unknown result type (might be due to invalid IL or missing references)
			//IL_009d: Invalid comparison between Unknown and I4
			//IL_00ac: Unknown result type (might be due to invalid IL or missing references)
			//IL_00b2: Invalid comparison between Unknown and I4
			//IL_00cd: Unknown result type (might be due to invalid IL or missing references)
			if (httpConnectionOptions == null)
			{
				throw new ArgumentNullException("httpConnectionOptions");
			}
			if (httpConnectionOptions.Url == null)
			{
				throw new ArgumentException("Options does not have a URL specified.", "httpConnectionOptions");
			}
			_loggerFactory = (ILoggerFactory)(((object)loggerFactory) ?? ((object)NullLoggerFactory.Instance));
			_logger = (ILogger)(object)LoggerFactoryExtensions.CreateLogger<HttpConnection>(_loggerFactory);
			_httpConnectionOptions = httpConnectionOptions;
			_url = _httpConnectionOptions.Url;
			if (!httpConnectionOptions.SkipNegotiation || (int)httpConnectionOptions.Transports != 1)
			{
				_httpClient = CreateHttpClient();
			}
			if ((int)httpConnectionOptions.Transports == 2 && OperatingSystem.IsBrowser())
			{
				throw new ArgumentException("ServerSentEvents can not be the only transport specified when running in the browser.", "httpConnectionOptions");
			}
			_transportFactory = new DefaultTransportFactory(httpConnectionOptions.Transports, _loggerFactory, _httpClient, httpConnectionOptions, GetAccessTokenAsync);
			_logScope = new ConnectionLogScope();
			((BaseConnectionContext)this).Features.Set<IConnectionInherentKeepAliveFeature>((IConnectionInherentKeepAliveFeature)(object)this);
		}

		internal HttpConnection(HttpConnectionOptions httpConnectionOptions, ILoggerFactory loggerFactory, ITransportFactory transportFactory)
			: this(httpConnectionOptions, loggerFactory)
		{
			_transportFactory = transportFactory;
		}

		public Task StartAsync(CancellationToken cancellationToken = default(CancellationToken))
		{
			//IL_0007: Unknown result type (might be due to invalid IL or missing references)
			return StartAsync(_httpConnectionOptions.DefaultTransferFormat, cancellationToken);
		}

		public async Task StartAsync(TransferFormat transferFormat, CancellationToken cancellationToken = default(CancellationToken))
		{
			//IL_0016: Unknown result type (might be due to invalid IL or missing references)
			//IL_0017: Unknown result type (might be due to invalid IL or missing references)
			using (_logger.BeginScope<ConnectionLogScope>(_logScope))
			{
				await StartAsyncCore(transferFormat, cancellationToken).ConfigureAwait(continueOnCapturedContext: false);
			}
		}

		private async Task StartAsyncCore(TransferFormat transferFormat, CancellationToken cancellationToken)
		{
			//IL_0016: Unknown result type (might be due to invalid IL or missing references)
			//IL_0017: Unknown result type (might be due to invalid IL or missing references)
			CheckDisposed();
			if (_started)
			{
				Log.SkippingStart(_logger);
				return;
			}
			await _connectionLock.WaitAsync(cancellationToken).ConfigureAwait(continueOnCapturedContext: false);
			try
			{
				CheckDisposed();
				if (_started)
				{
					Log.SkippingStart(_logger);
					return;
				}
				Log.Starting(_logger);
				await SelectAndStartTransport(transferFormat, cancellationToken).ConfigureAwait(continueOnCapturedContext: false);
				_started = true;
				Log.Started(_logger);
			}
			finally
			{
				_connectionLock.Release();
			}
		}

		public override async ValueTask DisposeAsync()
		{
			using (_logger.BeginScope<ConnectionLogScope>(_logScope))
			{
				await DisposeAsyncCore().ConfigureAwait(continueOnCapturedContext: false);
			}
		}

		private async Task DisposeAsyncCore()
		{
			if (_disposed)
			{
				return;
			}
			await _connectionLock.WaitAsync().ConfigureAwait(continueOnCapturedContext: false);
			try
			{
				if (!_disposed && _started)
				{
					Log.DisposingHttpConnection(_logger);
					try
					{
						await _transport.StopAsync().ConfigureAwait(continueOnCapturedContext: false);
					}
					catch (Exception ex)
					{
						Log.TransportThrewExceptionOnStop(_logger, ex);
					}
					Log.Disposed(_logger);
				}
				else
				{
					Log.SkippingDispose(_logger);
				}
				_httpClient?.Dispose();
			}
			finally
			{
				if (!_disposed)
				{
					_disposed = true;
				}
				_connectionLock.Release();
			}
		}

		private unsafe async Task SelectAndStartTransport(TransferFormat transferFormat, CancellationToken cancellationToken)
		{
			//IL_0016: Unknown result type (might be due to invalid IL or missing references)
			//IL_0017: Unknown result type (might be due to invalid IL or missing references)
			Uri uri = _url;
			_accessTokenProvider = _httpConnectionOptions.AccessTokenProvider;
			List<Exception> transportExceptions = new List<Exception>();
			if (_httpConnectionOptions.SkipNegotiation)
			{
				if ((int)_httpConnectionOptions.Transports != 1)
				{
					throw new InvalidOperationException("Negotiation can only be skipped when using the WebSocket transport directly.");
				}
				Log.StartingTransport(_logger, _httpConnectionOptions.Transports, uri);
				await StartTransport(uri, _httpConnectionOptions.Transports, transferFormat, cancellationToken).ConfigureAwait(continueOnCapturedContext: false);
			}
			else
			{
				int redirects = 0;
				NegotiationResponse val;
				do
				{
					val = await GetNegotiationResponseAsync(uri, cancellationToken).ConfigureAwait(continueOnCapturedContext: false);
					if (val.Url != null)
					{
						uri = new Uri(val.Url);
					}
					if (val.AccessToken != null)
					{
						string accessToken = val.AccessToken;
						_accessTokenProvider = () => Task.FromResult(accessToken);
					}
					redirects++;
				}
				while (val.Url != null && redirects < 100);
				if (redirects == 100 && val.Url != null)
				{
					throw new InvalidOperationException("Negotiate redirection limit exceeded.");
				}
				Uri connectUrl = CreateConnectUrl(uri, val.ConnectionToken);
				string transferFormatString = ((object)(*(TransferFormat*)(&transferFormat))/*cast due to .constrained prefix*/).ToString();
				foreach (AvailableTransport availableTransport in val.AvailableTransports)
				{
					if (!Enum.TryParse<HttpTransportType>(availableTransport.Transport, out HttpTransportType transportType))
					{
						Log.TransportNotSupported(_logger, availableTransport.Transport);
						transportExceptions.Add(new TransportFailedException(availableTransport.Transport, "The transport is not supported by the client."));
						continue;
					}
					if ((int)transportType == 1 && !IsWebSocketsSupported())
					{
						Log.WebSocketsNotSupportedByOperatingSystem(_logger);
						transportExceptions.Add(new TransportFailedException("WebSockets", "The transport is not supported on this operating system."));
						continue;
					}
					if ((int)transportType == 2 && OperatingSystem.IsBrowser())
					{
						Log.ServerSentEventsNotSupportedByBrowser(_logger);
						transportExceptions.Add(new TransportFailedException("ServerSentEvents", "The transport is not supported in the browser."));
						continue;
					}
					try
					{
						if ((transportType & _httpConnectionOptions.Transports) == 0)
						{
							Log.TransportDisabledByClient(_logger, transportType);
							transportExceptions.Add(new TransportFailedException(((object)(*(HttpTransportType*)(&transportType))/*cast due to .constrained prefix*/).ToString(), "The transport is disabled by the client."));
							continue;
						}
						if (!availableTransport.TransferFormats.Contains<string>(transferFormatString, StringComparer.Ordinal))
						{
							Log.TransportDoesNotSupportTransferFormat(_logger, transportType, transferFormat);
							transportExceptions.Add(new TransportFailedException(((object)(*(HttpTransportType*)(&transportType))/*cast due to .constrained prefix*/).ToString(), $"The transport does not support the '{transferFormat}' transfer format."));
							continue;
						}
						if (val == null)
						{
							connectUrl = CreateConnectUrl(uri, (await GetNegotiationResponseAsync(uri, cancellationToken).ConfigureAwait(continueOnCapturedContext: false)).ConnectionToken);
						}
						Log.StartingTransport(_logger, transportType, uri);
						await StartTransport(connectUrl, transportType, transferFormat, cancellationToken).ConfigureAwait(continueOnCapturedContext: false);
					}
					catch (Exception ex)
					{
						Log.TransportFailed(_logger, transportType, ex);
						transportExceptions.Add(new TransportFailedException(((object)(*(HttpTransportType*)(&transportType))/*cast due to .constrained prefix*/).ToString(), ex.Message, ex));
						val = null;
						continue;
					}
					break;
				}
			}
			if (_transport == null)
			{
				if (transportExceptions.Count > 0)
				{
					throw new AggregateException("Unable to connect to the server with any of the available transports.", transportExceptions);
				}
				throw new NoTransportSupportedException("None of the transports supported by the client are supported by the server.");
			}
		}

		private async Task<NegotiationResponse> NegotiateAsync(Uri url, HttpClient httpClient, ILogger logger, CancellationToken cancellationToken)
		{
			_ = 1;
			try
			{
				Log.EstablishingConnection(logger, url);
				UriBuilder uriBuilder = new UriBuilder(url);
				if (!uriBuilder.Path.EndsWith("/", StringComparison.Ordinal))
				{
					uriBuilder.Path += "/";
				}
				uriBuilder.Path += "negotiate";
				using HttpRequestMessage request = new HttpRequestMessage(requestUri: (!uriBuilder.Query.Contains("negotiateVersion")) ? Utils.AppendQueryString(uriBuilder.Uri, $"negotiateVersion={1}") : uriBuilder.Uri, method: HttpMethod.Post);
				request.Version = HttpVersion.Version20;
				request.Properties.Add("IsNegotiate", true);
				using HttpResponseMessage response = await httpClient.SendAsync(request, HttpCompletionOption.ResponseHeadersRead, cancellationToken).ConfigureAwait(continueOnCapturedContext: false);
				response.EnsureSuccessStatusCode();
				NegotiationResponse val = NegotiateProtocol.ParseResponse((ReadOnlySpan<byte>)(await response.Content.ReadAsByteArrayAsync().ConfigureAwait(continueOnCapturedContext: false)));
				if (!string.IsNullOrEmpty(val.Error))
				{
					throw new Exception(val.Error);
				}
				Log.ConnectionEstablished(_logger, val.ConnectionId);
				return val;
			}
			catch (Exception exception)
			{
				Log.ErrorWithNegotiation(logger, url, exception);
				throw;
			}
		}

		private static Uri CreateConnectUrl(Uri url, string connectionId)
		{
			if (string.IsNullOrWhiteSpace(connectionId))
			{
				throw new FormatException("Invalid connection id.");
			}
			return Utils.AppendQueryString(url, "id=" + connectionId);
		}

		private async Task StartTransport(Uri connectUrl, HttpTransportType transportType, TransferFormat transferFormat, CancellationToken cancellationToken)
		{
			//IL_001e: Unknown result type (might be due to invalid IL or missing references)
			//IL_001f: Unknown result type (might be due to invalid IL or missing references)
			//IL_0026: Unknown result type (might be due to invalid IL or missing references)
			//IL_0027: Unknown result type (might be due to invalid IL or missing references)
			ITransport transport = _transportFactory.CreateTransport(transportType);
			try
			{
				await transport.StartAsync(connectUrl, transferFormat, cancellationToken).ConfigureAwait(continueOnCapturedContext: false);
			}
			catch (Exception exception)
			{
				Log.ErrorStartingTransport(_logger, transportType, exception);
				_transport = null;
				throw;
			}
			_hasInherentKeepAlive = (int)transportType == 4;
			_transport = transport;
			Log.TransportStarted(_logger, transportType);
		}

		private HttpClient CreateHttpClient()
		{
			HttpClientHandler httpClientHandler = new HttpClientHandler();
			HttpMessageHandler inner = httpClientHandler;
			bool flag = OperatingSystem.IsBrowser();
			if (_httpConnectionOptions != null)
			{
				if (!flag)
				{
					if (_httpConnectionOptions.Proxy != null)
					{
						httpClientHandler.Proxy = _httpConnectionOptions.Proxy;
					}
					try
					{
						httpClientHandler.CookieContainer = _httpConnectionOptions.Cookies;
					}
					catch (Exception ex) when (ex is NotSupportedException || ex is NotImplementedException)
					{
						Log.CookiesNotSupported(_logger);
					}
					X509CertificateCollection clientCertificates = _httpConnectionOptions.ClientCertificates;
					if (clientCertificates != null && clientCertificates.Count > 0)
					{
						httpClientHandler.ClientCertificates.AddRange(clientCertificates);
					}
					if (_httpConnectionOptions.UseDefaultCredentials.HasValue)
					{
						httpClientHandler.UseDefaultCredentials = _httpConnectionOptions.UseDefaultCredentials.Value;
					}
					if (_httpConnectionOptions.Credentials != null)
					{
						httpClientHandler.Credentials = _httpConnectionOptions.Credentials;
					}
				}
				inner = httpClientHandler;
				if (_httpConnectionOptions.HttpMessageHandlerFactory != null)
				{
					inner = _httpConnectionOptions.HttpMessageHandlerFactory(httpClientHandler);
					if (inner == null)
					{
						throw new InvalidOperationException("Configured HttpMessageHandlerFactory did not return a value.");
					}
				}
				inner = new AccessTokenHttpMessageHandler(inner, this);
			}
			inner = new LoggingHttpMessageHandler(inner, _loggerFactory);
			HttpClient httpClient = new HttpClient(inner);
			httpClient.Timeout = HttpClientTimeout;
			bool flag2 = false;
			if (_httpConnectionOptions?.Headers != null)
			{
				foreach (KeyValuePair<string, string> header in _httpConnectionOptions.Headers)
				{
					if (string.Equals(header.Key, Constants.UserAgent, StringComparison.OrdinalIgnoreCase))
					{
						flag2 = true;
						if (string.IsNullOrEmpty(header.Value))
						{
							httpClient.DefaultRequestHeaders.Remove(header.Key);
						}
						else if (httpClient.DefaultRequestHeaders.Contains(header.Key))
						{
							httpClient.DefaultRequestHeaders.Remove(header.Key);
							httpClient.DefaultRequestHeaders.Add(header.Key, header.Value);
						}
						else
						{
							httpClient.DefaultRequestHeaders.Add(header.Key, header.Value);
						}
					}
					else
					{
						httpClient.DefaultRequestHeaders.Add(header.Key, header.Value);
					}
				}
			}
			if (!flag2)
			{
				httpClient.DefaultRequestHeaders.Add(Constants.UserAgent, Constants.UserAgentHeader);
			}
			httpClient.DefaultRequestHeaders.Remove("X-Requested-With");
			httpClient.DefaultRequestHeaders.Add("X-Requested-With", "XMLHttpRequest");
			return httpClient;
		}

		internal Task<string?> GetAccessTokenAsync()
		{
			if (_accessTokenProvider == null)
			{
				return _noAccessToken;
			}
			return _accessTokenProvider();
		}

		private void CheckDisposed()
		{
			if (_disposed)
			{
				throw new ObjectDisposedException("HttpConnection");
			}
		}

		private static bool IsWebSocketsSupported()
		{
			return true;
		}

		private async Task<NegotiationResponse> GetNegotiationResponseAsync(Uri uri, CancellationToken cancellationToken)
		{
			NegotiationResponse val = await NegotiateAsync(uri, _httpClient, _logger, cancellationToken).ConfigureAwait(continueOnCapturedContext: false);
			_connectionId = val.ConnectionId;
			if (val.Version == 0)
			{
				val.ConnectionToken = _connectionId;
			}
			_logScope.ConnectionId = _connectionId;
			return val;
		}
	}
	public class HttpConnectionFactory : IConnectionFactory
	{
		private readonly HttpConnectionOptions _httpConnectionOptions;

		private readonly ILoggerFactory _loggerFactory;

		public HttpConnectionFactory(IOptions<HttpConnectionOptions> options, ILoggerFactory loggerFactory)
		{
			if (options == null)
			{
				throw new ArgumentNullException("options");
			}
			_httpConnectionOptions = options.Value;
			_loggerFactory = loggerFactory ?? throw new ArgumentNullException("loggerFactory");
		}

		public async ValueTask<ConnectionContext> ConnectAsync(EndPoint endPoint, CancellationToken cancellationToken = default(CancellationToken))
		{
			if (endPoint == null)
			{
				throw new ArgumentNullException("endPoint");
			}
			UriEndPoint val = (UriEndPoint)(object)((endPoint is UriEndPoint) ? endPoint : null);
			if (val == null)
			{
				throw new NotSupportedException("The provided EndPoint must be of type UriEndPoint.");
			}
			if (_httpConnectionOptions.Url != null && _httpConnectionOptions.Url != val.Uri)
			{
				throw new InvalidOperationException("If HttpConnectionOptions.Url was set, it must match the UriEndPoint.Uri passed to ConnectAsync.");
			}
			HttpConnectionOptions httpConnectionOptions = ShallowCopyHttpConnectionOptions(_httpConnectionOptions);
			httpConnectionOptions.Url = val.Uri;
			HttpConnection connection = new HttpConnection(httpConnectionOptions, _loggerFactory);
			try
			{
				await connection.StartAsync(cancellationToken).ConfigureAwait(continueOnCapturedContext: false);
				return (ConnectionContext)(object)connection;
			}
			catch
			{
				await ((BaseConnectionContext)connection).DisposeAsync().ConfigureAwait(continueOnCapturedContext: false);
				throw;
			}
		}

		internal static HttpConnectionOptions ShallowCopyHttpConnectionOptions(HttpConnectionOptions options)
		{
			//IL_002b: Unknown result type (might be due to invalid IL or missing references)
			//IL_005b: Unknown result type (might be due to invalid IL or missing references)
			HttpConnectionOptions httpConnectionOptions = new HttpConnectionOptions
			{
				HttpMessageHandlerFactory = options.HttpMessageHandlerFactory,
				Headers = options.Headers,
				Url = options.Url,
				Transports = options.Transports,
				SkipNegotiation = options.SkipNegotiation,
				AccessTokenProvider = options.AccessTokenProvider,
				CloseTimeout = options.CloseTimeout,
				DefaultTransferFormat = options.DefaultTransferFormat,
				ApplicationMaxBufferSize = options.ApplicationMaxBufferSize,
				TransportMaxBufferSize = options.TransportMaxBufferSize
			};
			if (!OperatingSystem.IsBrowser())
			{
				httpConnectionOptions.Cookies = options.Cookies;
				httpConnectionOptions.ClientCertificates = options.ClientCertificates;
				httpConnectionOptions.Credentials = options.Credentials;
				httpConnectionOptions.Proxy = options.Proxy;
				httpConnectionOptions.UseDefaultCredentials = options.UseDefaultCredentials;
				httpConnectionOptions.WebSocketConfiguration = options.WebSocketConfiguration;
				httpConnectionOptions.WebSocketFactory = options.WebSocketFactory;
			}
			return httpConnectionOptions;
		}
	}
	public class HttpConnectionOptions
	{
		private IDictionary<string, string> _headers;

		private X509CertificateCollection _clientCertificates;

		private CookieContainer _cookies;

		private ICredentials _credentials;

		private IWebProxy _proxy;

		private bool? _useDefaultCredentials;

		private Action<ClientWebSocketOptions> _webSocketConfiguration;

		private PipeOptions _transportPipeOptions;

		private PipeOptions _appPipeOptions;

		private long _transportMaxBufferSize;

		private long _applicationMaxBufferSize;

		private const int DefaultBufferSize = 1048576;

		public Func<HttpMessageHandler, HttpMessageHandler>? HttpMessageHandlerFactory { get; set; }

		public Func<WebSocketConnectionContext, CancellationToken, ValueTask<WebSocket>>? WebSocketFactory { get; set; }

		public IDictionary<string, string> Headers
		{
			get
			{
				return _headers;
			}
			set
			{
				_headers = value ?? throw new ArgumentNullException("value");
			}
		}

		public long TransportMaxBufferSize
		{
			get
			{
				return _transportMaxBufferSize;
			}
			set
			{
				if (value < 0)
				{
					throw new ArgumentOutOfRangeException("value");
				}
				_transportMaxBufferSize = value;
			}
		}

		public long ApplicationMaxBufferSize
		{
			get
			{
				return _applicationMaxBufferSize;
			}
			set
			{
				if (value < 0)
				{
					throw new ArgumentOutOfRangeException("value");
				}
				_applicationMaxBufferSize = value;
			}
		}

		internal PipeOptions TransportPipeOptions
		{
			get
			{
				//IL_0027: Unknown result type (might be due to invalid IL or missing references)
				//IL_002c: Unknown result type (might be due to invalid IL or missing references)
				//IL_002e: Expected O, but got Unknown
				//IL_0033: Expected O, but got Unknown
				PipeOptions obj = _transportPipeOptions;
				if (obj == null)
				{
					long transportMaxBufferSize = TransportMaxBufferSize;
					long num = TransportMaxBufferSize / 2;
					PipeOptions val = new PipeOptions((MemoryPool<byte>)null, PipeScheduler.ThreadPool, (PipeScheduler)null, transportMaxBufferSize, num, -1, false);
					PipeOptions val2 = val;
					_transportPipeOptions = val;
					obj = val2;
				}
				return obj;
			}
		}

		internal PipeOptions AppPipeOptions
		{
			get
			{
				//IL_0027: Unknown result type (might be due to invalid IL or missing references)
				//IL_002c: Unknown result type (might be due to invalid IL or missing references)
				//IL_002e: Expected O, but got Unknown
				//IL_0033: Expected O, but got Unknown
				PipeOptions obj = _appPipeOptions;
				if (obj == null)
				{
					long applicationMaxBufferSize = ApplicationMaxBufferSize;
					long num = ApplicationMaxBufferSize / 2;
					PipeOptions val = new PipeOptions((MemoryPool<byte>)null, PipeScheduler.ThreadPool, (PipeScheduler)null, applicationMaxBufferSize, num, -1, false);
					PipeOptions val2 = val;
					_appPipeOptions = val;
					obj = val2;
				}
				return obj;
			}
		}

		[UnsupportedOSPlatform("browser")]
		public X509CertificateCollection? ClientCertificates
		{
			get
			{
				ThrowIfUnsupportedPlatform();
				return _clientCertificates;
			}
			set
			{
				ThrowIfUnsupportedPlatform();
				_clientCertificates = value ?? throw new ArgumentNullException("value");
			}
		}

		[UnsupportedOSPlatform("browser")]
		public CookieContainer Cookies
		{
			get
			{
				ThrowIfUnsupportedPlatform();
				return _cookies;
			}
			set
			{
				ThrowIfUnsupportedPlatform();
				_cookies = value ?? throw new ArgumentNullException("value");
			}
		}

		public Uri? Url { get; set; }

		public HttpTransportType Transports { get; set; }

		public bool SkipNegotiation { get; set; }

		public Func<Task<string?>>? AccessTokenProvider { get; set; }

		public TimeSpan CloseTimeout { get; set; } = TimeSpan.FromSeconds(5.0);

		[UnsupportedOSPlatform("browser")]
		public ICredentials? Credentials
		{
			get
			{
				ThrowIfUnsupportedPlatform();
				return _credentials;
			}
			set
			{
				ThrowIfUnsupportedPlatform();
				_credentials = value;
			}
		}

		[UnsupportedOSPlatform("browser")]
		public IWebProxy? Proxy
		{
			get
			{
				ThrowIfUnsupportedPlatform();
				return _proxy;
			}
			set
			{
				ThrowIfUnsupportedPlatform();
				_proxy = value;
			}
		}

		[UnsupportedOSPlatform("browser")]
		public bool? UseDefaultCredentials
		{
			get
			{
				ThrowIfUnsupportedPlatform();
				return _useDefaultCredentials;
			}
			set
			{
				ThrowIfUnsupportedPlatform();
				_useDefaultCredentials = value;
			}
		}

		public TransferFormat DefaultTransferFormat { get; set; } = (TransferFormat)1;

		[UnsupportedOSPlatform("browser")]
		public Action<ClientWebSocketOptions>? WebSocketConfiguration
		{
			get
			{
				ThrowIfUnsupportedPlatform();
				return _webSocketConfiguration;
			}
			set
			{
				ThrowIfUnsupportedPlatform();
				_webSocketConfiguration = value;
			}
		}

		public HttpConnectionOptions()
		{
			//IL_0016: Unknown result type (might be due to invalid IL or missing references)
			//IL_004a: Unknown result type (might be due to invalid IL or missing references)
			_headers = new Dictionary<string, string>();
			if (!OperatingSystem.IsBrowser())
			{
				_clientCertificates = new X509CertificateCollection();
			}
			_cookies = new CookieContainer();
			Transports = HttpTransports.All;
			TransportMaxBufferSize = 1048576L;
			ApplicationMaxBufferSize = 1048576L;
		}

		private static void ThrowIfUnsupportedPlatform()
		{
			if (OperatingSystem.IsBrowser())
			{
				throw new PlatformNotSupportedException();
			}
		}
	}
	public class NoTransportSupportedException : Exception
	{
		public NoTransportSupportedException(string message)
			: base(message)
		{
		}
	}
	public class TransportFailedException : Exception
	{
		public string TransportType { get; }

		public TransportFailedException(string transportType, string message, Exception? innerException = null)
			: base(transportType + " failed: " + message, innerException)
		{
			TransportType = transportType;
		}
	}
	public sealed class WebSocketConnectionContext
	{
		public Uri Uri { get; }

		public HttpConnectionOptions Options { get; }

		public WebSocketConnectionContext(Uri uri, HttpConnectionOptions options)
		{
			Uri = uri;
			Options = options;
		}
	}
}
namespace Microsoft.AspNetCore.Http.Connections.Client.Internal
{
	internal sealed class AccessTokenHttpMessageHandler : DelegatingHandler
	{
		private readonly HttpConnection _httpConnection;

		private string _accessToken;

		public AccessTokenHttpMessageHandler(HttpMessageHandler inner, HttpConnection httpConnection)
			: base(inner)
		{
			_httpConnection = httpConnection;
		}

		protected override async Task<HttpResponseMessage> SendAsync(HttpRequestMessage request, CancellationToken cancellationToken)
		{
			bool shouldRetry = true;
			if (string.IsNullOrEmpty(_accessToken) || (request.Properties.TryGetValue("IsNegotiate", out object value) && value is bool && (bool)value))
			{
				shouldRetry = false;
				_accessToken = await _httpConnection.GetAccessTokenAsync().ConfigureAwait(continueOnCapturedContext: false);
			}
			SetAccessToken(_accessToken, request);
			HttpResponseMessage httpResponseMessage = await base.SendAsync(request, cancellationToken).ConfigureAwait(continueOnCapturedContext: false);
			if (shouldRetry && httpResponseMessage.StatusCode == HttpStatusCode.Unauthorized)
			{
				HttpConnection.Log.RetryAccessToken(_httpConnection._logger, httpResponseMessage.StatusCode);
				httpResponseMessage.Dispose();
				_accessToken = await _httpConnection.GetAccessTokenAsync().ConfigureAwait(continueOnCapturedContext: false);
				SetAccessToken(_accessToken, request);
				httpResponseMessage = await base.SendAsync(request, cancellationToken).ConfigureAwait(continueOnCapturedContext: false);
			}
			return httpResponseMessage;
		}

		private static void SetAccessToken(string accessToken, HttpRequestMessage request)
		{
			if (!string.IsNullOrEmpty(accessToken))
			{
				request.Headers.Authorization = new AuthenticationHeaderValue("Bearer", accessToken);
			}
		}
	}
	internal static class ClientPipeOptions
	{
		public static PipeOptions DefaultOptions;

		static ClientPipeOptions()
		{
			//IL_0013: Unknown result type (might be due to invalid IL or missing references)
			//IL_001d: Expected O, but got Unknown
			PipeScheduler threadPool = PipeScheduler.ThreadPool;
			DefaultOptions = new PipeOptions((MemoryPool<byte>)null, PipeScheduler.ThreadPool, threadPool, -1L, -1L, -1, false);
		}
	}
	internal sealed class ConnectionLogScope : IReadOnlyList<KeyValuePair<string, object?>>, IEnumerable<KeyValuePair<string, object?>>, IEnumerable, IReadOnlyCollection<KeyValuePair<string, object?>>
	{
		private const string ClientConnectionIdKey = "ClientConnectionId";

		private string _cachedToString;

		private string _connectionId;

		public string? ConnectionId
		{
			get
			{
				return _connectionId;
			}
			set
			{
				_cachedToString = null;
				_connectionId = value;
			}
		}

		public KeyValuePair<string, object?> this[int index]
		{
			get
			{
				if (Count == 1 && index == 0)
				{
					return new KeyValuePair<string, object>("ClientConnectionId", ConnectionId);
				}
				throw new ArgumentOutOfRangeException("index");
			}
		}

		public int Count
		{
			get
			{
				if (!string.IsNullOrEmpty(ConnectionId))
				{
					return 1;
				}
				return 0;
			}
		}

		public IEnumerator<KeyValuePair<string, object?>> GetEnumerator()
		{
			int i = 0;
			while (i < Count)
			{
				yield return this[i];
				int num = i + 1;
				i = num;
			}
		}

		IEnumerator IEnumerable.GetEnumerator()
		{
			return GetEnumerator();
		}

		public override string ToString()
		{
			if (_cachedToString == null && !string.IsNullOrEmpty(ConnectionId))
			{
				_cachedToString = FormattableString.Invariant(FormattableStringFactory.Create("{0}:{1}", "ClientConnectionId", ConnectionId));
			}
			return _cachedToString ?? string.Empty;
		}
	}
	internal static class Constants
	{
		public static readonly string UserAgent = (OperatingSystem.IsBrowser() ? "X-SignalR-User-Agent" : "User-Agent");

		public static readonly string UserAgentHeader = GetUserAgentHeader();

		private static string GetUserAgentHeader()
		{
			AssemblyInformationalVersionAttribute assemblyInformationalVersionAttribute = typeof(Constants).Assembly.GetCustomAttributes<AssemblyInformationalVersionAttribute>().FirstOrDefault();
			string runtime = ".NET";
			string frameworkDescription = RuntimeInformation.FrameworkDescription;
			return ConstructUserAgent(typeof(Constants).Assembly.GetName().Version, assemblyInformationalVersionAttribute.InformationalVersion, GetOS(), runtime, frameworkDescription);
		}

		private static string GetOS()
		{
			if (RuntimeInformation.IsOSPlatform(OSPlatform.Windows))
			{
				return "Windows NT";
			}
			if (RuntimeInformation.IsOSPlatform(OSPlatform.OSX))
			{
				return "macOS";
			}
			if (RuntimeInformation.IsOSPlatform(OSPlatform.Linux))
			{
				return "Linux";
			}
			return "";
		}

		public static string ConstructUserAgent(Version version, string detailedVersion, string os, string runtime, string runtimeVersion)
		{
			string text = $"Microsoft SignalR/{version.Major}.{version.Minor} (";
			text = (string.IsNullOrEmpty(detailedVersion) ? (text + "Unknown Version") : (text + detailedVersion));
			text = (string.IsNullOrEmpty(os) ? (text + "; Unknown OS") : (text + "; " + os));
			text = text + "; " + runtime;
			text = (string.IsNullOrEmpty(runtimeVersion) ? (text + "; Unknown Runtime Version") : (text + "; " + runtimeVersion));
			return text + ")";
		}
	}
	internal sealed class DefaultTransportFactory : ITransportFactory
	{
		private static class Log
		{
			[GeneratedCode("Microsoft.Extensions.Logging.Generators", "7.0.7.1805")]
			private static readonly Action<ILogger, HttpTransportType, Exception> __TransportNotSupportedCallback = LoggerMessage.Define<HttpTransportType>((LogLevel)1, new EventId(1, "TransportNotSupported"), "Transport '{TransportType}' is not supported.", new LogDefineOptions
			{
				SkipEnabledCheck = true
			});

			[LoggerMessage(/*Could not decode attribute arguments.*/)]
			[GeneratedCode("Microsoft.Extensions.Logging.Generators", "7.0.7.1805")]
			public static void TransportNotSupported(ILogger logger, HttpTransportType transportType, Exception ex)
			{
				//IL_000f: Unknown result type (might be due to invalid IL or missing references)
				if (logger.IsEnabled((LogLevel)1))
				{
					__TransportNotSupportedCallback(logger, transportType, ex);
				}
			}
		}

		private readonly HttpClient _httpClient;

		private readonly HttpConnectionOptions _httpConnectionOptions;

		private readonly Func<Task<string>> _accessTokenProvider;

		private readonly HttpTransportType _requestedTransportType;

		private readonly ILoggerFactory _loggerFactory;

		private static volatile bool _websocketsSupported = true;

		public DefaultTransportFactory(HttpTransportType requestedTransportType, ILoggerFactory loggerFactory, HttpClient? httpClient, HttpConnectionOptions httpConnectionOptions, Func<Task<string?>> accessTokenProvider)
		{
			//IL_0019: Unknown result type (might be due to invalid IL or missing references)
			//IL_001a: Unknown result type (might be due to invalid IL or missing references)
			//IL_0009: Unknown result type (might be due to invalid IL or missing references)
			//IL_000b: Invalid comparison between Unknown and I4
			if (httpClient == null && (int)requestedTransportType != 1)
			{
				throw new ArgumentNullException("httpClient");
			}
			_requestedTransportType = requestedTransportType;
			_loggerFactory = loggerFactory;
			_httpClient = httpClient;
			_httpConnectionOptions = httpConnectionOptions;
			_accessTokenProvider = accessTokenProvider;
		}

		public ITransport CreateTransport(HttpTransportType availableServerTransports)
		{
			//IL_0053: Unknown result type (might be due to invalid IL or missing references)
			//IL_0055: Unknown result type (might be due to invalid IL or missing references)
			//IL_0057: Unknown result type (might be due to invalid IL or missing references)
			//IL_005c: Unknown result type (might be due to invalid IL or missing references)
			//IL_005e: Invalid comparison between Unknown and I4
			//IL_0009: Unknown result type (might be due to invalid IL or missing references)
			//IL_000b: Unknown result type (might be due to invalid IL or missing references)
			//IL_000d: Unknown result type (might be due to invalid IL or missing references)
			//IL_0012: Unknown result type (might be due to invalid IL or missing references)
			//IL_0014: Invalid comparison between Unknown and I4
			//IL_0078: Unknown result type (might be due to invalid IL or missing references)
			//IL_007a: Unknown result type (might be due to invalid IL or missing references)
			//IL_007c: Unknown result type (might be due to invalid IL or missing references)
			//IL_0081: Unknown result type (might be due to invalid IL or missing references)
			//IL_0083: Invalid comparison between Unknown and I4
			if (_websocketsSupported && (availableServerTransports & 1 & _requestedTransportType) == 1)
			{
				try
				{
					return new WebSocketsTransport(_httpConnectionOptions, _loggerFactory, _accessTokenProvider, _httpClient);
				}
				catch (PlatformNotSupportedException ex)
				{
					Log.TransportNotSupported((ILogger)(object)LoggerFactoryExtensions.CreateLogger<DefaultTransportFactory>(_loggerFactory), (HttpTransportType)1, ex);
					_websocketsSupported = false;
				}
			}
			if ((availableServerTransports & 2 & _requestedTransportType) == 2)
			{
				return new ServerSentEventsTransport(_httpClient, _httpConnectionOptions, _loggerFactory);
			}
			if ((availableServerTransports & 4 & _requestedTransportType) == 4)
			{
				return new LongPollingTransport(_httpClient, _httpConnectionOptions, _loggerFactory);
			}
			throw new InvalidOperationException("No requested transports available on the server.");
		}
	}
	internal interface ITransport : IDuplexPipe
	{
		Task StartAsync(Uri url, TransferFormat transferFormat, CancellationToken cancellationToken = default(CancellationToken));

		Task StopAsync();
	}
	internal interface ITransportFactory
	{
		ITransport CreateTransport(HttpTransportType availableServerTransports);
	}
	internal sealed class LoggingHttpMessageHandler : DelegatingHandler
	{
		private static class Log
		{
			[GeneratedCode("Microsoft.Extensions.Logging.Generators", "7.0.7.1805")]
			private static readonly Action<ILogger, HttpMethod, Uri, Exception> __SendingHttpRequestCallback = LoggerMessage.Define<HttpMethod, Uri>((LogLevel)0, new EventId(1, "SendingHttpRequest"), "Sending HTTP request {RequestMethod} '{RequestUrl}'.", new LogDefineOptions
			{
				SkipEnabledCheck = true
			});

			[GeneratedCode("Microsoft.Extensions.Logging.Generators", "7.0.7.1805")]
			private static readonly Action<ILogger, HttpStatusCode, HttpMethod, Uri, Exception> __UnsuccessfulHttpResponseCallback = LoggerMessage.Define<HttpStatusCode, HttpMethod, Uri>((LogLevel)3, new EventId(2, "UnsuccessfulHttpResponse"), "Unsuccessful HTTP response {StatusCode} return from {RequestMethod} '{RequestUrl}'.", new LogDefineOptions
			{
				SkipEnabledCheck = true
			});

			[LoggerMessage(/*Could not decode attribute arguments.*/)]
			[GeneratedCode("Microsoft.Extensions.Logging.Generators", "7.0.7.1805")]
			public static void SendingHttpRequest(ILogger logger, HttpMethod requestMethod, Uri requestUrl)
			{
				if (logger.IsEnabled((LogLevel)0))
				{
					__SendingHttpRequestCallback(logger, requestMethod, requestUrl, null);
				}
			}

			[LoggerMessage(/*Could not decode attribute arguments.*/)]
			[GeneratedCode("Microsoft.Extensions.Logging.Generators", "7.0.7.1805")]
			public static void UnsuccessfulHttpResponse(ILogger logger, HttpStatusCode statusCode, HttpMethod requestMethod, Uri requestUrl)
			{
				if (logger.IsEnabled((LogLevel)3))
				{
					__UnsuccessfulHttpResponseCallback(logger, statusCode, requestMethod, requestUrl, null);
				}
			}
		}

		private readonly ILogger<LoggingHttpMessageHandler> _logger;

		public LoggingHttpMessageHandler(HttpMessageHandler inner, ILoggerFactory loggerFactory)
			: base(inner)
		{
			if (loggerFactory == null)
			{
				throw new ArgumentNullException("loggerFactory");
			}
			_logger = LoggerFactoryExtensions.CreateLogger<LoggingHttpMessageHandler>(loggerFactory);
		}

		protected override async Task<HttpResponseMessage> SendAsync(HttpRequestMessage request, CancellationToken cancellationToken)
		{
			Log.SendingHttpRequest((ILogger)(object)_logger, request.Method, request.RequestUri);
			HttpResponseMessage httpResponseMessage = await base.SendAsync(request, cancellationToken).ConfigureAwait(continueOnCapturedContext: false);
			if (!httpResponseMessage.IsSuccessStatusCode && httpResponseMessage.StatusCode != HttpStatusCode.SwitchingProtocols)
			{
				Log.UnsuccessfulHttpResponse((ILogger)(object)_logger, httpResponseMessage.StatusCode, request.Method, request.RequestUri);
			}
			return httpResponseMessage;
		}
	}
	internal sealed class LongPollingTransport : ITransport, IDuplexPipe
	{
		private static class Log
		{
			[GeneratedCode("Microsoft.Extensions.Logging.Generators", "7.0.7.1805")]
			private static readonly Action<ILogger, TransferFormat, Exception> __StartTransportCallback = LoggerMessage.Define<TransferFormat>((LogLevel)2, new EventId(1, "StartTransport"), "Starting transport. Transfer mode: {TransferFormat}.", new LogDefineOptions
			{
				SkipEnabledCheck = true
			});

			[GeneratedCode("Microsoft.Extensions.Logging.Generators", "7.0.7.1805")]
			private static readonly Action<ILogger, Exception> __TransportStoppedCallback = LoggerMessage.Define((LogLevel)1, new EventId(2, "TransportStopped"), "Transport stopped.", new LogDefineOptions
			{
				SkipEnabledCheck = true
			});

			[GeneratedCode("Microsoft.Extensions.Logging.Generators", "7.0.7.1805")]
			private static readonly Action<ILogger, Exception> __StartReceiveCallback = LoggerMessage.Define((LogLevel)1, new EventId(3, "StartReceive"), "Starting receive loop.", new LogDefineOptions
			{
				SkipEnabledCheck = true
			});

			[GeneratedCode("Microsoft.Extensions.Logging.Generators", "7.0.7.1805")]
			private static readonly Action<ILogger, Exception> __TransportStoppingCallback = LoggerMessage.Define((LogLevel)2, new EventId(6, "TransportStopping"), "Transport is stopping.", new LogDefineOptions
			{
				SkipEnabledCheck = true
			});

			[GeneratedCode("Microsoft.Extensions.Logging.Generators", "7.0.7.1805")]
			private static readonly Action<ILogger, Exception> __ReceiveCanceledCallback = LoggerMessage.Define((LogLevel)1, new EventId(5, "ReceiveCanceled"), "Receive loop canceled.", new LogDefineOptions
			{
				SkipEnabledCheck = true
			});

			[GeneratedCode("Microsoft.Extensions.Logging.Generators", "7.0.7.1805")]
			private static readonly Action<ILogger, Exception> __ReceiveStoppedCallback = LoggerMessage.Define((LogLevel)1, new EventId(4, "ReceiveStopped"), "Receive loop stopped.", new LogDefineOptions
			{
				SkipEnabledCheck = true
			});

			[GeneratedCode("Microsoft.Extensions.Logging.Generators", "7.0.7.1805")]
			private static readonly Action<ILogger, Exception> __ClosingConnectionCallback = LoggerMessage.Define((LogLevel)1, new EventId(7, "ClosingConnection"), "The server is closing the connection.", new LogDefineOptions
			{
				SkipEnabledCheck = true
			});

			[GeneratedCode("Microsoft.Extensions.Logging.Generators", "7.0.7.1805")]
			private static readonly Action<ILogger, Exception> __ReceivedMessagesCallback = LoggerMessage.Define((LogLevel)1, new EventId(8, "ReceivedMessages"), "Received messages from the server.", new LogDefineOptions
			{
				SkipEnabledCheck = true
			});

			[GeneratedCode("Microsoft.Extensions.Logging.Generators", "7.0.7.1805")]
			private static readonly Action<ILogger, Uri, Exception> __ErrorPollingCallback = LoggerMessage.Define<Uri>((LogLevel)4, new EventId(9, "ErrorPolling"), "Error while polling '{PollUrl}'.", new LogDefineOptions
			{
				SkipEnabledCheck = true
			});

			[GeneratedCode("Microsoft.Extensions.Logging.Generators", "7.0.7.1805")]
			private static readonly Action<ILogger, int, long, Exception> __PollResponseReceivedCallback = LoggerMessage.Define<int, long>((LogLevel)0, new EventId(10, "PollResponseReceived"), "Poll response with status code {StatusCode} received from server. Content length: {ContentLength}.", new LogDefineOptions
			{
				SkipEnabledCheck = true
			});

			[GeneratedCode("Microsoft.Extensions.Logging.Generators", "7.0.7.1805")]
			private static readonly Action<ILogger, Uri, Exception> __SendingDeleteRequestCallback = LoggerMessage.Define<Uri>((LogLevel)1, new EventId(11, "SendingDeleteRequest"), "Sending DELETE request to '{PollUrl}'.", new LogDefineOptions
			{
				SkipEnabledCheck = true
			});

			[GeneratedCode("Microsoft.Extensions.Logging.Generators", "7.0.7.1805")]
			private static readonly Action<ILogger, Uri, Exception> __DeleteRequestAcceptedCallback = LoggerMessage.Define<Uri>((LogLevel)1, new EventId(12, "DeleteRequestAccepted"), "DELETE request to '{PollUrl}' accepted.", new LogDefineOptions
			{
				SkipEnabledCheck = true
			});

			[GeneratedCode("Microsoft.Extensions.Logging.Generators", "7.0.7.1805")]
			private static readonly Action<ILogger, Uri, Exception> __ErrorSendingDeleteRequestCallback = LoggerMessage.Define<Uri>((LogLevel)4, new EventId(13, "ErrorSendingDeleteRequest"), "Error sending DELETE request to '{PollUrl}'.", new LogDefineOptions
			{
				SkipEnabledCheck = true
			});

			[GeneratedCode("Microsoft.Extensions.Logging.Generators", "7.0.7.1805")]
			private static readonly Action<ILogger, Uri, Exception> __ConnectionAlreadyClosedSendingDeleteRequestCallback = LoggerMessage.Define<Uri>((LogLevel)1, new EventId(14, "ConnectionAlreadyClosedSendingDeleteRequest"), "A 404 response was returned from sending DELETE request to '{PollUrl}', likely because the transport was already closed on the server.", new LogDefineOptions
			{
				SkipEnabledCheck = true
			});

			[LoggerMessage(/*Could not decode attribute arguments.*/)]
			[GeneratedCode("Microsoft.Extensions.Logging.Generators", "7.0.7.1805")]
			public static void StartTransport(ILogger logger, TransferFormat transferFormat)
			{
				//IL_000f: Unknown result type (might be due to invalid IL or missing references)
				if (logger.IsEnabled((LogLevel)2))
				{
					__StartTransportCallback(logger, transferFormat, null);
				}
			}

			[LoggerMessage(/*Could not decode attribute arguments.*/)]
			[GeneratedCode("Microsoft.Extensions.Logging.Generators", "7.0.7.1805")]
			public static void TransportStopped(ILogger logger, Exception exception)
			{
				if (logger.IsEnabled((LogLevel)1))
				{
					__TransportStoppedCallback(logger, exception);
				}
			}

			[LoggerMessage(/*Could not decode attribute arguments.*/)]
			[GeneratedCode("Microsoft.Extensions.Logging.Generators", "7.0.7.1805")]
			public static void StartReceive(ILogger logger)
			{
				if (logger.IsEnabled((LogLevel)1))
				{
					__StartReceiveCallback(logger, null);
				}
			}

			[LoggerMessage(/*Could not decode attribute arguments.*/)]
			[GeneratedCode("Microsoft.Extensions.Logging.Generators", "7.0.7.1805")]
			public static void TransportStopping(ILogger logger)
			{
				if (logger.IsEnabled((LogLevel)2))
				{
					__TransportStoppingCallback(logger, null);
				}
			}

			[LoggerMessage(/*Could not decode attribute arguments.*/)]
			[GeneratedCode("Microsoft.Extensions.Logging.Generators", "7.0.7.1805")]
			public static void ReceiveCanceled(ILogger logger)
			{
				if (logger.IsEnabled((LogLevel)1))
				{
					__ReceiveCanceledCallback(logger, null);
				}
			}

			[LoggerMessage(/*Could not decode attribute arguments.*/)]
			[GeneratedCode("Microsoft.Extensions.Logging.Generators", "7.0.7.1805")]
			public static void ReceiveStopped(ILogger logger)
			{
				if (logger.IsEnabled((LogLevel)1))
				{
					__ReceiveStoppedCallback(logger, null);
				}
			}

			[LoggerMessage(/*Could not decode attribute arguments.*/)]
			[GeneratedCode("Microsoft.Extensions.Logging.Generators", "7.0.7.1805")]
			public static void ClosingConnection(ILogger logger)
			{
				if (logger.IsEnabled((LogLevel)1))
				{
					__ClosingConnectionCallback(logger, null);
				}
			}

			[LoggerMessage(/*Could not decode attribute arguments.*/)]
			[GeneratedCode("Microsoft.Extensions.Logging.Generators", "7.0.7.1805")]
			public static void ReceivedMessages(ILogger logger)
			{
				if (logger.IsEnabled((LogLevel)1))
				{
					__ReceivedMessagesCallback(logger, null);
				}
			}

			[LoggerMessage(/*Could not decode attribute arguments.*/)]
			[GeneratedCode("Microsoft.Extensions.Logging.Generators", "7.0.7.1805")]
			public static void ErrorPolling(ILogger logger, Uri pollUrl, Exception exception)
			{
				if (logger.IsEnabled((LogLevel)4))
				{
					__ErrorPollingCallback(logger, pollUrl, exception);
				}
			}

			public static void PollResponseReceived(ILogger logger, HttpResponseMessage response)
			{
				if (logger.IsEnabled((LogLevel)0))
				{
					PollResponseReceived(logger, (int)response.StatusCode, response.Content.Headers.ContentLength ?? (-1));
				}
			}

			[LoggerMessage(/*Could not decode attribute arguments.*/)]
			[GeneratedCode("Microsoft.Extensions.Logging.Generators", "7.0.7.1805")]
			private static void PollResponseReceived(ILogger logger, int statusCode, long contentLength)
			{
				__PollResponseReceivedCallback(logger, statusCode, contentLength, null);
			}

			[LoggerMessage(/*Could not decode attribute arguments.*/)]
			[GeneratedCode("Microsoft.Extensions.Logging.Generators", "7.0.7.1805")]
			public static void SendingDeleteRequest(ILogger logger, Uri pollUrl)
			{
				if (logger.IsEnabled((LogLevel)1))
				{
					__SendingDeleteRequestCallback(logger, pollUrl, null);
				}
			}

			[LoggerMessage(/*Could not decode attribute arguments.*/)]
			[GeneratedCode("Microsoft.Extensions.Logging.Generators", "7.0.7.1805")]
			public static void DeleteRequestAccepted(ILogger logger, Uri pollUrl)
			{
				if (logger.IsEnabled((LogLevel)1))
				{
					__DeleteRequestAcceptedCallback(logger, pollUrl, null);
				}
			}

			[LoggerMessage(/*Could not decode attribute arguments.*/)]
			[GeneratedCode("Microsoft.Extensions.Logging.Generators", "7.0.7.1805")]
			public static void ErrorSendingDeleteRequest(ILogger logger, Uri pollUrl, Exception ex)
			{
				if (logger.IsEnabled((LogLevel)4))
				{
					__ErrorSendingDeleteRequestCallback(logger, pollUrl, ex);
				}
			}

			[LoggerMessage(/*Could not decode attribute arguments.*/)]
			[GeneratedCode("Microsoft.Extensions.Logging.Generators", "7.0.7.1805")]
			public static void ConnectionAlreadyClosedSendingDeleteRequest(ILogger logger, Uri pollUrl)
			{
				if (logger.IsEnabled((LogLevel)1))
				{
					__ConnectionAlreadyClosedSendingDeleteRequestCallback(logger, pollUrl, null);
				}
			}
		}

		private readonly HttpClient _httpClient;

		private readonly ILogger _logger;

		private readonly HttpConnectionOptions _httpConnectionOptions;

		private IDuplexPipe _application;

		private IDuplexPipe _transport;

		private volatile Exception _error;

		private readonly CancellationTokenSource _transportCts = new CancellationTokenSource();

		internal Task Running { get; private set; } = Task.CompletedTask;

		public PipeReader Input => _transport.Input;

		public PipeWriter Output => _transport.Output;

		public LongPollingTransport(HttpClient httpClient, HttpConnectionOptions? httpConnectionOptions = null, ILoggerFactory? loggerFactory = null)
		{
			_httpClient = httpClient;
			_logger = (ILogger)(object)LoggerFactoryExtensions.CreateLogger<LongPollingTransport>((ILoggerFactory)(((object)loggerFactory) ?? ((object)NullLoggerFactory.Instance)));
			_httpConnectionOptions = httpConnectionOptions ?? new HttpConnectionOptions();
		}

		public async Task StartAsync(Uri url, TransferFormat transferFormat, CancellationToken cancellationToken = default(CancellationToken))
		{
			//IL_001e: Unknown result type (might be due to invalid IL or missing references)
			//IL_001f: Unknown result type (might be due to invalid IL or missing references)
			if ((int)transferFormat != 1 && (int)transferFormat != 2)
			{
				throw new ArgumentException($"The '{transferFormat}' transfer format is not supported by this transport.", "transferFormat");
			}
			Log.StartTransport(_logger, transferFormat);
			HttpRequestMessage request = new HttpRequestMessage(HttpMethod.Get, url)
			{
				Version = HttpVersion.Version20
			};
			using (HttpResponseMessage httpResponseMessage = await _httpClient.SendAsync(request, cancellationToken).ConfigureAwait(continueOnCapturedContext: false))
			{
				httpResponseMessage.EnsureSuccessStatusCode();
			}
			DuplexPipe.DuplexPipePair duplexPipePair = DuplexPipe.CreateConnectionPair(_httpConnectionOptions.TransportPipeOptions, _httpConnectionOptions.AppPipeOptions);
			_transport = duplexPipePair.Transport;
			_application = duplexPipePair.Application;
			Running = ProcessAsync(url);
		}

		private async Task ProcessAsync(Uri url)
		{
			Task receiving = Poll(url, _transportCts.Token);
			Task sending = SendUtils.SendMessages(url, _application, _httpClient, _logger);
			if (await Task.WhenAny(new Task[2] { receiving, sending }).ConfigureAwait(continueOnCapturedContext: false) == receiving)
			{
				_application.Input.CancelPendingRead();
				await sending.ConfigureAwait(continueOnCapturedContext: false);
				return;
			}
			_error = (sending.IsFaulted ? sending.Exception.InnerException : null);
			_transportCts.Cancel();
			_application.Output.CancelPendingFlush();
			await receiving.ConfigureAwait(continueOnCapturedContext: false);
			await SendDeleteRequest(url).ConfigureAwait(continueOnCapturedContext: false);
		}

		public async Task StopAsync()
		{
			Log.TransportStopping(_logger);
			if (_application != null)
			{
				_application.Input.CancelPendingRead();
				try
				{
					await Running.ConfigureAwait(continueOnCapturedContext: false);
				}
				catch (Exception exception)
				{
					Log.TransportStopped(_logger, exception);
					throw;
				}
				_transport.Output.Complete((Exception)null);
				_transport.Input.Complete((Exception)null);
				Log.TransportStopped(_logger, null);
			}
		}

		private async Task Poll(Uri pollUrl, CancellationToken cancellationToken)
		{
			Log.StartReceive(_logger);
			PipeWriterStream applicationStream = new PipeWriterStream(_application.Output);
			try
			{
				while (!cancellationToken.IsCancellationRequested)
				{
					HttpRequestMessage request = new HttpRequestMessage(HttpMethod.Get, pollUrl)
					{
						Version = HttpVersion.Version20
					};
					HttpResponseMessage httpResponseMessage;
					try
					{
						httpResponseMessage = await _httpClient.SendAsync(request, cancellationToken).ConfigureAwait(continueOnCapturedContext: false);
					}
					catch (OperationCanceledException)
					{
						continue;
					}
					catch (WebException ex2) when (!OperatingSystem.IsBrowser() && ex2.Status == WebExceptionStatus.RequestCanceled)
					{
						continue;
					}
					Log.PollResponseReceived(_logger, httpResponseMessage);
					httpResponseMessage.EnsureSuccessStatusCode();
					if (httpResponseMessage.StatusCode == HttpStatusCode.NoContent || cancellationToken.IsCancellationRequested)
					{
						Log.ClosingConnection(_logger);
						break;
					}
					Log.ReceivedMessages(_logger);
					await httpResponseMessage.Content.CopyToAsync(applicationStream).ConfigureAwait(continueOnCapturedContext: false);
					FlushResult val = await _application.Output.FlushAsync(cancellationToken).ConfigureAwait(continueOnCapturedContext: false);
					if (((FlushResult)(ref val)).IsCanceled || ((FlushResult)(ref val)).IsCompleted)
					{
						break;
					}
				}
			}
			catch (OperationCanceledException)
			{
				Log.ReceiveCanceled(_logger);
			}
			catch (Exception ex4)
			{
				Log.ErrorPolling(_logger, pollUrl, ex4);
				_error = ex4;
			}
			finally
			{
				_application.Output.Complete(_error);
				Log.ReceiveStopped(_logger);
			}
		}

		private async Task SendDeleteRequest(Uri url)
		{
			try
			{
				Log.SendingDeleteRequest(_logger, url);
				HttpRequestMessage request = new HttpRequestMessage(HttpMethod.Delete, url)
				{
					Version = HttpVersion.Version20
				};
				HttpResponseMessage httpResponseMessage = await _httpClient.SendAsync(request).ConfigureAwait(continueOnCapturedContext: false);
				if (httpResponseMessage.StatusCode == HttpStatusCode.NotFound)
				{
					Log.ConnectionAlreadyClosedSendingDeleteRequest(_logger, url);
					return;
				}
				httpResponseMessage.EnsureSuccessStatusCode();
				Log.DeleteRequestAccepted(_logger, url);
			}
			catch (Exception ex)
			{
				Log.ErrorSendingDeleteRequest(_logger, url, ex);
			}
		}
	}
	internal static class SendUtils
	{
		private sealed class ReadOnlySequenceContent : HttpContent
		{
			private readonly ReadOnlySequence<byte> _buffer;

			public ReadOnlySequenceContent(in ReadOnlySequence<byte> buffer)
			{
				_buffer = buffer;
			}

			protected override Task SerializeToStreamAsync(Stream stream, TransportContext context)
			{
				return stream.WriteAsync(_buffer).AsTask();
			}

			protected override bool TryComputeLength(out long length)
			{
				length = _buffer.Length;
				return true;
			}
		}

		private static class Log
		{
			[GeneratedCode("Microsoft.Extensions.Logging.Generators", "7.0.7.1805")]
			private static readonly Action<ILogger, Exception> __SendStartedCallback = LoggerMessage.Define((LogLevel)1, new EventId(100, "SendStarted"), "Starting the send loop.", new LogDefineOptions
			{
				SkipEnabledCheck = true
			});

			[GeneratedCode("Microsoft.Extensions.Logging.Generators", "7.0.7.1805")]
			private static readonly Action<ILogger, Exception> __SendCanceledCallback = LoggerMessage.Define((LogLevel)1, new EventId(102, "SendCanceled"), "Send loop canceled.", new LogDefineOptions
			{
				SkipEnabledCheck = true
			});

			[GeneratedCode("Microsoft.Extensions.Logging.Generators", "7.0.7.1805")]
			private static readonly Action<ILogger, Exception> __SendStoppedCallback = LoggerMessage.Define((LogLevel)1, new EventId(101, "SendStopped"), "Send loop stopped.", new LogDefineOptions
			{
				SkipEnabledCheck = true
			});

			[GeneratedCode("Microsoft.Extensions.Logging.Generators", "7.0.7.1805")]
			private static readonly Action<ILogger, long, Uri, Exception> __SendingMessagesCallback = LoggerMessage.Define<long, Uri>((LogLevel)1, new EventId(103, "SendingMessages"), "Sending {Count} bytes to the server using url: {Url}.", new LogDefineOptions
			{
				SkipEnabledCheck = true
			});

			[GeneratedCode("Microsoft.Extensions.Logging.Generators", "7.0.7.1805")]
			private static readonly Action<ILogger, Exception> __SentSuccessfullyCallback = LoggerMessage.Define((LogLevel)1, new EventId(104, "SentSuccessfully"), "Message(s) sent successfully.", new LogDefineOptions
			{
				SkipEnabledCheck = true
			});

			[GeneratedCode("Microsoft.Extensions.Logging.Generators", "7.0.7.1805")]
			private static readonly Action<ILogger, Exception> __NoMessagesCallback = LoggerMessage.Define((LogLevel)1, new EventId(105, "NoMessages"), "No messages in batch to send.", new LogDefineOptions
			{
				SkipEnabledCheck = true
			});

			[GeneratedCode("Microsoft.Extensions.Logging.Generators", "7.0.7.1805")]
			private static readonly Action<ILogger, Uri, Exception> __ErrorSendingCallback = LoggerMessage.Define<Uri>((LogLevel)4, new EventId(106, "ErrorSending"), "Error while sending to '{Url}'.", new LogDefineOptions
			{
				SkipEnabledCheck = true
			});

			[LoggerMessage(/*Could not decode attribute arguments.*/)]
			[GeneratedCode("Microsoft.Extensions.Logging.Generators", "7.0.7.1805")]
			public static void SendStarted(ILogger logger)
			{
				if (logger.IsEnabled((LogLevel)1))
				{
					__SendStartedCallback(logger, null);
				}
			}

			[LoggerMessage(/*Could not decode attribute arguments.*/)]
			[GeneratedCode("Microsoft.Extensions.Logging.Generators", "7.0.7.1805")]
			public static void SendCanceled(ILogger logger)
			{
				if (logger.IsEnabled((LogLevel)1))
				{
					__SendCanceledCallback(logger, null);
				}
			}

			[LoggerMessage(/*Could not decode attribute arguments.*/)]
			[GeneratedCode("Microsoft.Extensions.Logging.Generators", "7.0.7.1805")]
			public static void SendStopped(ILogger logger)
			{
				if (logger.IsEnabled((LogLevel)1))
				{
					__SendStoppedCallback(logger, null);
				}
			}

			[LoggerMessage(/*Could not decode attribute arguments.*/)]
			[GeneratedCode("Microsoft.Extensions.Logging.Generators", "7.0.7.1805")]
			public static void SendingMessages(ILogger logger, long count, Uri url)
			{
				if (logger.IsEnabled((LogLevel)1))
				{
					__SendingMessagesCallback(logger, count, url, null);
				}
			}

			[LoggerMessage(/*Could not decode attribute arguments.*/)]
			[GeneratedCode("Microsoft.Extensions.Logging.Generators", "7.0.7.1805")]
			public static void SentSuccessfully(ILogger logger)
			{
				if (logger.IsEnabled((LogLevel)1))
				{
					__SentSuccessfullyCallback(logger, null);
				}
			}

			[LoggerMessage(/*Could not decode attribute arguments.*/)]
			[GeneratedCode("Microsoft.Extensions.Logging.Generators", "7.0.7.1805")]
			public static void NoMessages(ILogger logger)
			{
				if (logger.IsEnabled((LogLevel)1))
				{
					__NoMessagesCallback(logger, null);
				}
			}

			[LoggerMessage(/*Could not decode attribute arguments.*/)]
			[GeneratedCode("Microsoft.Extensions.Logging.Generators", "7.0.7.1805")]
			public static void ErrorSending(ILogger logger, Uri url, Exception exception)
			{
				if (logger.IsEnabled((LogLevel)4))
				{
					__ErrorSendingCallback(logger, url, exception);
				}
			}
		}

		public static async Task SendMessages(Uri sendUrl, IDuplexPipe application, HttpClient httpClient, ILogger logger, CancellationToken cancellationToken = default(CancellationToken))
		{
			Log.SendStarted(logger);
			try
			{
				while (true)
				{
					ReadResult val = await application.Input.ReadAsync(cancellationToken).ConfigureAwait(continueOnCapturedContext: false);
					ReadOnlySequence<byte> buffer = ((ReadResult)(ref val)).Buffer;
					try
					{
						if (((ReadResult)(ref val)).IsCanceled)
						{
							Log.SendCanceled(logger);
							break;
						}
						if (!buffer.IsEmpty)
						{
							Log.SendingMessages(logger, buffer.Length, sendUrl);
							HttpRequestMessage httpRequestMessage = new HttpRequestMessage(HttpMethod.Post, sendUrl);
							httpRequestMessage.Version = HttpVersion.Version20;
							httpRequestMessage.Content = new ReadOnlySequenceContent(in buffer);
							using (HttpResponseMessage httpResponseMessage = await httpClient.SendAsync(httpRequestMessage, HttpCompletionOption.ResponseHeadersRead, cancellationToken).ConfigureAwait(continueOnCapturedContext: false))
							{
								httpResponseMessage.EnsureSuccessStatusCode();
							}
							Log.SentSuccessfully(logger);
							continue;
						}
						if (((ReadResult)(ref val)).IsCompleted)
						{
							break;
						}
						Log.NoMessages(logger);
						continue;
					}
					finally
					{
						application.Input.AdvanceTo(buffer.End);
					}
				}
			}
			catch (OperationCanceledException)
			{
				Log.SendCanceled(logger);
			}
			catch (Exception exception)
			{
				Log.ErrorSending(logger, sendUrl, exception);
				throw;
			}
			finally
			{
				application.Input.Complete((Exception)null);
			}
			Log.SendStopped(logger);
		}
	}
	internal sealed class ServerSentEventsMessageParser
	{
		public enum ParseResult
		{
			Completed,
			Incomplete
		}

		private enum InternalParseState
		{
			ReadMessagePayload,
			ReadEndOfMessage,
			Error
		}

		private const byte ByteCR = 13;

		private const byte ByteLF = 10;

		private const byte ByteColon = 58;

		private static readonly byte[] _newLine = Encoding.UTF8.GetBytes(Environment.NewLine);

		private InternalParseState _internalParserState;

		private readonly List<byte[]> _data = new List<byte[]>();

		private static ReadOnlySpan<byte> DataPrefix => "data: "u8;

		private static ReadOnlySpan<byte> SseLineEnding => "\r\n"u8;

		public ParseResult ParseMessage(ReadOnlySequence<byte> buffer, out SequencePosition consumed, out SequencePosition examined, out byte[]? message)
		{
			consumed = buffer.Start;
			examined = buffer.End;
			message = null;
			SequencePosition start = consumed;
			while (buffer.Length > 0)
			{
				SequencePosition? sequencePosition = buffer.PositionOf<byte>(10);
				ReadOnlySequence<byte> buffer2;
				if (sequencePosition.HasValue)
				{
					SequencePosition valueOrDefault = sequencePosition.GetValueOrDefault();
					valueOrDefault = buffer.GetPosition(1L, valueOrDefault);
					buffer2 = buffer.Slice(start, valueOrDefault);
					ReadOnlySpan<byte> line = ConvertBufferToSpan(in buffer2);
					buffer = buffer.Slice(line.Length);
					if (line.Length <= 1)
					{
						throw new FormatException("There was an error in the frame format");
					}
					if (line[0] == 58)
					{
						start = valueOrDefault;
						consumed = valueOrDefault;
						continue;
					}
					if (IsMessageEnd(line))
					{
						_internalParserState = InternalParseState.ReadEndOfMessage;
					}
					else
					{
						if (line[line.Length - SseLineEnding.Length] != 13)
						{
							throw new FormatException("Unexpected '\\n' in message. A '\\n' character can only be used as part of the newline sequence '\\r\\n'");
						}
						EnsureStartsWithDataPrefix(line);
					}
					byte[] array = Array.Empty<byte>();
					switch (_internalParserState)
					{
					case InternalParseState.ReadMessagePayload:
					{
						EnsureStartsWithDataPrefix(line);
						int length = line.Length - (DataPrefix.Length + SseLineEnding.Length);
						byte[] item = line.Slice(DataPrefix.Length, length).ToArray();
						_data.Add(item);
						start = valueOrDefault;
						consumed = valueOrDefault;
						break;
					}
					case InternalParseState.ReadEndOfMessage:
						if (_data.Count == 1)
						{
							array = _data[0];
						}
						else if (_data.Count > 1)
						{
							int num = 0;
							foreach (byte[] datum in _data)
							{
								num += datum.Length;
							}
							num += _newLine.Length * _data.Count;
							array = new byte[num - _newLine.Length];
							int num2 = 0;
							foreach (byte[] datum2 in _data)
							{
								datum2.CopyTo(array, num2);
								num2 += datum2.Length;
								if (num2 < array.Length)
								{
									_newLine.CopyTo(array, num2);
									num2 += _newLine.Length;
								}
							}
						}
						message = array;
						consumed = valueOrDefault;
						examined = consumed;
						return ParseResult.Completed;
					}
					if (buffer.Length > 0 && buffer.First.Span[0] == 13)
					{
						_internalParserState = InternalParseState.ReadEndOfMessage;
					}
					continue;
				}
				if (_internalParserState == InternalParseState.ReadEndOfMessage)
				{
					buffer2 = buffer.Slice(start, buffer.End);
					if (ConvertBufferToSpan(in buffer2).Length > 1)
					{
						throw new FormatException("Expected a \\r\\n frame ending");
					}
				}
				return ParseResult.Incomplete;
			}
			return ParseResult.Incomplete;
		}

		[MethodImpl(MethodImplOptions.AggressiveInlining)]
		private static ReadOnlySpan<byte> ConvertBufferToSpan(in ReadOnlySequence<byte> buffer)
		{
			if (buffer.IsSingleSegment)
			{
				return buffer.First.Span;
			}
			return BuffersExtensions.ToArray(in buffer);
		}

		public void Reset()
		{
			_internalParserState = InternalParseState.ReadMessagePayload;
			_data.Clear();
		}

		private static void EnsureStartsWithDataPrefix(ReadOnlySpan<byte> line)
		{
			if (!line.StartsWith(DataPrefix))
			{
				throw new FormatException("Expected the message prefix 'data: '");
			}
		}

		private static bool IsMessageEnd(ReadOnlySpan<byte> line)
		{
			if (line.Length == SseLineEnding.Length)
			{
				return line.SequenceEqual(SseLineEnding);
			}
			return false;
		}
	}
	internal sealed class ServerSentEventsTransport : ITransport, IDuplexPipe
	{
		private static class Log
		{
			[GeneratedCode("Microsoft.Extensions.Logging.Generators", "7.0.7.1805")]
			private static readonly Action<ILogger, TransferFormat, Exception> __StartTransportCallback = LoggerMessage.Define<TransferFormat>((LogLevel)2, new EventId(1, "StartTransport"), "Starting transport. Transfer mode: {TransferFormat}.", new LogDefineOptions
			{
				SkipEnabledCheck = true
			});

			[GeneratedCode("Microsoft.Extensions.Logging.Generators", "7.0.7.1805")]
			private static readonly Action<ILogger, Exception> __TransportStoppedCallback = LoggerMessage.Define((LogLevel)1, new EventId(2, "TransportStopped"), "Transport stopped.", new LogDefineOptions
			{
				SkipEnabledCheck = true
			});

			[GeneratedCode("Microsoft.Extensions.Logging.Generators", "7.0.7.1805")]
			private static readonly Action<ILogger, Exception> __StartReceiveCallback = LoggerMessage.Define((LogLevel)1, new EventId(3, "StartReceive"), "Starting receive loop.", new LogDefineOptions
			{
				SkipEnabledCheck = true
			});

			[GeneratedCode("Microsoft.Extensions.Logging.Generators", "7.0.7.1805")]
			private static readonly Action<ILogger, Exception> __TransportStoppingCallback = LoggerMessage.Define((LogLevel)2, new EventId(6, "TransportStopping"), "Transport is stopping.", new LogDefineOptions
			{
				SkipEnabledCheck = true
			});

			[GeneratedCode("Microsoft.Extensions.Logging.Generators", "7.0.7.1805")]
			private static readonly Action<ILogger, int, Exception> __MessageToApplicationCallback = LoggerMessage.Define<int>((LogLevel)1, new EventId(7, "MessageToApplication"), "Passing message to application. Payload size: {Count}.", new LogDefineOptions
			{
				SkipEnabledCheck = true
			});

			[GeneratedCode("Microsoft.Extensions.Logging.Generators", "7.0.7.1805")]
			private static readonly Action<ILogger, Exception> __ReceiveCanceledCallback = LoggerMessage.Define((LogLevel)1, new EventId(5, "ReceiveCanceled"), "Receive loop canceled.", new LogDefineOptions
			{
				SkipEnabledCheck = true
			});

			[GeneratedCode("Microsoft.Extensions.Logging.Generators", "7.0.7.1805")]
			private static readonly Action<ILogger, Exception> __ReceiveStoppedCallback = LoggerMessage.Define((LogLevel)1, new EventId(4, "ReceiveStopped"), "Receive loop stopped.", new LogDefineOptions
			{
				SkipEnabledCheck = true
			});

			[GeneratedCode("Microsoft.Extensions.Logging.Generators", "7.0.7.1805")]
			private static readonly Action<ILogger, Exception> __EventStreamEndedCallback = LoggerMessage.Define((LogLevel)1, new EventId(8, "EventStreamEnded"), "Server-Sent Event Stream ended.", new LogDefineOptions
			{
				SkipEnabledCheck = true
			});

			[GeneratedCode("Microsoft.Extensions.Logging.Generators", "7.0.7.1805")]
			private static readonly Action<ILogger, long, Exception> __ParsingSSECallback = LoggerMessage.Define<long>((LogLevel)1, new EventId(9, "ParsingSSE"), "Received {Count} bytes. Parsing SSE frame.", new LogDefineOptions
			{
				SkipEnabledCheck = true
			});

			[LoggerMessage(/*Could not decode attribute arguments.*/)]
			[GeneratedCode("Microsoft.Extensions.Logging.Generators", "7.0.7.1805")]
			public static void StartTransport(ILogger logger, TransferFormat transferFormat)
			{
				//IL_000f: Unknown result type (might be due to invalid IL or missing references)
				if (logger.IsEnabled((LogLevel)2))
				{
					__StartTransportCallback(logger, transferFormat, null);
				}
			}

			[LoggerMessage(/*Could not decode attribute arguments.*/)]
			[GeneratedCode("Microsoft.Extensions.Logging.Generators", "7.0.7.1805")]
			public static void TransportStopped(ILogger logger, Exception exception)
			{
				if (logger.IsEnabled((LogLevel)1))
				{
					__TransportStoppedCallback(logger, exception);
				}
			}

			[LoggerMessage(/*Could not decode attribute arguments.*/)]
			[GeneratedCode("Microsoft.Extensions.Logging.Generators", "7.0.7.1805")]
			public static void StartReceive(ILogger logger)
			{
				if (logger.IsEnabled((LogLevel)1))
				{
					__StartReceiveCallback(logger, null);
				}
			}

			[LoggerMessage(/*Could not decode attribute arguments.*/)]
			[GeneratedCode("Microsoft.Extensions.Logging.Generators", "7.0.7.1805")]
			public static void TransportStopping(ILogger logger)
			{
				if (logger.IsEnabled((LogLevel)2))
				{
					__TransportStoppingCallback(logger, null);
				}
			}

			[LoggerMessage(/*Could not decode attribute arguments.*/)]
			[GeneratedCode("Microsoft.Extensions.Logging.Generators", "7.0.7.1805")]
			public static void MessageToApplication(ILogger logger, int count)
			{
				if (logger.IsEnabled((LogLevel)1))
				{
					__MessageToApplicationCallback(logger, count, null);
				}
			}

			[LoggerMessage(/*Could not decode attribute arguments.*/)]
			[GeneratedCode("Microsoft.Extensions.Logging.Generators", "7.0.7.1805")]
			public static void ReceiveCanceled(ILogger logger)
			{
				if (logger.IsEnabled((LogLevel)1))
				{
					__ReceiveCanceledCallback(logger, null);
				}
			}

			[LoggerMessage(/*Could not decode attribute arguments.*/)]
			[GeneratedCode("Microsoft.Extensions.Logging.Generators", "7.0.7.1805")]
			public static void ReceiveStopped(ILogger logger)
			{
				if (logger.IsEnabled((LogLevel)1))
				{
					__ReceiveStoppedCallback(logger, null);
				}
			}

			[LoggerMessage(/*Could not decode attribute arguments.*/)]
			[GeneratedCode("Microsoft.Extensions.Logging.Generators", "7.0.7.1805")]
			public static void EventStreamEnded(ILogger logger)
			{
				if (logger.IsEnabled((LogLevel)1))
				{
					__EventStreamEndedCallback(logger, null);
				}
			}

			[LoggerMessage(/*Could not decode attribute arguments.*/)]
			[GeneratedCode("Microsoft.Extensions.Logging.Generators", "7.0.7.1805")]
			public static void ParsingSSE(ILogger logger, long count)
			{
				if (logger.IsEnabled((LogLevel)1))
				{
					__ParsingSSECallback(logger, count, null);
				}
			}
		}

		private readonly HttpClient _httpClient;

		private readonly ILogger _logger;

		private readonly HttpConnectionOptions _httpConnectionOptions;

		private volatile Exception _error;

		private readonly CancellationTokenSource _transportCts = new CancellationTokenSource();

		private readonly CancellationTokenSource _inputCts = new CancellationTokenSource();

		private readonly ServerSentEventsMessageParser _parser = new ServerSentEventsMessageParser();

		private IDuplexPipe _transport;

		private IDuplexPipe _application;

		internal Task Running { get; private set; } = Task.CompletedTask;

		public PipeReader Input => _transport.Input;

		public PipeWriter Output => _transport.Output;

		public ServerSentEventsTransport(HttpClient httpClient, HttpConnectionOptions? httpConnectionOptions = null, ILoggerFactory? loggerFactory = null)
		{
			if (httpClient == null)
			{
				throw new ArgumentNullException("httpClient");
			}
			_httpClient = httpClient;
			_logger = (ILogger)(object)LoggerFactoryExtensions.CreateLogger<ServerSentEventsTransport>((ILoggerFactory)(((object)loggerFactory) ?? ((object)NullLoggerFactory.Instance)));
			_httpConnectionOptions = httpConnectionOptions ?? new HttpConnectionOptions();
		}

		public async Task StartAsync(Uri url, TransferFormat transferFormat, CancellationToken cancellationToken = default(CancellationToken))
		{
			//IL_001e: Unknown result type (might be due to invalid IL or missing references)
			//IL_001f: Unknown result type (might be due to invalid IL or missing references)
			if ((int)transferFormat != 2)
			{
				throw new ArgumentException($"The '{transferFormat}' transfer format is not supported by this transport.", "transferFormat");
			}
			Log.StartTransport(_logger, transferFormat);
			HttpRequestMessage httpRequestMessage = new HttpRequestMessage(HttpMethod.Get, url)
			{
				Version = HttpVersion.Version20
			};
			httpRequestMessage.Headers.Accept.Add(new MediaTypeWithQualityHeaderValue("text/event-stream"));
			HttpResponseMessage response = null;
			try
			{
				response = await _httpClient.SendAsync(httpRequestMessage, HttpCompletionOption.ResponseHeadersRead, cancellationToken).ConfigureAwait(continueOnCapturedContext: false);
				response.EnsureSuccessStatusCode();
			}
			catch
			{
				response?.Dispose();
				Log.TransportStopping(_logger);
				throw;
			}
			DuplexPipe.DuplexPipePair duplexPipePair = DuplexPipe.CreateConnectionPair(_httpConnectionOptions.TransportPipeOptions, _httpConnectionOptions.AppPipeOptions);
			_transport = duplexPipePair.Transport;
			_application = duplexPipePair.Application;
			Running = ProcessAsync(url, response);
		}

		private async Task ProcessAsync(Uri url, HttpResponseMessage response)
		{
			Task receiving = ProcessEventStream(response, _transportCts.Token);
			Task sending = SendUtils.SendMessages(url, _application, _httpClient, _logger, _inputCts.Token);
			if (await Task.WhenAny(new Task[2] { receiving, sending }).ConfigureAwait(continueOnCapturedContext: false) == receiving)
			{
				_inputCts.Cancel();
				_application.Input.CancelPendingRead();
				await sending.ConfigureAwait(continueOnCapturedContext: false);
			}
			else
			{
				_error = (sending.IsFaulted ? sending.Exception.InnerException : null);
				_transportCts.Cancel();
				_application.Output.CancelPendingFlush();
				await receiving.ConfigureAwait(continueOnCapturedContext: false);
			}
		}

		private async Task ProcessEventStream(HttpResponseMessage response, CancellationToken cancellationToken)
		{
			Log.StartReceive(_logger);
			using (response)
			{
				using Stream stream = await response.Content.ReadAsStreamAsync().ConfigureAwait(continueOnCapturedContext: false);
				PipeReader reader = PipeReader.Create(stream, (StreamPipeReaderOptions)null);
				using (cancellationToken.Register(CancelReader, reader))
				{
					int num;
					_ = num - 1;
					_ = 1;
					try
					{
						while (true)
						{
							ReadResult val = await reader.ReadAsync(default(CancellationToken)).ConfigureAwait(continueOnCapturedContext: false);
							ReadOnlySequence<byte> buffer = ((ReadResult)(ref val)).Buffer;
							SequencePosition consumed = buffer.Start;
							SequencePosition examined = buffer.End;
							try
							{
								if (((ReadResult)(ref val)).IsCanceled)
								{
									Log.ReceiveCanceled(_logger);
									break;
								}
								if (!buffer.IsEmpty)
								{
									Log.ParsingSSE(_logger, buffer.Length);
									byte[] message;
									ServerSentEventsMessageParser.ParseResult parseResult = _parser.ParseMessage(buffer, out consumed, out examined, out message);
									FlushResult val2 = default(FlushResult);
									switch (parseResult)
									{
									case ServerSentEventsMessageParser.ParseResult.Completed:
										Log.MessageToApplication(_logger, message.Length);
										val2 = await _application.Output.WriteAsync((ReadOnlyMemory<byte>)message, default(CancellationToken)).ConfigureAwait(continueOnCapturedContext: false);
										_parser.Reset();
										break;
									case ServerSentEventsMessageParser.ParseResult.Incomplete:
										if (((ReadResult)(ref val)).IsCompleted)
										{
											throw new FormatException("Incomplete message.");
										}
										break;
									}
									if (((FlushResult)(ref val2)).IsCanceled || ((FlushResult)(ref val2)).IsCompleted)
									{
										Log.EventStreamEnded(_logger);
										break;
									}
								}
								else if (((ReadResult)(ref val)).IsCompleted)
								{
									break;
								}
							}
							finally
							{
								reader.AdvanceTo(consumed, examined);
							}
						}
					}
					catch (Exception error)
					{
						_error = error;
					}
					finally
					{
						_application.Output.Complete(_error);
						Log.ReceiveStopped(_logger);
						reader.Complete((Exception)null);
					}
				}
			}
			static void CancelReader(object? state)
			{
				//IL_0001: Unknown result type (might be due to invalid IL or missing references)
				((PipeReader)state).CancelPendingRead();
			}
		}

		public async Task StopAsync()
		{
			Log.TransportStopping(_logger);
			if (_application != null)
			{
				_transport.Output.Complete((Exception)null);
				_transport.Input.Complete((Exception)null);
				_application.Input.CancelPendingRead();
				try
				{
					await Running.ConfigureAwait(continueOnCapturedContext: false);
				}
				catch (Exception exception)
				{
					Log.TransportStopped(_logger, exception);
					throw;
				}
				Log.TransportStopped(_logger, null);
			}
		}
	}
	internal static class Utils
	{
		public static Uri AppendPath(Uri url, string path)
		{
			UriBuilder uriBuilder = new UriBuilder(url);
			if (!uriBuilder.Path.EndsWith("/", StringComparison.Ordinal))
			{
				uriBuilder.Path += "/";
			}
			uriBuilder.Path += path;
			return uriBuilder.Uri;
		}

		internal static Uri AppendQueryString(Uri url, string qs)
		{
			if (string.IsNullOrEmpty(qs))
			{
				return url;
			}
			UriBuilder uriBuilder = new UriBuilder(url);
			string text = uriBuilder.Query;
			if (!string.IsNullOrEmpty(uriBuilder.Query))
			{
				text += "&";
			}
			text += qs;
			if (text.Length > 0 && text[0] == '?')
			{
				text = text.Substring(1);
			}
			uriBuilder.Query = text;
			return uriBuilder.Uri;
		}
	}
	internal sealed class WebSocketsTransport : ITransport, IDuplexPipe
	{
		private static class Log
		{
			[GeneratedCode("Microsoft.Extensions.Logging.Generators", "7.0.7.1805")]
			private static readonly Action<ILogger, TransferFormat, Uri, Exception> __StartTransportCallback = LoggerMessage.Define<TransferFormat, Uri>((LogLevel)2, new EventId(1, "StartTransport"), "Starting transport. Transfer mode: {TransferFormat}. Url: '{WebSocketUrl}'.", new LogDefineOptions
			{
				SkipEnabledCheck = true
			});

			[GeneratedCode("Microsoft.Extensions.Logging.Generators", "7.0.7.1805")]
			private static readonly Action<ILogger, Exception> __TransportStoppedCallback = LoggerMessage.Define((LogLevel)1, new EventId(2, "TransportStopped"), "Transport stopped.", new LogDefineOptions
			{
				SkipEnabledCheck = true
			});

			[GeneratedCode("Microsoft.Extensions.Logging.Generators", "7.0.7.1805")]
			private static readonly Action<ILogger, Exception> __StartReceiveCallback = LoggerMessage.Define((LogLevel)1, new EventId(3, "StartReceive"), "Starting receive loop.", new LogDefineOptions
			{
				SkipEnabledCheck = true
			});

			[GeneratedCode("Microsoft.Extensions.Logging.Generators", "7.0.7.1805")]
			private static readonly Action<ILogger, Exception> __TransportStoppingCallback = LoggerMessage.Define((LogLevel)2, new EventId(6, "TransportStopping"), "Transport is stopping.", new LogDefineOptions
			{
				SkipEnabledCheck = true
			});

			[GeneratedCode("Microsoft.Extensions.Logging.Generators", "7.0.7.1805")]
			private static readonly Action<ILogger, int, Exception> __MessageToAppCallback = LoggerMessage.Define<int>((LogLevel)1, new EventId(10, "MessageToApp"), "Passing message to application. Payload size: {Count}.", new LogDefineOptions
			{
				SkipEnabledCheck = true
			});

			[GeneratedCode("Microsoft.Extensions.Logging.Generators", "7.0.7.1805")]
			private static readonly Action<ILogger, Exception> __ReceiveCanceledCallback = LoggerMessage.Define((LogLevel)1, new EventId(5, "ReceiveCanceled"), "Receive loop canceled.", new LogDefineOptions
			{
				SkipEnabledCheck = true
			});

			[GeneratedCode("Microsoft.Extensions.Logging.Generators", "7.0.7.1805")]
			private static readonly Action<ILogger, Exception> __ReceiveStoppedCallback = LoggerMessage.Define((LogLevel)1, new EventId(4, "ReceiveStopped"), "Receive loop stopped.", new LogDefineOptions
			{
				SkipEnabledCheck = true
			});

			[GeneratedCode("Microsoft.Extensions.Logging.Generators", "7.0.7.1805")]
			private static readonly Action<ILogger, Exception> __SendStartedCallback = LoggerMessage.Define((LogLevel)1, new EventId(7, "SendStarted"), "Starting the send loop.", new LogDefineOptions
			{
				SkipEnabledCheck = true
			});

			[GeneratedCode("Microsoft.Extensions.Logging.Generators", "7.0.7.1805")]
			private static readonly Action<ILogger, Exception> __SendCanceledCallback = LoggerMessage.Define((LogLevel)1, new EventId(9, "SendCanceled"), "Send loop canceled.", new LogDefineOptions
			{
				SkipEnabledCheck = true
			});

			[GeneratedCode("Microsoft.Extensions.Logging.Generators", "7.0.7.1805")]
			private static readonly Action<ILogger, Exception> __SendStoppedCallback = LoggerMessage.Define((LogLevel)1, new EventId(8, "SendStopped"), "Send loop stopped.", new LogDefineOptions
			{
				SkipEnabledCheck = true
			});

			[GeneratedCode("Microsoft.Extensions.Logging.Generators", "7.0.7.1805")]
			private static readonly Action<ILogger, WebSocketCloseStatus?, Exception> __WebSocketClosedCallback = LoggerMessage.Define<WebSocketCloseStatus?>((LogLevel)2, new EventId(11, "WebSocketClosed"), "WebSocket closed by the server. Close status {CloseStatus}.", new LogDefineOptions
			{
				SkipEnabledCheck = true
			});

			[GeneratedCode("Microsoft.Extensions.Logging.Generators", "7.0.7.1805")]
			private static readonly Action<ILogger, WebSocketMessageType, int, bool, Exception> __MessageReceivedCallback = LoggerMessage.Define<WebSocketMessageType, int, bool>((LogLevel)1, new EventId(12, "MessageReceived"), "Message received. Type: {MessageType}, size: {Count}, EndOfMessage: {EndOfMessage}.", new LogDefineOptions
			{
				SkipEnabledCheck = true
			});

			[GeneratedCode("Microsoft.Extensions.Logging.Generators", "7.0.7.1805")]
			private static readonly Action<ILogger, long, Exception> __ReceivedFromAppCallback = LoggerMessage.Define<long>((LogLevel)1, new EventId(13, "ReceivedFromApp"), "Received message from application. Payload size: {Count}.", new LogDefineOptions
			{
				SkipEnabledCheck = true
			});

			[GeneratedCode("Microsoft.Extensions.Logging.Generators", "7.0.7.1805")]
			private static readonly Action<ILogger, Exception> __SendMessageCanceledCallback = LoggerMessage.Define((LogLevel)2, new EventId(14, "SendMessageCanceled"), "Sending a message canceled.", new LogDefineOptions
			{
				SkipEnabledCheck = true
			});

			[GeneratedCode("Microsoft.Extensions.Logging.Generators", "7.0.7.1805")]
			private static readonly Action<ILogger, Exception> __ErrorSendingMessageCallback = LoggerMessage.Define((LogLevel)4, new EventId(15, "ErrorSendingMessage"), "Error while sending a message.", new LogDefineOptions
			{
				SkipEnabledCheck = true
			});

			[GeneratedCode("Microsoft.Extensions.Logging.Generators", "7.0.7.1805")]
			private static readonly Action<ILogger, Exception> __ClosingWebSocketCallback = LoggerMessage.Define((LogLevel)2, new EventId(16, "ClosingWebSocket"), "Closing WebSocket.", new LogDefineOptions
			{
				SkipEnabledCheck = true
			});

			[GeneratedCode("Microsoft.Extensions.Logging.Generators", "7.0.7.1805")]
			private static readonly Action<ILogger, Exception> __ClosingWebSocketFailedCallback = LoggerMessage.Define((LogLevel)1, new EventId(17, "ClosingWebSocketFailed"), "Closing webSocket failed.", new LogDefineOptions
			{
				SkipEnabledCheck = true
			});

			[GeneratedCode("Microsoft.Extensions.Logging.Generators", "7.0.7.1805")]
			private static readonly Action<ILogger, Exception> __CancelMessageCallback = LoggerMessage.Define((LogLevel)1, new EventId(18, "CancelMessage"), "Canceled passing message to application.", new LogDefineOptions
			{
				SkipEnabledCheck = true
			});

			[GeneratedCode("Microsoft.Extensions.Logging.Generators", "7.0.7.1805")]
			private static readonly Action<ILogger, Exception> __StartedTransportCallback = LoggerMessage.Define((LogLevel)1, new EventId(19, "StartedTransport"), "Started transport.", new LogDefineOptions
			{
				SkipEnabledCheck = true
			});

			[GeneratedCode("Microsoft.Extensions.Logging.Generators", "7.0.7.1805")]
			private static readonly Action<ILogger, Exception> __HeadersNotSupportedCallback = LoggerMessage.Define((LogLevel)3, new EventId(20, "HeadersNotSupported"), "Configuring request headers using HttpConnectionOptions.Headers is not supported when using websockets transport on the browser platform.", new LogDefineOptions
			{
				SkipEnabledCheck = true
			});

			[LoggerMessage(/*Could not decode attribute arguments.*/)]
			[GeneratedCode("Microsoft.Extensions.Logging.Generators", "7.0.7.1805")]
			public static void StartTransport(ILogger logger, TransferFormat transferFormat, Uri webSocketUrl)
			{
				//IL_000f: Unknown result type (might be due to invalid IL or missing references)
				if (logger.IsEnabled((LogLevel)2))
				{
					__StartTransportCallback(logger, transferFormat, webSocketUrl, null);
				}
			}

			[LoggerMessage(/*Could not decode attribute arguments.*/)]
			[GeneratedCode("Microsoft.Extensions.Logging.Generators", "7.0.7.1805")]
			public static void TransportStopped(ILogger logger, Exception exception)
			{
				if (logger.IsEnabled((LogLevel)1))
				{
					__TransportStoppedCallback(logger, exception);
				}
			}

			[LoggerMessage(/*Could not decode attribute arguments.*/)]
			[GeneratedCode("Microsoft.Extensions.Logging.Generators", "7.0.7.1805")]
			public static void StartReceive(ILogger logger)
			{
				if (logger.IsEnabled((LogLevel)1))
				{
					__StartReceiveCallback(logger, null);
				}
			}

			[LoggerMessage(/*Could not decode attribute arguments.*/)]
			[GeneratedCode("Microsoft.Extensions.Logging.Generators", "7.0.7.1805")]
			public static void TransportStopping(ILogger logger)
			{
				if (logger.IsEnabled((LogLevel)2))
				{
					__TransportStoppingCallback(logger, null);
				}
			}

			[LoggerMessage(/*Could not decode attribute arguments.*/)]
			[GeneratedCode("Microsoft.Extensions.Logging.Generators", "7.0.7.1805")]
			public static void MessageToApp(ILogger logger, int count)
			{
				if (logger.IsEnabled((LogLevel)1))
				{
					__MessageToAppCallback(logger, count, null);
				}
			}

			[LoggerMessage(/*Could not decode attribute arguments.*/)]
			[GeneratedCode("Microsoft.Extensions.Logging.Generators", "7.0.7.1805")]
			public static void ReceiveCanceled(ILogger logger)
			{
				if (logger.IsEnabled((LogLevel)1))
				{
					__ReceiveCanceledCallback(logger, null);
				}
			}

			[LoggerMessage(/*Could not decode attribute arguments.*/)]
			[GeneratedCode("Microsoft.Extensions.Logging.Generators", "7.0.7.1805")]
			public static void ReceiveStopped(ILogger logger)
			{
				if (logger.IsEnabled((LogLevel)1))
				{
					__ReceiveStoppedCallback(logger, null);
				}
			}

			[LoggerMessage(/*Could not decode attribute arguments.*/)]
			[GeneratedCode("Microsoft.Extensions.Logging.Generators", "7.0.7.1805")]
			public static void SendStarted(ILogger logger)
			{
				if (logger.IsEnabled((LogLevel)1))
				{
					__SendStartedCallback(logger, null);
				}
			}

			[LoggerMessage(/*Could not decode attribute arguments.*/)]
			[GeneratedCode("Microsoft.Extensions.Logging.Generators", "7.0.7.1805")]
			public static void SendCanceled(ILogger logger)
			{
				if (logger.IsEnabled((LogLevel)1))
				{
					__SendCanceledCallback(logger, null);
				}
			}

			[LoggerMessage(/*Could not decode attribute arguments.*/)]
			[GeneratedCode("Microsoft.Extensions.Logging.Generators", "7.0.7.1805")]
			public static void SendStopped(ILogger logger)
			{
				if (logger.IsEnabled((LogLevel)1))
				{
					__SendStoppedCallback(logger, null);
				}
			}

			[LoggerMessage(/*Could not decode attribute arguments.*/)]
			[GeneratedCode("Microsoft.Extensions.Logging.Generators", "7.0.7.1805")]
			public static void WebSocketClosed(ILogger logger, WebSocketCloseStatus? closeStatus)
			{
				if (logger.IsEnabled((LogLevel)2))
				{
					__WebSocketClosedCallback(logger, closeStatus, null);
				}
			}

			[LoggerMessage(/*Could not decode attribute arguments.*/)]
			[GeneratedCode("Microsoft.Extensions.Logging.Generators", "7.0.7.1805")]
			public static void MessageReceived(ILogger logger, WebSocketMessageType messageType, int count, bool endOfMessage)
			{
				if (logger.IsEnabled((LogLevel)1))
				{
					__MessageReceivedCallback(logger, messageType, count, endOfMessage, null);
				}
			}

			[LoggerMessage(/*Could not decode attribute arguments.*/)]
			[GeneratedCode("Microsoft.Extensions.Logging.Generators", "7.0.7.1805")]
			public static void ReceivedFromApp(ILogger logger, long count)
			{
				if (logger.IsEnabled((LogLevel)1))
				{
					__ReceivedFromAppCallback(logger, count, null);
				}
			}

			[LoggerMessage(/*Could not decode attribute arguments.*/)]
			[GeneratedCode("Microsoft.Extensions.Logging.Generators", "7.0.7.1805")]
			public static void SendMessageCanceled(ILogger logger)
			{
				if (logger.IsEnabled((LogLevel)2))
				{
					__SendMessageCanceledCallback(logger, null);
				}
			}

			[LoggerMessage(/*Could not decode attribute arguments.*/)]
			[GeneratedCode("Microsoft.Extensions.Logging.Generators", "7.0.7.1805")]
			public static void ErrorSendingMessage(ILogger logger, Exception exception)
			{
				if (logger.IsEnabled((LogLevel)4))
				{
					__ErrorSendingMessageCallback(logger, exception);
				}
			}

			[LoggerMessage(/*Could not decode attribute arguments.*/)]
			[GeneratedCode("Microsoft.Extensions.Logging.Generators", "7.0.7.1805")]
			public static void ClosingWebSocket(ILogger logger)
			{
				if (logger.IsEnabled((LogLevel)2))
				{
					__ClosingWebSocketCallback(logger, null);
				}
			}

			[LoggerMessage(/*Could not decode attribute arguments.*/)]
			[GeneratedCode("Microsoft.Extensions.Logging.Generators", "7.0.7.1805")]
			public static void ClosingWebSocketFailed(ILogger logger, Exception exception)
			{
				if (logger.IsEnabled((LogLevel)1))
				{
					__ClosingWebSocketFailedCallback(logger, exception);
				}
			}

			[LoggerMessage(/*Could not decode attribute arguments.*/)]
			[GeneratedCode("Microsoft.Extensions.Logging.Generators", "7.0.7.1805")]
			public static void CancelMessage(ILogger logger)
			{
				if (logger.IsEnabled((LogLevel)1))
				{
					__CancelMessageCallback(logger, null);
				}
			}

			[LoggerMessage(/*Could not decode attribute arguments.*/)]
			[GeneratedCode("Microsoft.Extensions.Logging.Generators", "7.0.7.1805")]
			public static void StartedTransport(ILogger logger)
			{
				if (logger.IsEnabled((LogLevel)1))
				{
					__StartedTransportCallback(logger, null);
				}
			}

			[LoggerMessage(/*Could not decode attribute arguments.*/)]
			[GeneratedCode("Microsoft.Extensions.Logging.Generators", "7.0.7.1805")]
			public static void HeadersNotSupported(ILogger logger)
			{
				if (logger.IsEnabled((LogLevel)3))
				{
					__HeadersNotSupportedCallback(logger, null);
				}
			}
		}

		private WebSocket _webSocket;

		private IDuplexPipe _application;

		private WebSocketMessageType _webSocketMessageType;

		private readonly ILogger _logger;

		private readonly TimeSpan _closeTimeout;

		private volatile bool _aborted;

		private readonly HttpConnectionOptions _httpConnectionOptions;

		private readonly HttpClient _httpClient;

		private readonly CancellationTokenSource _stopCts = new CancellationTokenSource();

		private IDuplexPipe _transport;

		internal Task Running { get; private set; } = Task.CompletedTask;

		public PipeReader Input => _transport.Input;

		public PipeWriter Output => _transport.Output;

		public WebSocketsTransport(HttpConnectionOptions httpConnectionOptions, ILoggerFactory loggerFactory, Func<Task<string?>> accessTokenProvider, HttpClient? httpClient)
		{
			_logger = (ILogger)(object)LoggerFactoryExtensions.CreateLogger<WebSocketsTransport>((ILoggerFactory)(((object)loggerFactory) ?? ((object)NullLoggerFactory.Instance)));
			_httpConnectionOptions = httpConnectionOptions ?? new HttpConnectionOptions();
			_closeTimeout = _httpConnectionOptions.CloseTimeout;
			_httpConnectionOptions.AccessTokenProvider = accessTokenProvider;
			_httpClient = httpClient;
		}

		private async ValueTask<WebSocket> DefaultWebSocketFactory(WebSocketConnectionContext context, CancellationToken cancellationToken)
		{
			ClientWebSocket webSocket = new ClientWebSocket();
			Uri url = context.Uri;
			bool flag = OperatingSystem.IsBrowser();
			if (!flag)
			{
				webSocket.Options.SetRequestHeader("User-Agent", Constants.UserAgentHeader.ToString());
				webSocket.Options.SetRequestHeader("X-Requested-With", "XMLHttpRequest");
			}
			if (context.Options != null)
			{
				if (context.Options.Headers.Count > 0)
				{
					if (flag)
					{
						Log.HeadersNotSupported(_logger);
					}
					else
					{
						foreach (KeyValuePair<string, string> header in context.Options.Headers)
						{
							webSocket.Options.SetRequestHeader(header.Key, header.Value);
						}
					}
				}
				if (!flag)
				{
					if (context.Options.Cookies != null)
					{
						webSocket.Options.Cookies = context.Options.Cookies;
					}
					X509CertificateCollection clientCertificates = context.Options.ClientCertificates;
					if (clientCertificates != null && clientCertificates.Count > 0)
					{
						webSocket.Options.ClientCertificates.AddRange(context.Options.ClientCertificates);
					}
					if (context.Options.Credentials != null)
					{
						webSocket.Options.Credentials = context.Options.Credentials;
					}
					_ = webSocket.Options.Proxy;
					if (context.Options.Proxy != null)
					{
						webSocket.Options.Proxy = context.Options.Proxy;
					}
					if (context.Options.UseDefaultCredentials.HasValue)
					{
						webSocket.Options.UseDefaultCredentials = context.Options.UseDefaultCredentials.Value;
					}
					context.Options.WebSocketConfiguration?.Invoke(webSocket.Options);
				}
			}
			if (_httpConnectionOptions.AccessTokenProvider != null)
			{
				string text = await _httpConnectionOptions.AccessTokenProvider().ConfigureAwait(continueOnCapturedContext: false);
				if (!string.IsNullOrWhiteSpace(text))
				{
					if (OperatingSystem.IsBrowser())
					{
						string text2 = ((TextEncoder)UrlEncoder.Default).Encode(text);
						text2 = "access_token=" + text2;
						url = Utils.AppendQueryString(url, text2);
					}
					else
					{
						webSocket.Options.SetRequestHeader("Authorization", "Bearer " + text);
					}
				}
			}
			try
			{
				await webSocket.ConnectAsync(url, cancellationToken).ConfigureAwait(continueOnCapturedContext: false);
				return webSocket;
			}
			catch
			{
				webSocket.Dispose();
				throw;
			}
		}

		public async Task StartAsync(Uri url, TransferFormat transferFormat, CancellationToken cancellationToken = default(CancellationToken))
		{
			//IL_001e: Unknown result type (might be due to invalid IL or missing references)
			//IL_001f: Unknown result type (might be due to invalid IL or missing references)
			if (url == null)
			{
				throw new ArgumentNullException("url");
			}
			if ((int)transferFormat != 1 && (int)transferFormat != 2)
			{
				throw new ArgumentException($"The '{transferFormat}' transfer format is not supported by this transport.", "transferFormat");
			}
			_webSocketMessageType = (((int)transferFormat == 1) ? WebSocketMessageType.Binary : WebSocketMessageType.Text);
			Uri uri = ResolveWebSocketsUrl(url);
			Log.StartTransport(_logger, transferFormat, uri);
			WebSocketConnectionContext arg = new WebSocketConnectionContext(uri, _httpConnectionOptions);
			_webSocket = await (_httpConnectionOptions.WebSocketFactory ?? new Func<WebSocketConnectionContext, CancellationToken, ValueTask<WebSocket>>(DefaultWebSocketFactory))(arg, cancellationToken).ConfigureAwait(continueOnCapturedContext: false);
			if (_webSocket == null)
			{
				throw new InvalidOperationException("Configured WebSocketFactory did not return a value.");
			}
			Log.StartedTransport(_logger);
			DuplexPipe.DuplexPipePair duplexPipePair = DuplexPipe.CreateConnectionPair(_httpConnectionOptions.TransportPipeOptions, _httpConnectionOptions.AppPipeOptions);
			_transport = duplexPipePair.Transport;
			_application = duplexPipePair.Application;
			Running = ProcessSocketAsync(_webSocket);
		}

		private async Task ProcessSocketAsync(WebSocket socket)
		{
			using (socket)
			{
				Task receiving = StartReceiving(socket);
				Task sending = StartSending(socket);
				Task obj = await Task.WhenAny(new Task[2] { receiving, sending }).ConfigureAwait(continueOnCapturedContext: false);
				_stopCts.CancelAfter(_closeTimeout);
				if (obj == receiving)
				{
					_application.Input.CancelPendingRead();
					if (await Task.WhenAny(new Task[2]
					{
						sending,
						Task.Delay(_closeTimeout, _stopCts.Token)
					}).ConfigureAwait(continueOnCapturedContext: false) != sending)
					{
						_aborted = true;
						socket.Abort();
					}
				}
				else
				{
					_aborted = true;
					socket.Abort();
					_application.Output.CancelPendingFlush();
				}
			}
		}

		private async Task StartReceiving(WebSocket socket)
		{
			_ = 2;
			try
			{
				FlushResult val3;
				do
				{
					ValueWebSocketReceiveResult val = await socket.ReceiveAsync(Memory<byte>.Empty, _stopCts.Token).ConfigureAwait(continueOnCapturedContext: false);
					if (((ValueWebSocketReceiveResult)(ref val)).MessageType == WebSocketMessageType.Close)
					{
						Log.WebSocketClosed(_logger, socket.CloseStatus);
						if (socket.CloseStatus != WebSocketCloseStatus.NormalClosure)
						{
							throw new InvalidOperationException($"Websocket closed with error: {socket.CloseStatus}.");
						}
						break;
					}
					Memory<byte> memory = _application.Output.GetMemory(0);
					ValueWebSocketReceiveResult val2 = await socket.ReceiveAsync(memory, _stopCts.Token).ConfigureAwait(continueOnCapturedContext: false);
					if (((ValueWebSocketReceiveResult)(ref val2)).MessageType == WebSocketMessageType.Close)
					{
						Log.WebSocketClosed(_logger, socket.CloseStatus);
						if (socket.CloseStatus != WebSocketCloseStatus.NormalClosure)
						{
							throw new InvalidOperationException($"Websocket closed with error: {socket.CloseStatus}.");
						}
						break;
					}
					Log.MessageReceived(_logger, ((ValueWebSocketReceiveResult)(ref val2)).MessageType, ((ValueWebSocketReceiveResult)(ref val2)).Count, ((ValueWebSocketReceiveResult)(ref val2)).EndOfMessage);
					_application.Output.Advance(((ValueWebSocketReceiveResult)(ref val2)).Count);
					val3 = await _application.Output.FlushAsync(default(CancellationToken)).ConfigureAwait(continueOnCapturedContext: false);
				}
				while (!((FlushResult)(ref val3)).IsCanceled && !((FlushResult)(ref val3)).IsCompleted);
			}
			catch (OperationCanceledException)
			{
				Log.ReceiveCanceled(_logger);
			}
			catch (Exception ex2)
			{
				if (!_aborted)
				{
					_application.Output.Complete(ex2);
				}
			}
			finally
			{
				_application.Output.Complete((Exception)null);
				Log.ReceiveStopped(_logger);
			}
		}

		private async Task StartSending(WebSocket socket)
		{
			Exception error = null;
			try
			{
				_ = 1;
				try
				{
					while (true)
					{
						ReadResult val = await _application.Input.ReadAsync(default(CancellationToken)).ConfigureAwait(continueOnCapturedContext: false);
						ReadOnlySequence<byte> buffer = ((ReadResult)(ref val)).Buffer;
						try
						{
							if (((ReadResult)(ref val)).IsCanceled)
							{
								break;
							}
							if (!buffer.IsEmpty)
							{
								try
								{
									Log.ReceivedFromApp(_logger, buffer.Length);
									if (WebSocketCanSend(socket))
									{
										await socket.SendAsync(buffer, _webSocketMessageType, _stopCts.Token).ConfigureAwait(continueOnCapturedContext: false);
										continue;
									}
								}
								catch (Exception exception)
								{
									if (!_aborted)
									{
										Log.ErrorSendingMessage(_logger, exception);
									}
								}
							}
							else if (!((ReadResult)(ref val)).IsCompleted)
							{
								continue;
							}
						}
						finally
						{
							_application.Input.AdvanceTo(buffer.End);
						}
						break;
					}
				}
				catch (Exception ex)
				{
					error = ex;
				}
			}
			finally
			{
				if (WebSocketCanSend(socket))
				{
					try
					{
						await socket.CloseOutputAsync((error != null) ? WebSocketCloseStatus.InternalServerError : WebSocketCloseStatus.NormalClosure, "", _stopCts.Token).ConfigureAwait(continueOnCapturedContext: false);
					}
					catch (Exception exception2)
					{
						Log.ClosingWebSocketFailed(_logger, exception2);
					}
				}
				_application.Input.Complete((Exception)null);
				Log.SendStopped(_logger);
			}
		}

		private static bool WebSocketCanSend(WebSocket ws)
		{
			if (ws.State != WebSocketState.Aborted && ws.State != WebSocketState.Closed)
			{
				return ws.State != WebSocketState.CloseSent;
			}
			return false;
		}

		private static Uri ResolveWebSocketsUrl(Uri url)
		{
			UriBuilder uriBuilder = new UriBuilder(url);
			if (url.Scheme == "http")
			{
				uriBuilder.Scheme = "ws";
			}
			else if (url.Scheme == "https")
			{
				uriBuilder.Scheme = "wss";
			}
			return uriBuilder.Uri;
		}

		public async Task StopAsync()
		{
			Log.TransportStopping(_logger);
			if (_application == null)
			{
				return;
			}
			_transport.Output.Complete((Exception)null);
			_transport.Input.Complete((Exception)null);
			_application.Input.CancelPendingRead();
			_stopCts.CancelAfter(_closeTimeout);
			try
			{
				await Running.ConfigureAwait(continueOnCapturedContext: false);
			}
			catch (Exception exception)
			{
				Log.TransportStopped(_logger, exception);
				return;
			}
			finally
			{
				_webSocket?.Dispose();
				_stopCts.Dispose();
			}
			Log.TransportStopped(_logger, null);
		}
	}
}
