.class public abstract Lcom/google/android/gms/internal/measurement/zzjw;
.super Lcom/google/android/gms/internal/measurement/zzjz;
.source "com.google.android.gms:play-services-measurement-base@@19.0.1"

# interfaces
.implements Lcom/google/android/gms/internal/measurement/zzlh;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<MessageType:",
        "Lcom/google/android/gms/internal/measurement/zzjw<",
        "TMessageType;TBuilderType;>;BuilderType:",
        "Ljava/lang/Object;",
        ">",
        "Lcom/google/android/gms/internal/measurement/zzjz<",
        "TMessageType;TBuilderType;>;",
        "Lcom/google/android/gms/internal/measurement/zzlh;"
    }
.end annotation


# instance fields
.field protected final zza:Lcom/google/android/gms/internal/measurement/zzjq;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/google/android/gms/internal/measurement/zzjz;-><init>()V

    .line 2
    invoke-static {}, Lcom/google/android/gms/internal/measurement/zzjq;->zza()Lcom/google/android/gms/internal/measurement/zzjq;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/gms/internal/measurement/zzjw;->zza:Lcom/google/android/gms/internal/measurement/zzjq;

    return-void
.end method
