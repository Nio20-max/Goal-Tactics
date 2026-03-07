.class public Lcom/helpshift/xamarin/support/XamarinMetaDataCallable;
.super Ljava/lang/Object;
.source "XamarinMetaDataCallable.java"

# interfaces
.implements Lcom/helpshift/support/MetadataCallable;


# instance fields
.field private issueTags:[Ljava/lang/String;

.field private metadata:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/util/Map;[Ljava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;[",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 17
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 18
    iput-object p1, p0, Lcom/helpshift/xamarin/support/XamarinMetaDataCallable;->metadata:Ljava/util/Map;

    .line 19
    iput-object p2, p0, Lcom/helpshift/xamarin/support/XamarinMetaDataCallable;->issueTags:[Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public call()Lcom/helpshift/support/Metadata;
    .locals 3

    .line 24
    new-instance v0, Lcom/helpshift/support/Metadata;

    iget-object v1, p0, Lcom/helpshift/xamarin/support/XamarinMetaDataCallable;->metadata:Ljava/util/Map;

    iget-object v2, p0, Lcom/helpshift/xamarin/support/XamarinMetaDataCallable;->issueTags:[Ljava/lang/String;

    invoke-direct {v0, v1, v2}, Lcom/helpshift/support/Metadata;-><init>(Ljava/util/Map;[Ljava/lang/String;)V

    return-object v0
.end method
