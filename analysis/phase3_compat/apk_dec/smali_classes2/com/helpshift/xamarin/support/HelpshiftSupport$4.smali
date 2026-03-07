.class final Lcom/helpshift/xamarin/support/HelpshiftSupport$4;
.super Ljava/lang/Object;
.source "HelpshiftSupport.java"

# interfaces
.implements Lcom/helpshift/support/MetadataCallable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/helpshift/xamarin/support/HelpshiftSupport;->setMetadata(Lcom/helpshift/xamarin/support/HelpshiftSupportMetadata;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# instance fields
.field final synthetic val$metadata:Lcom/helpshift/support/Metadata;


# direct methods
.method constructor <init>(Lcom/helpshift/support/Metadata;)V
    .locals 0

    .line 263
    iput-object p1, p0, Lcom/helpshift/xamarin/support/HelpshiftSupport$4;->val$metadata:Lcom/helpshift/support/Metadata;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public call()Lcom/helpshift/support/Metadata;
    .locals 1

    .line 266
    iget-object v0, p0, Lcom/helpshift/xamarin/support/HelpshiftSupport$4;->val$metadata:Lcom/helpshift/support/Metadata;

    return-object v0
.end method
