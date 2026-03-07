.class public Lcom/helpshift/support/db/SupportDBNameRepo;
.super Ljava/lang/Object;
.source "SupportDBNameRepo.java"


# static fields
.field private static final FAQS_DB_NAME:Ljava/lang/String; = "faqs_db"

.field private static final ISSUES_DB_NAME:Ljava/lang/String; = "issues_db"

.field private static final KEYVALUE_DB_NAME:Ljava/lang/String; = "keyvalue_db"

.field private static final LEGACY_PROFILE_DB_NAME:Ljava/lang/String; = "legacy_profile_db"

.field private static final LOG_STORE_DB:Ljava/lang/String; = "log_store_db"

.field private static final NETWORK_DB_NAME:Ljava/lang/String; = "network_db"

.field private static final SEARCH_DB_NAME:Ljava/lang/String; = "search_db"

.field private static final SMART_INTENT_DB_NAME:Ljava/lang/String; = "smart_intent_db"

.field private static final SUPPORT_KV_DB_NAME:Ljava/lang/String; = "support_kv_db"

.field private static final USER_DB_NAME:Ljava/lang/String; = "user_db"

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

    .line 27
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    const-string v1, "issues_db"

    const-string v2, "__hs__db_issues"

    .line 29
    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v1, "faqs_db"

    const-string v2, "__hs__db_faq"

    .line 30
    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v1, "network_db"

    const-string v2, "__hs_db_network_metadata"

    .line 31
    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v1, "keyvalue_db"

    const-string v2, "__hs__db_key_values"

    .line 32
    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v1, "support_kv_db"

    const-string v2, "__hs__db_support_key_values"

    .line 33
    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v1, "legacy_profile_db"

    const-string v2, "__hs__db_profiles"

    .line 34
    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v1, "search_db"

    const-string v2, "__hs__db_search"

    .line 35
    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v1, "smart_intent_db"

    const-string v2, "__hs_db_smart_intent"

    .line 36
    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v1, "user_db"

    const-string v2, "__hs_db_helpshift_users"

    .line 37
    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v1, "log_store_db"

    const-string v2, "__hs_log_store"

    .line 38
    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 40
    invoke-static {v0}, Ljava/util/Collections;->unmodifiableMap(Ljava/util/Map;)Ljava/util/Map;

    move-result-object v0

    sput-object v0, Lcom/helpshift/support/db/SupportDBNameRepo;->dbNames:Ljava/util/Map;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 10
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getFaqsDbName()Ljava/lang/String;
    .locals 2

    .line 48
    sget-object v0, Lcom/helpshift/support/db/SupportDBNameRepo;->dbNames:Ljava/util/Map;

    const-string v1, "faqs_db"

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    return-object v0
.end method

.method public static getIssuesDbName()Ljava/lang/String;
    .locals 2

    .line 44
    sget-object v0, Lcom/helpshift/support/db/SupportDBNameRepo;->dbNames:Ljava/util/Map;

    const-string v1, "issues_db"

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    return-object v0
.end method

.method public static getKeyvalueDbName()Ljava/lang/String;
    .locals 2

    .line 56
    sget-object v0, Lcom/helpshift/support/db/SupportDBNameRepo;->dbNames:Ljava/util/Map;

    const-string v1, "keyvalue_db"

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    return-object v0
.end method

.method public static getLegacyProfileDbName()Ljava/lang/String;
    .locals 2

    .line 60
    sget-object v0, Lcom/helpshift/support/db/SupportDBNameRepo;->dbNames:Ljava/util/Map;

    const-string v1, "legacy_profile_db"

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    return-object v0
.end method

.method public static getNetworkDbName()Ljava/lang/String;
    .locals 2

    .line 52
    sget-object v0, Lcom/helpshift/support/db/SupportDBNameRepo;->dbNames:Ljava/util/Map;

    const-string v1, "network_db"

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    return-object v0
.end method

.method public static getSearchDbName()Ljava/lang/String;
    .locals 2

    .line 64
    sget-object v0, Lcom/helpshift/support/db/SupportDBNameRepo;->dbNames:Ljava/util/Map;

    const-string v1, "search_db"

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    return-object v0
.end method

.method public static getSmartIntentDbName()Ljava/lang/String;
    .locals 2

    .line 68
    sget-object v0, Lcom/helpshift/support/db/SupportDBNameRepo;->dbNames:Ljava/util/Map;

    const-string v1, "smart_intent_db"

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    return-object v0
.end method

.method public static getSupportKvDbName()Ljava/lang/String;
    .locals 2

    .line 72
    sget-object v0, Lcom/helpshift/support/db/SupportDBNameRepo;->dbNames:Ljava/util/Map;

    const-string v1, "support_kv_db"

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    return-object v0
.end method

.method public static getUserDbName()Ljava/lang/String;
    .locals 2

    .line 76
    sget-object v0, Lcom/helpshift/support/db/SupportDBNameRepo;->dbNames:Ljava/util/Map;

    const-string v1, "user_db"

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    return-object v0
.end method
