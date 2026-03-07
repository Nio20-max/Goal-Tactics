.class public Lcom/helpshift/support/conversations/messages/UserAttachmentMessageViewDataBinder;
.super Lcom/helpshift/support/conversations/messages/MessageViewDataBinder;
.source "UserAttachmentMessageViewDataBinder.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/helpshift/support/conversations/messages/UserAttachmentMessageViewDataBinder$ViewHolder;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/helpshift/support/conversations/messages/MessageViewDataBinder<",
        "Lcom/helpshift/support/conversations/messages/UserAttachmentMessageViewDataBinder$ViewHolder;",
        "Lcom/helpshift/conversation/activeconversation/message/UserAttachmentMessageDM;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 22
    invoke-direct {p0, p1}, Lcom/helpshift/support/conversations/messages/MessageViewDataBinder;-><init>(Landroid/content/Context;)V

    return-void
.end method


# virtual methods
.method public bridge synthetic bind(Landroidx/recyclerview/widget/RecyclerView$ViewHolder;Lcom/helpshift/conversation/activeconversation/message/MessageDM;)V
    .locals 0

    .line 17
    check-cast p1, Lcom/helpshift/support/conversations/messages/UserAttachmentMessageViewDataBinder$ViewHolder;

    check-cast p2, Lcom/helpshift/conversation/activeconversation/message/UserAttachmentMessageDM;

    invoke-virtual {p0, p1, p2}, Lcom/helpshift/support/conversations/messages/UserAttachmentMessageViewDataBinder;->bind(Lcom/helpshift/support/conversations/messages/UserAttachmentMessageViewDataBinder$ViewHolder;Lcom/helpshift/conversation/activeconversation/message/UserAttachmentMessageDM;)V

    return-void
.end method

