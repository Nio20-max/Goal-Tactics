.class public final enum Lcom/helpshift/support/fragments/AttachmentPreviewFragment$AttachmentAction;
.super Ljava/lang/Enum;
.source "AttachmentPreviewFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/helpshift/support/fragments/AttachmentPreviewFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "AttachmentAction"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/helpshift/support/fragments/AttachmentPreviewFragment$AttachmentAction;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/helpshift/support/fragments/AttachmentPreviewFragment$AttachmentAction;

.field public static final enum ADD:Lcom/helpshift/support/fragments/AttachmentPreviewFragment$AttachmentAction;

.field public static final enum CHANGE:Lcom/helpshift/support/fragments/AttachmentPreviewFragment$AttachmentAction;

.field public static final enum REMOVE:Lcom/helpshift/support/fragments/AttachmentPreviewFragment$AttachmentAction;

.field public static final enum SEND:Lcom/helpshift/support/fragments/AttachmentPreviewFragment$AttachmentAction;


# direct methods
.method static constructor <clinit>()V
    .locals 9

    .line 341
    new-instance v0, Lcom/helpshift/support/fragments/AttachmentPreviewFragment$AttachmentAction;

    const-string v1, "ADD"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/helpshift/support/fragments/AttachmentPreviewFragment$AttachmentAction;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/helpshift/support/fragments/AttachmentPreviewFragment$AttachmentAction;->ADD:Lcom/helpshift/support/fragments/AttachmentPreviewFragment$AttachmentAction;

    .line 342
    new-instance v1, Lcom/helpshift/support/fragments/AttachmentPreviewFragment$AttachmentAction;

    const-string v3, "SEND"

    const/4 v4, 0x1

    invoke-direct {v1, v3, v4}, Lcom/helpshift/support/fragments/AttachmentPreviewFragment$AttachmentAction;-><init>(Ljava/lang/String;I)V

    sput-object v1, Lcom/helpshift/support/fragments/AttachmentPreviewFragment$AttachmentAction;->SEND:Lcom/helpshift/support/fragments/AttachmentPreviewFragment$AttachmentAction;

    .line 343
    new-instance v3, Lcom/helpshift/support/fragments/AttachmentPreviewFragment$AttachmentAction;

    const-string v5, "REMOVE"

    const/4 v6, 0x2

    invoke-direct {v3, v5, v6}, Lcom/helpshift/support/fragments/AttachmentPreviewFragment$AttachmentAction;-><init>(Ljava/lang/String;I)V

    sput-object v3, Lcom/helpshift/support/fragments/AttachmentPreviewFragment$AttachmentAction;->REMOVE:Lcom/helpshift/support/fragments/AttachmentPreviewFragment$AttachmentAction;

    .line 344
    new-instance v5, Lcom/helpshift/support/fragments/AttachmentPreviewFragment$AttachmentAction;

    const-string v7, "CHANGE"

    const/4 v8, 0x3

    invoke-direct {v5, v7, v8}, Lcom/helpshift/support/fragments/AttachmentPreviewFragment$AttachmentAction;-><init>(Ljava/lang/String;I)V

    sput-object v5, Lcom/helpshift/support/fragments/AttachmentPreviewFragment$AttachmentAction;->CHANGE:Lcom/helpshift/support/fragments/AttachmentPreviewFragment$AttachmentAction;

    const/4 v7, 0x4

    new-array v7, v7, [Lcom/helpshift/support/fragments/AttachmentPreviewFragment$AttachmentAction;

    aput-object v0, v7, v2

    aput-object v1, v7, v4

    aput-object v3, v7, v6

    aput-object v5, v7, v8

    .line 340
    sput-object v7, Lcom/helpshift/support/fragments/AttachmentPreviewFragment$AttachmentAction;->$VALUES:[Lcom/helpshift/support/fragments/AttachmentPreviewFragment$AttachmentAction;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 340
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/helpshift/support/fragments/AttachmentPreviewFragment$AttachmentAction;
    .locals 1

    .line 340
    const-class v0, Lcom/helpshift/support/fragments/AttachmentPreviewFragment$AttachmentAction;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/helpshift/support/fragments/AttachmentPreviewFragment$AttachmentAction;

    return-object p0
.end method

.method public static values()[Lcom/helpshift/support/fragments/AttachmentPreviewFragment$AttachmentAction;
    .locals 1

    .line 340
    sget-object v0, Lcom/helpshift/support/fragments/AttachmentPreviewFragment$AttachmentAction;->$VALUES:[Lcom/helpshift/support/fragments/AttachmentPreviewFragment$AttachmentAction;

    invoke-virtual {v0}, [Lcom/helpshift/support/fragments/AttachmentPreviewFragment$AttachmentAction;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/helpshift/support/fragments/AttachmentPreviewFragment$AttachmentAction;

    return-object v0
.end method
