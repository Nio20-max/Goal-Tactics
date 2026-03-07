.class public abstract Lcom/helpshift/conversation/activeconversation/message/AttachmentMessageDM;
.super Lcom/helpshift/conversation/activeconversation/message/MessageDM;
.source "AttachmentMessageDM.java"


# instance fields
.field public attachmentUrl:Ljava/lang/String;

.field public contentType:Ljava/lang/String;

.field public fileName:Ljava/lang/String;

.field public filePath:Ljava/lang/String;

.field public isRejected:Z

.field public isSecureAttachment:Z

.field public isZipped:Z

.field public size:I


# direct methods
.method protected constructor <init>(Lcom/helpshift/conversation/activeconversation/message/AttachmentMessageDM;)V
    .locals 1

    .line 30
    invoke-direct {p0, p1}, Lcom/helpshift/conversation/activeconversation/message/MessageDM;-><init>(Lcom/helpshift/conversation/activeconversation/message/MessageDM;)V

    .line 31
    iget-object v0, p1, Lcom/helpshift/conversation/activeconversation/message/AttachmentMessageDM;->contentType:Ljava/lang/String;

    iput-object v0, p0, Lcom/helpshift/conversation/activeconversation/message/AttachmentMessageDM;->contentType:Ljava/lang/String;

    .line 32
    iget-object v0, p1, Lcom/helpshift/conversation/activeconversation/message/AttachmentMessageDM;->fileName:Ljava/lang/String;

    iput-object v0, p0, Lcom/helpshift/conversation/activeconversation/message/AttachmentMessageDM;->fileName:Ljava/lang/String;

    .line 33
    iget-object v0, p1, Lcom/helpshift/conversation/activeconversation/message/AttachmentMessageDM;->attachmentUrl:Ljava/lang/String;

    iput-object v0, p0, Lcom/helpshift/conversation/activeconversation/message/AttachmentMessageDM;->attachmentUrl:Ljava/lang/String;

    .line 34
    iget v0, p1, Lcom/helpshift/conversation/activeconversation/message/AttachmentMessageDM;->size:I

    iput v0, p0, Lcom/helpshift/conversation/activeconversation/message/AttachmentMessageDM;->size:I

    .line 35
    iget-object v0, p1, Lcom/helpshift/conversation/activeconversation/message/AttachmentMessageDM;->filePath:Ljava/lang/String;

    iput-object v0, p0, Lcom/helpshift/conversation/activeconversation/message/AttachmentMessageDM;->filePath:Ljava/lang/String;

    .line 36
    iget-boolean v0, p1, Lcom/helpshift/conversation/activeconversation/message/AttachmentMessageDM;->isSecureAttachment:Z

    iput-boolean v0, p0, Lcom/helpshift/conversation/activeconversation/message/AttachmentMessageDM;->isSecureAttachment:Z

    .line 37
    iget-boolean v0, p1, Lcom/helpshift/conversation/activeconversation/message/AttachmentMessageDM;->isZipped:Z

    iput-boolean v0, p0, Lcom/helpshift/conversation/activeconversation/message/AttachmentMessageDM;->isZipped:Z

    .line 38
    iget-boolean p1, p1, Lcom/helpshift/conversation/activeconversation/message/AttachmentMessageDM;->isRejected:Z

    iput-boolean p1, p0, Lcom/helpshift/conversation/activeconversation/message/AttachmentMessageDM;->isRejected:Z

    return-void
.end method

