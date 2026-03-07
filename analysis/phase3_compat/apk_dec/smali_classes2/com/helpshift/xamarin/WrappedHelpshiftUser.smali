.class public Lcom/helpshift/xamarin/WrappedHelpshiftUser;
.super Ljava/lang/Object;
.source "WrappedHelpshiftUser.java"


# instance fields
.field public final authToken:Ljava/lang/String;

.field public final email:Ljava/lang/String;

.field public final identifier:Ljava/lang/String;

.field public final name:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 10
    iput-object p1, p0, Lcom/helpshift/xamarin/WrappedHelpshiftUser;->identifier:Ljava/lang/String;

    .line 11
    iput-object p2, p0, Lcom/helpshift/xamarin/WrappedHelpshiftUser;->email:Ljava/lang/String;

    .line 12
    iput-object p3, p0, Lcom/helpshift/xamarin/WrappedHelpshiftUser;->name:Ljava/lang/String;

    .line 13
    iput-object p4, p0, Lcom/helpshift/xamarin/WrappedHelpshiftUser;->authToken:Ljava/lang/String;

    return-void
.end method
