.class public Lcom/helpshift/db/legacy_profile/migration/LegacyProfileDbMigration_1_to_2;
.super Ljava/lang/Object;
.source "LegacyProfileDbMigration_1_to_2.java"

# interfaces
.implements Lcom/helpshift/db/base/IMigrator;


# instance fields
.field private final ALTER_PROFILES_TABLE_ADD_DEVICE_ID:Ljava/lang/String;

.field private final ALTER_PROFILES_TABLE_ADD_USER_ID:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 8
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-string v0, "ALTER TABLE profiles ADD uid TEXT"

    .line 10
    iput-object v0, p0, Lcom/helpshift/db/legacy_profile/migration/LegacyProfileDbMigration_1_to_2;->ALTER_PROFILES_TABLE_ADD_USER_ID:Ljava/lang/String;

    const-string v0, "ALTER TABLE profiles ADD did TEXT"

    .line 13
    iput-object v0, p0, Lcom/helpshift/db/legacy_profile/migration/LegacyProfileDbMigration_1_to_2;->ALTER_PROFILES_TABLE_ADD_DEVICE_ID:Ljava/lang/String;

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

    const-string v0, "ALTER TABLE profiles ADD uid TEXT"

    .line 19
    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    const-string v0, "ALTER TABLE profiles ADD did TEXT"

    .line 20
    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    return-void
.end method
