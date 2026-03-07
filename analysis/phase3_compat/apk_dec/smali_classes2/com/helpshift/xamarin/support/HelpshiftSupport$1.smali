.class final Lcom/helpshift/xamarin/support/HelpshiftSupport$1;
.super Ljava/lang/Object;
.source "HelpshiftSupport.java"

# interfaces
.implements Lcom/helpshift/support/Callable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/helpshift/xamarin/support/HelpshiftSupport;->setMetadataCallback(Lcom/helpshift/xamarin/support/HelpshiftCallable;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# instance fields
.field final synthetic val$f:Lcom/helpshift/xamarin/support/HelpshiftCallable;


# direct methods
.method constructor <init>(Lcom/helpshift/xamarin/support/HelpshiftCallable;)V
    .locals 0

    .line 153
    iput-object p1, p0, Lcom/helpshift/xamarin/support/HelpshiftSupport$1;->val$f:Lcom/helpshift/xamarin/support/HelpshiftCallable;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public call()Ljava/util/HashMap;
    .locals 1

    .line 156
    iget-object v0, p0, Lcom/helpshift/xamarin/support/HelpshiftSupport$1;->val$f:Lcom/helpshift/xamarin/support/HelpshiftCallable;

    invoke-interface {v0}, Lcom/helpshift/xamarin/support/HelpshiftCallable;->call()Ljava/util/HashMap;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic call()Ljava/util/Map;
    .locals 1

    .line 153
    invoke-virtual {p0}, Lcom/helpshift/xamarin/support/HelpshiftSupport$1;->call()Ljava/util/HashMap;

    move-result-object v0

    return-object v0
.end method
