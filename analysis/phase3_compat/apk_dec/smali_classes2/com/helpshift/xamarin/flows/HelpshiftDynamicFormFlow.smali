.class public Lcom/helpshift/xamarin/flows/HelpshiftDynamicFormFlow;
.super Ljava/lang/Object;
.source "HelpshiftDynamicFormFlow.java"

# interfaces
.implements Lcom/helpshift/xamarin/flows/Flow;


# instance fields
.field private final flows:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/helpshift/xamarin/flows/Flow;",
            ">;"
        }
    .end annotation
.end field

.field private final label:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Lcom/helpshift/xamarin/flows/Flow;",
            ">;)V"
        }
    .end annotation

    .line 12
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 13
    iput-object p1, p0, Lcom/helpshift/xamarin/flows/HelpshiftDynamicFormFlow;->label:Ljava/lang/String;

    .line 14
    iput-object p2, p0, Lcom/helpshift/xamarin/flows/HelpshiftDynamicFormFlow;->flows:Ljava/util/List;

    return-void
.end method


# virtual methods
.method public getApiConfig()Lcom/helpshift/xamarin/support/HelpshiftAPIConfig;
    .locals 1

    const/4 v0, 0x0

    return-object v0
.end method

.method public getFlows()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/helpshift/xamarin/flows/Flow;",
            ">;"
        }
    .end annotation

    .line 28
    iget-object v0, p0, Lcom/helpshift/xamarin/flows/HelpshiftDynamicFormFlow;->flows:Ljava/util/List;

    return-object v0
.end method

.method public getLabel()Ljava/lang/String;
    .locals 1

    .line 19
    iget-object v0, p0, Lcom/helpshift/xamarin/flows/HelpshiftDynamicFormFlow;->label:Ljava/lang/String;

    return-object v0
.end method
