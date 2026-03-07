.class public Lcom/helpshift/xamarin/flows/HelpshiftFAQsFlow;
.super Ljava/lang/Object;
.source "HelpshiftFAQsFlow.java"

# interfaces
.implements Lcom/helpshift/xamarin/flows/Flow;


# instance fields
.field private final config:Lcom/helpshift/xamarin/support/HelpshiftAPIConfig;

.field private final label:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Lcom/helpshift/xamarin/support/HelpshiftAPIConfig;)V
    .locals 0

    .line 10
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 11
    iput-object p1, p0, Lcom/helpshift/xamarin/flows/HelpshiftFAQsFlow;->label:Ljava/lang/String;

    .line 12
    iput-object p2, p0, Lcom/helpshift/xamarin/flows/HelpshiftFAQsFlow;->config:Lcom/helpshift/xamarin/support/HelpshiftAPIConfig;

    return-void
.end method


# virtual methods
.method public getApiConfig()Lcom/helpshift/xamarin/support/HelpshiftAPIConfig;
    .locals 1

    .line 22
    iget-object v0, p0, Lcom/helpshift/xamarin/flows/HelpshiftFAQsFlow;->config:Lcom/helpshift/xamarin/support/HelpshiftAPIConfig;

    return-object v0
.end method

.method public getLabel()Ljava/lang/String;
    .locals 1

    .line 17
    iget-object v0, p0, Lcom/helpshift/xamarin/flows/HelpshiftFAQsFlow;->label:Ljava/lang/String;

    return-object v0
.end method
