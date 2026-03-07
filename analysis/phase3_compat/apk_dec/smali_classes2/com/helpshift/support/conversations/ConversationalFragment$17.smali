.class Lcom/helpshift/support/conversations/ConversationalFragment$17;
.super Ljava/lang/Object;
.source "ConversationalFragment.java"

# interfaces
.implements Lcom/helpshift/android/commons/downloader/contracts/NetworkAuthDataFetcher;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/helpshift/support/conversations/ConversationalFragment;->generateSecureUrl(Ljava/lang/String;)Ljava/lang/String;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/helpshift/support/conversations/ConversationalFragment;

.field final synthetic val$authDataProvider:Lcom/helpshift/common/domain/network/AuthDataProvider;


# direct methods
.method constructor <init>(Lcom/helpshift/support/conversations/ConversationalFragment;Lcom/helpshift/common/domain/network/AuthDataProvider;)V
    .locals 0

    .line 830
    iput-object p1, p0, Lcom/helpshift/support/conversations/ConversationalFragment$17;->this$0:Lcom/helpshift/support/conversations/ConversationalFragment;

    iput-object p2, p0, Lcom/helpshift/support/conversations/ConversationalFragment$17;->val$authDataProvider:Lcom/helpshift/common/domain/network/AuthDataProvider;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getAuthData(Ljava/util/Map;)Ljava/util/Map;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/GeneralSecurityException;
        }
    .end annotation

    .line 834
    iget-object v0, p0, Lcom/helpshift/support/conversations/ConversationalFragment$17;->val$authDataProvider:Lcom/helpshift/common/domain/network/AuthDataProvider;

    sget-object v1, Lcom/helpshift/common/platform/network/Method;->GET:Lcom/helpshift/common/platform/network/Method;

    invoke-virtual {v0, v1, p1}, Lcom/helpshift/common/domain/network/AuthDataProvider;->getAuthData(Lcom/helpshift/common/platform/network/Method;Ljava/util/Map;)Ljava/util/Map;

    move-result-object p1

    return-object p1
.end method
