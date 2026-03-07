.class public interface abstract Lcom/helpshift/campaigns/storage/SessionStorage;
.super Ljava/lang/Object;
.source "SessionStorage.java"


# virtual methods
.method public abstract cleanUpInvalidSessions()I
.end method

.method public abstract getAllSessions(Ljava/lang/Integer;)Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Integer;",
            ")",
            "Ljava/util/ArrayList<",
            "Lcom/helpshift/campaigns/models/SessionModel;",
            ">;"
        }
    .end annotation
.end method

.method public abstract getSession(Ljava/lang/String;)Lcom/helpshift/campaigns/models/SessionModel;
.end method

.method public abstract removeSessions([Ljava/lang/String;)V
.end method

.method public abstract setSyncStatus(Ljava/lang/Integer;[Ljava/lang/String;)V
.end method

.method public abstract storeSession(Lcom/helpshift/campaigns/models/SessionModel;)V
.end method

.method public abstract updateSession(Lcom/helpshift/campaigns/models/SessionModel;)V
.end method
