.class Lcom/helpshift/support/db/faq/FaqsDBHelper$LazyHolder;
.super Ljava/lang/Object;
.source "FaqsDBHelper.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/helpshift/support/db/faq/FaqsDBHelper;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "LazyHolder"
.end annotation


# static fields
.field static final INSTANCE:Lcom/helpshift/support/db/faq/FaqsDBHelper;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 20
    new-instance v0, Lcom/helpshift/support/db/faq/FaqsDBHelper;

    .line 21
    invoke-static {}, Lcom/helpshift/util/HelpshiftContext;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    new-instance v2, Lcom/helpshift/support/db/faq/FaqDatabaseContract;

    invoke-direct {v2}, Lcom/helpshift/support/db/faq/FaqDatabaseContract;-><init>()V

    invoke-direct {v0, v1, v2}, Lcom/helpshift/support/db/faq/FaqsDBHelper;-><init>(Landroid/content/Context;Lcom/helpshift/db/base/DatabaseContract;)V

    sput-object v0, Lcom/helpshift/support/db/faq/FaqsDBHelper$LazyHolder;->INSTANCE:Lcom/helpshift/support/db/faq/FaqsDBHelper;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 19
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
