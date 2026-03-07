.class Lcom/helpshift/campaigns/network/NetworkManagerFactory$LazyHolder;
.super Ljava/lang/Object;
.source "NetworkManagerFactory.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/helpshift/campaigns/network/NetworkManagerFactory;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "LazyHolder"
.end annotation


# static fields
.field static final INSTANCE:Lcom/helpshift/campaigns/network/NetworkManagerFactory;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 72
    new-instance v0, Lcom/helpshift/campaigns/network/NetworkManagerFactory;

    invoke-direct {v0}, Lcom/helpshift/campaigns/network/NetworkManagerFactory;-><init>()V

    sput-object v0, Lcom/helpshift/campaigns/network/NetworkManagerFactory$LazyHolder;->INSTANCE:Lcom/helpshift/campaigns/network/NetworkManagerFactory;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 71
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
