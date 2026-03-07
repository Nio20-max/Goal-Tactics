.class public Lcom/helpshift/campaigns/models/ActionModel;
.super Ljava/lang/Object;
.source "ActionModel.java"

# interfaces
.implements Ljava/io/Serializable;


# static fields
.field private static final TAG:Ljava/lang/String; = "ActionModel"

.field private static final serialVersionUID:J = 0x1L


# instance fields
.field public actionData:Ljava/lang/String;

.field private actionExecutor:Lcom/helpshift/executors/ActionExecutor;

.field private actionId:Ljava/lang/String;

.field public actionType:Lcom/helpshift/enums/ACTION_TYPE;

.field public isGoalCompletion:Z

.field public textColor:Ljava/lang/String;

.field public title:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method constructor <init>(Lorg/json/JSONObject;)V
    .locals 2

    .line 27
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    :try_start_0
    const-string v0, "id"

    .line 29
    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/helpshift/campaigns/models/ActionModel;->actionId:Ljava/lang/String;

    const-string/jumbo v0, "t"

    .line 30
    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/helpshift/campaigns/models/ActionModel;->title:Ljava/lang/String;

    const-string v0, "a"

    .line 31
    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v0

    invoke-static {v0}, Lcom/helpshift/enums/ACTION_TYPE;->getEnum(I)Lcom/helpshift/enums/ACTION_TYPE;

    move-result-object v0

    iput-object v0, p0, Lcom/helpshift/campaigns/models/ActionModel;->actionType:Lcom/helpshift/enums/ACTION_TYPE;

    const-string v0, "d"

    const-string v1, ""

    .line 32
    invoke-virtual {p1, v0, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/helpshift/campaigns/models/ActionModel;->actionData:Ljava/lang/String;

    const-string v0, "c"

    .line 33
    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/helpshift/campaigns/models/ActionModel;->textColor:Ljava/lang/String;

    const-string v0, "g"

    .line 34
    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->getBoolean(Ljava/lang/String;)Z

    move-result p1

    iput-boolean p1, p0, Lcom/helpshift/campaigns/models/ActionModel;->isGoalCompletion:Z

    .line 35
    invoke-static {}, Lcom/helpshift/CoreInternal;->getActionExecutor()Lcom/helpshift/executors/ActionExecutor;

    move-result-object p1

    iput-object p1, p0, Lcom/helpshift/campaigns/models/ActionModel;->actionExecutor:Lcom/helpshift/executors/ActionExecutor;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    .line 38
    sget-object v0, Lcom/helpshift/campaigns/models/ActionModel;->TAG:Ljava/lang/String;

    const-string v1, "Exception while creating actionType object from json : "

    invoke-static {v0, v1, p1}, Lcom/helpshift/util/HSLogger;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    :goto_0
    return-void
.end method

.method private readObject(Ljava/io/ObjectInputStream;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/lang/ClassNotFoundException;
        }
    .end annotation

    .line 67
    invoke-virtual {p1}, Ljava/io/ObjectInputStream;->defaultReadObject()V

    .line 68
    invoke-virtual {p1}, Ljava/io/ObjectInputStream;->readUTF()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/helpshift/campaigns/models/ActionModel;->actionData:Ljava/lang/String;

    .line 69
    invoke-virtual {p1}, Ljava/io/ObjectInputStream;->readUTF()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/helpshift/campaigns/models/ActionModel;->title:Ljava/lang/String;

    .line 70
    invoke-virtual {p1}, Ljava/io/ObjectInputStream;->readObject()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/helpshift/enums/ACTION_TYPE;

    iput-object v0, p0, Lcom/helpshift/campaigns/models/ActionModel;->actionType:Lcom/helpshift/enums/ACTION_TYPE;

    .line 71
    invoke-virtual {p1}, Ljava/io/ObjectInputStream;->readUTF()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/helpshift/campaigns/models/ActionModel;->actionData:Ljava/lang/String;

    .line 72
    invoke-virtual {p1}, Ljava/io/ObjectInputStream;->readUTF()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/helpshift/campaigns/models/ActionModel;->textColor:Ljava/lang/String;

    .line 73
    invoke-virtual {p1}, Ljava/io/ObjectInputStream;->readBoolean()Z

    move-result p1

    iput-boolean p1, p0, Lcom/helpshift/campaigns/models/ActionModel;->isGoalCompletion:Z

    return-void
.end method

.method private writeObject(Ljava/io/ObjectOutputStream;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 53
    invoke-virtual {p1}, Ljava/io/ObjectOutputStream;->defaultWriteObject()V

    .line 54
    iget-object v0, p0, Lcom/helpshift/campaigns/models/ActionModel;->actionId:Ljava/lang/String;

    invoke-virtual {p1, v0}, Ljava/io/ObjectOutputStream;->writeUTF(Ljava/lang/String;)V

    .line 55
    iget-object v0, p0, Lcom/helpshift/campaigns/models/ActionModel;->title:Ljava/lang/String;

    invoke-virtual {p1, v0}, Ljava/io/ObjectOutputStream;->writeUTF(Ljava/lang/String;)V

    .line 56
    iget-object v0, p0, Lcom/helpshift/campaigns/models/ActionModel;->actionType:Lcom/helpshift/enums/ACTION_TYPE;

    invoke-virtual {p1, v0}, Ljava/io/ObjectOutputStream;->writeObject(Ljava/lang/Object;)V

    .line 57
    iget-object v0, p0, Lcom/helpshift/campaigns/models/ActionModel;->actionData:Ljava/lang/String;

    invoke-virtual {p1, v0}, Ljava/io/ObjectOutputStream;->writeUTF(Ljava/lang/String;)V

    .line 58
    iget-object v0, p0, Lcom/helpshift/campaigns/models/ActionModel;->textColor:Ljava/lang/String;

    invoke-virtual {p1, v0}, Ljava/io/ObjectOutputStream;->writeUTF(Ljava/lang/String;)V

    .line 59
    iget-boolean v0, p0, Lcom/helpshift/campaigns/models/ActionModel;->isGoalCompletion:Z

    invoke-virtual {p1, v0}, Ljava/io/ObjectOutputStream;->writeBoolean(Z)V

    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 4

    .line 79
    instance-of v0, p1, Lcom/helpshift/campaigns/models/ActionModel;

    const/4 v1, 0x0

    if-eqz v0, :cond_2

    .line 80
    check-cast p1, Lcom/helpshift/campaigns/models/ActionModel;

    .line 81
    iget-object v0, p0, Lcom/helpshift/campaigns/models/ActionModel;->actionId:Ljava/lang/String;

    iget-object v2, p1, Lcom/helpshift/campaigns/models/ActionModel;->actionId:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    const/4 v2, 0x1

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/helpshift/campaigns/models/ActionModel;->title:Ljava/lang/String;

    iget-object v3, p1, Lcom/helpshift/campaigns/models/ActionModel;->title:Ljava/lang/String;

    .line 82
    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/helpshift/campaigns/models/ActionModel;->actionType:Lcom/helpshift/enums/ACTION_TYPE;

    iget-object v3, p1, Lcom/helpshift/campaigns/models/ActionModel;->actionType:Lcom/helpshift/enums/ACTION_TYPE;

    if-ne v0, v3, :cond_0

    iget-object v0, p0, Lcom/helpshift/campaigns/models/ActionModel;->actionData:Ljava/lang/String;

    iget-object v3, p1, Lcom/helpshift/campaigns/models/ActionModel;->actionData:Ljava/lang/String;

    .line 84
    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/helpshift/campaigns/models/ActionModel;->textColor:Ljava/lang/String;

    iget-object v3, p1, Lcom/helpshift/campaigns/models/ActionModel;->textColor:Ljava/lang/String;

    .line 85
    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-boolean v0, p0, Lcom/helpshift/campaigns/models/ActionModel;->isGoalCompletion:Z

    iget-boolean v3, p1, Lcom/helpshift/campaigns/models/ActionModel;->isGoalCompletion:Z

    if-ne v0, v3, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    .line 87
    :goto_0
    iget-object v3, p0, Lcom/helpshift/campaigns/models/ActionModel;->actionExecutor:Lcom/helpshift/executors/ActionExecutor;

    if-eqz v3, :cond_1

    if-eqz v0, :cond_2

    .line 88
    iget-object v0, p1, Lcom/helpshift/campaigns/models/ActionModel;->actionExecutor:Lcom/helpshift/executors/ActionExecutor;

    if-eqz v0, :cond_2

    .line 89
    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    iget-object p1, p1, Lcom/helpshift/campaigns/models/ActionModel;->actionExecutor:Lcom/helpshift/executors/ActionExecutor;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_2

    :goto_1
    const/4 v1, 0x1

    goto :goto_2

    :cond_1
    if-eqz v0, :cond_2

    .line 92
    iget-object p1, p1, Lcom/helpshift/campaigns/models/ActionModel;->actionExecutor:Lcom/helpshift/executors/ActionExecutor;

    if-nez p1, :cond_2

    goto :goto_1

    :cond_2
    :goto_2
    return v1
.end method

.method public executeAction(Landroid/app/Activity;)V
    .locals 3

    .line 43
    iget-object v0, p0, Lcom/helpshift/campaigns/models/ActionModel;->actionExecutor:Lcom/helpshift/executors/ActionExecutor;

    if-eqz v0, :cond_0

    .line 44
    iget-object v1, p0, Lcom/helpshift/campaigns/models/ActionModel;->actionType:Lcom/helpshift/enums/ACTION_TYPE;

    iget-object v2, p0, Lcom/helpshift/campaigns/models/ActionModel;->actionData:Ljava/lang/String;

    invoke-interface {v0, p1, v1, v2}, Lcom/helpshift/executors/ActionExecutor;->executeAction(Landroid/app/Activity;Lcom/helpshift/enums/ACTION_TYPE;Ljava/lang/String;)V

    :cond_0
    return-void
.end method
