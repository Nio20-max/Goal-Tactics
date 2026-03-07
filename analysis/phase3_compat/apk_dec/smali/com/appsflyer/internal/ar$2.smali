.class final synthetic Lcom/appsflyer/internal/ar$2;
.super Ljava/lang/Object;
.source ""


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/appsflyer/internal/ar;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1008
    name = null
.end annotation


# static fields
.field static final synthetic AFInAppEventParameterName:[I


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 236
    invoke-static {}, Lcom/appsflyer/internal/dd$d;->values()[Lcom/appsflyer/internal/dd$d;

    move-result-object v0

    array-length v0, v0

    new-array v0, v0, [I

    sput-object v0, Lcom/appsflyer/internal/ar$2;->AFInAppEventParameterName:[I

    :try_start_0
    sget-object v1, Lcom/appsflyer/internal/dd$d;->AFKeystoreWrapper:Lcom/appsflyer/internal/dd$d;

    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    move-result v1

    const/4 v2, 0x1

    aput v2, v0, v1
    :try_end_0
    .catch Ljava/lang/NoSuchFieldError; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    :try_start_1
    sget-object v0, Lcom/appsflyer/internal/ar$2;->AFInAppEventParameterName:[I

    sget-object v1, Lcom/appsflyer/internal/dd$d;->AFInAppEventParameterName:Lcom/appsflyer/internal/dd$d;

    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    move-result v1

    const/4 v2, 0x2

    aput v2, v0, v1
    :try_end_1
    .catch Ljava/lang/NoSuchFieldError; {:try_start_1 .. :try_end_1} :catch_1

    :catch_1
    return-void
.end method
