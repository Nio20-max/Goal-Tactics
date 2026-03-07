.class final Lcom/android/billingclient/api/zzab;
.super Ljava/lang/Object;
.source "com.android.billingclient:billing@@4.0.0"

# interfaces
.implements Ljava/util/concurrent/Callable;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/concurrent/Callable<",
        "Ljava/lang/Void;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic zza:Ljava/lang/String;

.field final synthetic zzb:Lcom/android/billingclient/api/PurchaseHistoryResponseListener;

.field final synthetic zzc:Lcom/android/billingclient/api/BillingClientImpl;


# direct methods
.method constructor <init>(Lcom/android/billingclient/api/BillingClientImpl;Ljava/lang/String;Lcom/android/billingclient/api/PurchaseHistoryResponseListener;)V
    .locals 0

    iput-object p1, p0, Lcom/android/billingclient/api/zzab;->zzc:Lcom/android/billingclient/api/BillingClientImpl;

    iput-object p2, p0, Lcom/android/billingclient/api/zzab;->zza:Ljava/lang/String;

    iput-object p3, p0, Lcom/android/billingclient/api/zzab;->zzb:Lcom/android/billingclient/api/PurchaseHistoryResponseListener;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final bridge synthetic call()Ljava/lang/Object;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    iget-object v0, p0, Lcom/android/billingclient/api/zzab;->zzc:Lcom/android/billingclient/api/BillingClientImpl;

    iget-object v1, p0, Lcom/android/billingclient/api/zzab;->zza:Ljava/lang/String;

    .line 1
    invoke-static {v0, v1}, Lcom/android/billingclient/api/BillingClientImpl;->zzi(Lcom/android/billingclient/api/BillingClientImpl;Ljava/lang/String;)Lcom/android/billingclient/api/zzag;

    move-result-object v0

    iget-object v1, p0, Lcom/android/billingclient/api/zzab;->zzb:Lcom/android/billingclient/api/PurchaseHistoryResponseListener;

    invoke-virtual {v0}, Lcom/android/billingclient/api/zzag;->zza()Lcom/android/billingclient/api/BillingResult;

    move-result-object v2

    invoke-virtual {v0}, Lcom/android/billingclient/api/zzag;->zzb()Ljava/util/List;

    move-result-object v0

    .line 2
    invoke-interface {v1, v2, v0}, Lcom/android/billingclient/api/PurchaseHistoryResponseListener;->onPurchaseHistoryResponse(Lcom/android/billingclient/api/BillingResult;Ljava/util/List;)V

    const/4 v0, 0x0

    return-object v0
.end method
