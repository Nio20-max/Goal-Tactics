.class public Lcom/helpshift/support/storage/SectionsDataSource;
.super Ljava/lang/Object;
.source "SectionsDataSource.java"

# interfaces
.implements Lcom/helpshift/support/storage/SectionDAO;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/helpshift/support/storage/SectionsDataSource$LazyHolder;
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String; = "HelpShiftDebug"


# instance fields
.field private final dbHelper:Lcom/helpshift/support/db/faq/FaqsDBHelper;

.field private faqDAO:Lcom/helpshift/support/storage/FaqDAO;


# direct methods
.method private constructor <init>()V
    .locals 1

    .line 30
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 31
    invoke-static {}, Lcom/helpshift/support/db/faq/FaqsDBHelper;->getInstance()Lcom/helpshift/support/db/faq/FaqsDBHelper;

    move-result-object v0

    iput-object v0, p0, Lcom/helpshift/support/storage/SectionsDataSource;->dbHelper:Lcom/helpshift/support/db/faq/FaqsDBHelper;

    .line 32
    invoke-static {}, Lcom/helpshift/support/storage/FaqsDataSource;->getInstance()Lcom/helpshift/support/storage/FaqsDataSource;

    move-result-object v0

    iput-object v0, p0, Lcom/helpshift/support/storage/SectionsDataSource;->faqDAO:Lcom/helpshift/support/storage/FaqDAO;

    return-void
.end method

.method synthetic constructor <init>(Lcom/helpshift/support/storage/SectionsDataSource$1;)V
    .locals 0

    .line 23
    invoke-direct {p0}, Lcom/helpshift/support/storage/SectionsDataSource;-><init>()V

    return-void
.end method

