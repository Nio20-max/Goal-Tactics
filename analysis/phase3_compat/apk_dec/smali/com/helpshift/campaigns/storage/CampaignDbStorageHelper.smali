.class Lcom/helpshift/campaigns/storage/CampaignDbStorageHelper;
.super Landroid/database/sqlite/SQLiteOpenHelper;
.source "CampaignDbStorageHelper.java"


# static fields
.field private static final ALTER_TABLE_ADD_EXPIRY_TIME_STAMP:Ljava/lang/String; = "ALTER TABLE campaigns ADD expiry_time_stamp INT DEFAULT 9223372036854775807"

.field private static final DATABASE_NAME:Ljava/lang/String;

.field private static final DATABASE_VERSION:I = 0x2

.field private static final TAG:Ljava/lang/String; = "Helpshift_CampDBHelper"


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 15
    invoke-static {}, Lcom/helpshift/campaigns/storage/CampaignsDBNameRepo;->getCampaignsDbName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/helpshift/campaigns/storage/CampaignDbStorageHelper;->DATABASE_NAME:Ljava/lang/String;

    return-void
.end method

.method constructor <init>(Landroid/content/Context;)V
    .locals 3

    .line 23
    sget-object v0, Lcom/helpshift/campaigns/storage/CampaignDbStorageHelper;->DATABASE_NAME:Ljava/lang/String;

    const/4 v1, 0x0

    const/4 v2, 0x2

    invoke-direct {p0, p1, v0, v1, v2}, Landroid/database/sqlite/SQLiteOpenHelper;-><init>(Landroid/content/Context;Ljava/lang/String;Landroid/database/sqlite/SQLiteDatabase$CursorFactory;I)V

    return-void
.end method


# virtual methods
.method dropTable(Landroid/database/sqlite/SQLiteDatabase;)V
    .locals 1

    const-string v0, "DROP TABLE IF EXISTS campaigns;"

    .line 84
    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    return-void
.end method

.method public onCreate(Landroid/database/sqlite/SQLiteDatabase;)V
    .locals 1

    const-string v0, "CREATE TABLE IF NOT EXISTS campaigns(identifier text primary key, user_identifier text not null, title text not null, body text not null, cover_image_url text, cover_image_file_path text, icon_image_url text not null, icon_image_file_path text, background_color text, title_color text, text_color text, actions blob, messages blob, read_status int, seen_status int, created_at int, extra_data text, expiry_time_stamp int default 9223372036854775807);"

    .line 33
    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    return-void
.end method

.method public onDowngrade(Landroid/database/sqlite/SQLiteDatabase;II)V
    .locals 0

    if-eqz p1, :cond_0

    .line 72
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->isOpen()Z

    move-result p2

    if-eqz p2, :cond_0

    .line 74
    :try_start_0
    invoke-virtual {p0, p1}, Lcom/helpshift/campaigns/storage/CampaignDbStorageHelper;->dropTable(Landroid/database/sqlite/SQLiteDatabase;)V

    .line 75
    invoke-virtual {p0, p1}, Lcom/helpshift/campaigns/storage/CampaignDbStorageHelper;->onCreate(Landroid/database/sqlite/SQLiteDatabase;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    const-string p2, "Helpshift_CampDBHelper"

    const-string p3, "Exception while downgrading campaigns database"

    .line 78
    invoke-static {p2, p3, p1}, Lcom/helpshift/util/HSLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    :cond_0
    :goto_0
    return-void
.end method

.method public onUpgrade(Landroid/database/sqlite/SQLiteDatabase;II)V
    .locals 0

    if-eqz p1, :cond_0

    .line 58
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->isOpen()Z

    move-result p3

    if-eqz p3, :cond_0

    const/4 p3, 0x2

    if-ge p2, p3, :cond_0

    :try_start_0
    const-string p2, "ALTER TABLE campaigns ADD expiry_time_stamp INT DEFAULT 9223372036854775807"

    .line 61
    invoke-virtual {p1, p2}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    const-string p2, "Helpshift_CampDBHelper"

    const-string p3, "Exception while upgrading campaigns database"

    .line 65
    invoke-static {p2, p3, p1}, Lcom/helpshift/util/HSLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    :cond_0
    :goto_0
    return-void
.end method
