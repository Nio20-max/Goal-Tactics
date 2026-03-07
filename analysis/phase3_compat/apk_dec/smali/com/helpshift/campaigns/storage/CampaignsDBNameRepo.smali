.class public Lcom/helpshift/campaigns/storage/CampaignsDBNameRepo;
.super Ljava/lang/Object;
.source "CampaignsDBNameRepo.java"


# static fields
.field private static final CAMPAIGNS_DB_NAME:Ljava/lang/String; = "campaigns_db"

.field private static final PROPERTY_DB_NAME:Ljava/lang/String; = "properties_db"

.field private static final SESSIONS_DB_NAME:Ljava/lang/String; = "sessions_db"

.field public static final dbNames:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 18
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    const-string v1, "campaigns_db"

    const-string v2, "__hs__db_campaigns"

    .line 19
    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v1, "properties_db"

    const-string v2, "__hs__db_properties"

    .line 20
    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v1, "sessions_db"

    const-string v2, "__hs__db_sessions"

    .line 21
    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 23
    invoke-static {v0}, Ljava/util/Collections;->unmodifiableMap(Ljava/util/Map;)Ljava/util/Map;

    move-result-object v0

    sput-object v0, Lcom/helpshift/campaigns/storage/CampaignsDBNameRepo;->dbNames:Ljava/util/Map;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 10
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getCampaignsDbName()Ljava/lang/String;
    .locals 2

    .line 27
    sget-object v0, Lcom/helpshift/campaigns/storage/CampaignsDBNameRepo;->dbNames:Ljava/util/Map;

    const-string v1, "campaigns_db"

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    return-object v0
.end method

.method public static getPropertyDbName()Ljava/lang/String;
    .locals 2

    .line 31
    sget-object v0, Lcom/helpshift/campaigns/storage/CampaignsDBNameRepo;->dbNames:Ljava/util/Map;

    const-string v1, "properties_db"

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    return-object v0
.end method

.method public static getSessionsDbName()Ljava/lang/String;
    .locals 2

    .line 35
    sget-object v0, Lcom/helpshift/campaigns/storage/CampaignsDBNameRepo;->dbNames:Ljava/util/Map;

    const-string v1, "sessions_db"

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    return-object v0
.end method
