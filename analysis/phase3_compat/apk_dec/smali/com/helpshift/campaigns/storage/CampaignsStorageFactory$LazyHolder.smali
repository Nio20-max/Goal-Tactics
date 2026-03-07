.class final Lcom/helpshift/campaigns/storage/CampaignsStorageFactory$LazyHolder;
.super Ljava/lang/Object;
.source "CampaignsStorageFactory.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/helpshift/campaigns/storage/CampaignsStorageFactory;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "LazyHolder"
.end annotation


# static fields
.field static final INSTANCE:Lcom/helpshift/campaigns/storage/CampaignsStorageFactory;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 67
    new-instance v0, Lcom/helpshift/campaigns/storage/CampaignsStorageFactory;

    invoke-direct {v0}, Lcom/helpshift/campaigns/storage/CampaignsStorageFactory;-><init>()V

    sput-object v0, Lcom/helpshift/campaigns/storage/CampaignsStorageFactory$LazyHolder;->INSTANCE:Lcom/helpshift/campaigns/storage/CampaignsStorageFactory;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 66
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