.method private static cursorToSection(Landroid/database/Cursor;)Lcom/helpshift/support/Section;
    .locals 7

    .line 36
    new-instance v6, Lcom/helpshift/support/Section;

    const/4 v0, 0x0

    invoke-interface {p0, v0}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v1

    const/4 v0, 0x1

    .line 37
    invoke-interface {p0, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v3

    const/4 v0, 0x3

    .line 38
    invoke-interface {p0, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v4

    const/4 v0, 0x2

    .line 39
    invoke-interface {p0, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v5

    move-object v0, v6

    invoke-direct/range {v0 .. v5}, Lcom/helpshift/support/Section;-><init>(JLjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-object v6
.end method

.method public static getInstance()Lcom/helpshift/support/storage/SectionsDataSource;
    .locals 1

    .line 52
    sget-object v0, Lcom/helpshift/support/storage/SectionsDataSource$LazyHolder;->INSTANCE:Lcom/helpshift/support/storage/SectionsDataSource;

    return-object v0
.end method

.method private static sectionToContentValues(Lorg/json/JSONObject;)Landroid/content/ContentValues;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .line 44
    new-instance v0, Landroid/content/ContentValues;

    invoke-direct {v0}, Landroid/content/ContentValues;-><init>()V

    const-string v1, "title"

    .line 45
    invoke-virtual {p0, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    const-string v1, "publish_id"

    .line 46
    invoke-virtual {p0, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    const-string v1, "id"

    .line 47
    invoke-virtual {p0, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    const-string v1, "section_id"

    invoke-virtual {v0, v1, p0}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    return-object v0
.end method


# virtual methods
.method public declared-synchronized clearSectionsData()V
    .locals 2

    monitor-enter p0

    .line 171
    :try_start_0
    iget-object v0, p0, Lcom/helpshift/support/storage/SectionsDataSource;->dbHelper:Lcom/helpshift/support/db/faq/FaqsDBHelper;

    invoke-virtual {v0}, Lcom/helpshift/support/db/faq/FaqsDBHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    .line 172
    iget-object v1, p0, Lcom/helpshift/support/storage/SectionsDataSource;->dbHelper:Lcom/helpshift/support/db/faq/FaqsDBHelper;

    invoke-virtual {v1, v0}, Lcom/helpshift/support/db/faq/FaqsDBHelper;->dropAndCreateAllTables(Landroid/database/sqlite/SQLiteDatabase;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 173
    monitor-exit p0

    return-void

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized getAllSections()Ljava/util/List;
    .locals 11
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/helpshift/support/Section;",
            ">;"
        }
    .end annotation

    monitor-enter p0

    .line 124
    :try_start_0
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    const/4 v1, 0x0

    .line 127
    :try_start_1
    iget-object v2, p0, Lcom/helpshift/support/storage/SectionsDataSource;->dbHelper:Lcom/helpshift/support/db/faq/FaqsDBHelper;

    invoke-virtual {v2}, Lcom/helpshift/support/db/faq/FaqsDBHelper;->getReadableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v3

    const-string v4, "sections"

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x0

    const/4 v9, 0x0

    const/4 v10, 0x0

    .line 128
    invoke-virtual/range {v3 .. v10}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v1

    .line 135
    invoke-interface {v1}, Landroid/database/Cursor;->moveToFirst()Z

    .line 136
    :goto_0
    invoke-interface {v1}, Landroid/database/Cursor;->isAfterLast()Z

    move-result v2

    if-nez v2, :cond_0

    .line 137
    invoke-static {v1}, Lcom/helpshift/support/storage/SectionsDataSource;->cursorToSection(Landroid/database/Cursor;)Lcom/helpshift/support/Section;

    move-result-object v2

    .line 138
    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 139
    invoke-interface {v1}, Landroid/database/Cursor;->moveToNext()Z
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    :cond_0
    if-eqz v1, :cond_1

    .line 147
    :goto_1
    :try_start_2
    invoke-interface {v1}, Landroid/database/Cursor;->close()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    goto :goto_2

    :catchall_0
    move-exception v0

    goto :goto_3

    :catch_0
    move-exception v2

    :try_start_3
    const-string v3, "HelpShiftDebug"

    const-string v4, "Error in getAllSections"

    .line 143
    invoke-static {v3, v4, v2}, Lcom/helpshift/util/HSLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    if-eqz v1, :cond_1

    goto :goto_1

    .line 150
    :cond_1
    :goto_2
    monitor-exit p0

    return-object v0

    :goto_3
    if-eqz v1, :cond_2

    .line 147
    :try_start_4
    invoke-interface {v1}, Landroid/database/Cursor;->close()V

    .line 149
    :cond_2
    throw v0
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    :catchall_1
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public getAllSections(Lcom/helpshift/support/FaqTagFilter;)Ljava/util/List;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/helpshift/support/FaqTagFilter;",
            ")",
            "Ljava/util/List<",
            "Lcom/helpshift/support/Section;",
            ">;"
        }
    .end annotation

    .line 155
    invoke-virtual {p0}, Lcom/helpshift/support/storage/SectionsDataSource;->getAllSections()Ljava/util/List;

    move-result-object v0

    if-nez p1, :cond_0

    return-object v0

    .line 159
    :cond_0
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 160
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_1
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/helpshift/support/Section;

    .line 161
    iget-object v3, p0, Lcom/helpshift/support/storage/SectionsDataSource;->faqDAO:Lcom/helpshift/support/storage/FaqDAO;

    invoke-virtual {v2}, Lcom/helpshift/support/Section;->getPublishId()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v3, v4, p1}, Lcom/helpshift/support/storage/FaqDAO;->getFaqsForSection(Ljava/lang/String;Lcom/helpshift/support/FaqTagFilter;)Ljava/util/List;

    move-result-object v3

    .line 162
    invoke-interface {v3}, Ljava/util/List;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_1

    .line 163
    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_2
    return-object v1
.end method

.method public declared-synchronized getSection(Ljava/lang/String;)Lcom/helpshift/support/Section;
    .locals 11

    monitor-enter p0

    if-eqz p1, :cond_4

    :try_start_0
    const-string v0, ""

    .line 89
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_2

    if-eqz v0, :cond_0

    goto :goto_4

    :cond_0
    const/4 v0, 0x0

    .line 96
    :try_start_1
    iget-object v1, p0, Lcom/helpshift/support/storage/SectionsDataSource;->dbHelper:Lcom/helpshift/support/db/faq/FaqsDBHelper;

    invoke-virtual {v1}, Lcom/helpshift/support/db/faq/FaqsDBHelper;->getReadableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v2

    const-string v3, "sections"

    const/4 v4, 0x0

    const-string v5, "publish_id = ?"

    const/4 v1, 0x1

    new-array v6, v1, [Ljava/lang/String;

    const/4 v1, 0x0

    aput-object p1, v6, v1

    const/4 v7, 0x0

    const/4 v8, 0x0

    const/4 v9, 0x0

    .line 97
    invoke-virtual/range {v2 .. v9}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object p1
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 104
    :try_start_2
    invoke-interface {p1}, Landroid/database/Cursor;->moveToFirst()Z

    .line 105
    invoke-interface {p1}, Landroid/database/Cursor;->isAfterLast()Z

    move-result v1

    if-nez v1, :cond_1

    .line 106
    invoke-static {p1}, Lcom/helpshift/support/storage/SectionsDataSource;->cursorToSection(Landroid/database/Cursor;)Lcom/helpshift/support/Section;

    move-result-object v0
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    :cond_1
    if-eqz p1, :cond_2

    .line 115
    :goto_0
    :try_start_3
    invoke-interface {p1}, Landroid/database/Cursor;->close()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_2

    goto :goto_2

    :catch_0
    move-exception v1

    goto :goto_1

    :catchall_0
    move-exception p1

    move-object v10, v0

    move-object v0, p1

    move-object p1, v10

    goto :goto_3

    :catch_1
    move-exception v1

    move-object p1, v0

    :goto_1
    :try_start_4
    const-string v2, "HelpShiftDebug"

    const-string v3, "Error in getSection"

    .line 111
    invoke-static {v2, v3, v1}, Lcom/helpshift/util/HSLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    if-eqz p1, :cond_2

    goto :goto_0

    .line 119
    :cond_2
    :goto_2
    monitor-exit p0

    return-object v0

    :catchall_1
    move-exception v0

    :goto_3
    if-eqz p1, :cond_3

    .line 115
    :try_start_5
    invoke-interface {p1}, Landroid/database/Cursor;->close()V

    .line 117
    :cond_3
    throw v0

    .line 90
    :cond_4
    :goto_4
    new-instance p1, Lcom/helpshift/support/Section;

    invoke-direct {p1}, Lcom/helpshift/support/Section;-><init>()V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_2

    monitor-exit p0

    return-object p1

    :catchall_2
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public declared-synchronized storeSections(Lorg/json/JSONArray;)V
    .locals 6

    monitor-enter p0

    .line 57
    :try_start_0
    iget-object v0, p0, Lcom/helpshift/support/storage/SectionsDataSource;->dbHelper:Lcom/helpshift/support/db/faq/FaqsDBHelper;

    invoke-virtual {v0}, Lcom/helpshift/support/db/faq/FaqsDBHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 59
    :try_start_1
    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    const/4 v1, 0x0

    .line 60
    :goto_0
    invoke-virtual {p1}, Lorg/json/JSONArray;->length()I

    move-result v2

    if-ge v1, v2, :cond_1

    .line 61
    invoke-virtual {p1, v1}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v2

    const-string v3, "sections"

    const/4 v4, 0x0

    .line 62
    invoke-static {v2}, Lcom/helpshift/support/storage/SectionsDataSource;->sectionToContentValues(Lorg/json/JSONObject;)Landroid/content/ContentValues;

    move-result-object v5

    invoke-virtual {v0, v3, v4, v5}, Landroid/database/sqlite/SQLiteDatabase;->insert(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J

    const-string v3, "faqs"

    .line 64
    invoke-virtual {v2, v3}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v3

    if-eqz v3, :cond_0

    const-string v4, "publish_id"

    .line 66
    invoke-virtual {v2, v4}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 67
    invoke-static {v0, v2, v3}, Lcom/helpshift/support/storage/FaqsDataSource;->addFaqsUnsafe(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;Lorg/json/JSONArray;)V

    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 70
    :cond_1
    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    if-eqz v0, :cond_2

    .line 77
    :try_start_2
    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->inTransaction()Z

    move-result p1

    if-eqz p1, :cond_2

    .line 78
    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    goto :goto_2

    :catch_0
    move-exception p1

    :try_start_3
    const-string v0, "HelpShiftDebug"

    const-string v1, "Error in storeSections inside finally block"

    .line 82
    :goto_1
    invoke-static {v0, v1, p1}, Lcom/helpshift/util/HSLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    goto :goto_2

    :catchall_0
    move-exception p1

    goto :goto_3

    :catch_1
    move-exception p1

    :try_start_4
    const-string v1, "HelpShiftDebug"

    const-string v2, "Error in storeSections"

    .line 73
    invoke-static {v1, v2, p1}, Lcom/helpshift/util/HSLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    if-eqz v0, :cond_2

    .line 77
    :try_start_5
    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->inTransaction()Z

    move-result p1

    if-eqz p1, :cond_2

    .line 78
    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_2
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    goto :goto_2

    :catch_2
    move-exception p1

    :try_start_6
    const-string v0, "HelpShiftDebug"

    const-string v1, "Error in storeSections inside finally block"
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_1

    goto :goto_1

    .line 85
    :cond_2
    :goto_2
    monitor-exit p0

    return-void

    :goto_3
    if-eqz v0, :cond_3

    .line 77
    :try_start_7
    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->inTransaction()Z

    move-result v1

    if-eqz v1, :cond_3

    .line 78
    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V
    :try_end_7
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_7} :catch_3
    .catchall {:try_start_7 .. :try_end_7} :catchall_1

    goto :goto_4

    :catch_3
    move-exception v0

    :try_start_8
    const-string v1, "HelpShiftDebug"

    const-string v2, "Error in storeSections inside finally block"

    .line 82
    invoke-static {v1, v2, v0}, Lcom/helpshift/util/HSLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 84
    :cond_3
    :goto_4
    throw p1
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_1

    :catchall_1
    move-exception p1

    monitor-exit p0

    throw p1
.end method
