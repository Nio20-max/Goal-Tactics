.class Lcom/helpshift/support/HSApiData$1;
.super Ljava/lang/Object;
.source "HSApiData.java"

# interfaces
.implements Lcom/helpshift/util/FetchDataFromThread;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/helpshift/support/HSApiData;->getAndStoreSections(Landroid/os/Handler;Landroid/os/Handler;Lcom/helpshift/support/FaqTagFilter;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/helpshift/util/FetchDataFromThread<",
        "Lcom/helpshift/faq/FaqsResponse;",
        "Lcom/helpshift/common/exception/ExceptionType;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/helpshift/support/HSApiData;

.field final synthetic val$callback:Landroid/os/Handler;

.field final synthetic val$failure:Landroid/os/Handler;

.field final synthetic val$faqTagFilter:Lcom/helpshift/support/FaqTagFilter;


# direct methods
.method constructor <init>(Lcom/helpshift/support/HSApiData;Landroid/os/Handler;Lcom/helpshift/support/FaqTagFilter;Landroid/os/Handler;)V
    .locals 0

    .line 130
    iput-object p1, p0, Lcom/helpshift/support/HSApiData$1;->this$0:Lcom/helpshift/support/HSApiData;

    iput-object p2, p0, Lcom/helpshift/support/HSApiData$1;->val$callback:Landroid/os/Handler;

    iput-object p3, p0, Lcom/helpshift/support/HSApiData$1;->val$faqTagFilter:Lcom/helpshift/support/FaqTagFilter;

    iput-object p4, p0, Lcom/helpshift/support/HSApiData$1;->val$failure:Landroid/os/Handler;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onDataFetched(Lcom/helpshift/faq/FaqsResponse;)V
    .locals 3

    .line 133
    iget-object v0, p0, Lcom/helpshift/support/HSApiData$1;->val$callback:Landroid/os/Handler;

    if-eqz v0, :cond_3

    .line 134
    invoke-virtual {v0}, Landroid/os/Handler;->obtainMessage()Landroid/os/Message;

    move-result-object v0

    const/4 v1, 0x1

    .line 135
    iget v2, p1, Lcom/helpshift/faq/FaqsResponse;->statusCode:I

    if-ne v1, v2, :cond_0

    .line 136
    sget v1, Lcom/helpshift/support/constants/GetSectionsCallBackStatus;->API_SUCCESS_NEW_DATA:I

    iput v1, v0, Landroid/os/Message;->what:I

    goto :goto_0

    :cond_0
    const/4 v1, 0x2

    .line 138
    iget v2, p1, Lcom/helpshift/faq/FaqsResponse;->statusCode:I

    if-ne v1, v2, :cond_1

    .line 139
    sget v1, Lcom/helpshift/support/constants/GetSectionsCallBackStatus;->API_SUCCESS_NO_NEW_DATA:I

    iput v1, v0, Landroid/os/Message;->what:I

    .line 141
    :cond_1
    :goto_0
    iget-object p1, p1, Lcom/helpshift/faq/FaqsResponse;->response:Ljava/lang/Object;

    if-eqz p1, :cond_2

    .line 144
    check-cast p1, Lorg/json/JSONArray;

    .line 145
    iget-object v1, p0, Lcom/helpshift/support/HSApiData$1;->this$0:Lcom/helpshift/support/HSApiData;

    invoke-virtual {v1, p1}, Lcom/helpshift/support/HSApiData;->storeSections(Lorg/json/JSONArray;)V

    .line 146
    iget-object p1, p0, Lcom/helpshift/support/HSApiData$1;->this$0:Lcom/helpshift/support/HSApiData;

    iget-object p1, p1, Lcom/helpshift/support/HSApiData;->sectionDAO:Lcom/helpshift/support/storage/SectionDAO;

    iget-object v1, p0, Lcom/helpshift/support/HSApiData$1;->val$faqTagFilter:Lcom/helpshift/support/FaqTagFilter;

    invoke-interface {p1, v1}, Lcom/helpshift/support/storage/SectionDAO;->getAllSections(Lcom/helpshift/support/FaqTagFilter;)Ljava/util/List;

    move-result-object p1

    iput-object p1, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 147
    iget-object p1, p0, Lcom/helpshift/support/HSApiData$1;->this$0:Lcom/helpshift/support/HSApiData;

    invoke-virtual {p1}, Lcom/helpshift/support/HSApiData;->startSearchIndexing()V

    .line 149
    :cond_2
    iget-object p1, p0, Lcom/helpshift/support/HSApiData$1;->val$callback:Landroid/os/Handler;

    invoke-virtual {p1, v0}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 150
    invoke-static {}, Lcom/helpshift/support/HSApiData;->signalFaqsUpdated()V

    :cond_3
    return-void
.end method

.method public bridge synthetic onDataFetched(Ljava/lang/Object;)V
    .locals 0

    .line 130
    check-cast p1, Lcom/helpshift/faq/FaqsResponse;

    invoke-virtual {p0, p1}, Lcom/helpshift/support/HSApiData$1;->onDataFetched(Lcom/helpshift/faq/FaqsResponse;)V

    return-void
.end method

.method public onFailure(Lcom/helpshift/common/exception/ExceptionType;)V
    .locals 2

    .line 157
    iget-object v0, p0, Lcom/helpshift/support/HSApiData$1;->val$failure:Landroid/os/Handler;

    if-eqz v0, :cond_1

    .line 158
    invoke-virtual {v0}, Landroid/os/Handler;->obtainMessage()Landroid/os/Message;

    move-result-object v0

    .line 159
    iput-object p1, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 161
    sget-object v1, Lcom/helpshift/common/exception/NetworkException;->CONTENT_UNCHANGED:Lcom/helpshift/common/exception/NetworkException;

    if-ne p1, v1, :cond_0

    .line 162
    sget p1, Lcom/helpshift/support/constants/GetSectionsCallBackStatus;->API_FAILURE_CONTENT_UNCHANGED:I

    goto :goto_0

    .line 164
    :cond_0
    sget p1, Lcom/helpshift/support/constants/GetSectionsCallBackStatus;->API_FAILURE:I

    .line 166
    :goto_0
    iput p1, v0, Landroid/os/Message;->what:I

    .line 167
    iget-object p1, p0, Lcom/helpshift/support/HSApiData$1;->val$failure:Landroid/os/Handler;

    invoke-virtual {p1, v0}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    :cond_1
    return-void
.end method

.method public bridge synthetic onFailure(Ljava/lang/Object;)V
    .locals 0

    .line 130
    check-cast p1, Lcom/helpshift/common/exception/ExceptionType;

    invoke-virtual {p0, p1}, Lcom/helpshift/support/HSApiData$1;->onFailure(Lcom/helpshift/common/exception/ExceptionType;)V

    return-void
.end method
