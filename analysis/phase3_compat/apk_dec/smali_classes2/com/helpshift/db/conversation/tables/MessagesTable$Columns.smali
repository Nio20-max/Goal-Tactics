.class public interface abstract Lcom/helpshift/db/conversation/tables/MessagesTable$Columns;
.super Ljava/lang/Object;
.source "MessagesTable.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/helpshift/db/conversation/tables/MessagesTable;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "Columns"
.end annotation


# static fields
.field public static final AUTHOR_ID:Ljava/lang/String; = "author_id"

.field public static final AUTHOR_NAME:Ljava/lang/String; = "author_name"

.field public static final AUTHOR_ROLE:Ljava/lang/String; = "author_role"

.field public static final AVATAR_IMAGE_LOCAL_PATH:Ljava/lang/String; = "local_avatar_image_path"

.field public static final BODY:Ljava/lang/String; = "body"

.field public static final CONVERSATION_ID:Ljava/lang/String; = "conversation_id"

.field public static final CREATED_AT:Ljava/lang/String; = "created_at"

.field public static final DELIVERY_STATE:Ljava/lang/String; = "md_state"

.field public static final EPOCH_TIME_CREATE_AT:Ljava/lang/String; = "epoch_time_created_at"

.field public static final HAS_OLDER_MESSAGES:Ljava/lang/String; = "has_older_messages"

.field public static final ID:Ljava/lang/String; = "_id"

.field public static final IS_REDACTED_MESSAGE:Ljava/lang/String; = "is_redacted"

.field public static final LAST_CONVERSATIONS_REDACTION_TIME:Ljava/lang/String; = "last_conv_redaction_time"

.field public static final MESSAGE_META:Ljava/lang/String; = "meta"

.field public static final SERVER_ID:Ljava/lang/String; = "server_id"

.field public static final TYPE:Ljava/lang/String; = "type"
