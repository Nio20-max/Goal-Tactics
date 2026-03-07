.class public Lcom/helpshift/xamarin/support/HelpshiftSupportMetadata;
.super Ljava/lang/Object;
.source "HelpshiftSupportMetadata.java"


# instance fields
.field public final issueTags:[Ljava/lang/String;

.field public final metadataJson:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;[Ljava/lang/String;)V
    .locals 0

    .line 8
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 9
    iput-object p1, p0, Lcom/helpshift/xamarin/support/HelpshiftSupportMetadata;->metadataJson:Ljava/lang/String;

    .line 10
    iput-object p2, p0, Lcom/helpshift/xamarin/support/HelpshiftSupportMetadata;->issueTags:[Ljava/lang/String;

    return-void
.end method
