.class public Lcom/helpshift/support/db/faq/FaqDatabaseContract;
.super Ljava/lang/Object;
.source "FaqDatabaseContract.java"

# interfaces
.implements Lcom/helpshift/db/base/DatabaseContract;


# static fields
.field private static final TAG:Ljava/lang/String; = "Helpshift_FaqDB"


# instance fields
.field private final CREATE_FAQ_TABLE:Ljava/lang/String;

.field private final CREATE_SECTION_TABLE:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 16
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-string v0, "CREATE TABLE faqs (_id INTEGER PRIMARY KEY AUTOINCREMENT,question_id TEXT NOT NULL,publish_id TEXT NOT NULL,language TEXT NOT NULL,section_id TEXT NOT NULL,title TEXT NOT NULL,body TEXT NOT NULL,helpful INTEGER,rtl INTEGER,tags TEXT,c_tags TEXT,FOREIGN KEY(section_id) REFERENCES sections (_id));"

    .line 18
    iput-object v0, p0, Lcom/helpshift/support/db/faq/FaqDatabaseContract;->CREATE_FAQ_TABLE:Ljava/lang/String;

    const-string v0, "CREATE TABLE sections (_id INTEGER PRIMARY KEY AUTOINCREMENT,section_id TEXT NOT NULL,publish_id INTEGER NOT NULL,title TEXT NOT NULL);"

    .line 36
    iput-object v0, p0, Lcom/helpshift/support/db/faq/FaqDatabaseContract;->CREATE_SECTION_TABLE:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public getCreateTableQueries()Ljava/util/List;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    const-string v0, "CREATE TABLE faqs (_id INTEGER PRIMARY KEY AUTOINCREMENT,question_id TEXT NOT NULL,publish_id TEXT NOT NULL,language TEXT NOT NULL,section_id TEXT NOT NULL,title TEXT NOT NULL,body TEXT NOT NULL,helpful INTEGER,rtl INTEGER,tags TEXT,c_tags TEXT,FOREIGN KEY(section_id) REFERENCES sections (_id));"

    const-string v1, "CREATE TABLE sections (_id INTEGER PRIMARY KEY AUTOINCREMENT,section_id TEXT NOT NULL,publish_id INTEGER NOT NULL,title TEXT NOT NULL);"

    .line 57
    filled-new-array {v0, v1}, [Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public getDatabaseName()Ljava/lang/String;
    .locals 1

    .line 52
    invoke-static {}, Lcom/helpshift/support/db/SupportDBNameRepo;->getFaqsDbName()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getDatabaseVersion()I
    .locals 1

    const/4 v0, 0x3

    return v0
.end method

.method public getMigratorsForUpgrade(I)Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Ljava/util/List<",
            "Lcom/helpshift/db/base/IMigrator;",
            ">;"
        }
    .end annotation

    .line 62
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 63
    new-instance v0, Lcom/helpshift/db/base/DropAndCreateDatabaseMigrator;

    invoke-direct {v0, p0}, Lcom/helpshift/db/base/DropAndCreateDatabaseMigrator;-><init>(Lcom/helpshift/db/base/DatabaseContract;)V

    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    return-object p1
.end method

.method public getTableNames()Ljava/util/List;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    const-string v0, "faqs"

    const-string v1, "sections"

    .line 69
    filled-new-array {v0, v1}, [Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public getTag()Ljava/lang/String;
    .locals 1

    const-string v0, "Helpshift_FaqDB"

    return-object v0
.end method
