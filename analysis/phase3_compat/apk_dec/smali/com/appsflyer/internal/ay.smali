.class public final Lcom/appsflyer/internal/ay;
.super Ljava/lang/Object;
.source ""


# static fields
.field public static AFInAppEventParameterName:Landroid/app/Application;


# instance fields
.field public AFInAppEventType:Lcom/appsflyer/internal/cw;

.field private valueOf:Z


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>(ZLcom/appsflyer/internal/cw;)V
    .locals 0

    .line 1013
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1014
    iput-boolean p1, p0, Lcom/appsflyer/internal/ay;->valueOf:Z

    .line 1015
    iput-object p2, p0, Lcom/appsflyer/internal/ay;->AFInAppEventType:Lcom/appsflyer/internal/cw;

    return-void
.end method


# virtual methods
.method public final AFInAppEventParameterName()Z
    .locals 1

    .line 1019
    iget-boolean v0, p0, Lcom/appsflyer/internal/ay;->valueOf:Z

    return v0
.end method
