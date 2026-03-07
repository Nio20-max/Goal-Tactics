.class public Lcom/helpshift/conversation/smartintent/SmartIntentSavedState;
.super Ljava/lang/Object;
.source "SmartIntentSavedState.java"

# interfaces
.implements Ljava/io/Serializable;


# instance fields
.field public final isBottomSheetInExpandedState:Z

.field public final isSearchUIVisible:Z

.field public final isShowingTAI:Z

.field public final selectedRootIntentLocalId:Ljava/lang/Long;

.field public final userTypedQuery:Ljava/lang/String;


# direct methods
.method public constructor <init>(ZLjava/lang/Long;Ljava/lang/String;ZZ)V
    .locals 0

    .line 19
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 20
    iput-boolean p1, p0, Lcom/helpshift/conversation/smartintent/SmartIntentSavedState;->isBottomSheetInExpandedState:Z

    .line 21
    iput-object p2, p0, Lcom/helpshift/conversation/smartintent/SmartIntentSavedState;->selectedRootIntentLocalId:Ljava/lang/Long;

    .line 22
    iput-object p3, p0, Lcom/helpshift/conversation/smartintent/SmartIntentSavedState;->userTypedQuery:Ljava/lang/String;

    .line 23
    iput-boolean p4, p0, Lcom/helpshift/conversation/smartintent/SmartIntentSavedState;->isSearchUIVisible:Z

    .line 24
    iput-boolean p5, p0, Lcom/helpshift/conversation/smartintent/SmartIntentSavedState;->isShowingTAI:Z

    return-void
.end method
