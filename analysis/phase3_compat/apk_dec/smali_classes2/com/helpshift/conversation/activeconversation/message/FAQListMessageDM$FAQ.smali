.class public final Lcom/helpshift/conversation/activeconversation/message/FAQListMessageDM$FAQ;
.super Ljava/lang/Object;
.source "FAQListMessageDM.java"

# interfaces
.implements Lcom/helpshift/util/HSCloneable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/helpshift/conversation/activeconversation/message/FAQListMessageDM;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "FAQ"
.end annotation


# instance fields
.field public final language:Ljava/lang/String;

.field public final publishId:Ljava/lang/String;

.field public final title:Ljava/lang/String;


# direct methods
.method private constructor <init>(Lcom/helpshift/conversation/activeconversation/message/FAQListMessageDM$FAQ;)V
    .locals 1

    .line 169
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 170
    iget-object v0, p1, Lcom/helpshift/conversation/activeconversation/message/FAQListMessageDM$FAQ;->title:Ljava/lang/String;

    iput-object v0, p0, Lcom/helpshift/conversation/activeconversation/message/FAQListMessageDM$FAQ;->title:Ljava/lang/String;

    .line 171
    iget-object v0, p1, Lcom/helpshift/conversation/activeconversation/message/FAQListMessageDM$FAQ;->publishId:Ljava/lang/String;

    iput-object v0, p0, Lcom/helpshift/conversation/activeconversation/message/FAQListMessageDM$FAQ;->publishId:Ljava/lang/String;

    .line 172
    iget-object p1, p1, Lcom/helpshift/conversation/activeconversation/message/FAQListMessageDM$FAQ;->language:Ljava/lang/String;

    iput-object p1, p0, Lcom/helpshift/conversation/activeconversation/message/FAQListMessageDM$FAQ;->language:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 163
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 164
    iput-object p1, p0, Lcom/helpshift/conversation/activeconversation/message/FAQListMessageDM$FAQ;->title:Ljava/lang/String;

    .line 165
    iput-object p2, p0, Lcom/helpshift/conversation/activeconversation/message/FAQListMessageDM$FAQ;->publishId:Ljava/lang/String;

    .line 166
    iput-object p3, p0, Lcom/helpshift/conversation/activeconversation/message/FAQListMessageDM$FAQ;->language:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public deepClone()Lcom/helpshift/conversation/activeconversation/message/FAQListMessageDM$FAQ;
    .locals 1

    .line 177
    new-instance v0, Lcom/helpshift/conversation/activeconversation/message/FAQListMessageDM$FAQ;

    invoke-direct {v0, p0}, Lcom/helpshift/conversation/activeconversation/message/FAQListMessageDM$FAQ;-><init>(Lcom/helpshift/conversation/activeconversation/message/FAQListMessageDM$FAQ;)V

    return-object v0
.end method

.method public bridge synthetic deepClone()Ljava/lang/Object;
    .locals 1

    .line 158
    invoke-virtual {p0}, Lcom/helpshift/conversation/activeconversation/message/FAQListMessageDM$FAQ;->deepClone()Lcom/helpshift/conversation/activeconversation/message/FAQListMessageDM$FAQ;

    move-result-object v0

    return-object v0
.end method
