.class public Lcom/helpshift/campaigns/storage/SessionDbStorageHelper;
.super Landroid/database/sqlite/SQLiteOpenHelper;
.source "SessionDbStorageHelper.java"


# static fields
.field private static final DATABASE_NAME:Ljava/lang/String;

.field private static final DATABASE_VERSION:Ljava/lang/Integer;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 13
    invoke-static {}, Lcom/helpshift/campaigns/storage/CampaignsDBNameRepo;->getSessionsDbName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/helpshift/campaigns/storage/SessionDbStorageHelper;->DATABASE_NAME:Ljava/lang/String;

    const/4 v0, 0x1

    .line 14
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    sput-object v0, Lcom/helpshift/campaigns/storage/SessionDbStorageHelper;->DATABASE_VERSION:Ljava/lang/Integer;

    return-void
.end method

.method constructor <init>(Landroid/content/Context;)V
    .locals 3

    .line 17
    sget-object v0, Lcom/helpshift/campaigns/storage/SessionDbStorageHelper;->DATABASE_NAME:Ljava/lang/String;

    sget-object v1, Lcom/helpshift/campaigns/storage/SessionDbStorageHelper;->DATABASE_VERSION:Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    const/4 v2, 0x0

    invoke-direct {p0, p1, v0, v2, v1}, Landroid/database/sqlite/SQLiteOpenHelper;-><init>(Landroid/content/Context;Ljava/lang/String;Landroid/database/sqlite/SQLiteDatabase$CursorFactory;I)V

    return-void
.end method

.method private dropTable(Landroid/database/sqlite/SQLiteDatabase;)V
    .locals 1

    const-string v0, "DROP TABLE IF EXISTS sessions;"

    .line 52
    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method public onCreate(Landroid/database/sqlite/SQLiteDatabase;)V
    .locals 1

    const-string v0, "CREATE TABLE sessions(identifier text primary key, device_identifier text not null, user_identifier text not null, start_time int, end_time int, durations blob, sync_status int, extras blob );"

    .line 27
    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    return-void
.end method

.method public onDowngrade(Landroid/database/sqlite/SQLiteDatabase;II)V
    .locals 0

    .line 47
    invoke-direct {p0, p1}, Lcom/helpshift/campaigns/storage/SessionDbStorageHelper;->dropTable(Landroid/database/sqlite/SQLiteDatabase;)V

    .line 48
    invoke-virtual {p0, p1}, Lcom/helpshift/campaigns/storage/SessionDbStorageHelper;->onCreate(Landroid/database/sqlite/SQLiteDatabase;)V

    return-void
.end method

.method public onUpgrade(Landroid/database/sqlite/SQLiteDatabase;II)V
    .locals 0

    .line 41
    invoke-direct {p0, p1}, Lcom/helpshift/campaigns/storage/SessionDbStorageHelper;->dropTable(Landroid/database/sqlite/SQLiteDatabase;)V

    .line 42
    invoke-virtual {p0, p1}, Lcom/helpshift/campaigns/storage/SessionDbStorageHelper;->onCreate(Landroid/database/sqlite/SQLiteDatabase;)V

    return-void
.end method
