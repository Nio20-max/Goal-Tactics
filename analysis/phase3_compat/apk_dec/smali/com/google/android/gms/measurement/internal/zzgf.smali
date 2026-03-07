.class final Lcom/google/android/gms/measurement/internal/zzgf;
.super Ljava/lang/Object;
.source "com.google.android.gms:play-services-measurement@@19.0.1"

# interfaces
.implements Ljava/util/concurrent/Callable;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/concurrent/Callable<",
        "[B>;"
    }
.end annotation


# instance fields
.field final synthetic zza:Lcom/google/android/gms/measurement/internal/zzat;

.field final synthetic zzb:Ljava/lang/String;

.field final synthetic zzc:Lcom/google/android/gms/measurement/internal/zzgk;


# direct methods
.method constructor <init>(Lcom/google/android/gms/measurement/internal/zzgk;Lcom/google/android/gms/measurement/internal/zzat;Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/measurement/internal/zzgf;->zzc:Lcom/google/android/gms/measurement/internal/zzgk;

    iput-object p2, p0, Lcom/google/android/gms/measurement/internal/zzgf;->zza:Lcom/google/android/gms/measurement/internal/zzat;

    iput-object p3, p0, Lcom/google/android/gms/measurement/internal/zzgf;->zzb:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final bridge synthetic call()Ljava/lang/Object;
    .locals 31
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    move-object/from16 v1, p0

    const-string v0, "_r"

    iget-object v2, v1, Lcom/google/android/gms/measurement/internal/zzgf;->zzc:Lcom/google/android/gms/measurement/internal/zzgk;

    invoke-static {v2}, Lcom/google/android/gms/measurement/internal/zzgk;->zzc(Lcom/google/android/gms/measurement/internal/zzgk;)Lcom/google/android/gms/measurement/internal/zzkn;

    move-result-object v2

    .line 1
    invoke-virtual {v2}, Lcom/google/android/gms/measurement/internal/zzkn;->zzA()V

    iget-object v2, v1, Lcom/google/android/gms/measurement/internal/zzgf;->zzc:Lcom/google/android/gms/measurement/internal/zzgk;

    invoke-static {v2}, Lcom/google/android/gms/measurement/internal/zzgk;->zzc(Lcom/google/android/gms/measurement/internal/zzgk;)Lcom/google/android/gms/measurement/internal/zzkn;

    move-result-object v2

    .line 2
    invoke-virtual {v2}, Lcom/google/android/gms/measurement/internal/zzkn;->zzr()Lcom/google/android/gms/measurement/internal/zzia;

    move-result-object v2

    iget-object v3, v1, Lcom/google/android/gms/measurement/internal/zzgf;->zza:Lcom/google/android/gms/measurement/internal/zzat;

    iget-object v13, v1, Lcom/google/android/gms/measurement/internal/zzgf;->zzb:Ljava/lang/String;

    .line 3
    invoke-virtual {v2}, Lcom/google/android/gms/measurement/internal/zzgl;->zzg()V

    .line 4
    invoke-static {}, Lcom/google/android/gms/measurement/internal/zzfs;->zzO()V

    .line 5
    invoke-static {v3}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 6
    invoke-static {v13}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotEmpty(Ljava/lang/String;)Ljava/lang/String;

    iget-object v4, v2, Lcom/google/android/gms/measurement/internal/zzgl;->zzs:Lcom/google/android/gms/measurement/internal/zzfs;

    .line 7
    invoke-virtual {v4}, Lcom/google/android/gms/measurement/internal/zzfs;->zzf()Lcom/google/android/gms/measurement/internal/zzaf;

    move-result-object v4

    .line 8
    sget-object v5, Lcom/google/android/gms/measurement/internal/zzdw;->zzU:Lcom/google/android/gms/measurement/internal/zzdv;

    invoke-virtual {v4, v13, v5}, Lcom/google/android/gms/measurement/internal/zzaf;->zzs(Ljava/lang/String;Lcom/google/android/gms/measurement/internal/zzdv;)Z

    move-result v4

    const/4 v14, 0x0

    const/4 v5, 0x0

    if-nez v4, :cond_0

    iget-object v0, v2, Lcom/google/android/gms/measurement/internal/zzgl;->zzs:Lcom/google/android/gms/measurement/internal/zzfs;

    .line 9
    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzfs;->zzay()Lcom/google/android/gms/measurement/internal/zzei;

    move-result-object v0

    .line 10
    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzei;->zzc()Lcom/google/android/gms/measurement/internal/zzeg;

    move-result-object v0

    const-string v2, "Generating ScionPayload disabled. packageName"

    invoke-virtual {v0, v2, v13}, Lcom/google/android/gms/measurement/internal/zzeg;->zzb(Ljava/lang/String;Ljava/lang/Object;)V

    new-array v14, v5, [B

    goto/16 :goto_a

    .line 11
    :cond_0
    iget-object v4, v3, Lcom/google/android/gms/measurement/internal/zzat;->zza:Ljava/lang/String;

    const-string v6, "_iap"

    invoke-virtual {v6, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_1

    iget-object v4, v3, Lcom/google/android/gms/measurement/internal/zzat;->zza:Ljava/lang/String;

    const-string v6, "_iapx"

    .line 12
    invoke-virtual {v6, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_1

    iget-object v0, v2, Lcom/google/android/gms/measurement/internal/zzgl;->zzs:Lcom/google/android/gms/measurement/internal/zzfs;

    .line 211
    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzfs;->zzay()Lcom/google/android/gms/measurement/internal/zzei;

    move-result-object v0

    .line 212
    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzei;->zzc()Lcom/google/android/gms/measurement/internal/zzeg;

    move-result-object v0

    iget-object v2, v3, Lcom/google/android/gms/measurement/internal/zzat;->zza:Ljava/lang/String;

    const-string v3, "Generating a payload for this event is not available. package_name, event_name"

    .line 213
    invoke-virtual {v0, v3, v13, v2}, Lcom/google/android/gms/measurement/internal/zzeg;->zzc(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    goto/16 :goto_a

    .line 13
    :cond_1
    invoke-static {}, Lcom/google/android/gms/internal/measurement/zzfw;->zza()Lcom/google/android/gms/internal/measurement/zzfv;

    move-result-object v6

    iget-object v4, v2, Lcom/google/android/gms/measurement/internal/zzkc;->zzf:Lcom/google/android/gms/measurement/internal/zzkn;

    .line 14
    invoke-virtual {v4}, Lcom/google/android/gms/measurement/internal/zzkn;->zzi()Lcom/google/android/gms/measurement/internal/zzaj;

    move-result-object v4

    .line 15
    invoke-virtual {v4}, Lcom/google/android/gms/measurement/internal/zzaj;->zzw()V

    :try_start_0
    iget-object v4, v2, Lcom/google/android/gms/measurement/internal/zzkc;->zzf:Lcom/google/android/gms/measurement/internal/zzkn;

    .line 16
    invoke-virtual {v4}, Lcom/google/android/gms/measurement/internal/zzkn;->zzi()Lcom/google/android/gms/measurement/internal/zzaj;

    move-result-object v4

    .line 17
    invoke-virtual {v4, v13}, Lcom/google/android/gms/measurement/internal/zzaj;->zzj(Ljava/lang/String;)Lcom/google/android/gms/measurement/internal/zzg;

    move-result-object v4

    if-nez v4, :cond_2

    iget-object v0, v2, Lcom/google/android/gms/measurement/internal/zzgl;->zzs:Lcom/google/android/gms/measurement/internal/zzfs;

    .line 18
    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzfs;->zzay()Lcom/google/android/gms/measurement/internal/zzei;

    move-result-object v0

    .line 19
    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzei;->zzc()Lcom/google/android/gms/measurement/internal/zzeg;

    move-result-object v0

    const-string v3, "Log and bundle not available. package_name"

    invoke-virtual {v0, v3, v13}, Lcom/google/android/gms/measurement/internal/zzeg;->zzb(Ljava/lang/String;Ljava/lang/Object;)V

    new-array v14, v5, [B
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    iget-object v0, v2, Lcom/google/android/gms/measurement/internal/zzkc;->zzf:Lcom/google/android/gms/measurement/internal/zzkn;

    .line 20
    :goto_0
    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzi()Lcom/google/android/gms/measurement/internal/zzaj;

    move-result-object v0

    .line 21
    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzaj;->zzx()V

    goto/16 :goto_a

    .line 22
    :cond_2
    :try_start_1
    invoke-virtual {v4}, Lcom/google/android/gms/measurement/internal/zzg;->zzaj()Z

    move-result v7

    if-nez v7, :cond_3

    iget-object v0, v2, Lcom/google/android/gms/measurement/internal/zzgl;->zzs:Lcom/google/android/gms/measurement/internal/zzfs;

    .line 23
    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzfs;->zzay()Lcom/google/android/gms/measurement/internal/zzei;

    move-result-object v0

    .line 24
    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzei;->zzc()Lcom/google/android/gms/measurement/internal/zzeg;

    move-result-object v0

    const-string v3, "Log and bundle disabled. package_name"

    invoke-virtual {v0, v3, v13}, Lcom/google/android/gms/measurement/internal/zzeg;->zzb(Ljava/lang/String;Ljava/lang/Object;)V

    new-array v14, v5, [B
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    iget-object v0, v2, Lcom/google/android/gms/measurement/internal/zzkc;->zzf:Lcom/google/android/gms/measurement/internal/zzkn;

    goto :goto_0

    .line 25
    :cond_3
    :try_start_2
    invoke-static {}, Lcom/google/android/gms/internal/measurement/zzfy;->zzu()Lcom/google/android/gms/internal/measurement/zzfx;

    move-result-object v15

    const/4 v11, 0x1

    invoke-virtual {v15, v11}, Lcom/google/android/gms/internal/measurement/zzfx;->zzaa(I)Lcom/google/android/gms/internal/measurement/zzfx;

    const-string v7, "android"

    invoke-virtual {v15, v7}, Lcom/google/android/gms/internal/measurement/zzfx;->zzW(Ljava/lang/String;)Lcom/google/android/gms/internal/measurement/zzfx;

    .line 26
    invoke-virtual {v4}, Lcom/google/android/gms/measurement/internal/zzg;->zzt()Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v7

    if-nez v7, :cond_4

    .line 27
    invoke-virtual {v4}, Lcom/google/android/gms/measurement/internal/zzg;->zzt()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v15, v7}, Lcom/google/android/gms/internal/measurement/zzfx;->zzA(Ljava/lang/String;)Lcom/google/android/gms/internal/measurement/zzfx;

    .line 28
    :cond_4
    invoke-virtual {v4}, Lcom/google/android/gms/measurement/internal/zzg;->zzv()Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v7

    if-nez v7, :cond_5

    .line 29
    invoke-virtual {v4}, Lcom/google/android/gms/measurement/internal/zzg;->zzv()Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/String;

    invoke-virtual {v15, v7}, Lcom/google/android/gms/internal/measurement/zzfx;->zzC(Ljava/lang/String;)Lcom/google/android/gms/internal/measurement/zzfx;

    .line 30
    :cond_5
    invoke-virtual {v4}, Lcom/google/android/gms/measurement/internal/zzg;->zzw()Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v7

    if-nez v7, :cond_6

    .line 31
    invoke-virtual {v4}, Lcom/google/android/gms/measurement/internal/zzg;->zzw()Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/String;

    invoke-virtual {v15, v7}, Lcom/google/android/gms/internal/measurement/zzfx;->zzD(Ljava/lang/String;)Lcom/google/android/gms/internal/measurement/zzfx;

    .line 32
    :cond_6
    invoke-virtual {v4}, Lcom/google/android/gms/measurement/internal/zzg;->zzb()J

    move-result-wide v7

    const-wide/32 v9, -0x80000000

    cmp-long v12, v7, v9

    if-eqz v12, :cond_7

    .line 33
    invoke-virtual {v4}, Lcom/google/android/gms/measurement/internal/zzg;->zzb()J

    move-result-wide v7

    long-to-int v8, v7

    invoke-virtual {v15, v8}, Lcom/google/android/gms/internal/measurement/zzfx;->zzE(I)Lcom/google/android/gms/internal/measurement/zzfx;

    .line 34
    :cond_7
    invoke-virtual {v4}, Lcom/google/android/gms/measurement/internal/zzg;->zzm()J

    move-result-wide v7

    invoke-virtual {v15, v7, v8}, Lcom/google/android/gms/internal/measurement/zzfx;->zzS(J)Lcom/google/android/gms/internal/measurement/zzfx;

    .line 35
    invoke-virtual {v4}, Lcom/google/android/gms/measurement/internal/zzg;->zzk()J

    move-result-wide v7

    invoke-virtual {v15, v7, v8}, Lcom/google/android/gms/internal/measurement/zzfx;->zzM(J)Lcom/google/android/gms/internal/measurement/zzfx;

    .line 36
    invoke-virtual {v4}, Lcom/google/android/gms/measurement/internal/zzg;->zzz()Ljava/lang/String;

    move-result-object v7

    .line 37
    invoke-virtual {v4}, Lcom/google/android/gms/measurement/internal/zzg;->zzr()Ljava/lang/String;

    move-result-object v8

    .line 38
    invoke-static {}, Lcom/google/android/gms/internal/measurement/zzoq;->zzc()Z

    iget-object v9, v2, Lcom/google/android/gms/measurement/internal/zzgl;->zzs:Lcom/google/android/gms/measurement/internal/zzfs;

    .line 39
    invoke-virtual {v9}, Lcom/google/android/gms/measurement/internal/zzfs;->zzf()Lcom/google/android/gms/measurement/internal/zzaf;

    move-result-object v9

    .line 38
    invoke-virtual {v4}, Lcom/google/android/gms/measurement/internal/zzg;->zzt()Ljava/lang/String;

    move-result-object v10

    sget-object v12, Lcom/google/android/gms/measurement/internal/zzdw;->zzad:Lcom/google/android/gms/measurement/internal/zzdv;

    invoke-virtual {v9, v10, v12}, Lcom/google/android/gms/measurement/internal/zzaf;->zzs(Ljava/lang/String;Lcom/google/android/gms/measurement/internal/zzdv;)Z

    move-result v9

    if-eqz v9, :cond_a

    .line 44
    invoke-virtual {v4}, Lcom/google/android/gms/measurement/internal/zzg;->zzy()Ljava/lang/String;

    move-result-object v9

    .line 45
    invoke-static {v7}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v10

    if-nez v10, :cond_8

    .line 46
    invoke-virtual {v15, v7}, Lcom/google/android/gms/internal/measurement/zzfx;->zzR(Ljava/lang/String;)Lcom/google/android/gms/internal/measurement/zzfx;

    goto :goto_1

    .line 47
    :cond_8
    invoke-static {v9}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v7

    if-nez v7, :cond_9

    .line 48
    invoke-virtual {v15, v9}, Lcom/google/android/gms/internal/measurement/zzfx;->zzQ(Ljava/lang/String;)Lcom/google/android/gms/internal/measurement/zzfx;

    goto :goto_1

    .line 49
    :cond_9
    invoke-static {v8}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v7

    if-nez v7, :cond_c

    .line 50
    invoke-virtual {v15, v8}, Lcom/google/android/gms/internal/measurement/zzfx;->zzy(Ljava/lang/String;)Lcom/google/android/gms/internal/measurement/zzfx;

    goto :goto_1

    .line 40
    :cond_a
    invoke-static {v7}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v9

    if-nez v9, :cond_b

    .line 41
    invoke-virtual {v15, v7}, Lcom/google/android/gms/internal/measurement/zzfx;->zzR(Ljava/lang/String;)Lcom/google/android/gms/internal/measurement/zzfx;

    goto :goto_1

    .line 42
    :cond_b
    invoke-static {v8}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v7

    if-nez v7, :cond_c

    .line 43
    invoke-virtual {v15, v8}, Lcom/google/android/gms/internal/measurement/zzfx;->zzy(Ljava/lang/String;)Lcom/google/android/gms/internal/measurement/zzfx;

    .line 46
    :cond_c
    :goto_1
    iget-object v7, v2, Lcom/google/android/gms/measurement/internal/zzia;->zzf:Lcom/google/android/gms/measurement/internal/zzkn;

    .line 51
    invoke-virtual {v7, v13}, Lcom/google/android/gms/measurement/internal/zzkn;->zzh(Ljava/lang/String;)Lcom/google/android/gms/measurement/internal/zzag;

    move-result-object v7

    .line 52
    invoke-virtual {v4}, Lcom/google/android/gms/measurement/internal/zzg;->zzj()J

    move-result-wide v8

    invoke-virtual {v15, v8, v9}, Lcom/google/android/gms/internal/measurement/zzfx;->zzJ(J)Lcom/google/android/gms/internal/measurement/zzfx;

    iget-object v8, v2, Lcom/google/android/gms/measurement/internal/zzia;->zzs:Lcom/google/android/gms/measurement/internal/zzfs;

    .line 53
    invoke-virtual {v8}, Lcom/google/android/gms/measurement/internal/zzfs;->zzJ()Z

    move-result v8

    if-eqz v8, :cond_d

    iget-object v8, v2, Lcom/google/android/gms/measurement/internal/zzgl;->zzs:Lcom/google/android/gms/measurement/internal/zzfs;

    .line 54
    invoke-virtual {v8}, Lcom/google/android/gms/measurement/internal/zzfs;->zzf()Lcom/google/android/gms/measurement/internal/zzaf;

    move-result-object v8

    .line 53
    invoke-virtual {v15}, Lcom/google/android/gms/internal/measurement/zzfx;->zzal()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Lcom/google/android/gms/measurement/internal/zzaf;->zzt(Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_d

    .line 55
    invoke-virtual {v7}, Lcom/google/android/gms/measurement/internal/zzag;->zzj()Z

    move-result v8

    if-eqz v8, :cond_d

    .line 56
    invoke-static {v14}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v8

    if-nez v8, :cond_d

    .line 57
    invoke-virtual {v15, v14}, Lcom/google/android/gms/internal/measurement/zzfx;->zzL(Ljava/lang/String;)Lcom/google/android/gms/internal/measurement/zzfx;

    .line 58
    :cond_d
    invoke-virtual {v7}, Lcom/google/android/gms/measurement/internal/zzag;->zzi()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v15, v8}, Lcom/google/android/gms/internal/measurement/zzfx;->zzI(Ljava/lang/String;)Lcom/google/android/gms/internal/measurement/zzfx;

    .line 59
    invoke-virtual {v7}, Lcom/google/android/gms/measurement/internal/zzag;->zzj()Z

    move-result v8

    if-eqz v8, :cond_e

    iget-object v8, v2, Lcom/google/android/gms/measurement/internal/zzkc;->zzf:Lcom/google/android/gms/measurement/internal/zzkn;

    invoke-virtual {v8}, Lcom/google/android/gms/measurement/internal/zzkn;->zzs()Lcom/google/android/gms/measurement/internal/zzjk;

    move-result-object v8

    .line 60
    invoke-virtual {v4}, Lcom/google/android/gms/measurement/internal/zzg;->zzt()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9, v7}, Lcom/google/android/gms/measurement/internal/zzjk;->zzd(Ljava/lang/String;Lcom/google/android/gms/measurement/internal/zzag;)Landroid/util/Pair;

    move-result-object v8

    .line 61
    invoke-virtual {v4}, Lcom/google/android/gms/measurement/internal/zzg;->zzai()Z

    move-result v9

    if-eqz v9, :cond_e

    iget-object v9, v8, Landroid/util/Pair;->first:Ljava/lang/Object;

    check-cast v9, Ljava/lang/CharSequence;

    .line 62
    invoke-static {v9}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v9
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    if-nez v9, :cond_e

    .line 63
    :try_start_3
    iget-object v9, v8, Landroid/util/Pair;->first:Ljava/lang/Object;

    check-cast v9, Ljava/lang/String;

    iget-wide v11, v3, Lcom/google/android/gms/measurement/internal/zzat;->zzd:J

    .line 64
    invoke-static {v11, v12}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v10

    .line 3
    invoke-static {v9, v10}, Lcom/google/android/gms/measurement/internal/zzia;->zza(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    .line 63
    invoke-virtual {v15, v9}, Lcom/google/android/gms/internal/measurement/zzfx;->zzab(Ljava/lang/String;)Lcom/google/android/gms/internal/measurement/zzfx;
    :try_end_3
    .catch Ljava/lang/SecurityException; {:try_start_3 .. :try_end_3} :catch_0
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 67
    :try_start_4
    iget-object v9, v8, Landroid/util/Pair;->second:Ljava/lang/Object;

    if-eqz v9, :cond_e

    .line 68
    iget-object v8, v8, Landroid/util/Pair;->second:Ljava/lang/Object;

    check-cast v8, Ljava/lang/Boolean;

    invoke-virtual {v8}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v8

    invoke-virtual {v15, v8}, Lcom/google/android/gms/internal/measurement/zzfx;->zzU(Z)Lcom/google/android/gms/internal/measurement/zzfx;

    goto :goto_2

    :catch_0
    move-exception v0

    .line 210
    iget-object v3, v2, Lcom/google/android/gms/measurement/internal/zzgl;->zzs:Lcom/google/android/gms/measurement/internal/zzfs;

    .line 65
    invoke-virtual {v3}, Lcom/google/android/gms/measurement/internal/zzfs;->zzay()Lcom/google/android/gms/measurement/internal/zzei;

    move-result-object v3

    .line 66
    invoke-virtual {v3}, Lcom/google/android/gms/measurement/internal/zzei;->zzc()Lcom/google/android/gms/measurement/internal/zzeg;

    move-result-object v3

    const-string v4, "Resettable device id encryption failed"

    invoke-virtual {v0}, Ljava/lang/SecurityException;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v3, v4, v0}, Lcom/google/android/gms/measurement/internal/zzeg;->zzb(Ljava/lang/String;Ljava/lang/Object;)V

    new-array v14, v5, [B
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    iget-object v0, v2, Lcom/google/android/gms/measurement/internal/zzkc;->zzf:Lcom/google/android/gms/measurement/internal/zzkn;

    goto/16 :goto_0

    .line 68
    :cond_e
    :goto_2
    :try_start_5
    iget-object v8, v2, Lcom/google/android/gms/measurement/internal/zzgl;->zzs:Lcom/google/android/gms/measurement/internal/zzfs;

    .line 69
    invoke-virtual {v8}, Lcom/google/android/gms/measurement/internal/zzfs;->zzg()Lcom/google/android/gms/measurement/internal/zzan;

    move-result-object v8

    .line 70
    invoke-virtual {v8}, Lcom/google/android/gms/measurement/internal/zzgm;->zzu()V

    sget-object v8, Landroid/os/Build;->MODEL:Ljava/lang/String;

    invoke-virtual {v15, v8}, Lcom/google/android/gms/internal/measurement/zzfx;->zzK(Ljava/lang/String;)Lcom/google/android/gms/internal/measurement/zzfx;

    iget-object v8, v2, Lcom/google/android/gms/measurement/internal/zzgl;->zzs:Lcom/google/android/gms/measurement/internal/zzfs;

    .line 71
    invoke-virtual {v8}, Lcom/google/android/gms/measurement/internal/zzfs;->zzg()Lcom/google/android/gms/measurement/internal/zzan;

    move-result-object v8

    .line 72
    invoke-virtual {v8}, Lcom/google/android/gms/measurement/internal/zzgm;->zzu()V

    sget-object v8, Landroid/os/Build$VERSION;->RELEASE:Ljava/lang/String;

    invoke-virtual {v15, v8}, Lcom/google/android/gms/internal/measurement/zzfx;->zzV(Ljava/lang/String;)Lcom/google/android/gms/internal/measurement/zzfx;

    iget-object v8, v2, Lcom/google/android/gms/measurement/internal/zzgl;->zzs:Lcom/google/android/gms/measurement/internal/zzfs;

    .line 73
    invoke-virtual {v8}, Lcom/google/android/gms/measurement/internal/zzfs;->zzg()Lcom/google/android/gms/measurement/internal/zzan;

    move-result-object v8

    .line 74
    invoke-virtual {v8}, Lcom/google/android/gms/measurement/internal/zzan;->zzb()J

    move-result-wide v8

    long-to-int v9, v8

    invoke-virtual {v15, v9}, Lcom/google/android/gms/internal/measurement/zzfx;->zzaf(I)Lcom/google/android/gms/internal/measurement/zzfx;

    iget-object v8, v2, Lcom/google/android/gms/measurement/internal/zzgl;->zzs:Lcom/google/android/gms/measurement/internal/zzfs;

    .line 75
    invoke-virtual {v8}, Lcom/google/android/gms/measurement/internal/zzfs;->zzg()Lcom/google/android/gms/measurement/internal/zzan;

    move-result-object v8

    .line 76
    invoke-virtual {v8}, Lcom/google/android/gms/measurement/internal/zzan;->zzc()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v15, v8}, Lcom/google/android/gms/internal/measurement/zzfx;->zzaj(Ljava/lang/String;)Lcom/google/android/gms/internal/measurement/zzfx;
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 77
    :try_start_6
    invoke-virtual {v7}, Lcom/google/android/gms/measurement/internal/zzag;->zzk()Z

    move-result v7

    if-eqz v7, :cond_f

    .line 78
    invoke-virtual {v4}, Lcom/google/android/gms/measurement/internal/zzg;->zzu()Ljava/lang/String;

    move-result-object v7

    if-eqz v7, :cond_f

    .line 79
    invoke-virtual {v4}, Lcom/google/android/gms/measurement/internal/zzg;->zzu()Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/String;

    iget-wide v8, v3, Lcom/google/android/gms/measurement/internal/zzat;->zzd:J

    .line 80
    invoke-static {v8, v9}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v8

    .line 3
    invoke-static {v7, v8}, Lcom/google/android/gms/measurement/internal/zzia;->zza(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    .line 81
    invoke-virtual {v15, v7}, Lcom/google/android/gms/internal/measurement/zzfx;->zzB(Ljava/lang/String;)Lcom/google/android/gms/internal/measurement/zzfx;
    :try_end_6
    .catch Ljava/lang/SecurityException; {:try_start_6 .. :try_end_6} :catch_2
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    .line 84
    :cond_f
    :try_start_7
    invoke-virtual {v4}, Lcom/google/android/gms/measurement/internal/zzg;->zzx()Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v7

    if-nez v7, :cond_10

    .line 85
    invoke-virtual {v4}, Lcom/google/android/gms/measurement/internal/zzg;->zzx()Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/String;

    invoke-virtual {v15, v7}, Lcom/google/android/gms/internal/measurement/zzfx;->zzP(Ljava/lang/String;)Lcom/google/android/gms/internal/measurement/zzfx;

    .line 86
    :cond_10
    invoke-virtual {v4}, Lcom/google/android/gms/measurement/internal/zzg;->zzt()Ljava/lang/String;

    move-result-object v7

    iget-object v8, v2, Lcom/google/android/gms/measurement/internal/zzkc;->zzf:Lcom/google/android/gms/measurement/internal/zzkn;

    .line 87
    invoke-virtual {v8}, Lcom/google/android/gms/measurement/internal/zzkn;->zzi()Lcom/google/android/gms/measurement/internal/zzaj;

    move-result-object v8

    .line 88
    invoke-virtual {v8, v7}, Lcom/google/android/gms/measurement/internal/zzaj;->zzu(Ljava/lang/String;)Ljava/util/List;

    move-result-object v8

    .line 89
    invoke-interface {v8}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v9

    :cond_11
    invoke-interface {v9}, Ljava/util/Iterator;->hasNext()Z

    move-result v10

    if-eqz v10, :cond_12

    invoke-interface {v9}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Lcom/google/android/gms/measurement/internal/zzks;

    const-string v11, "_lte"

    .line 90
    iget-object v12, v10, Lcom/google/android/gms/measurement/internal/zzks;->zzc:Ljava/lang/String;

    invoke-virtual {v11, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_11

    goto :goto_3

    :cond_12
    move-object v10, v14

    :goto_3
    const-wide/16 v24, 0x0

    if-eqz v10, :cond_13

    iget-object v9, v10, Lcom/google/android/gms/measurement/internal/zzks;->zze:Ljava/lang/Object;

    if-nez v9, :cond_14

    :cond_13
    new-instance v9, Lcom/google/android/gms/measurement/internal/zzks;

    const-string v19, "auto"

    const-string v20, "_lte"

    iget-object v10, v2, Lcom/google/android/gms/measurement/internal/zzgl;->zzs:Lcom/google/android/gms/measurement/internal/zzfs;

    .line 91
    invoke-virtual {v10}, Lcom/google/android/gms/measurement/internal/zzfs;->zzav()Lcom/google/android/gms/common/util/Clock;

    move-result-object v10

    .line 92
    invoke-interface {v10}, Lcom/google/android/gms/common/util/Clock;->currentTimeMillis()J

    move-result-wide v21

    .line 93
    invoke-static/range {v24 .. v25}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v23

    move-object/from16 v17, v9

    move-object/from16 v18, v7

    invoke-direct/range {v17 .. v23}, Lcom/google/android/gms/measurement/internal/zzks;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;JLjava/lang/Object;)V

    .line 94
    invoke-interface {v8, v9}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    iget-object v7, v2, Lcom/google/android/gms/measurement/internal/zzkc;->zzf:Lcom/google/android/gms/measurement/internal/zzkn;

    .line 95
    invoke-virtual {v7}, Lcom/google/android/gms/measurement/internal/zzkn;->zzi()Lcom/google/android/gms/measurement/internal/zzaj;

    move-result-object v7

    .line 96
    invoke-virtual {v7, v9}, Lcom/google/android/gms/measurement/internal/zzaj;->zzN(Lcom/google/android/gms/measurement/internal/zzks;)Z

    :cond_14
    iget-object v7, v2, Lcom/google/android/gms/measurement/internal/zzkc;->zzf:Lcom/google/android/gms/measurement/internal/zzkn;

    .line 97
    invoke-virtual {v7}, Lcom/google/android/gms/measurement/internal/zzkn;->zzu()Lcom/google/android/gms/measurement/internal/zzkp;

    move-result-object v7

    iget-object v9, v7, Lcom/google/android/gms/measurement/internal/zzgl;->zzs:Lcom/google/android/gms/measurement/internal/zzfs;

    .line 98
    invoke-virtual {v9}, Lcom/google/android/gms/measurement/internal/zzfs;->zzay()Lcom/google/android/gms/measurement/internal/zzei;

    move-result-object v9

    .line 99
    invoke-virtual {v9}, Lcom/google/android/gms/measurement/internal/zzei;->zzj()Lcom/google/android/gms/measurement/internal/zzeg;

    move-result-object v9

    const-string v10, "Checking account type status for ad personalization signals"

    invoke-virtual {v9, v10}, Lcom/google/android/gms/measurement/internal/zzeg;->zza(Ljava/lang/String;)V

    iget-object v9, v7, Lcom/google/android/gms/measurement/internal/zzgl;->zzs:Lcom/google/android/gms/measurement/internal/zzfs;

    .line 100
    invoke-virtual {v9}, Lcom/google/android/gms/measurement/internal/zzfs;->zzg()Lcom/google/android/gms/measurement/internal/zzan;

    move-result-object v9

    .line 101
    invoke-virtual {v9}, Lcom/google/android/gms/measurement/internal/zzan;->zze()Z

    move-result v9

    const-wide/16 v10, 0x1

    if-eqz v9, :cond_17

    .line 102
    invoke-virtual {v4}, Lcom/google/android/gms/measurement/internal/zzg;->zzt()Ljava/lang/String;

    move-result-object v9

    .line 103
    invoke-static {v9}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 104
    invoke-virtual {v4}, Lcom/google/android/gms/measurement/internal/zzg;->zzai()Z

    move-result v12

    if-eqz v12, :cond_17

    iget-object v12, v7, Lcom/google/android/gms/measurement/internal/zzkc;->zzf:Lcom/google/android/gms/measurement/internal/zzkn;

    .line 105
    invoke-virtual {v12}, Lcom/google/android/gms/measurement/internal/zzkn;->zzo()Lcom/google/android/gms/measurement/internal/zzfj;

    move-result-object v12

    .line 106
    invoke-virtual {v12, v9}, Lcom/google/android/gms/measurement/internal/zzfj;->zzk(Ljava/lang/String;)Z

    move-result v12

    if-eqz v12, :cond_17

    iget-object v12, v7, Lcom/google/android/gms/measurement/internal/zzgl;->zzs:Lcom/google/android/gms/measurement/internal/zzfs;

    .line 107
    invoke-virtual {v12}, Lcom/google/android/gms/measurement/internal/zzfs;->zzay()Lcom/google/android/gms/measurement/internal/zzei;

    move-result-object v12

    .line 108
    invoke-virtual {v12}, Lcom/google/android/gms/measurement/internal/zzei;->zzc()Lcom/google/android/gms/measurement/internal/zzeg;

    move-result-object v12

    const-string v14, "Turning off ad personalization due to account type"

    invoke-virtual {v12, v14}, Lcom/google/android/gms/measurement/internal/zzeg;->zza(Ljava/lang/String;)V

    .line 109
    invoke-interface {v8}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v12

    .line 110
    :goto_4
    invoke-interface {v12}, Ljava/util/Iterator;->hasNext()Z

    move-result v14

    if-eqz v14, :cond_16

    const-string v14, "_npa"

    .line 111
    invoke-interface {v12}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v17

    move-object/from16 v5, v17

    check-cast v5, Lcom/google/android/gms/measurement/internal/zzks;

    .line 112
    iget-object v5, v5, Lcom/google/android/gms/measurement/internal/zzks;->zzc:Ljava/lang/String;

    invoke-virtual {v14, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_15

    .line 113
    invoke-interface {v12}, Ljava/util/Iterator;->remove()V

    goto :goto_5

    :cond_15
    const/4 v5, 0x0

    goto :goto_4

    :cond_16
    :goto_5
    new-instance v5, Lcom/google/android/gms/measurement/internal/zzks;

    const-string v19, "auto"

    const-string v20, "_npa"

    iget-object v7, v7, Lcom/google/android/gms/measurement/internal/zzgl;->zzs:Lcom/google/android/gms/measurement/internal/zzfs;

    .line 114
    invoke-virtual {v7}, Lcom/google/android/gms/measurement/internal/zzfs;->zzav()Lcom/google/android/gms/common/util/Clock;

    move-result-object v7

    .line 115
    invoke-interface {v7}, Lcom/google/android/gms/common/util/Clock;->currentTimeMillis()J

    move-result-wide v21

    .line 116
    invoke-static {v10, v11}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v23

    move-object/from16 v17, v5

    move-object/from16 v18, v9

    invoke-direct/range {v17 .. v23}, Lcom/google/android/gms/measurement/internal/zzks;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;JLjava/lang/Object;)V

    .line 117
    invoke-interface {v8, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 118
    :cond_17
    invoke-interface {v8}, Ljava/util/List;->size()I

    move-result v5

    new-array v5, v5, [Lcom/google/android/gms/internal/measurement/zzgh;

    const/4 v7, 0x0

    .line 119
    :goto_6
    invoke-interface {v8}, Ljava/util/List;->size()I

    move-result v9

    if-ge v7, v9, :cond_18

    .line 120
    invoke-static {}, Lcom/google/android/gms/internal/measurement/zzgh;->zzd()Lcom/google/android/gms/internal/measurement/zzgg;

    move-result-object v9

    .line 121
    invoke-interface {v8, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Lcom/google/android/gms/measurement/internal/zzks;

    iget-object v12, v12, Lcom/google/android/gms/measurement/internal/zzks;->zzc:Ljava/lang/String;

    invoke-virtual {v9, v12}, Lcom/google/android/gms/internal/measurement/zzgg;->zzf(Ljava/lang/String;)Lcom/google/android/gms/internal/measurement/zzgg;

    .line 122
    invoke-interface {v8, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Lcom/google/android/gms/measurement/internal/zzks;

    iget-wide v10, v12, Lcom/google/android/gms/measurement/internal/zzks;->zzd:J

    invoke-virtual {v9, v10, v11}, Lcom/google/android/gms/internal/measurement/zzgg;->zzg(J)Lcom/google/android/gms/internal/measurement/zzgg;

    iget-object v10, v2, Lcom/google/android/gms/measurement/internal/zzkc;->zzf:Lcom/google/android/gms/measurement/internal/zzkn;

    .line 123
    invoke-virtual {v10}, Lcom/google/android/gms/measurement/internal/zzkn;->zzu()Lcom/google/android/gms/measurement/internal/zzkp;

    move-result-object v10

    .line 124
    invoke-interface {v8, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Lcom/google/android/gms/measurement/internal/zzks;

    iget-object v11, v11, Lcom/google/android/gms/measurement/internal/zzks;->zze:Ljava/lang/Object;

    invoke-virtual {v10, v9, v11}, Lcom/google/android/gms/measurement/internal/zzkp;->zzv(Lcom/google/android/gms/internal/measurement/zzgg;Ljava/lang/Object;)V

    .line 125
    invoke-virtual {v9}, Lcom/google/android/gms/internal/measurement/zzjv;->zzaA()Lcom/google/android/gms/internal/measurement/zzjz;

    move-result-object v9

    check-cast v9, Lcom/google/android/gms/internal/measurement/zzgh;

    aput-object v9, v5, v7

    add-int/lit8 v7, v7, 0x1

    const-wide/16 v10, 0x1

    goto :goto_6

    .line 126
    :cond_18
    invoke-static {v5}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v5

    invoke-virtual {v15, v5}, Lcom/google/android/gms/internal/measurement/zzfx;->zzi(Ljava/lang/Iterable;)Lcom/google/android/gms/internal/measurement/zzfx;

    .line 127
    invoke-static {v3}, Lcom/google/android/gms/measurement/internal/zzej;->zzb(Lcom/google/android/gms/measurement/internal/zzat;)Lcom/google/android/gms/measurement/internal/zzej;

    move-result-object v5

    iget-object v7, v2, Lcom/google/android/gms/measurement/internal/zzgl;->zzs:Lcom/google/android/gms/measurement/internal/zzfs;

    .line 128
    invoke-virtual {v7}, Lcom/google/android/gms/measurement/internal/zzfs;->zzv()Lcom/google/android/gms/measurement/internal/zzku;

    move-result-object v7

    iget-object v8, v5, Lcom/google/android/gms/measurement/internal/zzej;->zzd:Landroid/os/Bundle;

    iget-object v9, v2, Lcom/google/android/gms/measurement/internal/zzkc;->zzf:Lcom/google/android/gms/measurement/internal/zzkn;

    .line 129
    invoke-virtual {v9}, Lcom/google/android/gms/measurement/internal/zzkn;->zzi()Lcom/google/android/gms/measurement/internal/zzaj;

    move-result-object v9

    .line 130
    invoke-virtual {v9, v13}, Lcom/google/android/gms/measurement/internal/zzaj;->zzi(Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object v9

    .line 131
    invoke-virtual {v7, v8, v9}, Lcom/google/android/gms/measurement/internal/zzku;->zzK(Landroid/os/Bundle;Landroid/os/Bundle;)V

    iget-object v7, v2, Lcom/google/android/gms/measurement/internal/zzgl;->zzs:Lcom/google/android/gms/measurement/internal/zzfs;

    .line 132
    invoke-virtual {v7}, Lcom/google/android/gms/measurement/internal/zzfs;->zzv()Lcom/google/android/gms/measurement/internal/zzku;

    move-result-object v7

    iget-object v8, v2, Lcom/google/android/gms/measurement/internal/zzgl;->zzs:Lcom/google/android/gms/measurement/internal/zzfs;

    .line 133
    invoke-virtual {v8}, Lcom/google/android/gms/measurement/internal/zzfs;->zzf()Lcom/google/android/gms/measurement/internal/zzaf;

    move-result-object v8

    .line 134
    invoke-virtual {v8, v13}, Lcom/google/android/gms/measurement/internal/zzaf;->zzd(Ljava/lang/String;)I

    move-result v8

    .line 135
    invoke-virtual {v7, v5, v8}, Lcom/google/android/gms/measurement/internal/zzku;->zzL(Lcom/google/android/gms/measurement/internal/zzej;I)V

    iget-object v14, v5, Lcom/google/android/gms/measurement/internal/zzej;->zzd:Landroid/os/Bundle;

    const-string v5, "_c"

    const-wide/16 v7, 0x1

    .line 136
    invoke-virtual {v14, v5, v7, v8}, Landroid/os/Bundle;->putLong(Ljava/lang/String;J)V

    iget-object v5, v2, Lcom/google/android/gms/measurement/internal/zzgl;->zzs:Lcom/google/android/gms/measurement/internal/zzfs;

    .line 137
    invoke-virtual {v5}, Lcom/google/android/gms/measurement/internal/zzfs;->zzay()Lcom/google/android/gms/measurement/internal/zzei;

    move-result-object v5

    .line 138
    invoke-virtual {v5}, Lcom/google/android/gms/measurement/internal/zzei;->zzc()Lcom/google/android/gms/measurement/internal/zzeg;

    move-result-object v5

    const-string v7, "Marking in-app purchase as real-time"

    invoke-virtual {v5, v7}, Lcom/google/android/gms/measurement/internal/zzeg;->zza(Ljava/lang/String;)V

    const-wide/16 v7, 0x1

    .line 139
    invoke-virtual {v14, v0, v7, v8}, Landroid/os/Bundle;->putLong(Ljava/lang/String;J)V

    const-string v5, "_o"

    .line 140
    iget-object v7, v3, Lcom/google/android/gms/measurement/internal/zzat;->zzc:Ljava/lang/String;

    invoke-virtual {v14, v5, v7}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v5, v2, Lcom/google/android/gms/measurement/internal/zzgl;->zzs:Lcom/google/android/gms/measurement/internal/zzfs;

    .line 141
    invoke-virtual {v5}, Lcom/google/android/gms/measurement/internal/zzfs;->zzv()Lcom/google/android/gms/measurement/internal/zzku;

    move-result-object v5

    .line 142
    invoke-virtual {v15}, Lcom/google/android/gms/internal/measurement/zzfx;->zzal()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v5, v7}, Lcom/google/android/gms/measurement/internal/zzku;->zzad(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_19

    iget-object v5, v2, Lcom/google/android/gms/measurement/internal/zzgl;->zzs:Lcom/google/android/gms/measurement/internal/zzfs;

    .line 143
    invoke-virtual {v5}, Lcom/google/android/gms/measurement/internal/zzfs;->zzv()Lcom/google/android/gms/measurement/internal/zzku;

    move-result-object v5

    const-wide/16 v7, 0x1

    .line 144
    invoke-static {v7, v8}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v7

    const-string v8, "_dbg"

    invoke-virtual {v5, v14, v8, v7}, Lcom/google/android/gms/measurement/internal/zzku;->zzN(Landroid/os/Bundle;Ljava/lang/String;Ljava/lang/Object;)V

    iget-object v5, v2, Lcom/google/android/gms/measurement/internal/zzgl;->zzs:Lcom/google/android/gms/measurement/internal/zzfs;

    .line 145
    invoke-virtual {v5}, Lcom/google/android/gms/measurement/internal/zzfs;->zzv()Lcom/google/android/gms/measurement/internal/zzku;

    move-result-object v5

    .line 146
    invoke-virtual {v5, v14, v0, v7}, Lcom/google/android/gms/measurement/internal/zzku;->zzN(Landroid/os/Bundle;Ljava/lang/String;Ljava/lang/Object;)V

    :cond_19
    iget-object v0, v2, Lcom/google/android/gms/measurement/internal/zzkc;->zzf:Lcom/google/android/gms/measurement/internal/zzkn;

    .line 147
    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzi()Lcom/google/android/gms/measurement/internal/zzaj;

    move-result-object v0

    .line 148
    iget-object v5, v3, Lcom/google/android/gms/measurement/internal/zzat;->zza:Ljava/lang/String;

    invoke-virtual {v0, v13, v5}, Lcom/google/android/gms/measurement/internal/zzaj;->zzn(Ljava/lang/String;Ljava/lang/String;)Lcom/google/android/gms/measurement/internal/zzap;

    move-result-object v0

    if-nez v0, :cond_1a

    new-instance v0, Lcom/google/android/gms/measurement/internal/zzap;

    .line 149
    iget-object v5, v3, Lcom/google/android/gms/measurement/internal/zzat;->zza:Ljava/lang/String;

    iget-wide v11, v3, Lcom/google/android/gms/measurement/internal/zzat;->zzd:J

    const-wide/16 v7, 0x0

    const-wide/16 v9, 0x0

    const-wide/16 v17, 0x0

    move-wide/from16 v21, v11

    move-wide/from16 v11, v17

    const-wide/16 v16, 0x0

    move-object/from16 v28, v15

    move-wide/from16 v15, v16

    const/16 v17, 0x0

    const/16 v18, 0x0

    const/16 v19, 0x0

    const/16 v20, 0x0

    move-object/from16 v23, v4

    move-object v4, v0

    move-object/from16 v27, v5

    move-object v5, v13

    move-object/from16 v29, v6

    move-object/from16 v6, v27

    move-object/from16 v27, v13

    move-object/from16 v30, v14

    const/16 v26, 0x0

    move-wide/from16 v13, v21

    .line 150
    invoke-direct/range {v4 .. v20}, Lcom/google/android/gms/measurement/internal/zzap;-><init>(Ljava/lang/String;Ljava/lang/String;JJJJJLjava/lang/Long;Ljava/lang/Long;Ljava/lang/Long;Ljava/lang/Boolean;)V

    move-wide/from16 v11, v24

    goto :goto_7

    :cond_1a
    move-object/from16 v23, v4

    move-object/from16 v29, v6

    move-object/from16 v27, v13

    move-object/from16 v30, v14

    move-object/from16 v28, v15

    const/16 v26, 0x0

    .line 190
    iget-wide v4, v0, Lcom/google/android/gms/measurement/internal/zzap;->zzf:J

    .line 151
    iget-wide v6, v3, Lcom/google/android/gms/measurement/internal/zzat;->zzd:J

    .line 152
    invoke-virtual {v0, v6, v7}, Lcom/google/android/gms/measurement/internal/zzap;->zzc(J)Lcom/google/android/gms/measurement/internal/zzap;

    move-result-object v0

    move-wide v11, v4

    .line 150
    :goto_7
    iget-object v4, v2, Lcom/google/android/gms/measurement/internal/zzkc;->zzf:Lcom/google/android/gms/measurement/internal/zzkn;

    .line 153
    invoke-virtual {v4}, Lcom/google/android/gms/measurement/internal/zzkn;->zzi()Lcom/google/android/gms/measurement/internal/zzaj;

    move-result-object v4

    .line 154
    invoke-virtual {v4, v0}, Lcom/google/android/gms/measurement/internal/zzaj;->zzE(Lcom/google/android/gms/measurement/internal/zzap;)V

    new-instance v14, Lcom/google/android/gms/measurement/internal/zzao;

    iget-object v5, v2, Lcom/google/android/gms/measurement/internal/zzia;->zzs:Lcom/google/android/gms/measurement/internal/zzfs;

    .line 155
    iget-object v6, v3, Lcom/google/android/gms/measurement/internal/zzat;->zzc:Ljava/lang/String;

    iget-object v8, v3, Lcom/google/android/gms/measurement/internal/zzat;->zza:Ljava/lang/String;

    iget-wide v9, v3, Lcom/google/android/gms/measurement/internal/zzat;->zzd:J

    move-object v4, v14

    move-object/from16 v7, v27

    move-object/from16 v13, v30

    invoke-direct/range {v4 .. v13}, Lcom/google/android/gms/measurement/internal/zzao;-><init>(Lcom/google/android/gms/measurement/internal/zzfs;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;JJLandroid/os/Bundle;)V

    .line 156
    invoke-static {}, Lcom/google/android/gms/internal/measurement/zzfo;->zze()Lcom/google/android/gms/internal/measurement/zzfn;

    move-result-object v4

    iget-wide v5, v14, Lcom/google/android/gms/measurement/internal/zzao;->zzd:J

    .line 157
    invoke-virtual {v4, v5, v6}, Lcom/google/android/gms/internal/measurement/zzfn;->zzm(J)Lcom/google/android/gms/internal/measurement/zzfn;

    iget-object v5, v14, Lcom/google/android/gms/measurement/internal/zzao;->zzb:Ljava/lang/String;

    .line 158
    invoke-virtual {v4, v5}, Lcom/google/android/gms/internal/measurement/zzfn;->zzi(Ljava/lang/String;)Lcom/google/android/gms/internal/measurement/zzfn;

    iget-wide v5, v14, Lcom/google/android/gms/measurement/internal/zzao;->zze:J

    .line 159
    invoke-virtual {v4, v5, v6}, Lcom/google/android/gms/internal/measurement/zzfn;->zzl(J)Lcom/google/android/gms/internal/measurement/zzfn;

    iget-object v5, v14, Lcom/google/android/gms/measurement/internal/zzao;->zzf:Lcom/google/android/gms/measurement/internal/zzar;

    new-instance v6, Lcom/google/android/gms/measurement/internal/zzaq;

    .line 160
    invoke-direct {v6, v5}, Lcom/google/android/gms/measurement/internal/zzaq;-><init>(Lcom/google/android/gms/measurement/internal/zzar;)V

    .line 161
    :cond_1b
    :goto_8
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_1c

    .line 162
    invoke-virtual {v6}, Lcom/google/android/gms/measurement/internal/zzaq;->zza()Ljava/lang/String;

    move-result-object v5

    .line 163
    invoke-static {}, Lcom/google/android/gms/internal/measurement/zzfs;->zze()Lcom/google/android/gms/internal/measurement/zzfr;

    move-result-object v7

    invoke-virtual {v7, v5}, Lcom/google/android/gms/internal/measurement/zzfr;->zzj(Ljava/lang/String;)Lcom/google/android/gms/internal/measurement/zzfr;

    iget-object v8, v14, Lcom/google/android/gms/measurement/internal/zzao;->zzf:Lcom/google/android/gms/measurement/internal/zzar;

    .line 164
    invoke-virtual {v8, v5}, Lcom/google/android/gms/measurement/internal/zzar;->zzf(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v5

    if-eqz v5, :cond_1b

    iget-object v8, v2, Lcom/google/android/gms/measurement/internal/zzkc;->zzf:Lcom/google/android/gms/measurement/internal/zzkn;

    .line 165
    invoke-virtual {v8}, Lcom/google/android/gms/measurement/internal/zzkn;->zzu()Lcom/google/android/gms/measurement/internal/zzkp;

    move-result-object v8

    .line 166
    invoke-virtual {v8, v7, v5}, Lcom/google/android/gms/measurement/internal/zzkp;->zzu(Lcom/google/android/gms/internal/measurement/zzfr;Ljava/lang/Object;)V

    .line 167
    invoke-virtual {v4, v7}, Lcom/google/android/gms/internal/measurement/zzfn;->zze(Lcom/google/android/gms/internal/measurement/zzfr;)Lcom/google/android/gms/internal/measurement/zzfn;

    goto :goto_8

    :cond_1c
    move-object/from16 v5, v28

    .line 168
    invoke-virtual {v5, v4}, Lcom/google/android/gms/internal/measurement/zzfx;->zzj(Lcom/google/android/gms/internal/measurement/zzfn;)Lcom/google/android/gms/internal/measurement/zzfx;

    .line 169
    invoke-static {}, Lcom/google/android/gms/internal/measurement/zzgb;->zza()Lcom/google/android/gms/internal/measurement/zzfz;

    move-result-object v6

    .line 170
    invoke-static {}, Lcom/google/android/gms/internal/measurement/zzfq;->zza()Lcom/google/android/gms/internal/measurement/zzfp;

    move-result-object v7

    iget-wide v8, v0, Lcom/google/android/gms/measurement/internal/zzap;->zzc:J

    .line 171
    invoke-virtual {v7, v8, v9}, Lcom/google/android/gms/internal/measurement/zzfp;->zza(J)Lcom/google/android/gms/internal/measurement/zzfp;

    iget-object v0, v3, Lcom/google/android/gms/measurement/internal/zzat;->zza:Ljava/lang/String;

    .line 172
    invoke-virtual {v7, v0}, Lcom/google/android/gms/internal/measurement/zzfp;->zzb(Ljava/lang/String;)Lcom/google/android/gms/internal/measurement/zzfp;

    .line 173
    invoke-virtual {v6, v7}, Lcom/google/android/gms/internal/measurement/zzfz;->zza(Lcom/google/android/gms/internal/measurement/zzfp;)Lcom/google/android/gms/internal/measurement/zzfz;

    .line 174
    invoke-virtual {v5, v6}, Lcom/google/android/gms/internal/measurement/zzfx;->zzX(Lcom/google/android/gms/internal/measurement/zzfz;)Lcom/google/android/gms/internal/measurement/zzfx;

    iget-object v0, v2, Lcom/google/android/gms/measurement/internal/zzkc;->zzf:Lcom/google/android/gms/measurement/internal/zzkn;

    .line 175
    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzf()Lcom/google/android/gms/measurement/internal/zzz;

    move-result-object v6

    .line 176
    invoke-virtual/range {v23 .. v23}, Lcom/google/android/gms/measurement/internal/zzg;->zzt()Ljava/lang/String;

    move-result-object v7

    .line 177
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v8

    .line 178
    invoke-virtual {v5}, Lcom/google/android/gms/internal/measurement/zzfx;->zzap()Ljava/util/List;

    move-result-object v9

    .line 179
    invoke-virtual {v4}, Lcom/google/android/gms/internal/measurement/zzfn;->zzc()J

    move-result-wide v10

    invoke-static {v10, v11}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v10

    .line 180
    invoke-virtual {v4}, Lcom/google/android/gms/internal/measurement/zzfn;->zzc()J

    move-result-wide v11

    invoke-static {v11, v12}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v11

    .line 181
    invoke-virtual/range {v6 .. v11}, Lcom/google/android/gms/measurement/internal/zzz;->zza(Ljava/lang/String;Ljava/util/List;Ljava/util/List;Ljava/lang/Long;Ljava/lang/Long;)Ljava/util/List;

    move-result-object v0

    .line 182
    invoke-virtual {v5, v0}, Lcom/google/android/gms/internal/measurement/zzfx;->zzf(Ljava/lang/Iterable;)Lcom/google/android/gms/internal/measurement/zzfx;

    .line 183
    invoke-virtual {v4}, Lcom/google/android/gms/internal/measurement/zzfn;->zzq()Z

    move-result v0

    if-eqz v0, :cond_1d

    .line 184
    invoke-virtual {v4}, Lcom/google/android/gms/internal/measurement/zzfn;->zzc()J

    move-result-wide v6

    invoke-virtual {v5, v6, v7}, Lcom/google/android/gms/internal/measurement/zzfx;->zzae(J)Lcom/google/android/gms/internal/measurement/zzfx;

    .line 185
    invoke-virtual {v4}, Lcom/google/android/gms/internal/measurement/zzfn;->zzc()J

    move-result-wide v3

    invoke-virtual {v5, v3, v4}, Lcom/google/android/gms/internal/measurement/zzfx;->zzN(J)Lcom/google/android/gms/internal/measurement/zzfx;

    .line 186
    :cond_1d
    invoke-virtual/range {v23 .. v23}, Lcom/google/android/gms/measurement/internal/zzg;->zzn()J

    move-result-wide v3

    cmp-long v0, v3, v24

    if-eqz v0, :cond_1e

    .line 187
    invoke-virtual {v5, v3, v4}, Lcom/google/android/gms/internal/measurement/zzfx;->zzY(J)Lcom/google/android/gms/internal/measurement/zzfx;

    .line 188
    :cond_1e
    invoke-virtual/range {v23 .. v23}, Lcom/google/android/gms/measurement/internal/zzg;->zzp()J

    move-result-wide v6

    cmp-long v8, v6, v24

    if-eqz v8, :cond_1f

    .line 189
    invoke-virtual {v5, v6, v7}, Lcom/google/android/gms/internal/measurement/zzfx;->zzZ(J)Lcom/google/android/gms/internal/measurement/zzfx;

    goto :goto_9

    :cond_1f
    if-eqz v0, :cond_20

    .line 190
    invoke-virtual {v5, v3, v4}, Lcom/google/android/gms/internal/measurement/zzfx;->zzZ(J)Lcom/google/android/gms/internal/measurement/zzfx;

    .line 191
    :cond_20
    :goto_9
    invoke-virtual/range {v23 .. v23}, Lcom/google/android/gms/measurement/internal/zzg;->zzE()V

    .line 192
    invoke-virtual/range {v23 .. v23}, Lcom/google/android/gms/measurement/internal/zzg;->zzo()J

    move-result-wide v3

    long-to-int v0, v3

    invoke-virtual {v5, v0}, Lcom/google/android/gms/internal/measurement/zzfx;->zzF(I)Lcom/google/android/gms/internal/measurement/zzfx;

    iget-object v0, v2, Lcom/google/android/gms/measurement/internal/zzgl;->zzs:Lcom/google/android/gms/measurement/internal/zzfs;

    .line 193
    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzfs;->zzf()Lcom/google/android/gms/measurement/internal/zzaf;

    move-result-object v0

    .line 194
    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzaf;->zzh()J

    const-wide/32 v3, 0xa471

    invoke-virtual {v5, v3, v4}, Lcom/google/android/gms/internal/measurement/zzfx;->zzah(J)Lcom/google/android/gms/internal/measurement/zzfx;

    iget-object v0, v2, Lcom/google/android/gms/measurement/internal/zzgl;->zzs:Lcom/google/android/gms/measurement/internal/zzfs;

    .line 195
    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzfs;->zzav()Lcom/google/android/gms/common/util/Clock;

    move-result-object v0

    .line 196
    invoke-interface {v0}, Lcom/google/android/gms/common/util/Clock;->currentTimeMillis()J

    move-result-wide v3

    invoke-virtual {v5, v3, v4}, Lcom/google/android/gms/internal/measurement/zzfx;->zzag(J)Lcom/google/android/gms/internal/measurement/zzfx;

    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    const/4 v0, 0x1

    .line 197
    invoke-virtual {v5, v0}, Lcom/google/android/gms/internal/measurement/zzfx;->zzad(Z)Lcom/google/android/gms/internal/measurement/zzfx;

    move-object/from16 v0, v29

    .line 198
    invoke-virtual {v0, v5}, Lcom/google/android/gms/internal/measurement/zzfv;->zza(Lcom/google/android/gms/internal/measurement/zzfx;)Lcom/google/android/gms/internal/measurement/zzfv;

    .line 199
    invoke-virtual {v5}, Lcom/google/android/gms/internal/measurement/zzfx;->zzd()J

    move-result-wide v3

    move-object/from16 v6, v23

    invoke-virtual {v6, v3, v4}, Lcom/google/android/gms/measurement/internal/zzg;->zzad(J)V

    .line 200
    invoke-virtual {v5}, Lcom/google/android/gms/internal/measurement/zzfx;->zzc()J

    move-result-wide v3

    invoke-virtual {v6, v3, v4}, Lcom/google/android/gms/measurement/internal/zzg;->zzab(J)V

    iget-object v3, v2, Lcom/google/android/gms/measurement/internal/zzkc;->zzf:Lcom/google/android/gms/measurement/internal/zzkn;

    .line 201
    invoke-virtual {v3}, Lcom/google/android/gms/measurement/internal/zzkn;->zzi()Lcom/google/android/gms/measurement/internal/zzaj;

    move-result-object v3

    .line 202
    invoke-virtual {v3, v6}, Lcom/google/android/gms/measurement/internal/zzaj;->zzD(Lcom/google/android/gms/measurement/internal/zzg;)V

    iget-object v3, v2, Lcom/google/android/gms/measurement/internal/zzkc;->zzf:Lcom/google/android/gms/measurement/internal/zzkn;

    .line 203
    invoke-virtual {v3}, Lcom/google/android/gms/measurement/internal/zzkn;->zzi()Lcom/google/android/gms/measurement/internal/zzaj;

    move-result-object v3

    .line 204
    invoke-virtual {v3}, Lcom/google/android/gms/measurement/internal/zzaj;->zzC()V
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_0

    iget-object v3, v2, Lcom/google/android/gms/measurement/internal/zzkc;->zzf:Lcom/google/android/gms/measurement/internal/zzkn;

    .line 20
    invoke-virtual {v3}, Lcom/google/android/gms/measurement/internal/zzkn;->zzi()Lcom/google/android/gms/measurement/internal/zzaj;

    move-result-object v3

    .line 21
    invoke-virtual {v3}, Lcom/google/android/gms/measurement/internal/zzaj;->zzx()V

    :try_start_8
    iget-object v3, v2, Lcom/google/android/gms/measurement/internal/zzkc;->zzf:Lcom/google/android/gms/measurement/internal/zzkn;

    .line 205
    invoke-virtual {v3}, Lcom/google/android/gms/measurement/internal/zzkn;->zzu()Lcom/google/android/gms/measurement/internal/zzkp;

    move-result-object v3

    .line 206
    invoke-virtual {v0}, Lcom/google/android/gms/internal/measurement/zzjv;->zzaA()Lcom/google/android/gms/internal/measurement/zzjz;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/measurement/zzfw;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/measurement/zzih;->zzbs()[B

    move-result-object v0

    invoke-virtual {v3, v0}, Lcom/google/android/gms/measurement/internal/zzkp;->zzz([B)[B

    move-result-object v14
    :try_end_8
    .catch Ljava/io/IOException; {:try_start_8 .. :try_end_8} :catch_1

    goto :goto_a

    :catch_1
    move-exception v0

    .line 21
    iget-object v2, v2, Lcom/google/android/gms/measurement/internal/zzgl;->zzs:Lcom/google/android/gms/measurement/internal/zzfs;

    .line 207
    invoke-virtual {v2}, Lcom/google/android/gms/measurement/internal/zzfs;->zzay()Lcom/google/android/gms/measurement/internal/zzei;

    move-result-object v2

    .line 208
    invoke-virtual {v2}, Lcom/google/android/gms/measurement/internal/zzei;->zzd()Lcom/google/android/gms/measurement/internal/zzeg;

    move-result-object v2

    invoke-static/range {v27 .. v27}, Lcom/google/android/gms/measurement/internal/zzei;->zzn(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    const-string v4, "Data loss. Failed to bundle and serialize. appId"

    .line 209
    invoke-virtual {v2, v4, v3, v0}, Lcom/google/android/gms/measurement/internal/zzeg;->zzc(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    move-object/from16 v14, v26

    goto :goto_a

    :catch_2
    move-exception v0

    .line 21
    :try_start_9
    iget-object v3, v2, Lcom/google/android/gms/measurement/internal/zzgl;->zzs:Lcom/google/android/gms/measurement/internal/zzfs;

    .line 82
    invoke-virtual {v3}, Lcom/google/android/gms/measurement/internal/zzfs;->zzay()Lcom/google/android/gms/measurement/internal/zzei;

    move-result-object v3

    .line 83
    invoke-virtual {v3}, Lcom/google/android/gms/measurement/internal/zzei;->zzc()Lcom/google/android/gms/measurement/internal/zzeg;

    move-result-object v3

    const-string v4, "app instance id encryption failed"

    invoke-virtual {v0}, Ljava/lang/SecurityException;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v3, v4, v0}, Lcom/google/android/gms/measurement/internal/zzeg;->zzb(Ljava/lang/String;Ljava/lang/Object;)V

    const/4 v3, 0x0

    new-array v14, v3, [B
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_0

    iget-object v0, v2, Lcom/google/android/gms/measurement/internal/zzkc;->zzf:Lcom/google/android/gms/measurement/internal/zzkn;

    goto/16 :goto_0

    :goto_a
    return-object v14

    :catchall_0
    move-exception v0

    .line 43
    iget-object v2, v2, Lcom/google/android/gms/measurement/internal/zzkc;->zzf:Lcom/google/android/gms/measurement/internal/zzkn;

    .line 20
    invoke-virtual {v2}, Lcom/google/android/gms/measurement/internal/zzkn;->zzi()Lcom/google/android/gms/measurement/internal/zzaj;

    move-result-object v2

    .line 21
    invoke-virtual {v2}, Lcom/google/android/gms/measurement/internal/zzaj;->zzx()V

    .line 210
    throw v0
.end method
