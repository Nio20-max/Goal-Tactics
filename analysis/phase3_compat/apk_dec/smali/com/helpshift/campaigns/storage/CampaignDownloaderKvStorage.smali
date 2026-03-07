.class public Lcom/helpshift/campaigns/storage/CampaignDownloaderKvStorage;
.super Ljava/lang/Object;
.source "CampaignDownloaderKvStorage.java"

# interfaces
.implements Lcom/helpshift/android/commons/downloader/contracts/DownloaderKeyValueStorage;


# instance fields
.field private final keyValueStorage:Lcom/helpshift/storage/KeyValueStorage;


# direct methods
.method public constructor <init>(Lcom/helpshift/storage/KeyValueStorage;)V
    .locals 0

    .line 12
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 13
    iput-object p1, p0, Lcom/helpshift/campaigns/storage/CampaignDownloaderKvStorage;->keyValueStorage:Lcom/helpshift/storage/KeyValueStorage;

    return-void
.end method


# virtual methods
.method public get(Ljava/lang/String;)Ljava/lang/Object;
    .locals 1

    .line 23
    iget-object v0, p0, Lcom/helpshift/campaigns/storage/CampaignDownloaderKvStorage;->keyValueStorage:Lcom/helpshift/storage/KeyValueStorage;

    invoke-interface {v0, p1}, Lcom/helpshift/storage/KeyValueStorage;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    return-object p1
.end method

.method public set(Ljava/lang/String;Ljava/io/Serializable;)Z
    .locals 1

    .line 18
    iget-object v0, p0, Lcom/helpshift/campaigns/storage/CampaignDownloaderKvStorage;->keyValueStorage:Lcom/helpshift/storage/KeyValueStorage;

    invoke-interface {v0, p1, p2}, Lcom/helpshift/storage/KeyValueStorage;->set(Ljava/lang/String;Ljava/io/Serializable;)Z

    move-result p1

    return p1
.end method
