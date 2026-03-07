.class public interface abstract Lcom/helpshift/campaigns/storage/PropertyStorage;
.super Ljava/lang/Object;
.source "PropertyStorage.java"


# virtual methods
.method public abstract getAllProperties(Ljava/lang/String;)Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Lcom/helpshift/campaigns/models/PropertyValue;",
            ">;"
        }
    .end annotation
.end method

.method public abstract getAllSecondaryProperties(Ljava/lang/String;)Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Lcom/helpshift/campaigns/models/PropertyValue;",
            ">;"
        }
    .end annotation
.end method

.method public abstract getProperty(Ljava/lang/String;Ljava/lang/String;)Lcom/helpshift/campaigns/models/PropertyValue;
.end method

.method public abstract getSecondaryProperty(Ljava/lang/String;Ljava/lang/String;)Lcom/helpshift/campaigns/models/PropertyValue;
.end method

.method public abstract getUnsyncedProperties(Ljava/lang/String;)Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Lcom/helpshift/campaigns/models/PropertyValue;",
            ">;"
        }
    .end annotation
.end method

.method public abstract initSecondaryStorage(Ljava/lang/String;)V
.end method

.method public abstract initStorage(Ljava/lang/String;)V
.end method

.method public abstract reinitSecondaryStorage(Ljava/lang/String;)V
.end method

.method public abstract reinitStorage(Ljava/lang/String;)V
.end method

.method public abstract removeProperty(Ljava/lang/String;Ljava/lang/String;)V
.end method

.method public abstract removePropertySecondaryStorage(Ljava/lang/String;Ljava/lang/String;)V
.end method

.method public abstract setProperty(Ljava/lang/String;Lcom/helpshift/campaigns/models/PropertyValue;Ljava/lang/String;)V
.end method

.method public abstract setSecondaryProperty(Ljava/lang/String;Lcom/helpshift/campaigns/models/PropertyValue;Ljava/lang/String;)V
.end method

.method public abstract setSecondaryPropertySyncStatus(Ljava/lang/Integer;[Ljava/lang/String;Ljava/lang/String;)V
.end method

.method public abstract setSyncStatus(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V
.end method

.method public abstract setSyncStatus(Ljava/lang/Integer;[Ljava/lang/String;Ljava/lang/String;)V
.end method
