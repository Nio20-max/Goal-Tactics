.class public final synthetic Lcom/android/billingclient/api/zzu;
.super Ljava/lang/Object;
.source "com.android.billingclient:billing@@4.0.0"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic zza:Lcom/android/billingclient/api/PurchasesResponseListener;


# direct methods
.method public synthetic constructor <init>(Lcom/android/billingclient/api/PurchasesResponseListener;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/android/billingclient/api/zzu;->zza:Lcom/android/billingclient/api/PurchasesResponseListener;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 3

    iget-object v0, p0, Lcom/android/billingclient/api/zzu;->zza:Lcom/android/billingclient/api/PurchasesResponseListener;

    .line 1
    sget-object v1, Lcom/android/billingclient/api/zzak;->zzr:Lcom/android/billingclient/api/BillingResult;

    .line 2
    invoke-static {}, Lcom/google/android/gms/internal/play_billing/zzp;->zzg()Lcom/google/android/gms/internal/play_billing/zzp;

    move-result-object v2

    .line 1
    invoke-interface {v0, v1, v2}, Lcom/android/billingclient/api/PurchasesResponseListener;->onQueryPurchasesResponse(Lcom/android/billingclient/api/BillingResult;Ljava/util/List;)V

    return-void
.end method
