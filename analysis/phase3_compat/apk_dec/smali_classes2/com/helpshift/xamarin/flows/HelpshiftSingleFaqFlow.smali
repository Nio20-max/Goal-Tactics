.class public Lcom/helpshift/xamarin/flows/HelpshiftSingleFaqFlow;
.super Ljava/lang/Object;
.source "HelpshiftSingleFaqFlow.java"

# interfaces
.implements Lcom/helpshift/xamarin/flows/Flow;


# instance fields
.field private final config:Lcom/helpshift/xamarin/support/HelpshiftAPIConfig;

.field private final faqPublishId:Ljava/lang/String;

.field private final label:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Lcom/helpshift/xamarin/support/HelpshiftAPIConfig;)V
    .locals 0

    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 12
    iput-object p1, p0, Lcom/helpshift/xamarin/flows/HelpshiftSingleFaqFlow;->faqPublishId:Ljava/lang/String;

    .line 13
    iput-object p2, p0, Lcom/helpshift/xamarin/flows/HelpshiftSingleFaqFlow;->label:Ljava/lang/String;

    .line 14
    iput-object p3, p0, Lcom/helpshift/xamarin/flows/HelpshiftSingleFaqFlow;->config:Lcom/helpshift/xamarin/support/HelpshiftAPIConfig;

    return-void
.end method


# virtual methods
.method public getApiConfig()Lcom/helpshift/xamarin/support/HelpshiftAPIConfig;
    .locals 1

    .line 28
    iget-object v0, p0, Lcom/helpshift/xamarin/flows/HelpshiftSingleFaqFlow;->config:Lcom/helpshift/xamarin/support/HelpshiftAPIConfig;

    return-object v0
.end method

.method public getFaqPublishId()Ljava/lang/String;
    .locals 1

    .line 18
    iget-object v0, p0, Lcom/helpshift/xamarin/flows/HelpshiftSingleFaqFlow;->faqPublishId:Ljava/lang/String;

    return-object v0
.end method

.method public getLabel()Ljava/lang/String;
    .locals 1

    .line 23
    iget-object v0, p0, Lcom/helpshift/xamarin/flows/HelpshiftSingleFaqFlow;->label:Ljava/lang/String;

    return-object v0
.end method
