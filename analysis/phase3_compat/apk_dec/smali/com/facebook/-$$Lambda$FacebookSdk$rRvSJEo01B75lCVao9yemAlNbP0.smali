.class public final synthetic Lcom/facebook/-$$Lambda$FacebookSdk$rRvSJEo01B75lCVao9yemAlNbP0;
.super Ljava/lang/Object;
.source "lambda"

# interfaces
.implements Lcom/facebook/FacebookSdk$GraphRequestCreator;


# static fields
.field public static final synthetic INSTANCE:Lcom/facebook/-$$Lambda$FacebookSdk$rRvSJEo01B75lCVao9yemAlNbP0;


# direct methods
.method static synthetic constructor <clinit>()V
    .locals 1

    new-instance v0, Lcom/facebook/-$$Lambda$FacebookSdk$rRvSJEo01B75lCVao9yemAlNbP0;

    invoke-direct {v0}, Lcom/facebook/-$$Lambda$FacebookSdk$rRvSJEo01B75lCVao9yemAlNbP0;-><init>()V

    sput-object v0, Lcom/facebook/-$$Lambda$FacebookSdk$rRvSJEo01B75lCVao9yemAlNbP0;->INSTANCE:Lcom/facebook/-$$Lambda$FacebookSdk$rRvSJEo01B75lCVao9yemAlNbP0;

    return-void
.end method

.method private synthetic constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final createPostRequest(Lcom/facebook/AccessToken;Ljava/lang/String;Lorg/json/JSONObject;Lcom/facebook/GraphRequest$Callback;)Lcom/facebook/GraphRequest;
    .locals 0

    invoke-static {p1, p2, p3, p4}, Lcom/facebook/FacebookSdk;->lambda$rRvSJEo01B75lCVao9yemAlNbP0(Lcom/facebook/AccessToken;Ljava/lang/String;Lorg/json/JSONObject;Lcom/facebook/GraphRequest$Callback;)Lcom/facebook/GraphRequest;

    move-result-object p1

    return-object p1
.end method
