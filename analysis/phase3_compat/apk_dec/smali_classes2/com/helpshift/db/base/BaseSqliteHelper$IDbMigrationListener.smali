.class public interface abstract Lcom/helpshift/db/base/BaseSqliteHelper$IDbMigrationListener;
.super Ljava/lang/Object;
.source "BaseSqliteHelper.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/helpshift/db/base/BaseSqliteHelper;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "IDbMigrationListener"
.end annotation


# virtual methods
.method public abstract onDbMigrationFailed(Lcom/helpshift/db/base/BaseSqliteHelper$MigrationType;Ljava/lang/String;)V
.end method

.method public abstract onDbMigrationSuccess(Lcom/helpshift/db/base/BaseSqliteHelper$MigrationType;Ljava/lang/String;)V
.end method
