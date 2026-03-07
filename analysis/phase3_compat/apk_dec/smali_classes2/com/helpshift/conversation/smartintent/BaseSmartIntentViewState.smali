.class public abstract Lcom/helpshift/conversation/smartintent/BaseSmartIntentViewState;
.super Ljava/lang/Object;
.source "BaseSmartIntentViewState.java"


# instance fields
.field public final enforceIntentSelection:Z

.field public final promptTitle:Ljava/lang/String;


# direct methods
.method protected constructor <init>(Ljava/lang/String;Z)V
    .locals 0

    .line 8
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 9
    iput-object p1, p0, Lcom/helpshift/conversation/smartintent/BaseSmartIntentViewState;->promptTitle:Ljava/lang/String;

    .line 10
    iput-boolean p2, p0, Lcom/helpshift/conversation/smartintent/BaseSmartIntentViewState;->enforceIntentSelection:Z

    return-void
.end method
