.class public Lcom/helpshift/support/db/faq/FaqsDBHelper;
.super Lcom/helpshift/db/base/BaseSqliteHelper;
.source "FaqsDBHelper.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/helpshift/support/db/faq/FaqsDBHelper$LazyHolder;
    }
.end annotation


# direct methods
.method constructor <init>(Landroid/content/Context;Lcom/helpshift/db/base/DatabaseContract;)V
    .locals 0

    .line 12
    invoke-direct {p0, p1, p2}, Lcom/helpshift/db/base/BaseSqliteHelper;-><init>(Landroid/content/Context;Lcom/helpshift/db/base/DatabaseContract;)V

    return-void
.end method

.method public static getInstance()Lcom/helpshift/support/db/faq/FaqsDBHelper;
    .locals 1

    .line 16
    sget-object v0, Lcom/helpshift/support/db/faq/FaqsDBHelper$LazyHolder;->INSTANCE:Lcom/helpshift/support/db/faq/FaqsDBHelper;

    return-object v0
.end method
