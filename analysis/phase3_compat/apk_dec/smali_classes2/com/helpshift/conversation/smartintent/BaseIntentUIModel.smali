.class public abstract Lcom/helpshift/conversation/smartintent/BaseIntentUIModel;
.super Ljava/lang/Object;
.source "BaseIntentUIModel.java"


# instance fields
.field public final label:Ljava/lang/String;

.field public final localId:J


# direct methods
.method public constructor <init>(JLjava/lang/String;)V
    .locals 0

    .line 8
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 9
    iput-wide p1, p0, Lcom/helpshift/conversation/smartintent/BaseIntentUIModel;->localId:J

    .line 10
    iput-object p3, p0, Lcom/helpshift/conversation/smartintent/BaseIntentUIModel;->label:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public abstract getType()Lcom/helpshift/conversation/smartintent/SmartIntentType;
.end method
