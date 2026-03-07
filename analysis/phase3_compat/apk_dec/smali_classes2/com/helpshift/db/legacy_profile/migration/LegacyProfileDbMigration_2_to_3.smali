.class public Lcom/helpshift/db/legacy_profile/migration/LegacyProfileDbMigration_2_to_3;
.super Ljava/lang/Object;
.source "LegacyProfileDbMigration_2_to_3.java"

# interfaces
.implements Lcom/helpshift/db/base/IMigrator;


# static fields
.field private static final ALTER_PROFILES_TABLE_ADD_PUSH_TOKEN_SYNC_STATUS:Ljava/lang/String; = "ALTER TABLE profiles ADD push_token_sync INTEGER"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 8
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public migrate(Landroid/database/sqlite/SQLiteDatabase;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    const-string v0, "ALTER TABLE profiles ADD push_token_sync INTEGER"

    .line 15
    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    return-void
.end method
