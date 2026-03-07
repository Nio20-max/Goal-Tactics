.class public final Lcom/helpshift/support/conversations/messages/AgentTypingMessageDataBinder$ViewHolder;
.super Landroidx/recyclerview/widget/RecyclerView$ViewHolder;
.source "AgentTypingMessageDataBinder.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/helpshift/support/conversations/messages/AgentTypingMessageDataBinder;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x11
    name = "ViewHolder"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/helpshift/support/conversations/messages/AgentTypingMessageDataBinder;

.field typingContainer:Landroid/widget/LinearLayout;


# direct methods
.method public constructor <init>(Lcom/helpshift/support/conversations/messages/AgentTypingMessageDataBinder;Landroid/view/View;)V
    .locals 0

    .line 47
    iput-object p1, p0, Lcom/helpshift/support/conversations/messages/AgentTypingMessageDataBinder$ViewHolder;->this$0:Lcom/helpshift/support/conversations/messages/AgentTypingMessageDataBinder;

    .line 48
    invoke-direct {p0, p2}, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;-><init>(Landroid/view/View;)V

    .line 49
    sget p1, Lcom/helpshift/R$id;->agent_typing_container:I

    invoke-virtual {p2, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/LinearLayout;

    iput-object p1, p0, Lcom/helpshift/support/conversations/messages/AgentTypingMessageDataBinder$ViewHolder;->typingContainer:Landroid/widget/LinearLayout;

    return-void
.end method