.method public bind(Lcom/helpshift/support/conversations/messages/UserAttachmentMessageViewDataBinder$ViewHolder;Lcom/helpshift/conversation/activeconversation/message/UserAttachmentMessageDM;)V
    .locals 19

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    .line 44
    iget-object v3, v0, Lcom/helpshift/support/conversations/messages/UserAttachmentMessageViewDataBinder;->context:Landroid/content/Context;

    const v4, 0x1010036

    invoke-static {v3, v4}, Lcom/helpshift/support/util/Styles;->getColor(Landroid/content/Context;I)I

    move-result v3

    .line 45
    iget-object v4, v0, Lcom/helpshift/support/conversations/messages/UserAttachmentMessageViewDataBinder;->context:Landroid/content/Context;

    const v5, 0x1010038

    invoke-static {v4, v5}, Lcom/helpshift/support/util/Styles;->getColor(Landroid/content/Context;I)I

    move-result v4

    .line 47
    invoke-virtual/range {p2 .. p2}, Lcom/helpshift/conversation/activeconversation/message/UserAttachmentMessageDM;->getFormattedFileSize()Ljava/lang/String;

    move-result-object v5

    .line 56
    invoke-virtual/range {p2 .. p2}, Lcom/helpshift/conversation/activeconversation/message/UserAttachmentMessageDM;->getSubText()Ljava/lang/String;

    move-result-object v6

    .line 58
    sget-object v7, Lcom/helpshift/support/conversations/messages/UserAttachmentMessageViewDataBinder$2;->$SwitchMap$com$helpshift$conversation$activeconversation$message$UserAttachmentMessageDM$UserGenericAttachmentState:[I

    iget-object v8, v2, Lcom/helpshift/conversation/activeconversation/message/UserAttachmentMessageDM;->state:Lcom/helpshift/conversation/activeconversation/message/UserAttachmentMessageDM$UserGenericAttachmentState;

    invoke-virtual {v8}, Lcom/helpshift/conversation/activeconversation/message/UserAttachmentMessageDM$UserGenericAttachmentState;->ordinal()I

    move-result v8

    aget v7, v7, v8

    const-string v10, ""

    const/4 v11, 0x2

    const/4 v12, 0x0

    const/4 v13, 0x1

    const/high16 v14, 0x3f000000    # 0.5f

    packed-switch v7, :pswitch_data_0

    move-object v7, v10

    move-object/from16 v16, v7

    const/high16 v8, 0x3f000000    # 0.5f

    const/4 v9, 0x0

    const/4 v11, 0x0

    const/4 v13, 0x0

    const/4 v14, 0x0

    :goto_0
    const/4 v15, 0x0

    goto/16 :goto_4

    .line 119
    :pswitch_0
    invoke-virtual/range {p2 .. p2}, Lcom/helpshift/conversation/activeconversation/message/UserAttachmentMessageDM;->getProgressAndFileSize()Ljava/lang/String;

    move-result-object v5

    .line 120
    iget-object v7, v0, Lcom/helpshift/support/conversations/messages/UserAttachmentMessageViewDataBinder;->context:Landroid/content/Context;

    sget v14, Lcom/helpshift/R$string;->hs__user_sent_message_voice_over:I

    new-array v15, v13, [Ljava/lang/Object;

    .line 121
    invoke-virtual/range {p2 .. p2}, Lcom/helpshift/conversation/activeconversation/message/UserAttachmentMessageDM;->getAccessbilityMessageTime()Ljava/lang/String;

    move-result-object v16

    aput-object v16, v15, v12

    invoke-virtual {v7, v14, v15}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    .line 122
    iget-object v14, v0, Lcom/helpshift/support/conversations/messages/UserAttachmentMessageViewDataBinder;->context:Landroid/content/Context;

    sget v15, Lcom/helpshift/R$string;->hs__attachment_downloading_voice_over:I

    const/4 v8, 0x3

    new-array v8, v8, [Ljava/lang/Object;

    iget-object v9, v2, Lcom/helpshift/conversation/activeconversation/message/UserAttachmentMessageDM;->fileName:Ljava/lang/String;

    aput-object v9, v8, v12

    .line 124
    invoke-virtual/range {p2 .. p2}, Lcom/helpshift/conversation/activeconversation/message/UserAttachmentMessageDM;->getProgressAndFileSize()Ljava/lang/String;

    move-result-object v9

    aput-object v9, v8, v13

    .line 125
    invoke-virtual/range {p2 .. p2}, Lcom/helpshift/conversation/activeconversation/message/UserAttachmentMessageDM;->getFormattedFileSize()Ljava/lang/String;

    move-result-object v9

    aput-object v9, v8, v11

    .line 122
    invoke-virtual {v14, v15, v8}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v8

    move-object/from16 v16, v10

    const/4 v9, 0x0

    const/4 v11, 0x1

    const/4 v13, 0x0

    const/4 v14, 0x0

    const/4 v15, 0x0

    goto/16 :goto_3

    .line 109
    :pswitch_1
    iget-object v7, v0, Lcom/helpshift/support/conversations/messages/UserAttachmentMessageViewDataBinder;->context:Landroid/content/Context;

    sget v8, Lcom/helpshift/R$string;->hs__user_sent_message_voice_over:I

    new-array v9, v13, [Ljava/lang/Object;

    .line 110
    invoke-virtual/range {p2 .. p2}, Lcom/helpshift/conversation/activeconversation/message/UserAttachmentMessageDM;->getAccessbilityMessageTime()Ljava/lang/String;

    move-result-object v14

    aput-object v14, v9, v12

    invoke-virtual {v7, v8, v9}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    .line 111
    iget-object v8, v0, Lcom/helpshift/support/conversations/messages/UserAttachmentMessageViewDataBinder;->context:Landroid/content/Context;

    sget v9, Lcom/helpshift/R$string;->hs__attachment_not_downloaded_voice_over:I

    new-array v11, v11, [Ljava/lang/Object;

    iget-object v14, v2, Lcom/helpshift/conversation/activeconversation/message/UserAttachmentMessageDM;->fileName:Ljava/lang/String;

    aput-object v14, v11, v12

    .line 113
    invoke-virtual/range {p2 .. p2}, Lcom/helpshift/conversation/activeconversation/message/UserAttachmentMessageDM;->getFormattedFileSize()Ljava/lang/String;

    move-result-object v14

    aput-object v14, v11, v13

    .line 111
    invoke-virtual {v8, v9, v11}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v8

    move-object/from16 v16, v10

    const/4 v9, 0x0

    const/4 v11, 0x0

    const/4 v12, 0x1

    const/4 v13, 0x0

    goto/16 :goto_2

    .line 93
    :pswitch_2
    iget-boolean v4, v2, Lcom/helpshift/conversation/activeconversation/message/UserAttachmentMessageDM;->isRejected:Z

    if-eqz v4, :cond_0

    .line 94
    iget-object v4, v0, Lcom/helpshift/support/conversations/messages/UserAttachmentMessageViewDataBinder;->context:Landroid/content/Context;

    sget v6, Lcom/helpshift/R$string;->hs__file_type_unsupported:I

    invoke-virtual {v4, v6}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v4

    goto :goto_1

    .line 97
    :cond_0
    iget-object v4, v0, Lcom/helpshift/support/conversations/messages/UserAttachmentMessageViewDataBinder;->context:Landroid/content/Context;

    invoke-virtual {v4}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    sget v6, Lcom/helpshift/R$string;->hs__sending_fail_msg:I

    invoke-virtual {v4, v6}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v4

    :goto_1
    move-object v6, v4

    .line 99
    iget-object v4, v0, Lcom/helpshift/support/conversations/messages/UserAttachmentMessageViewDataBinder;->context:Landroid/content/Context;

    sget v7, Lcom/helpshift/R$attr;->hs__errorTextColor:I

    invoke-static {v4, v7}, Lcom/helpshift/support/util/Styles;->getColor(Landroid/content/Context;I)I

    move-result v4

    .line 100
    iget-object v7, v0, Lcom/helpshift/support/conversations/messages/UserAttachmentMessageViewDataBinder;->context:Landroid/content/Context;

    sget v8, Lcom/helpshift/R$string;->hs__user_attachment_rejected_voice_over:I

    invoke-virtual {v7, v8}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v7

    .line 101
    iget-object v8, v0, Lcom/helpshift/support/conversations/messages/UserAttachmentMessageViewDataBinder;->context:Landroid/content/Context;

    sget v9, Lcom/helpshift/R$string;->hs__attachment_name_voice_over:I

    new-array v11, v11, [Ljava/lang/Object;

    iget-object v15, v2, Lcom/helpshift/conversation/activeconversation/message/UserAttachmentMessageDM;->fileName:Ljava/lang/String;

    aput-object v15, v11, v12

    .line 102
    invoke-virtual/range {p2 .. p2}, Lcom/helpshift/conversation/activeconversation/message/UserAttachmentMessageDM;->getFormattedFileSize()Ljava/lang/String;

    move-result-object v15

    aput-object v15, v11, v13

    .line 101
    invoke-virtual {v8, v9, v11}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v8

    move-object/from16 v16, v10

    const/4 v9, 0x0

    const/4 v11, 0x0

    const/4 v14, 0x0

    const/4 v15, 0x0

    move-object v10, v7

    move-object v7, v8

    const/high16 v8, 0x3f000000    # 0.5f

    goto/16 :goto_4

    .line 82
    :pswitch_3
    iget-object v4, v0, Lcom/helpshift/support/conversations/messages/UserAttachmentMessageViewDataBinder;->context:Landroid/content/Context;

    invoke-virtual {v4}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    sget v6, Lcom/helpshift/R$string;->hs__sending_fail_msg:I

    invoke-virtual {v4, v6}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v6

    .line 83
    iget-object v4, v0, Lcom/helpshift/support/conversations/messages/UserAttachmentMessageViewDataBinder;->context:Landroid/content/Context;

    sget v7, Lcom/helpshift/R$attr;->hs__errorTextColor:I

    invoke-static {v4, v7}, Lcom/helpshift/support/util/Styles;->getColor(Landroid/content/Context;I)I

    move-result v4

    .line 84
    iget-object v7, v0, Lcom/helpshift/support/conversations/messages/UserAttachmentMessageViewDataBinder;->context:Landroid/content/Context;

    sget v8, Lcom/helpshift/R$string;->hs__user_failed_message_voice_over:I

    invoke-virtual {v7, v8}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v10

    .line 85
    iget-object v7, v0, Lcom/helpshift/support/conversations/messages/UserAttachmentMessageViewDataBinder;->context:Landroid/content/Context;

    sget v8, Lcom/helpshift/R$string;->hs__retry_button_voice_over:I

    invoke-virtual {v7, v8}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v7

    .line 86
    iget-object v8, v0, Lcom/helpshift/support/conversations/messages/UserAttachmentMessageViewDataBinder;->context:Landroid/content/Context;

    sget v9, Lcom/helpshift/R$string;->hs__attachment_name_voice_over:I

    new-array v11, v11, [Ljava/lang/Object;

    iget-object v15, v2, Lcom/helpshift/conversation/activeconversation/message/UserAttachmentMessageDM;->fileName:Ljava/lang/String;

    aput-object v15, v11, v12

    .line 87
    invoke-virtual/range {p2 .. p2}, Lcom/helpshift/conversation/activeconversation/message/UserAttachmentMessageDM;->getFormattedFileSize()Ljava/lang/String;

    move-result-object v15

    aput-object v15, v11, v13

    .line 86
    invoke-virtual {v8, v9, v11}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v8

    move-object v9, v1

    move-object/from16 v16, v7

    move-object v7, v8

    const/high16 v8, 0x3f000000    # 0.5f

    const/4 v11, 0x0

    const/4 v14, 0x1

    goto/16 :goto_0

    .line 70
    :pswitch_4
    iget-object v3, v0, Lcom/helpshift/support/conversations/messages/UserAttachmentMessageViewDataBinder;->context:Landroid/content/Context;

    sget v7, Lcom/helpshift/R$attr;->colorAccent:I

    invoke-static {v3, v7}, Lcom/helpshift/support/util/Styles;->getColor(Landroid/content/Context;I)I

    move-result v3

    .line 72
    iget-object v7, v0, Lcom/helpshift/support/conversations/messages/UserAttachmentMessageViewDataBinder;->context:Landroid/content/Context;

    sget v8, Lcom/helpshift/R$string;->hs__user_sent_message_voice_over:I

    new-array v9, v13, [Ljava/lang/Object;

    .line 73
    invoke-virtual/range {p2 .. p2}, Lcom/helpshift/conversation/activeconversation/message/UserAttachmentMessageDM;->getAccessbilityMessageTime()Ljava/lang/String;

    move-result-object v11

    aput-object v11, v9, v12

    invoke-virtual {v7, v8, v9}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    .line 74
    iget-object v8, v0, Lcom/helpshift/support/conversations/messages/UserAttachmentMessageViewDataBinder;->context:Landroid/content/Context;

    sget v9, Lcom/helpshift/R$string;->hs__attachment_downloaded__voice_over:I

    new-array v11, v13, [Ljava/lang/Object;

    iget-object v14, v2, Lcom/helpshift/conversation/activeconversation/message/UserAttachmentMessageDM;->fileName:Ljava/lang/String;

    aput-object v14, v11, v12

    invoke-virtual {v8, v9, v11}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v8

    move-object/from16 v16, v10

    const/4 v9, 0x0

    const/4 v11, 0x0

    :goto_2
    const/4 v14, 0x0

    const/4 v15, 0x1

    :goto_3
    move-object v10, v7

    move-object v7, v8

    const/high16 v8, 0x3f800000    # 1.0f

    goto :goto_4

    .line 62
    :pswitch_5
    invoke-virtual/range {p2 .. p2}, Lcom/helpshift/conversation/activeconversation/message/UserAttachmentMessageDM;->getFormattedFileSize()Ljava/lang/String;

    move-result-object v5

    .line 63
    iget-object v6, v0, Lcom/helpshift/support/conversations/messages/UserAttachmentMessageViewDataBinder;->context:Landroid/content/Context;

    invoke-virtual {v6}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v6

    sget v7, Lcom/helpshift/R$string;->hs__sending_msg:I

    invoke-virtual {v6, v7}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v6

    .line 64
    iget-object v7, v0, Lcom/helpshift/support/conversations/messages/UserAttachmentMessageViewDataBinder;->context:Landroid/content/Context;

    sget v8, Lcom/helpshift/R$string;->hs__user_sending_message_voice_over:I

    invoke-virtual {v7, v8}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v7

    move-object/from16 v16, v10

    const/high16 v8, 0x3f000000    # 0.5f

    const/4 v9, 0x0

    const/4 v11, 0x1

    const/4 v13, 0x0

    const/4 v14, 0x0

    const/4 v15, 0x0

    move-object v10, v7

    move-object/from16 v7, v16

    .line 130
    :goto_4
    invoke-virtual/range {p2 .. p2}, Lcom/helpshift/conversation/activeconversation/message/UserAttachmentMessageDM;->getUiViewState()Lcom/helpshift/conversation/activeconversation/message/UIViewState;

    move-result-object v17

    move-object/from16 v18, v7

    .line 131
    iget-object v7, v1, Lcom/helpshift/support/conversations/messages/UserAttachmentMessageViewDataBinder$ViewHolder;->downloadButton:Landroid/view/View;

    invoke-virtual {v0, v7, v12}, Lcom/helpshift/support/conversations/messages/UserAttachmentMessageViewDataBinder;->setViewVisibility(Landroid/view/View;Z)V

    .line 132
    iget-object v7, v1, Lcom/helpshift/support/conversations/messages/UserAttachmentMessageViewDataBinder$ViewHolder;->attachmentIcon:Landroid/widget/ImageView;

    invoke-virtual {v0, v7, v13}, Lcom/helpshift/support/conversations/messages/UserAttachmentMessageViewDataBinder;->setViewVisibility(Landroid/view/View;Z)V

    .line 133
    iget-object v7, v1, Lcom/helpshift/support/conversations/messages/UserAttachmentMessageViewDataBinder$ViewHolder;->progress:Landroid/widget/ProgressBar;

    invoke-virtual {v0, v7, v11}, Lcom/helpshift/support/conversations/messages/UserAttachmentMessageViewDataBinder;->setViewVisibility(Landroid/view/View;Z)V

    .line 134
    iget-object v7, v1, Lcom/helpshift/support/conversations/messages/UserAttachmentMessageViewDataBinder$ViewHolder;->retryButton:Landroid/widget/ImageView;

    invoke-virtual {v0, v7, v14}, Lcom/helpshift/support/conversations/messages/UserAttachmentMessageViewDataBinder;->setViewVisibility(Landroid/view/View;Z)V

    .line 135
    iget-object v7, v1, Lcom/helpshift/support/conversations/messages/UserAttachmentMessageViewDataBinder$ViewHolder;->subText:Landroid/widget/TextView;

    invoke-virtual/range {v17 .. v17}, Lcom/helpshift/conversation/activeconversation/message/UIViewState;->isFooterVisible()Z

    move-result v11

    invoke-virtual {v0, v7, v11}, Lcom/helpshift/support/conversations/messages/UserAttachmentMessageViewDataBinder;->setViewVisibility(Landroid/view/View;Z)V

    .line 137
    iget-object v7, v1, Lcom/helpshift/support/conversations/messages/UserAttachmentMessageViewDataBinder$ViewHolder;->messageLayout:Landroid/view/View;

    invoke-virtual {v7, v8}, Landroid/view/View;->setAlpha(F)V

    .line 139
    iget-object v7, v1, Lcom/helpshift/support/conversations/messages/UserAttachmentMessageViewDataBinder$ViewHolder;->fileName:Landroid/widget/TextView;

    iget-object v8, v2, Lcom/helpshift/conversation/activeconversation/message/UserAttachmentMessageDM;->fileName:Ljava/lang/String;

    invoke-virtual {v7, v8}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 140
    iget-object v7, v1, Lcom/helpshift/support/conversations/messages/UserAttachmentMessageViewDataBinder$ViewHolder;->fileSize:Landroid/widget/TextView;

    invoke-virtual {v7, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 141
    iget-object v5, v1, Lcom/helpshift/support/conversations/messages/UserAttachmentMessageViewDataBinder$ViewHolder;->fileName:Landroid/widget/TextView;

    invoke-virtual {v5, v3}, Landroid/widget/TextView;->setTextColor(I)V

    .line 143
    invoke-virtual/range {v17 .. v17}, Lcom/helpshift/conversation/activeconversation/message/UIViewState;->isFooterVisible()Z

    move-result v3

    if-eqz v3, :cond_1

    .line 144
    iget-object v3, v1, Lcom/helpshift/support/conversations/messages/UserAttachmentMessageViewDataBinder$ViewHolder;->subText:Landroid/widget/TextView;

    invoke-virtual {v3, v6}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 145
    iget-object v3, v1, Lcom/helpshift/support/conversations/messages/UserAttachmentMessageViewDataBinder$ViewHolder;->subText:Landroid/widget/TextView;

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setTextColor(I)V

    :cond_1
    if-eqz v14, :cond_2

    .line 148
    iget-object v3, v1, Lcom/helpshift/support/conversations/messages/UserAttachmentMessageViewDataBinder$ViewHolder;->retryButton:Landroid/widget/ImageView;

    invoke-virtual {v3, v9}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    const/4 v4, 0x0

    goto :goto_5

    .line 151
    :cond_2
    iget-object v3, v1, Lcom/helpshift/support/conversations/messages/UserAttachmentMessageViewDataBinder$ViewHolder;->retryButton:Landroid/widget/ImageView;

    const/4 v4, 0x0

    invoke-virtual {v3, v4}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    :goto_5
    if-eqz v15, :cond_3

    .line 155
    iget-object v3, v1, Lcom/helpshift/support/conversations/messages/UserAttachmentMessageViewDataBinder$ViewHolder;->messageLayout:Landroid/view/View;

    new-instance v4, Lcom/helpshift/support/conversations/messages/UserAttachmentMessageViewDataBinder$1;

    invoke-direct {v4, v0, v2}, Lcom/helpshift/support/conversations/messages/UserAttachmentMessageViewDataBinder$1;-><init>(Lcom/helpshift/support/conversations/messages/UserAttachmentMessageViewDataBinder;Lcom/helpshift/conversation/activeconversation/message/UserAttachmentMessageDM;)V

    invoke-virtual {v3, v4}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    goto :goto_6

    .line 163
    :cond_3
    iget-object v2, v1, Lcom/helpshift/support/conversations/messages/UserAttachmentMessageViewDataBinder$ViewHolder;->messageLayout:Landroid/view/View;

    invoke-virtual {v2, v4}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 165
    :goto_6
    iget-object v2, v1, Lcom/helpshift/support/conversations/messages/UserAttachmentMessageViewDataBinder$ViewHolder;->messageContainer:Landroid/view/View;

    invoke-virtual {v2, v10}, Landroid/view/View;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 166
    iget-object v2, v1, Lcom/helpshift/support/conversations/messages/UserAttachmentMessageViewDataBinder$ViewHolder;->messageLayout:Landroid/view/View;

    move-object/from16 v8, v18

    invoke-virtual {v2, v8}, Landroid/view/View;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 167
    iget-object v1, v1, Lcom/helpshift/support/conversations/messages/UserAttachmentMessageViewDataBinder$ViewHolder;->retryButton:Landroid/widget/ImageView;

    move-object/from16 v10, v16

    invoke-virtual {v1, v10}, Landroid/widget/ImageView;->setContentDescription(Ljava/lang/CharSequence;)V

    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public bridge synthetic createViewHolder(Landroid/view/ViewGroup;)Landroidx/recyclerview/widget/RecyclerView$ViewHolder;
    .locals 0

    .line 17
    invoke-virtual {p0, p1}, Lcom/helpshift/support/conversations/messages/UserAttachmentMessageViewDataBinder;->createViewHolder(Landroid/view/ViewGroup;)Lcom/helpshift/support/conversations/messages/UserAttachmentMessageViewDataBinder$ViewHolder;

    move-result-object p1

    return-object p1
.end method

.method public createViewHolder(Landroid/view/ViewGroup;)Lcom/helpshift/support/conversations/messages/UserAttachmentMessageViewDataBinder$ViewHolder;
    .locals 3

    .line 27
    iget-object v0, p0, Lcom/helpshift/support/conversations/messages/UserAttachmentMessageViewDataBinder;->context:Landroid/content/Context;

    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    sget v1, Lcom/helpshift/R$layout;->hs__msg_user_attachment_generic:I

    const/4 v2, 0x0

    .line 28
    invoke-virtual {v0, v1, p1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    .line 30
    new-instance v0, Lcom/helpshift/support/conversations/messages/UserAttachmentMessageViewDataBinder$ViewHolder;

    invoke-direct {v0, p0, p1}, Lcom/helpshift/support/conversations/messages/UserAttachmentMessageViewDataBinder$ViewHolder;-><init>(Lcom/helpshift/support/conversations/messages/UserAttachmentMessageViewDataBinder;Landroid/view/View;)V

    return-object v0
.end method
