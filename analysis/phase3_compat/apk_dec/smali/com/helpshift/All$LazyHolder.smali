.class Lcom/helpshift/All$LazyHolder;
.super Ljava/lang/Object;
.source "All.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/helpshift/All;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "LazyHolder"
.end annotation


# static fields
.field static final INSTANCE:Lcom/helpshift/All;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 168
    new-instance v0, Lcom/helpshift/All;

    invoke-direct {v0}, Lcom/helpshift/All;-><init>()V

    sput-object v0, Lcom/helpshift/All$LazyHolder;->INSTANCE:Lcom/helpshift/All;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 167
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
