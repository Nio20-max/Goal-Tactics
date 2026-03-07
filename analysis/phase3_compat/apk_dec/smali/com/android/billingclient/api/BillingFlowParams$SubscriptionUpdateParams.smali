.class public Lcom/android/billingclient/api/BillingFlowParams$SubscriptionUpdateParams;
.super Ljava/lang/Object;
.source "com.android.billingclient:billing@@4.0.0"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/billingclient/api/BillingFlowParams;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "SubscriptionUpdateParams"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/billingclient/api/BillingFlowParams$SubscriptionUpdateParams$Builder;
    }
.end annotation


# instance fields
.field private zza:Ljava/lang/String;

.field private zzb:I


# direct methods
.method private constructor <init>()V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    iput v0, p0, Lcom/android/billingclient/api/BillingFlowParams$SubscriptionUpdateParams;->zzb:I

    return-void
.end method

.method synthetic constructor <init>(Lcom/android/billingclient/api/zzai;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 p1, 0x0

    iput p1, p0, Lcom/android/billingclient/api/BillingFlowParams$SubscriptionUpdateParams;->zzb:I

    return-void
.end method

.method public static newBuilder()Lcom/android/billingclient/api/BillingFlowParams$SubscriptionUpdateParams$Builder;
    .locals 2

    new-instance v0, Lcom/android/billingclient/api/BillingFlowParams$SubscriptionUpdateParams$Builder;

    const/4 v1, 0x0

    .line 1
    invoke-direct {v0, v1}, Lcom/android/billingclient/api/BillingFlowParams$SubscriptionUpdateParams$Builder;-><init>(Lcom/android/billingclient/api/zzai;)V

    return-object v0
.end method

.method static synthetic zza(Lcom/android/billingclient/api/BillingFlowParams$SubscriptionUpdateParams;I)I
    .locals 0

    iput p1, p0, Lcom/android/billingclient/api/BillingFlowParams$SubscriptionUpdateParams;->zzb:I

    return p1
.end method

.method static synthetic zzb(Lcom/android/billingclient/api/BillingFlowParams$SubscriptionUpdateParams;Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    iput-object p1, p0, Lcom/android/billingclient/api/BillingFlowParams$SubscriptionUpdateParams;->zza:Ljava/lang/String;

    return-object p1
.end method


# virtual methods
.method getOldSkuPurchaseToken()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/android/billingclient/api/BillingFlowParams$SubscriptionUpdateParams;->zza:Ljava/lang/String;

    return-object v0
.end method

.method getReplaceSkusProrationMode()I
    .locals 1

    iget v0, p0, Lcom/android/billingclient/api/BillingFlowParams$SubscriptionUpdateParams;->zzb:I

    return v0
.end method