.method constructor <init>(Ljava/lang/String;Ljava/lang/String;JLcom/helpshift/conversation/activeconversation/message/Author;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;ZZLcom/helpshift/conversation/activeconversation/message/MessageType;)V
    .locals 9

    move-object v8, p0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-wide v3, p3

    move-object v5, p5

    move/from16 v6, p10

    move-object/from16 v7, p12

    .line 21
    invoke-direct/range {v0 .. v7}, Lcom/helpshift/conversation/activeconversation/message/MessageDM;-><init>(Ljava/lang/String;Ljava/lang/String;JLcom/helpshift/conversation/activeconversation/message/Author;ZLcom/helpshift/conversation/activeconversation/message/MessageType;)V

    move v0, p6

    .line 22
    iput v0, v8, Lcom/helpshift/conversation/activeconversation/message/AttachmentMessageDM;->size:I

    move-object/from16 v0, p7

    .line 23
    iput-object v0, v8, Lcom/helpshift/conversation/activeconversation/message/AttachmentMessageDM;->contentType:Ljava/lang/String;

    move-object/from16 v0, p8

    .line 24
    iput-object v0, v8, Lcom/helpshift/conversation/activeconversation/message/AttachmentMessageDM;->attachmentUrl:Ljava/lang/String;

    move-object/from16 v0, p9

    .line 25
    iput-object v0, v8, Lcom/helpshift/conversation/activeconversation/message/AttachmentMessageDM;->fileName:Ljava/lang/String;

    move/from16 v0, p11

    .line 26
    iput-boolean v0, v8, Lcom/helpshift/conversation/activeconversation/message/AttachmentMessageDM;->isSecureAttachment:Z

    return-void
.end method


# virtual methods
.method public getFormattedFileSize()Ljava/lang/String;
    .locals 2

    .line 42
    iget v0, p0, Lcom/helpshift/conversation/activeconversation/message/AttachmentMessageDM;->size:I

    int-to-double v0, v0

    invoke-static {v0, v1}, Lcom/helpshift/util/AttachmentFileSize;->getFormattedFileSize(D)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method getFormattedFileSize(D)Ljava/lang/String;
    .locals 0

    .line 46
    invoke-static {p1, p2}, Lcom/helpshift/util/AttachmentFileSize;->getFormattedFileSize(D)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method isValidUriPath(Ljava/lang/String;)Z
    .locals 1

    .line 68
    invoke-static {p1}, Lcom/helpshift/util/StringUtils;->isEmpty(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    const-string v0, "content://"

    invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return p1
.end method

.method public merge(Lcom/helpshift/conversation/activeconversation/message/MessageDM;)V
    .locals 1

    .line 51
    invoke-super {p0, p1}, Lcom/helpshift/conversation/activeconversation/message/MessageDM;->merge(Lcom/helpshift/conversation/activeconversation/message/MessageDM;)V

    .line 52
    instance-of v0, p1, Lcom/helpshift/conversation/activeconversation/message/AttachmentMessageDM;

    if-eqz v0, :cond_1

    .line 53
    check-cast p1, Lcom/helpshift/conversation/activeconversation/message/AttachmentMessageDM;

    .line 56
    iget-boolean v0, p1, Lcom/helpshift/conversation/activeconversation/message/AttachmentMessageDM;->isZipped:Z

    if-nez v0, :cond_0

    .line 57
    iget-object v0, p1, Lcom/helpshift/conversation/activeconversation/message/AttachmentMessageDM;->contentType:Ljava/lang/String;

    iput-object v0, p0, Lcom/helpshift/conversation/activeconversation/message/AttachmentMessageDM;->contentType:Ljava/lang/String;

    .line 58
    iget v0, p1, Lcom/helpshift/conversation/activeconversation/message/AttachmentMessageDM;->size:I

    iput v0, p0, Lcom/helpshift/conversation/activeconversation/message/AttachmentMessageDM;->size:I

    .line 59
    iget-object v0, p1, Lcom/helpshift/conversation/activeconversation/message/AttachmentMessageDM;->fileName:Ljava/lang/String;

    iput-object v0, p0, Lcom/helpshift/conversation/activeconversation/message/AttachmentMessageDM;->fileName:Ljava/lang/String;

    .line 62
    :cond_0
    iget-object v0, p1, Lcom/helpshift/conversation/activeconversation/message/AttachmentMessageDM;->attachmentUrl:Ljava/lang/String;

    iput-object v0, p0, Lcom/helpshift/conversation/activeconversation/message/AttachmentMessageDM;->attachmentUrl:Ljava/lang/String;

    .line 63
    iget-boolean p1, p1, Lcom/helpshift/conversation/activeconversation/message/AttachmentMessageDM;->isSecureAttachment:Z

    iput-boolean p1, p0, Lcom/helpshift/conversation/activeconversation/message/AttachmentMessageDM;->isSecureAttachment:Z

    :cond_1
    return-void
.end method
