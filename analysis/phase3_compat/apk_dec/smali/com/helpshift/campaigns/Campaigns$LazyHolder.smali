.class Lcom/helpshift/campaigns/Campaigns$LazyHolder;
.super Ljava/lang/Object;
.source "Campaigns.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/helpshift/campaigns/Campaigns;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "LazyHolder"
.end annotation


# static fields
.field static final INSTANCE:Lcom/helpshift/campaigns/Campaigns;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 672
    new-instance v0, Lcom/helpshift/campaigns/Campaigns;

    invoke-direct {v0}, Lcom/helpshift/campaigns/Campaigns;-><init>()V

    sput-object v0, Lcom/helpshift/campaigns/Campaigns$LazyHolder;->INSTANCE:Lcom/helpshift/campaigns/Campaigns;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 671
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
