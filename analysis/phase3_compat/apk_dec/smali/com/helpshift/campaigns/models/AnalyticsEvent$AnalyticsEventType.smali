.class public Lcom/helpshift/campaigns/models/AnalyticsEvent$AnalyticsEventType;
.super Ljava/lang/Object;
.source "AnalyticsEvent.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/helpshift/campaigns/models/AnalyticsEvent;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "AnalyticsEventType"
.end annotation


# static fields
.field static final BUTTON_EVENTS:[Ljava/lang/Integer;

.field public static final DEFAULT:Ljava/lang/Integer;

.field public static final DELETE_EXPIRED_MESSAGE:Ljava/lang/Integer;

.field public static final DELIVERY:Ljava/lang/Integer;

.field public static final MARK_AS_DELETE:Ljava/lang/Integer;

.field public static final MARK_AS_READ:Ljava/lang/Integer;

.field public static final VIEW:Ljava/lang/Integer;


# direct methods
.method static constructor <clinit>()V
    .locals 5

    const/4 v0, 0x0

    .line 86
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    sput-object v1, Lcom/helpshift/campaigns/models/AnalyticsEvent$AnalyticsEventType;->DEFAULT:Ljava/lang/Integer;

    const/4 v1, 0x1

    .line 87
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    sput-object v2, Lcom/helpshift/campaigns/models/AnalyticsEvent$AnalyticsEventType;->DELIVERY:Ljava/lang/Integer;

    const/4 v2, 0x2

    .line 88
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    sput-object v3, Lcom/helpshift/campaigns/models/AnalyticsEvent$AnalyticsEventType;->VIEW:Ljava/lang/Integer;

    const/4 v3, 0x5

    .line 89
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    sput-object v3, Lcom/helpshift/campaigns/models/AnalyticsEvent$AnalyticsEventType;->MARK_AS_READ:Ljava/lang/Integer;

    const/4 v3, 0x6

    .line 90
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    sput-object v3, Lcom/helpshift/campaigns/models/AnalyticsEvent$AnalyticsEventType;->MARK_AS_DELETE:Ljava/lang/Integer;

    const/16 v3, 0x8

    .line 91
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    sput-object v3, Lcom/helpshift/campaigns/models/AnalyticsEvent$AnalyticsEventType;->DELETE_EXPIRED_MESSAGE:Ljava/lang/Integer;

    const/4 v3, 0x4

    new-array v3, v3, [Ljava/lang/Integer;

    const/16 v4, 0xc9

    .line 93
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v3, v0

    const/16 v0, 0xca

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    aput-object v0, v3, v1

    const/16 v0, 0xcb

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    aput-object v0, v3, v2

    const/16 v0, 0xcc

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    const/4 v1, 0x3

    aput-object v0, v3, v1

    sput-object v3, Lcom/helpshift/campaigns/models/AnalyticsEvent$AnalyticsEventType;->BUTTON_EVENTS:[Ljava/lang/Integer;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 85
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
