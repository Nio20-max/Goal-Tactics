.class public final Lcom/google/android/gms/measurement/internal/zzkn;
.super Ljava/lang/Object;
.source "com.google.android.gms:play-services-measurement@@19.0.1"

# interfaces
.implements Lcom/google/android/gms/measurement/internal/zzgn;


# static fields
.field private static volatile zzb:Lcom/google/android/gms/measurement/internal/zzkn;


# instance fields
.field private zzA:J

.field private final zzB:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lcom/google/android/gms/measurement/internal/zzag;",
            ">;"
        }
    .end annotation
.end field

.field private final zzC:Lcom/google/android/gms/measurement/internal/zzkt;

.field zza:J

.field private final zzc:Lcom/google/android/gms/measurement/internal/zzfj;

.field private final zzd:Lcom/google/android/gms/measurement/internal/zzeo;

.field private zze:Lcom/google/android/gms/measurement/internal/zzaj;

.field private zzf:Lcom/google/android/gms/measurement/internal/zzeq;

.field private zzg:Lcom/google/android/gms/measurement/internal/zzkb;

.field private zzh:Lcom/google/android/gms/measurement/internal/zzz;

.field private final zzi:Lcom/google/android/gms/measurement/internal/zzkp;

.field private zzj:Lcom/google/android/gms/measurement/internal/zzia;

.field private zzk:Lcom/google/android/gms/measurement/internal/zzjk;

.field private final zzl:Lcom/google/android/gms/measurement/internal/zzke;

.field private zzm:Lcom/google/android/gms/measurement/internal/zzfa;

.field private final zzn:Lcom/google/android/gms/measurement/internal/zzfs;

.field private zzo:Z

.field private zzp:Z

.field private zzq:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/Runnable;",
            ">;"
        }
    .end annotation
.end field

.field private zzr:I

.field private zzs:I

.field private zzt:Z

.field private zzu:Z

.field private zzv:Z

.field private zzw:Ljava/nio/channels/FileLock;

.field private zzx:Ljava/nio/channels/FileChannel;

.field private zzy:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation
.end field

.field private zzz:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Lcom/google/android/gms/measurement/internal/zzko;Lcom/google/android/gms/measurement/internal/zzfs;)V
    .locals 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 p2, 0x0

    iput-boolean p2, p0, Lcom/google/android/gms/measurement/internal/zzkn;->zzo:Z

    new-instance p2, Lcom/google/android/gms/measurement/internal/zzkk;

    .line 1
    invoke-direct {p2, p0}, Lcom/google/android/gms/measurement/internal/zzkk;-><init>(Lcom/google/android/gms/measurement/internal/zzkn;)V

    iput-object p2, p0, Lcom/google/android/gms/measurement/internal/zzkn;->zzC:Lcom/google/android/gms/measurement/internal/zzkt;

    .line 2
    invoke-static {p1}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    iget-object p2, p1, Lcom/google/android/gms/measurement/internal/zzko;->zza:Landroid/content/Context;

    const/4 v0, 0x0

    .line 3
    invoke-static {p2, v0, v0}, Lcom/google/android/gms/measurement/internal/zzfs;->zzp(Landroid/content/Context;Lcom/google/android/gms/internal/measurement/zzcl;Ljava/lang/Long;)Lcom/google/android/gms/measurement/internal/zzfs;

    move-result-object p2

    iput-object p2, p0, Lcom/google/android/gms/measurement/internal/zzkn;->zzn:Lcom/google/android/gms/measurement/internal/zzfs;

    const-wide/16 v0, -0x1

    iput-wide v0, p0, Lcom/google/android/gms/measurement/internal/zzkn;->zzA:J

    new-instance p2, Lcom/google/android/gms/measurement/internal/zzke;

    .line 4
    invoke-direct {p2, p0}, Lcom/google/android/gms/measurement/internal/zzke;-><init>(Lcom/google/android/gms/measurement/internal/zzkn;)V

    iput-object p2, p0, Lcom/google/android/gms/measurement/internal/zzkn;->zzl:Lcom/google/android/gms/measurement/internal/zzke;

    new-instance p2, Lcom/google/android/gms/measurement/internal/zzkp;

    .line 5
    invoke-direct {p2, p0}, Lcom/google/android/gms/measurement/internal/zzkp;-><init>(Lcom/google/android/gms/measurement/internal/zzkn;)V

    .line 6
    invoke-virtual {p2}, Lcom/google/android/gms/measurement/internal/zzkd;->zzZ()V

    iput-object p2, p0, Lcom/google/android/gms/measurement/internal/zzkn;->zzi:Lcom/google/android/gms/measurement/internal/zzkp;

    new-instance p2, Lcom/google/android/gms/measurement/internal/zzeo;

    .line 7
    invoke-direct {p2, p0}, Lcom/google/android/gms/measurement/internal/zzeo;-><init>(Lcom/google/android/gms/measurement/internal/zzkn;)V

    .line 8
    invoke-virtual {p2}, Lcom/google/android/gms/measurement/internal/zzkd;->zzZ()V

    iput-object p2, p0, Lcom/google/android/gms/measurement/internal/zzkn;->zzd:Lcom/google/android/gms/measurement/internal/zzeo;

    new-instance p2, Lcom/google/android/gms/measurement/internal/zzfj;

    .line 9
    invoke-direct {p2, p0}, Lcom/google/android/gms/measurement/internal/zzfj;-><init>(Lcom/google/android/gms/measurement/internal/zzkn;)V

    .line 10
    invoke-virtual {p2}, Lcom/google/android/gms/measurement/internal/zzkd;->zzZ()V

    iput-object p2, p0, Lcom/google/android/gms/measurement/internal/zzkn;->zzc:Lcom/google/android/gms/measurement/internal/zzfj;

    new-instance p2, Ljava/util/HashMap;

    .line 11
    invoke-direct {p2}, Ljava/util/HashMap;-><init>()V

    iput-object p2, p0, Lcom/google/android/gms/measurement/internal/zzkn;->zzB:Ljava/util/Map;

    .line 12
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzaz()Lcom/google/android/gms/measurement/internal/zzfp;

    move-result-object p2

    new-instance v0, Lcom/google/android/gms/measurement/internal/zzkf;

    invoke-direct {v0, p0, p1}, Lcom/google/android/gms/measurement/internal/zzkf;-><init>(Lcom/google/android/gms/measurement/internal/zzkn;Lcom/google/android/gms/measurement/internal/zzko;)V

    .line 13
    invoke-virtual {p2, v0}, Lcom/google/android/gms/measurement/internal/zzfp;->zzp(Ljava/lang/Runnable;)V

    return-void
.end method

.method static final zzY(Lcom/google/android/gms/internal/measurement/zzfn;ILjava/lang/String;)V
    .locals 4

    .line 1
    invoke-virtual {p0}, Lcom/google/android/gms/internal/measurement/zzfn;->zzp()Ljava/util/List;

    move-result-object v0

    const/4 v1, 0x0

    .line 2
    :goto_0
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v2

    const-string v3, "_err"

    if-ge v1, v2, :cond_1

    .line 3
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/google/android/gms/internal/measurement/zzfs;

    invoke-virtual {v2}, Lcom/google/android/gms/internal/measurement/zzfs;->zzg()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v3, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    return-void

    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 4
    :cond_1
    invoke-static {}, Lcom/google/android/gms/internal/measurement/zzfs;->zze()Lcom/google/android/gms/internal/measurement/zzfr;

    move-result-object v0

    .line 5
    invoke-virtual {v0, v3}, Lcom/google/android/gms/internal/measurement/zzfr;->zzj(Ljava/lang/String;)Lcom/google/android/gms/internal/measurement/zzfr;

    int-to-long v1, p1

    .line 6
    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Lcom/google/android/gms/internal/measurement/zzfr;->zzi(J)Lcom/google/android/gms/internal/measurement/zzfr;

    .line 7
    invoke-virtual {v0}, Lcom/google/android/gms/internal/measurement/zzjv;->zzaA()Lcom/google/android/gms/internal/measurement/zzjz;

    move-result-object p1

    check-cast p1, Lcom/google/android/gms/internal/measurement/zzfs;

    .line 8
    invoke-static {}, Lcom/google/android/gms/internal/measurement/zzfs;->zze()Lcom/google/android/gms/internal/measurement/zzfr;

    move-result-object v0

    const-string v1, "_ev"

    .line 9
    invoke-virtual {v0, v1}, Lcom/google/android/gms/internal/measurement/zzfr;->zzj(Ljava/lang/String;)Lcom/google/android/gms/internal/measurement/zzfr;

    .line 10
    invoke-virtual {v0, p2}, Lcom/google/android/gms/internal/measurement/zzfr;->zzk(Ljava/lang/String;)Lcom/google/android/gms/internal/measurement/zzfr;

    .line 11
    invoke-virtual {v0}, Lcom/google/android/gms/internal/measurement/zzjv;->zzaA()Lcom/google/android/gms/internal/measurement/zzjz;

    move-result-object p2

    check-cast p2, Lcom/google/android/gms/internal/measurement/zzfs;

    .line 12
    invoke-virtual {p0, p1}, Lcom/google/android/gms/internal/measurement/zzfn;->zzf(Lcom/google/android/gms/internal/measurement/zzfs;)Lcom/google/android/gms/internal/measurement/zzfn;

    invoke-virtual {p0, p2}, Lcom/google/android/gms/internal/measurement/zzfn;->zzf(Lcom/google/android/gms/internal/measurement/zzfs;)Lcom/google/android/gms/internal/measurement/zzfn;

    return-void
.end method

.method static final zzZ(Lcom/google/android/gms/internal/measurement/zzfn;Ljava/lang/String;)V
    .locals 3

    .line 1
    invoke-virtual {p0}, Lcom/google/android/gms/internal/measurement/zzfn;->zzp()Ljava/util/List;

    move-result-object v0

    const/4 v1, 0x0

    .line 2
    :goto_0
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v2

    if-ge v1, v2, :cond_1

    .line 3
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/google/android/gms/internal/measurement/zzfs;

    invoke-virtual {v2}, Lcom/google/android/gms/internal/measurement/zzfs;->zzg()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 4
    invoke-virtual {p0, v1}, Lcom/google/android/gms/internal/measurement/zzfn;->zzh(I)Lcom/google/android/gms/internal/measurement/zzfn;

    return-void

    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_1
    return-void
.end method

.method private final zzaa(Ljava/lang/String;)Lcom/google/android/gms/measurement/internal/zzp;
    .locals 33

    move-object/from16 v0, p0

    move-object/from16 v2, p1

    iget-object v1, v0, Lcom/google/android/gms/measurement/internal/zzkn;->zze:Lcom/google/android/gms/measurement/internal/zzaj;

    .line 1
    invoke-static {v1}, Lcom/google/android/gms/measurement/internal/zzkn;->zzak(Lcom/google/android/gms/measurement/internal/zzkd;)Lcom/google/android/gms/measurement/internal/zzkd;

    .line 2
    invoke-virtual {v1, v2}, Lcom/google/android/gms/measurement/internal/zzaj;->zzj(Ljava/lang/String;)Lcom/google/android/gms/measurement/internal/zzg;

    move-result-object v1

    const/4 v3, 0x0

    if-eqz v1, :cond_4

    .line 3
    invoke-virtual {v1}, Lcom/google/android/gms/measurement/internal/zzg;->zzw()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-eqz v4, :cond_0

    goto/16 :goto_2

    .line 5
    :cond_0
    invoke-direct {v0, v1}, Lcom/google/android/gms/measurement/internal/zzkn;->zzab(Lcom/google/android/gms/measurement/internal/zzg;)Ljava/lang/Boolean;

    move-result-object v4

    if-eqz v4, :cond_2

    .line 6
    invoke-virtual {v4}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v4

    if-eqz v4, :cond_1

    goto :goto_0

    .line 25
    :cond_1
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzay()Lcom/google/android/gms/measurement/internal/zzei;

    move-result-object v1

    .line 26
    invoke-virtual {v1}, Lcom/google/android/gms/measurement/internal/zzei;->zzd()Lcom/google/android/gms/measurement/internal/zzeg;

    move-result-object v1

    invoke-static/range {p1 .. p1}, Lcom/google/android/gms/measurement/internal/zzei;->zzn(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    const-string v4, "App version does not match; dropping. appId"

    .line 27
    invoke-virtual {v1, v4, v2}, Lcom/google/android/gms/measurement/internal/zzeg;->zzb(Ljava/lang/String;Ljava/lang/Object;)V

    return-object v3

    .line 7
    :cond_2
    :goto_0
    new-instance v30, Lcom/google/android/gms/measurement/internal/zzp;

    .line 8
    invoke-virtual {v1}, Lcom/google/android/gms/measurement/internal/zzg;->zzz()Ljava/lang/String;

    move-result-object v4

    .line 9
    invoke-virtual {v1}, Lcom/google/android/gms/measurement/internal/zzg;->zzw()Ljava/lang/String;

    move-result-object v5

    .line 10
    invoke-virtual {v1}, Lcom/google/android/gms/measurement/internal/zzg;->zzb()J

    move-result-wide v6

    .line 11
    invoke-virtual {v1}, Lcom/google/android/gms/measurement/internal/zzg;->zzv()Ljava/lang/String;

    move-result-object v8

    .line 12
    invoke-virtual {v1}, Lcom/google/android/gms/measurement/internal/zzg;->zzm()J

    move-result-wide v9

    .line 13
    invoke-virtual {v1}, Lcom/google/android/gms/measurement/internal/zzg;->zzj()J

    move-result-wide v15

    .line 14
    invoke-virtual {v1}, Lcom/google/android/gms/measurement/internal/zzg;->zzaj()Z

    move-result v13

    .line 15
    invoke-virtual {v1}, Lcom/google/android/gms/measurement/internal/zzg;->zzx()Ljava/lang/String;

    move-result-object v17

    .line 16
    invoke-virtual {v1}, Lcom/google/android/gms/measurement/internal/zzg;->zza()J

    move-result-wide v23

    .line 17
    invoke-virtual {v1}, Lcom/google/android/gms/measurement/internal/zzg;->zzai()Z

    move-result v21

    .line 18
    invoke-virtual {v1}, Lcom/google/android/gms/measurement/internal/zzg;->zzr()Ljava/lang/String;

    move-result-object v25

    .line 19
    invoke-virtual {v1}, Lcom/google/android/gms/measurement/internal/zzg;->zzq()Ljava/lang/Boolean;

    move-result-object v26

    .line 20
    invoke-virtual {v1}, Lcom/google/android/gms/measurement/internal/zzg;->zzk()J

    move-result-wide v27

    .line 21
    invoke-virtual {v1}, Lcom/google/android/gms/measurement/internal/zzg;->zzC()Ljava/util/List;

    move-result-object v31

    .line 22
    invoke-static {}, Lcom/google/android/gms/internal/measurement/zzoq;->zzc()Z

    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzg()Lcom/google/android/gms/measurement/internal/zzaf;

    move-result-object v11

    sget-object v12, Lcom/google/android/gms/measurement/internal/zzdw;->zzad:Lcom/google/android/gms/measurement/internal/zzdv;

    invoke-virtual {v11, v2, v12}, Lcom/google/android/gms/measurement/internal/zzaf;->zzs(Ljava/lang/String;Lcom/google/android/gms/measurement/internal/zzdv;)Z

    move-result v11

    if-eqz v11, :cond_3

    .line 23
    invoke-virtual {v1}, Lcom/google/android/gms/measurement/internal/zzg;->zzy()Ljava/lang/String;

    move-result-object v1

    move-object/from16 v32, v1

    goto :goto_1

    :cond_3
    move-object/from16 v32, v3

    :goto_1
    const/4 v12, 0x0

    const/4 v14, 0x0

    const-wide/16 v18, 0x0

    const/16 v20, 0x0

    const/16 v22, 0x0

    .line 24
    invoke-virtual/range {p0 .. p1}, Lcom/google/android/gms/measurement/internal/zzkn;->zzh(Ljava/lang/String;)Lcom/google/android/gms/measurement/internal/zzag;

    move-result-object v1

    invoke-virtual {v1}, Lcom/google/android/gms/measurement/internal/zzag;->zzi()Ljava/lang/String;

    move-result-object v29

    move-object/from16 v1, v30

    move-object/from16 v2, p1

    move-object v3, v4

    move-object v4, v5

    move-wide v5, v6

    move-object v7, v8

    move-wide v8, v9

    move-wide v10, v15

    move-object/from16 v15, v17

    move-wide/from16 v16, v23

    move-object/from16 v23, v25

    move-object/from16 v24, v26

    move-wide/from16 v25, v27

    move-object/from16 v27, v31

    move-object/from16 v28, v32

    invoke-direct/range {v1 .. v29}, Lcom/google/android/gms/measurement/internal/zzp;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;JLjava/lang/String;JJLjava/lang/String;ZZLjava/lang/String;JJIZZLjava/lang/String;Ljava/lang/Boolean;JLjava/util/List;Ljava/lang/String;Ljava/lang/String;)V

    return-object v30

    .line 4
    :cond_4
    :goto_2
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzay()Lcom/google/android/gms/measurement/internal/zzei;

    move-result-object v1

    invoke-virtual {v1}, Lcom/google/android/gms/measurement/internal/zzei;->zzc()Lcom/google/android/gms/measurement/internal/zzeg;

    move-result-object v1

    const-string v4, "No app data available; dropping"

    invoke-virtual {v1, v4, v2}, Lcom/google/android/gms/measurement/internal/zzeg;->zzb(Ljava/lang/String;Ljava/lang/Object;)V

    return-object v3
.end method

.method private final zzab(Lcom/google/android/gms/measurement/internal/zzg;)Ljava/lang/Boolean;
    .locals 8

    .line 1
    :try_start_0
    invoke-virtual {p1}, Lcom/google/android/gms/measurement/internal/zzg;->zzb()J

    move-result-wide v0

    const-wide/32 v2, -0x80000000

    const/4 v4, 0x1

    const/4 v5, 0x0

    cmp-long v6, v0, v2

    if-eqz v6, :cond_0

    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzkn;->zzn:Lcom/google/android/gms/measurement/internal/zzfs;

    .line 7
    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzfs;->zzau()Landroid/content/Context;

    move-result-object v0

    .line 8
    invoke-static {v0}, Lcom/google/android/gms/common/wrappers/Wrappers;->packageManager(Landroid/content/Context;)Lcom/google/android/gms/common/wrappers/PackageManagerWrapper;

    move-result-object v0

    invoke-virtual {p1}, Lcom/google/android/gms/measurement/internal/zzg;->zzt()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1, v5}, Lcom/google/android/gms/common/wrappers/PackageManagerWrapper;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object v0

    iget v0, v0, Landroid/content/pm/PackageInfo;->versionCode:I

    .line 9
    invoke-virtual {p1}, Lcom/google/android/gms/measurement/internal/zzg;->zzb()J

    move-result-wide v1

    int-to-long v6, v0

    cmp-long p1, v1, v6

    if-nez p1, :cond_1

    .line 11
    invoke-static {v4}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1

    return-object p1

    .line 10
    :cond_0
    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzkn;->zzn:Lcom/google/android/gms/measurement/internal/zzfs;

    .line 2
    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzfs;->zzau()Landroid/content/Context;

    move-result-object v0

    .line 3
    invoke-static {v0}, Lcom/google/android/gms/common/wrappers/Wrappers;->packageManager(Landroid/content/Context;)Lcom/google/android/gms/common/wrappers/PackageManagerWrapper;

    move-result-object v0

    invoke-virtual {p1}, Lcom/google/android/gms/measurement/internal/zzg;->zzt()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1, v5}, Lcom/google/android/gms/common/wrappers/PackageManagerWrapper;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object v0

    iget-object v0, v0, Landroid/content/pm/PackageInfo;->versionName:Ljava/lang/String;

    .line 4
    invoke-virtual {p1}, Lcom/google/android/gms/measurement/internal/zzg;->zzw()Ljava/lang/String;

    move-result-object p1

    if-eqz p1, :cond_1

    .line 5
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_1

    .line 6
    invoke-static {v4}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p1

    .line 10
    :cond_1
    invoke-static {v5}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1

    return-object p1

    :catch_0
    const/4 p1, 0x0

    return-object p1
.end method

.method private final zzac()V
    .locals 5

    .line 1
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzaz()Lcom/google/android/gms/measurement/internal/zzfp;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzgl;->zzg()V

    iget-boolean v0, p0, Lcom/google/android/gms/measurement/internal/zzkn;->zzt:Z

    if-nez v0, :cond_3

    iget-boolean v0, p0, Lcom/google/android/gms/measurement/internal/zzkn;->zzu:Z

    if-nez v0, :cond_3

    iget-boolean v0, p0, Lcom/google/android/gms/measurement/internal/zzkn;->zzv:Z

    if-eqz v0, :cond_0

    goto :goto_1

    .line 8
    :cond_0
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzay()Lcom/google/android/gms/measurement/internal/zzei;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzei;->zzj()Lcom/google/android/gms/measurement/internal/zzeg;

    move-result-object v0

    const-string v1, "Stopping uploading service(s)"

    invoke-virtual {v0, v1}, Lcom/google/android/gms/measurement/internal/zzeg;->zza(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzkn;->zzq:Ljava/util/List;

    if-nez v0, :cond_1

    return-void

    .line 9
    :cond_1
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_2

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Runnable;

    .line 10
    invoke-interface {v1}, Ljava/lang/Runnable;->run()V

    goto :goto_0

    :cond_2
    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzkn;->zzq:Ljava/util/List;

    .line 11
    invoke-static {v0}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    return-void

    .line 2
    :cond_3
    :goto_1
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzay()Lcom/google/android/gms/measurement/internal/zzei;

    move-result-object v0

    .line 3
    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzei;->zzj()Lcom/google/android/gms/measurement/internal/zzeg;

    move-result-object v0

    iget-boolean v1, p0, Lcom/google/android/gms/measurement/internal/zzkn;->zzt:Z

    .line 4
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    iget-boolean v2, p0, Lcom/google/android/gms/measurement/internal/zzkn;->zzu:Z

    .line 5
    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    iget-boolean v3, p0, Lcom/google/android/gms/measurement/internal/zzkn;->zzv:Z

    .line 6
    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v3

    const-string v4, "Not stopping services. fetch, network, upload"

    .line 7
    invoke-virtual {v0, v4, v1, v2, v3}, Lcom/google/android/gms/measurement/internal/zzeg;->zzd(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    return-void
.end method

.method private final zzad(Lcom/google/android/gms/internal/measurement/zzfx;JZ)V
    .locals 10

    const/4 v0, 0x1

    if-eq v0, p4, :cond_0

    const-string v1, "_lte"

    goto :goto_0

    :cond_0
    const-string v1, "_se"

    :goto_0
    iget-object v2, p0, Lcom/google/android/gms/measurement/internal/zzkn;->zze:Lcom/google/android/gms/measurement/internal/zzaj;

    .line 1
    invoke-static {v2}, Lcom/google/android/gms/measurement/internal/zzkn;->zzak(Lcom/google/android/gms/measurement/internal/zzkd;)Lcom/google/android/gms/measurement/internal/zzkd;

    .line 2
    invoke-virtual {p1}, Lcom/google/android/gms/internal/measurement/zzfx;->zzal()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3, v1}, Lcom/google/android/gms/measurement/internal/zzaj;->zzp(Ljava/lang/String;Ljava/lang/String;)Lcom/google/android/gms/measurement/internal/zzks;

    move-result-object v2

    if-eqz v2, :cond_2

    iget-object v3, v2, Lcom/google/android/gms/measurement/internal/zzks;->zze:Ljava/lang/Object;

    if-nez v3, :cond_1

    goto :goto_1

    .line 15
    :cond_1
    new-instance v9, Lcom/google/android/gms/measurement/internal/zzks;

    .line 6
    invoke-virtual {p1}, Lcom/google/android/gms/internal/measurement/zzfx;->zzal()Ljava/lang/String;

    move-result-object v3

    .line 7
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzav()Lcom/google/android/gms/common/util/Clock;

    move-result-object v4

    invoke-interface {v4}, Lcom/google/android/gms/common/util/Clock;->currentTimeMillis()J

    move-result-wide v6

    iget-object v2, v2, Lcom/google/android/gms/measurement/internal/zzks;->zze:Ljava/lang/Object;

    check-cast v2, Ljava/lang/Long;

    .line 8
    invoke-virtual {v2}, Ljava/lang/Long;->longValue()J

    move-result-wide v4

    add-long/2addr v4, p2

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v8

    const-string v4, "auto"

    move-object v2, v9

    move-object v5, v1

    invoke-direct/range {v2 .. v8}, Lcom/google/android/gms/measurement/internal/zzks;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;JLjava/lang/Object;)V

    goto :goto_2

    .line 2
    :cond_2
    :goto_1
    new-instance v9, Lcom/google/android/gms/measurement/internal/zzks;

    .line 3
    invoke-virtual {p1}, Lcom/google/android/gms/internal/measurement/zzfx;->zzal()Ljava/lang/String;

    move-result-object v3

    .line 4
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzav()Lcom/google/android/gms/common/util/Clock;

    move-result-object v2

    invoke-interface {v2}, Lcom/google/android/gms/common/util/Clock;->currentTimeMillis()J

    move-result-wide v6

    .line 5
    invoke-static {p2, p3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v8

    const-string v4, "auto"

    move-object v2, v9

    move-object v5, v1

    invoke-direct/range {v2 .. v8}, Lcom/google/android/gms/measurement/internal/zzks;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;JLjava/lang/Object;)V

    .line 9
    :goto_2
    invoke-static {}, Lcom/google/android/gms/internal/measurement/zzgh;->zzd()Lcom/google/android/gms/internal/measurement/zzgg;

    move-result-object v2

    .line 10
    invoke-virtual {v2, v1}, Lcom/google/android/gms/internal/measurement/zzgg;->zzf(Ljava/lang/String;)Lcom/google/android/gms/internal/measurement/zzgg;

    .line 11
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzav()Lcom/google/android/gms/common/util/Clock;

    move-result-object v3

    invoke-interface {v3}, Lcom/google/android/gms/common/util/Clock;->currentTimeMillis()J

    move-result-wide v3

    invoke-virtual {v2, v3, v4}, Lcom/google/android/gms/internal/measurement/zzgg;->zzg(J)Lcom/google/android/gms/internal/measurement/zzgg;

    iget-object v3, v9, Lcom/google/android/gms/measurement/internal/zzks;->zze:Ljava/lang/Object;

    check-cast v3, Ljava/lang/Long;

    .line 12
    invoke-virtual {v3}, Ljava/lang/Long;->longValue()J

    move-result-wide v3

    invoke-virtual {v2, v3, v4}, Lcom/google/android/gms/internal/measurement/zzgg;->zze(J)Lcom/google/android/gms/internal/measurement/zzgg;

    .line 13
    invoke-virtual {v2}, Lcom/google/android/gms/internal/measurement/zzjv;->zzaA()Lcom/google/android/gms/internal/measurement/zzjz;

    move-result-object v2

    check-cast v2, Lcom/google/android/gms/internal/measurement/zzgh;

    .line 14
    invoke-static {p1, v1}, Lcom/google/android/gms/measurement/internal/zzkp;->zza(Lcom/google/android/gms/internal/measurement/zzfx;Ljava/lang/String;)I

    move-result v1

    if-ltz v1, :cond_3

    .line 16
    invoke-virtual {p1, v1, v2}, Lcom/google/android/gms/internal/measurement/zzfx;->zzai(ILcom/google/android/gms/internal/measurement/zzgh;)Lcom/google/android/gms/internal/measurement/zzfx;

    goto :goto_3

    .line 15
    :cond_3
    invoke-virtual {p1, v2}, Lcom/google/android/gms/internal/measurement/zzfx;->zzl(Lcom/google/android/gms/internal/measurement/zzgh;)Lcom/google/android/gms/internal/measurement/zzfx;

    :goto_3
    const-wide/16 v1, 0x0

    cmp-long p1, p2, v1

    if-lez p1, :cond_5

    .line 16
    iget-object p1, p0, Lcom/google/android/gms/measurement/internal/zzkn;->zze:Lcom/google/android/gms/measurement/internal/zzaj;

    .line 17
    invoke-static {p1}, Lcom/google/android/gms/measurement/internal/zzkn;->zzak(Lcom/google/android/gms/measurement/internal/zzkd;)Lcom/google/android/gms/measurement/internal/zzkd;

    .line 18
    invoke-virtual {p1, v9}, Lcom/google/android/gms/measurement/internal/zzaj;->zzN(Lcom/google/android/gms/measurement/internal/zzks;)Z

    if-eq v0, p4, :cond_4

    const-string p1, "lifetime"

    goto :goto_4

    :cond_4
    const-string p1, "session-scoped"

    .line 19
    :goto_4
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzay()Lcom/google/android/gms/measurement/internal/zzei;

    move-result-object p2

    .line 20
    invoke-virtual {p2}, Lcom/google/android/gms/measurement/internal/zzei;->zzj()Lcom/google/android/gms/measurement/internal/zzeg;

    move-result-object p2

    iget-object p3, v9, Lcom/google/android/gms/measurement/internal/zzks;->zze:Ljava/lang/Object;

    const-string p4, "Updated engagement user property. scope, value"

    .line 21
    invoke-virtual {p2, p4, p1, p3}, Lcom/google/android/gms/measurement/internal/zzeg;->zzc(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    :cond_5
    return-void
.end method

.method private final zzae(Lcom/google/android/gms/internal/measurement/zzfn;Lcom/google/android/gms/internal/measurement/zzfn;)V
    .locals 9

    .line 1
    invoke-virtual {p1}, Lcom/google/android/gms/internal/measurement/zzfn;->zzo()Ljava/lang/String;

    move-result-object v0

    const-string v1, "_e"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    .line 2
    invoke-static {v0}, Lcom/google/android/gms/common/internal/Preconditions;->checkArgument(Z)V

    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzkn;->zzi:Lcom/google/android/gms/measurement/internal/zzkp;

    .line 3
    invoke-static {v0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzak(Lcom/google/android/gms/measurement/internal/zzkd;)Lcom/google/android/gms/measurement/internal/zzkd;

    .line 4
    invoke-virtual {p1}, Lcom/google/android/gms/internal/measurement/zzjv;->zzaA()Lcom/google/android/gms/internal/measurement/zzjz;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/measurement/zzfo;

    const-string v1, "_et"

    invoke-static {v0, v1}, Lcom/google/android/gms/measurement/internal/zzkp;->zzC(Lcom/google/android/gms/internal/measurement/zzfo;Ljava/lang/String;)Lcom/google/android/gms/internal/measurement/zzfs;

    move-result-object v0

    if-eqz v0, :cond_2

    invoke-virtual {v0}, Lcom/google/android/gms/internal/measurement/zzfs;->zzw()Z

    move-result v2

    if-eqz v2, :cond_2

    invoke-virtual {v0}, Lcom/google/android/gms/internal/measurement/zzfs;->zzd()J

    move-result-wide v2

    const-wide/16 v4, 0x0

    cmp-long v6, v2, v4

    if-gtz v6, :cond_0

    goto :goto_0

    :cond_0
    invoke-virtual {v0}, Lcom/google/android/gms/internal/measurement/zzfs;->zzd()J

    move-result-wide v2

    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzkn;->zzi:Lcom/google/android/gms/measurement/internal/zzkp;

    .line 5
    invoke-static {v0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzak(Lcom/google/android/gms/measurement/internal/zzkd;)Lcom/google/android/gms/measurement/internal/zzkd;

    .line 6
    invoke-virtual {p2}, Lcom/google/android/gms/internal/measurement/zzjv;->zzaA()Lcom/google/android/gms/internal/measurement/zzjz;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/measurement/zzfo;

    invoke-static {v0, v1}, Lcom/google/android/gms/measurement/internal/zzkp;->zzC(Lcom/google/android/gms/internal/measurement/zzfo;Ljava/lang/String;)Lcom/google/android/gms/internal/measurement/zzfs;

    move-result-object v0

    if-eqz v0, :cond_1

    invoke-virtual {v0}, Lcom/google/android/gms/internal/measurement/zzfs;->zzd()J

    move-result-wide v6

    cmp-long v8, v6, v4

    if-lez v8, :cond_1

    invoke-virtual {v0}, Lcom/google/android/gms/internal/measurement/zzfs;->zzd()J

    move-result-wide v4

    add-long/2addr v2, v4

    :cond_1
    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzkn;->zzi:Lcom/google/android/gms/measurement/internal/zzkp;

    .line 7
    invoke-static {v0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzak(Lcom/google/android/gms/measurement/internal/zzkd;)Lcom/google/android/gms/measurement/internal/zzkd;

    .line 8
    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    invoke-static {p2, v1, v0}, Lcom/google/android/gms/measurement/internal/zzkp;->zzA(Lcom/google/android/gms/internal/measurement/zzfn;Ljava/lang/String;Ljava/lang/Object;)V

    iget-object p2, p0, Lcom/google/android/gms/measurement/internal/zzkn;->zzi:Lcom/google/android/gms/measurement/internal/zzkp;

    .line 9
    invoke-static {p2}, Lcom/google/android/gms/measurement/internal/zzkn;->zzak(Lcom/google/android/gms/measurement/internal/zzkd;)Lcom/google/android/gms/measurement/internal/zzkd;

    const-wide/16 v0, 0x1

    .line 10
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p2

    const-string v0, "_fr"

    invoke-static {p1, v0, p2}, Lcom/google/android/gms/measurement/internal/zzkp;->zzA(Lcom/google/android/gms/internal/measurement/zzfn;Ljava/lang/String;Ljava/lang/Object;)V

    :cond_2
    :goto_0
    return-void
.end method

.method private final zzaf()V
    .locals 20

    move-object/from16 v0, p0

    .line 1
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzaz()Lcom/google/android/gms/measurement/internal/zzfp;

    move-result-object v1

    invoke-virtual {v1}, Lcom/google/android/gms/measurement/internal/zzgl;->zzg()V

    .line 2
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzB()V

    iget-wide v1, v0, Lcom/google/android/gms/measurement/internal/zzkn;->zza:J

    const-wide/16 v3, 0x0

    cmp-long v5, v1, v3

    if-lez v5, :cond_1

    const-wide/32 v1, 0x36ee80

    .line 3
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzav()Lcom/google/android/gms/common/util/Clock;

    move-result-object v5

    invoke-interface {v5}, Lcom/google/android/gms/common/util/Clock;->elapsedRealtime()J

    move-result-wide v5

    iget-wide v7, v0, Lcom/google/android/gms/measurement/internal/zzkn;->zza:J

    sub-long/2addr v5, v7

    .line 4
    invoke-static {v5, v6}, Ljava/lang/Math;->abs(J)J

    move-result-wide v5

    sub-long/2addr v1, v5

    cmp-long v5, v1, v3

    if-lez v5, :cond_0

    .line 5
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzay()Lcom/google/android/gms/measurement/internal/zzei;

    move-result-object v3

    .line 6
    invoke-virtual {v3}, Lcom/google/android/gms/measurement/internal/zzei;->zzj()Lcom/google/android/gms/measurement/internal/zzeg;

    move-result-object v3

    .line 7
    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    const-string v2, "Upload has been suspended. Will update scheduling later in approximately ms"

    .line 8
    invoke-virtual {v3, v2, v1}, Lcom/google/android/gms/measurement/internal/zzeg;->zzb(Ljava/lang/String;Ljava/lang/Object;)V

    .line 9
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzm()Lcom/google/android/gms/measurement/internal/zzeq;

    move-result-object v1

    invoke-virtual {v1}, Lcom/google/android/gms/measurement/internal/zzeq;->zzc()V

    iget-object v1, v0, Lcom/google/android/gms/measurement/internal/zzkn;->zzg:Lcom/google/android/gms/measurement/internal/zzkb;

    .line 10
    invoke-static {v1}, Lcom/google/android/gms/measurement/internal/zzkn;->zzak(Lcom/google/android/gms/measurement/internal/zzkd;)Lcom/google/android/gms/measurement/internal/zzkd;

    .line 11
    invoke-virtual {v1}, Lcom/google/android/gms/measurement/internal/zzkb;->zza()V

    return-void

    :cond_0
    iput-wide v3, v0, Lcom/google/android/gms/measurement/internal/zzkn;->zza:J

    :cond_1
    iget-object v1, v0, Lcom/google/android/gms/measurement/internal/zzkn;->zzn:Lcom/google/android/gms/measurement/internal/zzfs;

    .line 12
    invoke-virtual {v1}, Lcom/google/android/gms/measurement/internal/zzfs;->zzM()Z

    move-result v1

    if-eqz v1, :cond_10

    invoke-direct/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzai()Z

    move-result v1

    if-nez v1, :cond_2

    goto/16 :goto_4

    .line 17
    :cond_2
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzav()Lcom/google/android/gms/common/util/Clock;

    move-result-object v1

    invoke-interface {v1}, Lcom/google/android/gms/common/util/Clock;->currentTimeMillis()J

    move-result-wide v1

    .line 18
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzg()Lcom/google/android/gms/measurement/internal/zzaf;

    .line 19
    sget-object v5, Lcom/google/android/gms/measurement/internal/zzdw;->zzz:Lcom/google/android/gms/measurement/internal/zzdv;

    const/4 v6, 0x0

    invoke-virtual {v5, v6}, Lcom/google/android/gms/measurement/internal/zzdv;->zza(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/Long;

    invoke-virtual {v5}, Ljava/lang/Long;->longValue()J

    move-result-wide v7

    invoke-static {v3, v4, v7, v8}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v7

    iget-object v5, v0, Lcom/google/android/gms/measurement/internal/zzkn;->zze:Lcom/google/android/gms/measurement/internal/zzaj;

    .line 20
    invoke-static {v5}, Lcom/google/android/gms/measurement/internal/zzkn;->zzak(Lcom/google/android/gms/measurement/internal/zzkd;)Lcom/google/android/gms/measurement/internal/zzkd;

    .line 21
    invoke-virtual {v5}, Lcom/google/android/gms/measurement/internal/zzaj;->zzI()Z

    move-result v5

    const/4 v10, 0x1

    if-nez v5, :cond_4

    iget-object v5, v0, Lcom/google/android/gms/measurement/internal/zzkn;->zze:Lcom/google/android/gms/measurement/internal/zzaj;

    .line 20
    invoke-static {v5}, Lcom/google/android/gms/measurement/internal/zzkn;->zzak(Lcom/google/android/gms/measurement/internal/zzkd;)Lcom/google/android/gms/measurement/internal/zzkd;

    .line 21
    invoke-virtual {v5}, Lcom/google/android/gms/measurement/internal/zzaj;->zzH()Z

    move-result v5

    if-eqz v5, :cond_3

    goto :goto_0

    :cond_3
    const/4 v10, 0x0

    :cond_4
    :goto_0
    if-eqz v10, :cond_6

    .line 22
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzg()Lcom/google/android/gms/measurement/internal/zzaf;

    move-result-object v5

    invoke-virtual {v5}, Lcom/google/android/gms/measurement/internal/zzaf;->zzl()Ljava/lang/String;

    move-result-object v5

    .line 23
    invoke-static {v5}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v11

    if-nez v11, :cond_5

    const-string v11, ".none."

    invoke-virtual {v11, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_5

    .line 26
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzg()Lcom/google/android/gms/measurement/internal/zzaf;

    sget-object v5, Lcom/google/android/gms/measurement/internal/zzdw;->zzu:Lcom/google/android/gms/measurement/internal/zzdv;

    .line 27
    invoke-virtual {v5, v6}, Lcom/google/android/gms/measurement/internal/zzdv;->zza(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/Long;

    invoke-virtual {v5}, Ljava/lang/Long;->longValue()J

    move-result-wide v11

    invoke-static {v3, v4, v11, v12}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v11

    goto :goto_1

    .line 24
    :cond_5
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzg()Lcom/google/android/gms/measurement/internal/zzaf;

    sget-object v5, Lcom/google/android/gms/measurement/internal/zzdw;->zzt:Lcom/google/android/gms/measurement/internal/zzdv;

    .line 25
    invoke-virtual {v5, v6}, Lcom/google/android/gms/measurement/internal/zzdv;->zza(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/Long;

    invoke-virtual {v5}, Ljava/lang/Long;->longValue()J

    move-result-wide v11

    invoke-static {v3, v4, v11, v12}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v11

    goto :goto_1

    .line 28
    :cond_6
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzg()Lcom/google/android/gms/measurement/internal/zzaf;

    sget-object v5, Lcom/google/android/gms/measurement/internal/zzdw;->zzs:Lcom/google/android/gms/measurement/internal/zzdv;

    .line 29
    invoke-virtual {v5, v6}, Lcom/google/android/gms/measurement/internal/zzdv;->zza(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/Long;

    invoke-virtual {v5}, Ljava/lang/Long;->longValue()J

    move-result-wide v11

    invoke-static {v3, v4, v11, v12}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v11

    .line 27
    :goto_1
    iget-object v5, v0, Lcom/google/android/gms/measurement/internal/zzkn;->zzk:Lcom/google/android/gms/measurement/internal/zzjk;

    .line 30
    iget-object v5, v5, Lcom/google/android/gms/measurement/internal/zzjk;->zzc:Lcom/google/android/gms/measurement/internal/zzet;

    invoke-virtual {v5}, Lcom/google/android/gms/measurement/internal/zzet;->zza()J

    move-result-wide v13

    iget-object v5, v0, Lcom/google/android/gms/measurement/internal/zzkn;->zzk:Lcom/google/android/gms/measurement/internal/zzjk;

    .line 31
    iget-object v5, v5, Lcom/google/android/gms/measurement/internal/zzjk;->zzd:Lcom/google/android/gms/measurement/internal/zzet;

    invoke-virtual {v5}, Lcom/google/android/gms/measurement/internal/zzet;->zza()J

    move-result-wide v15

    iget-object v5, v0, Lcom/google/android/gms/measurement/internal/zzkn;->zze:Lcom/google/android/gms/measurement/internal/zzaj;

    .line 32
    invoke-static {v5}, Lcom/google/android/gms/measurement/internal/zzkn;->zzak(Lcom/google/android/gms/measurement/internal/zzkd;)Lcom/google/android/gms/measurement/internal/zzkd;

    move/from16 v17, v10

    .line 33
    invoke-virtual {v5}, Lcom/google/android/gms/measurement/internal/zzaj;->zzd()J

    move-result-wide v9

    iget-object v5, v0, Lcom/google/android/gms/measurement/internal/zzkn;->zze:Lcom/google/android/gms/measurement/internal/zzaj;

    .line 34
    invoke-static {v5}, Lcom/google/android/gms/measurement/internal/zzkn;->zzak(Lcom/google/android/gms/measurement/internal/zzkd;)Lcom/google/android/gms/measurement/internal/zzkd;

    move-wide/from16 v18, v7

    .line 35
    invoke-virtual {v5}, Lcom/google/android/gms/measurement/internal/zzaj;->zze()J

    move-result-wide v6

    .line 36
    invoke-static {v9, v10, v6, v7}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v5

    cmp-long v7, v5, v3

    if-nez v7, :cond_8

    :cond_7
    move-wide v7, v3

    goto/16 :goto_3

    :cond_8
    sub-long/2addr v5, v1

    .line 37
    invoke-static {v5, v6}, Ljava/lang/Math;->abs(J)J

    move-result-wide v5

    sub-long v5, v1, v5

    sub-long/2addr v13, v1

    .line 38
    invoke-static {v13, v14}, Ljava/lang/Math;->abs(J)J

    move-result-wide v7

    sub-long/2addr v15, v1

    .line 39
    invoke-static/range {v15 .. v16}, Ljava/lang/Math;->abs(J)J

    move-result-wide v9

    sub-long v9, v1, v9

    sub-long/2addr v1, v7

    .line 40
    invoke-static {v1, v2, v9, v10}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v1

    add-long v7, v5, v18

    if-eqz v17, :cond_9

    cmp-long v13, v1, v3

    if-lez v13, :cond_9

    .line 41
    invoke-static {v5, v6, v1, v2}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v7

    add-long/2addr v7, v11

    :cond_9
    iget-object v13, v0, Lcom/google/android/gms/measurement/internal/zzkn;->zzi:Lcom/google/android/gms/measurement/internal/zzkp;

    .line 42
    invoke-static {v13}, Lcom/google/android/gms/measurement/internal/zzkn;->zzak(Lcom/google/android/gms/measurement/internal/zzkd;)Lcom/google/android/gms/measurement/internal/zzkd;

    .line 43
    invoke-virtual {v13, v1, v2, v11, v12}, Lcom/google/android/gms/measurement/internal/zzkp;->zzx(JJ)Z

    move-result v13

    if-nez v13, :cond_a

    add-long v7, v1, v11

    :cond_a
    cmp-long v1, v9, v3

    if-eqz v1, :cond_b

    cmp-long v1, v9, v5

    if-ltz v1, :cond_b

    const/4 v1, 0x0

    .line 44
    :goto_2
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzg()Lcom/google/android/gms/measurement/internal/zzaf;

    const/16 v2, 0x14

    sget-object v5, Lcom/google/android/gms/measurement/internal/zzdw;->zzB:Lcom/google/android/gms/measurement/internal/zzdv;

    const/4 v6, 0x0

    .line 45
    invoke-virtual {v5, v6}, Lcom/google/android/gms/measurement/internal/zzdv;->zza(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/Integer;

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v5

    const/4 v11, 0x0

    invoke-static {v11, v5}, Ljava/lang/Math;->max(II)I

    move-result v5

    invoke-static {v2, v5}, Ljava/lang/Math;->min(II)I

    move-result v2

    if-ge v1, v2, :cond_7

    .line 46
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzg()Lcom/google/android/gms/measurement/internal/zzaf;

    sget-object v2, Lcom/google/android/gms/measurement/internal/zzdw;->zzA:Lcom/google/android/gms/measurement/internal/zzdv;

    .line 47
    invoke-virtual {v2, v6}, Lcom/google/android/gms/measurement/internal/zzdv;->zza(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Long;

    invoke-virtual {v2}, Ljava/lang/Long;->longValue()J

    move-result-wide v5

    invoke-static {v3, v4, v5, v6}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v5

    const-wide/16 v12, 0x1

    shl-long/2addr v12, v1

    mul-long v5, v5, v12

    add-long/2addr v7, v5

    cmp-long v2, v7, v9

    if-gtz v2, :cond_b

    add-int/lit8 v1, v1, 0x1

    goto :goto_2

    :cond_b
    :goto_3
    cmp-long v1, v7, v3

    if-eqz v1, :cond_f

    .line 36
    iget-object v1, v0, Lcom/google/android/gms/measurement/internal/zzkn;->zzd:Lcom/google/android/gms/measurement/internal/zzeo;

    .line 48
    invoke-static {v1}, Lcom/google/android/gms/measurement/internal/zzkn;->zzak(Lcom/google/android/gms/measurement/internal/zzkd;)Lcom/google/android/gms/measurement/internal/zzkd;

    .line 49
    invoke-virtual {v1}, Lcom/google/android/gms/measurement/internal/zzeo;->zzc()Z

    move-result v1

    if-eqz v1, :cond_e

    iget-object v1, v0, Lcom/google/android/gms/measurement/internal/zzkn;->zzk:Lcom/google/android/gms/measurement/internal/zzjk;

    .line 50
    iget-object v1, v1, Lcom/google/android/gms/measurement/internal/zzjk;->zzb:Lcom/google/android/gms/measurement/internal/zzet;

    invoke-virtual {v1}, Lcom/google/android/gms/measurement/internal/zzet;->zza()J

    move-result-wide v1

    .line 51
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzg()Lcom/google/android/gms/measurement/internal/zzaf;

    sget-object v5, Lcom/google/android/gms/measurement/internal/zzdw;->zzq:Lcom/google/android/gms/measurement/internal/zzdv;

    const/4 v6, 0x0

    .line 52
    invoke-virtual {v5, v6}, Lcom/google/android/gms/measurement/internal/zzdv;->zza(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/Long;

    invoke-virtual {v5}, Ljava/lang/Long;->longValue()J

    move-result-wide v5

    invoke-static {v3, v4, v5, v6}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v5

    iget-object v9, v0, Lcom/google/android/gms/measurement/internal/zzkn;->zzi:Lcom/google/android/gms/measurement/internal/zzkp;

    .line 53
    invoke-static {v9}, Lcom/google/android/gms/measurement/internal/zzkn;->zzak(Lcom/google/android/gms/measurement/internal/zzkd;)Lcom/google/android/gms/measurement/internal/zzkd;

    .line 54
    invoke-virtual {v9, v1, v2, v5, v6}, Lcom/google/android/gms/measurement/internal/zzkp;->zzx(JJ)Z

    move-result v9

    if-nez v9, :cond_c

    add-long/2addr v1, v5

    .line 55
    invoke-static {v7, v8, v1, v2}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v7

    .line 56
    :cond_c
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzm()Lcom/google/android/gms/measurement/internal/zzeq;

    move-result-object v1

    invoke-virtual {v1}, Lcom/google/android/gms/measurement/internal/zzeq;->zzc()V

    .line 57
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzav()Lcom/google/android/gms/common/util/Clock;

    move-result-object v1

    invoke-interface {v1}, Lcom/google/android/gms/common/util/Clock;->currentTimeMillis()J

    move-result-wide v1

    sub-long/2addr v7, v1

    cmp-long v1, v7, v3

    if-gtz v1, :cond_d

    .line 58
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzg()Lcom/google/android/gms/measurement/internal/zzaf;

    sget-object v1, Lcom/google/android/gms/measurement/internal/zzdw;->zzv:Lcom/google/android/gms/measurement/internal/zzdv;

    const/4 v2, 0x0

    .line 59
    invoke-virtual {v1, v2}, Lcom/google/android/gms/measurement/internal/zzdv;->zza(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Long;

    invoke-virtual {v1}, Ljava/lang/Long;->longValue()J

    move-result-wide v1

    invoke-static {v3, v4, v1, v2}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v7

    iget-object v1, v0, Lcom/google/android/gms/measurement/internal/zzkn;->zzk:Lcom/google/android/gms/measurement/internal/zzjk;

    .line 60
    iget-object v1, v1, Lcom/google/android/gms/measurement/internal/zzjk;->zzc:Lcom/google/android/gms/measurement/internal/zzet;

    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzav()Lcom/google/android/gms/common/util/Clock;

    move-result-object v2

    invoke-interface {v2}, Lcom/google/android/gms/common/util/Clock;->currentTimeMillis()J

    move-result-wide v2

    invoke-virtual {v1, v2, v3}, Lcom/google/android/gms/measurement/internal/zzet;->zzb(J)V

    .line 61
    :cond_d
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzay()Lcom/google/android/gms/measurement/internal/zzei;

    move-result-object v1

    invoke-virtual {v1}, Lcom/google/android/gms/measurement/internal/zzei;->zzj()Lcom/google/android/gms/measurement/internal/zzeg;

    move-result-object v1

    invoke-static {v7, v8}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    const-string v3, "Upload scheduled in approximately ms"

    invoke-virtual {v1, v3, v2}, Lcom/google/android/gms/measurement/internal/zzeg;->zzb(Ljava/lang/String;Ljava/lang/Object;)V

    iget-object v1, v0, Lcom/google/android/gms/measurement/internal/zzkn;->zzg:Lcom/google/android/gms/measurement/internal/zzkb;

    .line 62
    invoke-static {v1}, Lcom/google/android/gms/measurement/internal/zzkn;->zzak(Lcom/google/android/gms/measurement/internal/zzkd;)Lcom/google/android/gms/measurement/internal/zzkd;

    .line 63
    invoke-virtual {v1, v7, v8}, Lcom/google/android/gms/measurement/internal/zzkb;->zzd(J)V

    return-void

    .line 64
    :cond_e
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzay()Lcom/google/android/gms/measurement/internal/zzei;

    move-result-object v1

    invoke-virtual {v1}, Lcom/google/android/gms/measurement/internal/zzei;->zzj()Lcom/google/android/gms/measurement/internal/zzeg;

    move-result-object v1

    const-string v2, "No network"

    invoke-virtual {v1, v2}, Lcom/google/android/gms/measurement/internal/zzeg;->zza(Ljava/lang/String;)V

    .line 65
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzm()Lcom/google/android/gms/measurement/internal/zzeq;

    move-result-object v1

    invoke-virtual {v1}, Lcom/google/android/gms/measurement/internal/zzeq;->zzb()V

    iget-object v1, v0, Lcom/google/android/gms/measurement/internal/zzkn;->zzg:Lcom/google/android/gms/measurement/internal/zzkb;

    .line 66
    invoke-static {v1}, Lcom/google/android/gms/measurement/internal/zzkn;->zzak(Lcom/google/android/gms/measurement/internal/zzkd;)Lcom/google/android/gms/measurement/internal/zzkd;

    .line 67
    invoke-virtual {v1}, Lcom/google/android/gms/measurement/internal/zzkb;->zza()V

    return-void

    .line 68
    :cond_f
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzay()Lcom/google/android/gms/measurement/internal/zzei;

    move-result-object v1

    invoke-virtual {v1}, Lcom/google/android/gms/measurement/internal/zzei;->zzj()Lcom/google/android/gms/measurement/internal/zzeg;

    move-result-object v1

    const-string v2, "Next upload time is 0"

    invoke-virtual {v1, v2}, Lcom/google/android/gms/measurement/internal/zzeg;->zza(Ljava/lang/String;)V

    .line 69
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzm()Lcom/google/android/gms/measurement/internal/zzeq;

    move-result-object v1

    invoke-virtual {v1}, Lcom/google/android/gms/measurement/internal/zzeq;->zzc()V

    iget-object v1, v0, Lcom/google/android/gms/measurement/internal/zzkn;->zzg:Lcom/google/android/gms/measurement/internal/zzkb;

    .line 70
    invoke-static {v1}, Lcom/google/android/gms/measurement/internal/zzkn;->zzak(Lcom/google/android/gms/measurement/internal/zzkd;)Lcom/google/android/gms/measurement/internal/zzkd;

    .line 71
    invoke-virtual {v1}, Lcom/google/android/gms/measurement/internal/zzkb;->zza()V

    return-void

    .line 13
    :cond_10
    :goto_4
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzay()Lcom/google/android/gms/measurement/internal/zzei;

    move-result-object v1

    invoke-virtual {v1}, Lcom/google/android/gms/measurement/internal/zzei;->zzj()Lcom/google/android/gms/measurement/internal/zzeg;

    move-result-object v1

    const-string v2, "Nothing to upload or uploading impossible"

    invoke-virtual {v1, v2}, Lcom/google/android/gms/measurement/internal/zzeg;->zza(Ljava/lang/String;)V

    .line 14
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzm()Lcom/google/android/gms/measurement/internal/zzeq;

    move-result-object v1

    invoke-virtual {v1}, Lcom/google/android/gms/measurement/internal/zzeq;->zzc()V

    iget-object v1, v0, Lcom/google/android/gms/measurement/internal/zzkn;->zzg:Lcom/google/android/gms/measurement/internal/zzkb;

    .line 15
    invoke-static {v1}, Lcom/google/android/gms/measurement/internal/zzkn;->zzak(Lcom/google/android/gms/measurement/internal/zzkd;)Lcom/google/android/gms/measurement/internal/zzkd;

    .line 16
    invoke-virtual {v1}, Lcom/google/android/gms/measurement/internal/zzkb;->zza()V

    return-void
.end method

.method private final zzag(Lcom/google/android/gms/measurement/internal/zzp;)Z
    .locals 3

    .line 1
    invoke-static {}, Lcom/google/android/gms/internal/measurement/zzoq;->zzc()Z

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzg()Lcom/google/android/gms/measurement/internal/zzaf;

    move-result-object v0

    iget-object v1, p1, Lcom/google/android/gms/measurement/internal/zzp;->zza:Ljava/lang/String;

    sget-object v2, Lcom/google/android/gms/measurement/internal/zzdw;->zzad:Lcom/google/android/gms/measurement/internal/zzdv;

    invoke-virtual {v0, v1, v2}, Lcom/google/android/gms/measurement/internal/zzaf;->zzs(Ljava/lang/String;Lcom/google/android/gms/measurement/internal/zzdv;)Z

    move-result v0

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-eqz v0, :cond_2

    .line 3
    iget-object v0, p1, Lcom/google/android/gms/measurement/internal/zzp;->zzb:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p1, Lcom/google/android/gms/measurement/internal/zzp;->zzu:Ljava/lang/String;

    .line 4
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object p1, p1, Lcom/google/android/gms/measurement/internal/zzp;->zzq:Ljava/lang/String;

    .line 5
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p1

    if-nez p1, :cond_0

    goto :goto_0

    :cond_0
    return v1

    :cond_1
    :goto_0
    return v2

    .line 2
    :cond_2
    iget-object v0, p1, Lcom/google/android/gms/measurement/internal/zzp;->zzb:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_4

    iget-object p1, p1, Lcom/google/android/gms/measurement/internal/zzp;->zzq:Ljava/lang/String;

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p1

    if-nez p1, :cond_3

    goto :goto_1

    :cond_3
    return v1

    :cond_4
    :goto_1
    return v2
.end method

.method private final zzah(Ljava/lang/String;J)Z
    .locals 42

    move-object/from16 v1, p0

    const-string v2, "_sc"

    const-string v3, "_sn"

    const-string v4, "_npa"

    const-string v5, "_ai"

    iget-object v6, v1, Lcom/google/android/gms/measurement/internal/zzkn;->zze:Lcom/google/android/gms/measurement/internal/zzaj;

    .line 1
    invoke-static {v6}, Lcom/google/android/gms/measurement/internal/zzkn;->zzak(Lcom/google/android/gms/measurement/internal/zzkd;)Lcom/google/android/gms/measurement/internal/zzkd;

    .line 2
    invoke-virtual {v6}, Lcom/google/android/gms/measurement/internal/zzaj;->zzw()V

    :try_start_0
    new-instance v6, Lcom/google/android/gms/measurement/internal/zzkm;

    const/4 v14, 0x0

    .line 3
    invoke-direct {v6, v1, v14}, Lcom/google/android/gms/measurement/internal/zzkm;-><init>(Lcom/google/android/gms/measurement/internal/zzkn;Lcom/google/android/gms/measurement/internal/zzkl;)V

    iget-object v7, v1, Lcom/google/android/gms/measurement/internal/zzkn;->zze:Lcom/google/android/gms/measurement/internal/zzaj;

    .line 4
    invoke-static {v7}, Lcom/google/android/gms/measurement/internal/zzkn;->zzak(Lcom/google/android/gms/measurement/internal/zzkd;)Lcom/google/android/gms/measurement/internal/zzkd;

    const/4 v8, 0x0

    iget-wide v11, v1, Lcom/google/android/gms/measurement/internal/zzkn;->zzA:J

    move-wide/from16 v9, p2

    move-object v13, v6

    .line 5
    invoke-virtual/range {v7 .. v13}, Lcom/google/android/gms/measurement/internal/zzaj;->zzW(Ljava/lang/String;JJLcom/google/android/gms/measurement/internal/zzkm;)V

    iget-object v7, v6, Lcom/google/android/gms/measurement/internal/zzkm;->zzc:Ljava/util/List;

    if-eqz v7, :cond_69

    .line 6
    invoke-interface {v7}, Ljava/util/List;->isEmpty()Z

    move-result v7

    if-eqz v7, :cond_0

    goto/16 :goto_3b

    .line 10
    :cond_0
    iget-object v7, v6, Lcom/google/android/gms/measurement/internal/zzkm;->zza:Lcom/google/android/gms/internal/measurement/zzfy;

    .line 11
    invoke-virtual {v7}, Lcom/google/android/gms/internal/measurement/zzjz;->zzbv()Lcom/google/android/gms/internal/measurement/zzjv;

    move-result-object v7

    check-cast v7, Lcom/google/android/gms/internal/measurement/zzfx;

    invoke-virtual {v7}, Lcom/google/android/gms/internal/measurement/zzfx;->zzp()Lcom/google/android/gms/internal/measurement/zzfx;

    .line 12
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzg()Lcom/google/android/gms/measurement/internal/zzaf;

    move-result-object v9

    iget-object v10, v6, Lcom/google/android/gms/measurement/internal/zzkm;->zza:Lcom/google/android/gms/internal/measurement/zzfy;

    invoke-virtual {v10}, Lcom/google/android/gms/internal/measurement/zzfy;->zzy()Ljava/lang/String;

    move-result-object v10

    sget-object v11, Lcom/google/android/gms/measurement/internal/zzdw;->zzT:Lcom/google/android/gms/measurement/internal/zzdv;

    invoke-virtual {v9, v10, v11}, Lcom/google/android/gms/measurement/internal/zzaf;->zzs(Ljava/lang/String;Lcom/google/android/gms/measurement/internal/zzdv;)Z

    move-result v9

    move-object/from16 v18, v14

    move-object/from16 v19, v18

    const/4 v8, -0x1

    const/4 v13, 0x0

    const/4 v14, -0x1

    const-wide/16 v15, 0x0

    const/16 v17, 0x0

    const/16 v20, 0x0

    :goto_0
    iget-object v10, v6, Lcom/google/android/gms/measurement/internal/zzkm;->zzc:Ljava/util/List;

    .line 13
    invoke-interface {v10}, Ljava/util/List;->size()I

    move-result v10
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    const-string v11, "_fr"

    const-string v12, "_et"

    move-object/from16 v22, v4

    const-string v4, "_e"

    move-object/from16 v23, v2

    move-object/from16 v24, v3

    if-ge v13, v10, :cond_33

    :try_start_1
    iget-object v3, v6, Lcom/google/android/gms/measurement/internal/zzkm;->zzc:Ljava/util/List;

    .line 14
    invoke-interface {v3, v13}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/google/android/gms/internal/measurement/zzfo;

    invoke-virtual {v3}, Lcom/google/android/gms/internal/measurement/zzjz;->zzbv()Lcom/google/android/gms/internal/measurement/zzjv;

    move-result-object v3

    check-cast v3, Lcom/google/android/gms/internal/measurement/zzfn;

    iget-object v10, v1, Lcom/google/android/gms/measurement/internal/zzkn;->zzc:Lcom/google/android/gms/measurement/internal/zzfj;

    .line 15
    invoke-static {v10}, Lcom/google/android/gms/measurement/internal/zzkn;->zzak(Lcom/google/android/gms/measurement/internal/zzkd;)Lcom/google/android/gms/measurement/internal/zzkd;

    iget-object v2, v6, Lcom/google/android/gms/measurement/internal/zzkm;->zza:Lcom/google/android/gms/internal/measurement/zzfy;

    .line 16
    invoke-virtual {v2}, Lcom/google/android/gms/internal/measurement/zzfy;->zzy()Ljava/lang/String;

    move-result-object v2

    move/from16 v25, v13

    invoke-virtual {v3}, Lcom/google/android/gms/internal/measurement/zzfn;->zzo()Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v10, v2, v13}, Lcom/google/android/gms/measurement/internal/zzfj;->zzo(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    const-string v10, "_err"

    if-eqz v2, :cond_3

    .line 17
    :try_start_2
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzay()Lcom/google/android/gms/measurement/internal/zzei;

    move-result-object v2

    .line 18
    invoke-virtual {v2}, Lcom/google/android/gms/measurement/internal/zzei;->zzk()Lcom/google/android/gms/measurement/internal/zzeg;

    move-result-object v2

    const-string v4, "Dropping blocked raw event. appId"

    iget-object v11, v6, Lcom/google/android/gms/measurement/internal/zzkm;->zza:Lcom/google/android/gms/internal/measurement/zzfy;

    .line 19
    invoke-virtual {v11}, Lcom/google/android/gms/internal/measurement/zzfy;->zzy()Ljava/lang/String;

    move-result-object v11

    invoke-static {v11}, Lcom/google/android/gms/measurement/internal/zzei;->zzn(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v11

    iget-object v12, v1, Lcom/google/android/gms/measurement/internal/zzkn;->zzn:Lcom/google/android/gms/measurement/internal/zzfs;

    .line 20
    invoke-virtual {v12}, Lcom/google/android/gms/measurement/internal/zzfs;->zzj()Lcom/google/android/gms/measurement/internal/zzed;

    move-result-object v12

    .line 21
    invoke-virtual {v3}, Lcom/google/android/gms/internal/measurement/zzfn;->zzo()Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v12, v13}, Lcom/google/android/gms/measurement/internal/zzed;->zzc(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    .line 22
    invoke-virtual {v2, v4, v11, v12}, Lcom/google/android/gms/measurement/internal/zzeg;->zzc(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    iget-object v2, v1, Lcom/google/android/gms/measurement/internal/zzkn;->zzc:Lcom/google/android/gms/measurement/internal/zzfj;

    .line 23
    invoke-static {v2}, Lcom/google/android/gms/measurement/internal/zzkn;->zzak(Lcom/google/android/gms/measurement/internal/zzkd;)Lcom/google/android/gms/measurement/internal/zzkd;

    iget-object v4, v6, Lcom/google/android/gms/measurement/internal/zzkm;->zza:Lcom/google/android/gms/internal/measurement/zzfy;

    .line 24
    invoke-virtual {v4}, Lcom/google/android/gms/internal/measurement/zzfy;->zzy()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v4}, Lcom/google/android/gms/measurement/internal/zzfj;->zzm(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_2

    iget-object v2, v1, Lcom/google/android/gms/measurement/internal/zzkn;->zzc:Lcom/google/android/gms/measurement/internal/zzfj;

    .line 25
    invoke-static {v2}, Lcom/google/android/gms/measurement/internal/zzkn;->zzak(Lcom/google/android/gms/measurement/internal/zzkd;)Lcom/google/android/gms/measurement/internal/zzkd;

    iget-object v4, v6, Lcom/google/android/gms/measurement/internal/zzkm;->zza:Lcom/google/android/gms/internal/measurement/zzfy;

    .line 26
    invoke-virtual {v4}, Lcom/google/android/gms/internal/measurement/zzfy;->zzy()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v4}, Lcom/google/android/gms/measurement/internal/zzfj;->zzp(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_1

    goto :goto_1

    .line 27
    :cond_1
    invoke-virtual {v3}, Lcom/google/android/gms/internal/measurement/zzfn;->zzo()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v10, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_2

    .line 28
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzv()Lcom/google/android/gms/measurement/internal/zzku;

    move-result-object v26

    iget-object v2, v1, Lcom/google/android/gms/measurement/internal/zzkn;->zzC:Lcom/google/android/gms/measurement/internal/zzkt;

    iget-object v4, v6, Lcom/google/android/gms/measurement/internal/zzkm;->zza:Lcom/google/android/gms/internal/measurement/zzfy;

    .line 29
    invoke-virtual {v4}, Lcom/google/android/gms/internal/measurement/zzfy;->zzy()Ljava/lang/String;

    move-result-object v28

    const/16 v29, 0xb

    const-string v30, "_ev"

    .line 30
    invoke-virtual {v3}, Lcom/google/android/gms/internal/measurement/zzfn;->zzo()Ljava/lang/String;

    move-result-object v31

    const/16 v32, 0x0

    move-object/from16 v27, v2

    .line 31
    invoke-virtual/range {v26 .. v32}, Lcom/google/android/gms/measurement/internal/zzku;->zzM(Lcom/google/android/gms/measurement/internal/zzkt;Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;I)V

    :cond_2
    :goto_1
    move-object/from16 v27, v5

    move-object v5, v7

    move v12, v14

    move-wide/from16 v28, v15

    move-object/from16 v14, v23

    move-object/from16 v11, v24

    move/from16 v16, v9

    move v9, v8

    move/from16 v8, v25

    goto/16 :goto_1a

    .line 32
    :cond_3
    invoke-virtual {v3}, Lcom/google/android/gms/internal/measurement/zzfn;->zzo()Ljava/lang/String;

    move-result-object v2

    .line 33
    invoke-static {v5}, Lcom/google/android/gms/measurement/internal/zzgp;->zza(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v2, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_5

    .line 34
    invoke-virtual {v3, v5}, Lcom/google/android/gms/internal/measurement/zzfn;->zzi(Ljava/lang/String;)Lcom/google/android/gms/internal/measurement/zzfn;

    .line 35
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzay()Lcom/google/android/gms/measurement/internal/zzei;

    move-result-object v2

    invoke-virtual {v2}, Lcom/google/android/gms/measurement/internal/zzei;->zzj()Lcom/google/android/gms/measurement/internal/zzeg;

    move-result-object v2

    const-string v13, "Renaming ad_impression to _ai"

    invoke-virtual {v2, v13}, Lcom/google/android/gms/measurement/internal/zzeg;->zza(Ljava/lang/String;)V

    .line 36
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzay()Lcom/google/android/gms/measurement/internal/zzei;

    move-result-object v2

    invoke-virtual {v2}, Lcom/google/android/gms/measurement/internal/zzei;->zzq()Ljava/lang/String;

    move-result-object v2

    const/4 v13, 0x5

    .line 37
    invoke-static {v2, v13}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v2

    if-eqz v2, :cond_5

    const/4 v2, 0x0

    .line 38
    :goto_2
    invoke-virtual {v3}, Lcom/google/android/gms/internal/measurement/zzfn;->zza()I

    move-result v13

    if-ge v2, v13, :cond_5

    const-string v13, "ad_platform"

    .line 39
    invoke-virtual {v3, v2}, Lcom/google/android/gms/internal/measurement/zzfn;->zzn(I)Lcom/google/android/gms/internal/measurement/zzfs;

    move-result-object v26

    move-object/from16 v27, v5

    invoke-virtual/range {v26 .. v26}, Lcom/google/android/gms/internal/measurement/zzfs;->zzg()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v13, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_4

    .line 40
    invoke-virtual {v3, v2}, Lcom/google/android/gms/internal/measurement/zzfn;->zzn(I)Lcom/google/android/gms/internal/measurement/zzfs;

    move-result-object v5

    invoke-virtual {v5}, Lcom/google/android/gms/internal/measurement/zzfs;->zzh()Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v5

    if-nez v5, :cond_4

    const-string v5, "admob"

    .line 41
    invoke-virtual {v3, v2}, Lcom/google/android/gms/internal/measurement/zzfn;->zzn(I)Lcom/google/android/gms/internal/measurement/zzfs;

    move-result-object v13

    invoke-virtual {v13}, Lcom/google/android/gms/internal/measurement/zzfs;->zzh()Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v5, v13}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_4

    .line 42
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzay()Lcom/google/android/gms/measurement/internal/zzei;

    move-result-object v5

    .line 43
    invoke-virtual {v5}, Lcom/google/android/gms/measurement/internal/zzei;->zzl()Lcom/google/android/gms/measurement/internal/zzeg;

    move-result-object v5

    const-string v13, "AdMob ad impression logged from app. Potentially duplicative."

    .line 44
    invoke-virtual {v5, v13}, Lcom/google/android/gms/measurement/internal/zzeg;->zza(Ljava/lang/String;)V

    :cond_4
    add-int/lit8 v2, v2, 0x1

    move-object/from16 v5, v27

    goto :goto_2

    :cond_5
    move-object/from16 v27, v5

    iget-object v2, v1, Lcom/google/android/gms/measurement/internal/zzkn;->zzc:Lcom/google/android/gms/measurement/internal/zzfj;

    .line 45
    invoke-static {v2}, Lcom/google/android/gms/measurement/internal/zzkn;->zzak(Lcom/google/android/gms/measurement/internal/zzkd;)Lcom/google/android/gms/measurement/internal/zzkd;

    iget-object v5, v6, Lcom/google/android/gms/measurement/internal/zzkm;->zza:Lcom/google/android/gms/internal/measurement/zzfy;

    .line 46
    invoke-virtual {v5}, Lcom/google/android/gms/internal/measurement/zzfy;->zzy()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3}, Lcom/google/android/gms/internal/measurement/zzfn;->zzo()Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v2, v5, v13}, Lcom/google/android/gms/measurement/internal/zzfj;->zzn(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v2
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    const-string v5, "_c"

    if-nez v2, :cond_a

    :try_start_3
    iget-object v13, v1, Lcom/google/android/gms/measurement/internal/zzkn;->zzi:Lcom/google/android/gms/measurement/internal/zzkp;

    .line 47
    invoke-static {v13}, Lcom/google/android/gms/measurement/internal/zzkn;->zzak(Lcom/google/android/gms/measurement/internal/zzkd;)Lcom/google/android/gms/measurement/internal/zzkd;

    .line 48
    invoke-virtual {v3}, Lcom/google/android/gms/internal/measurement/zzfn;->zzo()Ljava/lang/String;

    move-result-object v13

    .line 49
    invoke-static {v13}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotEmpty(Ljava/lang/String;)Ljava/lang/String;

    move-wide/from16 v28, v15

    .line 50
    invoke-virtual {v13}, Ljava/lang/String;->hashCode()I

    move-result v15
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    move/from16 v16, v9

    const v9, 0x171c4

    if-eq v15, v9, :cond_8

    const v9, 0x17331

    if-eq v15, v9, :cond_7

    const v9, 0x17333

    if-eq v15, v9, :cond_6

    goto :goto_3

    :cond_6
    const-string v9, "_ui"

    invoke-virtual {v13, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_9

    const/4 v9, 0x1

    goto :goto_4

    :cond_7
    const-string v9, "_ug"

    invoke-virtual {v13, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_9

    const/4 v9, 0x2

    goto :goto_4

    :cond_8
    const-string v9, "_in"

    invoke-virtual {v13, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_9

    const/4 v9, 0x0

    goto :goto_4

    :cond_9
    :goto_3
    const/4 v9, -0x1

    :goto_4
    if-eqz v9, :cond_b

    const/4 v13, 0x1

    if-eq v9, v13, :cond_b

    const/4 v13, 0x2

    if-eq v9, v13, :cond_b

    move-object/from16 v30, v7

    move v9, v8

    move-object/from16 v26, v12

    move/from16 v21, v14

    const/4 v2, 0x0

    goto/16 :goto_b

    :cond_a
    move-wide/from16 v28, v15

    move/from16 v16, v9

    :cond_b
    move/from16 v21, v14

    const/4 v9, 0x0

    const/4 v13, 0x0

    const/4 v15, 0x0

    .line 51
    :goto_5
    :try_start_4
    invoke-virtual {v3}, Lcom/google/android/gms/internal/measurement/zzfn;->zza()I

    move-result v14
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    move-object/from16 v26, v12

    const-string v12, "_r"

    if-ge v9, v14, :cond_e

    .line 52
    :try_start_5
    invoke-virtual {v3, v9}, Lcom/google/android/gms/internal/measurement/zzfn;->zzn(I)Lcom/google/android/gms/internal/measurement/zzfs;

    move-result-object v14

    invoke-virtual {v14}, Lcom/google/android/gms/internal/measurement/zzfs;->zzg()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v5, v14}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v14

    if-eqz v14, :cond_c

    .line 53
    invoke-virtual {v3, v9}, Lcom/google/android/gms/internal/measurement/zzfn;->zzn(I)Lcom/google/android/gms/internal/measurement/zzfs;

    move-result-object v12

    invoke-virtual {v12}, Lcom/google/android/gms/internal/measurement/zzjz;->zzbv()Lcom/google/android/gms/internal/measurement/zzjv;

    move-result-object v12

    check-cast v12, Lcom/google/android/gms/internal/measurement/zzfr;

    const-wide/16 v13, 0x1

    .line 54
    invoke-virtual {v12, v13, v14}, Lcom/google/android/gms/internal/measurement/zzfr;->zzi(J)Lcom/google/android/gms/internal/measurement/zzfr;

    .line 55
    invoke-virtual {v12}, Lcom/google/android/gms/internal/measurement/zzjv;->zzaA()Lcom/google/android/gms/internal/measurement/zzjz;

    move-result-object v12

    check-cast v12, Lcom/google/android/gms/internal/measurement/zzfs;

    .line 56
    invoke-virtual {v3, v9, v12}, Lcom/google/android/gms/internal/measurement/zzfn;->zzk(ILcom/google/android/gms/internal/measurement/zzfs;)Lcom/google/android/gms/internal/measurement/zzfn;

    const/4 v13, 0x1

    goto :goto_6

    .line 57
    :cond_c
    invoke-virtual {v3, v9}, Lcom/google/android/gms/internal/measurement/zzfn;->zzn(I)Lcom/google/android/gms/internal/measurement/zzfs;

    move-result-object v14

    invoke-virtual {v14}, Lcom/google/android/gms/internal/measurement/zzfs;->zzg()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v12, v14}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_d

    .line 58
    invoke-virtual {v3, v9}, Lcom/google/android/gms/internal/measurement/zzfn;->zzn(I)Lcom/google/android/gms/internal/measurement/zzfs;

    move-result-object v12

    invoke-virtual {v12}, Lcom/google/android/gms/internal/measurement/zzjz;->zzbv()Lcom/google/android/gms/internal/measurement/zzjv;

    move-result-object v12

    check-cast v12, Lcom/google/android/gms/internal/measurement/zzfr;

    const-wide/16 v14, 0x1

    .line 59
    invoke-virtual {v12, v14, v15}, Lcom/google/android/gms/internal/measurement/zzfr;->zzi(J)Lcom/google/android/gms/internal/measurement/zzfr;

    .line 60
    invoke-virtual {v12}, Lcom/google/android/gms/internal/measurement/zzjv;->zzaA()Lcom/google/android/gms/internal/measurement/zzjz;

    move-result-object v12

    check-cast v12, Lcom/google/android/gms/internal/measurement/zzfs;

    .line 61
    invoke-virtual {v3, v9, v12}, Lcom/google/android/gms/internal/measurement/zzfn;->zzk(ILcom/google/android/gms/internal/measurement/zzfs;)Lcom/google/android/gms/internal/measurement/zzfn;

    const/4 v15, 0x1

    :cond_d
    :goto_6
    add-int/lit8 v9, v9, 0x1

    move-object/from16 v12, v26

    goto :goto_5

    :cond_e
    if-nez v13, :cond_f

    if-eqz v2, :cond_f

    .line 62
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzay()Lcom/google/android/gms/measurement/internal/zzei;

    move-result-object v9

    .line 63
    invoke-virtual {v9}, Lcom/google/android/gms/measurement/internal/zzei;->zzj()Lcom/google/android/gms/measurement/internal/zzeg;

    move-result-object v9

    const-string v13, "Marking event as conversion"

    iget-object v14, v1, Lcom/google/android/gms/measurement/internal/zzkn;->zzn:Lcom/google/android/gms/measurement/internal/zzfs;

    .line 64
    invoke-virtual {v14}, Lcom/google/android/gms/measurement/internal/zzfs;->zzj()Lcom/google/android/gms/measurement/internal/zzed;

    move-result-object v14

    move-object/from16 v30, v7

    .line 65
    invoke-virtual {v3}, Lcom/google/android/gms/internal/measurement/zzfn;->zzo()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v14, v7}, Lcom/google/android/gms/measurement/internal/zzed;->zzc(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    .line 66
    invoke-virtual {v9, v13, v7}, Lcom/google/android/gms/measurement/internal/zzeg;->zzb(Ljava/lang/String;Ljava/lang/Object;)V

    .line 67
    invoke-static {}, Lcom/google/android/gms/internal/measurement/zzfs;->zze()Lcom/google/android/gms/internal/measurement/zzfr;

    move-result-object v7

    .line 68
    invoke-virtual {v7, v5}, Lcom/google/android/gms/internal/measurement/zzfr;->zzj(Ljava/lang/String;)Lcom/google/android/gms/internal/measurement/zzfr;

    const-wide/16 v13, 0x1

    .line 69
    invoke-virtual {v7, v13, v14}, Lcom/google/android/gms/internal/measurement/zzfr;->zzi(J)Lcom/google/android/gms/internal/measurement/zzfr;

    .line 70
    invoke-virtual {v3, v7}, Lcom/google/android/gms/internal/measurement/zzfn;->zze(Lcom/google/android/gms/internal/measurement/zzfr;)Lcom/google/android/gms/internal/measurement/zzfn;

    goto :goto_7

    :cond_f
    move-object/from16 v30, v7

    :goto_7
    if-nez v15, :cond_10

    .line 71
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzay()Lcom/google/android/gms/measurement/internal/zzei;

    move-result-object v7

    .line 72
    invoke-virtual {v7}, Lcom/google/android/gms/measurement/internal/zzei;->zzj()Lcom/google/android/gms/measurement/internal/zzeg;

    move-result-object v7

    const-string v9, "Marking event as real-time"

    iget-object v13, v1, Lcom/google/android/gms/measurement/internal/zzkn;->zzn:Lcom/google/android/gms/measurement/internal/zzfs;

    .line 73
    invoke-virtual {v13}, Lcom/google/android/gms/measurement/internal/zzfs;->zzj()Lcom/google/android/gms/measurement/internal/zzed;

    move-result-object v13

    .line 74
    invoke-virtual {v3}, Lcom/google/android/gms/internal/measurement/zzfn;->zzo()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v13, v14}, Lcom/google/android/gms/measurement/internal/zzed;->zzc(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v13

    .line 75
    invoke-virtual {v7, v9, v13}, Lcom/google/android/gms/measurement/internal/zzeg;->zzb(Ljava/lang/String;Ljava/lang/Object;)V

    .line 76
    invoke-static {}, Lcom/google/android/gms/internal/measurement/zzfs;->zze()Lcom/google/android/gms/internal/measurement/zzfr;

    move-result-object v7

    .line 77
    invoke-virtual {v7, v12}, Lcom/google/android/gms/internal/measurement/zzfr;->zzj(Ljava/lang/String;)Lcom/google/android/gms/internal/measurement/zzfr;

    const-wide/16 v13, 0x1

    .line 78
    invoke-virtual {v7, v13, v14}, Lcom/google/android/gms/internal/measurement/zzfr;->zzi(J)Lcom/google/android/gms/internal/measurement/zzfr;

    .line 79
    invoke-virtual {v3, v7}, Lcom/google/android/gms/internal/measurement/zzfn;->zze(Lcom/google/android/gms/internal/measurement/zzfr;)Lcom/google/android/gms/internal/measurement/zzfn;

    :cond_10
    iget-object v7, v1, Lcom/google/android/gms/measurement/internal/zzkn;->zze:Lcom/google/android/gms/measurement/internal/zzaj;

    .line 80
    invoke-static {v7}, Lcom/google/android/gms/measurement/internal/zzkn;->zzak(Lcom/google/android/gms/measurement/internal/zzkd;)Lcom/google/android/gms/measurement/internal/zzkd;

    .line 81
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzkn;->zza()J

    move-result-wide v32

    iget-object v9, v6, Lcom/google/android/gms/measurement/internal/zzkm;->zza:Lcom/google/android/gms/internal/measurement/zzfy;

    .line 82
    invoke-virtual {v9}, Lcom/google/android/gms/internal/measurement/zzfy;->zzy()Ljava/lang/String;

    move-result-object v34

    const/16 v35, 0x0

    const/16 v36, 0x0

    const/16 v37, 0x0

    const/16 v38, 0x0

    const/16 v39, 0x1

    move-object/from16 v31, v7

    .line 83
    invoke-virtual/range {v31 .. v39}, Lcom/google/android/gms/measurement/internal/zzaj;->zzl(JLjava/lang/String;ZZZZZ)Lcom/google/android/gms/measurement/internal/zzah;

    move-result-object v7

    iget-wide v13, v7, Lcom/google/android/gms/measurement/internal/zzah;->zze:J

    .line 84
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzg()Lcom/google/android/gms/measurement/internal/zzaf;

    move-result-object v7

    iget-object v9, v6, Lcom/google/android/gms/measurement/internal/zzkm;->zza:Lcom/google/android/gms/internal/measurement/zzfy;

    invoke-virtual {v9}, Lcom/google/android/gms/internal/measurement/zzfy;->zzy()Ljava/lang/String;

    move-result-object v9

    sget-object v15, Lcom/google/android/gms/measurement/internal/zzdw;->zzn:Lcom/google/android/gms/measurement/internal/zzdv;

    invoke-virtual {v7, v9, v15}, Lcom/google/android/gms/measurement/internal/zzaf;->zze(Ljava/lang/String;Lcom/google/android/gms/measurement/internal/zzdv;)I

    move-result v7

    move v9, v8

    int-to-long v7, v7

    cmp-long v15, v13, v7

    if-lez v15, :cond_11

    .line 85
    invoke-static {v3, v12}, Lcom/google/android/gms/measurement/internal/zzkn;->zzZ(Lcom/google/android/gms/internal/measurement/zzfn;Ljava/lang/String;)V

    goto :goto_8

    :cond_11
    const/16 v20, 0x1

    .line 86
    :goto_8
    invoke-virtual {v3}, Lcom/google/android/gms/internal/measurement/zzfn;->zzo()Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Lcom/google/android/gms/measurement/internal/zzku;->zzah(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_18

    if-eqz v2, :cond_18

    iget-object v7, v1, Lcom/google/android/gms/measurement/internal/zzkn;->zze:Lcom/google/android/gms/measurement/internal/zzaj;

    .line 87
    invoke-static {v7}, Lcom/google/android/gms/measurement/internal/zzkn;->zzak(Lcom/google/android/gms/measurement/internal/zzkd;)Lcom/google/android/gms/measurement/internal/zzkd;

    .line 88
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzkn;->zza()J

    move-result-wide v32

    iget-object v8, v6, Lcom/google/android/gms/measurement/internal/zzkm;->zza:Lcom/google/android/gms/internal/measurement/zzfy;

    .line 89
    invoke-virtual {v8}, Lcom/google/android/gms/internal/measurement/zzfy;->zzy()Ljava/lang/String;

    move-result-object v34

    const/16 v35, 0x0

    const/16 v36, 0x0

    const/16 v37, 0x1

    const/16 v38, 0x0

    const/16 v39, 0x0

    move-object/from16 v31, v7

    .line 90
    invoke-virtual/range {v31 .. v39}, Lcom/google/android/gms/measurement/internal/zzaj;->zzl(JLjava/lang/String;ZZZZZ)Lcom/google/android/gms/measurement/internal/zzah;

    move-result-object v7

    iget-wide v7, v7, Lcom/google/android/gms/measurement/internal/zzah;->zzc:J

    .line 91
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzg()Lcom/google/android/gms/measurement/internal/zzaf;

    move-result-object v12

    iget-object v13, v6, Lcom/google/android/gms/measurement/internal/zzkm;->zza:Lcom/google/android/gms/internal/measurement/zzfy;

    invoke-virtual {v13}, Lcom/google/android/gms/internal/measurement/zzfy;->zzy()Ljava/lang/String;

    move-result-object v13

    sget-object v14, Lcom/google/android/gms/measurement/internal/zzdw;->zzm:Lcom/google/android/gms/measurement/internal/zzdv;

    invoke-virtual {v12, v13, v14}, Lcom/google/android/gms/measurement/internal/zzaf;->zze(Ljava/lang/String;Lcom/google/android/gms/measurement/internal/zzdv;)I

    move-result v12

    int-to-long v12, v12

    cmp-long v14, v7, v12

    if-lez v14, :cond_18

    .line 92
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzay()Lcom/google/android/gms/measurement/internal/zzei;

    move-result-object v7

    .line 93
    invoke-virtual {v7}, Lcom/google/android/gms/measurement/internal/zzei;->zzk()Lcom/google/android/gms/measurement/internal/zzeg;

    move-result-object v7

    const-string v8, "Too many conversions. Not logging as conversion. appId"

    iget-object v12, v6, Lcom/google/android/gms/measurement/internal/zzkm;->zza:Lcom/google/android/gms/internal/measurement/zzfy;

    .line 94
    invoke-virtual {v12}, Lcom/google/android/gms/internal/measurement/zzfy;->zzy()Ljava/lang/String;

    move-result-object v12

    invoke-static {v12}, Lcom/google/android/gms/measurement/internal/zzei;->zzn(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v12

    .line 95
    invoke-virtual {v7, v8, v12}, Lcom/google/android/gms/measurement/internal/zzeg;->zzb(Ljava/lang/String;Ljava/lang/Object;)V

    const/4 v7, 0x0

    const/4 v8, 0x0

    const/4 v12, 0x0

    const/4 v13, -0x1

    .line 96
    :goto_9
    invoke-virtual {v3}, Lcom/google/android/gms/internal/measurement/zzfn;->zza()I

    move-result v14

    if-ge v8, v14, :cond_14

    .line 97
    invoke-virtual {v3, v8}, Lcom/google/android/gms/internal/measurement/zzfn;->zzn(I)Lcom/google/android/gms/internal/measurement/zzfs;

    move-result-object v14

    .line 98
    invoke-virtual {v14}, Lcom/google/android/gms/internal/measurement/zzfs;->zzg()Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v5, v15}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v15

    if-eqz v15, :cond_12

    .line 99
    invoke-virtual {v14}, Lcom/google/android/gms/internal/measurement/zzjz;->zzbv()Lcom/google/android/gms/internal/measurement/zzjv;

    move-result-object v7

    check-cast v7, Lcom/google/android/gms/internal/measurement/zzfr;

    move v13, v8

    goto :goto_a

    .line 100
    :cond_12
    invoke-virtual {v14}, Lcom/google/android/gms/internal/measurement/zzfs;->zzg()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v10, v14}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v14

    if-eqz v14, :cond_13

    const/4 v12, 0x1

    :cond_13
    :goto_a
    add-int/lit8 v8, v8, 0x1

    goto :goto_9

    :cond_14
    if-eqz v12, :cond_16

    if-eqz v7, :cond_15

    .line 110
    invoke-virtual {v3, v13}, Lcom/google/android/gms/internal/measurement/zzfn;->zzh(I)Lcom/google/android/gms/internal/measurement/zzfn;

    goto :goto_b

    :cond_15
    const/4 v7, 0x0

    :cond_16
    if-eqz v7, :cond_17

    .line 101
    invoke-virtual {v7}, Lcom/google/android/gms/internal/measurement/zzjv;->zzax()Lcom/google/android/gms/internal/measurement/zzjv;

    move-result-object v7

    check-cast v7, Lcom/google/android/gms/internal/measurement/zzfr;

    .line 102
    invoke-virtual {v7, v10}, Lcom/google/android/gms/internal/measurement/zzfr;->zzj(Ljava/lang/String;)Lcom/google/android/gms/internal/measurement/zzfr;

    const-wide/16 v14, 0xa

    .line 103
    invoke-virtual {v7, v14, v15}, Lcom/google/android/gms/internal/measurement/zzfr;->zzi(J)Lcom/google/android/gms/internal/measurement/zzfr;

    .line 104
    invoke-virtual {v7}, Lcom/google/android/gms/internal/measurement/zzjv;->zzaA()Lcom/google/android/gms/internal/measurement/zzjz;

    move-result-object v7

    check-cast v7, Lcom/google/android/gms/internal/measurement/zzfs;

    .line 105
    invoke-virtual {v3, v13, v7}, Lcom/google/android/gms/internal/measurement/zzfn;->zzk(ILcom/google/android/gms/internal/measurement/zzfs;)Lcom/google/android/gms/internal/measurement/zzfn;

    goto :goto_b

    .line 106
    :cond_17
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzay()Lcom/google/android/gms/measurement/internal/zzei;

    move-result-object v7

    .line 107
    invoke-virtual {v7}, Lcom/google/android/gms/measurement/internal/zzei;->zzd()Lcom/google/android/gms/measurement/internal/zzeg;

    move-result-object v7

    const-string v8, "Did not find conversion parameter. appId"

    iget-object v10, v6, Lcom/google/android/gms/measurement/internal/zzkm;->zza:Lcom/google/android/gms/internal/measurement/zzfy;

    .line 108
    invoke-virtual {v10}, Lcom/google/android/gms/internal/measurement/zzfy;->zzy()Ljava/lang/String;

    move-result-object v10

    invoke-static {v10}, Lcom/google/android/gms/measurement/internal/zzei;->zzn(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v10

    .line 109
    invoke-virtual {v7, v8, v10}, Lcom/google/android/gms/measurement/internal/zzeg;->zzb(Ljava/lang/String;Ljava/lang/Object;)V

    :cond_18
    :goto_b
    if-eqz v2, :cond_20

    .line 50
    new-instance v2, Ljava/util/ArrayList;

    .line 111
    invoke-virtual {v3}, Lcom/google/android/gms/internal/measurement/zzfn;->zzp()Ljava/util/List;

    move-result-object v7

    invoke-direct {v2, v7}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    const/4 v7, 0x0

    const/4 v8, -0x1

    const/4 v10, -0x1

    .line 112
    :goto_c
    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v12
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    const-string v13, "currency"

    const-string/jumbo v14, "value"

    if-ge v7, v12, :cond_1b

    .line 113
    :try_start_6
    invoke-interface {v2, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Lcom/google/android/gms/internal/measurement/zzfs;

    invoke-virtual {v12}, Lcom/google/android/gms/internal/measurement/zzfs;->zzg()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v14, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_19

    move v8, v7

    goto :goto_d

    .line 114
    :cond_19
    invoke-interface {v2, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Lcom/google/android/gms/internal/measurement/zzfs;

    invoke-virtual {v12}, Lcom/google/android/gms/internal/measurement/zzfs;->zzg()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v13, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_1a

    move v10, v7

    :cond_1a
    :goto_d
    add-int/lit8 v7, v7, 0x1

    goto :goto_c

    :cond_1b
    const/4 v7, -0x1

    if-ne v8, v7, :cond_1c

    goto/16 :goto_11

    .line 115
    :cond_1c
    invoke-interface {v2, v8}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/google/android/gms/internal/measurement/zzfs;

    invoke-virtual {v7}, Lcom/google/android/gms/internal/measurement/zzfs;->zzw()Z

    move-result v7

    if-nez v7, :cond_1d

    invoke-interface {v2, v8}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/google/android/gms/internal/measurement/zzfs;

    invoke-virtual {v7}, Lcom/google/android/gms/internal/measurement/zzfs;->zzu()Z

    move-result v7

    if-nez v7, :cond_1d

    .line 128
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzay()Lcom/google/android/gms/measurement/internal/zzei;

    move-result-object v2

    invoke-virtual {v2}, Lcom/google/android/gms/measurement/internal/zzei;->zzl()Lcom/google/android/gms/measurement/internal/zzeg;

    move-result-object v2

    const-string v7, "Value must be specified with a numeric type."

    invoke-virtual {v2, v7}, Lcom/google/android/gms/measurement/internal/zzeg;->zza(Ljava/lang/String;)V

    .line 129
    invoke-virtual {v3, v8}, Lcom/google/android/gms/internal/measurement/zzfn;->zzh(I)Lcom/google/android/gms/internal/measurement/zzfn;

    .line 130
    invoke-static {v3, v5}, Lcom/google/android/gms/measurement/internal/zzkn;->zzZ(Lcom/google/android/gms/internal/measurement/zzfn;Ljava/lang/String;)V

    const/16 v2, 0x12

    .line 131
    invoke-static {v3, v2, v14}, Lcom/google/android/gms/measurement/internal/zzkn;->zzY(Lcom/google/android/gms/internal/measurement/zzfn;ILjava/lang/String;)V

    goto :goto_10

    :cond_1d
    const/4 v7, -0x1

    if-ne v10, v7, :cond_1e

    goto :goto_f

    .line 116
    :cond_1e
    invoke-interface {v2, v10}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/google/android/gms/internal/measurement/zzfs;

    invoke-virtual {v2}, Lcom/google/android/gms/internal/measurement/zzfs;->zzh()Ljava/lang/String;

    move-result-object v2

    .line 117
    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v10

    const/4 v12, 0x3

    if-ne v10, v12, :cond_1f

    const/4 v10, 0x0

    .line 118
    :goto_e
    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v12

    if-ge v10, v12, :cond_21

    .line 119
    invoke-virtual {v2, v10}, Ljava/lang/String;->codePointAt(I)I

    move-result v12

    .line 120
    invoke-static {v12}, Ljava/lang/Character;->isLetter(I)Z

    move-result v14

    if-eqz v14, :cond_1f

    .line 121
    invoke-static {v12}, Ljava/lang/Character;->charCount(I)I

    move-result v12

    add-int/2addr v10, v12

    goto :goto_e

    .line 122
    :cond_1f
    :goto_f
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzay()Lcom/google/android/gms/measurement/internal/zzei;

    move-result-object v2

    .line 123
    invoke-virtual {v2}, Lcom/google/android/gms/measurement/internal/zzei;->zzl()Lcom/google/android/gms/measurement/internal/zzeg;

    move-result-object v2

    const-string v10, "Value parameter discarded. You must also supply a 3-letter ISO_4217 currency code in the currency parameter."

    .line 124
    invoke-virtual {v2, v10}, Lcom/google/android/gms/measurement/internal/zzeg;->zza(Ljava/lang/String;)V

    .line 125
    invoke-virtual {v3, v8}, Lcom/google/android/gms/internal/measurement/zzfn;->zzh(I)Lcom/google/android/gms/internal/measurement/zzfn;

    .line 126
    invoke-static {v3, v5}, Lcom/google/android/gms/measurement/internal/zzkn;->zzZ(Lcom/google/android/gms/internal/measurement/zzfn;Ljava/lang/String;)V

    const/16 v2, 0x13

    .line 127
    invoke-static {v3, v2, v13}, Lcom/google/android/gms/measurement/internal/zzkn;->zzY(Lcom/google/android/gms/internal/measurement/zzfn;ILjava/lang/String;)V

    goto :goto_11

    :cond_20
    :goto_10
    const/4 v7, -0x1

    .line 132
    :cond_21
    :goto_11
    invoke-virtual {v3}, Lcom/google/android/gms/internal/measurement/zzfn;->zzo()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v4, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    const-wide/16 v12, 0x3e8

    if-eqz v2, :cond_25

    iget-object v2, v1, Lcom/google/android/gms/measurement/internal/zzkn;->zzi:Lcom/google/android/gms/measurement/internal/zzkp;

    .line 133
    invoke-static {v2}, Lcom/google/android/gms/measurement/internal/zzkn;->zzak(Lcom/google/android/gms/measurement/internal/zzkd;)Lcom/google/android/gms/measurement/internal/zzkd;

    .line 134
    invoke-virtual {v3}, Lcom/google/android/gms/internal/measurement/zzjv;->zzaA()Lcom/google/android/gms/internal/measurement/zzjz;

    move-result-object v2

    check-cast v2, Lcom/google/android/gms/internal/measurement/zzfo;

    invoke-static {v2, v11}, Lcom/google/android/gms/measurement/internal/zzkp;->zzC(Lcom/google/android/gms/internal/measurement/zzfo;Ljava/lang/String;)Lcom/google/android/gms/internal/measurement/zzfs;

    move-result-object v2

    if-nez v2, :cond_24

    if-eqz v19, :cond_23

    .line 135
    invoke-virtual/range {v19 .. v19}, Lcom/google/android/gms/internal/measurement/zzfn;->zzc()J

    move-result-wide v10

    invoke-virtual {v3}, Lcom/google/android/gms/internal/measurement/zzfn;->zzc()J

    move-result-wide v14

    sub-long/2addr v10, v14

    invoke-static {v10, v11}, Ljava/lang/Math;->abs(J)J

    move-result-wide v10

    cmp-long v2, v10, v12

    if-gtz v2, :cond_23

    .line 136
    invoke-virtual/range {v19 .. v19}, Lcom/google/android/gms/internal/measurement/zzjv;->zzax()Lcom/google/android/gms/internal/measurement/zzjv;

    move-result-object v2

    check-cast v2, Lcom/google/android/gms/internal/measurement/zzfn;

    .line 137
    invoke-direct {v1, v3, v2}, Lcom/google/android/gms/measurement/internal/zzkn;->zzaj(Lcom/google/android/gms/internal/measurement/zzfn;Lcom/google/android/gms/internal/measurement/zzfn;)Z

    move-result v5

    if-eqz v5, :cond_22

    move-object/from16 v5, v30

    .line 138
    invoke-virtual {v5, v9, v2}, Lcom/google/android/gms/internal/measurement/zzfx;->zzO(ILcom/google/android/gms/internal/measurement/zzfn;)Lcom/google/android/gms/internal/measurement/zzfx;

    move/from16 v14, v21

    const/4 v2, 0x0

    const/16 v19, 0x0

    goto :goto_12

    :cond_22
    move-object/from16 v5, v30

    move-object v2, v3

    move/from16 v14, v17

    :goto_12
    move-object/from16 v18, v2

    move v12, v14

    goto :goto_13

    :cond_23
    move-object/from16 v5, v30

    move-object/from16 v18, v3

    move/from16 v12, v17

    :goto_13
    move-object/from16 v14, v23

    move-object/from16 v11, v24

    move-object/from16 v8, v26

    goto/16 :goto_18

    :cond_24
    move-object/from16 v5, v30

    move/from16 v12, v21

    goto :goto_13

    :cond_25
    move-object/from16 v5, v30

    const-string v2, "_vs"

    .line 139
    invoke-virtual {v3}, Lcom/google/android/gms/internal/measurement/zzfn;->zzo()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v2, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2a

    iget-object v2, v1, Lcom/google/android/gms/measurement/internal/zzkn;->zzi:Lcom/google/android/gms/measurement/internal/zzkp;

    .line 140
    invoke-static {v2}, Lcom/google/android/gms/measurement/internal/zzkn;->zzak(Lcom/google/android/gms/measurement/internal/zzkd;)Lcom/google/android/gms/measurement/internal/zzkd;

    .line 141
    invoke-virtual {v3}, Lcom/google/android/gms/internal/measurement/zzjv;->zzaA()Lcom/google/android/gms/internal/measurement/zzjz;

    move-result-object v2

    check-cast v2, Lcom/google/android/gms/internal/measurement/zzfo;

    move-object/from16 v8, v26

    invoke-static {v2, v8}, Lcom/google/android/gms/measurement/internal/zzkp;->zzC(Lcom/google/android/gms/internal/measurement/zzfo;Ljava/lang/String;)Lcom/google/android/gms/internal/measurement/zzfs;

    move-result-object v2

    if-nez v2, :cond_29

    if-eqz v18, :cond_27

    .line 142
    invoke-virtual/range {v18 .. v18}, Lcom/google/android/gms/internal/measurement/zzfn;->zzc()J

    move-result-wide v10

    invoke-virtual {v3}, Lcom/google/android/gms/internal/measurement/zzfn;->zzc()J

    move-result-wide v14

    sub-long/2addr v10, v14

    invoke-static {v10, v11}, Ljava/lang/Math;->abs(J)J

    move-result-wide v10

    cmp-long v2, v10, v12

    if-gtz v2, :cond_27

    .line 143
    invoke-virtual/range {v18 .. v18}, Lcom/google/android/gms/internal/measurement/zzjv;->zzax()Lcom/google/android/gms/internal/measurement/zzjv;

    move-result-object v2

    check-cast v2, Lcom/google/android/gms/internal/measurement/zzfn;

    .line 144
    invoke-direct {v1, v2, v3}, Lcom/google/android/gms/measurement/internal/zzkn;->zzaj(Lcom/google/android/gms/internal/measurement/zzfn;Lcom/google/android/gms/internal/measurement/zzfn;)Z

    move-result v10

    if-eqz v10, :cond_26

    move/from16 v12, v21

    .line 145
    invoke-virtual {v5, v12, v2}, Lcom/google/android/gms/internal/measurement/zzfx;->zzO(ILcom/google/android/gms/internal/measurement/zzfn;)Lcom/google/android/gms/internal/measurement/zzfx;

    const/4 v2, 0x0

    const/16 v18, 0x0

    goto :goto_14

    :cond_26
    move/from16 v12, v21

    move-object v2, v3

    move/from16 v9, v17

    :goto_14
    move-object/from16 v19, v2

    goto :goto_15

    :cond_27
    move/from16 v12, v21

    move-object/from16 v19, v3

    move/from16 v9, v17

    :cond_28
    :goto_15
    move-object/from16 v14, v23

    move-object/from16 v11, v24

    goto/16 :goto_18

    :cond_29
    move/from16 v12, v21

    goto :goto_15

    :cond_2a
    move/from16 v12, v21

    move-object/from16 v8, v26

    .line 146
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzg()Lcom/google/android/gms/measurement/internal/zzaf;

    move-result-object v2

    iget-object v10, v6, Lcom/google/android/gms/measurement/internal/zzkm;->zza:Lcom/google/android/gms/internal/measurement/zzfy;

    .line 147
    invoke-virtual {v10}, Lcom/google/android/gms/internal/measurement/zzfy;->zzy()Ljava/lang/String;

    move-result-object v10

    sget-object v11, Lcom/google/android/gms/measurement/internal/zzdw;->zzag:Lcom/google/android/gms/measurement/internal/zzdv;

    invoke-virtual {v2, v10, v11}, Lcom/google/android/gms/measurement/internal/zzaf;->zzs(Ljava/lang/String;Lcom/google/android/gms/measurement/internal/zzdv;)Z

    move-result v2

    if-eqz v2, :cond_28

    const-string v2, "_ab"

    .line 148
    invoke-virtual {v3}, Lcom/google/android/gms/internal/measurement/zzfn;->zzo()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v2, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_28

    iget-object v2, v1, Lcom/google/android/gms/measurement/internal/zzkn;->zzi:Lcom/google/android/gms/measurement/internal/zzkp;

    .line 149
    invoke-static {v2}, Lcom/google/android/gms/measurement/internal/zzkn;->zzak(Lcom/google/android/gms/measurement/internal/zzkd;)Lcom/google/android/gms/measurement/internal/zzkd;

    .line 150
    invoke-virtual {v3}, Lcom/google/android/gms/internal/measurement/zzjv;->zzaA()Lcom/google/android/gms/internal/measurement/zzjz;

    move-result-object v2

    check-cast v2, Lcom/google/android/gms/internal/measurement/zzfo;

    invoke-static {v2, v8}, Lcom/google/android/gms/measurement/internal/zzkp;->zzC(Lcom/google/android/gms/internal/measurement/zzfo;Ljava/lang/String;)Lcom/google/android/gms/internal/measurement/zzfs;

    move-result-object v2

    if-nez v2, :cond_28

    if-eqz v18, :cond_28

    .line 151
    invoke-virtual/range {v18 .. v18}, Lcom/google/android/gms/internal/measurement/zzfn;->zzc()J

    move-result-wide v10

    invoke-virtual {v3}, Lcom/google/android/gms/internal/measurement/zzfn;->zzc()J

    move-result-wide v13

    sub-long/2addr v10, v13

    invoke-static {v10, v11}, Ljava/lang/Math;->abs(J)J

    move-result-wide v10

    const-wide/16 v13, 0xfa0

    cmp-long v2, v10, v13

    if-gtz v2, :cond_28

    .line 152
    invoke-virtual/range {v18 .. v18}, Lcom/google/android/gms/internal/measurement/zzjv;->zzax()Lcom/google/android/gms/internal/measurement/zzjv;

    move-result-object v2

    check-cast v2, Lcom/google/android/gms/internal/measurement/zzfn;

    .line 153
    invoke-direct {v1, v2, v3}, Lcom/google/android/gms/measurement/internal/zzkn;->zzae(Lcom/google/android/gms/internal/measurement/zzfn;Lcom/google/android/gms/internal/measurement/zzfn;)V

    .line 154
    invoke-virtual {v2}, Lcom/google/android/gms/internal/measurement/zzfn;->zzo()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v4, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    .line 155
    invoke-static {v10}, Lcom/google/android/gms/common/internal/Preconditions;->checkArgument(Z)V

    iget-object v10, v1, Lcom/google/android/gms/measurement/internal/zzkn;->zzi:Lcom/google/android/gms/measurement/internal/zzkp;

    .line 156
    invoke-static {v10}, Lcom/google/android/gms/measurement/internal/zzkn;->zzak(Lcom/google/android/gms/measurement/internal/zzkd;)Lcom/google/android/gms/measurement/internal/zzkd;

    .line 157
    invoke-virtual {v2}, Lcom/google/android/gms/internal/measurement/zzjv;->zzaA()Lcom/google/android/gms/internal/measurement/zzjz;

    move-result-object v10

    check-cast v10, Lcom/google/android/gms/internal/measurement/zzfo;

    move-object/from16 v11, v24

    invoke-static {v10, v11}, Lcom/google/android/gms/measurement/internal/zzkp;->zzC(Lcom/google/android/gms/internal/measurement/zzfo;Ljava/lang/String;)Lcom/google/android/gms/internal/measurement/zzfs;

    move-result-object v10

    iget-object v13, v1, Lcom/google/android/gms/measurement/internal/zzkn;->zzi:Lcom/google/android/gms/measurement/internal/zzkp;

    .line 158
    invoke-static {v13}, Lcom/google/android/gms/measurement/internal/zzkn;->zzak(Lcom/google/android/gms/measurement/internal/zzkd;)Lcom/google/android/gms/measurement/internal/zzkd;

    .line 159
    invoke-virtual {v2}, Lcom/google/android/gms/internal/measurement/zzjv;->zzaA()Lcom/google/android/gms/internal/measurement/zzjz;

    move-result-object v13

    check-cast v13, Lcom/google/android/gms/internal/measurement/zzfo;

    move-object/from16 v14, v23

    invoke-static {v13, v14}, Lcom/google/android/gms/measurement/internal/zzkp;->zzC(Lcom/google/android/gms/internal/measurement/zzfo;Ljava/lang/String;)Lcom/google/android/gms/internal/measurement/zzfs;

    move-result-object v13

    iget-object v15, v1, Lcom/google/android/gms/measurement/internal/zzkn;->zzi:Lcom/google/android/gms/measurement/internal/zzkp;

    .line 160
    invoke-static {v15}, Lcom/google/android/gms/measurement/internal/zzkn;->zzak(Lcom/google/android/gms/measurement/internal/zzkd;)Lcom/google/android/gms/measurement/internal/zzkd;

    .line 161
    invoke-virtual {v2}, Lcom/google/android/gms/internal/measurement/zzjv;->zzaA()Lcom/google/android/gms/internal/measurement/zzjz;

    move-result-object v15

    check-cast v15, Lcom/google/android/gms/internal/measurement/zzfo;

    const-string v7, "_si"

    invoke-static {v15, v7}, Lcom/google/android/gms/measurement/internal/zzkp;->zzC(Lcom/google/android/gms/internal/measurement/zzfo;Ljava/lang/String;)Lcom/google/android/gms/internal/measurement/zzfs;

    move-result-object v7

    if-eqz v10, :cond_2b

    invoke-virtual {v10}, Lcom/google/android/gms/internal/measurement/zzfs;->zzh()Ljava/lang/String;

    move-result-object v10

    goto :goto_16

    :cond_2b
    const-string v10, ""

    .line 162
    :goto_16
    invoke-static {v10}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v15

    if-nez v15, :cond_2c

    iget-object v15, v1, Lcom/google/android/gms/measurement/internal/zzkn;->zzi:Lcom/google/android/gms/measurement/internal/zzkp;

    .line 163
    invoke-static {v15}, Lcom/google/android/gms/measurement/internal/zzkn;->zzak(Lcom/google/android/gms/measurement/internal/zzkd;)Lcom/google/android/gms/measurement/internal/zzkd;

    .line 164
    invoke-static {v3, v11, v10}, Lcom/google/android/gms/measurement/internal/zzkp;->zzA(Lcom/google/android/gms/internal/measurement/zzfn;Ljava/lang/String;Ljava/lang/Object;)V

    :cond_2c
    if-eqz v13, :cond_2d

    invoke-virtual {v13}, Lcom/google/android/gms/internal/measurement/zzfs;->zzh()Ljava/lang/String;

    move-result-object v10

    goto :goto_17

    :cond_2d
    const-string v10, ""

    .line 165
    :goto_17
    invoke-static {v10}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v13

    if-nez v13, :cond_2e

    iget-object v13, v1, Lcom/google/android/gms/measurement/internal/zzkn;->zzi:Lcom/google/android/gms/measurement/internal/zzkp;

    .line 166
    invoke-static {v13}, Lcom/google/android/gms/measurement/internal/zzkn;->zzak(Lcom/google/android/gms/measurement/internal/zzkd;)Lcom/google/android/gms/measurement/internal/zzkd;

    .line 167
    invoke-static {v3, v14, v10}, Lcom/google/android/gms/measurement/internal/zzkp;->zzA(Lcom/google/android/gms/internal/measurement/zzfn;Ljava/lang/String;Ljava/lang/Object;)V

    :cond_2e
    if-eqz v7, :cond_2f

    iget-object v10, v1, Lcom/google/android/gms/measurement/internal/zzkn;->zzi:Lcom/google/android/gms/measurement/internal/zzkp;

    .line 168
    invoke-static {v10}, Lcom/google/android/gms/measurement/internal/zzkn;->zzak(Lcom/google/android/gms/measurement/internal/zzkd;)Lcom/google/android/gms/measurement/internal/zzkd;

    const-string v10, "_si"

    invoke-virtual {v7}, Lcom/google/android/gms/internal/measurement/zzfs;->zzd()J

    move-result-wide v23

    .line 169
    invoke-static/range {v23 .. v24}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v7

    invoke-static {v3, v10, v7}, Lcom/google/android/gms/measurement/internal/zzkp;->zzA(Lcom/google/android/gms/internal/measurement/zzfn;Ljava/lang/String;Ljava/lang/Object;)V

    .line 170
    :cond_2f
    invoke-virtual {v5, v12, v2}, Lcom/google/android/gms/internal/measurement/zzfx;->zzO(ILcom/google/android/gms/internal/measurement/zzfn;)Lcom/google/android/gms/internal/measurement/zzfx;

    const/16 v18, 0x0

    :goto_18
    if-nez v16, :cond_32

    .line 171
    invoke-virtual {v3}, Lcom/google/android/gms/internal/measurement/zzfn;->zzo()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v4, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_32

    .line 172
    invoke-virtual {v3}, Lcom/google/android/gms/internal/measurement/zzfn;->zza()I

    move-result v2

    if-nez v2, :cond_30

    .line 180
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzay()Lcom/google/android/gms/measurement/internal/zzei;

    move-result-object v2

    .line 181
    invoke-virtual {v2}, Lcom/google/android/gms/measurement/internal/zzei;->zzk()Lcom/google/android/gms/measurement/internal/zzeg;

    move-result-object v2

    const-string v4, "Engagement event does not contain any parameters. appId"

    iget-object v7, v6, Lcom/google/android/gms/measurement/internal/zzkm;->zza:Lcom/google/android/gms/internal/measurement/zzfy;

    .line 182
    invoke-virtual {v7}, Lcom/google/android/gms/internal/measurement/zzfy;->zzy()Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Lcom/google/android/gms/measurement/internal/zzei;->zzn(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v7

    .line 183
    invoke-virtual {v2, v4, v7}, Lcom/google/android/gms/measurement/internal/zzeg;->zzb(Ljava/lang/String;Ljava/lang/Object;)V

    goto :goto_19

    .line 185
    :cond_30
    iget-object v2, v1, Lcom/google/android/gms/measurement/internal/zzkn;->zzi:Lcom/google/android/gms/measurement/internal/zzkp;

    .line 173
    invoke-static {v2}, Lcom/google/android/gms/measurement/internal/zzkn;->zzak(Lcom/google/android/gms/measurement/internal/zzkd;)Lcom/google/android/gms/measurement/internal/zzkd;

    .line 174
    invoke-virtual {v3}, Lcom/google/android/gms/internal/measurement/zzjv;->zzaA()Lcom/google/android/gms/internal/measurement/zzjz;

    move-result-object v2

    check-cast v2, Lcom/google/android/gms/internal/measurement/zzfo;

    invoke-static {v2, v8}, Lcom/google/android/gms/measurement/internal/zzkp;->zzD(Lcom/google/android/gms/internal/measurement/zzfo;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Long;

    if-nez v2, :cond_31

    .line 175
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzay()Lcom/google/android/gms/measurement/internal/zzei;

    move-result-object v2

    .line 176
    invoke-virtual {v2}, Lcom/google/android/gms/measurement/internal/zzei;->zzk()Lcom/google/android/gms/measurement/internal/zzeg;

    move-result-object v2

    const-string v4, "Engagement event does not include duration. appId"

    iget-object v7, v6, Lcom/google/android/gms/measurement/internal/zzkm;->zza:Lcom/google/android/gms/internal/measurement/zzfy;

    .line 177
    invoke-virtual {v7}, Lcom/google/android/gms/internal/measurement/zzfy;->zzy()Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Lcom/google/android/gms/measurement/internal/zzei;->zzn(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v7

    .line 178
    invoke-virtual {v2, v4, v7}, Lcom/google/android/gms/measurement/internal/zzeg;->zzb(Ljava/lang/String;Ljava/lang/Object;)V

    goto :goto_19

    .line 179
    :cond_31
    invoke-virtual {v2}, Ljava/lang/Long;->longValue()J

    move-result-wide v7

    add-long v7, v28, v7

    move-wide/from16 v28, v7

    .line 183
    :cond_32
    :goto_19
    iget-object v2, v6, Lcom/google/android/gms/measurement/internal/zzkm;->zzc:Ljava/util/List;

    .line 184
    invoke-virtual {v3}, Lcom/google/android/gms/internal/measurement/zzjv;->zzaA()Lcom/google/android/gms/internal/measurement/zzjz;

    move-result-object v4

    check-cast v4, Lcom/google/android/gms/internal/measurement/zzfo;

    move/from16 v8, v25

    invoke-interface {v2, v8, v4}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    add-int/lit8 v17, v17, 0x1

    .line 185
    invoke-virtual {v5, v3}, Lcom/google/android/gms/internal/measurement/zzfx;->zzj(Lcom/google/android/gms/internal/measurement/zzfn;)Lcom/google/android/gms/internal/measurement/zzfx;

    :goto_1a
    add-int/lit8 v13, v8, 0x1

    move-object v7, v5

    move v8, v9

    move-object v3, v11

    move-object v2, v14

    move/from16 v9, v16

    move-object/from16 v4, v22

    move-object/from16 v5, v27

    move-wide/from16 v15, v28

    move v14, v12

    goto/16 :goto_0

    :cond_33
    move-object v5, v7

    move-object v8, v12

    move-wide/from16 v28, v15

    move/from16 v16, v9

    if-eqz v16, :cond_38

    move/from16 v3, v17

    move-wide/from16 v15, v28

    const/4 v2, 0x0

    :goto_1b
    if-ge v2, v3, :cond_37

    .line 186
    invoke-virtual {v5, v2}, Lcom/google/android/gms/internal/measurement/zzfx;->zze(I)Lcom/google/android/gms/internal/measurement/zzfo;

    move-result-object v7

    .line 187
    invoke-virtual {v7}, Lcom/google/android/gms/internal/measurement/zzfo;->zzh()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v4, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_34

    iget-object v9, v1, Lcom/google/android/gms/measurement/internal/zzkn;->zzi:Lcom/google/android/gms/measurement/internal/zzkp;

    .line 188
    invoke-static {v9}, Lcom/google/android/gms/measurement/internal/zzkn;->zzak(Lcom/google/android/gms/measurement/internal/zzkd;)Lcom/google/android/gms/measurement/internal/zzkd;

    .line 189
    invoke-static {v7, v11}, Lcom/google/android/gms/measurement/internal/zzkp;->zzC(Lcom/google/android/gms/internal/measurement/zzfo;Ljava/lang/String;)Lcom/google/android/gms/internal/measurement/zzfs;

    move-result-object v9

    if-eqz v9, :cond_34

    .line 195
    invoke-virtual {v5, v2}, Lcom/google/android/gms/internal/measurement/zzfx;->zzw(I)Lcom/google/android/gms/internal/measurement/zzfx;

    add-int/lit8 v3, v3, -0x1

    add-int/lit8 v2, v2, -0x1

    goto :goto_1d

    :cond_34
    iget-object v9, v1, Lcom/google/android/gms/measurement/internal/zzkn;->zzi:Lcom/google/android/gms/measurement/internal/zzkp;

    .line 190
    invoke-static {v9}, Lcom/google/android/gms/measurement/internal/zzkn;->zzak(Lcom/google/android/gms/measurement/internal/zzkd;)Lcom/google/android/gms/measurement/internal/zzkd;

    .line 191
    invoke-static {v7, v8}, Lcom/google/android/gms/measurement/internal/zzkp;->zzC(Lcom/google/android/gms/internal/measurement/zzfo;Ljava/lang/String;)Lcom/google/android/gms/internal/measurement/zzfs;

    move-result-object v7

    if-eqz v7, :cond_36

    invoke-virtual {v7}, Lcom/google/android/gms/internal/measurement/zzfs;->zzw()Z

    move-result v9

    if-eqz v9, :cond_35

    invoke-virtual {v7}, Lcom/google/android/gms/internal/measurement/zzfs;->zzd()J

    move-result-wide v9

    .line 192
    invoke-static {v9, v10}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v7

    goto :goto_1c

    :cond_35
    const/4 v7, 0x0

    :goto_1c
    if-eqz v7, :cond_36

    .line 193
    invoke-virtual {v7}, Ljava/lang/Long;->longValue()J

    move-result-wide v9

    const-wide/16 v12, 0x0

    cmp-long v14, v9, v12

    if-lez v14, :cond_36

    .line 194
    invoke-virtual {v7}, Ljava/lang/Long;->longValue()J

    move-result-wide v9

    add-long/2addr v15, v9

    :cond_36
    :goto_1d
    const/4 v7, 0x1

    add-int/2addr v2, v7

    goto :goto_1b

    :cond_37
    move-wide v2, v15

    goto :goto_1e

    :cond_38
    move-wide/from16 v2, v28

    :goto_1e
    const/4 v4, 0x0

    .line 196
    invoke-direct {v1, v5, v2, v3, v4}, Lcom/google/android/gms/measurement/internal/zzkn;->zzad(Lcom/google/android/gms/internal/measurement/zzfx;JZ)V

    .line 197
    invoke-virtual {v5}, Lcom/google/android/gms/internal/measurement/zzfx;->zzao()Ljava/util/List;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :cond_39
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v7
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    const-string v8, "_se"

    if-eqz v7, :cond_3a

    :try_start_7
    const-string v7, "_s"

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lcom/google/android/gms/internal/measurement/zzfo;

    .line 198
    invoke-virtual {v9}, Lcom/google/android/gms/internal/measurement/zzfo;->zzh()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v7, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_39

    iget-object v4, v1, Lcom/google/android/gms/measurement/internal/zzkn;->zze:Lcom/google/android/gms/measurement/internal/zzaj;

    .line 199
    invoke-static {v4}, Lcom/google/android/gms/measurement/internal/zzkn;->zzak(Lcom/google/android/gms/measurement/internal/zzkd;)Lcom/google/android/gms/measurement/internal/zzkd;

    .line 200
    invoke-virtual {v5}, Lcom/google/android/gms/internal/measurement/zzfx;->zzal()Ljava/lang/String;

    move-result-object v7

    .line 201
    invoke-virtual {v4, v7, v8}, Lcom/google/android/gms/measurement/internal/zzaj;->zzA(Ljava/lang/String;Ljava/lang/String;)V

    :cond_3a
    const-string v4, "_sid"

    .line 202
    invoke-static {v5, v4}, Lcom/google/android/gms/measurement/internal/zzkp;->zza(Lcom/google/android/gms/internal/measurement/zzfx;Ljava/lang/String;)I

    move-result v4

    if-ltz v4, :cond_3b

    const/4 v4, 0x1

    .line 203
    invoke-direct {v1, v5, v2, v3, v4}, Lcom/google/android/gms/measurement/internal/zzkn;->zzad(Lcom/google/android/gms/internal/measurement/zzfx;JZ)V

    goto :goto_1f

    .line 204
    :cond_3b
    invoke-static {v5, v8}, Lcom/google/android/gms/measurement/internal/zzkp;->zza(Lcom/google/android/gms/internal/measurement/zzfx;Ljava/lang/String;)I

    move-result v2

    if-ltz v2, :cond_3c

    .line 205
    invoke-virtual {v5, v2}, Lcom/google/android/gms/internal/measurement/zzfx;->zzx(I)Lcom/google/android/gms/internal/measurement/zzfx;

    .line 206
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzay()Lcom/google/android/gms/measurement/internal/zzei;

    move-result-object v2

    .line 207
    invoke-virtual {v2}, Lcom/google/android/gms/measurement/internal/zzei;->zzd()Lcom/google/android/gms/measurement/internal/zzeg;

    move-result-object v2

    const-string v3, "Session engagement user property is in the bundle without session ID. appId"

    iget-object v4, v6, Lcom/google/android/gms/measurement/internal/zzkm;->zza:Lcom/google/android/gms/internal/measurement/zzfy;

    .line 208
    invoke-virtual {v4}, Lcom/google/android/gms/internal/measurement/zzfy;->zzy()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lcom/google/android/gms/measurement/internal/zzei;->zzn(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v4

    .line 209
    invoke-virtual {v2, v3, v4}, Lcom/google/android/gms/measurement/internal/zzeg;->zzb(Ljava/lang/String;Ljava/lang/Object;)V

    .line 203
    :cond_3c
    :goto_1f
    iget-object v2, v1, Lcom/google/android/gms/measurement/internal/zzkn;->zzi:Lcom/google/android/gms/measurement/internal/zzkp;

    .line 210
    invoke-static {v2}, Lcom/google/android/gms/measurement/internal/zzkn;->zzak(Lcom/google/android/gms/measurement/internal/zzkd;)Lcom/google/android/gms/measurement/internal/zzkd;

    iget-object v3, v2, Lcom/google/android/gms/measurement/internal/zzgl;->zzs:Lcom/google/android/gms/measurement/internal/zzfs;

    .line 211
    invoke-virtual {v3}, Lcom/google/android/gms/measurement/internal/zzfs;->zzay()Lcom/google/android/gms/measurement/internal/zzei;

    move-result-object v3

    .line 212
    invoke-virtual {v3}, Lcom/google/android/gms/measurement/internal/zzei;->zzj()Lcom/google/android/gms/measurement/internal/zzeg;

    move-result-object v3

    const-string v4, "Checking account type status for ad personalization signals"

    invoke-virtual {v3, v4}, Lcom/google/android/gms/measurement/internal/zzeg;->zza(Ljava/lang/String;)V

    iget-object v3, v2, Lcom/google/android/gms/measurement/internal/zzkc;->zzf:Lcom/google/android/gms/measurement/internal/zzkn;

    iget-object v3, v3, Lcom/google/android/gms/measurement/internal/zzkn;->zzc:Lcom/google/android/gms/measurement/internal/zzfj;

    .line 213
    invoke-static {v3}, Lcom/google/android/gms/measurement/internal/zzkn;->zzak(Lcom/google/android/gms/measurement/internal/zzkd;)Lcom/google/android/gms/measurement/internal/zzkd;

    .line 214
    invoke-virtual {v5}, Lcom/google/android/gms/internal/measurement/zzfx;->zzal()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/google/android/gms/measurement/internal/zzfj;->zzk(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_3f

    iget-object v3, v2, Lcom/google/android/gms/measurement/internal/zzkc;->zzf:Lcom/google/android/gms/measurement/internal/zzkn;

    iget-object v3, v3, Lcom/google/android/gms/measurement/internal/zzkn;->zze:Lcom/google/android/gms/measurement/internal/zzaj;

    .line 215
    invoke-static {v3}, Lcom/google/android/gms/measurement/internal/zzkn;->zzak(Lcom/google/android/gms/measurement/internal/zzkd;)Lcom/google/android/gms/measurement/internal/zzkd;

    .line 216
    invoke-virtual {v5}, Lcom/google/android/gms/internal/measurement/zzfx;->zzal()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/google/android/gms/measurement/internal/zzaj;->zzj(Ljava/lang/String;)Lcom/google/android/gms/measurement/internal/zzg;

    move-result-object v3

    if-eqz v3, :cond_3f

    .line 217
    invoke-virtual {v3}, Lcom/google/android/gms/measurement/internal/zzg;->zzai()Z

    move-result v3

    if-eqz v3, :cond_3f

    iget-object v3, v2, Lcom/google/android/gms/measurement/internal/zzgl;->zzs:Lcom/google/android/gms/measurement/internal/zzfs;

    .line 218
    invoke-virtual {v3}, Lcom/google/android/gms/measurement/internal/zzfs;->zzg()Lcom/google/android/gms/measurement/internal/zzan;

    move-result-object v3

    .line 219
    invoke-virtual {v3}, Lcom/google/android/gms/measurement/internal/zzan;->zze()Z

    move-result v3

    if-eqz v3, :cond_3f

    iget-object v3, v2, Lcom/google/android/gms/measurement/internal/zzgl;->zzs:Lcom/google/android/gms/measurement/internal/zzfs;

    .line 220
    invoke-virtual {v3}, Lcom/google/android/gms/measurement/internal/zzfs;->zzay()Lcom/google/android/gms/measurement/internal/zzei;

    move-result-object v3

    .line 221
    invoke-virtual {v3}, Lcom/google/android/gms/measurement/internal/zzei;->zzc()Lcom/google/android/gms/measurement/internal/zzeg;

    move-result-object v3

    const-string v4, "Turning off ad personalization due to account type"

    invoke-virtual {v3, v4}, Lcom/google/android/gms/measurement/internal/zzeg;->zza(Ljava/lang/String;)V

    .line 222
    invoke-static {}, Lcom/google/android/gms/internal/measurement/zzgh;->zzd()Lcom/google/android/gms/internal/measurement/zzgg;

    move-result-object v3

    move-object/from16 v4, v22

    .line 223
    invoke-virtual {v3, v4}, Lcom/google/android/gms/internal/measurement/zzgg;->zzf(Ljava/lang/String;)Lcom/google/android/gms/internal/measurement/zzgg;

    iget-object v2, v2, Lcom/google/android/gms/measurement/internal/zzgl;->zzs:Lcom/google/android/gms/measurement/internal/zzfs;

    .line 224
    invoke-virtual {v2}, Lcom/google/android/gms/measurement/internal/zzfs;->zzg()Lcom/google/android/gms/measurement/internal/zzan;

    move-result-object v2

    .line 225
    invoke-virtual {v2}, Lcom/google/android/gms/measurement/internal/zzan;->zza()J

    move-result-wide v7

    invoke-virtual {v3, v7, v8}, Lcom/google/android/gms/internal/measurement/zzgg;->zzg(J)Lcom/google/android/gms/internal/measurement/zzgg;

    const-wide/16 v7, 0x1

    .line 226
    invoke-virtual {v3, v7, v8}, Lcom/google/android/gms/internal/measurement/zzgg;->zze(J)Lcom/google/android/gms/internal/measurement/zzgg;

    .line 227
    invoke-virtual {v3}, Lcom/google/android/gms/internal/measurement/zzjv;->zzaA()Lcom/google/android/gms/internal/measurement/zzjz;

    move-result-object v2

    check-cast v2, Lcom/google/android/gms/internal/measurement/zzgh;

    const/4 v3, 0x0

    .line 228
    :goto_20
    invoke-virtual {v5}, Lcom/google/android/gms/internal/measurement/zzfx;->zzb()I

    move-result v7

    if-ge v3, v7, :cond_3e

    .line 229
    invoke-virtual {v5, v3}, Lcom/google/android/gms/internal/measurement/zzfx;->zzak(I)Lcom/google/android/gms/internal/measurement/zzgh;

    move-result-object v7

    invoke-virtual {v7}, Lcom/google/android/gms/internal/measurement/zzgh;->zzf()Ljava/lang/String;

    move-result-object v7

    .line 230
    invoke-virtual {v4, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_3d

    .line 232
    invoke-virtual {v5, v3, v2}, Lcom/google/android/gms/internal/measurement/zzfx;->zzai(ILcom/google/android/gms/internal/measurement/zzgh;)Lcom/google/android/gms/internal/measurement/zzfx;

    goto :goto_21

    :cond_3d
    add-int/lit8 v3, v3, 0x1

    goto :goto_20

    .line 231
    :cond_3e
    invoke-virtual {v5, v2}, Lcom/google/android/gms/internal/measurement/zzfx;->zzl(Lcom/google/android/gms/internal/measurement/zzgh;)Lcom/google/android/gms/internal/measurement/zzfx;

    :cond_3f
    :goto_21
    const-wide v2, 0x7fffffffffffffffL

    .line 233
    invoke-virtual {v5, v2, v3}, Lcom/google/android/gms/internal/measurement/zzfx;->zzae(J)Lcom/google/android/gms/internal/measurement/zzfx;

    const-wide/high16 v2, -0x8000000000000000L

    invoke-virtual {v5, v2, v3}, Lcom/google/android/gms/internal/measurement/zzfx;->zzN(J)Lcom/google/android/gms/internal/measurement/zzfx;

    const/4 v2, 0x0

    .line 234
    :goto_22
    invoke-virtual {v5}, Lcom/google/android/gms/internal/measurement/zzfx;->zza()I

    move-result v3

    if-ge v2, v3, :cond_42

    .line 235
    invoke-virtual {v5, v2}, Lcom/google/android/gms/internal/measurement/zzfx;->zze(I)Lcom/google/android/gms/internal/measurement/zzfo;

    move-result-object v3

    .line 236
    invoke-virtual {v3}, Lcom/google/android/gms/internal/measurement/zzfo;->zzd()J

    move-result-wide v7

    invoke-virtual {v5}, Lcom/google/android/gms/internal/measurement/zzfx;->zzd()J

    move-result-wide v9

    cmp-long v4, v7, v9

    if-gez v4, :cond_40

    .line 237
    invoke-virtual {v3}, Lcom/google/android/gms/internal/measurement/zzfo;->zzd()J

    move-result-wide v7

    invoke-virtual {v5, v7, v8}, Lcom/google/android/gms/internal/measurement/zzfx;->zzae(J)Lcom/google/android/gms/internal/measurement/zzfx;

    .line 238
    :cond_40
    invoke-virtual {v3}, Lcom/google/android/gms/internal/measurement/zzfo;->zzd()J

    move-result-wide v7

    invoke-virtual {v5}, Lcom/google/android/gms/internal/measurement/zzfx;->zzc()J

    move-result-wide v9

    cmp-long v4, v7, v9

    if-lez v4, :cond_41

    .line 239
    invoke-virtual {v3}, Lcom/google/android/gms/internal/measurement/zzfo;->zzd()J

    move-result-wide v3

    invoke-virtual {v5, v3, v4}, Lcom/google/android/gms/internal/measurement/zzfx;->zzN(J)Lcom/google/android/gms/internal/measurement/zzfx;

    :cond_41
    add-int/lit8 v2, v2, 0x1

    goto :goto_22

    .line 240
    :cond_42
    invoke-virtual {v5}, Lcom/google/android/gms/internal/measurement/zzfx;->zzv()Lcom/google/android/gms/internal/measurement/zzfx;

    .line 241
    invoke-virtual {v5}, Lcom/google/android/gms/internal/measurement/zzfx;->zzn()Lcom/google/android/gms/internal/measurement/zzfx;

    iget-object v7, v1, Lcom/google/android/gms/measurement/internal/zzkn;->zzh:Lcom/google/android/gms/measurement/internal/zzz;

    .line 242
    invoke-static {v7}, Lcom/google/android/gms/measurement/internal/zzkn;->zzak(Lcom/google/android/gms/measurement/internal/zzkd;)Lcom/google/android/gms/measurement/internal/zzkd;

    .line 243
    invoke-virtual {v5}, Lcom/google/android/gms/internal/measurement/zzfx;->zzal()Ljava/lang/String;

    move-result-object v8

    .line 244
    invoke-virtual {v5}, Lcom/google/android/gms/internal/measurement/zzfx;->zzao()Ljava/util/List;

    move-result-object v9

    .line 245
    invoke-virtual {v5}, Lcom/google/android/gms/internal/measurement/zzfx;->zzap()Ljava/util/List;

    move-result-object v10

    .line 246
    invoke-virtual {v5}, Lcom/google/android/gms/internal/measurement/zzfx;->zzd()J

    move-result-wide v2

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v11

    .line 247
    invoke-virtual {v5}, Lcom/google/android/gms/internal/measurement/zzfx;->zzc()J

    move-result-wide v2

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v12

    .line 248
    invoke-virtual/range {v7 .. v12}, Lcom/google/android/gms/measurement/internal/zzz;->zza(Ljava/lang/String;Ljava/util/List;Ljava/util/List;Ljava/lang/Long;Ljava/lang/Long;)Ljava/util/List;

    move-result-object v2

    .line 249
    invoke-virtual {v5, v2}, Lcom/google/android/gms/internal/measurement/zzfx;->zzf(Ljava/lang/Iterable;)Lcom/google/android/gms/internal/measurement/zzfx;

    .line 250
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzg()Lcom/google/android/gms/measurement/internal/zzaf;

    move-result-object v2

    iget-object v3, v6, Lcom/google/android/gms/measurement/internal/zzkm;->zza:Lcom/google/android/gms/internal/measurement/zzfy;

    invoke-virtual {v3}, Lcom/google/android/gms/internal/measurement/zzfy;->zzy()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/google/android/gms/measurement/internal/zzaf;->zzw(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_5b

    new-instance v2, Ljava/util/HashMap;

    .line 251
    invoke-direct {v2}, Ljava/util/HashMap;-><init>()V

    new-instance v3, Ljava/util/ArrayList;

    .line 252
    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 253
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzv()Lcom/google/android/gms/measurement/internal/zzku;

    move-result-object v4

    invoke-virtual {v4}, Lcom/google/android/gms/measurement/internal/zzku;->zzF()Ljava/security/SecureRandom;

    move-result-object v4

    const/4 v7, 0x0

    .line 254
    :goto_23
    invoke-virtual {v5}, Lcom/google/android/gms/internal/measurement/zzfx;->zza()I

    move-result v8

    if-ge v7, v8, :cond_58

    .line 255
    invoke-virtual {v5, v7}, Lcom/google/android/gms/internal/measurement/zzfx;->zze(I)Lcom/google/android/gms/internal/measurement/zzfo;

    move-result-object v8

    invoke-virtual {v8}, Lcom/google/android/gms/internal/measurement/zzjz;->zzbv()Lcom/google/android/gms/internal/measurement/zzjv;

    move-result-object v8

    check-cast v8, Lcom/google/android/gms/internal/measurement/zzfn;

    .line 256
    invoke-virtual {v8}, Lcom/google/android/gms/internal/measurement/zzfn;->zzo()Ljava/lang/String;

    move-result-object v9

    const-string v10, "_ep"

    invoke-virtual {v9, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_0

    const-string v10, "_sr"

    if-eqz v9, :cond_47

    :try_start_8
    iget-object v9, v1, Lcom/google/android/gms/measurement/internal/zzkn;->zzi:Lcom/google/android/gms/measurement/internal/zzkp;

    .line 323
    invoke-static {v9}, Lcom/google/android/gms/measurement/internal/zzkn;->zzak(Lcom/google/android/gms/measurement/internal/zzkd;)Lcom/google/android/gms/measurement/internal/zzkd;

    .line 324
    invoke-virtual {v8}, Lcom/google/android/gms/internal/measurement/zzjv;->zzaA()Lcom/google/android/gms/internal/measurement/zzjz;

    move-result-object v9

    check-cast v9, Lcom/google/android/gms/internal/measurement/zzfo;

    const-string v11, "_en"

    invoke-static {v9, v11}, Lcom/google/android/gms/measurement/internal/zzkp;->zzD(Lcom/google/android/gms/internal/measurement/zzfo;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/lang/String;

    .line 325
    invoke-interface {v2, v9}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Lcom/google/android/gms/measurement/internal/zzap;

    if-nez v11, :cond_43

    iget-object v11, v1, Lcom/google/android/gms/measurement/internal/zzkn;->zze:Lcom/google/android/gms/measurement/internal/zzaj;

    .line 326
    invoke-static {v11}, Lcom/google/android/gms/measurement/internal/zzkn;->zzak(Lcom/google/android/gms/measurement/internal/zzkd;)Lcom/google/android/gms/measurement/internal/zzkd;

    iget-object v12, v6, Lcom/google/android/gms/measurement/internal/zzkm;->zza:Lcom/google/android/gms/internal/measurement/zzfy;

    .line 327
    invoke-virtual {v12}, Lcom/google/android/gms/internal/measurement/zzfy;->zzy()Ljava/lang/String;

    move-result-object v12

    invoke-static {v9}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Ljava/lang/String;

    .line 328
    invoke-virtual {v11, v12, v13}, Lcom/google/android/gms/measurement/internal/zzaj;->zzn(Ljava/lang/String;Ljava/lang/String;)Lcom/google/android/gms/measurement/internal/zzap;

    move-result-object v11

    if-eqz v11, :cond_43

    .line 329
    invoke-interface {v2, v9, v11}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_43
    if-eqz v11, :cond_46

    iget-object v9, v11, Lcom/google/android/gms/measurement/internal/zzap;->zzi:Ljava/lang/Long;

    if-nez v9, :cond_46

    iget-object v9, v11, Lcom/google/android/gms/measurement/internal/zzap;->zzj:Ljava/lang/Long;

    if-eqz v9, :cond_44

    .line 330
    invoke-virtual {v9}, Ljava/lang/Long;->longValue()J

    move-result-wide v12

    const-wide/16 v14, 0x1

    cmp-long v9, v12, v14

    if-lez v9, :cond_44

    iget-object v9, v1, Lcom/google/android/gms/measurement/internal/zzkn;->zzi:Lcom/google/android/gms/measurement/internal/zzkp;

    .line 331
    invoke-static {v9}, Lcom/google/android/gms/measurement/internal/zzkn;->zzak(Lcom/google/android/gms/measurement/internal/zzkd;)Lcom/google/android/gms/measurement/internal/zzkd;

    iget-object v9, v11, Lcom/google/android/gms/measurement/internal/zzap;->zzj:Ljava/lang/Long;

    .line 332
    invoke-static {v8, v10, v9}, Lcom/google/android/gms/measurement/internal/zzkp;->zzA(Lcom/google/android/gms/internal/measurement/zzfn;Ljava/lang/String;Ljava/lang/Object;)V

    :cond_44
    iget-object v9, v11, Lcom/google/android/gms/measurement/internal/zzap;->zzk:Ljava/lang/Boolean;

    if-eqz v9, :cond_45

    .line 333
    invoke-virtual {v9}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v9

    if-eqz v9, :cond_45

    iget-object v9, v1, Lcom/google/android/gms/measurement/internal/zzkn;->zzi:Lcom/google/android/gms/measurement/internal/zzkp;

    .line 334
    invoke-static {v9}, Lcom/google/android/gms/measurement/internal/zzkn;->zzak(Lcom/google/android/gms/measurement/internal/zzkd;)Lcom/google/android/gms/measurement/internal/zzkd;

    const-string v9, "_efs"

    const-wide/16 v10, 0x1

    .line 335
    invoke-static {v10, v11}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v12

    invoke-static {v8, v9, v12}, Lcom/google/android/gms/measurement/internal/zzkp;->zzA(Lcom/google/android/gms/internal/measurement/zzfn;Ljava/lang/String;Ljava/lang/Object;)V

    .line 336
    :cond_45
    invoke-virtual {v8}, Lcom/google/android/gms/internal/measurement/zzjv;->zzaA()Lcom/google/android/gms/internal/measurement/zzjz;

    move-result-object v9

    check-cast v9, Lcom/google/android/gms/internal/measurement/zzfo;

    invoke-interface {v3, v9}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 337
    :cond_46
    invoke-virtual {v5, v7, v8}, Lcom/google/android/gms/internal/measurement/zzfx;->zzO(ILcom/google/android/gms/internal/measurement/zzfn;)Lcom/google/android/gms/internal/measurement/zzfx;

    :goto_24
    move-object/from16 p3, v4

    move-object v4, v5

    move-object/from16 v16, v6

    const-wide/16 v5, 0x1

    goto/16 :goto_2f

    :cond_47
    iget-object v9, v1, Lcom/google/android/gms/measurement/internal/zzkn;->zzc:Lcom/google/android/gms/measurement/internal/zzfj;

    .line 257
    invoke-static {v9}, Lcom/google/android/gms/measurement/internal/zzkn;->zzak(Lcom/google/android/gms/measurement/internal/zzkd;)Lcom/google/android/gms/measurement/internal/zzkd;

    iget-object v11, v6, Lcom/google/android/gms/measurement/internal/zzkm;->zza:Lcom/google/android/gms/internal/measurement/zzfy;

    .line 258
    invoke-virtual {v11}, Lcom/google/android/gms/internal/measurement/zzfy;->zzy()Ljava/lang/String;

    move-result-object v11

    const-string v12, "measurement.account.time_zone_offset_minutes"

    .line 259
    invoke-virtual {v9, v11, v12}, Lcom/google/android/gms/measurement/internal/zzfj;->zza(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    .line 260
    invoke-static {v12}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v13
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_0

    if-nez v13, :cond_48

    .line 261
    :try_start_9
    invoke-static {v12}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v11
    :try_end_9
    .catch Ljava/lang/NumberFormatException; {:try_start_9 .. :try_end_9} :catch_0
    .catchall {:try_start_9 .. :try_end_9} :catchall_0

    goto :goto_25

    :catch_0
    move-exception v0

    move-object v12, v0

    .line 404
    :try_start_a
    iget-object v9, v9, Lcom/google/android/gms/measurement/internal/zzgl;->zzs:Lcom/google/android/gms/measurement/internal/zzfs;

    .line 262
    invoke-virtual {v9}, Lcom/google/android/gms/measurement/internal/zzfs;->zzay()Lcom/google/android/gms/measurement/internal/zzei;

    move-result-object v9

    .line 263
    invoke-virtual {v9}, Lcom/google/android/gms/measurement/internal/zzei;->zzk()Lcom/google/android/gms/measurement/internal/zzeg;

    move-result-object v9

    const-string v13, "Unable to parse timezone offset. appId"

    invoke-static {v11}, Lcom/google/android/gms/measurement/internal/zzei;->zzn(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v11

    .line 264
    invoke-virtual {v9, v13, v11, v12}, Lcom/google/android/gms/measurement/internal/zzeg;->zzc(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    :cond_48
    const-wide/16 v11, 0x0

    .line 265
    :goto_25
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzv()Lcom/google/android/gms/measurement/internal/zzku;

    move-result-object v9

    invoke-virtual {v8}, Lcom/google/android/gms/internal/measurement/zzfn;->zzc()J

    move-result-wide v13

    invoke-virtual {v9, v13, v14, v11, v12}, Lcom/google/android/gms/measurement/internal/zzku;->zzr(JJ)J

    move-result-wide v13

    .line 266
    invoke-virtual {v8}, Lcom/google/android/gms/internal/measurement/zzjv;->zzaA()Lcom/google/android/gms/internal/measurement/zzjz;

    move-result-object v9

    check-cast v9, Lcom/google/android/gms/internal/measurement/zzfo;

    move-wide/from16 v17, v11

    const-wide/16 v15, 0x1

    invoke-static/range {v15 .. v16}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v11

    const-string v12, "_dbg"

    .line 267
    invoke-static {v12}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v15

    if-nez v15, :cond_4b

    .line 268
    invoke-virtual {v9}, Lcom/google/android/gms/internal/measurement/zzfo;->zzi()Ljava/util/List;

    move-result-object v9

    invoke-interface {v9}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v9

    :goto_26
    invoke-interface {v9}, Ljava/util/Iterator;->hasNext()Z

    move-result v15

    if-eqz v15, :cond_4b

    invoke-interface {v9}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v15

    check-cast v15, Lcom/google/android/gms/internal/measurement/zzfs;

    move-object/from16 p3, v9

    .line 269
    invoke-virtual {v15}, Lcom/google/android/gms/internal/measurement/zzfs;->zzg()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v12, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_4a

    .line 270
    invoke-virtual {v15}, Lcom/google/android/gms/internal/measurement/zzfs;->zzd()J

    move-result-wide v15

    invoke-static/range {v15 .. v16}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v9

    invoke-virtual {v11, v9}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-nez v9, :cond_49

    goto :goto_27

    :cond_49
    const/4 v9, 0x1

    goto :goto_28

    :cond_4a
    move-object/from16 v9, p3

    goto :goto_26

    :cond_4b
    :goto_27
    iget-object v9, v1, Lcom/google/android/gms/measurement/internal/zzkn;->zzc:Lcom/google/android/gms/measurement/internal/zzfj;

    .line 271
    invoke-static {v9}, Lcom/google/android/gms/measurement/internal/zzkn;->zzak(Lcom/google/android/gms/measurement/internal/zzkd;)Lcom/google/android/gms/measurement/internal/zzkd;

    iget-object v11, v6, Lcom/google/android/gms/measurement/internal/zzkm;->zza:Lcom/google/android/gms/internal/measurement/zzfy;

    .line 272
    invoke-virtual {v11}, Lcom/google/android/gms/internal/measurement/zzfy;->zzy()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v8}, Lcom/google/android/gms/internal/measurement/zzfn;->zzo()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v9, v11, v12}, Lcom/google/android/gms/measurement/internal/zzfj;->zzc(Ljava/lang/String;Ljava/lang/String;)I

    move-result v9

    :goto_28
    if-gtz v9, :cond_4c

    .line 273
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzay()Lcom/google/android/gms/measurement/internal/zzei;

    move-result-object v10

    .line 274
    invoke-virtual {v10}, Lcom/google/android/gms/measurement/internal/zzei;->zzk()Lcom/google/android/gms/measurement/internal/zzeg;

    move-result-object v10

    const-string v11, "Sample rate must be positive. event, rate"

    .line 275
    invoke-virtual {v8}, Lcom/google/android/gms/internal/measurement/zzfn;->zzo()Ljava/lang/String;

    move-result-object v12

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    invoke-virtual {v10, v11, v12, v9}, Lcom/google/android/gms/measurement/internal/zzeg;->zzc(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 276
    invoke-virtual {v8}, Lcom/google/android/gms/internal/measurement/zzjv;->zzaA()Lcom/google/android/gms/internal/measurement/zzjz;

    move-result-object v9

    check-cast v9, Lcom/google/android/gms/internal/measurement/zzfo;

    invoke-interface {v3, v9}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 277
    invoke-virtual {v5, v7, v8}, Lcom/google/android/gms/internal/measurement/zzfx;->zzO(ILcom/google/android/gms/internal/measurement/zzfn;)Lcom/google/android/gms/internal/measurement/zzfx;

    goto/16 :goto_24

    .line 278
    :cond_4c
    invoke-virtual {v8}, Lcom/google/android/gms/internal/measurement/zzfn;->zzo()Ljava/lang/String;

    move-result-object v11

    invoke-interface {v2, v11}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Lcom/google/android/gms/measurement/internal/zzap;

    if-nez v11, :cond_4d

    iget-object v11, v1, Lcom/google/android/gms/measurement/internal/zzkn;->zze:Lcom/google/android/gms/measurement/internal/zzaj;

    .line 279
    invoke-static {v11}, Lcom/google/android/gms/measurement/internal/zzkn;->zzak(Lcom/google/android/gms/measurement/internal/zzkd;)Lcom/google/android/gms/measurement/internal/zzkd;

    iget-object v12, v6, Lcom/google/android/gms/measurement/internal/zzkm;->zza:Lcom/google/android/gms/internal/measurement/zzfy;

    .line 280
    invoke-virtual {v12}, Lcom/google/android/gms/internal/measurement/zzfy;->zzy()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v8}, Lcom/google/android/gms/internal/measurement/zzfn;->zzo()Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v11, v12, v15}, Lcom/google/android/gms/measurement/internal/zzaj;->zzn(Ljava/lang/String;Ljava/lang/String;)Lcom/google/android/gms/measurement/internal/zzap;

    move-result-object v11

    if-nez v11, :cond_4d

    .line 281
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzay()Lcom/google/android/gms/measurement/internal/zzei;

    move-result-object v11

    .line 282
    invoke-virtual {v11}, Lcom/google/android/gms/measurement/internal/zzei;->zzk()Lcom/google/android/gms/measurement/internal/zzeg;

    move-result-object v11

    const-string v12, "Event being bundled has no eventAggregate. appId, eventName"

    iget-object v15, v6, Lcom/google/android/gms/measurement/internal/zzkm;->zza:Lcom/google/android/gms/internal/measurement/zzfy;

    .line 283
    invoke-virtual {v15}, Lcom/google/android/gms/internal/measurement/zzfy;->zzy()Ljava/lang/String;

    move-result-object v15

    move-wide/from16 v22, v13

    .line 284
    invoke-virtual {v8}, Lcom/google/android/gms/internal/measurement/zzfn;->zzo()Ljava/lang/String;

    move-result-object v13

    .line 285
    invoke-virtual {v11, v12, v15, v13}, Lcom/google/android/gms/measurement/internal/zzeg;->zzc(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    new-instance v11, Lcom/google/android/gms/measurement/internal/zzap;

    iget-object v12, v6, Lcom/google/android/gms/measurement/internal/zzkm;->zza:Lcom/google/android/gms/internal/measurement/zzfy;

    .line 286
    invoke-virtual {v12}, Lcom/google/android/gms/internal/measurement/zzfy;->zzy()Ljava/lang/String;

    move-result-object v26

    .line 287
    invoke-virtual {v8}, Lcom/google/android/gms/internal/measurement/zzfn;->zzo()Ljava/lang/String;

    move-result-object v27

    const-wide/16 v28, 0x1

    const-wide/16 v30, 0x1

    const-wide/16 v32, 0x1

    .line 288
    invoke-virtual {v8}, Lcom/google/android/gms/internal/measurement/zzfn;->zzc()J

    move-result-wide v34

    const-wide/16 v36, 0x0

    const/16 v38, 0x0

    const/16 v39, 0x0

    const/16 v40, 0x0

    const/16 v41, 0x0

    move-object/from16 v25, v11

    invoke-direct/range {v25 .. v41}, Lcom/google/android/gms/measurement/internal/zzap;-><init>(Ljava/lang/String;Ljava/lang/String;JJJJJLjava/lang/Long;Ljava/lang/Long;Ljava/lang/Long;Ljava/lang/Boolean;)V

    goto :goto_29

    :cond_4d
    move-wide/from16 v22, v13

    :goto_29
    iget-object v12, v1, Lcom/google/android/gms/measurement/internal/zzkn;->zzi:Lcom/google/android/gms/measurement/internal/zzkp;

    .line 289
    invoke-static {v12}, Lcom/google/android/gms/measurement/internal/zzkn;->zzak(Lcom/google/android/gms/measurement/internal/zzkd;)Lcom/google/android/gms/measurement/internal/zzkd;

    .line 290
    invoke-virtual {v8}, Lcom/google/android/gms/internal/measurement/zzjv;->zzaA()Lcom/google/android/gms/internal/measurement/zzjz;

    move-result-object v12

    check-cast v12, Lcom/google/android/gms/internal/measurement/zzfo;

    const-string v13, "_eid"

    invoke-static {v12, v13}, Lcom/google/android/gms/measurement/internal/zzkp;->zzD(Lcom/google/android/gms/internal/measurement/zzfo;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Ljava/lang/Long;

    if-eqz v12, :cond_4e

    const/4 v13, 0x1

    goto :goto_2a

    :cond_4e
    const/4 v13, 0x0

    .line 291
    :goto_2a
    invoke-static {v13}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v13

    const/4 v14, 0x1

    if-ne v9, v14, :cond_51

    .line 292
    invoke-virtual {v8}, Lcom/google/android/gms/internal/measurement/zzjv;->zzaA()Lcom/google/android/gms/internal/measurement/zzjz;

    move-result-object v9

    check-cast v9, Lcom/google/android/gms/internal/measurement/zzfo;

    invoke-interface {v3, v9}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 293
    invoke-virtual {v13}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v9

    if-eqz v9, :cond_50

    iget-object v9, v11, Lcom/google/android/gms/measurement/internal/zzap;->zzi:Ljava/lang/Long;

    if-nez v9, :cond_4f

    iget-object v9, v11, Lcom/google/android/gms/measurement/internal/zzap;->zzj:Ljava/lang/Long;

    if-nez v9, :cond_4f

    iget-object v9, v11, Lcom/google/android/gms/measurement/internal/zzap;->zzk:Ljava/lang/Boolean;

    if-eqz v9, :cond_50

    :cond_4f
    const/4 v9, 0x0

    .line 294
    invoke-virtual {v11, v9, v9, v9}, Lcom/google/android/gms/measurement/internal/zzap;->zza(Ljava/lang/Long;Ljava/lang/Long;Ljava/lang/Boolean;)Lcom/google/android/gms/measurement/internal/zzap;

    move-result-object v10

    .line 295
    invoke-virtual {v8}, Lcom/google/android/gms/internal/measurement/zzfn;->zzo()Ljava/lang/String;

    move-result-object v9

    invoke-interface {v2, v9, v10}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 296
    :cond_50
    invoke-virtual {v5, v7, v8}, Lcom/google/android/gms/internal/measurement/zzfx;->zzO(ILcom/google/android/gms/internal/measurement/zzfn;)Lcom/google/android/gms/internal/measurement/zzfx;

    goto/16 :goto_24

    .line 297
    :cond_51
    invoke-virtual {v4, v9}, Ljava/security/SecureRandom;->nextInt(I)I

    move-result v14

    if-nez v14, :cond_53

    iget-object v12, v1, Lcom/google/android/gms/measurement/internal/zzkn;->zzi:Lcom/google/android/gms/measurement/internal/zzkp;

    .line 298
    invoke-static {v12}, Lcom/google/android/gms/measurement/internal/zzkn;->zzak(Lcom/google/android/gms/measurement/internal/zzkd;)Lcom/google/android/gms/measurement/internal/zzkd;

    int-to-long v14, v9

    .line 299
    invoke-static {v14, v15}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v9

    invoke-static {v8, v10, v9}, Lcom/google/android/gms/measurement/internal/zzkp;->zzA(Lcom/google/android/gms/internal/measurement/zzfn;Ljava/lang/String;Ljava/lang/Object;)V

    .line 300
    invoke-virtual {v8}, Lcom/google/android/gms/internal/measurement/zzjv;->zzaA()Lcom/google/android/gms/internal/measurement/zzjz;

    move-result-object v10

    check-cast v10, Lcom/google/android/gms/internal/measurement/zzfo;

    invoke-interface {v3, v10}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 301
    invoke-virtual {v13}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v10

    if-eqz v10, :cond_52

    const/4 v10, 0x0

    .line 302
    invoke-virtual {v11, v10, v9, v10}, Lcom/google/android/gms/measurement/internal/zzap;->zza(Ljava/lang/Long;Ljava/lang/Long;Ljava/lang/Boolean;)Lcom/google/android/gms/measurement/internal/zzap;

    move-result-object v11

    .line 303
    :cond_52
    invoke-virtual {v8}, Lcom/google/android/gms/internal/measurement/zzfn;->zzo()Ljava/lang/String;

    move-result-object v9

    .line 304
    invoke-virtual {v8}, Lcom/google/android/gms/internal/measurement/zzfn;->zzc()J

    move-result-wide v12

    move-wide/from16 v14, v22

    invoke-virtual {v11, v12, v13, v14, v15}, Lcom/google/android/gms/measurement/internal/zzap;->zzb(JJ)Lcom/google/android/gms/measurement/internal/zzap;

    move-result-object v10

    .line 305
    invoke-interface {v2, v9, v10}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-object/from16 p3, v4

    move-object v4, v5

    move-object/from16 v16, v6

    const-wide/16 v5, 0x1

    goto/16 :goto_2e

    :cond_53
    move-object/from16 p3, v4

    move-wide/from16 v14, v22

    .line 306
    iget-object v4, v11, Lcom/google/android/gms/measurement/internal/zzap;->zzh:Ljava/lang/Long;

    if-eqz v4, :cond_54

    .line 307
    invoke-virtual {v4}, Ljava/lang/Long;->longValue()J

    move-result-wide v16

    move-object/from16 v30, v5

    move-object/from16 v22, v11

    move-object/from16 v19, v12

    move-wide/from16 v4, v16

    move-object/from16 v16, v6

    goto :goto_2b

    .line 308
    :cond_54
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzv()Lcom/google/android/gms/measurement/internal/zzku;

    move-result-object v4

    move-object/from16 v30, v5

    move-object/from16 v16, v6

    invoke-virtual {v8}, Lcom/google/android/gms/internal/measurement/zzfn;->zzb()J

    move-result-wide v5

    move-object/from16 v22, v11

    move-object/from16 v19, v12

    move-wide/from16 v11, v17

    invoke-virtual {v4, v5, v6, v11, v12}, Lcom/google/android/gms/measurement/internal/zzku;->zzr(JJ)J

    move-result-wide v4

    :goto_2b
    cmp-long v6, v4, v14

    if-eqz v6, :cond_56

    .line 307
    iget-object v4, v1, Lcom/google/android/gms/measurement/internal/zzkn;->zzi:Lcom/google/android/gms/measurement/internal/zzkp;

    .line 309
    invoke-static {v4}, Lcom/google/android/gms/measurement/internal/zzkn;->zzak(Lcom/google/android/gms/measurement/internal/zzkd;)Lcom/google/android/gms/measurement/internal/zzkd;

    const-string v4, "_efs"

    const-wide/16 v5, 0x1

    .line 310
    invoke-static {v5, v6}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v11

    invoke-static {v8, v4, v11}, Lcom/google/android/gms/measurement/internal/zzkp;->zzA(Lcom/google/android/gms/internal/measurement/zzfn;Ljava/lang/String;Ljava/lang/Object;)V

    iget-object v4, v1, Lcom/google/android/gms/measurement/internal/zzkn;->zzi:Lcom/google/android/gms/measurement/internal/zzkp;

    .line 311
    invoke-static {v4}, Lcom/google/android/gms/measurement/internal/zzkn;->zzak(Lcom/google/android/gms/measurement/internal/zzkd;)Lcom/google/android/gms/measurement/internal/zzkd;

    int-to-long v11, v9

    .line 312
    invoke-static {v11, v12}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    invoke-static {v8, v10, v4}, Lcom/google/android/gms/measurement/internal/zzkp;->zzA(Lcom/google/android/gms/internal/measurement/zzfn;Ljava/lang/String;Ljava/lang/Object;)V

    .line 313
    invoke-virtual {v8}, Lcom/google/android/gms/internal/measurement/zzjv;->zzaA()Lcom/google/android/gms/internal/measurement/zzjz;

    move-result-object v9

    check-cast v9, Lcom/google/android/gms/internal/measurement/zzfo;

    invoke-interface {v3, v9}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 314
    invoke-virtual {v13}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v9

    if-eqz v9, :cond_55

    const/4 v9, 0x1

    .line 315
    invoke-static {v9}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v10

    move-object/from16 v11, v22

    const/4 v9, 0x0

    invoke-virtual {v11, v9, v4, v10}, Lcom/google/android/gms/measurement/internal/zzap;->zza(Ljava/lang/Long;Ljava/lang/Long;Ljava/lang/Boolean;)Lcom/google/android/gms/measurement/internal/zzap;

    move-result-object v11

    goto :goto_2c

    :cond_55
    move-object/from16 v11, v22

    .line 316
    :goto_2c
    invoke-virtual {v8}, Lcom/google/android/gms/internal/measurement/zzfn;->zzo()Ljava/lang/String;

    move-result-object v4

    .line 317
    invoke-virtual {v8}, Lcom/google/android/gms/internal/measurement/zzfn;->zzc()J

    move-result-wide v9

    invoke-virtual {v11, v9, v10, v14, v15}, Lcom/google/android/gms/measurement/internal/zzap;->zzb(JJ)Lcom/google/android/gms/measurement/internal/zzap;

    move-result-object v9

    .line 318
    invoke-interface {v2, v4, v9}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_2d

    :cond_56
    move-object/from16 v11, v22

    const-wide/16 v5, 0x1

    .line 319
    invoke-virtual {v13}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v4

    if-eqz v4, :cond_57

    .line 320
    invoke-virtual {v8}, Lcom/google/android/gms/internal/measurement/zzfn;->zzo()Ljava/lang/String;

    move-result-object v4

    move-object/from16 v12, v19

    const/4 v9, 0x0

    invoke-virtual {v11, v12, v9, v9}, Lcom/google/android/gms/measurement/internal/zzap;->zza(Ljava/lang/Long;Ljava/lang/Long;Ljava/lang/Boolean;)Lcom/google/android/gms/measurement/internal/zzap;

    move-result-object v10

    .line 321
    invoke-interface {v2, v4, v10}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_57
    :goto_2d
    move-object/from16 v4, v30

    .line 322
    :goto_2e
    invoke-virtual {v4, v7, v8}, Lcom/google/android/gms/internal/measurement/zzfx;->zzO(ILcom/google/android/gms/internal/measurement/zzfn;)Lcom/google/android/gms/internal/measurement/zzfx;

    :goto_2f
    add-int/lit8 v7, v7, 0x1

    move-object v5, v4

    move-object/from16 v6, v16

    move-object/from16 v4, p3

    goto/16 :goto_23

    :cond_58
    move-object v4, v5

    move-object/from16 v16, v6

    .line 338
    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v5

    invoke-virtual {v4}, Lcom/google/android/gms/internal/measurement/zzfx;->zza()I

    move-result v6

    if-ge v5, v6, :cond_59

    .line 339
    invoke-virtual {v4}, Lcom/google/android/gms/internal/measurement/zzfx;->zzp()Lcom/google/android/gms/internal/measurement/zzfx;

    invoke-virtual {v4, v3}, Lcom/google/android/gms/internal/measurement/zzfx;->zzg(Ljava/lang/Iterable;)Lcom/google/android/gms/internal/measurement/zzfx;

    .line 340
    :cond_59
    invoke-interface {v2}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_30
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_5a

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/Map$Entry;

    iget-object v5, v1, Lcom/google/android/gms/measurement/internal/zzkn;->zze:Lcom/google/android/gms/measurement/internal/zzaj;

    .line 341
    invoke-static {v5}, Lcom/google/android/gms/measurement/internal/zzkn;->zzak(Lcom/google/android/gms/measurement/internal/zzkd;)Lcom/google/android/gms/measurement/internal/zzkd;

    .line 342
    invoke-interface {v3}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/google/android/gms/measurement/internal/zzap;

    invoke-virtual {v5, v3}, Lcom/google/android/gms/measurement/internal/zzaj;->zzE(Lcom/google/android/gms/measurement/internal/zzap;)V

    goto :goto_30

    :cond_5a
    move-object/from16 v2, v16

    goto :goto_31

    :cond_5b
    move-object v4, v5

    move-object v2, v6

    :goto_31
    iget-object v3, v2, Lcom/google/android/gms/measurement/internal/zzkm;->zza:Lcom/google/android/gms/internal/measurement/zzfy;

    .line 343
    invoke-virtual {v3}, Lcom/google/android/gms/internal/measurement/zzfy;->zzy()Ljava/lang/String;

    move-result-object v3

    iget-object v5, v1, Lcom/google/android/gms/measurement/internal/zzkn;->zze:Lcom/google/android/gms/measurement/internal/zzaj;

    .line 344
    invoke-static {v5}, Lcom/google/android/gms/measurement/internal/zzkn;->zzak(Lcom/google/android/gms/measurement/internal/zzkd;)Lcom/google/android/gms/measurement/internal/zzkd;

    .line 345
    invoke-virtual {v5, v3}, Lcom/google/android/gms/measurement/internal/zzaj;->zzj(Ljava/lang/String;)Lcom/google/android/gms/measurement/internal/zzg;

    move-result-object v5

    if-nez v5, :cond_5c

    .line 346
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzay()Lcom/google/android/gms/measurement/internal/zzei;

    move-result-object v5

    .line 347
    invoke-virtual {v5}, Lcom/google/android/gms/measurement/internal/zzei;->zzd()Lcom/google/android/gms/measurement/internal/zzeg;

    move-result-object v5

    const-string v6, "Bundling raw events w/o app info. appId"

    iget-object v7, v2, Lcom/google/android/gms/measurement/internal/zzkm;->zza:Lcom/google/android/gms/internal/measurement/zzfy;

    .line 348
    invoke-virtual {v7}, Lcom/google/android/gms/internal/measurement/zzfy;->zzy()Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Lcom/google/android/gms/measurement/internal/zzei;->zzn(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v7

    .line 349
    invoke-virtual {v5, v6, v7}, Lcom/google/android/gms/measurement/internal/zzeg;->zzb(Ljava/lang/String;Ljava/lang/Object;)V

    goto :goto_36

    .line 350
    :cond_5c
    invoke-virtual {v4}, Lcom/google/android/gms/internal/measurement/zzfx;->zza()I

    move-result v6

    if-lez v6, :cond_61

    .line 351
    invoke-virtual {v5}, Lcom/google/android/gms/measurement/internal/zzg;->zzn()J

    move-result-wide v6

    const-wide/16 v8, 0x0

    cmp-long v10, v6, v8

    if-eqz v10, :cond_5d

    .line 352
    invoke-virtual {v4, v6, v7}, Lcom/google/android/gms/internal/measurement/zzfx;->zzY(J)Lcom/google/android/gms/internal/measurement/zzfx;

    goto :goto_32

    .line 353
    :cond_5d
    invoke-virtual {v4}, Lcom/google/android/gms/internal/measurement/zzfx;->zzs()Lcom/google/android/gms/internal/measurement/zzfx;

    .line 354
    :goto_32
    invoke-virtual {v5}, Lcom/google/android/gms/measurement/internal/zzg;->zzp()J

    move-result-wide v8

    const-wide/16 v10, 0x0

    cmp-long v12, v8, v10

    if-nez v12, :cond_5e

    goto :goto_33

    :cond_5e
    move-wide v6, v8

    :goto_33
    cmp-long v8, v6, v10

    if-eqz v8, :cond_5f

    .line 355
    invoke-virtual {v4, v6, v7}, Lcom/google/android/gms/internal/measurement/zzfx;->zzZ(J)Lcom/google/android/gms/internal/measurement/zzfx;

    goto :goto_34

    .line 356
    :cond_5f
    invoke-virtual {v4}, Lcom/google/android/gms/internal/measurement/zzfx;->zzt()Lcom/google/android/gms/internal/measurement/zzfx;

    .line 357
    :goto_34
    invoke-virtual {v5}, Lcom/google/android/gms/measurement/internal/zzg;->zzE()V

    .line 358
    invoke-virtual {v5}, Lcom/google/android/gms/measurement/internal/zzg;->zzo()J

    move-result-wide v6

    long-to-int v7, v6

    invoke-virtual {v4, v7}, Lcom/google/android/gms/internal/measurement/zzfx;->zzF(I)Lcom/google/android/gms/internal/measurement/zzfx;

    .line 359
    invoke-virtual {v4}, Lcom/google/android/gms/internal/measurement/zzfx;->zzd()J

    move-result-wide v6

    invoke-virtual {v5, v6, v7}, Lcom/google/android/gms/measurement/internal/zzg;->zzad(J)V

    .line 360
    invoke-virtual {v4}, Lcom/google/android/gms/internal/measurement/zzfx;->zzc()J

    move-result-wide v6

    invoke-virtual {v5, v6, v7}, Lcom/google/android/gms/measurement/internal/zzg;->zzab(J)V

    .line 361
    invoke-virtual {v5}, Lcom/google/android/gms/measurement/internal/zzg;->zzs()Ljava/lang/String;

    move-result-object v6

    if-eqz v6, :cond_60

    .line 362
    invoke-virtual {v4, v6}, Lcom/google/android/gms/internal/measurement/zzfx;->zzT(Ljava/lang/String;)Lcom/google/android/gms/internal/measurement/zzfx;

    goto :goto_35

    .line 363
    :cond_60
    invoke-virtual {v4}, Lcom/google/android/gms/internal/measurement/zzfx;->zzq()Lcom/google/android/gms/internal/measurement/zzfx;

    .line 362
    :goto_35
    iget-object v6, v1, Lcom/google/android/gms/measurement/internal/zzkn;->zze:Lcom/google/android/gms/measurement/internal/zzaj;

    .line 364
    invoke-static {v6}, Lcom/google/android/gms/measurement/internal/zzkn;->zzak(Lcom/google/android/gms/measurement/internal/zzkd;)Lcom/google/android/gms/measurement/internal/zzkd;

    .line 365
    invoke-virtual {v6, v5}, Lcom/google/android/gms/measurement/internal/zzaj;->zzD(Lcom/google/android/gms/measurement/internal/zzg;)V

    .line 366
    :cond_61
    :goto_36
    invoke-virtual {v4}, Lcom/google/android/gms/internal/measurement/zzfx;->zza()I

    move-result v5

    if-lez v5, :cond_65

    iget-object v5, v1, Lcom/google/android/gms/measurement/internal/zzkn;->zzn:Lcom/google/android/gms/measurement/internal/zzfs;

    .line 367
    invoke-virtual {v5}, Lcom/google/android/gms/measurement/internal/zzfs;->zzaw()Lcom/google/android/gms/measurement/internal/zzaa;

    iget-object v5, v1, Lcom/google/android/gms/measurement/internal/zzkn;->zzc:Lcom/google/android/gms/measurement/internal/zzfj;

    .line 368
    invoke-static {v5}, Lcom/google/android/gms/measurement/internal/zzkn;->zzak(Lcom/google/android/gms/measurement/internal/zzkd;)Lcom/google/android/gms/measurement/internal/zzkd;

    iget-object v6, v2, Lcom/google/android/gms/measurement/internal/zzkm;->zza:Lcom/google/android/gms/internal/measurement/zzfy;

    .line 369
    invoke-virtual {v6}, Lcom/google/android/gms/internal/measurement/zzfy;->zzy()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Lcom/google/android/gms/measurement/internal/zzfj;->zze(Ljava/lang/String;)Lcom/google/android/gms/internal/measurement/zzfc;

    move-result-object v5

    if-eqz v5, :cond_63

    invoke-virtual {v5}, Lcom/google/android/gms/internal/measurement/zzfc;->zzq()Z

    move-result v6

    if-nez v6, :cond_62

    goto :goto_37

    .line 375
    :cond_62
    invoke-virtual {v5}, Lcom/google/android/gms/internal/measurement/zzfc;->zzc()J

    move-result-wide v5

    .line 376
    invoke-virtual {v4, v5, v6}, Lcom/google/android/gms/internal/measurement/zzfx;->zzH(J)Lcom/google/android/gms/internal/measurement/zzfx;

    goto :goto_38

    .line 369
    :cond_63
    :goto_37
    iget-object v5, v2, Lcom/google/android/gms/measurement/internal/zzkm;->zza:Lcom/google/android/gms/internal/measurement/zzfy;

    .line 370
    invoke-virtual {v5}, Lcom/google/android/gms/internal/measurement/zzfy;->zzH()Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v5

    if-eqz v5, :cond_64

    const-wide/16 v5, -0x1

    .line 371
    invoke-virtual {v4, v5, v6}, Lcom/google/android/gms/internal/measurement/zzfx;->zzH(J)Lcom/google/android/gms/internal/measurement/zzfx;

    goto :goto_38

    .line 372
    :cond_64
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzay()Lcom/google/android/gms/measurement/internal/zzei;

    move-result-object v5

    .line 373
    invoke-virtual {v5}, Lcom/google/android/gms/measurement/internal/zzei;->zzk()Lcom/google/android/gms/measurement/internal/zzeg;

    move-result-object v5

    const-string v6, "Did not find measurement config or missing version info. appId"

    iget-object v7, v2, Lcom/google/android/gms/measurement/internal/zzkm;->zza:Lcom/google/android/gms/internal/measurement/zzfy;

    .line 374
    invoke-virtual {v7}, Lcom/google/android/gms/internal/measurement/zzfy;->zzy()Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Lcom/google/android/gms/measurement/internal/zzei;->zzn(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v7

    .line 375
    invoke-virtual {v5, v6, v7}, Lcom/google/android/gms/measurement/internal/zzeg;->zzb(Ljava/lang/String;Ljava/lang/Object;)V

    .line 371
    :goto_38
    iget-object v5, v1, Lcom/google/android/gms/measurement/internal/zzkn;->zze:Lcom/google/android/gms/measurement/internal/zzaj;

    .line 377
    invoke-static {v5}, Lcom/google/android/gms/measurement/internal/zzkn;->zzak(Lcom/google/android/gms/measurement/internal/zzkd;)Lcom/google/android/gms/measurement/internal/zzkd;

    .line 378
    invoke-virtual {v4}, Lcom/google/android/gms/internal/measurement/zzjv;->zzaA()Lcom/google/android/gms/internal/measurement/zzjz;

    move-result-object v4

    check-cast v4, Lcom/google/android/gms/internal/measurement/zzfy;

    move/from16 v8, v20

    invoke-virtual {v5, v4, v8}, Lcom/google/android/gms/measurement/internal/zzaj;->zzJ(Lcom/google/android/gms/internal/measurement/zzfy;Z)Z

    :cond_65
    iget-object v4, v1, Lcom/google/android/gms/measurement/internal/zzkn;->zze:Lcom/google/android/gms/measurement/internal/zzaj;

    .line 379
    invoke-static {v4}, Lcom/google/android/gms/measurement/internal/zzkn;->zzak(Lcom/google/android/gms/measurement/internal/zzkd;)Lcom/google/android/gms/measurement/internal/zzkd;

    iget-object v2, v2, Lcom/google/android/gms/measurement/internal/zzkm;->zzb:Ljava/util/List;

    .line 380
    invoke-static {v2}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 381
    invoke-virtual {v4}, Lcom/google/android/gms/measurement/internal/zzgl;->zzg()V

    .line 382
    invoke-virtual {v4}, Lcom/google/android/gms/measurement/internal/zzkd;->zzY()V

    new-instance v5, Ljava/lang/StringBuilder;

    const-string v6, "rowid in ("

    .line 383
    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const/4 v6, 0x0

    .line 384
    :goto_39
    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v7

    if-ge v6, v7, :cond_67

    if-eqz v6, :cond_66

    const-string v7, ","

    .line 385
    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 386
    :cond_66
    invoke-interface {v2, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/Long;

    invoke-virtual {v7}, Ljava/lang/Long;->longValue()J

    move-result-wide v7

    invoke-virtual {v5, v7, v8}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    add-int/lit8 v6, v6, 0x1

    goto :goto_39

    :cond_67
    const-string v6, ")"

    .line 387
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 388
    invoke-virtual {v4}, Lcom/google/android/gms/measurement/internal/zzaj;->zzh()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v6

    const-string v7, "raw_events"

    .line 389
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    const/4 v8, 0x0

    invoke-virtual {v6, v7, v5, v8}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v5

    .line 390
    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v6

    if-eq v5, v6, :cond_68

    iget-object v4, v4, Lcom/google/android/gms/measurement/internal/zzgl;->zzs:Lcom/google/android/gms/measurement/internal/zzfs;

    .line 391
    invoke-virtual {v4}, Lcom/google/android/gms/measurement/internal/zzfs;->zzay()Lcom/google/android/gms/measurement/internal/zzei;

    move-result-object v4

    .line 392
    invoke-virtual {v4}, Lcom/google/android/gms/measurement/internal/zzei;->zzd()Lcom/google/android/gms/measurement/internal/zzeg;

    move-result-object v4

    const-string v6, "Deleted fewer rows from raw events table than expected"

    .line 393
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    .line 394
    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    .line 395
    invoke-virtual {v4, v6, v5, v2}, Lcom/google/android/gms/measurement/internal/zzeg;->zzc(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    :cond_68
    iget-object v2, v1, Lcom/google/android/gms/measurement/internal/zzkn;->zze:Lcom/google/android/gms/measurement/internal/zzaj;

    .line 396
    invoke-static {v2}, Lcom/google/android/gms/measurement/internal/zzkn;->zzak(Lcom/google/android/gms/measurement/internal/zzkd;)Lcom/google/android/gms/measurement/internal/zzkd;

    .line 397
    invoke-virtual {v2}, Lcom/google/android/gms/measurement/internal/zzaj;->zzh()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v4
    :try_end_a
    .catchall {:try_start_a .. :try_end_a} :catchall_0

    const/4 v5, 0x2

    :try_start_b
    new-array v5, v5, [Ljava/lang/String;

    const/4 v6, 0x0

    aput-object v3, v5, v6

    const/4 v6, 0x1

    aput-object v3, v5, v6

    const-string v6, "delete from raw_events_metadata where app_id=? and metadata_fingerprint not in (select distinct metadata_fingerprint from raw_events where app_id=?)"

    .line 398
    invoke-virtual {v4, v6, v5}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;[Ljava/lang/Object;)V
    :try_end_b
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_b .. :try_end_b} :catch_1
    .catchall {:try_start_b .. :try_end_b} :catchall_0

    goto :goto_3a

    :catch_1
    move-exception v0

    move-object v4, v0

    .line 264
    :try_start_c
    iget-object v2, v2, Lcom/google/android/gms/measurement/internal/zzgl;->zzs:Lcom/google/android/gms/measurement/internal/zzfs;

    .line 399
    invoke-virtual {v2}, Lcom/google/android/gms/measurement/internal/zzfs;->zzay()Lcom/google/android/gms/measurement/internal/zzei;

    move-result-object v2

    .line 400
    invoke-virtual {v2}, Lcom/google/android/gms/measurement/internal/zzei;->zzd()Lcom/google/android/gms/measurement/internal/zzeg;

    move-result-object v2

    const-string v5, "Failed to remove unused event metadata. appId"

    invoke-static {v3}, Lcom/google/android/gms/measurement/internal/zzei;->zzn(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    .line 401
    invoke-virtual {v2, v5, v3, v4}, Lcom/google/android/gms/measurement/internal/zzeg;->zzc(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 398
    :goto_3a
    iget-object v2, v1, Lcom/google/android/gms/measurement/internal/zzkn;->zze:Lcom/google/android/gms/measurement/internal/zzaj;

    .line 402
    invoke-static {v2}, Lcom/google/android/gms/measurement/internal/zzkn;->zzak(Lcom/google/android/gms/measurement/internal/zzkd;)Lcom/google/android/gms/measurement/internal/zzkd;

    .line 403
    invoke-virtual {v2}, Lcom/google/android/gms/measurement/internal/zzaj;->zzC()V
    :try_end_c
    .catchall {:try_start_c .. :try_end_c} :catchall_0

    iget-object v2, v1, Lcom/google/android/gms/measurement/internal/zzkn;->zze:Lcom/google/android/gms/measurement/internal/zzaj;

    .line 9
    invoke-static {v2}, Lcom/google/android/gms/measurement/internal/zzkn;->zzak(Lcom/google/android/gms/measurement/internal/zzkd;)Lcom/google/android/gms/measurement/internal/zzkd;

    .line 10
    invoke-virtual {v2}, Lcom/google/android/gms/measurement/internal/zzaj;->zzx()V

    const/4 v2, 0x1

    return v2

    .line 6
    :cond_69
    :goto_3b
    :try_start_d
    iget-object v2, v1, Lcom/google/android/gms/measurement/internal/zzkn;->zze:Lcom/google/android/gms/measurement/internal/zzaj;

    .line 7
    invoke-static {v2}, Lcom/google/android/gms/measurement/internal/zzkn;->zzak(Lcom/google/android/gms/measurement/internal/zzkd;)Lcom/google/android/gms/measurement/internal/zzkd;

    .line 8
    invoke-virtual {v2}, Lcom/google/android/gms/measurement/internal/zzaj;->zzC()V
    :try_end_d
    .catchall {:try_start_d .. :try_end_d} :catchall_0

    iget-object v2, v1, Lcom/google/android/gms/measurement/internal/zzkn;->zze:Lcom/google/android/gms/measurement/internal/zzaj;

    .line 9
    invoke-static {v2}, Lcom/google/android/gms/measurement/internal/zzkn;->zzak(Lcom/google/android/gms/measurement/internal/zzkd;)Lcom/google/android/gms/measurement/internal/zzkd;

    .line 10
    invoke-virtual {v2}, Lcom/google/android/gms/measurement/internal/zzaj;->zzx()V

    const/4 v2, 0x0

    return v2

    :catchall_0
    move-exception v0

    move-object v2, v0

    .line 209
    iget-object v3, v1, Lcom/google/android/gms/measurement/internal/zzkn;->zze:Lcom/google/android/gms/measurement/internal/zzaj;

    .line 9
    invoke-static {v3}, Lcom/google/android/gms/measurement/internal/zzkn;->zzak(Lcom/google/android/gms/measurement/internal/zzkd;)Lcom/google/android/gms/measurement/internal/zzkd;

    .line 10
    invoke-virtual {v3}, Lcom/google/android/gms/measurement/internal/zzaj;->zzx()V

    .line 404
    throw v2
.end method

.method private final zzai()Z
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzaz()Lcom/google/android/gms/measurement/internal/zzfp;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzgl;->zzg()V

    .line 2
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzB()V

    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzkn;->zze:Lcom/google/android/gms/measurement/internal/zzaj;

    .line 3
    invoke-static {v0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzak(Lcom/google/android/gms/measurement/internal/zzkd;)Lcom/google/android/gms/measurement/internal/zzkd;

    .line 4
    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzaj;->zzG()Z

    move-result v0

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzkn;->zze:Lcom/google/android/gms/measurement/internal/zzaj;

    .line 5
    invoke-static {v0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzak(Lcom/google/android/gms/measurement/internal/zzkd;)Lcom/google/android/gms/measurement/internal/zzkd;

    .line 6
    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzaj;->zzr()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    return v0

    :cond_1
    :goto_0
    const/4 v0, 0x1

    return v0
.end method

.method private final zzaj(Lcom/google/android/gms/internal/measurement/zzfn;Lcom/google/android/gms/internal/measurement/zzfn;)Z
    .locals 4

    .line 1
    invoke-virtual {p1}, Lcom/google/android/gms/internal/measurement/zzfn;->zzo()Ljava/lang/String;

    move-result-object v0

    const-string v1, "_e"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    .line 2
    invoke-static {v0}, Lcom/google/android/gms/common/internal/Preconditions;->checkArgument(Z)V

    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzkn;->zzi:Lcom/google/android/gms/measurement/internal/zzkp;

    .line 3
    invoke-static {v0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzak(Lcom/google/android/gms/measurement/internal/zzkd;)Lcom/google/android/gms/measurement/internal/zzkd;

    .line 4
    invoke-virtual {p1}, Lcom/google/android/gms/internal/measurement/zzjv;->zzaA()Lcom/google/android/gms/internal/measurement/zzjz;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/measurement/zzfo;

    const-string v1, "_sc"

    invoke-static {v0, v1}, Lcom/google/android/gms/measurement/internal/zzkp;->zzC(Lcom/google/android/gms/internal/measurement/zzfo;Ljava/lang/String;)Lcom/google/android/gms/internal/measurement/zzfs;

    move-result-object v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    move-object v0, v1

    goto :goto_0

    .line 8
    :cond_0
    invoke-virtual {v0}, Lcom/google/android/gms/internal/measurement/zzfs;->zzh()Ljava/lang/String;

    move-result-object v0

    .line 4
    :goto_0
    iget-object v2, p0, Lcom/google/android/gms/measurement/internal/zzkn;->zzi:Lcom/google/android/gms/measurement/internal/zzkp;

    .line 5
    invoke-static {v2}, Lcom/google/android/gms/measurement/internal/zzkn;->zzak(Lcom/google/android/gms/measurement/internal/zzkd;)Lcom/google/android/gms/measurement/internal/zzkd;

    .line 6
    invoke-virtual {p2}, Lcom/google/android/gms/internal/measurement/zzjv;->zzaA()Lcom/google/android/gms/internal/measurement/zzjz;

    move-result-object v2

    check-cast v2, Lcom/google/android/gms/internal/measurement/zzfo;

    const-string v3, "_pc"

    invoke-static {v2, v3}, Lcom/google/android/gms/measurement/internal/zzkp;->zzC(Lcom/google/android/gms/internal/measurement/zzfo;Ljava/lang/String;)Lcom/google/android/gms/internal/measurement/zzfs;

    move-result-object v2

    if-nez v2, :cond_1

    goto :goto_1

    .line 8
    :cond_1
    invoke-virtual {v2}, Lcom/google/android/gms/internal/measurement/zzfs;->zzh()Ljava/lang/String;

    move-result-object v1

    :goto_1
    if-eqz v1, :cond_2

    .line 7
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 8
    invoke-direct {p0, p1, p2}, Lcom/google/android/gms/measurement/internal/zzkn;->zzae(Lcom/google/android/gms/internal/measurement/zzfn;Lcom/google/android/gms/internal/measurement/zzfn;)V

    const/4 p1, 0x1

    return p1

    :cond_2
    const/4 p1, 0x0

    return p1
.end method

.method private static final zzak(Lcom/google/android/gms/measurement/internal/zzkd;)Lcom/google/android/gms/measurement/internal/zzkd;
    .locals 3

    if-eqz p0, :cond_1

    .line 1
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzkd;->zzaa()Z

    move-result v0

    if-eqz v0, :cond_0

    return-object p0

    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p0

    .line 2
    invoke-static {p0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    new-instance v2, Ljava/lang/StringBuilder;

    add-int/lit8 v1, v1, 0x1b

    invoke-direct {v2, v1}, Ljava/lang/StringBuilder;-><init>(I)V

    const-string v1, "Component not initialized: "

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {v0, p0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 0
    :cond_1
    new-instance p0, Ljava/lang/IllegalStateException;

    const-string v0, "Upload Component not created"

    .line 1
    invoke-direct {p0, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method static bridge synthetic zzp(Lcom/google/android/gms/measurement/internal/zzkn;)Lcom/google/android/gms/measurement/internal/zzfs;
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/measurement/internal/zzkn;->zzn:Lcom/google/android/gms/measurement/internal/zzfs;

    return-object p0
.end method

.method public static zzt(Landroid/content/Context;)Lcom/google/android/gms/measurement/internal/zzkn;
    .locals 3

    .line 1
    invoke-static {p0}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 2
    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/google/android/gms/measurement/internal/zzkn;->zzb:Lcom/google/android/gms/measurement/internal/zzkn;

    if-nez v0, :cond_1

    const-class v0, Lcom/google/android/gms/measurement/internal/zzkn;

    monitor-enter v0

    :try_start_0
    sget-object v1, Lcom/google/android/gms/measurement/internal/zzkn;->zzb:Lcom/google/android/gms/measurement/internal/zzkn;

    if-nez v1, :cond_0

    new-instance v1, Lcom/google/android/gms/measurement/internal/zzko;

    .line 3
    invoke-direct {v1, p0}, Lcom/google/android/gms/measurement/internal/zzko;-><init>(Landroid/content/Context;)V

    .line 4
    invoke-static {v1}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/google/android/gms/measurement/internal/zzko;

    new-instance v1, Lcom/google/android/gms/measurement/internal/zzkn;

    const/4 v2, 0x0

    .line 5
    invoke-direct {v1, p0, v2}, Lcom/google/android/gms/measurement/internal/zzkn;-><init>(Lcom/google/android/gms/measurement/internal/zzko;Lcom/google/android/gms/measurement/internal/zzfs;)V

    sput-object v1, Lcom/google/android/gms/measurement/internal/zzkn;->zzb:Lcom/google/android/gms/measurement/internal/zzkn;

    .line 6
    :cond_0
    monitor-exit v0

    goto :goto_0

    :catchall_0
    move-exception p0

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0

    :cond_1
    :goto_0
    sget-object p0, Lcom/google/android/gms/measurement/internal/zzkn;->zzb:Lcom/google/android/gms/measurement/internal/zzkn;

    return-object p0
.end method

.method static bridge synthetic zzy(Lcom/google/android/gms/measurement/internal/zzkn;Lcom/google/android/gms/measurement/internal/zzko;)V
    .locals 3

    .line 1
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzaz()Lcom/google/android/gms/measurement/internal/zzfp;

    move-result-object p1

    invoke-virtual {p1}, Lcom/google/android/gms/measurement/internal/zzgl;->zzg()V

    new-instance p1, Lcom/google/android/gms/measurement/internal/zzfa;

    .line 2
    invoke-direct {p1, p0}, Lcom/google/android/gms/measurement/internal/zzfa;-><init>(Lcom/google/android/gms/measurement/internal/zzkn;)V

    iput-object p1, p0, Lcom/google/android/gms/measurement/internal/zzkn;->zzm:Lcom/google/android/gms/measurement/internal/zzfa;

    .line 3
    new-instance p1, Lcom/google/android/gms/measurement/internal/zzaj;

    invoke-direct {p1, p0}, Lcom/google/android/gms/measurement/internal/zzaj;-><init>(Lcom/google/android/gms/measurement/internal/zzkn;)V

    .line 4
    invoke-virtual {p1}, Lcom/google/android/gms/measurement/internal/zzkd;->zzZ()V

    iput-object p1, p0, Lcom/google/android/gms/measurement/internal/zzkn;->zze:Lcom/google/android/gms/measurement/internal/zzaj;

    .line 5
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzg()Lcom/google/android/gms/measurement/internal/zzaf;

    move-result-object p1

    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzkn;->zzc:Lcom/google/android/gms/measurement/internal/zzfj;

    invoke-static {v0}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/measurement/internal/zzae;

    invoke-virtual {p1, v0}, Lcom/google/android/gms/measurement/internal/zzaf;->zzq(Lcom/google/android/gms/measurement/internal/zzae;)V

    new-instance p1, Lcom/google/android/gms/measurement/internal/zzjk;

    .line 6
    invoke-direct {p1, p0}, Lcom/google/android/gms/measurement/internal/zzjk;-><init>(Lcom/google/android/gms/measurement/internal/zzkn;)V

    .line 7
    invoke-virtual {p1}, Lcom/google/android/gms/measurement/internal/zzkd;->zzZ()V

    iput-object p1, p0, Lcom/google/android/gms/measurement/internal/zzkn;->zzk:Lcom/google/android/gms/measurement/internal/zzjk;

    new-instance p1, Lcom/google/android/gms/measurement/internal/zzz;

    .line 8
    invoke-direct {p1, p0}, Lcom/google/android/gms/measurement/internal/zzz;-><init>(Lcom/google/android/gms/measurement/internal/zzkn;)V

    .line 9
    invoke-virtual {p1}, Lcom/google/android/gms/measurement/internal/zzkd;->zzZ()V

    iput-object p1, p0, Lcom/google/android/gms/measurement/internal/zzkn;->zzh:Lcom/google/android/gms/measurement/internal/zzz;

    new-instance p1, Lcom/google/android/gms/measurement/internal/zzia;

    .line 10
    invoke-direct {p1, p0}, Lcom/google/android/gms/measurement/internal/zzia;-><init>(Lcom/google/android/gms/measurement/internal/zzkn;)V

    .line 11
    invoke-virtual {p1}, Lcom/google/android/gms/measurement/internal/zzkd;->zzZ()V

    iput-object p1, p0, Lcom/google/android/gms/measurement/internal/zzkn;->zzj:Lcom/google/android/gms/measurement/internal/zzia;

    new-instance p1, Lcom/google/android/gms/measurement/internal/zzkb;

    .line 12
    invoke-direct {p1, p0}, Lcom/google/android/gms/measurement/internal/zzkb;-><init>(Lcom/google/android/gms/measurement/internal/zzkn;)V

    .line 13
    invoke-virtual {p1}, Lcom/google/android/gms/measurement/internal/zzkd;->zzZ()V

    iput-object p1, p0, Lcom/google/android/gms/measurement/internal/zzkn;->zzg:Lcom/google/android/gms/measurement/internal/zzkb;

    .line 14
    new-instance p1, Lcom/google/android/gms/measurement/internal/zzeq;

    invoke-direct {p1, p0}, Lcom/google/android/gms/measurement/internal/zzeq;-><init>(Lcom/google/android/gms/measurement/internal/zzkn;)V

    iput-object p1, p0, Lcom/google/android/gms/measurement/internal/zzkn;->zzf:Lcom/google/android/gms/measurement/internal/zzeq;

    iget p1, p0, Lcom/google/android/gms/measurement/internal/zzkn;->zzr:I

    iget v0, p0, Lcom/google/android/gms/measurement/internal/zzkn;->zzs:I

    if-eq p1, v0, :cond_0

    .line 15
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzay()Lcom/google/android/gms/measurement/internal/zzei;

    move-result-object p1

    .line 16
    invoke-virtual {p1}, Lcom/google/android/gms/measurement/internal/zzei;->zzd()Lcom/google/android/gms/measurement/internal/zzeg;

    move-result-object p1

    iget v0, p0, Lcom/google/android/gms/measurement/internal/zzkn;->zzr:I

    .line 17
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    iget v1, p0, Lcom/google/android/gms/measurement/internal/zzkn;->zzs:I

    .line 18
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Not all upload components initialized"

    .line 19
    invoke-virtual {p1, v2, v0, v1}, Lcom/google/android/gms/measurement/internal/zzeg;->zzc(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    :cond_0
    const/4 p1, 0x1

    iput-boolean p1, p0, Lcom/google/android/gms/measurement/internal/zzkn;->zzo:Z

    return-void
.end method


# virtual methods
.method final zzA()V
    .locals 10

    .line 1
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzaz()Lcom/google/android/gms/measurement/internal/zzfp;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzgl;->zzg()V

    .line 2
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzB()V

    iget-boolean v0, p0, Lcom/google/android/gms/measurement/internal/zzkn;->zzp:Z

    if-nez v0, :cond_9

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/google/android/gms/measurement/internal/zzkn;->zzp:Z

    .line 3
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzX()Z

    move-result v1

    if-eqz v1, :cond_9

    iget-object v1, p0, Lcom/google/android/gms/measurement/internal/zzkn;->zzx:Ljava/nio/channels/FileChannel;

    .line 4
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzaz()Lcom/google/android/gms/measurement/internal/zzfp;

    move-result-object v2

    invoke-virtual {v2}, Lcom/google/android/gms/measurement/internal/zzgl;->zzg()V

    const-string v2, "Bad channel to read from"

    const-wide/16 v3, 0x0

    const/4 v5, 0x4

    const/4 v6, 0x0

    if-eqz v1, :cond_2

    .line 5
    invoke-virtual {v1}, Ljava/nio/channels/FileChannel;->isOpen()Z

    move-result v7

    if-nez v7, :cond_0

    goto :goto_0

    .line 7
    :cond_0
    invoke-static {v5}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    move-result-object v7

    .line 8
    :try_start_0
    invoke-virtual {v1, v3, v4}, Ljava/nio/channels/FileChannel;->position(J)Ljava/nio/channels/FileChannel;

    .line 9
    invoke-virtual {v1, v7}, Ljava/nio/channels/FileChannel;->read(Ljava/nio/ByteBuffer;)I

    move-result v1

    if-eq v1, v5, :cond_1

    const/4 v7, -0x1

    if-eq v1, v7, :cond_3

    .line 10
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzay()Lcom/google/android/gms/measurement/internal/zzei;

    move-result-object v7

    invoke-virtual {v7}, Lcom/google/android/gms/measurement/internal/zzei;->zzk()Lcom/google/android/gms/measurement/internal/zzeg;

    move-result-object v7

    const-string v8, "Unexpected data length. Bytes read"

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v7, v8, v1}, Lcom/google/android/gms/measurement/internal/zzeg;->zzb(Ljava/lang/String;Ljava/lang/Object;)V

    goto :goto_1

    .line 11
    :cond_1
    invoke-virtual {v7}, Ljava/nio/ByteBuffer;->flip()Ljava/nio/Buffer;

    .line 12
    invoke-virtual {v7}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v6
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    :catch_0
    move-exception v1

    .line 13
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzay()Lcom/google/android/gms/measurement/internal/zzei;

    move-result-object v7

    invoke-virtual {v7}, Lcom/google/android/gms/measurement/internal/zzei;->zzd()Lcom/google/android/gms/measurement/internal/zzeg;

    move-result-object v7

    const-string v8, "Failed to read from channel"

    invoke-virtual {v7, v8, v1}, Lcom/google/android/gms/measurement/internal/zzeg;->zzb(Ljava/lang/String;Ljava/lang/Object;)V

    goto :goto_1

    .line 6
    :cond_2
    :goto_0
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzay()Lcom/google/android/gms/measurement/internal/zzei;

    move-result-object v1

    invoke-virtual {v1}, Lcom/google/android/gms/measurement/internal/zzei;->zzd()Lcom/google/android/gms/measurement/internal/zzeg;

    move-result-object v1

    invoke-virtual {v1, v2}, Lcom/google/android/gms/measurement/internal/zzeg;->zza(Ljava/lang/String;)V

    :cond_3
    :goto_1
    iget-object v1, p0, Lcom/google/android/gms/measurement/internal/zzkn;->zzn:Lcom/google/android/gms/measurement/internal/zzfs;

    .line 14
    invoke-virtual {v1}, Lcom/google/android/gms/measurement/internal/zzfs;->zzh()Lcom/google/android/gms/measurement/internal/zzea;

    move-result-object v1

    invoke-virtual {v1}, Lcom/google/android/gms/measurement/internal/zzea;->zzi()I

    move-result v1

    .line 15
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzaz()Lcom/google/android/gms/measurement/internal/zzfp;

    move-result-object v7

    invoke-virtual {v7}, Lcom/google/android/gms/measurement/internal/zzgl;->zzg()V

    if-le v6, v1, :cond_4

    .line 16
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzay()Lcom/google/android/gms/measurement/internal/zzei;

    move-result-object v0

    .line 17
    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzei;->zzd()Lcom/google/android/gms/measurement/internal/zzeg;

    move-result-object v0

    .line 18
    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    .line 19
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v3, "Panic: can\'t downgrade version. Previous, current version"

    .line 20
    invoke-virtual {v0, v3, v2, v1}, Lcom/google/android/gms/measurement/internal/zzeg;->zzc(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    return-void

    :cond_4
    if-ge v6, v1, :cond_9

    iget-object v7, p0, Lcom/google/android/gms/measurement/internal/zzkn;->zzx:Ljava/nio/channels/FileChannel;

    .line 21
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzaz()Lcom/google/android/gms/measurement/internal/zzfp;

    move-result-object v8

    invoke-virtual {v8}, Lcom/google/android/gms/measurement/internal/zzgl;->zzg()V

    if-eqz v7, :cond_8

    .line 22
    invoke-virtual {v7}, Ljava/nio/channels/FileChannel;->isOpen()Z

    move-result v8

    if-nez v8, :cond_5

    goto :goto_2

    .line 24
    :cond_5
    invoke-static {v5}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    move-result-object v2

    .line 25
    invoke-virtual {v2, v1}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    .line 26
    invoke-virtual {v2}, Ljava/nio/ByteBuffer;->flip()Ljava/nio/Buffer;

    .line 27
    :try_start_1
    invoke-virtual {v7, v3, v4}, Ljava/nio/channels/FileChannel;->truncate(J)Ljava/nio/channels/FileChannel;

    .line 28
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzg()Lcom/google/android/gms/measurement/internal/zzaf;

    move-result-object v5

    sget-object v8, Lcom/google/android/gms/measurement/internal/zzdw;->zzal:Lcom/google/android/gms/measurement/internal/zzdv;

    const/4 v9, 0x0

    invoke-virtual {v5, v9, v8}, Lcom/google/android/gms/measurement/internal/zzaf;->zzs(Ljava/lang/String;Lcom/google/android/gms/measurement/internal/zzdv;)Z

    move-result v5

    if-eqz v5, :cond_6

    sget v5, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v8, 0x13

    if-gt v5, v8, :cond_6

    .line 29
    invoke-virtual {v7, v3, v4}, Ljava/nio/channels/FileChannel;->position(J)Ljava/nio/channels/FileChannel;

    .line 30
    :cond_6
    invoke-virtual {v7, v2}, Ljava/nio/channels/FileChannel;->write(Ljava/nio/ByteBuffer;)I

    .line 31
    invoke-virtual {v7, v0}, Ljava/nio/channels/FileChannel;->force(Z)V

    .line 32
    invoke-virtual {v7}, Ljava/nio/channels/FileChannel;->size()J

    move-result-wide v2

    const-wide/16 v4, 0x4

    cmp-long v0, v2, v4

    if-eqz v0, :cond_7

    .line 33
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzay()Lcom/google/android/gms/measurement/internal/zzei;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzei;->zzd()Lcom/google/android/gms/measurement/internal/zzeg;

    move-result-object v0

    const-string v2, "Error writing to channel. Bytes written"

    invoke-virtual {v7}, Ljava/nio/channels/FileChannel;->size()J

    move-result-wide v3

    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    invoke-virtual {v0, v2, v3}, Lcom/google/android/gms/measurement/internal/zzeg;->zzb(Ljava/lang/String;Ljava/lang/Object;)V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1

    .line 40
    :cond_7
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzay()Lcom/google/android/gms/measurement/internal/zzei;

    move-result-object v0

    .line 41
    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzei;->zzj()Lcom/google/android/gms/measurement/internal/zzeg;

    move-result-object v0

    .line 42
    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v3, "Storage version upgraded. Previous, current version"

    invoke-virtual {v0, v3, v2, v1}, Lcom/google/android/gms/measurement/internal/zzeg;->zzc(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    return-void

    :catch_1
    move-exception v0

    .line 34
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzay()Lcom/google/android/gms/measurement/internal/zzei;

    move-result-object v2

    invoke-virtual {v2}, Lcom/google/android/gms/measurement/internal/zzei;->zzd()Lcom/google/android/gms/measurement/internal/zzeg;

    move-result-object v2

    const-string v3, "Failed to write to channel"

    invoke-virtual {v2, v3, v0}, Lcom/google/android/gms/measurement/internal/zzeg;->zzb(Ljava/lang/String;Ljava/lang/Object;)V

    goto :goto_3

    .line 23
    :cond_8
    :goto_2
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzay()Lcom/google/android/gms/measurement/internal/zzei;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzei;->zzd()Lcom/google/android/gms/measurement/internal/zzeg;

    move-result-object v0

    invoke-virtual {v0, v2}, Lcom/google/android/gms/measurement/internal/zzeg;->zza(Ljava/lang/String;)V

    .line 35
    :goto_3
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzay()Lcom/google/android/gms/measurement/internal/zzei;

    move-result-object v0

    .line 36
    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzei;->zzd()Lcom/google/android/gms/measurement/internal/zzeg;

    move-result-object v0

    .line 37
    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    .line 38
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v3, "Storage version upgrade failed. Previous, current version"

    .line 39
    invoke-virtual {v0, v3, v2, v1}, Lcom/google/android/gms/measurement/internal/zzeg;->zzc(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    :cond_9
    return-void
.end method

.method final zzB()V
    .locals 2

    iget-boolean v0, p0, Lcom/google/android/gms/measurement/internal/zzkn;->zzo:Z

    if-eqz v0, :cond_0

    return-void

    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "UploadController is not initialized"

    .line 1
    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method final zzC(Lcom/google/android/gms/measurement/internal/zzg;)V
    .locals 12

    .line 1
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzaz()Lcom/google/android/gms/measurement/internal/zzfp;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzgl;->zzg()V

    .line 2
    invoke-static {}, Lcom/google/android/gms/internal/measurement/zzoq;->zzc()Z

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzg()Lcom/google/android/gms/measurement/internal/zzaf;

    move-result-object v0

    invoke-virtual {p1}, Lcom/google/android/gms/measurement/internal/zzg;->zzt()Ljava/lang/String;

    move-result-object v1

    sget-object v2, Lcom/google/android/gms/measurement/internal/zzdw;->zzad:Lcom/google/android/gms/measurement/internal/zzdv;

    invoke-virtual {v0, v1, v2}, Lcom/google/android/gms/measurement/internal/zzaf;->zzs(Ljava/lang/String;Lcom/google/android/gms/measurement/internal/zzdv;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 6
    invoke-virtual {p1}, Lcom/google/android/gms/measurement/internal/zzg;->zzz()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 7
    invoke-virtual {p1}, Lcom/google/android/gms/measurement/internal/zzg;->zzy()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 8
    invoke-virtual {p1}, Lcom/google/android/gms/measurement/internal/zzg;->zzr()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    goto :goto_0

    .line 52
    :cond_0
    invoke-virtual {p1}, Lcom/google/android/gms/measurement/internal/zzg;->zzt()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    move-object v1, p1

    check-cast v1, Ljava/lang/String;

    const/16 v2, 0xcc

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    move-object v0, p0

    .line 53
    invoke-virtual/range {v0 .. v5}, Lcom/google/android/gms/measurement/internal/zzkn;->zzH(Ljava/lang/String;ILjava/lang/Throwable;[BLjava/util/Map;)V

    return-void

    .line 3
    :cond_1
    invoke-virtual {p1}, Lcom/google/android/gms/measurement/internal/zzg;->zzz()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-virtual {p1}, Lcom/google/android/gms/measurement/internal/zzg;->zzr()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 4
    invoke-virtual {p1}, Lcom/google/android/gms/measurement/internal/zzg;->zzt()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    move-object v1, p1

    check-cast v1, Ljava/lang/String;

    const/16 v2, 0xcc

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    move-object v0, p0

    .line 5
    invoke-virtual/range {v0 .. v5}, Lcom/google/android/gms/measurement/internal/zzkn;->zzH(Ljava/lang/String;ILjava/lang/Throwable;[BLjava/util/Map;)V

    return-void

    .line 8
    :cond_2
    :goto_0
    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzkn;->zzl:Lcom/google/android/gms/measurement/internal/zzke;

    new-instance v1, Landroid/net/Uri$Builder;

    .line 9
    invoke-direct {v1}, Landroid/net/Uri$Builder;-><init>()V

    .line 10
    invoke-virtual {p1}, Lcom/google/android/gms/measurement/internal/zzg;->zzz()Ljava/lang/String;

    move-result-object v2

    .line 11
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_4

    .line 12
    invoke-static {}, Lcom/google/android/gms/internal/measurement/zzoq;->zzc()Z

    iget-object v2, v0, Lcom/google/android/gms/measurement/internal/zzgl;->zzs:Lcom/google/android/gms/measurement/internal/zzfs;

    .line 13
    invoke-virtual {v2}, Lcom/google/android/gms/measurement/internal/zzfs;->zzf()Lcom/google/android/gms/measurement/internal/zzaf;

    move-result-object v2

    .line 12
    invoke-virtual {p1}, Lcom/google/android/gms/measurement/internal/zzg;->zzt()Ljava/lang/String;

    move-result-object v3

    sget-object v4, Lcom/google/android/gms/measurement/internal/zzdw;->zzad:Lcom/google/android/gms/measurement/internal/zzdv;

    invoke-virtual {v2, v3, v4}, Lcom/google/android/gms/measurement/internal/zzaf;->zzs(Ljava/lang/String;Lcom/google/android/gms/measurement/internal/zzdv;)Z

    move-result v2

    if-eqz v2, :cond_3

    .line 15
    invoke-virtual {p1}, Lcom/google/android/gms/measurement/internal/zzg;->zzy()Ljava/lang/String;

    move-result-object v2

    .line 16
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_4

    .line 17
    invoke-virtual {p1}, Lcom/google/android/gms/measurement/internal/zzg;->zzr()Ljava/lang/String;

    move-result-object v2

    goto :goto_1

    .line 14
    :cond_3
    invoke-virtual {p1}, Lcom/google/android/gms/measurement/internal/zzg;->zzr()Ljava/lang/String;

    move-result-object v2

    .line 17
    :cond_4
    :goto_1
    sget-object v3, Lcom/google/android/gms/measurement/internal/zzdw;->zzd:Lcom/google/android/gms/measurement/internal/zzdv;

    const/4 v4, 0x0

    .line 18
    invoke-virtual {v3, v4}, Lcom/google/android/gms/measurement/internal/zzdv;->zza(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-virtual {v1, v3}, Landroid/net/Uri$Builder;->scheme(Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v3

    sget-object v5, Lcom/google/android/gms/measurement/internal/zzdw;->zze:Lcom/google/android/gms/measurement/internal/zzdv;

    .line 19
    invoke-virtual {v5, v4}, Lcom/google/android/gms/measurement/internal/zzdv;->zza(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    invoke-virtual {v3, v5}, Landroid/net/Uri$Builder;->encodedAuthority(Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v3

    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    const-string v5, "config/app/"

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v6

    if-eqz v6, :cond_5

    invoke-virtual {v5, v2}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    goto :goto_2

    .line 47
    :cond_5
    new-instance v2, Ljava/lang/String;

    .line 19
    invoke-direct {v2, v5}, Ljava/lang/String;-><init>(Ljava/lang/String;)V

    .line 20
    :goto_2
    invoke-virtual {v3, v2}, Landroid/net/Uri$Builder;->path(Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v2

    .line 21
    invoke-virtual {p1}, Lcom/google/android/gms/measurement/internal/zzg;->zzu()Ljava/lang/String;

    move-result-object v3

    const-string v5, "app_instance_id"

    invoke-virtual {v2, v5, v3}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v2

    const-string v3, "platform"

    const-string v5, "android"

    .line 22
    invoke-virtual {v2, v3, v5}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v2

    iget-object v3, v0, Lcom/google/android/gms/measurement/internal/zzgl;->zzs:Lcom/google/android/gms/measurement/internal/zzfs;

    .line 23
    invoke-virtual {v3}, Lcom/google/android/gms/measurement/internal/zzfs;->zzf()Lcom/google/android/gms/measurement/internal/zzaf;

    move-result-object v3

    .line 24
    invoke-virtual {v3}, Lcom/google/android/gms/measurement/internal/zzaf;->zzh()J

    const-wide/32 v5, 0xa471

    invoke-static {v5, v6}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v3

    const-string v5, "gmp_version"

    invoke-virtual {v2, v5, v3}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    .line 25
    invoke-static {}, Lcom/google/android/gms/internal/measurement/zzpl;->zzc()Z

    iget-object v0, v0, Lcom/google/android/gms/measurement/internal/zzgl;->zzs:Lcom/google/android/gms/measurement/internal/zzfs;

    .line 26
    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzfs;->zzf()Lcom/google/android/gms/measurement/internal/zzaf;

    move-result-object v0

    .line 25
    invoke-virtual {p1}, Lcom/google/android/gms/measurement/internal/zzg;->zzt()Ljava/lang/String;

    move-result-object v2

    sget-object v3, Lcom/google/android/gms/measurement/internal/zzdw;->zzav:Lcom/google/android/gms/measurement/internal/zzdv;

    invoke-virtual {v0, v2, v3}, Lcom/google/android/gms/measurement/internal/zzaf;->zzs(Ljava/lang/String;Lcom/google/android/gms/measurement/internal/zzdv;)Z

    move-result v0

    if-eqz v0, :cond_6

    const-string v0, "runtime_version"

    const-string v2, "0"

    .line 27
    invoke-virtual {v1, v0, v2}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    .line 28
    :cond_6
    invoke-virtual {v1}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object v0

    invoke-virtual {v0}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v0

    .line 29
    :try_start_0
    invoke-virtual {p1}, Lcom/google/android/gms/measurement/internal/zzg;->zzt()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    move-object v7, v1

    check-cast v7, Ljava/lang/String;

    .line 30
    new-instance v8, Ljava/net/URL;

    invoke-direct {v8, v0}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    .line 31
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzay()Lcom/google/android/gms/measurement/internal/zzei;

    move-result-object v1

    invoke-virtual {v1}, Lcom/google/android/gms/measurement/internal/zzei;->zzj()Lcom/google/android/gms/measurement/internal/zzeg;

    move-result-object v1

    const-string v2, "Fetching remote configuration"

    invoke-virtual {v1, v2, v7}, Lcom/google/android/gms/measurement/internal/zzeg;->zzb(Ljava/lang/String;Ljava/lang/Object;)V

    iget-object v1, p0, Lcom/google/android/gms/measurement/internal/zzkn;->zzc:Lcom/google/android/gms/measurement/internal/zzfj;

    .line 32
    invoke-static {v1}, Lcom/google/android/gms/measurement/internal/zzkn;->zzak(Lcom/google/android/gms/measurement/internal/zzkd;)Lcom/google/android/gms/measurement/internal/zzkd;

    .line 33
    invoke-virtual {v1, v7}, Lcom/google/android/gms/measurement/internal/zzfj;->zze(Ljava/lang/String;)Lcom/google/android/gms/internal/measurement/zzfc;

    move-result-object v1

    iget-object v2, p0, Lcom/google/android/gms/measurement/internal/zzkn;->zzc:Lcom/google/android/gms/measurement/internal/zzfj;

    .line 34
    invoke-static {v2}, Lcom/google/android/gms/measurement/internal/zzkn;->zzak(Lcom/google/android/gms/measurement/internal/zzkd;)Lcom/google/android/gms/measurement/internal/zzkd;

    .line 35
    invoke-virtual {v2, v7}, Lcom/google/android/gms/measurement/internal/zzfj;->zzf(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    if-eqz v1, :cond_7

    .line 36
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_7

    .line 37
    new-instance v4, Landroidx/collection/ArrayMap;

    invoke-direct {v4}, Landroidx/collection/ArrayMap;-><init>()V

    const-string v1, "If-Modified-Since"

    .line 38
    invoke-interface {v4, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_7
    move-object v10, v4

    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/google/android/gms/measurement/internal/zzkn;->zzt:Z

    iget-object v6, p0, Lcom/google/android/gms/measurement/internal/zzkn;->zzd:Lcom/google/android/gms/measurement/internal/zzeo;

    .line 39
    invoke-static {v6}, Lcom/google/android/gms/measurement/internal/zzkn;->zzak(Lcom/google/android/gms/measurement/internal/zzkd;)Lcom/google/android/gms/measurement/internal/zzkd;

    new-instance v11, Lcom/google/android/gms/measurement/internal/zzkh;

    .line 40
    invoke-direct {v11, p0}, Lcom/google/android/gms/measurement/internal/zzkh;-><init>(Lcom/google/android/gms/measurement/internal/zzkn;)V

    .line 41
    invoke-virtual {v6}, Lcom/google/android/gms/measurement/internal/zzgl;->zzg()V

    .line 42
    invoke-virtual {v6}, Lcom/google/android/gms/measurement/internal/zzkd;->zzY()V

    .line 43
    invoke-static {v8}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 44
    invoke-static {v11}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v1, v6, Lcom/google/android/gms/measurement/internal/zzgl;->zzs:Lcom/google/android/gms/measurement/internal/zzfs;

    .line 45
    invoke-virtual {v1}, Lcom/google/android/gms/measurement/internal/zzfs;->zzaz()Lcom/google/android/gms/measurement/internal/zzfp;

    move-result-object v1

    new-instance v2, Lcom/google/android/gms/measurement/internal/zzen;

    const/4 v9, 0x0

    move-object v5, v2

    .line 46
    invoke-direct/range {v5 .. v11}, Lcom/google/android/gms/measurement/internal/zzen;-><init>(Lcom/google/android/gms/measurement/internal/zzeo;Ljava/lang/String;Ljava/net/URL;[BLjava/util/Map;Lcom/google/android/gms/measurement/internal/zzek;)V

    .line 47
    invoke-virtual {v1, v2}, Lcom/google/android/gms/measurement/internal/zzfp;->zzo(Ljava/lang/Runnable;)V
    :try_end_0
    .catch Ljava/net/MalformedURLException; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    .line 48
    :catch_0
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzay()Lcom/google/android/gms/measurement/internal/zzei;

    move-result-object v1

    .line 49
    invoke-virtual {v1}, Lcom/google/android/gms/measurement/internal/zzei;->zzd()Lcom/google/android/gms/measurement/internal/zzeg;

    move-result-object v1

    .line 50
    invoke-virtual {p1}, Lcom/google/android/gms/measurement/internal/zzg;->zzt()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lcom/google/android/gms/measurement/internal/zzei;->zzn(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    const-string v2, "Failed to parse config URL. Not fetching. appId"

    .line 51
    invoke-virtual {v1, v2, p1, v0}, Lcom/google/android/gms/measurement/internal/zzeg;->zzc(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    return-void
.end method

.method final zzD(Lcom/google/android/gms/measurement/internal/zzat;Lcom/google/android/gms/measurement/internal/zzp;)V
    .locals 18

    move-object/from16 v1, p0

    move-object/from16 v0, p2

    .line 1
    invoke-static/range {p2 .. p2}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 2
    iget-object v2, v0, Lcom/google/android/gms/measurement/internal/zzp;->zza:Ljava/lang/String;

    invoke-static {v2}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotEmpty(Ljava/lang/String;)Ljava/lang/String;

    .line 3
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzaz()Lcom/google/android/gms/measurement/internal/zzfp;

    move-result-object v2

    invoke-virtual {v2}, Lcom/google/android/gms/measurement/internal/zzgl;->zzg()V

    .line 4
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzB()V

    .line 5
    iget-object v2, v0, Lcom/google/android/gms/measurement/internal/zzp;->zza:Ljava/lang/String;

    move-object/from16 v3, p1

    .line 6
    iget-wide v10, v3, Lcom/google/android/gms/measurement/internal/zzat;->zzd:J

    .line 7
    invoke-static {}, Lcom/google/android/gms/internal/measurement/zzpx;->zzc()Z

    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzg()Lcom/google/android/gms/measurement/internal/zzaf;

    move-result-object v4

    sget-object v5, Lcom/google/android/gms/measurement/internal/zzdw;->zzaA:Lcom/google/android/gms/measurement/internal/zzdv;

    const/4 v6, 0x0

    invoke-virtual {v4, v6, v5}, Lcom/google/android/gms/measurement/internal/zzaf;->zzs(Ljava/lang/String;Lcom/google/android/gms/measurement/internal/zzdv;)Z

    move-result v4

    const/4 v5, 0x0

    if-eqz v4, :cond_0

    .line 8
    invoke-static/range {p1 .. p1}, Lcom/google/android/gms/measurement/internal/zzej;->zzb(Lcom/google/android/gms/measurement/internal/zzat;)Lcom/google/android/gms/measurement/internal/zzej;

    move-result-object v3

    .line 9
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzaz()Lcom/google/android/gms/measurement/internal/zzfp;

    move-result-object v4

    invoke-virtual {v4}, Lcom/google/android/gms/measurement/internal/zzgl;->zzg()V

    iget-object v4, v3, Lcom/google/android/gms/measurement/internal/zzej;->zzd:Landroid/os/Bundle;

    .line 10
    invoke-static {v6, v4, v5}, Lcom/google/android/gms/measurement/internal/zzku;->zzJ(Lcom/google/android/gms/measurement/internal/zzic;Landroid/os/Bundle;Z)V

    .line 11
    invoke-virtual {v3}, Lcom/google/android/gms/measurement/internal/zzej;->zza()Lcom/google/android/gms/measurement/internal/zzat;

    move-result-object v3

    :cond_0
    iget-object v4, v1, Lcom/google/android/gms/measurement/internal/zzkn;->zzi:Lcom/google/android/gms/measurement/internal/zzkp;

    .line 12
    invoke-static {v4}, Lcom/google/android/gms/measurement/internal/zzkn;->zzak(Lcom/google/android/gms/measurement/internal/zzkd;)Lcom/google/android/gms/measurement/internal/zzkd;

    .line 13
    invoke-static {v3, v0}, Lcom/google/android/gms/measurement/internal/zzkp;->zzB(Lcom/google/android/gms/measurement/internal/zzat;Lcom/google/android/gms/measurement/internal/zzp;)Z

    move-result v4

    if-nez v4, :cond_1

    return-void

    .line 14
    :cond_1
    iget-boolean v4, v0, Lcom/google/android/gms/measurement/internal/zzp;->zzh:Z

    if-nez v4, :cond_2

    .line 15
    invoke-virtual {v1, v0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzd(Lcom/google/android/gms/measurement/internal/zzp;)Lcom/google/android/gms/measurement/internal/zzg;

    return-void

    .line 16
    :cond_2
    iget-object v4, v0, Lcom/google/android/gms/measurement/internal/zzp;->zzt:Ljava/util/List;

    if-eqz v4, :cond_4

    .line 17
    iget-object v6, v3, Lcom/google/android/gms/measurement/internal/zzat;->zza:Ljava/lang/String;

    invoke-interface {v4, v6}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_3

    .line 18
    iget-object v4, v3, Lcom/google/android/gms/measurement/internal/zzat;->zzb:Lcom/google/android/gms/measurement/internal/zzar;

    invoke-virtual {v4}, Lcom/google/android/gms/measurement/internal/zzar;->zzc()Landroid/os/Bundle;

    move-result-object v4

    const-wide/16 v6, 0x1

    const-string v8, "ga_safelisted"

    .line 19
    invoke-virtual {v4, v8, v6, v7}, Landroid/os/Bundle;->putLong(Ljava/lang/String;J)V

    new-instance v6, Lcom/google/android/gms/measurement/internal/zzat;

    .line 20
    iget-object v13, v3, Lcom/google/android/gms/measurement/internal/zzat;->zza:Ljava/lang/String;

    new-instance v14, Lcom/google/android/gms/measurement/internal/zzar;

    invoke-direct {v14, v4}, Lcom/google/android/gms/measurement/internal/zzar;-><init>(Landroid/os/Bundle;)V

    iget-object v15, v3, Lcom/google/android/gms/measurement/internal/zzat;->zzc:Ljava/lang/String;

    iget-wide v3, v3, Lcom/google/android/gms/measurement/internal/zzat;->zzd:J

    move-object v12, v6

    move-wide/from16 v16, v3

    invoke-direct/range {v12 .. v17}, Lcom/google/android/gms/measurement/internal/zzat;-><init>(Ljava/lang/String;Lcom/google/android/gms/measurement/internal/zzar;Ljava/lang/String;J)V

    goto :goto_0

    .line 113
    :cond_3
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzay()Lcom/google/android/gms/measurement/internal/zzei;

    move-result-object v0

    .line 114
    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzei;->zzc()Lcom/google/android/gms/measurement/internal/zzeg;

    move-result-object v0

    iget-object v4, v3, Lcom/google/android/gms/measurement/internal/zzat;->zza:Ljava/lang/String;

    iget-object v3, v3, Lcom/google/android/gms/measurement/internal/zzat;->zzc:Ljava/lang/String;

    const-string v5, "Dropping non-safelisted event. appId, event name, origin"

    .line 115
    invoke-virtual {v0, v5, v2, v4, v3}, Lcom/google/android/gms/measurement/internal/zzeg;->zzd(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    return-void

    :cond_4
    move-object v12, v3

    .line 20
    :goto_0
    iget-object v3, v1, Lcom/google/android/gms/measurement/internal/zzkn;->zze:Lcom/google/android/gms/measurement/internal/zzaj;

    .line 21
    invoke-static {v3}, Lcom/google/android/gms/measurement/internal/zzkn;->zzak(Lcom/google/android/gms/measurement/internal/zzkd;)Lcom/google/android/gms/measurement/internal/zzkd;

    .line 22
    invoke-virtual {v3}, Lcom/google/android/gms/measurement/internal/zzaj;->zzw()V

    :try_start_0
    iget-object v3, v1, Lcom/google/android/gms/measurement/internal/zzkn;->zze:Lcom/google/android/gms/measurement/internal/zzaj;

    .line 23
    invoke-static {v3}, Lcom/google/android/gms/measurement/internal/zzkn;->zzak(Lcom/google/android/gms/measurement/internal/zzkd;)Lcom/google/android/gms/measurement/internal/zzkd;

    .line 24
    invoke-static {v2}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotEmpty(Ljava/lang/String;)Ljava/lang/String;

    .line 25
    invoke-virtual {v3}, Lcom/google/android/gms/measurement/internal/zzgl;->zzg()V

    .line 26
    invoke-virtual {v3}, Lcom/google/android/gms/measurement/internal/zzkd;->zzY()V

    const-wide/16 v6, 0x0

    const/4 v4, 0x2

    const/4 v13, 0x1

    cmp-long v8, v10, v6

    if-gez v8, :cond_5

    iget-object v3, v3, Lcom/google/android/gms/measurement/internal/zzgl;->zzs:Lcom/google/android/gms/measurement/internal/zzfs;

    .line 27
    invoke-virtual {v3}, Lcom/google/android/gms/measurement/internal/zzfs;->zzay()Lcom/google/android/gms/measurement/internal/zzei;

    move-result-object v3

    .line 28
    invoke-virtual {v3}, Lcom/google/android/gms/measurement/internal/zzei;->zzk()Lcom/google/android/gms/measurement/internal/zzeg;

    move-result-object v3

    const-string v6, "Invalid time querying timed out conditional properties"

    invoke-static {v2}, Lcom/google/android/gms/measurement/internal/zzei;->zzn(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v7

    .line 29
    invoke-static {v10, v11}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v9

    .line 30
    invoke-virtual {v3, v6, v7, v9}, Lcom/google/android/gms/measurement/internal/zzeg;->zzc(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 31
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v3

    goto :goto_1

    :cond_5
    new-array v6, v4, [Ljava/lang/String;

    aput-object v2, v6, v5

    .line 32
    invoke-static {v10, v11}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v7

    aput-object v7, v6, v13

    const-string v7, "active=0 and app_id=? and abs(? - creation_timestamp) > trigger_timeout"

    .line 33
    invoke-virtual {v3, v7, v6}, Lcom/google/android/gms/measurement/internal/zzaj;->zzt(Ljava/lang/String;[Ljava/lang/String;)Ljava/util/List;

    move-result-object v3

    .line 34
    :goto_1
    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_6
    :goto_2
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_8

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/google/android/gms/measurement/internal/zzab;

    if-eqz v6, :cond_6

    .line 35
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzay()Lcom/google/android/gms/measurement/internal/zzei;

    move-result-object v7

    .line 36
    invoke-virtual {v7}, Lcom/google/android/gms/measurement/internal/zzei;->zzj()Lcom/google/android/gms/measurement/internal/zzeg;

    move-result-object v7

    const-string v9, "User property timed out"

    iget-object v14, v6, Lcom/google/android/gms/measurement/internal/zzab;->zza:Ljava/lang/String;

    iget-object v15, v1, Lcom/google/android/gms/measurement/internal/zzkn;->zzn:Lcom/google/android/gms/measurement/internal/zzfs;

    .line 37
    invoke-virtual {v15}, Lcom/google/android/gms/measurement/internal/zzfs;->zzj()Lcom/google/android/gms/measurement/internal/zzed;

    move-result-object v15

    iget-object v13, v6, Lcom/google/android/gms/measurement/internal/zzab;->zzc:Lcom/google/android/gms/measurement/internal/zzkq;

    .line 38
    iget-object v13, v13, Lcom/google/android/gms/measurement/internal/zzkq;->zzb:Ljava/lang/String;

    invoke-virtual {v15, v13}, Lcom/google/android/gms/measurement/internal/zzed;->zze(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v13

    iget-object v15, v6, Lcom/google/android/gms/measurement/internal/zzab;->zzc:Lcom/google/android/gms/measurement/internal/zzkq;

    .line 39
    invoke-virtual {v15}, Lcom/google/android/gms/measurement/internal/zzkq;->zza()Ljava/lang/Object;

    move-result-object v15

    .line 40
    invoke-virtual {v7, v9, v14, v13, v15}, Lcom/google/android/gms/measurement/internal/zzeg;->zzd(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    iget-object v7, v6, Lcom/google/android/gms/measurement/internal/zzab;->zzg:Lcom/google/android/gms/measurement/internal/zzat;

    if-eqz v7, :cond_7

    new-instance v9, Lcom/google/android/gms/measurement/internal/zzat;

    .line 41
    invoke-direct {v9, v7, v10, v11}, Lcom/google/android/gms/measurement/internal/zzat;-><init>(Lcom/google/android/gms/measurement/internal/zzat;J)V

    invoke-virtual {v1, v9, v0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzW(Lcom/google/android/gms/measurement/internal/zzat;Lcom/google/android/gms/measurement/internal/zzp;)V

    :cond_7
    iget-object v7, v1, Lcom/google/android/gms/measurement/internal/zzkn;->zze:Lcom/google/android/gms/measurement/internal/zzaj;

    .line 42
    invoke-static {v7}, Lcom/google/android/gms/measurement/internal/zzkn;->zzak(Lcom/google/android/gms/measurement/internal/zzkd;)Lcom/google/android/gms/measurement/internal/zzkd;

    iget-object v6, v6, Lcom/google/android/gms/measurement/internal/zzab;->zzc:Lcom/google/android/gms/measurement/internal/zzkq;

    .line 43
    iget-object v6, v6, Lcom/google/android/gms/measurement/internal/zzkq;->zzb:Ljava/lang/String;

    invoke-virtual {v7, v2, v6}, Lcom/google/android/gms/measurement/internal/zzaj;->zza(Ljava/lang/String;Ljava/lang/String;)I

    const/4 v13, 0x1

    goto :goto_2

    :cond_8
    iget-object v3, v1, Lcom/google/android/gms/measurement/internal/zzkn;->zze:Lcom/google/android/gms/measurement/internal/zzaj;

    .line 44
    invoke-static {v3}, Lcom/google/android/gms/measurement/internal/zzkn;->zzak(Lcom/google/android/gms/measurement/internal/zzkd;)Lcom/google/android/gms/measurement/internal/zzkd;

    .line 45
    invoke-static {v2}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotEmpty(Ljava/lang/String;)Ljava/lang/String;

    .line 46
    invoke-virtual {v3}, Lcom/google/android/gms/measurement/internal/zzgl;->zzg()V

    .line 47
    invoke-virtual {v3}, Lcom/google/android/gms/measurement/internal/zzkd;->zzY()V

    if-gez v8, :cond_9

    iget-object v3, v3, Lcom/google/android/gms/measurement/internal/zzgl;->zzs:Lcom/google/android/gms/measurement/internal/zzfs;

    .line 48
    invoke-virtual {v3}, Lcom/google/android/gms/measurement/internal/zzfs;->zzay()Lcom/google/android/gms/measurement/internal/zzei;

    move-result-object v3

    .line 49
    invoke-virtual {v3}, Lcom/google/android/gms/measurement/internal/zzei;->zzk()Lcom/google/android/gms/measurement/internal/zzeg;

    move-result-object v3

    const-string v6, "Invalid time querying expired conditional properties"

    invoke-static {v2}, Lcom/google/android/gms/measurement/internal/zzei;->zzn(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v7

    .line 50
    invoke-static {v10, v11}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v9

    .line 51
    invoke-virtual {v3, v6, v7, v9}, Lcom/google/android/gms/measurement/internal/zzeg;->zzc(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 52
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v3

    goto :goto_3

    :cond_9
    new-array v6, v4, [Ljava/lang/String;

    aput-object v2, v6, v5

    .line 53
    invoke-static {v10, v11}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v7

    const/4 v9, 0x1

    aput-object v7, v6, v9

    const-string v7, "active<>0 and app_id=? and abs(? - triggered_timestamp) > time_to_live"

    .line 54
    invoke-virtual {v3, v7, v6}, Lcom/google/android/gms/measurement/internal/zzaj;->zzt(Ljava/lang/String;[Ljava/lang/String;)Ljava/util/List;

    move-result-object v3

    .line 52
    :goto_3
    new-instance v6, Ljava/util/ArrayList;

    .line 55
    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v7

    invoke-direct {v6, v7}, Ljava/util/ArrayList;-><init>(I)V

    .line 56
    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_a
    :goto_4
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_c

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/google/android/gms/measurement/internal/zzab;

    if-eqz v7, :cond_a

    .line 57
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzay()Lcom/google/android/gms/measurement/internal/zzei;

    move-result-object v9

    .line 58
    invoke-virtual {v9}, Lcom/google/android/gms/measurement/internal/zzei;->zzj()Lcom/google/android/gms/measurement/internal/zzeg;

    move-result-object v9

    const-string v13, "User property expired"

    iget-object v14, v7, Lcom/google/android/gms/measurement/internal/zzab;->zza:Ljava/lang/String;

    iget-object v15, v1, Lcom/google/android/gms/measurement/internal/zzkn;->zzn:Lcom/google/android/gms/measurement/internal/zzfs;

    .line 59
    invoke-virtual {v15}, Lcom/google/android/gms/measurement/internal/zzfs;->zzj()Lcom/google/android/gms/measurement/internal/zzed;

    move-result-object v15

    iget-object v4, v7, Lcom/google/android/gms/measurement/internal/zzab;->zzc:Lcom/google/android/gms/measurement/internal/zzkq;

    .line 60
    iget-object v4, v4, Lcom/google/android/gms/measurement/internal/zzkq;->zzb:Ljava/lang/String;

    invoke-virtual {v15, v4}, Lcom/google/android/gms/measurement/internal/zzed;->zze(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    iget-object v15, v7, Lcom/google/android/gms/measurement/internal/zzab;->zzc:Lcom/google/android/gms/measurement/internal/zzkq;

    .line 61
    invoke-virtual {v15}, Lcom/google/android/gms/measurement/internal/zzkq;->zza()Ljava/lang/Object;

    move-result-object v15

    .line 62
    invoke-virtual {v9, v13, v14, v4, v15}, Lcom/google/android/gms/measurement/internal/zzeg;->zzd(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    iget-object v4, v1, Lcom/google/android/gms/measurement/internal/zzkn;->zze:Lcom/google/android/gms/measurement/internal/zzaj;

    .line 63
    invoke-static {v4}, Lcom/google/android/gms/measurement/internal/zzkn;->zzak(Lcom/google/android/gms/measurement/internal/zzkd;)Lcom/google/android/gms/measurement/internal/zzkd;

    iget-object v9, v7, Lcom/google/android/gms/measurement/internal/zzab;->zzc:Lcom/google/android/gms/measurement/internal/zzkq;

    .line 64
    iget-object v9, v9, Lcom/google/android/gms/measurement/internal/zzkq;->zzb:Ljava/lang/String;

    invoke-virtual {v4, v2, v9}, Lcom/google/android/gms/measurement/internal/zzaj;->zzA(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v4, v7, Lcom/google/android/gms/measurement/internal/zzab;->zzk:Lcom/google/android/gms/measurement/internal/zzat;

    if-eqz v4, :cond_b

    .line 65
    invoke-interface {v6, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_b
    iget-object v4, v1, Lcom/google/android/gms/measurement/internal/zzkn;->zze:Lcom/google/android/gms/measurement/internal/zzaj;

    .line 66
    invoke-static {v4}, Lcom/google/android/gms/measurement/internal/zzkn;->zzak(Lcom/google/android/gms/measurement/internal/zzkd;)Lcom/google/android/gms/measurement/internal/zzkd;

    iget-object v7, v7, Lcom/google/android/gms/measurement/internal/zzab;->zzc:Lcom/google/android/gms/measurement/internal/zzkq;

    .line 67
    iget-object v7, v7, Lcom/google/android/gms/measurement/internal/zzkq;->zzb:Ljava/lang/String;

    invoke-virtual {v4, v2, v7}, Lcom/google/android/gms/measurement/internal/zzaj;->zza(Ljava/lang/String;Ljava/lang/String;)I

    const/4 v4, 0x2

    goto :goto_4

    .line 68
    :cond_c
    invoke-interface {v6}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_5
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_d

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/google/android/gms/measurement/internal/zzat;

    new-instance v6, Lcom/google/android/gms/measurement/internal/zzat;

    .line 69
    invoke-direct {v6, v4, v10, v11}, Lcom/google/android/gms/measurement/internal/zzat;-><init>(Lcom/google/android/gms/measurement/internal/zzat;J)V

    invoke-virtual {v1, v6, v0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzW(Lcom/google/android/gms/measurement/internal/zzat;Lcom/google/android/gms/measurement/internal/zzp;)V

    goto :goto_5

    :cond_d
    iget-object v3, v1, Lcom/google/android/gms/measurement/internal/zzkn;->zze:Lcom/google/android/gms/measurement/internal/zzaj;

    .line 70
    invoke-static {v3}, Lcom/google/android/gms/measurement/internal/zzkn;->zzak(Lcom/google/android/gms/measurement/internal/zzkd;)Lcom/google/android/gms/measurement/internal/zzkd;

    .line 71
    iget-object v4, v12, Lcom/google/android/gms/measurement/internal/zzat;->zza:Ljava/lang/String;

    .line 72
    invoke-static {v2}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotEmpty(Ljava/lang/String;)Ljava/lang/String;

    .line 73
    invoke-static {v4}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotEmpty(Ljava/lang/String;)Ljava/lang/String;

    .line 74
    invoke-virtual {v3}, Lcom/google/android/gms/measurement/internal/zzgl;->zzg()V

    .line 75
    invoke-virtual {v3}, Lcom/google/android/gms/measurement/internal/zzkd;->zzY()V

    if-gez v8, :cond_e

    iget-object v5, v3, Lcom/google/android/gms/measurement/internal/zzgl;->zzs:Lcom/google/android/gms/measurement/internal/zzfs;

    .line 76
    invoke-virtual {v5}, Lcom/google/android/gms/measurement/internal/zzfs;->zzay()Lcom/google/android/gms/measurement/internal/zzei;

    move-result-object v5

    .line 77
    invoke-virtual {v5}, Lcom/google/android/gms/measurement/internal/zzei;->zzk()Lcom/google/android/gms/measurement/internal/zzeg;

    move-result-object v5

    const-string v6, "Invalid time querying triggered conditional properties"

    invoke-static {v2}, Lcom/google/android/gms/measurement/internal/zzei;->zzn(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    iget-object v3, v3, Lcom/google/android/gms/measurement/internal/zzgl;->zzs:Lcom/google/android/gms/measurement/internal/zzfs;

    .line 78
    invoke-virtual {v3}, Lcom/google/android/gms/measurement/internal/zzfs;->zzj()Lcom/google/android/gms/measurement/internal/zzed;

    move-result-object v3

    .line 79
    invoke-virtual {v3, v4}, Lcom/google/android/gms/measurement/internal/zzed;->zzc(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 80
    invoke-static {v10, v11}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    .line 81
    invoke-virtual {v5, v6, v2, v3, v4}, Lcom/google/android/gms/measurement/internal/zzeg;->zzd(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 82
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v2

    goto :goto_6

    :cond_e
    const/4 v6, 0x3

    new-array v6, v6, [Ljava/lang/String;

    aput-object v2, v6, v5

    const/4 v2, 0x1

    aput-object v4, v6, v2

    .line 83
    invoke-static {v10, v11}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v2

    const/4 v4, 0x2

    aput-object v2, v6, v4

    const-string v2, "active=0 and app_id=? and trigger_event_name=? and abs(? - creation_timestamp) <= trigger_timeout"

    .line 84
    invoke-virtual {v3, v2, v6}, Lcom/google/android/gms/measurement/internal/zzaj;->zzt(Ljava/lang/String;[Ljava/lang/String;)Ljava/util/List;

    move-result-object v2

    .line 82
    :goto_6
    new-instance v13, Ljava/util/ArrayList;

    .line 85
    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v3

    invoke-direct {v13, v3}, Ljava/util/ArrayList;-><init>(I)V

    .line 86
    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_f
    :goto_7
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_12

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    move-object v14, v3

    check-cast v14, Lcom/google/android/gms/measurement/internal/zzab;

    if-eqz v14, :cond_f

    iget-object v3, v14, Lcom/google/android/gms/measurement/internal/zzab;->zzc:Lcom/google/android/gms/measurement/internal/zzkq;

    new-instance v15, Lcom/google/android/gms/measurement/internal/zzks;

    iget-object v4, v14, Lcom/google/android/gms/measurement/internal/zzab;->zza:Ljava/lang/String;

    .line 87
    invoke-static {v4}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    iget-object v5, v14, Lcom/google/android/gms/measurement/internal/zzab;->zzb:Ljava/lang/String;

    iget-object v6, v3, Lcom/google/android/gms/measurement/internal/zzkq;->zzb:Ljava/lang/String;

    .line 88
    invoke-virtual {v3}, Lcom/google/android/gms/measurement/internal/zzkq;->zza()Ljava/lang/Object;

    move-result-object v3

    invoke-static {v3}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v9

    move-object v3, v15

    move-wide v7, v10

    invoke-direct/range {v3 .. v9}, Lcom/google/android/gms/measurement/internal/zzks;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;JLjava/lang/Object;)V

    iget-object v3, v1, Lcom/google/android/gms/measurement/internal/zzkn;->zze:Lcom/google/android/gms/measurement/internal/zzaj;

    .line 89
    invoke-static {v3}, Lcom/google/android/gms/measurement/internal/zzkn;->zzak(Lcom/google/android/gms/measurement/internal/zzkd;)Lcom/google/android/gms/measurement/internal/zzkd;

    .line 90
    invoke-virtual {v3, v15}, Lcom/google/android/gms/measurement/internal/zzaj;->zzN(Lcom/google/android/gms/measurement/internal/zzks;)Z

    move-result v3

    if-eqz v3, :cond_10

    .line 91
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzay()Lcom/google/android/gms/measurement/internal/zzei;

    move-result-object v3

    .line 92
    invoke-virtual {v3}, Lcom/google/android/gms/measurement/internal/zzei;->zzj()Lcom/google/android/gms/measurement/internal/zzeg;

    move-result-object v3

    const-string v4, "User property triggered"

    iget-object v5, v14, Lcom/google/android/gms/measurement/internal/zzab;->zza:Ljava/lang/String;

    iget-object v6, v1, Lcom/google/android/gms/measurement/internal/zzkn;->zzn:Lcom/google/android/gms/measurement/internal/zzfs;

    .line 93
    invoke-virtual {v6}, Lcom/google/android/gms/measurement/internal/zzfs;->zzj()Lcom/google/android/gms/measurement/internal/zzed;

    move-result-object v6

    iget-object v7, v15, Lcom/google/android/gms/measurement/internal/zzks;->zzc:Ljava/lang/String;

    .line 94
    invoke-virtual {v6, v7}, Lcom/google/android/gms/measurement/internal/zzed;->zze(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    iget-object v7, v15, Lcom/google/android/gms/measurement/internal/zzks;->zze:Ljava/lang/Object;

    .line 95
    invoke-virtual {v3, v4, v5, v6, v7}, Lcom/google/android/gms/measurement/internal/zzeg;->zzd(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    goto :goto_8

    .line 96
    :cond_10
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzay()Lcom/google/android/gms/measurement/internal/zzei;

    move-result-object v3

    .line 97
    invoke-virtual {v3}, Lcom/google/android/gms/measurement/internal/zzei;->zzd()Lcom/google/android/gms/measurement/internal/zzeg;

    move-result-object v3

    const-string v4, "Too many active user properties, ignoring"

    iget-object v5, v14, Lcom/google/android/gms/measurement/internal/zzab;->zza:Ljava/lang/String;

    invoke-static {v5}, Lcom/google/android/gms/measurement/internal/zzei;->zzn(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v5

    iget-object v6, v1, Lcom/google/android/gms/measurement/internal/zzkn;->zzn:Lcom/google/android/gms/measurement/internal/zzfs;

    .line 98
    invoke-virtual {v6}, Lcom/google/android/gms/measurement/internal/zzfs;->zzj()Lcom/google/android/gms/measurement/internal/zzed;

    move-result-object v6

    iget-object v7, v15, Lcom/google/android/gms/measurement/internal/zzks;->zzc:Ljava/lang/String;

    .line 99
    invoke-virtual {v6, v7}, Lcom/google/android/gms/measurement/internal/zzed;->zze(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    iget-object v7, v15, Lcom/google/android/gms/measurement/internal/zzks;->zze:Ljava/lang/Object;

    .line 100
    invoke-virtual {v3, v4, v5, v6, v7}, Lcom/google/android/gms/measurement/internal/zzeg;->zzd(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 95
    :goto_8
    iget-object v3, v14, Lcom/google/android/gms/measurement/internal/zzab;->zzi:Lcom/google/android/gms/measurement/internal/zzat;

    if-eqz v3, :cond_11

    .line 101
    invoke-interface {v13, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_11
    new-instance v3, Lcom/google/android/gms/measurement/internal/zzkq;

    .line 102
    invoke-direct {v3, v15}, Lcom/google/android/gms/measurement/internal/zzkq;-><init>(Lcom/google/android/gms/measurement/internal/zzks;)V

    iput-object v3, v14, Lcom/google/android/gms/measurement/internal/zzab;->zzc:Lcom/google/android/gms/measurement/internal/zzkq;

    const/4 v3, 0x1

    iput-boolean v3, v14, Lcom/google/android/gms/measurement/internal/zzab;->zze:Z

    iget-object v4, v1, Lcom/google/android/gms/measurement/internal/zzkn;->zze:Lcom/google/android/gms/measurement/internal/zzaj;

    .line 103
    invoke-static {v4}, Lcom/google/android/gms/measurement/internal/zzkn;->zzak(Lcom/google/android/gms/measurement/internal/zzkd;)Lcom/google/android/gms/measurement/internal/zzkd;

    .line 104
    invoke-virtual {v4, v14}, Lcom/google/android/gms/measurement/internal/zzaj;->zzM(Lcom/google/android/gms/measurement/internal/zzab;)Z

    goto/16 :goto_7

    .line 105
    :cond_12
    invoke-virtual {v1, v12, v0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzW(Lcom/google/android/gms/measurement/internal/zzat;Lcom/google/android/gms/measurement/internal/zzp;)V

    .line 106
    invoke-interface {v13}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_9
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_13

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/google/android/gms/measurement/internal/zzat;

    new-instance v4, Lcom/google/android/gms/measurement/internal/zzat;

    .line 107
    invoke-direct {v4, v3, v10, v11}, Lcom/google/android/gms/measurement/internal/zzat;-><init>(Lcom/google/android/gms/measurement/internal/zzat;J)V

    invoke-virtual {v1, v4, v0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzW(Lcom/google/android/gms/measurement/internal/zzat;Lcom/google/android/gms/measurement/internal/zzp;)V

    goto :goto_9

    :cond_13
    iget-object v0, v1, Lcom/google/android/gms/measurement/internal/zzkn;->zze:Lcom/google/android/gms/measurement/internal/zzaj;

    .line 108
    invoke-static {v0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzak(Lcom/google/android/gms/measurement/internal/zzkd;)Lcom/google/android/gms/measurement/internal/zzkd;

    .line 109
    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzaj;->zzC()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    iget-object v0, v1, Lcom/google/android/gms/measurement/internal/zzkn;->zze:Lcom/google/android/gms/measurement/internal/zzaj;

    .line 110
    invoke-static {v0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzak(Lcom/google/android/gms/measurement/internal/zzkd;)Lcom/google/android/gms/measurement/internal/zzkd;

    .line 111
    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzaj;->zzx()V

    return-void

    :catchall_0
    move-exception v0

    .line 115
    iget-object v2, v1, Lcom/google/android/gms/measurement/internal/zzkn;->zze:Lcom/google/android/gms/measurement/internal/zzaj;

    .line 110
    invoke-static {v2}, Lcom/google/android/gms/measurement/internal/zzkn;->zzak(Lcom/google/android/gms/measurement/internal/zzkd;)Lcom/google/android/gms/measurement/internal/zzkd;

    .line 111
    invoke-virtual {v2}, Lcom/google/android/gms/measurement/internal/zzaj;->zzx()V

    .line 112
    throw v0
.end method

.method final zzE(Lcom/google/android/gms/measurement/internal/zzat;Ljava/lang/String;)V
    .locals 33

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v3, p2

    iget-object v2, v0, Lcom/google/android/gms/measurement/internal/zzkn;->zze:Lcom/google/android/gms/measurement/internal/zzaj;

    .line 1
    invoke-static {v2}, Lcom/google/android/gms/measurement/internal/zzkn;->zzak(Lcom/google/android/gms/measurement/internal/zzkd;)Lcom/google/android/gms/measurement/internal/zzkd;

    .line 2
    invoke-virtual {v2, v3}, Lcom/google/android/gms/measurement/internal/zzaj;->zzj(Ljava/lang/String;)Lcom/google/android/gms/measurement/internal/zzg;

    move-result-object v2

    if-eqz v2, :cond_4

    .line 3
    invoke-virtual {v2}, Lcom/google/android/gms/measurement/internal/zzg;->zzw()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-eqz v4, :cond_0

    goto/16 :goto_2

    .line 5
    :cond_0
    invoke-direct {v0, v2}, Lcom/google/android/gms/measurement/internal/zzkn;->zzab(Lcom/google/android/gms/measurement/internal/zzg;)Ljava/lang/Boolean;

    move-result-object v4

    if-nez v4, :cond_1

    .line 6
    iget-object v4, v1, Lcom/google/android/gms/measurement/internal/zzat;->zza:Ljava/lang/String;

    const-string v5, "_ui"

    invoke-virtual {v5, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_2

    .line 7
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzay()Lcom/google/android/gms/measurement/internal/zzei;

    move-result-object v4

    invoke-virtual {v4}, Lcom/google/android/gms/measurement/internal/zzei;->zzk()Lcom/google/android/gms/measurement/internal/zzeg;

    move-result-object v4

    invoke-static/range {p2 .. p2}, Lcom/google/android/gms/measurement/internal/zzei;->zzn(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v5

    const-string v6, "Could not find package. appId"

    invoke-virtual {v4, v6, v5}, Lcom/google/android/gms/measurement/internal/zzeg;->zzb(Ljava/lang/String;Ljava/lang/Object;)V

    goto :goto_0

    .line 8
    :cond_1
    invoke-virtual {v4}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v4

    if-nez v4, :cond_2

    .line 28
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzay()Lcom/google/android/gms/measurement/internal/zzei;

    move-result-object v1

    .line 29
    invoke-virtual {v1}, Lcom/google/android/gms/measurement/internal/zzei;->zzd()Lcom/google/android/gms/measurement/internal/zzeg;

    move-result-object v1

    invoke-static/range {p2 .. p2}, Lcom/google/android/gms/measurement/internal/zzei;->zzn(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    const-string v3, "App version does not match; dropping event. appId"

    .line 30
    invoke-virtual {v1, v3, v2}, Lcom/google/android/gms/measurement/internal/zzeg;->zzb(Ljava/lang/String;Ljava/lang/Object;)V

    return-void

    .line 9
    :cond_2
    :goto_0
    new-instance v14, Lcom/google/android/gms/measurement/internal/zzp;

    .line 10
    invoke-virtual {v2}, Lcom/google/android/gms/measurement/internal/zzg;->zzz()Ljava/lang/String;

    move-result-object v4

    .line 11
    invoke-virtual {v2}, Lcom/google/android/gms/measurement/internal/zzg;->zzw()Ljava/lang/String;

    move-result-object v5

    .line 12
    invoke-virtual {v2}, Lcom/google/android/gms/measurement/internal/zzg;->zzb()J

    move-result-wide v6

    .line 13
    invoke-virtual {v2}, Lcom/google/android/gms/measurement/internal/zzg;->zzv()Ljava/lang/String;

    move-result-object v8

    .line 14
    invoke-virtual {v2}, Lcom/google/android/gms/measurement/internal/zzg;->zzm()J

    move-result-wide v9

    .line 15
    invoke-virtual {v2}, Lcom/google/android/gms/measurement/internal/zzg;->zzj()J

    move-result-wide v11

    .line 16
    invoke-virtual {v2}, Lcom/google/android/gms/measurement/internal/zzg;->zzaj()Z

    move-result v16

    .line 17
    invoke-virtual {v2}, Lcom/google/android/gms/measurement/internal/zzg;->zzx()Ljava/lang/String;

    move-result-object v17

    .line 18
    invoke-virtual {v2}, Lcom/google/android/gms/measurement/internal/zzg;->zza()J

    move-result-wide v24

    .line 19
    invoke-virtual {v2}, Lcom/google/android/gms/measurement/internal/zzg;->zzai()Z

    move-result v22

    .line 20
    invoke-virtual {v2}, Lcom/google/android/gms/measurement/internal/zzg;->zzr()Ljava/lang/String;

    move-result-object v26

    .line 21
    invoke-virtual {v2}, Lcom/google/android/gms/measurement/internal/zzg;->zzq()Ljava/lang/Boolean;

    move-result-object v27

    .line 22
    invoke-virtual {v2}, Lcom/google/android/gms/measurement/internal/zzg;->zzk()J

    move-result-wide v28

    .line 23
    invoke-virtual {v2}, Lcom/google/android/gms/measurement/internal/zzg;->zzC()Ljava/util/List;

    move-result-object v31

    .line 24
    invoke-static {}, Lcom/google/android/gms/internal/measurement/zzoq;->zzc()Z

    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzg()Lcom/google/android/gms/measurement/internal/zzaf;

    move-result-object v13

    invoke-virtual {v2}, Lcom/google/android/gms/measurement/internal/zzg;->zzt()Ljava/lang/String;

    move-result-object v15

    sget-object v1, Lcom/google/android/gms/measurement/internal/zzdw;->zzad:Lcom/google/android/gms/measurement/internal/zzdv;

    invoke-virtual {v13, v15, v1}, Lcom/google/android/gms/measurement/internal/zzaf;->zzs(Ljava/lang/String;Lcom/google/android/gms/measurement/internal/zzdv;)Z

    move-result v1

    if-eqz v1, :cond_3

    .line 25
    invoke-virtual {v2}, Lcom/google/android/gms/measurement/internal/zzg;->zzy()Ljava/lang/String;

    move-result-object v1

    goto :goto_1

    :cond_3
    const/4 v1, 0x0

    :goto_1
    const/4 v13, 0x0

    const/4 v15, 0x0

    const-wide/16 v19, 0x0

    const/16 v21, 0x0

    const/16 v23, 0x0

    .line 26
    invoke-virtual {v0, v3}, Lcom/google/android/gms/measurement/internal/zzkn;->zzh(Ljava/lang/String;)Lcom/google/android/gms/measurement/internal/zzag;

    move-result-object v2

    invoke-virtual {v2}, Lcom/google/android/gms/measurement/internal/zzag;->zzi()Ljava/lang/String;

    move-result-object v30

    move-object v2, v14

    move-object/from16 v3, p2

    move-object/from16 v32, v14

    move/from16 v14, v16

    move-object/from16 v16, v17

    move-wide/from16 v17, v24

    move-object/from16 v24, v26

    move-object/from16 v25, v27

    move-wide/from16 v26, v28

    move-object/from16 v28, v31

    move-object/from16 v29, v1

    invoke-direct/range {v2 .. v30}, Lcom/google/android/gms/measurement/internal/zzp;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;JLjava/lang/String;JJLjava/lang/String;ZZLjava/lang/String;JJIZZLjava/lang/String;Ljava/lang/Boolean;JLjava/util/List;Ljava/lang/String;Ljava/lang/String;)V

    move-object/from16 v1, p1

    move-object/from16 v2, v32

    .line 27
    invoke-virtual {v0, v1, v2}, Lcom/google/android/gms/measurement/internal/zzkn;->zzF(Lcom/google/android/gms/measurement/internal/zzat;Lcom/google/android/gms/measurement/internal/zzp;)V

    return-void

    .line 4
    :cond_4
    :goto_2
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzay()Lcom/google/android/gms/measurement/internal/zzei;

    move-result-object v1

    invoke-virtual {v1}, Lcom/google/android/gms/measurement/internal/zzei;->zzc()Lcom/google/android/gms/measurement/internal/zzeg;

    move-result-object v1

    const-string v2, "No app data available; dropping event"

    invoke-virtual {v1, v2, v3}, Lcom/google/android/gms/measurement/internal/zzeg;->zzb(Ljava/lang/String;Ljava/lang/Object;)V

    return-void
.end method

.method final zzF(Lcom/google/android/gms/measurement/internal/zzat;Lcom/google/android/gms/measurement/internal/zzp;)V
    .locals 8

    .line 1
    iget-object v0, p2, Lcom/google/android/gms/measurement/internal/zzp;->zza:Ljava/lang/String;

    invoke-static {v0}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotEmpty(Ljava/lang/String;)Ljava/lang/String;

    .line 2
    invoke-static {p1}, Lcom/google/android/gms/measurement/internal/zzej;->zzb(Lcom/google/android/gms/measurement/internal/zzat;)Lcom/google/android/gms/measurement/internal/zzej;

    move-result-object p1

    .line 3
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzv()Lcom/google/android/gms/measurement/internal/zzku;

    move-result-object v0

    iget-object v1, p1, Lcom/google/android/gms/measurement/internal/zzej;->zzd:Landroid/os/Bundle;

    iget-object v2, p0, Lcom/google/android/gms/measurement/internal/zzkn;->zze:Lcom/google/android/gms/measurement/internal/zzaj;

    .line 4
    invoke-static {v2}, Lcom/google/android/gms/measurement/internal/zzkn;->zzak(Lcom/google/android/gms/measurement/internal/zzkd;)Lcom/google/android/gms/measurement/internal/zzkd;

    .line 5
    iget-object v3, p2, Lcom/google/android/gms/measurement/internal/zzp;->zza:Ljava/lang/String;

    invoke-virtual {v2, v3}, Lcom/google/android/gms/measurement/internal/zzaj;->zzi(Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object v2

    .line 6
    invoke-virtual {v0, v1, v2}, Lcom/google/android/gms/measurement/internal/zzku;->zzK(Landroid/os/Bundle;Landroid/os/Bundle;)V

    .line 7
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzv()Lcom/google/android/gms/measurement/internal/zzku;

    move-result-object v0

    .line 8
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzg()Lcom/google/android/gms/measurement/internal/zzaf;

    move-result-object v1

    iget-object v2, p2, Lcom/google/android/gms/measurement/internal/zzp;->zza:Ljava/lang/String;

    invoke-virtual {v1, v2}, Lcom/google/android/gms/measurement/internal/zzaf;->zzd(Ljava/lang/String;)I

    move-result v1

    .line 9
    invoke-virtual {v0, p1, v1}, Lcom/google/android/gms/measurement/internal/zzku;->zzL(Lcom/google/android/gms/measurement/internal/zzej;I)V

    .line 10
    invoke-virtual {p1}, Lcom/google/android/gms/measurement/internal/zzej;->zza()Lcom/google/android/gms/measurement/internal/zzat;

    move-result-object p1

    iget-object v0, p1, Lcom/google/android/gms/measurement/internal/zzat;->zza:Ljava/lang/String;

    const-string v1, "_cmp"

    .line 11
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    goto :goto_0

    .line 18
    :cond_0
    iget-object v0, p1, Lcom/google/android/gms/measurement/internal/zzat;->zzb:Lcom/google/android/gms/measurement/internal/zzar;

    const-string v1, "_cis"

    .line 12
    invoke-virtual {v0, v1}, Lcom/google/android/gms/measurement/internal/zzar;->zzg(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "referrer API v2"

    .line 13
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p1, Lcom/google/android/gms/measurement/internal/zzat;->zzb:Lcom/google/android/gms/measurement/internal/zzar;

    const-string v1, "gclid"

    .line 14
    invoke-virtual {v0, v1}, Lcom/google/android/gms/measurement/internal/zzar;->zzg(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 15
    invoke-static {v6}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 16
    new-instance v0, Lcom/google/android/gms/measurement/internal/zzkq;

    iget-wide v4, p1, Lcom/google/android/gms/measurement/internal/zzat;->zzd:J

    const-string v3, "_lgclid"

    const-string v7, "auto"

    move-object v2, v0

    invoke-direct/range {v2 .. v7}, Lcom/google/android/gms/measurement/internal/zzkq;-><init>(Ljava/lang/String;JLjava/lang/Object;Ljava/lang/String;)V

    .line 17
    invoke-virtual {p0, v0, p2}, Lcom/google/android/gms/measurement/internal/zzkn;->zzU(Lcom/google/android/gms/measurement/internal/zzkq;Lcom/google/android/gms/measurement/internal/zzp;)V

    .line 18
    :cond_1
    :goto_0
    invoke-virtual {p0, p1, p2}, Lcom/google/android/gms/measurement/internal/zzkn;->zzD(Lcom/google/android/gms/measurement/internal/zzat;Lcom/google/android/gms/measurement/internal/zzp;)V

    return-void
.end method

.method final zzG()V
    .locals 1

    iget v0, p0, Lcom/google/android/gms/measurement/internal/zzkn;->zzs:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/google/android/gms/measurement/internal/zzkn;->zzs:I

    return-void
.end method

.method final zzH(Ljava/lang/String;ILjava/lang/Throwable;[BLjava/util/Map;)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "I",
            "Ljava/lang/Throwable;",
            "[B",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;>;)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzaz()Lcom/google/android/gms/measurement/internal/zzfp;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzgl;->zzg()V

    .line 2
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzB()V

    .line 3
    invoke-static {p1}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotEmpty(Ljava/lang/String;)Ljava/lang/String;

    const/4 v0, 0x0

    if-nez p4, :cond_0

    :try_start_0
    new-array p4, v0, [B

    .line 4
    :cond_0
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzay()Lcom/google/android/gms/measurement/internal/zzei;

    move-result-object v1

    invoke-virtual {v1}, Lcom/google/android/gms/measurement/internal/zzei;->zzj()Lcom/google/android/gms/measurement/internal/zzeg;

    move-result-object v1

    array-length v2, p4

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "onConfigFetched. Response size"

    invoke-virtual {v1, v3, v2}, Lcom/google/android/gms/measurement/internal/zzeg;->zzb(Ljava/lang/String;Ljava/lang/Object;)V

    iget-object v1, p0, Lcom/google/android/gms/measurement/internal/zzkn;->zze:Lcom/google/android/gms/measurement/internal/zzaj;

    .line 5
    invoke-static {v1}, Lcom/google/android/gms/measurement/internal/zzkn;->zzak(Lcom/google/android/gms/measurement/internal/zzkd;)Lcom/google/android/gms/measurement/internal/zzkd;

    .line 6
    invoke-virtual {v1}, Lcom/google/android/gms/measurement/internal/zzaj;->zzw()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    :try_start_1
    iget-object v1, p0, Lcom/google/android/gms/measurement/internal/zzkn;->zze:Lcom/google/android/gms/measurement/internal/zzaj;

    .line 7
    invoke-static {v1}, Lcom/google/android/gms/measurement/internal/zzkn;->zzak(Lcom/google/android/gms/measurement/internal/zzkd;)Lcom/google/android/gms/measurement/internal/zzkd;

    .line 8
    invoke-virtual {v1, p1}, Lcom/google/android/gms/measurement/internal/zzaj;->zzj(Ljava/lang/String;)Lcom/google/android/gms/measurement/internal/zzg;

    move-result-object v1

    const/16 v3, 0xc8

    const/16 v4, 0x130

    if-eq p2, v3, :cond_1

    const/16 v3, 0xcc

    if-eq p2, v3, :cond_1

    if-ne p2, v4, :cond_2

    const/16 p2, 0x130

    :cond_1
    if-nez p3, :cond_2

    const/4 v3, 0x1

    goto :goto_0

    :cond_2
    const/4 v3, 0x0

    :goto_0
    if-nez v1, :cond_3

    .line 9
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzay()Lcom/google/android/gms/measurement/internal/zzei;

    move-result-object p2

    .line 10
    invoke-virtual {p2}, Lcom/google/android/gms/measurement/internal/zzei;->zzk()Lcom/google/android/gms/measurement/internal/zzeg;

    move-result-object p2

    const-string p3, "App does not exist in onConfigFetched. appId"

    invoke-static {p1}, Lcom/google/android/gms/measurement/internal/zzei;->zzn(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    .line 11
    invoke-virtual {p2, p3, p1}, Lcom/google/android/gms/measurement/internal/zzeg;->zzb(Ljava/lang/String;Ljava/lang/Object;)V

    goto/16 :goto_7

    :cond_3
    const/16 v5, 0x194

    if-nez v3, :cond_7

    if-ne p2, v5, :cond_4

    goto :goto_1

    .line 38
    :cond_4
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzav()Lcom/google/android/gms/common/util/Clock;

    move-result-object p4

    invoke-interface {p4}, Lcom/google/android/gms/common/util/Clock;->currentTimeMillis()J

    move-result-wide p4

    invoke-virtual {v1, p4, p5}, Lcom/google/android/gms/measurement/internal/zzg;->zzV(J)V

    iget-object p4, p0, Lcom/google/android/gms/measurement/internal/zzkn;->zze:Lcom/google/android/gms/measurement/internal/zzaj;

    .line 39
    invoke-static {p4}, Lcom/google/android/gms/measurement/internal/zzkn;->zzak(Lcom/google/android/gms/measurement/internal/zzkd;)Lcom/google/android/gms/measurement/internal/zzkd;

    .line 40
    invoke-virtual {p4, v1}, Lcom/google/android/gms/measurement/internal/zzaj;->zzD(Lcom/google/android/gms/measurement/internal/zzg;)V

    .line 41
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzay()Lcom/google/android/gms/measurement/internal/zzei;

    move-result-object p4

    invoke-virtual {p4}, Lcom/google/android/gms/measurement/internal/zzei;->zzj()Lcom/google/android/gms/measurement/internal/zzeg;

    move-result-object p4

    const-string p5, "Fetching config failed. code, error"

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {p4, p5, v1, p3}, Lcom/google/android/gms/measurement/internal/zzeg;->zzc(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    iget-object p3, p0, Lcom/google/android/gms/measurement/internal/zzkn;->zzc:Lcom/google/android/gms/measurement/internal/zzfj;

    .line 42
    invoke-static {p3}, Lcom/google/android/gms/measurement/internal/zzkn;->zzak(Lcom/google/android/gms/measurement/internal/zzkd;)Lcom/google/android/gms/measurement/internal/zzkd;

    .line 43
    invoke-virtual {p3, p1}, Lcom/google/android/gms/measurement/internal/zzfj;->zzi(Ljava/lang/String;)V

    iget-object p1, p0, Lcom/google/android/gms/measurement/internal/zzkn;->zzk:Lcom/google/android/gms/measurement/internal/zzjk;

    .line 44
    iget-object p1, p1, Lcom/google/android/gms/measurement/internal/zzjk;->zzd:Lcom/google/android/gms/measurement/internal/zzet;

    .line 45
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzav()Lcom/google/android/gms/common/util/Clock;

    move-result-object p3

    invoke-interface {p3}, Lcom/google/android/gms/common/util/Clock;->currentTimeMillis()J

    move-result-wide p3

    invoke-virtual {p1, p3, p4}, Lcom/google/android/gms/measurement/internal/zzet;->zzb(J)V

    const/16 p1, 0x1f7

    if-eq p2, p1, :cond_5

    const/16 p1, 0x1ad

    if-ne p2, p1, :cond_6

    :cond_5
    iget-object p1, p0, Lcom/google/android/gms/measurement/internal/zzkn;->zzk:Lcom/google/android/gms/measurement/internal/zzjk;

    .line 46
    iget-object p1, p1, Lcom/google/android/gms/measurement/internal/zzjk;->zzb:Lcom/google/android/gms/measurement/internal/zzet;

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzav()Lcom/google/android/gms/common/util/Clock;

    move-result-object p2

    invoke-interface {p2}, Lcom/google/android/gms/common/util/Clock;->currentTimeMillis()J

    move-result-wide p2

    invoke-virtual {p1, p2, p3}, Lcom/google/android/gms/measurement/internal/zzet;->zzb(J)V

    .line 47
    :cond_6
    invoke-direct {p0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzaf()V

    goto/16 :goto_7

    :cond_7
    :goto_1
    const/4 p3, 0x0

    if-eqz p5, :cond_8

    const-string v3, "Last-Modified"

    .line 12
    invoke-interface {p5, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p5

    check-cast p5, Ljava/util/List;

    goto :goto_2

    :cond_8
    move-object p5, p3

    :goto_2
    if-eqz p5, :cond_9

    .line 13
    invoke-interface {p5}, Ljava/util/List;->size()I

    move-result v3

    if-lez v3, :cond_9

    .line 14
    invoke-interface {p5, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p5

    check-cast p5, Ljava/lang/String;

    goto :goto_3

    :cond_9
    move-object p5, p3

    :goto_3
    if-eq p2, v5, :cond_b

    if-ne p2, v4, :cond_a

    goto :goto_5

    .line 33
    :cond_a
    iget-object p3, p0, Lcom/google/android/gms/measurement/internal/zzkn;->zzc:Lcom/google/android/gms/measurement/internal/zzfj;

    .line 22
    invoke-static {p3}, Lcom/google/android/gms/measurement/internal/zzkn;->zzak(Lcom/google/android/gms/measurement/internal/zzkd;)Lcom/google/android/gms/measurement/internal/zzkd;

    .line 23
    invoke-virtual {p3, p1, p4, p5}, Lcom/google/android/gms/measurement/internal/zzfj;->zzq(Ljava/lang/String;[BLjava/lang/String;)Z

    move-result p3
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    if-nez p3, :cond_c

    :try_start_2
    iget-object p1, p0, Lcom/google/android/gms/measurement/internal/zzkn;->zze:Lcom/google/android/gms/measurement/internal/zzaj;

    .line 19
    invoke-static {p1}, Lcom/google/android/gms/measurement/internal/zzkn;->zzak(Lcom/google/android/gms/measurement/internal/zzkd;)Lcom/google/android/gms/measurement/internal/zzkd;

    .line 20
    :goto_4
    invoke-virtual {p1}, Lcom/google/android/gms/measurement/internal/zzaj;->zzx()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    iput-boolean v0, p0, Lcom/google/android/gms/measurement/internal/zzkn;->zzt:Z

    .line 21
    invoke-direct {p0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzac()V

    return-void

    .line 14
    :cond_b
    :goto_5
    :try_start_3
    iget-object p4, p0, Lcom/google/android/gms/measurement/internal/zzkn;->zzc:Lcom/google/android/gms/measurement/internal/zzfj;

    .line 15
    invoke-static {p4}, Lcom/google/android/gms/measurement/internal/zzkn;->zzak(Lcom/google/android/gms/measurement/internal/zzkd;)Lcom/google/android/gms/measurement/internal/zzkd;

    .line 16
    invoke-virtual {p4, p1}, Lcom/google/android/gms/measurement/internal/zzfj;->zze(Ljava/lang/String;)Lcom/google/android/gms/internal/measurement/zzfc;

    move-result-object p4

    if-nez p4, :cond_c

    iget-object p4, p0, Lcom/google/android/gms/measurement/internal/zzkn;->zzc:Lcom/google/android/gms/measurement/internal/zzfj;

    .line 17
    invoke-static {p4}, Lcom/google/android/gms/measurement/internal/zzkn;->zzak(Lcom/google/android/gms/measurement/internal/zzkd;)Lcom/google/android/gms/measurement/internal/zzkd;

    .line 18
    invoke-virtual {p4, p1, p3, p3}, Lcom/google/android/gms/measurement/internal/zzfj;->zzq(Ljava/lang/String;[BLjava/lang/String;)Z

    move-result p3
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    if-nez p3, :cond_c

    :try_start_4
    iget-object p1, p0, Lcom/google/android/gms/measurement/internal/zzkn;->zze:Lcom/google/android/gms/measurement/internal/zzaj;

    .line 19
    invoke-static {p1}, Lcom/google/android/gms/measurement/internal/zzkn;->zzak(Lcom/google/android/gms/measurement/internal/zzkd;)Lcom/google/android/gms/measurement/internal/zzkd;
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    goto :goto_4

    .line 24
    :cond_c
    :try_start_5
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzav()Lcom/google/android/gms/common/util/Clock;

    move-result-object p3

    invoke-interface {p3}, Lcom/google/android/gms/common/util/Clock;->currentTimeMillis()J

    move-result-wide p3

    invoke-virtual {v1, p3, p4}, Lcom/google/android/gms/measurement/internal/zzg;->zzM(J)V

    iget-object p3, p0, Lcom/google/android/gms/measurement/internal/zzkn;->zze:Lcom/google/android/gms/measurement/internal/zzaj;

    .line 25
    invoke-static {p3}, Lcom/google/android/gms/measurement/internal/zzkn;->zzak(Lcom/google/android/gms/measurement/internal/zzkd;)Lcom/google/android/gms/measurement/internal/zzkd;

    .line 26
    invoke-virtual {p3, v1}, Lcom/google/android/gms/measurement/internal/zzaj;->zzD(Lcom/google/android/gms/measurement/internal/zzg;)V

    if-ne p2, v5, :cond_d

    .line 27
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzay()Lcom/google/android/gms/measurement/internal/zzei;

    move-result-object p2

    .line 28
    invoke-virtual {p2}, Lcom/google/android/gms/measurement/internal/zzei;->zzl()Lcom/google/android/gms/measurement/internal/zzeg;

    move-result-object p2

    const-string p3, "Config not found. Using empty config. appId"

    .line 29
    invoke-virtual {p2, p3, p1}, Lcom/google/android/gms/measurement/internal/zzeg;->zzb(Ljava/lang/String;Ljava/lang/Object;)V

    goto :goto_6

    .line 30
    :cond_d
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzay()Lcom/google/android/gms/measurement/internal/zzei;

    move-result-object p1

    .line 31
    invoke-virtual {p1}, Lcom/google/android/gms/measurement/internal/zzei;->zzj()Lcom/google/android/gms/measurement/internal/zzeg;

    move-result-object p1

    const-string p3, "Successfully fetched config. Got network response. code, size"

    .line 32
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p2

    .line 33
    invoke-virtual {p1, p3, p2, v2}, Lcom/google/android/gms/measurement/internal/zzeg;->zzc(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 29
    :goto_6
    iget-object p1, p0, Lcom/google/android/gms/measurement/internal/zzkn;->zzd:Lcom/google/android/gms/measurement/internal/zzeo;

    .line 34
    invoke-static {p1}, Lcom/google/android/gms/measurement/internal/zzkn;->zzak(Lcom/google/android/gms/measurement/internal/zzkd;)Lcom/google/android/gms/measurement/internal/zzkd;

    .line 35
    invoke-virtual {p1}, Lcom/google/android/gms/measurement/internal/zzeo;->zzc()Z

    move-result p1

    if-eqz p1, :cond_e

    invoke-direct {p0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzai()Z

    move-result p1

    if-eqz p1, :cond_e

    .line 37
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzV()V

    goto :goto_7

    .line 36
    :cond_e
    invoke-direct {p0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzaf()V

    .line 11
    :goto_7
    iget-object p1, p0, Lcom/google/android/gms/measurement/internal/zzkn;->zze:Lcom/google/android/gms/measurement/internal/zzaj;

    .line 48
    invoke-static {p1}, Lcom/google/android/gms/measurement/internal/zzkn;->zzak(Lcom/google/android/gms/measurement/internal/zzkd;)Lcom/google/android/gms/measurement/internal/zzkd;

    .line 49
    invoke-virtual {p1}, Lcom/google/android/gms/measurement/internal/zzaj;->zzC()V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    :try_start_6
    iget-object p1, p0, Lcom/google/android/gms/measurement/internal/zzkn;->zze:Lcom/google/android/gms/measurement/internal/zzaj;

    .line 19
    invoke-static {p1}, Lcom/google/android/gms/measurement/internal/zzkn;->zzak(Lcom/google/android/gms/measurement/internal/zzkd;)Lcom/google/android/gms/measurement/internal/zzkd;

    goto :goto_4

    :catchall_0
    move-exception p1

    .line 51
    iget-object p2, p0, Lcom/google/android/gms/measurement/internal/zzkn;->zze:Lcom/google/android/gms/measurement/internal/zzaj;

    .line 19
    invoke-static {p2}, Lcom/google/android/gms/measurement/internal/zzkn;->zzak(Lcom/google/android/gms/measurement/internal/zzkd;)Lcom/google/android/gms/measurement/internal/zzkd;

    .line 20
    invoke-virtual {p2}, Lcom/google/android/gms/measurement/internal/zzaj;->zzx()V

    .line 50
    throw p1
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_1

    :catchall_1
    move-exception p1

    .line 47
    iput-boolean v0, p0, Lcom/google/android/gms/measurement/internal/zzkn;->zzt:Z

    .line 21
    invoke-direct {p0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzac()V

    .line 51
    throw p1
.end method

.method final zzI(Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzaf()V

    return-void
.end method

.method final zzJ(ILjava/lang/Throwable;[BLjava/lang/String;)V
    .locals 8

    .line 1
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzaz()Lcom/google/android/gms/measurement/internal/zzfp;

    move-result-object p4

    invoke-virtual {p4}, Lcom/google/android/gms/measurement/internal/zzgl;->zzg()V

    .line 2
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzB()V

    const/4 p4, 0x0

    if-nez p3, :cond_0

    :try_start_0
    new-array p3, p4, [B

    :cond_0
    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzkn;->zzy:Ljava/util/List;

    .line 3
    invoke-static {v0}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    const/4 v1, 0x0

    iput-object v1, p0, Lcom/google/android/gms/measurement/internal/zzkn;->zzy:Ljava/util/List;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    const/16 v2, 0xc8

    const/16 v3, 0xcc

    if-eq p1, v2, :cond_1

    if-ne p1, v3, :cond_6

    const/16 p1, 0xcc

    :cond_1
    if-nez p2, :cond_6

    :try_start_1
    iget-object p2, p0, Lcom/google/android/gms/measurement/internal/zzkn;->zzk:Lcom/google/android/gms/measurement/internal/zzjk;

    .line 4
    iget-object p2, p2, Lcom/google/android/gms/measurement/internal/zzjk;->zzc:Lcom/google/android/gms/measurement/internal/zzet;

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzav()Lcom/google/android/gms/common/util/Clock;

    move-result-object v2

    invoke-interface {v2}, Lcom/google/android/gms/common/util/Clock;->currentTimeMillis()J

    move-result-wide v2

    invoke-virtual {p2, v2, v3}, Lcom/google/android/gms/measurement/internal/zzet;->zzb(J)V

    iget-object p2, p0, Lcom/google/android/gms/measurement/internal/zzkn;->zzk:Lcom/google/android/gms/measurement/internal/zzjk;

    .line 5
    iget-object p2, p2, Lcom/google/android/gms/measurement/internal/zzjk;->zzd:Lcom/google/android/gms/measurement/internal/zzet;

    const-wide/16 v2, 0x0

    invoke-virtual {p2, v2, v3}, Lcom/google/android/gms/measurement/internal/zzet;->zzb(J)V

    .line 6
    invoke-direct {p0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzaf()V

    .line 7
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzay()Lcom/google/android/gms/measurement/internal/zzei;

    move-result-object p2

    .line 8
    invoke-virtual {p2}, Lcom/google/android/gms/measurement/internal/zzei;->zzj()Lcom/google/android/gms/measurement/internal/zzeg;

    move-result-object p2

    const-string v4, "Successful upload. Got network response. code, size"

    .line 9
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    array-length p3, p3

    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p3

    invoke-virtual {p2, v4, p1, p3}, Lcom/google/android/gms/measurement/internal/zzeg;->zzc(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    iget-object p1, p0, Lcom/google/android/gms/measurement/internal/zzkn;->zze:Lcom/google/android/gms/measurement/internal/zzaj;

    .line 10
    invoke-static {p1}, Lcom/google/android/gms/measurement/internal/zzkn;->zzak(Lcom/google/android/gms/measurement/internal/zzkd;)Lcom/google/android/gms/measurement/internal/zzkd;

    .line 11
    invoke-virtual {p1}, Lcom/google/android/gms/measurement/internal/zzaj;->zzw()V
    :try_end_1
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_1 .. :try_end_1} :catch_2
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 12
    :try_start_2
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result p2

    if-eqz p2, :cond_4

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Ljava/lang/Long;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    :try_start_3
    iget-object p3, p0, Lcom/google/android/gms/measurement/internal/zzkn;->zze:Lcom/google/android/gms/measurement/internal/zzaj;

    .line 13
    invoke-static {p3}, Lcom/google/android/gms/measurement/internal/zzkn;->zzak(Lcom/google/android/gms/measurement/internal/zzkd;)Lcom/google/android/gms/measurement/internal/zzkd;

    .line 14
    invoke-virtual {p2}, Ljava/lang/Long;->longValue()J

    move-result-wide v4

    .line 15
    invoke-virtual {p3}, Lcom/google/android/gms/measurement/internal/zzgl;->zzg()V

    .line 16
    invoke-virtual {p3}, Lcom/google/android/gms/measurement/internal/zzkd;->zzY()V

    .line 17
    invoke-virtual {p3}, Lcom/google/android/gms/measurement/internal/zzaj;->zzh()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    const/4 v6, 0x1

    new-array v7, v6, [Ljava/lang/String;

    .line 18
    invoke-static {v4, v5}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v4

    aput-object v4, v7, p4
    :try_end_3
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_3 .. :try_end_3} :catch_1
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    :try_start_4
    const-string v4, "queue"

    const-string v5, "rowid=?"

    .line 19
    invoke-virtual {v0, v4, v5, v7}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v0

    if-ne v0, v6, :cond_2

    goto :goto_0

    .line 20
    :cond_2
    new-instance v0, Landroid/database/sqlite/SQLiteException;

    const-string v4, "Deleted fewer rows from queue than expected"

    invoke-direct {v0, v4}, Landroid/database/sqlite/SQLiteException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_4
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_4 .. :try_end_4} :catch_0
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    :catch_0
    move-exception v0

    .line 33
    :try_start_5
    iget-object p3, p3, Lcom/google/android/gms/measurement/internal/zzgl;->zzs:Lcom/google/android/gms/measurement/internal/zzfs;

    .line 21
    invoke-virtual {p3}, Lcom/google/android/gms/measurement/internal/zzfs;->zzay()Lcom/google/android/gms/measurement/internal/zzei;

    move-result-object p3

    .line 22
    invoke-virtual {p3}, Lcom/google/android/gms/measurement/internal/zzei;->zzd()Lcom/google/android/gms/measurement/internal/zzeg;

    move-result-object p3

    const-string v4, "Failed to delete a bundle in a queue table"

    invoke-virtual {p3, v4, v0}, Lcom/google/android/gms/measurement/internal/zzeg;->zzb(Ljava/lang/String;Ljava/lang/Object;)V

    .line 23
    throw v0
    :try_end_5
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_5 .. :try_end_5} :catch_1
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    :catch_1
    move-exception p3

    .line 34
    :try_start_6
    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzkn;->zzz:Ljava/util/List;

    if-eqz v0, :cond_3

    .line 24
    invoke-interface {v0, p2}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_3

    goto :goto_0

    .line 33
    :cond_3
    throw p3

    .line 20
    :cond_4
    iget-object p1, p0, Lcom/google/android/gms/measurement/internal/zzkn;->zze:Lcom/google/android/gms/measurement/internal/zzaj;

    .line 25
    invoke-static {p1}, Lcom/google/android/gms/measurement/internal/zzkn;->zzak(Lcom/google/android/gms/measurement/internal/zzkd;)Lcom/google/android/gms/measurement/internal/zzkd;

    .line 26
    invoke-virtual {p1}, Lcom/google/android/gms/measurement/internal/zzaj;->zzC()V
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    :try_start_7
    iget-object p1, p0, Lcom/google/android/gms/measurement/internal/zzkn;->zze:Lcom/google/android/gms/measurement/internal/zzaj;

    .line 27
    invoke-static {p1}, Lcom/google/android/gms/measurement/internal/zzkn;->zzak(Lcom/google/android/gms/measurement/internal/zzkd;)Lcom/google/android/gms/measurement/internal/zzkd;

    .line 28
    invoke-virtual {p1}, Lcom/google/android/gms/measurement/internal/zzaj;->zzx()V

    iput-object v1, p0, Lcom/google/android/gms/measurement/internal/zzkn;->zzz:Ljava/util/List;

    iget-object p1, p0, Lcom/google/android/gms/measurement/internal/zzkn;->zzd:Lcom/google/android/gms/measurement/internal/zzeo;

    .line 29
    invoke-static {p1}, Lcom/google/android/gms/measurement/internal/zzkn;->zzak(Lcom/google/android/gms/measurement/internal/zzkd;)Lcom/google/android/gms/measurement/internal/zzkd;

    .line 30
    invoke-virtual {p1}, Lcom/google/android/gms/measurement/internal/zzeo;->zzc()Z

    move-result p1

    if-eqz p1, :cond_5

    invoke-direct {p0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzai()Z

    move-result p1

    if-eqz p1, :cond_5

    .line 32
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzV()V

    goto :goto_1

    :cond_5
    const-wide/16 p1, -0x1

    .line 46
    iput-wide p1, p0, Lcom/google/android/gms/measurement/internal/zzkn;->zzA:J

    .line 31
    invoke-direct {p0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzaf()V

    .line 32
    :goto_1
    iput-wide v2, p0, Lcom/google/android/gms/measurement/internal/zzkn;->zza:J

    goto :goto_2

    :catchall_0
    move-exception p1

    .line 37
    iget-object p2, p0, Lcom/google/android/gms/measurement/internal/zzkn;->zze:Lcom/google/android/gms/measurement/internal/zzaj;

    .line 27
    invoke-static {p2}, Lcom/google/android/gms/measurement/internal/zzkn;->zzak(Lcom/google/android/gms/measurement/internal/zzkd;)Lcom/google/android/gms/measurement/internal/zzkd;

    .line 28
    invoke-virtual {p2}, Lcom/google/android/gms/measurement/internal/zzaj;->zzx()V

    .line 34
    throw p1
    :try_end_7
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_7 .. :try_end_7} :catch_2
    .catchall {:try_start_7 .. :try_end_7} :catchall_1

    :catch_2
    move-exception p1

    .line 35
    :try_start_8
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzay()Lcom/google/android/gms/measurement/internal/zzei;

    move-result-object p2

    invoke-virtual {p2}, Lcom/google/android/gms/measurement/internal/zzei;->zzd()Lcom/google/android/gms/measurement/internal/zzeg;

    move-result-object p2

    const-string p3, "Database error while trying to delete uploaded bundles"

    invoke-virtual {p2, p3, p1}, Lcom/google/android/gms/measurement/internal/zzeg;->zzb(Ljava/lang/String;Ljava/lang/Object;)V

    .line 36
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzav()Lcom/google/android/gms/common/util/Clock;

    move-result-object p1

    invoke-interface {p1}, Lcom/google/android/gms/common/util/Clock;->elapsedRealtime()J

    move-result-wide p1

    iput-wide p1, p0, Lcom/google/android/gms/measurement/internal/zzkn;->zza:J

    .line 37
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzay()Lcom/google/android/gms/measurement/internal/zzei;

    move-result-object p1

    invoke-virtual {p1}, Lcom/google/android/gms/measurement/internal/zzei;->zzj()Lcom/google/android/gms/measurement/internal/zzeg;

    move-result-object p1

    const-string p2, "Disable upload, time"

    iget-wide v0, p0, Lcom/google/android/gms/measurement/internal/zzkn;->zza:J

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p3

    invoke-virtual {p1, p2, p3}, Lcom/google/android/gms/measurement/internal/zzeg;->zzb(Ljava/lang/String;Ljava/lang/Object;)V

    goto :goto_2

    .line 38
    :cond_6
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzay()Lcom/google/android/gms/measurement/internal/zzei;

    move-result-object p3

    .line 39
    invoke-virtual {p3}, Lcom/google/android/gms/measurement/internal/zzei;->zzj()Lcom/google/android/gms/measurement/internal/zzeg;

    move-result-object p3

    const-string v1, "Network upload failed. Will retry later. code, error"

    .line 40
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {p3, v1, v2, p2}, Lcom/google/android/gms/measurement/internal/zzeg;->zzc(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    iget-object p2, p0, Lcom/google/android/gms/measurement/internal/zzkn;->zzk:Lcom/google/android/gms/measurement/internal/zzjk;

    .line 41
    iget-object p2, p2, Lcom/google/android/gms/measurement/internal/zzjk;->zzd:Lcom/google/android/gms/measurement/internal/zzet;

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzav()Lcom/google/android/gms/common/util/Clock;

    move-result-object p3

    invoke-interface {p3}, Lcom/google/android/gms/common/util/Clock;->currentTimeMillis()J

    move-result-wide v1

    invoke-virtual {p2, v1, v2}, Lcom/google/android/gms/measurement/internal/zzet;->zzb(J)V

    const/16 p2, 0x1f7

    if-eq p1, p2, :cond_7

    const/16 p2, 0x1ad

    if-ne p1, p2, :cond_8

    :cond_7
    iget-object p1, p0, Lcom/google/android/gms/measurement/internal/zzkn;->zzk:Lcom/google/android/gms/measurement/internal/zzjk;

    .line 42
    iget-object p1, p1, Lcom/google/android/gms/measurement/internal/zzjk;->zzb:Lcom/google/android/gms/measurement/internal/zzet;

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzav()Lcom/google/android/gms/common/util/Clock;

    move-result-object p2

    invoke-interface {p2}, Lcom/google/android/gms/common/util/Clock;->currentTimeMillis()J

    move-result-wide p2

    invoke-virtual {p1, p2, p3}, Lcom/google/android/gms/measurement/internal/zzet;->zzb(J)V

    :cond_8
    iget-object p1, p0, Lcom/google/android/gms/measurement/internal/zzkn;->zze:Lcom/google/android/gms/measurement/internal/zzaj;

    .line 43
    invoke-static {p1}, Lcom/google/android/gms/measurement/internal/zzkn;->zzak(Lcom/google/android/gms/measurement/internal/zzkd;)Lcom/google/android/gms/measurement/internal/zzkd;

    .line 44
    invoke-virtual {p1, v0}, Lcom/google/android/gms/measurement/internal/zzaj;->zzy(Ljava/util/List;)V

    .line 45
    invoke-direct {p0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzaf()V
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_1

    .line 32
    :goto_2
    iput-boolean p4, p0, Lcom/google/android/gms/measurement/internal/zzkn;->zzu:Z

    .line 46
    invoke-direct {p0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzac()V

    return-void

    :catchall_1
    move-exception p1

    .line 45
    iput-boolean p4, p0, Lcom/google/android/gms/measurement/internal/zzkn;->zzu:Z

    .line 46
    invoke-direct {p0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzac()V

    .line 47
    throw p1
.end method

.method final zzK(Lcom/google/android/gms/measurement/internal/zzp;)V
    .locals 24

    move-object/from16 v1, p0

    move-object/from16 v2, p1

    const-string v3, "_sysu"

    const-string v4, "_sys"

    const-string v5, "com.android.vending"

    const-string v6, "_pfo"

    const-string v7, "_uwa"

    const-string v0, "app_id=?"

    .line 1
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzaz()Lcom/google/android/gms/measurement/internal/zzfp;

    move-result-object v8

    invoke-virtual {v8}, Lcom/google/android/gms/measurement/internal/zzgl;->zzg()V

    .line 2
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzB()V

    .line 3
    invoke-static/range {p1 .. p1}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    iget-object v8, v2, Lcom/google/android/gms/measurement/internal/zzp;->zza:Ljava/lang/String;

    invoke-static {v8}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotEmpty(Ljava/lang/String;)Ljava/lang/String;

    .line 5
    invoke-direct/range {p0 .. p1}, Lcom/google/android/gms/measurement/internal/zzkn;->zzag(Lcom/google/android/gms/measurement/internal/zzp;)Z

    move-result v8

    if-eqz v8, :cond_28

    iget-object v8, v1, Lcom/google/android/gms/measurement/internal/zzkn;->zze:Lcom/google/android/gms/measurement/internal/zzaj;

    .line 6
    invoke-static {v8}, Lcom/google/android/gms/measurement/internal/zzkn;->zzak(Lcom/google/android/gms/measurement/internal/zzkd;)Lcom/google/android/gms/measurement/internal/zzkd;

    .line 7
    iget-object v9, v2, Lcom/google/android/gms/measurement/internal/zzp;->zza:Ljava/lang/String;

    invoke-virtual {v8, v9}, Lcom/google/android/gms/measurement/internal/zzaj;->zzj(Ljava/lang/String;)Lcom/google/android/gms/measurement/internal/zzg;

    move-result-object v8

    const-wide/16 v9, 0x0

    if-eqz v8, :cond_0

    .line 8
    invoke-virtual {v8}, Lcom/google/android/gms/measurement/internal/zzg;->zzz()Ljava/lang/String;

    move-result-object v11

    invoke-static {v11}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v11

    if-eqz v11, :cond_0

    iget-object v11, v2, Lcom/google/android/gms/measurement/internal/zzp;->zzb:Ljava/lang/String;

    .line 9
    invoke-static {v11}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v11

    if-nez v11, :cond_0

    .line 10
    invoke-virtual {v8, v9, v10}, Lcom/google/android/gms/measurement/internal/zzg;->zzM(J)V

    iget-object v11, v1, Lcom/google/android/gms/measurement/internal/zzkn;->zze:Lcom/google/android/gms/measurement/internal/zzaj;

    .line 11
    invoke-static {v11}, Lcom/google/android/gms/measurement/internal/zzkn;->zzak(Lcom/google/android/gms/measurement/internal/zzkd;)Lcom/google/android/gms/measurement/internal/zzkd;

    .line 12
    invoke-virtual {v11, v8}, Lcom/google/android/gms/measurement/internal/zzaj;->zzD(Lcom/google/android/gms/measurement/internal/zzg;)V

    iget-object v8, v1, Lcom/google/android/gms/measurement/internal/zzkn;->zzc:Lcom/google/android/gms/measurement/internal/zzfj;

    .line 13
    invoke-static {v8}, Lcom/google/android/gms/measurement/internal/zzkn;->zzak(Lcom/google/android/gms/measurement/internal/zzkd;)Lcom/google/android/gms/measurement/internal/zzkd;

    .line 14
    iget-object v11, v2, Lcom/google/android/gms/measurement/internal/zzp;->zza:Ljava/lang/String;

    invoke-virtual {v8, v11}, Lcom/google/android/gms/measurement/internal/zzfj;->zzj(Ljava/lang/String;)V

    .line 15
    :cond_0
    iget-boolean v8, v2, Lcom/google/android/gms/measurement/internal/zzp;->zzh:Z

    if-nez v8, :cond_1

    .line 16
    invoke-virtual/range {p0 .. p1}, Lcom/google/android/gms/measurement/internal/zzkn;->zzd(Lcom/google/android/gms/measurement/internal/zzp;)Lcom/google/android/gms/measurement/internal/zzg;

    return-void

    .line 17
    :cond_1
    iget-wide v11, v2, Lcom/google/android/gms/measurement/internal/zzp;->zzm:J

    cmp-long v8, v11, v9

    if-nez v8, :cond_2

    .line 18
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzav()Lcom/google/android/gms/common/util/Clock;

    move-result-object v8

    invoke-interface {v8}, Lcom/google/android/gms/common/util/Clock;->currentTimeMillis()J

    move-result-wide v11

    :cond_2
    iget-object v8, v1, Lcom/google/android/gms/measurement/internal/zzkn;->zzn:Lcom/google/android/gms/measurement/internal/zzfs;

    .line 19
    invoke-virtual {v8}, Lcom/google/android/gms/measurement/internal/zzfs;->zzg()Lcom/google/android/gms/measurement/internal/zzan;

    move-result-object v8

    .line 20
    invoke-virtual {v8}, Lcom/google/android/gms/measurement/internal/zzan;->zzd()V

    .line 21
    iget v8, v2, Lcom/google/android/gms/measurement/internal/zzp;->zzn:I

    const/4 v15, 0x1

    if-eqz v8, :cond_3

    if-eq v8, v15, :cond_3

    .line 22
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzay()Lcom/google/android/gms/measurement/internal/zzei;

    move-result-object v13

    .line 23
    invoke-virtual {v13}, Lcom/google/android/gms/measurement/internal/zzei;->zzk()Lcom/google/android/gms/measurement/internal/zzeg;

    move-result-object v13

    iget-object v14, v2, Lcom/google/android/gms/measurement/internal/zzp;->zza:Ljava/lang/String;

    invoke-static {v14}, Lcom/google/android/gms/measurement/internal/zzei;->zzn(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v14

    .line 24
    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    const-string v9, "Incorrect app type, assuming installed app. appId, appType"

    .line 25
    invoke-virtual {v13, v9, v14, v8}, Lcom/google/android/gms/measurement/internal/zzeg;->zzc(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    const/4 v8, 0x0

    :cond_3
    iget-object v9, v1, Lcom/google/android/gms/measurement/internal/zzkn;->zze:Lcom/google/android/gms/measurement/internal/zzaj;

    .line 26
    invoke-static {v9}, Lcom/google/android/gms/measurement/internal/zzkn;->zzak(Lcom/google/android/gms/measurement/internal/zzkd;)Lcom/google/android/gms/measurement/internal/zzkd;

    .line 27
    invoke-virtual {v9}, Lcom/google/android/gms/measurement/internal/zzaj;->zzw()V

    :try_start_0
    iget-object v9, v1, Lcom/google/android/gms/measurement/internal/zzkn;->zze:Lcom/google/android/gms/measurement/internal/zzaj;

    .line 28
    invoke-static {v9}, Lcom/google/android/gms/measurement/internal/zzkn;->zzak(Lcom/google/android/gms/measurement/internal/zzkd;)Lcom/google/android/gms/measurement/internal/zzkd;

    .line 29
    iget-object v10, v2, Lcom/google/android/gms/measurement/internal/zzp;->zza:Ljava/lang/String;

    const-string v13, "_npa"

    .line 30
    invoke-virtual {v9, v10, v13}, Lcom/google/android/gms/measurement/internal/zzaj;->zzp(Ljava/lang/String;Ljava/lang/String;)Lcom/google/android/gms/measurement/internal/zzks;

    move-result-object v9

    if-eqz v9, :cond_5

    const-string v10, "auto"

    iget-object v13, v9, Lcom/google/android/gms/measurement/internal/zzks;->zzb:Ljava/lang/String;

    .line 31
    invoke-virtual {v10, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_4

    goto :goto_0

    :cond_4
    move-object/from16 v21, v3

    move-object/from16 v22, v4

    const/4 v4, 0x1

    goto :goto_2

    .line 32
    :cond_5
    :goto_0
    iget-object v10, v2, Lcom/google/android/gms/measurement/internal/zzp;->zzr:Ljava/lang/Boolean;

    if-eqz v10, :cond_8

    .line 33
    new-instance v14, Lcom/google/android/gms/measurement/internal/zzkq;

    const-string v19, "_npa"

    .line 34
    invoke-virtual {v10}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v10

    if-eq v15, v10, :cond_6

    const-wide/16 v20, 0x0

    goto :goto_1

    :cond_6
    const-wide/16 v20, 0x1

    :goto_1
    invoke-static/range {v20 .. v21}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v10

    const-string v20, "auto"

    move-object/from16 v21, v3

    move-object/from16 v22, v4

    const-wide/16 v3, 0x1

    move-object v13, v14

    move-object v3, v14

    const/4 v4, 0x0

    move-object/from16 v14, v19

    const/4 v4, 0x1

    move-wide v15, v11

    move-object/from16 v17, v10

    move-object/from16 v18, v20

    invoke-direct/range {v13 .. v18}, Lcom/google/android/gms/measurement/internal/zzkq;-><init>(Ljava/lang/String;JLjava/lang/Object;Ljava/lang/String;)V

    if-eqz v9, :cond_7

    iget-object v9, v9, Lcom/google/android/gms/measurement/internal/zzks;->zze:Ljava/lang/Object;

    iget-object v10, v3, Lcom/google/android/gms/measurement/internal/zzkq;->zzd:Ljava/lang/Long;

    .line 35
    invoke-virtual {v9, v10}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-nez v9, :cond_9

    .line 36
    :cond_7
    invoke-virtual {v1, v3, v2}, Lcom/google/android/gms/measurement/internal/zzkn;->zzU(Lcom/google/android/gms/measurement/internal/zzkq;Lcom/google/android/gms/measurement/internal/zzp;)V

    goto :goto_2

    :cond_8
    move-object/from16 v21, v3

    move-object/from16 v22, v4

    const/4 v4, 0x1

    if-eqz v9, :cond_9

    .line 37
    new-instance v3, Lcom/google/android/gms/measurement/internal/zzkq;

    const-string v14, "_npa"

    const/16 v17, 0x0

    const-string v18, "auto"

    move-object v13, v3

    move-wide v15, v11

    invoke-direct/range {v13 .. v18}, Lcom/google/android/gms/measurement/internal/zzkq;-><init>(Ljava/lang/String;JLjava/lang/Object;Ljava/lang/String;)V

    .line 38
    invoke-virtual {v1, v3, v2}, Lcom/google/android/gms/measurement/internal/zzkn;->zzO(Lcom/google/android/gms/measurement/internal/zzkq;Lcom/google/android/gms/measurement/internal/zzp;)V

    .line 36
    :cond_9
    :goto_2
    iget-object v3, v1, Lcom/google/android/gms/measurement/internal/zzkn;->zze:Lcom/google/android/gms/measurement/internal/zzaj;

    .line 39
    invoke-static {v3}, Lcom/google/android/gms/measurement/internal/zzkn;->zzak(Lcom/google/android/gms/measurement/internal/zzkd;)Lcom/google/android/gms/measurement/internal/zzkd;

    .line 40
    iget-object v9, v2, Lcom/google/android/gms/measurement/internal/zzp;->zza:Ljava/lang/String;

    invoke-static {v9}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/lang/String;

    invoke-virtual {v3, v9}, Lcom/google/android/gms/measurement/internal/zzaj;->zzj(Ljava/lang/String;)Lcom/google/android/gms/measurement/internal/zzg;

    move-result-object v3

    if-eqz v3, :cond_b

    .line 41
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzv()Lcom/google/android/gms/measurement/internal/zzku;

    move-result-object v10

    iget-object v13, v2, Lcom/google/android/gms/measurement/internal/zzp;->zzb:Ljava/lang/String;

    .line 42
    invoke-virtual {v3}, Lcom/google/android/gms/measurement/internal/zzg;->zzz()Ljava/lang/String;

    move-result-object v14

    iget-object v15, v2, Lcom/google/android/gms/measurement/internal/zzp;->zzq:Ljava/lang/String;

    .line 43
    invoke-virtual {v3}, Lcom/google/android/gms/measurement/internal/zzg;->zzr()Ljava/lang/String;

    move-result-object v9

    .line 44
    invoke-virtual {v10, v13, v14, v15, v9}, Lcom/google/android/gms/measurement/internal/zzku;->zzam(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z

    move-result v9

    if-eqz v9, :cond_b

    .line 45
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzay()Lcom/google/android/gms/measurement/internal/zzei;

    move-result-object v9

    .line 46
    invoke-virtual {v9}, Lcom/google/android/gms/measurement/internal/zzei;->zzk()Lcom/google/android/gms/measurement/internal/zzeg;

    move-result-object v9

    const-string v10, "New GMP App Id passed in. Removing cached database data. appId"

    .line 47
    invoke-virtual {v3}, Lcom/google/android/gms/measurement/internal/zzg;->zzt()Ljava/lang/String;

    move-result-object v13

    invoke-static {v13}, Lcom/google/android/gms/measurement/internal/zzei;->zzn(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v13

    .line 48
    invoke-virtual {v9, v10, v13}, Lcom/google/android/gms/measurement/internal/zzeg;->zzb(Ljava/lang/String;Ljava/lang/Object;)V

    iget-object v9, v1, Lcom/google/android/gms/measurement/internal/zzkn;->zze:Lcom/google/android/gms/measurement/internal/zzaj;

    .line 49
    invoke-static {v9}, Lcom/google/android/gms/measurement/internal/zzkn;->zzak(Lcom/google/android/gms/measurement/internal/zzkd;)Lcom/google/android/gms/measurement/internal/zzkd;

    .line 50
    invoke-virtual {v3}, Lcom/google/android/gms/measurement/internal/zzg;->zzt()Ljava/lang/String;

    move-result-object v3

    .line 51
    invoke-virtual {v9}, Lcom/google/android/gms/measurement/internal/zzkd;->zzY()V

    .line 52
    invoke-virtual {v9}, Lcom/google/android/gms/measurement/internal/zzgl;->zzg()V

    .line 53
    invoke-static {v3}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotEmpty(Ljava/lang/String;)Ljava/lang/String;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 54
    :try_start_1
    invoke-virtual {v9}, Lcom/google/android/gms/measurement/internal/zzaj;->zzh()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v10

    new-array v13, v4, [Ljava/lang/String;

    const/4 v14, 0x0

    aput-object v3, v13, v14

    const-string v14, "events"

    .line 55
    invoke-virtual {v10, v14, v0, v13}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v14

    const-string/jumbo v15, "user_attributes"

    .line 56
    invoke-virtual {v10, v15, v0, v13}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v15

    add-int/2addr v14, v15

    const-string v15, "conditional_properties"

    .line 57
    invoke-virtual {v10, v15, v0, v13}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v15

    add-int/2addr v14, v15

    const-string v15, "apps"

    .line 58
    invoke-virtual {v10, v15, v0, v13}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v15

    add-int/2addr v14, v15

    const-string v15, "raw_events"

    .line 59
    invoke-virtual {v10, v15, v0, v13}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v15

    add-int/2addr v14, v15

    const-string v15, "raw_events_metadata"

    .line 60
    invoke-virtual {v10, v15, v0, v13}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v15

    add-int/2addr v14, v15

    const-string v15, "event_filters"

    .line 61
    invoke-virtual {v10, v15, v0, v13}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v15

    add-int/2addr v14, v15

    const-string v15, "property_filters"

    .line 62
    invoke-virtual {v10, v15, v0, v13}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v15

    add-int/2addr v14, v15

    const-string v15, "audience_filter_values"

    .line 63
    invoke-virtual {v10, v15, v0, v13}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v15

    add-int/2addr v14, v15

    const-string v15, "consent_settings"

    .line 64
    invoke-virtual {v10, v15, v0, v13}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v0

    add-int/2addr v14, v0

    if-lez v14, :cond_a

    iget-object v0, v9, Lcom/google/android/gms/measurement/internal/zzgl;->zzs:Lcom/google/android/gms/measurement/internal/zzfs;

    .line 65
    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzfs;->zzay()Lcom/google/android/gms/measurement/internal/zzei;

    move-result-object v0

    .line 66
    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzei;->zzj()Lcom/google/android/gms/measurement/internal/zzeg;

    move-result-object v0

    const-string v10, "Deleted application data. app, records"

    invoke-static {v14}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v13

    invoke-virtual {v0, v10, v3, v13}, Lcom/google/android/gms/measurement/internal/zzeg;->zzc(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V
    :try_end_1
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_3

    :catch_0
    move-exception v0

    .line 206
    :try_start_2
    iget-object v9, v9, Lcom/google/android/gms/measurement/internal/zzgl;->zzs:Lcom/google/android/gms/measurement/internal/zzfs;

    .line 67
    invoke-virtual {v9}, Lcom/google/android/gms/measurement/internal/zzfs;->zzay()Lcom/google/android/gms/measurement/internal/zzei;

    move-result-object v9

    .line 68
    invoke-virtual {v9}, Lcom/google/android/gms/measurement/internal/zzei;->zzd()Lcom/google/android/gms/measurement/internal/zzeg;

    move-result-object v9

    const-string v10, "Error deleting application data. appId, error"

    invoke-static {v3}, Lcom/google/android/gms/measurement/internal/zzei;->zzn(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    .line 69
    invoke-virtual {v9, v10, v3, v0}, Lcom/google/android/gms/measurement/internal/zzeg;->zzc(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    :cond_a
    :goto_3
    const/4 v3, 0x0

    :cond_b
    if-eqz v3, :cond_f

    .line 70
    invoke-virtual {v3}, Lcom/google/android/gms/measurement/internal/zzg;->zzb()J

    move-result-wide v9

    const-wide/32 v13, -0x80000000

    cmp-long v0, v9, v13

    if-eqz v0, :cond_c

    .line 71
    invoke-virtual {v3}, Lcom/google/android/gms/measurement/internal/zzg;->zzb()J

    move-result-wide v9

    move-object/from16 v23, v5

    iget-wide v4, v2, Lcom/google/android/gms/measurement/internal/zzp;->zzj:J

    cmp-long v0, v9, v4

    if-eqz v0, :cond_d

    const/4 v15, 0x1

    goto :goto_4

    :cond_c
    move-object/from16 v23, v5

    :cond_d
    const/4 v15, 0x0

    .line 72
    :goto_4
    invoke-virtual {v3}, Lcom/google/android/gms/measurement/internal/zzg;->zzw()Ljava/lang/String;

    move-result-object v0

    .line 73
    invoke-virtual {v3}, Lcom/google/android/gms/measurement/internal/zzg;->zzb()J

    move-result-wide v3

    cmp-long v5, v3, v13

    if-nez v5, :cond_e

    if-eqz v0, :cond_e

    iget-object v3, v2, Lcom/google/android/gms/measurement/internal/zzp;->zzc:Ljava/lang/String;

    .line 74
    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_e

    const/4 v3, 0x1

    goto :goto_5

    :cond_e
    const/4 v3, 0x0

    :goto_5
    or-int/2addr v3, v15

    if-eqz v3, :cond_10

    new-instance v3, Landroid/os/Bundle;

    .line 75
    invoke-direct {v3}, Landroid/os/Bundle;-><init>()V

    const-string v4, "_pv"

    .line 76
    invoke-virtual {v3, v4, v0}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 77
    new-instance v0, Lcom/google/android/gms/measurement/internal/zzat;

    new-instance v15, Lcom/google/android/gms/measurement/internal/zzar;

    invoke-direct {v15, v3}, Lcom/google/android/gms/measurement/internal/zzar;-><init>(Landroid/os/Bundle;)V

    const-string v14, "_au"

    const-string v16, "auto"

    move-object v13, v0

    move-wide/from16 v17, v11

    invoke-direct/range {v13 .. v18}, Lcom/google/android/gms/measurement/internal/zzat;-><init>(Ljava/lang/String;Lcom/google/android/gms/measurement/internal/zzar;Ljava/lang/String;J)V

    .line 78
    invoke-virtual {v1, v0, v2}, Lcom/google/android/gms/measurement/internal/zzkn;->zzD(Lcom/google/android/gms/measurement/internal/zzat;Lcom/google/android/gms/measurement/internal/zzp;)V

    goto :goto_6

    :cond_f
    move-object/from16 v23, v5

    .line 79
    :cond_10
    :goto_6
    invoke-virtual/range {p0 .. p1}, Lcom/google/android/gms/measurement/internal/zzkn;->zzd(Lcom/google/android/gms/measurement/internal/zzp;)Lcom/google/android/gms/measurement/internal/zzg;

    if-nez v8, :cond_11

    iget-object v0, v1, Lcom/google/android/gms/measurement/internal/zzkn;->zze:Lcom/google/android/gms/measurement/internal/zzaj;

    .line 80
    invoke-static {v0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzak(Lcom/google/android/gms/measurement/internal/zzkd;)Lcom/google/android/gms/measurement/internal/zzkd;

    .line 81
    iget-object v3, v2, Lcom/google/android/gms/measurement/internal/zzp;->zza:Ljava/lang/String;

    const-string v4, "_f"

    .line 82
    invoke-virtual {v0, v3, v4}, Lcom/google/android/gms/measurement/internal/zzaj;->zzn(Ljava/lang/String;Ljava/lang/String;)Lcom/google/android/gms/measurement/internal/zzap;

    move-result-object v0

    const/4 v15, 0x0

    goto :goto_7

    .line 201
    :cond_11
    iget-object v0, v1, Lcom/google/android/gms/measurement/internal/zzkn;->zze:Lcom/google/android/gms/measurement/internal/zzaj;

    .line 83
    invoke-static {v0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzak(Lcom/google/android/gms/measurement/internal/zzkd;)Lcom/google/android/gms/measurement/internal/zzkd;

    .line 84
    iget-object v3, v2, Lcom/google/android/gms/measurement/internal/zzp;->zza:Ljava/lang/String;

    const-string v4, "_v"

    .line 85
    invoke-virtual {v0, v3, v4}, Lcom/google/android/gms/measurement/internal/zzaj;->zzn(Ljava/lang/String;Ljava/lang/String;)Lcom/google/android/gms/measurement/internal/zzap;

    move-result-object v0

    const/4 v15, 0x1

    :goto_7
    if-nez v0, :cond_26

    const-wide/32 v3, 0x36ee80

    .line 82
    div-long v8, v11, v3
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    const-wide/16 v13, 0x1

    add-long/2addr v8, v13

    mul-long v8, v8, v3

    const-string v3, "_dac"

    const-string v4, "_r"

    const-string v5, "_c"

    const-string v10, "_et"

    if-nez v15, :cond_24

    .line 99
    :try_start_3
    new-instance v0, Lcom/google/android/gms/measurement/internal/zzkq;

    const-string v14, "_fot"

    .line 100
    invoke-static {v8, v9}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v17

    const-string v18, "auto"

    move-object v13, v0

    move-wide v15, v11

    invoke-direct/range {v13 .. v18}, Lcom/google/android/gms/measurement/internal/zzkq;-><init>(Ljava/lang/String;JLjava/lang/Object;Ljava/lang/String;)V

    .line 101
    invoke-virtual {v1, v0, v2}, Lcom/google/android/gms/measurement/internal/zzkn;->zzU(Lcom/google/android/gms/measurement/internal/zzkq;Lcom/google/android/gms/measurement/internal/zzp;)V

    .line 102
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzaz()Lcom/google/android/gms/measurement/internal/zzfp;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzgl;->zzg()V

    iget-object v0, v1, Lcom/google/android/gms/measurement/internal/zzkn;->zzm:Lcom/google/android/gms/measurement/internal/zzfa;

    .line 103
    invoke-static {v0}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    move-object v8, v0

    check-cast v8, Lcom/google/android/gms/measurement/internal/zzfa;

    iget-object v0, v2, Lcom/google/android/gms/measurement/internal/zzp;->zza:Ljava/lang/String;

    if-eqz v0, :cond_18

    .line 104
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v9

    if-eqz v9, :cond_12

    goto/16 :goto_9

    .line 174
    :cond_12
    iget-object v9, v8, Lcom/google/android/gms/measurement/internal/zzfa;->zza:Lcom/google/android/gms/measurement/internal/zzfs;

    .line 108
    invoke-virtual {v9}, Lcom/google/android/gms/measurement/internal/zzfs;->zzaz()Lcom/google/android/gms/measurement/internal/zzfp;

    move-result-object v9

    .line 109
    invoke-virtual {v9}, Lcom/google/android/gms/measurement/internal/zzgl;->zzg()V

    .line 110
    invoke-virtual {v8}, Lcom/google/android/gms/measurement/internal/zzfa;->zza()Z

    move-result v9

    if-nez v9, :cond_13

    iget-object v0, v8, Lcom/google/android/gms/measurement/internal/zzfa;->zza:Lcom/google/android/gms/measurement/internal/zzfs;

    .line 111
    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzfs;->zzay()Lcom/google/android/gms/measurement/internal/zzei;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzei;->zzi()Lcom/google/android/gms/measurement/internal/zzeg;

    move-result-object v0

    const-string v8, "Install Referrer Reporter is not available"

    invoke-virtual {v0, v8}, Lcom/google/android/gms/measurement/internal/zzeg;->zza(Ljava/lang/String;)V

    goto/16 :goto_a

    :cond_13
    new-instance v9, Lcom/google/android/gms/measurement/internal/zzez;

    .line 112
    invoke-direct {v9, v8, v0}, Lcom/google/android/gms/measurement/internal/zzez;-><init>(Lcom/google/android/gms/measurement/internal/zzfa;Ljava/lang/String;)V

    iget-object v0, v8, Lcom/google/android/gms/measurement/internal/zzfa;->zza:Lcom/google/android/gms/measurement/internal/zzfs;

    .line 113
    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzfs;->zzaz()Lcom/google/android/gms/measurement/internal/zzfp;

    move-result-object v0

    .line 114
    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzgl;->zzg()V

    new-instance v0, Landroid/content/Intent;

    const-string v13, "com.google.android.finsky.BIND_GET_INSTALL_REFERRER_SERVICE"

    .line 115
    invoke-direct {v0, v13}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    new-instance v13, Landroid/content/ComponentName;

    const-string v14, "com.google.android.finsky.externalreferrer.GetInstallReferrerService"

    move-object/from16 v15, v23

    .line 116
    invoke-direct {v13, v15, v14}, Landroid/content/ComponentName;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0, v13}, Landroid/content/Intent;->setComponent(Landroid/content/ComponentName;)Landroid/content/Intent;

    iget-object v13, v8, Lcom/google/android/gms/measurement/internal/zzfa;->zza:Lcom/google/android/gms/measurement/internal/zzfs;

    .line 117
    invoke-virtual {v13}, Lcom/google/android/gms/measurement/internal/zzfs;->zzau()Landroid/content/Context;

    move-result-object v13

    invoke-virtual {v13}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v13

    if-nez v13, :cond_14

    iget-object v0, v8, Lcom/google/android/gms/measurement/internal/zzfa;->zza:Lcom/google/android/gms/measurement/internal/zzfs;

    .line 118
    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzfs;->zzay()Lcom/google/android/gms/measurement/internal/zzei;

    move-result-object v0

    .line 119
    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzei;->zzm()Lcom/google/android/gms/measurement/internal/zzeg;

    move-result-object v0

    const-string v8, "Failed to obtain Package Manager to verify binding conditions for Install Referrer"

    .line 120
    invoke-virtual {v0, v8}, Lcom/google/android/gms/measurement/internal/zzeg;->zza(Ljava/lang/String;)V

    goto/16 :goto_a

    :cond_14
    const/4 v14, 0x0

    .line 121
    invoke-virtual {v13, v0, v14}, Landroid/content/pm/PackageManager;->queryIntentServices(Landroid/content/Intent;I)Ljava/util/List;

    move-result-object v13

    if-eqz v13, :cond_17

    .line 122
    invoke-interface {v13}, Ljava/util/List;->isEmpty()Z

    move-result v16

    if-nez v16, :cond_17

    .line 126
    invoke-interface {v13, v14}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Landroid/content/pm/ResolveInfo;

    .line 127
    iget-object v14, v13, Landroid/content/pm/ResolveInfo;->serviceInfo:Landroid/content/pm/ServiceInfo;

    if-eqz v14, :cond_19

    .line 128
    iget-object v14, v13, Landroid/content/pm/ResolveInfo;->serviceInfo:Landroid/content/pm/ServiceInfo;

    iget-object v14, v14, Landroid/content/pm/ServiceInfo;->packageName:Ljava/lang/String;

    .line 129
    iget-object v13, v13, Landroid/content/pm/ResolveInfo;->serviceInfo:Landroid/content/pm/ServiceInfo;

    iget-object v13, v13, Landroid/content/pm/ServiceInfo;->name:Ljava/lang/String;

    if-eqz v13, :cond_16

    .line 130
    invoke-virtual {v15, v14}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_16

    .line 110
    invoke-virtual {v8}, Lcom/google/android/gms/measurement/internal/zzfa;->zza()Z

    move-result v13

    if-eqz v13, :cond_16

    new-instance v13, Landroid/content/Intent;

    .line 134
    invoke-direct {v13, v0}, Landroid/content/Intent;-><init>(Landroid/content/Intent;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 135
    :try_start_4
    invoke-static {}, Lcom/google/android/gms/common/stats/ConnectionTracker;->getInstance()Lcom/google/android/gms/common/stats/ConnectionTracker;

    move-result-object v0

    iget-object v14, v8, Lcom/google/android/gms/measurement/internal/zzfa;->zza:Lcom/google/android/gms/measurement/internal/zzfs;

    .line 136
    invoke-virtual {v14}, Lcom/google/android/gms/measurement/internal/zzfs;->zzau()Landroid/content/Context;

    move-result-object v14

    const/4 v15, 0x1

    .line 137
    invoke-virtual {v0, v14, v13, v9, v15}, Lcom/google/android/gms/common/stats/ConnectionTracker;->bindService(Landroid/content/Context;Landroid/content/Intent;Landroid/content/ServiceConnection;I)Z

    move-result v0

    iget-object v9, v8, Lcom/google/android/gms/measurement/internal/zzfa;->zza:Lcom/google/android/gms/measurement/internal/zzfs;

    .line 138
    invoke-virtual {v9}, Lcom/google/android/gms/measurement/internal/zzfs;->zzay()Lcom/google/android/gms/measurement/internal/zzei;

    move-result-object v9

    .line 139
    invoke-virtual {v9}, Lcom/google/android/gms/measurement/internal/zzei;->zzj()Lcom/google/android/gms/measurement/internal/zzeg;

    move-result-object v9

    const-string v13, "Install Referrer Service is"
    :try_end_4
    .catch Ljava/lang/RuntimeException; {:try_start_4 .. :try_end_4} :catch_1
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    :try_start_5
    const-string v14, "available"

    const-string v15, "not available"
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    move-object/from16 v16, v14

    const/4 v14, 0x1

    if-eq v14, v0, :cond_15

    move-object v14, v15

    goto :goto_8

    :cond_15
    move-object/from16 v14, v16

    .line 140
    :goto_8
    :try_start_6
    invoke-virtual {v9, v13, v14}, Lcom/google/android/gms/measurement/internal/zzeg;->zzb(Ljava/lang/String;Ljava/lang/Object;)V
    :try_end_6
    .catch Ljava/lang/RuntimeException; {:try_start_6 .. :try_end_6} :catch_1
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    goto :goto_a

    :catch_1
    move-exception v0

    .line 181
    :try_start_7
    iget-object v8, v8, Lcom/google/android/gms/measurement/internal/zzfa;->zza:Lcom/google/android/gms/measurement/internal/zzfs;

    .line 141
    invoke-virtual {v8}, Lcom/google/android/gms/measurement/internal/zzfs;->zzay()Lcom/google/android/gms/measurement/internal/zzei;

    move-result-object v8

    .line 142
    invoke-virtual {v8}, Lcom/google/android/gms/measurement/internal/zzei;->zzd()Lcom/google/android/gms/measurement/internal/zzeg;

    move-result-object v8

    const-string v9, "Exception occurred while binding to Install Referrer Service"

    .line 143
    invoke-virtual {v0}, Ljava/lang/RuntimeException;->getMessage()Ljava/lang/String;

    move-result-object v0

    .line 144
    invoke-virtual {v8, v9, v0}, Lcom/google/android/gms/measurement/internal/zzeg;->zzb(Ljava/lang/String;Ljava/lang/Object;)V

    goto :goto_a

    .line 140
    :cond_16
    iget-object v0, v8, Lcom/google/android/gms/measurement/internal/zzfa;->zza:Lcom/google/android/gms/measurement/internal/zzfs;

    .line 131
    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzfs;->zzay()Lcom/google/android/gms/measurement/internal/zzei;

    move-result-object v0

    .line 132
    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzei;->zzk()Lcom/google/android/gms/measurement/internal/zzeg;

    move-result-object v0

    const-string v8, "Play Store version 8.3.73 or higher required for Install Referrer"

    .line 133
    invoke-virtual {v0, v8}, Lcom/google/android/gms/measurement/internal/zzeg;->zza(Ljava/lang/String;)V

    goto :goto_a

    :cond_17
    iget-object v0, v8, Lcom/google/android/gms/measurement/internal/zzfa;->zza:Lcom/google/android/gms/measurement/internal/zzfs;

    .line 123
    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzfs;->zzay()Lcom/google/android/gms/measurement/internal/zzei;

    move-result-object v0

    .line 124
    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzei;->zzi()Lcom/google/android/gms/measurement/internal/zzeg;

    move-result-object v0

    const-string v8, "Play Service for fetching Install Referrer is unavailable on device"

    .line 125
    invoke-virtual {v0, v8}, Lcom/google/android/gms/measurement/internal/zzeg;->zza(Ljava/lang/String;)V

    goto :goto_a

    .line 104
    :cond_18
    :goto_9
    iget-object v0, v8, Lcom/google/android/gms/measurement/internal/zzfa;->zza:Lcom/google/android/gms/measurement/internal/zzfs;

    .line 105
    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzfs;->zzay()Lcom/google/android/gms/measurement/internal/zzei;

    move-result-object v0

    .line 106
    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzei;->zzm()Lcom/google/android/gms/measurement/internal/zzeg;

    move-result-object v0

    const-string v8, "Install Referrer Reporter was called with invalid app package name"

    .line 107
    invoke-virtual {v0, v8}, Lcom/google/android/gms/measurement/internal/zzeg;->zza(Ljava/lang/String;)V

    .line 145
    :cond_19
    :goto_a
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzaz()Lcom/google/android/gms/measurement/internal/zzfp;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzgl;->zzg()V

    .line 146
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzB()V

    new-instance v8, Landroid/os/Bundle;

    .line 147
    invoke-direct {v8}, Landroid/os/Bundle;-><init>()V

    const-wide/16 v13, 0x1

    .line 148
    invoke-virtual {v8, v5, v13, v14}, Landroid/os/Bundle;->putLong(Ljava/lang/String;J)V

    .line 149
    invoke-virtual {v8, v4, v13, v14}, Landroid/os/Bundle;->putLong(Ljava/lang/String;J)V

    const-wide/16 v4, 0x0

    .line 150
    invoke-virtual {v8, v7, v4, v5}, Landroid/os/Bundle;->putLong(Ljava/lang/String;J)V

    .line 151
    invoke-virtual {v8, v6, v4, v5}, Landroid/os/Bundle;->putLong(Ljava/lang/String;J)V

    move-object/from16 v9, v22

    .line 152
    invoke-virtual {v8, v9, v4, v5}, Landroid/os/Bundle;->putLong(Ljava/lang/String;J)V

    move-object/from16 v15, v21

    .line 153
    invoke-virtual {v8, v15, v4, v5}, Landroid/os/Bundle;->putLong(Ljava/lang/String;J)V

    const-wide/16 v4, 0x1

    .line 154
    invoke-virtual {v8, v10, v4, v5}, Landroid/os/Bundle;->putLong(Ljava/lang/String;J)V

    .line 155
    iget-boolean v0, v2, Lcom/google/android/gms/measurement/internal/zzp;->zzp:Z

    if-eqz v0, :cond_1a

    .line 156
    invoke-virtual {v8, v3, v4, v5}, Landroid/os/Bundle;->putLong(Ljava/lang/String;J)V

    .line 157
    :cond_1a
    iget-object v0, v2, Lcom/google/android/gms/measurement/internal/zzp;->zza:Ljava/lang/String;

    invoke-static {v0}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    move-object v3, v0

    check-cast v3, Ljava/lang/String;

    iget-object v0, v1, Lcom/google/android/gms/measurement/internal/zzkn;->zze:Lcom/google/android/gms/measurement/internal/zzaj;

    .line 158
    invoke-static {v0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzak(Lcom/google/android/gms/measurement/internal/zzkd;)Lcom/google/android/gms/measurement/internal/zzkd;

    .line 159
    invoke-static {v3}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotEmpty(Ljava/lang/String;)Ljava/lang/String;

    .line 160
    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzgl;->zzg()V

    .line 161
    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzkd;->zzY()V

    const-string v4, "first_open_count"

    .line 162
    invoke-virtual {v0, v3, v4}, Lcom/google/android/gms/measurement/internal/zzaj;->zzc(Ljava/lang/String;Ljava/lang/String;)J

    move-result-wide v4

    iget-object v0, v1, Lcom/google/android/gms/measurement/internal/zzkn;->zzn:Lcom/google/android/gms/measurement/internal/zzfs;

    .line 163
    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzfs;->zzau()Landroid/content/Context;

    move-result-object v0

    .line 164
    invoke-virtual {v0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v0

    if-nez v0, :cond_1c

    .line 186
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzay()Lcom/google/android/gms/measurement/internal/zzei;

    move-result-object v0

    .line 187
    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzei;->zzd()Lcom/google/android/gms/measurement/internal/zzeg;

    move-result-object v0

    const-string v7, "PackageManager is null, first open report might be inaccurate. appId"

    invoke-static {v3}, Lcom/google/android/gms/measurement/internal/zzei;->zzn(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    .line 188
    invoke-virtual {v0, v7, v3}, Lcom/google/android/gms/measurement/internal/zzeg;->zzb(Ljava/lang/String;Ljava/lang/Object;)V
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_0

    move-object/from16 v22, v10

    :cond_1b
    :goto_b
    const-wide/16 v9, 0x0

    goto/16 :goto_12

    .line 205
    :cond_1c
    :try_start_8
    iget-object v0, v1, Lcom/google/android/gms/measurement/internal/zzkn;->zzn:Lcom/google/android/gms/measurement/internal/zzfs;

    .line 165
    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzfs;->zzau()Landroid/content/Context;

    move-result-object v0

    .line 166
    invoke-static {v0}, Lcom/google/android/gms/common/wrappers/Wrappers;->packageManager(Landroid/content/Context;)Lcom/google/android/gms/common/wrappers/PackageManagerWrapper;

    move-result-object v0

    const/4 v13, 0x0

    invoke-virtual {v0, v3, v13}, Lcom/google/android/gms/common/wrappers/PackageManagerWrapper;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object v0
    :try_end_8
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_8 .. :try_end_8} :catch_2
    .catchall {:try_start_8 .. :try_end_8} :catchall_0

    move-object/from16 v21, v15

    goto :goto_c

    :catch_2
    move-exception v0

    .line 167
    :try_start_9
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzay()Lcom/google/android/gms/measurement/internal/zzei;

    move-result-object v13

    .line 168
    invoke-virtual {v13}, Lcom/google/android/gms/measurement/internal/zzei;->zzd()Lcom/google/android/gms/measurement/internal/zzeg;

    move-result-object v13

    const-string v14, "Package info is null, first open report might be inaccurate. appId"

    move-object/from16 v21, v15

    invoke-static {v3}, Lcom/google/android/gms/measurement/internal/zzei;->zzn(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v15

    .line 169
    invoke-virtual {v13, v14, v15, v0}, Lcom/google/android/gms/measurement/internal/zzeg;->zzc(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    const/4 v0, 0x0

    :goto_c
    if-eqz v0, :cond_21

    .line 170
    iget-wide v13, v0, Landroid/content/pm/PackageInfo;->firstInstallTime:J

    const-wide/16 v15, 0x0

    cmp-long v17, v13, v15

    if-eqz v17, :cond_21

    .line 171
    iget-wide v13, v0, Landroid/content/pm/PackageInfo;->firstInstallTime:J

    move-object/from16 v23, v9

    move-object/from16 v22, v10

    iget-wide v9, v0, Landroid/content/pm/PackageInfo;->lastUpdateTime:J

    cmp-long v0, v13, v9

    if-eqz v0, :cond_1f

    .line 172
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzg()Lcom/google/android/gms/measurement/internal/zzaf;

    move-result-object v0

    sget-object v9, Lcom/google/android/gms/measurement/internal/zzdw;->zzah:Lcom/google/android/gms/measurement/internal/zzdv;

    const/4 v10, 0x0

    invoke-virtual {v0, v10, v9}, Lcom/google/android/gms/measurement/internal/zzaf;->zzs(Ljava/lang/String;Lcom/google/android/gms/measurement/internal/zzdv;)Z

    move-result v0

    if-eqz v0, :cond_1e

    const-wide/16 v13, 0x0

    cmp-long v0, v4, v13

    if-nez v0, :cond_1d

    const-wide/16 v13, 0x1

    .line 173
    invoke-virtual {v8, v7, v13, v14}, Landroid/os/Bundle;->putLong(Ljava/lang/String;J)V

    :cond_1d
    :goto_d
    const/4 v15, 0x0

    goto :goto_e

    :cond_1e
    const-wide/16 v13, 0x1

    .line 174
    invoke-virtual {v8, v7, v13, v14}, Landroid/os/Bundle;->putLong(Ljava/lang/String;J)V

    goto :goto_d

    :cond_1f
    const/4 v10, 0x0

    const/4 v15, 0x1

    .line 173
    :goto_e
    new-instance v0, Lcom/google/android/gms/measurement/internal/zzkq;

    const-string v14, "_fi"

    const/4 v7, 0x1

    if-eq v7, v15, :cond_20

    const-wide/16 v15, 0x0

    goto :goto_f

    :cond_20
    const-wide/16 v15, 0x1

    .line 175
    :goto_f
    invoke-static/range {v15 .. v16}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v17

    const-string v18, "auto"

    move-object v13, v0

    move-object/from16 v7, v21

    move-wide v15, v11

    invoke-direct/range {v13 .. v18}, Lcom/google/android/gms/measurement/internal/zzkq;-><init>(Ljava/lang/String;JLjava/lang/Object;Ljava/lang/String;)V

    .line 176
    invoke-virtual {v1, v0, v2}, Lcom/google/android/gms/measurement/internal/zzkn;->zzU(Lcom/google/android/gms/measurement/internal/zzkq;Lcom/google/android/gms/measurement/internal/zzp;)V
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_0

    goto :goto_10

    :cond_21
    move-object/from16 v23, v9

    move-object/from16 v22, v10

    move-object/from16 v7, v21

    const/4 v10, 0x0

    :goto_10
    :try_start_a
    iget-object v0, v1, Lcom/google/android/gms/measurement/internal/zzkn;->zzn:Lcom/google/android/gms/measurement/internal/zzfs;

    .line 177
    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzfs;->zzau()Landroid/content/Context;

    move-result-object v0

    .line 178
    invoke-static {v0}, Lcom/google/android/gms/common/wrappers/Wrappers;->packageManager(Landroid/content/Context;)Lcom/google/android/gms/common/wrappers/PackageManagerWrapper;

    move-result-object v0

    const/4 v9, 0x0

    invoke-virtual {v0, v3, v9}, Lcom/google/android/gms/common/wrappers/PackageManagerWrapper;->getApplicationInfo(Ljava/lang/String;I)Landroid/content/pm/ApplicationInfo;

    move-result-object v9
    :try_end_a
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_a .. :try_end_a} :catch_3
    .catchall {:try_start_a .. :try_end_a} :catchall_0

    goto :goto_11

    :catch_3
    move-exception v0

    .line 179
    :try_start_b
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzay()Lcom/google/android/gms/measurement/internal/zzei;

    move-result-object v9

    .line 180
    invoke-virtual {v9}, Lcom/google/android/gms/measurement/internal/zzei;->zzd()Lcom/google/android/gms/measurement/internal/zzeg;

    move-result-object v9

    const-string v13, "Application info is null, first open report might be inaccurate. appId"

    invoke-static {v3}, Lcom/google/android/gms/measurement/internal/zzei;->zzn(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    .line 181
    invoke-virtual {v9, v13, v3, v0}, Lcom/google/android/gms/measurement/internal/zzeg;->zzc(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    move-object v9, v10

    :goto_11
    if-eqz v9, :cond_1b

    .line 182
    iget v0, v9, Landroid/content/pm/ApplicationInfo;->flags:I

    const/4 v3, 0x1

    and-int/2addr v0, v3

    if-eqz v0, :cond_22

    move-object/from16 v3, v23

    const-wide/16 v13, 0x1

    .line 183
    invoke-virtual {v8, v3, v13, v14}, Landroid/os/Bundle;->putLong(Ljava/lang/String;J)V

    .line 184
    :cond_22
    iget v0, v9, Landroid/content/pm/ApplicationInfo;->flags:I

    and-int/lit16 v0, v0, 0x80

    if-eqz v0, :cond_1b

    const-wide/16 v9, 0x1

    .line 185
    invoke-virtual {v8, v7, v9, v10}, Landroid/os/Bundle;->putLong(Ljava/lang/String;J)V

    goto/16 :goto_b

    :goto_12
    cmp-long v0, v4, v9

    if-ltz v0, :cond_23

    .line 189
    invoke-virtual {v8, v6, v4, v5}, Landroid/os/Bundle;->putLong(Ljava/lang/String;J)V

    .line 190
    :cond_23
    new-instance v0, Lcom/google/android/gms/measurement/internal/zzat;

    new-instance v15, Lcom/google/android/gms/measurement/internal/zzar;

    invoke-direct {v15, v8}, Lcom/google/android/gms/measurement/internal/zzar;-><init>(Landroid/os/Bundle;)V

    const-string v14, "_f"

    const-string v16, "auto"

    move-object v13, v0

    move-wide/from16 v17, v11

    invoke-direct/range {v13 .. v18}, Lcom/google/android/gms/measurement/internal/zzat;-><init>(Ljava/lang/String;Lcom/google/android/gms/measurement/internal/zzar;Ljava/lang/String;J)V

    .line 191
    invoke-virtual {v1, v0, v2}, Lcom/google/android/gms/measurement/internal/zzkn;->zzF(Lcom/google/android/gms/measurement/internal/zzat;Lcom/google/android/gms/measurement/internal/zzp;)V

    move-object/from16 v4, v22

    goto :goto_13

    :cond_24
    move-object/from16 v22, v10

    .line 86
    new-instance v0, Lcom/google/android/gms/measurement/internal/zzkq;

    const-string v14, "_fvt"

    .line 87
    invoke-static {v8, v9}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v17

    const-string v18, "auto"

    move-object v13, v0

    move-wide v15, v11

    invoke-direct/range {v13 .. v18}, Lcom/google/android/gms/measurement/internal/zzkq;-><init>(Ljava/lang/String;JLjava/lang/Object;Ljava/lang/String;)V

    .line 88
    invoke-virtual {v1, v0, v2}, Lcom/google/android/gms/measurement/internal/zzkn;->zzU(Lcom/google/android/gms/measurement/internal/zzkq;Lcom/google/android/gms/measurement/internal/zzp;)V

    .line 89
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzaz()Lcom/google/android/gms/measurement/internal/zzfp;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzgl;->zzg()V

    .line 90
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzB()V

    new-instance v0, Landroid/os/Bundle;

    .line 91
    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    const-wide/16 v6, 0x1

    .line 92
    invoke-virtual {v0, v5, v6, v7}, Landroid/os/Bundle;->putLong(Ljava/lang/String;J)V

    .line 93
    invoke-virtual {v0, v4, v6, v7}, Landroid/os/Bundle;->putLong(Ljava/lang/String;J)V

    move-object/from16 v4, v22

    .line 94
    invoke-virtual {v0, v4, v6, v7}, Landroid/os/Bundle;->putLong(Ljava/lang/String;J)V

    .line 95
    iget-boolean v5, v2, Lcom/google/android/gms/measurement/internal/zzp;->zzp:Z

    if-eqz v5, :cond_25

    .line 96
    invoke-virtual {v0, v3, v6, v7}, Landroid/os/Bundle;->putLong(Ljava/lang/String;J)V

    .line 97
    :cond_25
    new-instance v3, Lcom/google/android/gms/measurement/internal/zzat;

    new-instance v15, Lcom/google/android/gms/measurement/internal/zzar;

    invoke-direct {v15, v0}, Lcom/google/android/gms/measurement/internal/zzar;-><init>(Landroid/os/Bundle;)V

    const-string v14, "_v"

    const-string v16, "auto"

    move-object v13, v3

    move-wide/from16 v17, v11

    invoke-direct/range {v13 .. v18}, Lcom/google/android/gms/measurement/internal/zzat;-><init>(Ljava/lang/String;Lcom/google/android/gms/measurement/internal/zzar;Ljava/lang/String;J)V

    .line 98
    invoke-virtual {v1, v3, v2}, Lcom/google/android/gms/measurement/internal/zzkn;->zzF(Lcom/google/android/gms/measurement/internal/zzat;Lcom/google/android/gms/measurement/internal/zzp;)V

    .line 192
    :goto_13
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzg()Lcom/google/android/gms/measurement/internal/zzaf;

    move-result-object v0

    iget-object v3, v2, Lcom/google/android/gms/measurement/internal/zzp;->zza:Ljava/lang/String;

    sget-object v5, Lcom/google/android/gms/measurement/internal/zzdw;->zzT:Lcom/google/android/gms/measurement/internal/zzdv;

    invoke-virtual {v0, v3, v5}, Lcom/google/android/gms/measurement/internal/zzaf;->zzs(Ljava/lang/String;Lcom/google/android/gms/measurement/internal/zzdv;)Z

    move-result v0

    if-nez v0, :cond_27

    new-instance v0, Landroid/os/Bundle;

    .line 193
    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    const-wide/16 v5, 0x1

    .line 194
    invoke-virtual {v0, v4, v5, v6}, Landroid/os/Bundle;->putLong(Ljava/lang/String;J)V

    const-string v3, "_fr"

    .line 195
    invoke-virtual {v0, v3, v5, v6}, Landroid/os/Bundle;->putLong(Ljava/lang/String;J)V

    new-instance v3, Lcom/google/android/gms/measurement/internal/zzat;

    const-string v14, "_e"

    new-instance v15, Lcom/google/android/gms/measurement/internal/zzar;

    .line 196
    invoke-direct {v15, v0}, Lcom/google/android/gms/measurement/internal/zzar;-><init>(Landroid/os/Bundle;)V

    const-string v16, "auto"

    move-object v13, v3

    move-wide/from16 v17, v11

    invoke-direct/range {v13 .. v18}, Lcom/google/android/gms/measurement/internal/zzat;-><init>(Ljava/lang/String;Lcom/google/android/gms/measurement/internal/zzar;Ljava/lang/String;J)V

    .line 197
    invoke-virtual {v1, v3, v2}, Lcom/google/android/gms/measurement/internal/zzkn;->zzF(Lcom/google/android/gms/measurement/internal/zzat;Lcom/google/android/gms/measurement/internal/zzp;)V

    goto :goto_14

    .line 198
    :cond_26
    iget-boolean v0, v2, Lcom/google/android/gms/measurement/internal/zzp;->zzi:Z

    if-eqz v0, :cond_27

    new-instance v0, Landroid/os/Bundle;

    .line 199
    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 200
    new-instance v3, Lcom/google/android/gms/measurement/internal/zzat;

    new-instance v15, Lcom/google/android/gms/measurement/internal/zzar;

    invoke-direct {v15, v0}, Lcom/google/android/gms/measurement/internal/zzar;-><init>(Landroid/os/Bundle;)V

    const-string v14, "_cd"

    const-string v16, "auto"

    move-object v13, v3

    move-wide/from16 v17, v11

    invoke-direct/range {v13 .. v18}, Lcom/google/android/gms/measurement/internal/zzat;-><init>(Ljava/lang/String;Lcom/google/android/gms/measurement/internal/zzar;Ljava/lang/String;J)V

    .line 201
    invoke-virtual {v1, v3, v2}, Lcom/google/android/gms/measurement/internal/zzkn;->zzF(Lcom/google/android/gms/measurement/internal/zzat;Lcom/google/android/gms/measurement/internal/zzp;)V

    .line 197
    :cond_27
    :goto_14
    iget-object v0, v1, Lcom/google/android/gms/measurement/internal/zzkn;->zze:Lcom/google/android/gms/measurement/internal/zzaj;

    .line 202
    invoke-static {v0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzak(Lcom/google/android/gms/measurement/internal/zzkd;)Lcom/google/android/gms/measurement/internal/zzkd;

    .line 203
    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzaj;->zzC()V
    :try_end_b
    .catchall {:try_start_b .. :try_end_b} :catchall_0

    iget-object v0, v1, Lcom/google/android/gms/measurement/internal/zzkn;->zze:Lcom/google/android/gms/measurement/internal/zzaj;

    .line 204
    invoke-static {v0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzak(Lcom/google/android/gms/measurement/internal/zzkd;)Lcom/google/android/gms/measurement/internal/zzkd;

    .line 205
    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzaj;->zzx()V

    return-void

    :catchall_0
    move-exception v0

    .line 38
    iget-object v2, v1, Lcom/google/android/gms/measurement/internal/zzkn;->zze:Lcom/google/android/gms/measurement/internal/zzaj;

    .line 204
    invoke-static {v2}, Lcom/google/android/gms/measurement/internal/zzkn;->zzak(Lcom/google/android/gms/measurement/internal/zzkd;)Lcom/google/android/gms/measurement/internal/zzkd;

    .line 205
    invoke-virtual {v2}, Lcom/google/android/gms/measurement/internal/zzaj;->zzx()V

    .line 206
    throw v0

    :cond_28
    return-void
.end method

.method final zzL()V
    .locals 1

    iget v0, p0, Lcom/google/android/gms/measurement/internal/zzkn;->zzr:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/google/android/gms/measurement/internal/zzkn;->zzr:I

    return-void
.end method

.method final zzM(Lcom/google/android/gms/measurement/internal/zzab;)V
    .locals 1

    iget-object v0, p1, Lcom/google/android/gms/measurement/internal/zzab;->zza:Ljava/lang/String;

    .line 1
    invoke-static {v0}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-direct {p0, v0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzaa(Ljava/lang/String;)Lcom/google/android/gms/measurement/internal/zzp;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 2
    invoke-virtual {p0, p1, v0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzN(Lcom/google/android/gms/measurement/internal/zzab;Lcom/google/android/gms/measurement/internal/zzp;)V

    :cond_0
    return-void
.end method

.method final zzN(Lcom/google/android/gms/measurement/internal/zzab;Lcom/google/android/gms/measurement/internal/zzp;)V
    .locals 10

    .line 1
    invoke-static {p1}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v0, p1, Lcom/google/android/gms/measurement/internal/zzab;->zza:Ljava/lang/String;

    .line 2
    invoke-static {v0}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotEmpty(Ljava/lang/String;)Ljava/lang/String;

    iget-object v0, p1, Lcom/google/android/gms/measurement/internal/zzab;->zzc:Lcom/google/android/gms/measurement/internal/zzkq;

    .line 3
    invoke-static {v0}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v0, p1, Lcom/google/android/gms/measurement/internal/zzab;->zzc:Lcom/google/android/gms/measurement/internal/zzkq;

    .line 4
    iget-object v0, v0, Lcom/google/android/gms/measurement/internal/zzkq;->zzb:Ljava/lang/String;

    invoke-static {v0}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotEmpty(Ljava/lang/String;)Ljava/lang/String;

    .line 5
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzaz()Lcom/google/android/gms/measurement/internal/zzfp;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzgl;->zzg()V

    .line 6
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzB()V

    .line 7
    invoke-direct {p0, p2}, Lcom/google/android/gms/measurement/internal/zzkn;->zzag(Lcom/google/android/gms/measurement/internal/zzp;)Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    .line 8
    :cond_0
    iget-boolean v0, p2, Lcom/google/android/gms/measurement/internal/zzp;->zzh:Z

    if-eqz v0, :cond_5

    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzkn;->zze:Lcom/google/android/gms/measurement/internal/zzaj;

    .line 9
    invoke-static {v0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzak(Lcom/google/android/gms/measurement/internal/zzkd;)Lcom/google/android/gms/measurement/internal/zzkd;

    .line 10
    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzaj;->zzw()V

    .line 11
    :try_start_0
    invoke-virtual {p0, p2}, Lcom/google/android/gms/measurement/internal/zzkn;->zzd(Lcom/google/android/gms/measurement/internal/zzp;)Lcom/google/android/gms/measurement/internal/zzg;

    iget-object v0, p1, Lcom/google/android/gms/measurement/internal/zzab;->zza:Ljava/lang/String;

    .line 12
    invoke-static {v0}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    move-object v2, v0

    check-cast v2, Ljava/lang/String;

    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzkn;->zze:Lcom/google/android/gms/measurement/internal/zzaj;

    .line 13
    invoke-static {v0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzak(Lcom/google/android/gms/measurement/internal/zzkd;)Lcom/google/android/gms/measurement/internal/zzkd;

    iget-object v1, p1, Lcom/google/android/gms/measurement/internal/zzab;->zzc:Lcom/google/android/gms/measurement/internal/zzkq;

    .line 14
    iget-object v1, v1, Lcom/google/android/gms/measurement/internal/zzkq;->zzb:Ljava/lang/String;

    invoke-virtual {v0, v2, v1}, Lcom/google/android/gms/measurement/internal/zzaj;->zzk(Ljava/lang/String;Ljava/lang/String;)Lcom/google/android/gms/measurement/internal/zzab;

    move-result-object v0

    if-eqz v0, :cond_3

    .line 15
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzay()Lcom/google/android/gms/measurement/internal/zzei;

    move-result-object v1

    .line 16
    invoke-virtual {v1}, Lcom/google/android/gms/measurement/internal/zzei;->zzc()Lcom/google/android/gms/measurement/internal/zzeg;

    move-result-object v1

    const-string v3, "Removing conditional user property"

    iget-object v4, p1, Lcom/google/android/gms/measurement/internal/zzab;->zza:Ljava/lang/String;

    iget-object v5, p0, Lcom/google/android/gms/measurement/internal/zzkn;->zzn:Lcom/google/android/gms/measurement/internal/zzfs;

    .line 17
    invoke-virtual {v5}, Lcom/google/android/gms/measurement/internal/zzfs;->zzj()Lcom/google/android/gms/measurement/internal/zzed;

    move-result-object v5

    iget-object v6, p1, Lcom/google/android/gms/measurement/internal/zzab;->zzc:Lcom/google/android/gms/measurement/internal/zzkq;

    .line 18
    iget-object v6, v6, Lcom/google/android/gms/measurement/internal/zzkq;->zzb:Ljava/lang/String;

    invoke-virtual {v5, v6}, Lcom/google/android/gms/measurement/internal/zzed;->zze(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 19
    invoke-virtual {v1, v3, v4, v5}, Lcom/google/android/gms/measurement/internal/zzeg;->zzc(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    iget-object v1, p0, Lcom/google/android/gms/measurement/internal/zzkn;->zze:Lcom/google/android/gms/measurement/internal/zzaj;

    .line 20
    invoke-static {v1}, Lcom/google/android/gms/measurement/internal/zzkn;->zzak(Lcom/google/android/gms/measurement/internal/zzkd;)Lcom/google/android/gms/measurement/internal/zzkd;

    iget-object v3, p1, Lcom/google/android/gms/measurement/internal/zzab;->zzc:Lcom/google/android/gms/measurement/internal/zzkq;

    .line 21
    iget-object v3, v3, Lcom/google/android/gms/measurement/internal/zzkq;->zzb:Ljava/lang/String;

    invoke-virtual {v1, v2, v3}, Lcom/google/android/gms/measurement/internal/zzaj;->zza(Ljava/lang/String;Ljava/lang/String;)I

    iget-boolean v1, v0, Lcom/google/android/gms/measurement/internal/zzab;->zze:Z

    if-eqz v1, :cond_1

    iget-object v1, p0, Lcom/google/android/gms/measurement/internal/zzkn;->zze:Lcom/google/android/gms/measurement/internal/zzaj;

    .line 22
    invoke-static {v1}, Lcom/google/android/gms/measurement/internal/zzkn;->zzak(Lcom/google/android/gms/measurement/internal/zzkd;)Lcom/google/android/gms/measurement/internal/zzkd;

    iget-object v3, p1, Lcom/google/android/gms/measurement/internal/zzab;->zzc:Lcom/google/android/gms/measurement/internal/zzkq;

    .line 23
    iget-object v3, v3, Lcom/google/android/gms/measurement/internal/zzkq;->zzb:Ljava/lang/String;

    invoke-virtual {v1, v2, v3}, Lcom/google/android/gms/measurement/internal/zzaj;->zzA(Ljava/lang/String;Ljava/lang/String;)V

    :cond_1
    iget-object v1, p1, Lcom/google/android/gms/measurement/internal/zzab;->zzk:Lcom/google/android/gms/measurement/internal/zzat;

    if-eqz v1, :cond_4

    iget-object v1, v1, Lcom/google/android/gms/measurement/internal/zzat;->zzb:Lcom/google/android/gms/measurement/internal/zzar;

    if-eqz v1, :cond_2

    .line 24
    invoke-virtual {v1}, Lcom/google/android/gms/measurement/internal/zzar;->zzc()Landroid/os/Bundle;

    move-result-object v1

    goto :goto_0

    :cond_2
    const/4 v1, 0x0

    :goto_0
    move-object v4, v1

    .line 25
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzv()Lcom/google/android/gms/measurement/internal/zzku;

    move-result-object v1

    iget-object v3, p1, Lcom/google/android/gms/measurement/internal/zzab;->zzk:Lcom/google/android/gms/measurement/internal/zzat;

    .line 26
    invoke-static {v3}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/google/android/gms/measurement/internal/zzat;

    iget-object v3, v3, Lcom/google/android/gms/measurement/internal/zzat;->zza:Ljava/lang/String;

    iget-object v5, v0, Lcom/google/android/gms/measurement/internal/zzab;->zzb:Ljava/lang/String;

    iget-object p1, p1, Lcom/google/android/gms/measurement/internal/zzab;->zzk:Lcom/google/android/gms/measurement/internal/zzat;

    iget-wide v6, p1, Lcom/google/android/gms/measurement/internal/zzat;->zzd:J

    const/4 v8, 0x1

    const/4 v9, 0x1

    .line 27
    invoke-virtual/range {v1 .. v9}, Lcom/google/android/gms/measurement/internal/zzku;->zzz(Ljava/lang/String;Ljava/lang/String;Landroid/os/Bundle;Ljava/lang/String;JZZ)Lcom/google/android/gms/measurement/internal/zzat;

    move-result-object p1

    .line 28
    invoke-static {p1}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/google/android/gms/measurement/internal/zzat;

    invoke-virtual {p0, p1, p2}, Lcom/google/android/gms/measurement/internal/zzkn;->zzW(Lcom/google/android/gms/measurement/internal/zzat;Lcom/google/android/gms/measurement/internal/zzp;)V

    goto :goto_1

    .line 29
    :cond_3
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzay()Lcom/google/android/gms/measurement/internal/zzei;

    move-result-object p2

    .line 30
    invoke-virtual {p2}, Lcom/google/android/gms/measurement/internal/zzei;->zzk()Lcom/google/android/gms/measurement/internal/zzeg;

    move-result-object p2

    const-string v0, "Conditional user property doesn\'t exist"

    iget-object v1, p1, Lcom/google/android/gms/measurement/internal/zzab;->zza:Ljava/lang/String;

    invoke-static {v1}, Lcom/google/android/gms/measurement/internal/zzei;->zzn(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    iget-object v2, p0, Lcom/google/android/gms/measurement/internal/zzkn;->zzn:Lcom/google/android/gms/measurement/internal/zzfs;

    .line 31
    invoke-virtual {v2}, Lcom/google/android/gms/measurement/internal/zzfs;->zzj()Lcom/google/android/gms/measurement/internal/zzed;

    move-result-object v2

    iget-object p1, p1, Lcom/google/android/gms/measurement/internal/zzab;->zzc:Lcom/google/android/gms/measurement/internal/zzkq;

    .line 32
    iget-object p1, p1, Lcom/google/android/gms/measurement/internal/zzkq;->zzb:Ljava/lang/String;

    invoke-virtual {v2, p1}, Lcom/google/android/gms/measurement/internal/zzed;->zze(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 33
    invoke-virtual {p2, v0, v1, p1}, Lcom/google/android/gms/measurement/internal/zzeg;->zzc(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 28
    :cond_4
    :goto_1
    iget-object p1, p0, Lcom/google/android/gms/measurement/internal/zzkn;->zze:Lcom/google/android/gms/measurement/internal/zzaj;

    .line 34
    invoke-static {p1}, Lcom/google/android/gms/measurement/internal/zzkn;->zzak(Lcom/google/android/gms/measurement/internal/zzkd;)Lcom/google/android/gms/measurement/internal/zzkd;

    .line 35
    invoke-virtual {p1}, Lcom/google/android/gms/measurement/internal/zzaj;->zzC()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    iget-object p1, p0, Lcom/google/android/gms/measurement/internal/zzkn;->zze:Lcom/google/android/gms/measurement/internal/zzaj;

    .line 36
    invoke-static {p1}, Lcom/google/android/gms/measurement/internal/zzkn;->zzak(Lcom/google/android/gms/measurement/internal/zzkd;)Lcom/google/android/gms/measurement/internal/zzkd;

    .line 37
    invoke-virtual {p1}, Lcom/google/android/gms/measurement/internal/zzaj;->zzx()V

    return-void

    :catchall_0
    move-exception p1

    .line 33
    iget-object p2, p0, Lcom/google/android/gms/measurement/internal/zzkn;->zze:Lcom/google/android/gms/measurement/internal/zzaj;

    .line 36
    invoke-static {p2}, Lcom/google/android/gms/measurement/internal/zzkn;->zzak(Lcom/google/android/gms/measurement/internal/zzkd;)Lcom/google/android/gms/measurement/internal/zzkd;

    .line 37
    invoke-virtual {p2}, Lcom/google/android/gms/measurement/internal/zzaj;->zzx()V

    .line 38
    throw p1

    .line 39
    :cond_5
    invoke-virtual {p0, p2}, Lcom/google/android/gms/measurement/internal/zzkn;->zzd(Lcom/google/android/gms/measurement/internal/zzp;)Lcom/google/android/gms/measurement/internal/zzg;

    return-void
.end method

.method final zzO(Lcom/google/android/gms/measurement/internal/zzkq;Lcom/google/android/gms/measurement/internal/zzp;)V
    .locals 7

    .line 1
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzaz()Lcom/google/android/gms/measurement/internal/zzfp;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzgl;->zzg()V

    .line 2
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzB()V

    .line 3
    invoke-direct {p0, p2}, Lcom/google/android/gms/measurement/internal/zzkn;->zzag(Lcom/google/android/gms/measurement/internal/zzp;)Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    .line 4
    :cond_0
    iget-boolean v0, p2, Lcom/google/android/gms/measurement/internal/zzp;->zzh:Z

    if-nez v0, :cond_1

    .line 5
    invoke-virtual {p0, p2}, Lcom/google/android/gms/measurement/internal/zzkn;->zzd(Lcom/google/android/gms/measurement/internal/zzp;)Lcom/google/android/gms/measurement/internal/zzg;

    return-void

    .line 6
    :cond_1
    iget-object v0, p1, Lcom/google/android/gms/measurement/internal/zzkq;->zzb:Ljava/lang/String;

    const-string v1, "_npa"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    iget-object v0, p2, Lcom/google/android/gms/measurement/internal/zzp;->zzr:Ljava/lang/Boolean;

    if-eqz v0, :cond_3

    .line 29
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzay()Lcom/google/android/gms/measurement/internal/zzei;

    move-result-object p1

    invoke-virtual {p1}, Lcom/google/android/gms/measurement/internal/zzei;->zzc()Lcom/google/android/gms/measurement/internal/zzeg;

    move-result-object p1

    const-string v0, "Falling back to manifest metadata value for ad personalization"

    invoke-virtual {p1, v0}, Lcom/google/android/gms/measurement/internal/zzeg;->zza(Ljava/lang/String;)V

    new-instance p1, Lcom/google/android/gms/measurement/internal/zzkq;

    .line 30
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzav()Lcom/google/android/gms/common/util/Clock;

    move-result-object v0

    invoke-interface {v0}, Lcom/google/android/gms/common/util/Clock;->currentTimeMillis()J

    move-result-wide v3

    const/4 v0, 0x1

    .line 31
    iget-object v1, p2, Lcom/google/android/gms/measurement/internal/zzp;->zzr:Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    if-eq v0, v1, :cond_2

    const-wide/16 v0, 0x0

    goto :goto_0

    :cond_2
    const-wide/16 v0, 0x1

    :goto_0
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v5

    const-string v2, "_npa"

    const-string v6, "auto"

    move-object v1, p1

    invoke-direct/range {v1 .. v6}, Lcom/google/android/gms/measurement/internal/zzkq;-><init>(Ljava/lang/String;JLjava/lang/Object;Ljava/lang/String;)V

    .line 32
    invoke-virtual {p0, p1, p2}, Lcom/google/android/gms/measurement/internal/zzkn;->zzU(Lcom/google/android/gms/measurement/internal/zzkq;Lcom/google/android/gms/measurement/internal/zzp;)V

    return-void

    .line 7
    :cond_3
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzay()Lcom/google/android/gms/measurement/internal/zzei;

    move-result-object v0

    .line 8
    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzei;->zzc()Lcom/google/android/gms/measurement/internal/zzeg;

    move-result-object v0

    iget-object v1, p0, Lcom/google/android/gms/measurement/internal/zzkn;->zzn:Lcom/google/android/gms/measurement/internal/zzfs;

    .line 9
    invoke-virtual {v1}, Lcom/google/android/gms/measurement/internal/zzfs;->zzj()Lcom/google/android/gms/measurement/internal/zzed;

    move-result-object v1

    .line 10
    iget-object v2, p1, Lcom/google/android/gms/measurement/internal/zzkq;->zzb:Ljava/lang/String;

    invoke-virtual {v1, v2}, Lcom/google/android/gms/measurement/internal/zzed;->zze(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const-string v2, "Removing user property"

    .line 11
    invoke-virtual {v0, v2, v1}, Lcom/google/android/gms/measurement/internal/zzeg;->zzb(Ljava/lang/String;Ljava/lang/Object;)V

    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzkn;->zze:Lcom/google/android/gms/measurement/internal/zzaj;

    .line 12
    invoke-static {v0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzak(Lcom/google/android/gms/measurement/internal/zzkd;)Lcom/google/android/gms/measurement/internal/zzkd;

    .line 13
    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzaj;->zzw()V

    .line 14
    :try_start_0
    invoke-virtual {p0, p2}, Lcom/google/android/gms/measurement/internal/zzkn;->zzd(Lcom/google/android/gms/measurement/internal/zzp;)Lcom/google/android/gms/measurement/internal/zzg;

    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzkn;->zze:Lcom/google/android/gms/measurement/internal/zzaj;

    .line 15
    invoke-static {v0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzak(Lcom/google/android/gms/measurement/internal/zzkd;)Lcom/google/android/gms/measurement/internal/zzkd;

    .line 16
    iget-object p2, p2, Lcom/google/android/gms/measurement/internal/zzp;->zza:Ljava/lang/String;

    .line 17
    invoke-static {p2}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Ljava/lang/String;

    iget-object v1, p1, Lcom/google/android/gms/measurement/internal/zzkq;->zzb:Ljava/lang/String;

    .line 18
    invoke-virtual {v0, p2, v1}, Lcom/google/android/gms/measurement/internal/zzaj;->zzA(Ljava/lang/String;Ljava/lang/String;)V

    iget-object p2, p0, Lcom/google/android/gms/measurement/internal/zzkn;->zze:Lcom/google/android/gms/measurement/internal/zzaj;

    .line 19
    invoke-static {p2}, Lcom/google/android/gms/measurement/internal/zzkn;->zzak(Lcom/google/android/gms/measurement/internal/zzkd;)Lcom/google/android/gms/measurement/internal/zzkd;

    .line 20
    invoke-virtual {p2}, Lcom/google/android/gms/measurement/internal/zzaj;->zzC()V

    .line 21
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzay()Lcom/google/android/gms/measurement/internal/zzei;

    move-result-object p2

    .line 22
    invoke-virtual {p2}, Lcom/google/android/gms/measurement/internal/zzei;->zzc()Lcom/google/android/gms/measurement/internal/zzeg;

    move-result-object p2

    const-string v0, "User property removed"

    iget-object v1, p0, Lcom/google/android/gms/measurement/internal/zzkn;->zzn:Lcom/google/android/gms/measurement/internal/zzfs;

    .line 23
    invoke-virtual {v1}, Lcom/google/android/gms/measurement/internal/zzfs;->zzj()Lcom/google/android/gms/measurement/internal/zzed;

    move-result-object v1

    .line 24
    iget-object p1, p1, Lcom/google/android/gms/measurement/internal/zzkq;->zzb:Ljava/lang/String;

    invoke-virtual {v1, p1}, Lcom/google/android/gms/measurement/internal/zzed;->zze(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 25
    invoke-virtual {p2, v0, p1}, Lcom/google/android/gms/measurement/internal/zzeg;->zzb(Ljava/lang/String;Ljava/lang/Object;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 28
    iget-object p1, p0, Lcom/google/android/gms/measurement/internal/zzkn;->zze:Lcom/google/android/gms/measurement/internal/zzaj;

    .line 26
    invoke-static {p1}, Lcom/google/android/gms/measurement/internal/zzkn;->zzak(Lcom/google/android/gms/measurement/internal/zzkd;)Lcom/google/android/gms/measurement/internal/zzkd;

    .line 27
    invoke-virtual {p1}, Lcom/google/android/gms/measurement/internal/zzaj;->zzx()V

    return-void

    :catchall_0
    move-exception p1

    .line 25
    iget-object p2, p0, Lcom/google/android/gms/measurement/internal/zzkn;->zze:Lcom/google/android/gms/measurement/internal/zzaj;

    .line 26
    invoke-static {p2}, Lcom/google/android/gms/measurement/internal/zzkn;->zzak(Lcom/google/android/gms/measurement/internal/zzkd;)Lcom/google/android/gms/measurement/internal/zzkd;

    .line 27
    invoke-virtual {p2}, Lcom/google/android/gms/measurement/internal/zzaj;->zzx()V

    .line 28
    throw p1
.end method

.method final zzP(Lcom/google/android/gms/measurement/internal/zzp;)V
    .locals 7

    const-string v0, "app_id=?"

    iget-object v1, p0, Lcom/google/android/gms/measurement/internal/zzkn;->zzy:Ljava/util/List;

    if-eqz v1, :cond_0

    new-instance v1, Ljava/util/ArrayList;

    .line 1
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    iput-object v1, p0, Lcom/google/android/gms/measurement/internal/zzkn;->zzz:Ljava/util/List;

    iget-object v2, p0, Lcom/google/android/gms/measurement/internal/zzkn;->zzy:Ljava/util/List;

    .line 2
    invoke-interface {v1, v2}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    :cond_0
    iget-object v1, p0, Lcom/google/android/gms/measurement/internal/zzkn;->zze:Lcom/google/android/gms/measurement/internal/zzaj;

    .line 3
    invoke-static {v1}, Lcom/google/android/gms/measurement/internal/zzkn;->zzak(Lcom/google/android/gms/measurement/internal/zzkd;)Lcom/google/android/gms/measurement/internal/zzkd;

    .line 4
    iget-object v2, p1, Lcom/google/android/gms/measurement/internal/zzp;->zza:Ljava/lang/String;

    invoke-static {v2}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 5
    invoke-static {v2}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotEmpty(Ljava/lang/String;)Ljava/lang/String;

    .line 6
    invoke-virtual {v1}, Lcom/google/android/gms/measurement/internal/zzgl;->zzg()V

    .line 7
    invoke-virtual {v1}, Lcom/google/android/gms/measurement/internal/zzkd;->zzY()V

    .line 8
    :try_start_0
    invoke-virtual {v1}, Lcom/google/android/gms/measurement/internal/zzaj;->zzh()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v3

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/String;

    const/4 v5, 0x0

    aput-object v2, v4, v5

    const-string v5, "apps"

    .line 9
    invoke-virtual {v3, v5, v0, v4}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v5

    const-string v6, "events"

    .line 10
    invoke-virtual {v3, v6, v0, v4}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v6

    add-int/2addr v5, v6

    const-string/jumbo v6, "user_attributes"

    .line 11
    invoke-virtual {v3, v6, v0, v4}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v6

    add-int/2addr v5, v6

    const-string v6, "conditional_properties"

    .line 12
    invoke-virtual {v3, v6, v0, v4}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v6

    add-int/2addr v5, v6

    const-string v6, "raw_events"

    .line 13
    invoke-virtual {v3, v6, v0, v4}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v6

    add-int/2addr v5, v6

    const-string v6, "raw_events_metadata"

    .line 14
    invoke-virtual {v3, v6, v0, v4}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v6

    add-int/2addr v5, v6

    const-string v6, "queue"

    .line 15
    invoke-virtual {v3, v6, v0, v4}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v6

    add-int/2addr v5, v6

    const-string v6, "audience_filter_values"

    .line 16
    invoke-virtual {v3, v6, v0, v4}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v6

    add-int/2addr v5, v6

    const-string v6, "main_event_params"

    .line 17
    invoke-virtual {v3, v6, v0, v4}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v6

    add-int/2addr v5, v6

    const-string v6, "default_event_params"

    .line 18
    invoke-virtual {v3, v6, v0, v4}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v0

    add-int/2addr v5, v0

    if-lez v5, :cond_1

    iget-object v0, v1, Lcom/google/android/gms/measurement/internal/zzgl;->zzs:Lcom/google/android/gms/measurement/internal/zzfs;

    .line 19
    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzfs;->zzay()Lcom/google/android/gms/measurement/internal/zzei;

    move-result-object v0

    .line 20
    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzei;->zzj()Lcom/google/android/gms/measurement/internal/zzeg;

    move-result-object v0

    const-string v3, "Reset analytics data. app, records"

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v0, v3, v2, v4}, Lcom/google/android/gms/measurement/internal/zzeg;->zzc(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V
    :try_end_0
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    .line 25
    iget-object v1, v1, Lcom/google/android/gms/measurement/internal/zzgl;->zzs:Lcom/google/android/gms/measurement/internal/zzfs;

    .line 21
    invoke-virtual {v1}, Lcom/google/android/gms/measurement/internal/zzfs;->zzay()Lcom/google/android/gms/measurement/internal/zzei;

    move-result-object v1

    .line 22
    invoke-virtual {v1}, Lcom/google/android/gms/measurement/internal/zzei;->zzd()Lcom/google/android/gms/measurement/internal/zzeg;

    move-result-object v1

    invoke-static {v2}, Lcom/google/android/gms/measurement/internal/zzei;->zzn(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    const-string v3, "Error resetting analytics data. appId, error"

    .line 23
    invoke-virtual {v1, v3, v2, v0}, Lcom/google/android/gms/measurement/internal/zzeg;->zzc(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 24
    :cond_1
    :goto_0
    iget-boolean v0, p1, Lcom/google/android/gms/measurement/internal/zzp;->zzh:Z

    if-eqz v0, :cond_2

    .line 25
    invoke-virtual {p0, p1}, Lcom/google/android/gms/measurement/internal/zzkn;->zzK(Lcom/google/android/gms/measurement/internal/zzp;)V

    :cond_2
    return-void
.end method

.method protected final zzQ()V
    .locals 5

    .line 1
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzaz()Lcom/google/android/gms/measurement/internal/zzfp;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzgl;->zzg()V

    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzkn;->zze:Lcom/google/android/gms/measurement/internal/zzaj;

    .line 2
    invoke-static {v0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzak(Lcom/google/android/gms/measurement/internal/zzkd;)Lcom/google/android/gms/measurement/internal/zzkd;

    .line 3
    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzaj;->zzz()V

    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzkn;->zzk:Lcom/google/android/gms/measurement/internal/zzjk;

    .line 4
    iget-object v0, v0, Lcom/google/android/gms/measurement/internal/zzjk;->zzc:Lcom/google/android/gms/measurement/internal/zzet;

    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzet;->zza()J

    move-result-wide v0

    const-wide/16 v2, 0x0

    cmp-long v4, v0, v2

    if-nez v4, :cond_0

    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzkn;->zzk:Lcom/google/android/gms/measurement/internal/zzjk;

    .line 5
    iget-object v0, v0, Lcom/google/android/gms/measurement/internal/zzjk;->zzc:Lcom/google/android/gms/measurement/internal/zzet;

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzav()Lcom/google/android/gms/common/util/Clock;

    move-result-object v1

    invoke-interface {v1}, Lcom/google/android/gms/common/util/Clock;->currentTimeMillis()J

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Lcom/google/android/gms/measurement/internal/zzet;->zzb(J)V

    .line 6
    :cond_0
    invoke-direct {p0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzaf()V

    return-void
.end method

.method final zzR(Lcom/google/android/gms/measurement/internal/zzab;)V
    .locals 1

    iget-object v0, p1, Lcom/google/android/gms/measurement/internal/zzab;->zza:Ljava/lang/String;

    .line 1
    invoke-static {v0}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-direct {p0, v0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzaa(Ljava/lang/String;)Lcom/google/android/gms/measurement/internal/zzp;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 2
    invoke-virtual {p0, p1, v0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzS(Lcom/google/android/gms/measurement/internal/zzab;Lcom/google/android/gms/measurement/internal/zzp;)V

    :cond_0
    return-void
.end method

.method final zzS(Lcom/google/android/gms/measurement/internal/zzab;Lcom/google/android/gms/measurement/internal/zzp;)V
    .locals 10

    .line 1
    invoke-static {p1}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v0, p1, Lcom/google/android/gms/measurement/internal/zzab;->zza:Ljava/lang/String;

    .line 2
    invoke-static {v0}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotEmpty(Ljava/lang/String;)Ljava/lang/String;

    iget-object v0, p1, Lcom/google/android/gms/measurement/internal/zzab;->zzb:Ljava/lang/String;

    .line 3
    invoke-static {v0}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v0, p1, Lcom/google/android/gms/measurement/internal/zzab;->zzc:Lcom/google/android/gms/measurement/internal/zzkq;

    .line 4
    invoke-static {v0}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v0, p1, Lcom/google/android/gms/measurement/internal/zzab;->zzc:Lcom/google/android/gms/measurement/internal/zzkq;

    .line 5
    iget-object v0, v0, Lcom/google/android/gms/measurement/internal/zzkq;->zzb:Ljava/lang/String;

    invoke-static {v0}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotEmpty(Ljava/lang/String;)Ljava/lang/String;

    .line 6
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzaz()Lcom/google/android/gms/measurement/internal/zzfp;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzgl;->zzg()V

    .line 7
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzB()V

    .line 8
    invoke-direct {p0, p2}, Lcom/google/android/gms/measurement/internal/zzkn;->zzag(Lcom/google/android/gms/measurement/internal/zzp;)Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    .line 9
    :cond_0
    iget-boolean v0, p2, Lcom/google/android/gms/measurement/internal/zzp;->zzh:Z

    if-nez v0, :cond_1

    .line 10
    invoke-virtual {p0, p2}, Lcom/google/android/gms/measurement/internal/zzkn;->zzd(Lcom/google/android/gms/measurement/internal/zzp;)Lcom/google/android/gms/measurement/internal/zzg;

    return-void

    :cond_1
    new-instance v0, Lcom/google/android/gms/measurement/internal/zzab;

    .line 11
    invoke-direct {v0, p1}, Lcom/google/android/gms/measurement/internal/zzab;-><init>(Lcom/google/android/gms/measurement/internal/zzab;)V

    const/4 p1, 0x0

    iput-boolean p1, v0, Lcom/google/android/gms/measurement/internal/zzab;->zze:Z

    iget-object v1, p0, Lcom/google/android/gms/measurement/internal/zzkn;->zze:Lcom/google/android/gms/measurement/internal/zzaj;

    .line 12
    invoke-static {v1}, Lcom/google/android/gms/measurement/internal/zzkn;->zzak(Lcom/google/android/gms/measurement/internal/zzkd;)Lcom/google/android/gms/measurement/internal/zzkd;

    .line 13
    invoke-virtual {v1}, Lcom/google/android/gms/measurement/internal/zzaj;->zzw()V

    :try_start_0
    iget-object v1, p0, Lcom/google/android/gms/measurement/internal/zzkn;->zze:Lcom/google/android/gms/measurement/internal/zzaj;

    .line 14
    invoke-static {v1}, Lcom/google/android/gms/measurement/internal/zzkn;->zzak(Lcom/google/android/gms/measurement/internal/zzkd;)Lcom/google/android/gms/measurement/internal/zzkd;

    iget-object v2, v0, Lcom/google/android/gms/measurement/internal/zzab;->zza:Ljava/lang/String;

    .line 15
    invoke-static {v2}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    iget-object v3, v0, Lcom/google/android/gms/measurement/internal/zzab;->zzc:Lcom/google/android/gms/measurement/internal/zzkq;

    iget-object v3, v3, Lcom/google/android/gms/measurement/internal/zzkq;->zzb:Ljava/lang/String;

    .line 16
    invoke-virtual {v1, v2, v3}, Lcom/google/android/gms/measurement/internal/zzaj;->zzk(Ljava/lang/String;Ljava/lang/String;)Lcom/google/android/gms/measurement/internal/zzab;

    move-result-object v1

    if-eqz v1, :cond_2

    iget-object v2, v1, Lcom/google/android/gms/measurement/internal/zzab;->zzb:Ljava/lang/String;

    iget-object v3, v0, Lcom/google/android/gms/measurement/internal/zzab;->zzb:Ljava/lang/String;

    .line 17
    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_2

    .line 18
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzay()Lcom/google/android/gms/measurement/internal/zzei;

    move-result-object v2

    .line 19
    invoke-virtual {v2}, Lcom/google/android/gms/measurement/internal/zzei;->zzk()Lcom/google/android/gms/measurement/internal/zzeg;

    move-result-object v2

    const-string v3, "Updating a conditional user property with different origin. name, origin, origin (from DB)"

    iget-object v4, p0, Lcom/google/android/gms/measurement/internal/zzkn;->zzn:Lcom/google/android/gms/measurement/internal/zzfs;

    .line 20
    invoke-virtual {v4}, Lcom/google/android/gms/measurement/internal/zzfs;->zzj()Lcom/google/android/gms/measurement/internal/zzed;

    move-result-object v4

    iget-object v5, v0, Lcom/google/android/gms/measurement/internal/zzab;->zzc:Lcom/google/android/gms/measurement/internal/zzkq;

    .line 21
    iget-object v5, v5, Lcom/google/android/gms/measurement/internal/zzkq;->zzb:Ljava/lang/String;

    invoke-virtual {v4, v5}, Lcom/google/android/gms/measurement/internal/zzed;->zze(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    iget-object v5, v0, Lcom/google/android/gms/measurement/internal/zzab;->zzb:Ljava/lang/String;

    iget-object v6, v1, Lcom/google/android/gms/measurement/internal/zzab;->zzb:Ljava/lang/String;

    .line 22
    invoke-virtual {v2, v3, v4, v5, v6}, Lcom/google/android/gms/measurement/internal/zzeg;->zzd(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    :cond_2
    const/4 v2, 0x1

    if-eqz v1, :cond_3

    iget-boolean v3, v1, Lcom/google/android/gms/measurement/internal/zzab;->zze:Z

    if-eqz v3, :cond_3

    iget-object v3, v1, Lcom/google/android/gms/measurement/internal/zzab;->zzb:Ljava/lang/String;

    iput-object v3, v0, Lcom/google/android/gms/measurement/internal/zzab;->zzb:Ljava/lang/String;

    iget-wide v3, v1, Lcom/google/android/gms/measurement/internal/zzab;->zzd:J

    iput-wide v3, v0, Lcom/google/android/gms/measurement/internal/zzab;->zzd:J

    iget-wide v3, v1, Lcom/google/android/gms/measurement/internal/zzab;->zzh:J

    iput-wide v3, v0, Lcom/google/android/gms/measurement/internal/zzab;->zzh:J

    iget-object v3, v1, Lcom/google/android/gms/measurement/internal/zzab;->zzf:Ljava/lang/String;

    iput-object v3, v0, Lcom/google/android/gms/measurement/internal/zzab;->zzf:Ljava/lang/String;

    iget-object v3, v1, Lcom/google/android/gms/measurement/internal/zzab;->zzi:Lcom/google/android/gms/measurement/internal/zzat;

    iput-object v3, v0, Lcom/google/android/gms/measurement/internal/zzab;->zzi:Lcom/google/android/gms/measurement/internal/zzat;

    iput-boolean v2, v0, Lcom/google/android/gms/measurement/internal/zzab;->zze:Z

    new-instance v2, Lcom/google/android/gms/measurement/internal/zzkq;

    iget-object v3, v0, Lcom/google/android/gms/measurement/internal/zzab;->zzc:Lcom/google/android/gms/measurement/internal/zzkq;

    .line 26
    iget-object v5, v3, Lcom/google/android/gms/measurement/internal/zzkq;->zzb:Ljava/lang/String;

    iget-object v4, v1, Lcom/google/android/gms/measurement/internal/zzab;->zzc:Lcom/google/android/gms/measurement/internal/zzkq;

    iget-wide v6, v4, Lcom/google/android/gms/measurement/internal/zzkq;->zzc:J

    .line 27
    invoke-virtual {v3}, Lcom/google/android/gms/measurement/internal/zzkq;->zza()Ljava/lang/Object;

    move-result-object v8

    iget-object v1, v1, Lcom/google/android/gms/measurement/internal/zzab;->zzc:Lcom/google/android/gms/measurement/internal/zzkq;

    iget-object v9, v1, Lcom/google/android/gms/measurement/internal/zzkq;->zzf:Ljava/lang/String;

    move-object v4, v2

    invoke-direct/range {v4 .. v9}, Lcom/google/android/gms/measurement/internal/zzkq;-><init>(Ljava/lang/String;JLjava/lang/Object;Ljava/lang/String;)V

    iput-object v2, v0, Lcom/google/android/gms/measurement/internal/zzab;->zzc:Lcom/google/android/gms/measurement/internal/zzkq;

    goto :goto_0

    .line 41
    :cond_3
    iget-object v1, v0, Lcom/google/android/gms/measurement/internal/zzab;->zzf:Ljava/lang/String;

    .line 23
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_4

    new-instance p1, Lcom/google/android/gms/measurement/internal/zzkq;

    iget-object v1, v0, Lcom/google/android/gms/measurement/internal/zzab;->zzc:Lcom/google/android/gms/measurement/internal/zzkq;

    .line 24
    iget-object v4, v1, Lcom/google/android/gms/measurement/internal/zzkq;->zzb:Ljava/lang/String;

    iget-wide v5, v0, Lcom/google/android/gms/measurement/internal/zzab;->zzd:J

    .line 25
    invoke-virtual {v1}, Lcom/google/android/gms/measurement/internal/zzkq;->zza()Ljava/lang/Object;

    move-result-object v7

    iget-object v1, v0, Lcom/google/android/gms/measurement/internal/zzab;->zzc:Lcom/google/android/gms/measurement/internal/zzkq;

    iget-object v8, v1, Lcom/google/android/gms/measurement/internal/zzkq;->zzf:Ljava/lang/String;

    move-object v3, p1

    invoke-direct/range {v3 .. v8}, Lcom/google/android/gms/measurement/internal/zzkq;-><init>(Ljava/lang/String;JLjava/lang/Object;Ljava/lang/String;)V

    iput-object p1, v0, Lcom/google/android/gms/measurement/internal/zzab;->zzc:Lcom/google/android/gms/measurement/internal/zzkq;

    iput-boolean v2, v0, Lcom/google/android/gms/measurement/internal/zzab;->zze:Z

    const/4 p1, 0x1

    .line 27
    :cond_4
    :goto_0
    iget-boolean v1, v0, Lcom/google/android/gms/measurement/internal/zzab;->zze:Z

    if-eqz v1, :cond_6

    iget-object v1, v0, Lcom/google/android/gms/measurement/internal/zzab;->zzc:Lcom/google/android/gms/measurement/internal/zzkq;

    new-instance v9, Lcom/google/android/gms/measurement/internal/zzks;

    iget-object v2, v0, Lcom/google/android/gms/measurement/internal/zzab;->zza:Ljava/lang/String;

    .line 28
    invoke-static {v2}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    move-object v3, v2

    check-cast v3, Ljava/lang/String;

    iget-object v4, v0, Lcom/google/android/gms/measurement/internal/zzab;->zzb:Ljava/lang/String;

    iget-object v5, v1, Lcom/google/android/gms/measurement/internal/zzkq;->zzb:Ljava/lang/String;

    iget-wide v6, v1, Lcom/google/android/gms/measurement/internal/zzkq;->zzc:J

    .line 29
    invoke-virtual {v1}, Lcom/google/android/gms/measurement/internal/zzkq;->zza()Ljava/lang/Object;

    move-result-object v1

    invoke-static {v1}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    move-object v2, v9

    invoke-direct/range {v2 .. v8}, Lcom/google/android/gms/measurement/internal/zzks;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;JLjava/lang/Object;)V

    iget-object v1, p0, Lcom/google/android/gms/measurement/internal/zzkn;->zze:Lcom/google/android/gms/measurement/internal/zzaj;

    .line 30
    invoke-static {v1}, Lcom/google/android/gms/measurement/internal/zzkn;->zzak(Lcom/google/android/gms/measurement/internal/zzkd;)Lcom/google/android/gms/measurement/internal/zzkd;

    .line 31
    invoke-virtual {v1, v9}, Lcom/google/android/gms/measurement/internal/zzaj;->zzN(Lcom/google/android/gms/measurement/internal/zzks;)Z

    move-result v1

    if-eqz v1, :cond_5

    .line 32
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzay()Lcom/google/android/gms/measurement/internal/zzei;

    move-result-object v1

    .line 33
    invoke-virtual {v1}, Lcom/google/android/gms/measurement/internal/zzei;->zzc()Lcom/google/android/gms/measurement/internal/zzeg;

    move-result-object v1

    const-string v2, "User property updated immediately"

    iget-object v3, v0, Lcom/google/android/gms/measurement/internal/zzab;->zza:Ljava/lang/String;

    iget-object v4, p0, Lcom/google/android/gms/measurement/internal/zzkn;->zzn:Lcom/google/android/gms/measurement/internal/zzfs;

    .line 34
    invoke-virtual {v4}, Lcom/google/android/gms/measurement/internal/zzfs;->zzj()Lcom/google/android/gms/measurement/internal/zzed;

    move-result-object v4

    iget-object v5, v9, Lcom/google/android/gms/measurement/internal/zzks;->zzc:Ljava/lang/String;

    .line 35
    invoke-virtual {v4, v5}, Lcom/google/android/gms/measurement/internal/zzed;->zze(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    iget-object v5, v9, Lcom/google/android/gms/measurement/internal/zzks;->zze:Ljava/lang/Object;

    .line 36
    invoke-virtual {v1, v2, v3, v4, v5}, Lcom/google/android/gms/measurement/internal/zzeg;->zzd(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    goto :goto_1

    .line 37
    :cond_5
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzay()Lcom/google/android/gms/measurement/internal/zzei;

    move-result-object v1

    .line 38
    invoke-virtual {v1}, Lcom/google/android/gms/measurement/internal/zzei;->zzd()Lcom/google/android/gms/measurement/internal/zzeg;

    move-result-object v1

    const-string v2, "(2)Too many active user properties, ignoring"

    iget-object v3, v0, Lcom/google/android/gms/measurement/internal/zzab;->zza:Ljava/lang/String;

    invoke-static {v3}, Lcom/google/android/gms/measurement/internal/zzei;->zzn(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    iget-object v4, p0, Lcom/google/android/gms/measurement/internal/zzkn;->zzn:Lcom/google/android/gms/measurement/internal/zzfs;

    .line 39
    invoke-virtual {v4}, Lcom/google/android/gms/measurement/internal/zzfs;->zzj()Lcom/google/android/gms/measurement/internal/zzed;

    move-result-object v4

    iget-object v5, v9, Lcom/google/android/gms/measurement/internal/zzks;->zzc:Ljava/lang/String;

    .line 40
    invoke-virtual {v4, v5}, Lcom/google/android/gms/measurement/internal/zzed;->zze(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    iget-object v5, v9, Lcom/google/android/gms/measurement/internal/zzks;->zze:Ljava/lang/Object;

    .line 41
    invoke-virtual {v1, v2, v3, v4, v5}, Lcom/google/android/gms/measurement/internal/zzeg;->zzd(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    :goto_1
    if-eqz p1, :cond_6

    .line 36
    iget-object p1, v0, Lcom/google/android/gms/measurement/internal/zzab;->zzi:Lcom/google/android/gms/measurement/internal/zzat;

    if-eqz p1, :cond_6

    new-instance v1, Lcom/google/android/gms/measurement/internal/zzat;

    iget-wide v2, v0, Lcom/google/android/gms/measurement/internal/zzab;->zzd:J

    .line 42
    invoke-direct {v1, p1, v2, v3}, Lcom/google/android/gms/measurement/internal/zzat;-><init>(Lcom/google/android/gms/measurement/internal/zzat;J)V

    .line 43
    invoke-virtual {p0, v1, p2}, Lcom/google/android/gms/measurement/internal/zzkn;->zzW(Lcom/google/android/gms/measurement/internal/zzat;Lcom/google/android/gms/measurement/internal/zzp;)V

    :cond_6
    iget-object p1, p0, Lcom/google/android/gms/measurement/internal/zzkn;->zze:Lcom/google/android/gms/measurement/internal/zzaj;

    .line 44
    invoke-static {p1}, Lcom/google/android/gms/measurement/internal/zzkn;->zzak(Lcom/google/android/gms/measurement/internal/zzkd;)Lcom/google/android/gms/measurement/internal/zzkd;

    .line 45
    invoke-virtual {p1, v0}, Lcom/google/android/gms/measurement/internal/zzaj;->zzM(Lcom/google/android/gms/measurement/internal/zzab;)Z

    move-result p1

    if-eqz p1, :cond_7

    .line 46
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzay()Lcom/google/android/gms/measurement/internal/zzei;

    move-result-object p1

    .line 47
    invoke-virtual {p1}, Lcom/google/android/gms/measurement/internal/zzei;->zzc()Lcom/google/android/gms/measurement/internal/zzeg;

    move-result-object p1

    const-string p2, "Conditional property added"

    iget-object v1, v0, Lcom/google/android/gms/measurement/internal/zzab;->zza:Ljava/lang/String;

    iget-object v2, p0, Lcom/google/android/gms/measurement/internal/zzkn;->zzn:Lcom/google/android/gms/measurement/internal/zzfs;

    .line 48
    invoke-virtual {v2}, Lcom/google/android/gms/measurement/internal/zzfs;->zzj()Lcom/google/android/gms/measurement/internal/zzed;

    move-result-object v2

    iget-object v3, v0, Lcom/google/android/gms/measurement/internal/zzab;->zzc:Lcom/google/android/gms/measurement/internal/zzkq;

    .line 49
    iget-object v3, v3, Lcom/google/android/gms/measurement/internal/zzkq;->zzb:Ljava/lang/String;

    invoke-virtual {v2, v3}, Lcom/google/android/gms/measurement/internal/zzed;->zze(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iget-object v0, v0, Lcom/google/android/gms/measurement/internal/zzab;->zzc:Lcom/google/android/gms/measurement/internal/zzkq;

    .line 50
    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzkq;->zza()Ljava/lang/Object;

    move-result-object v0

    .line 51
    invoke-virtual {p1, p2, v1, v2, v0}, Lcom/google/android/gms/measurement/internal/zzeg;->zzd(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    goto :goto_2

    .line 52
    :cond_7
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzay()Lcom/google/android/gms/measurement/internal/zzei;

    move-result-object p1

    .line 53
    invoke-virtual {p1}, Lcom/google/android/gms/measurement/internal/zzei;->zzd()Lcom/google/android/gms/measurement/internal/zzeg;

    move-result-object p1

    const-string p2, "Too many conditional properties, ignoring"

    iget-object v1, v0, Lcom/google/android/gms/measurement/internal/zzab;->zza:Ljava/lang/String;

    invoke-static {v1}, Lcom/google/android/gms/measurement/internal/zzei;->zzn(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    iget-object v2, p0, Lcom/google/android/gms/measurement/internal/zzkn;->zzn:Lcom/google/android/gms/measurement/internal/zzfs;

    .line 54
    invoke-virtual {v2}, Lcom/google/android/gms/measurement/internal/zzfs;->zzj()Lcom/google/android/gms/measurement/internal/zzed;

    move-result-object v2

    iget-object v3, v0, Lcom/google/android/gms/measurement/internal/zzab;->zzc:Lcom/google/android/gms/measurement/internal/zzkq;

    .line 55
    iget-object v3, v3, Lcom/google/android/gms/measurement/internal/zzkq;->zzb:Ljava/lang/String;

    invoke-virtual {v2, v3}, Lcom/google/android/gms/measurement/internal/zzed;->zze(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iget-object v0, v0, Lcom/google/android/gms/measurement/internal/zzab;->zzc:Lcom/google/android/gms/measurement/internal/zzkq;

    .line 56
    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzkq;->zza()Ljava/lang/Object;

    move-result-object v0

    .line 57
    invoke-virtual {p1, p2, v1, v2, v0}, Lcom/google/android/gms/measurement/internal/zzeg;->zzd(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 51
    :goto_2
    iget-object p1, p0, Lcom/google/android/gms/measurement/internal/zzkn;->zze:Lcom/google/android/gms/measurement/internal/zzaj;

    .line 58
    invoke-static {p1}, Lcom/google/android/gms/measurement/internal/zzkn;->zzak(Lcom/google/android/gms/measurement/internal/zzkd;)Lcom/google/android/gms/measurement/internal/zzkd;

    .line 59
    invoke-virtual {p1}, Lcom/google/android/gms/measurement/internal/zzaj;->zzC()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    iget-object p1, p0, Lcom/google/android/gms/measurement/internal/zzkn;->zze:Lcom/google/android/gms/measurement/internal/zzaj;

    .line 60
    invoke-static {p1}, Lcom/google/android/gms/measurement/internal/zzkn;->zzak(Lcom/google/android/gms/measurement/internal/zzkd;)Lcom/google/android/gms/measurement/internal/zzkd;

    .line 61
    invoke-virtual {p1}, Lcom/google/android/gms/measurement/internal/zzaj;->zzx()V

    return-void

    :catchall_0
    move-exception p1

    .line 25
    iget-object p2, p0, Lcom/google/android/gms/measurement/internal/zzkn;->zze:Lcom/google/android/gms/measurement/internal/zzaj;

    .line 60
    invoke-static {p2}, Lcom/google/android/gms/measurement/internal/zzkn;->zzak(Lcom/google/android/gms/measurement/internal/zzkd;)Lcom/google/android/gms/measurement/internal/zzkd;

    .line 61
    invoke-virtual {p2}, Lcom/google/android/gms/measurement/internal/zzaj;->zzx()V

    .line 62
    throw p1
.end method

.method final zzT(Ljava/lang/String;Lcom/google/android/gms/measurement/internal/zzag;)V
    .locals 5

    .line 1
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzaz()Lcom/google/android/gms/measurement/internal/zzfp;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzgl;->zzg()V

    .line 2
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzB()V

    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzkn;->zzB:Ljava/util/Map;

    .line 3
    invoke-interface {v0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzkn;->zze:Lcom/google/android/gms/measurement/internal/zzaj;

    .line 4
    invoke-static {v0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzak(Lcom/google/android/gms/measurement/internal/zzkd;)Lcom/google/android/gms/measurement/internal/zzkd;

    .line 5
    invoke-static {p1}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 6
    invoke-static {p2}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 7
    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzgl;->zzg()V

    .line 8
    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzkd;->zzY()V

    new-instance v1, Landroid/content/ContentValues;

    .line 9
    invoke-direct {v1}, Landroid/content/ContentValues;-><init>()V

    const-string v2, "app_id"

    .line 10
    invoke-virtual {v1, v2, p1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 11
    invoke-virtual {p2}, Lcom/google/android/gms/measurement/internal/zzag;->zzi()Ljava/lang/String;

    move-result-object p2

    const-string v2, "consent_state"

    invoke-virtual {v1, v2, p2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 12
    :try_start_0
    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzaj;->zzh()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object p2

    const-string v2, "consent_settings"

    const/4 v3, 0x0

    const/4 v4, 0x5

    .line 13
    invoke-virtual {p2, v2, v3, v1, v4}, Landroid/database/sqlite/SQLiteDatabase;->insertWithOnConflict(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;I)J

    move-result-wide v1

    const-wide/16 v3, -0x1

    cmp-long p2, v1, v3

    if-nez p2, :cond_0

    iget-object p2, v0, Lcom/google/android/gms/measurement/internal/zzgl;->zzs:Lcom/google/android/gms/measurement/internal/zzfs;

    .line 14
    invoke-virtual {p2}, Lcom/google/android/gms/measurement/internal/zzfs;->zzay()Lcom/google/android/gms/measurement/internal/zzei;

    move-result-object p2

    .line 15
    invoke-virtual {p2}, Lcom/google/android/gms/measurement/internal/zzei;->zzd()Lcom/google/android/gms/measurement/internal/zzeg;

    move-result-object p2

    const-string v1, "Failed to insert/update consent setting (got -1). appId"

    invoke-static {p1}, Lcom/google/android/gms/measurement/internal/zzei;->zzn(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    .line 16
    invoke-virtual {p2, v1, v2}, Lcom/google/android/gms/measurement/internal/zzeg;->zzb(Ljava/lang/String;Ljava/lang/Object;)V
    :try_end_0
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_0 .. :try_end_0} :catch_0

    :cond_0
    return-void

    :catch_0
    move-exception p2

    iget-object v0, v0, Lcom/google/android/gms/measurement/internal/zzgl;->zzs:Lcom/google/android/gms/measurement/internal/zzfs;

    .line 17
    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzfs;->zzay()Lcom/google/android/gms/measurement/internal/zzei;

    move-result-object v0

    .line 18
    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzei;->zzd()Lcom/google/android/gms/measurement/internal/zzeg;

    move-result-object v0

    invoke-static {p1}, Lcom/google/android/gms/measurement/internal/zzei;->zzn(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    const-string v1, "Error storing consent setting. appId, error"

    .line 19
    invoke-virtual {v0, v1, p1, p2}, Lcom/google/android/gms/measurement/internal/zzeg;->zzc(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    return-void
.end method

.method final zzU(Lcom/google/android/gms/measurement/internal/zzkq;Lcom/google/android/gms/measurement/internal/zzp;)V
    .locals 13

    .line 1
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzaz()Lcom/google/android/gms/measurement/internal/zzfp;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzgl;->zzg()V

    .line 2
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzB()V

    .line 3
    invoke-direct {p0, p2}, Lcom/google/android/gms/measurement/internal/zzkn;->zzag(Lcom/google/android/gms/measurement/internal/zzp;)Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    .line 4
    :cond_0
    iget-boolean v0, p2, Lcom/google/android/gms/measurement/internal/zzp;->zzh:Z

    if-nez v0, :cond_1

    .line 5
    invoke-virtual {p0, p2}, Lcom/google/android/gms/measurement/internal/zzkn;->zzd(Lcom/google/android/gms/measurement/internal/zzp;)Lcom/google/android/gms/measurement/internal/zzg;

    return-void

    .line 6
    :cond_1
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzv()Lcom/google/android/gms/measurement/internal/zzku;

    move-result-object v0

    iget-object v1, p1, Lcom/google/android/gms/measurement/internal/zzkq;->zzb:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/google/android/gms/measurement/internal/zzku;->zzl(Ljava/lang/String;)I

    move-result v5

    const/4 v0, 0x1

    const/16 v1, 0x18

    const/4 v2, 0x0

    if-eqz v5, :cond_3

    .line 7
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzv()Lcom/google/android/gms/measurement/internal/zzku;

    move-result-object v3

    iget-object v4, p1, Lcom/google/android/gms/measurement/internal/zzkq;->zzb:Ljava/lang/String;

    .line 8
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzg()Lcom/google/android/gms/measurement/internal/zzaf;

    .line 9
    invoke-virtual {v3, v4, v1, v0}, Lcom/google/android/gms/measurement/internal/zzku;->zzC(Ljava/lang/String;IZ)Ljava/lang/String;

    move-result-object v7

    .line 10
    iget-object p1, p1, Lcom/google/android/gms/measurement/internal/zzkq;->zzb:Ljava/lang/String;

    if-eqz p1, :cond_2

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result p1

    move v8, p1

    goto :goto_0

    :cond_2
    const/4 v8, 0x0

    .line 11
    :goto_0
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzv()Lcom/google/android/gms/measurement/internal/zzku;

    move-result-object v2

    iget-object v3, p0, Lcom/google/android/gms/measurement/internal/zzkn;->zzC:Lcom/google/android/gms/measurement/internal/zzkt;

    iget-object v4, p2, Lcom/google/android/gms/measurement/internal/zzp;->zza:Ljava/lang/String;

    const-string v6, "_ev"

    .line 12
    invoke-virtual/range {v2 .. v8}, Lcom/google/android/gms/measurement/internal/zzku;->zzM(Lcom/google/android/gms/measurement/internal/zzkt;Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;I)V

    return-void

    .line 13
    :cond_3
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzv()Lcom/google/android/gms/measurement/internal/zzku;

    move-result-object v3

    iget-object v4, p1, Lcom/google/android/gms/measurement/internal/zzkq;->zzb:Ljava/lang/String;

    invoke-virtual {p1}, Lcom/google/android/gms/measurement/internal/zzkq;->zza()Ljava/lang/Object;

    move-result-object v5

    invoke-virtual {v3, v4, v5}, Lcom/google/android/gms/measurement/internal/zzku;->zzd(Ljava/lang/String;Ljava/lang/Object;)I

    move-result v9

    if-eqz v9, :cond_6

    .line 14
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzv()Lcom/google/android/gms/measurement/internal/zzku;

    move-result-object v3

    iget-object v4, p1, Lcom/google/android/gms/measurement/internal/zzkq;->zzb:Ljava/lang/String;

    .line 15
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzg()Lcom/google/android/gms/measurement/internal/zzaf;

    .line 16
    invoke-virtual {v3, v4, v1, v0}, Lcom/google/android/gms/measurement/internal/zzku;->zzC(Ljava/lang/String;IZ)Ljava/lang/String;

    move-result-object v11

    .line 17
    invoke-virtual {p1}, Lcom/google/android/gms/measurement/internal/zzkq;->zza()Ljava/lang/Object;

    move-result-object p1

    if-eqz p1, :cond_5

    .line 18
    instance-of v0, p1, Ljava/lang/String;

    if-nez v0, :cond_4

    instance-of v0, p1, Ljava/lang/CharSequence;

    if-eqz v0, :cond_5

    .line 19
    :cond_4
    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    .line 20
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v2

    move v12, v2

    goto :goto_1

    :cond_5
    const/4 v12, 0x0

    .line 21
    :goto_1
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzv()Lcom/google/android/gms/measurement/internal/zzku;

    move-result-object v6

    iget-object v7, p0, Lcom/google/android/gms/measurement/internal/zzkn;->zzC:Lcom/google/android/gms/measurement/internal/zzkt;

    iget-object v8, p2, Lcom/google/android/gms/measurement/internal/zzp;->zza:Ljava/lang/String;

    const-string v10, "_ev"

    .line 22
    invoke-virtual/range {v6 .. v12}, Lcom/google/android/gms/measurement/internal/zzku;->zzM(Lcom/google/android/gms/measurement/internal/zzkt;Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;I)V

    return-void

    .line 23
    :cond_6
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzv()Lcom/google/android/gms/measurement/internal/zzku;

    move-result-object v0

    iget-object v1, p1, Lcom/google/android/gms/measurement/internal/zzkq;->zzb:Ljava/lang/String;

    .line 24
    invoke-virtual {p1}, Lcom/google/android/gms/measurement/internal/zzkq;->zza()Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/google/android/gms/measurement/internal/zzku;->zzB(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    if-nez v0, :cond_7

    return-void

    .line 25
    :cond_7
    iget-object v1, p1, Lcom/google/android/gms/measurement/internal/zzkq;->zzb:Ljava/lang/String;

    const-string v2, "_sid"

    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_b

    .line 26
    iget-wide v4, p1, Lcom/google/android/gms/measurement/internal/zzkq;->zzc:J

    iget-object v7, p1, Lcom/google/android/gms/measurement/internal/zzkq;->zzf:Ljava/lang/String;

    .line 27
    iget-object v1, p2, Lcom/google/android/gms/measurement/internal/zzp;->zza:Ljava/lang/String;

    invoke-static {v1}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    iget-object v2, p0, Lcom/google/android/gms/measurement/internal/zzkn;->zze:Lcom/google/android/gms/measurement/internal/zzaj;

    .line 28
    invoke-static {v2}, Lcom/google/android/gms/measurement/internal/zzkn;->zzak(Lcom/google/android/gms/measurement/internal/zzkd;)Lcom/google/android/gms/measurement/internal/zzkd;

    const-string v3, "_sno"

    .line 29
    invoke-virtual {v2, v1, v3}, Lcom/google/android/gms/measurement/internal/zzaj;->zzp(Ljava/lang/String;Ljava/lang/String;)Lcom/google/android/gms/measurement/internal/zzks;

    move-result-object v2

    if-eqz v2, :cond_8

    iget-object v3, v2, Lcom/google/android/gms/measurement/internal/zzks;->zze:Ljava/lang/Object;

    .line 30
    instance-of v6, v3, Ljava/lang/Long;

    if-eqz v6, :cond_8

    .line 39
    check-cast v3, Ljava/lang/Long;

    invoke-virtual {v3}, Ljava/lang/Long;->longValue()J

    move-result-wide v1

    goto :goto_2

    :cond_8
    if-eqz v2, :cond_9

    .line 31
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzay()Lcom/google/android/gms/measurement/internal/zzei;

    move-result-object v3

    .line 32
    invoke-virtual {v3}, Lcom/google/android/gms/measurement/internal/zzei;->zzk()Lcom/google/android/gms/measurement/internal/zzeg;

    move-result-object v3

    iget-object v2, v2, Lcom/google/android/gms/measurement/internal/zzks;->zze:Ljava/lang/Object;

    const-string v6, "Retrieved last session number from database does not contain a valid (long) value"

    .line 33
    invoke-virtual {v3, v6, v2}, Lcom/google/android/gms/measurement/internal/zzeg;->zzb(Ljava/lang/String;Ljava/lang/Object;)V

    :cond_9
    iget-object v2, p0, Lcom/google/android/gms/measurement/internal/zzkn;->zze:Lcom/google/android/gms/measurement/internal/zzaj;

    .line 34
    invoke-static {v2}, Lcom/google/android/gms/measurement/internal/zzkn;->zzak(Lcom/google/android/gms/measurement/internal/zzkd;)Lcom/google/android/gms/measurement/internal/zzkd;

    const-string v3, "_s"

    .line 35
    invoke-virtual {v2, v1, v3}, Lcom/google/android/gms/measurement/internal/zzaj;->zzn(Ljava/lang/String;Ljava/lang/String;)Lcom/google/android/gms/measurement/internal/zzap;

    move-result-object v1

    if-eqz v1, :cond_a

    iget-wide v1, v1, Lcom/google/android/gms/measurement/internal/zzap;->zzc:J

    .line 36
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzay()Lcom/google/android/gms/measurement/internal/zzei;

    move-result-object v3

    .line 37
    invoke-virtual {v3}, Lcom/google/android/gms/measurement/internal/zzei;->zzj()Lcom/google/android/gms/measurement/internal/zzeg;

    move-result-object v3

    .line 38
    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v6

    const-string v8, "Backfill the session number. Last used session number"

    invoke-virtual {v3, v8, v6}, Lcom/google/android/gms/measurement/internal/zzeg;->zzb(Ljava/lang/String;Ljava/lang/Object;)V

    goto :goto_2

    :cond_a
    const-wide/16 v1, 0x0

    .line 39
    :goto_2
    new-instance v8, Lcom/google/android/gms/measurement/internal/zzkq;

    const-wide/16 v9, 0x1

    add-long/2addr v1, v9

    .line 40
    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v6

    const-string v3, "_sno"

    move-object v2, v8

    invoke-direct/range {v2 .. v7}, Lcom/google/android/gms/measurement/internal/zzkq;-><init>(Ljava/lang/String;JLjava/lang/Object;Ljava/lang/String;)V

    .line 41
    invoke-virtual {p0, v8, p2}, Lcom/google/android/gms/measurement/internal/zzkn;->zzU(Lcom/google/android/gms/measurement/internal/zzkq;Lcom/google/android/gms/measurement/internal/zzp;)V

    :cond_b
    new-instance v1, Lcom/google/android/gms/measurement/internal/zzks;

    .line 42
    iget-object v2, p2, Lcom/google/android/gms/measurement/internal/zzp;->zza:Ljava/lang/String;

    .line 43
    invoke-static {v2}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    move-object v4, v2

    check-cast v4, Ljava/lang/String;

    iget-object v2, p1, Lcom/google/android/gms/measurement/internal/zzkq;->zzf:Ljava/lang/String;

    .line 44
    invoke-static {v2}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    move-object v5, v2

    check-cast v5, Ljava/lang/String;

    iget-object v6, p1, Lcom/google/android/gms/measurement/internal/zzkq;->zzb:Ljava/lang/String;

    iget-wide v7, p1, Lcom/google/android/gms/measurement/internal/zzkq;->zzc:J

    move-object v3, v1

    move-object v9, v0

    invoke-direct/range {v3 .. v9}, Lcom/google/android/gms/measurement/internal/zzks;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;JLjava/lang/Object;)V

    .line 45
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzay()Lcom/google/android/gms/measurement/internal/zzei;

    move-result-object p1

    .line 46
    invoke-virtual {p1}, Lcom/google/android/gms/measurement/internal/zzei;->zzj()Lcom/google/android/gms/measurement/internal/zzeg;

    move-result-object p1

    iget-object v2, p0, Lcom/google/android/gms/measurement/internal/zzkn;->zzn:Lcom/google/android/gms/measurement/internal/zzfs;

    .line 47
    invoke-virtual {v2}, Lcom/google/android/gms/measurement/internal/zzfs;->zzj()Lcom/google/android/gms/measurement/internal/zzed;

    move-result-object v2

    iget-object v3, v1, Lcom/google/android/gms/measurement/internal/zzks;->zzc:Ljava/lang/String;

    .line 48
    invoke-virtual {v2, v3}, Lcom/google/android/gms/measurement/internal/zzed;->zze(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    const-string v3, "Setting user property"

    .line 49
    invoke-virtual {p1, v3, v2, v0}, Lcom/google/android/gms/measurement/internal/zzeg;->zzc(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    iget-object p1, p0, Lcom/google/android/gms/measurement/internal/zzkn;->zze:Lcom/google/android/gms/measurement/internal/zzaj;

    .line 50
    invoke-static {p1}, Lcom/google/android/gms/measurement/internal/zzkn;->zzak(Lcom/google/android/gms/measurement/internal/zzkd;)Lcom/google/android/gms/measurement/internal/zzkd;

    .line 51
    invoke-virtual {p1}, Lcom/google/android/gms/measurement/internal/zzaj;->zzw()V

    .line 52
    :try_start_0
    invoke-static {}, Lcom/google/android/gms/internal/measurement/zzna;->zzc()Z

    iget-object p1, p0, Lcom/google/android/gms/measurement/internal/zzkn;->zzn:Lcom/google/android/gms/measurement/internal/zzfs;

    invoke-virtual {p1}, Lcom/google/android/gms/measurement/internal/zzfs;->zzf()Lcom/google/android/gms/measurement/internal/zzaf;

    move-result-object p1

    sget-object v0, Lcom/google/android/gms/measurement/internal/zzdw;->zzay:Lcom/google/android/gms/measurement/internal/zzdv;

    const/4 v2, 0x0

    invoke-virtual {p1, v2, v0}, Lcom/google/android/gms/measurement/internal/zzaf;->zzs(Ljava/lang/String;Lcom/google/android/gms/measurement/internal/zzdv;)Z

    move-result p1

    if-eqz p1, :cond_c

    const-string p1, "_id"

    iget-object v0, v1, Lcom/google/android/gms/measurement/internal/zzks;->zzc:Ljava/lang/String;

    .line 53
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_c

    iget-object p1, p0, Lcom/google/android/gms/measurement/internal/zzkn;->zze:Lcom/google/android/gms/measurement/internal/zzaj;

    .line 54
    invoke-static {p1}, Lcom/google/android/gms/measurement/internal/zzkn;->zzak(Lcom/google/android/gms/measurement/internal/zzkd;)Lcom/google/android/gms/measurement/internal/zzkd;

    .line 55
    iget-object v0, p2, Lcom/google/android/gms/measurement/internal/zzp;->zza:Ljava/lang/String;

    const-string v2, "_lair"

    .line 56
    invoke-virtual {p1, v0, v2}, Lcom/google/android/gms/measurement/internal/zzaj;->zzA(Ljava/lang/String;Ljava/lang/String;)V

    .line 57
    :cond_c
    invoke-virtual {p0, p2}, Lcom/google/android/gms/measurement/internal/zzkn;->zzd(Lcom/google/android/gms/measurement/internal/zzp;)Lcom/google/android/gms/measurement/internal/zzg;

    iget-object p1, p0, Lcom/google/android/gms/measurement/internal/zzkn;->zze:Lcom/google/android/gms/measurement/internal/zzaj;

    .line 58
    invoke-static {p1}, Lcom/google/android/gms/measurement/internal/zzkn;->zzak(Lcom/google/android/gms/measurement/internal/zzkd;)Lcom/google/android/gms/measurement/internal/zzkd;

    .line 59
    invoke-virtual {p1, v1}, Lcom/google/android/gms/measurement/internal/zzaj;->zzN(Lcom/google/android/gms/measurement/internal/zzks;)Z

    move-result p1

    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzkn;->zze:Lcom/google/android/gms/measurement/internal/zzaj;

    .line 60
    invoke-static {v0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzak(Lcom/google/android/gms/measurement/internal/zzkd;)Lcom/google/android/gms/measurement/internal/zzkd;

    .line 61
    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzaj;->zzC()V

    if-nez p1, :cond_d

    .line 62
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzay()Lcom/google/android/gms/measurement/internal/zzei;

    move-result-object p1

    .line 63
    invoke-virtual {p1}, Lcom/google/android/gms/measurement/internal/zzei;->zzd()Lcom/google/android/gms/measurement/internal/zzeg;

    move-result-object p1

    const-string v0, "Too many unique user properties are set. Ignoring user property"

    iget-object v2, p0, Lcom/google/android/gms/measurement/internal/zzkn;->zzn:Lcom/google/android/gms/measurement/internal/zzfs;

    .line 64
    invoke-virtual {v2}, Lcom/google/android/gms/measurement/internal/zzfs;->zzj()Lcom/google/android/gms/measurement/internal/zzed;

    move-result-object v2

    iget-object v3, v1, Lcom/google/android/gms/measurement/internal/zzks;->zzc:Ljava/lang/String;

    .line 65
    invoke-virtual {v2, v3}, Lcom/google/android/gms/measurement/internal/zzed;->zze(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iget-object v1, v1, Lcom/google/android/gms/measurement/internal/zzks;->zze:Ljava/lang/Object;

    .line 66
    invoke-virtual {p1, v0, v2, v1}, Lcom/google/android/gms/measurement/internal/zzeg;->zzc(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 67
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzv()Lcom/google/android/gms/measurement/internal/zzku;

    move-result-object v3

    iget-object v4, p0, Lcom/google/android/gms/measurement/internal/zzkn;->zzC:Lcom/google/android/gms/measurement/internal/zzkt;

    iget-object v5, p2, Lcom/google/android/gms/measurement/internal/zzp;->zza:Ljava/lang/String;

    const/16 v6, 0x9

    const/4 v7, 0x0

    const/4 v8, 0x0

    const/4 v9, 0x0

    .line 68
    invoke-virtual/range {v3 .. v9}, Lcom/google/android/gms/measurement/internal/zzku;->zzM(Lcom/google/android/gms/measurement/internal/zzkt;Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;I)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :cond_d
    iget-object p1, p0, Lcom/google/android/gms/measurement/internal/zzkn;->zze:Lcom/google/android/gms/measurement/internal/zzaj;

    .line 69
    invoke-static {p1}, Lcom/google/android/gms/measurement/internal/zzkn;->zzak(Lcom/google/android/gms/measurement/internal/zzkd;)Lcom/google/android/gms/measurement/internal/zzkd;

    .line 70
    invoke-virtual {p1}, Lcom/google/android/gms/measurement/internal/zzaj;->zzx()V

    return-void

    :catchall_0
    move-exception p1

    .line 38
    iget-object p2, p0, Lcom/google/android/gms/measurement/internal/zzkn;->zze:Lcom/google/android/gms/measurement/internal/zzaj;

    .line 69
    invoke-static {p2}, Lcom/google/android/gms/measurement/internal/zzkn;->zzak(Lcom/google/android/gms/measurement/internal/zzkd;)Lcom/google/android/gms/measurement/internal/zzkd;

    .line 70
    invoke-virtual {p2}, Lcom/google/android/gms/measurement/internal/zzaj;->zzx()V

    .line 71
    throw p1
.end method

.method final zzV()V
    .locals 22

    move-object/from16 v1, p0

    .line 1
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzaz()Lcom/google/android/gms/measurement/internal/zzfp;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzgl;->zzg()V

    .line 2
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzB()V

    const/4 v2, 0x1

    iput-boolean v2, v1, Lcom/google/android/gms/measurement/internal/zzkn;->zzv:Z

    const/4 v3, 0x0

    :try_start_0
    iget-object v0, v1, Lcom/google/android/gms/measurement/internal/zzkn;->zzn:Lcom/google/android/gms/measurement/internal/zzfs;

    .line 3
    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzfs;->zzaw()Lcom/google/android/gms/measurement/internal/zzaa;

    iget-object v0, v1, Lcom/google/android/gms/measurement/internal/zzkn;->zzn:Lcom/google/android/gms/measurement/internal/zzfs;

    .line 4
    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzfs;->zzt()Lcom/google/android/gms/measurement/internal/zzjj;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzjj;->zzj()Ljava/lang/Boolean;

    move-result-object v0

    if-nez v0, :cond_0

    .line 5
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzay()Lcom/google/android/gms/measurement/internal/zzei;

    move-result-object v0

    .line 6
    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzei;->zzk()Lcom/google/android/gms/measurement/internal/zzeg;

    move-result-object v0

    const-string v2, "Upload data called on the client side before use of service was decided"

    .line 7
    invoke-virtual {v0, v2}, Lcom/google/android/gms/measurement/internal/zzeg;->zza(Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_6

    iput-boolean v3, v1, Lcom/google/android/gms/measurement/internal/zzkn;->zzv:Z

    .line 8
    :goto_0
    invoke-direct/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzac()V

    return-void

    .line 9
    :cond_0
    :try_start_1
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 168
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzay()Lcom/google/android/gms/measurement/internal/zzei;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzei;->zzd()Lcom/google/android/gms/measurement/internal/zzeg;

    move-result-object v0

    const-string v2, "Upload called in the client side when service should be used"

    invoke-virtual {v0, v2}, Lcom/google/android/gms/measurement/internal/zzeg;->zza(Ljava/lang/String;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_6

    iput-boolean v3, v1, Lcom/google/android/gms/measurement/internal/zzkn;->zzv:Z

    goto :goto_0

    .line 8
    :cond_1
    :try_start_2
    iget-wide v4, v1, Lcom/google/android/gms/measurement/internal/zzkn;->zza:J

    const-wide/16 v6, 0x0

    cmp-long v0, v4, v6

    if-lez v0, :cond_2

    .line 167
    invoke-direct/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzaf()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_6

    iput-boolean v3, v1, Lcom/google/android/gms/measurement/internal/zzkn;->zzv:Z

    goto :goto_0

    .line 10
    :cond_2
    :try_start_3
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzaz()Lcom/google/android/gms/measurement/internal/zzfp;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzgl;->zzg()V

    iget-object v0, v1, Lcom/google/android/gms/measurement/internal/zzkn;->zzy:Ljava/util/List;

    if-eqz v0, :cond_3

    .line 11
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzay()Lcom/google/android/gms/measurement/internal/zzei;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzei;->zzj()Lcom/google/android/gms/measurement/internal/zzeg;

    move-result-object v0

    const-string v2, "Uploading requested multiple times"

    invoke-virtual {v0, v2}, Lcom/google/android/gms/measurement/internal/zzeg;->zza(Ljava/lang/String;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_6

    iput-boolean v3, v1, Lcom/google/android/gms/measurement/internal/zzkn;->zzv:Z

    goto :goto_0

    .line 8
    :cond_3
    :try_start_4
    iget-object v0, v1, Lcom/google/android/gms/measurement/internal/zzkn;->zzd:Lcom/google/android/gms/measurement/internal/zzeo;

    .line 12
    invoke-static {v0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzak(Lcom/google/android/gms/measurement/internal/zzkd;)Lcom/google/android/gms/measurement/internal/zzkd;

    .line 13
    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzeo;->zzc()Z

    move-result v0

    if-nez v0, :cond_4

    .line 14
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzay()Lcom/google/android/gms/measurement/internal/zzei;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzei;->zzj()Lcom/google/android/gms/measurement/internal/zzeg;

    move-result-object v0

    const-string v2, "Network not connected, ignoring upload request"

    invoke-virtual {v0, v2}, Lcom/google/android/gms/measurement/internal/zzeg;->zza(Ljava/lang/String;)V

    .line 15
    invoke-direct/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzaf()V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_6

    iput-boolean v3, v1, Lcom/google/android/gms/measurement/internal/zzkn;->zzv:Z

    goto :goto_0

    .line 16
    :cond_4
    :try_start_5
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzav()Lcom/google/android/gms/common/util/Clock;

    move-result-object v0

    invoke-interface {v0}, Lcom/google/android/gms/common/util/Clock;->currentTimeMillis()J

    move-result-wide v4

    .line 17
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzg()Lcom/google/android/gms/measurement/internal/zzaf;

    move-result-object v0

    sget-object v8, Lcom/google/android/gms/measurement/internal/zzdw;->zzP:Lcom/google/android/gms/measurement/internal/zzdv;

    const/4 v9, 0x0

    invoke-virtual {v0, v9, v8}, Lcom/google/android/gms/measurement/internal/zzaf;->zze(Ljava/lang/String;Lcom/google/android/gms/measurement/internal/zzdv;)I

    move-result v0

    .line 18
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzg()Lcom/google/android/gms/measurement/internal/zzaf;

    invoke-static {}, Lcom/google/android/gms/measurement/internal/zzaf;->zzz()J

    move-result-wide v10

    sub-long v10, v4, v10

    const/4 v8, 0x0

    :goto_1
    if-ge v8, v0, :cond_5

    .line 19
    invoke-direct {v1, v9, v10, v11}, Lcom/google/android/gms/measurement/internal/zzkn;->zzah(Ljava/lang/String;J)Z

    move-result v12

    if-eqz v12, :cond_5

    add-int/lit8 v8, v8, 0x1

    goto :goto_1

    :cond_5
    iget-object v0, v1, Lcom/google/android/gms/measurement/internal/zzkn;->zzk:Lcom/google/android/gms/measurement/internal/zzjk;

    .line 20
    iget-object v0, v0, Lcom/google/android/gms/measurement/internal/zzjk;->zzc:Lcom/google/android/gms/measurement/internal/zzet;

    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzet;->zza()J

    move-result-wide v10

    cmp-long v0, v10, v6

    if-eqz v0, :cond_6

    .line 21
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzay()Lcom/google/android/gms/measurement/internal/zzei;

    move-result-object v0

    .line 22
    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzei;->zzc()Lcom/google/android/gms/measurement/internal/zzeg;

    move-result-object v0

    const-string v6, "Uploading events. Elapsed time since last upload attempt (ms)"

    sub-long v7, v4, v10

    .line 23
    invoke-static {v7, v8}, Ljava/lang/Math;->abs(J)J

    move-result-wide v7

    invoke-static {v7, v8}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v7

    .line 24
    invoke-virtual {v0, v6, v7}, Lcom/google/android/gms/measurement/internal/zzeg;->zzb(Ljava/lang/String;Ljava/lang/Object;)V

    :cond_6
    iget-object v0, v1, Lcom/google/android/gms/measurement/internal/zzkn;->zze:Lcom/google/android/gms/measurement/internal/zzaj;

    .line 25
    invoke-static {v0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzak(Lcom/google/android/gms/measurement/internal/zzkd;)Lcom/google/android/gms/measurement/internal/zzkd;

    .line 26
    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzaj;->zzr()Ljava/lang/String;

    move-result-object v6

    .line 27
    invoke-static {v6}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    const-wide/16 v7, -0x1

    if-nez v0, :cond_25

    iget-wide v10, v1, Lcom/google/android/gms/measurement/internal/zzkn;->zzA:J

    cmp-long v0, v10, v7

    if-nez v0, :cond_a

    iget-object v10, v1, Lcom/google/android/gms/measurement/internal/zzkn;->zze:Lcom/google/android/gms/measurement/internal/zzaj;

    .line 28
    invoke-static {v10}, Lcom/google/android/gms/measurement/internal/zzkn;->zzak(Lcom/google/android/gms/measurement/internal/zzkd;)Lcom/google/android/gms/measurement/internal/zzkd;
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_6

    .line 29
    :try_start_6
    invoke-virtual {v10}, Lcom/google/android/gms/measurement/internal/zzaj;->zzh()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    const-string v11, "select rowid from raw_events order by rowid desc limit 1;"

    .line 30
    invoke-virtual {v0, v11, v9}, Landroid/database/sqlite/SQLiteDatabase;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v11
    :try_end_6
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_6 .. :try_end_6} :catch_1
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    .line 31
    :try_start_7
    invoke-interface {v11}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v0
    :try_end_7
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_7 .. :try_end_7} :catch_0
    .catchall {:try_start_7 .. :try_end_7} :catchall_1

    if-nez v0, :cond_7

    if-eqz v11, :cond_8

    .line 32
    :goto_2
    :try_start_8
    invoke-interface {v11}, Landroid/database/Cursor;->close()V
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_6

    goto :goto_4

    .line 33
    :cond_7
    :try_start_9
    invoke-interface {v11, v3}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v7
    :try_end_9
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_9 .. :try_end_9} :catch_0
    .catchall {:try_start_9 .. :try_end_9} :catchall_1

    if-eqz v11, :cond_8

    goto :goto_2

    :catch_0
    move-exception v0

    goto :goto_3

    :catchall_0
    move-exception v0

    goto :goto_5

    :catch_1
    move-exception v0

    move-object v11, v9

    .line 169
    :goto_3
    :try_start_a
    iget-object v10, v10, Lcom/google/android/gms/measurement/internal/zzgl;->zzs:Lcom/google/android/gms/measurement/internal/zzfs;

    .line 34
    invoke-virtual {v10}, Lcom/google/android/gms/measurement/internal/zzfs;->zzay()Lcom/google/android/gms/measurement/internal/zzei;

    move-result-object v10

    .line 35
    invoke-virtual {v10}, Lcom/google/android/gms/measurement/internal/zzei;->zzd()Lcom/google/android/gms/measurement/internal/zzeg;

    move-result-object v10

    const-string v12, "Error querying raw events"

    invoke-virtual {v10, v12, v0}, Lcom/google/android/gms/measurement/internal/zzeg;->zzb(Ljava/lang/String;Ljava/lang/Object;)V
    :try_end_a
    .catchall {:try_start_a .. :try_end_a} :catchall_1

    if-eqz v11, :cond_8

    goto :goto_2

    .line 32
    :cond_8
    :goto_4
    :try_start_b
    iput-wide v7, v1, Lcom/google/android/gms/measurement/internal/zzkn;->zzA:J

    goto :goto_6

    :catchall_1
    move-exception v0

    move-object v9, v11

    :goto_5
    if-eqz v9, :cond_9

    invoke-interface {v9}, Landroid/database/Cursor;->close()V

    .line 36
    :cond_9
    throw v0

    .line 37
    :cond_a
    :goto_6
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzg()Lcom/google/android/gms/measurement/internal/zzaf;

    move-result-object v0

    sget-object v7, Lcom/google/android/gms/measurement/internal/zzdw;->zzf:Lcom/google/android/gms/measurement/internal/zzdv;

    invoke-virtual {v0, v6, v7}, Lcom/google/android/gms/measurement/internal/zzaf;->zze(Ljava/lang/String;Lcom/google/android/gms/measurement/internal/zzdv;)I

    move-result v0

    .line 38
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzg()Lcom/google/android/gms/measurement/internal/zzaf;

    move-result-object v7

    sget-object v8, Lcom/google/android/gms/measurement/internal/zzdw;->zzg:Lcom/google/android/gms/measurement/internal/zzdv;

    invoke-virtual {v7, v6, v8}, Lcom/google/android/gms/measurement/internal/zzaf;->zze(Ljava/lang/String;Lcom/google/android/gms/measurement/internal/zzdv;)I

    move-result v7

    .line 39
    invoke-static {v3, v7}, Ljava/lang/Math;->max(II)I

    move-result v7

    iget-object v8, v1, Lcom/google/android/gms/measurement/internal/zzkn;->zze:Lcom/google/android/gms/measurement/internal/zzaj;

    .line 40
    invoke-static {v8}, Lcom/google/android/gms/measurement/internal/zzkn;->zzak(Lcom/google/android/gms/measurement/internal/zzkd;)Lcom/google/android/gms/measurement/internal/zzkd;

    .line 41
    invoke-virtual {v8}, Lcom/google/android/gms/measurement/internal/zzgl;->zzg()V

    .line 42
    invoke-virtual {v8}, Lcom/google/android/gms/measurement/internal/zzkd;->zzY()V

    if-lez v0, :cond_b

    const/4 v10, 0x1

    goto :goto_7

    :cond_b
    const/4 v10, 0x0

    .line 43
    :goto_7
    invoke-static {v10}, Lcom/google/android/gms/common/internal/Preconditions;->checkArgument(Z)V

    if-lez v7, :cond_c

    const/4 v10, 0x1

    goto :goto_8

    :cond_c
    const/4 v10, 0x0

    .line 44
    :goto_8
    invoke-static {v10}, Lcom/google/android/gms/common/internal/Preconditions;->checkArgument(Z)V

    .line 45
    invoke-static {v6}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotEmpty(Ljava/lang/String;)Ljava/lang/String;
    :try_end_b
    .catchall {:try_start_b .. :try_end_b} :catchall_6

    .line 46
    :try_start_c
    invoke-virtual {v8}, Lcom/google/android/gms/measurement/internal/zzaj;->zzh()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v11

    const-string v12, "rowid"

    const-string v13, "data"

    const-string v14, "retry_count"

    filled-new-array {v12, v13, v14}, [Ljava/lang/String;

    move-result-object v13

    new-array v15, v2, [Ljava/lang/String;

    aput-object v6, v15, v3

    const-string v12, "queue"

    const-string v14, "app_id=?"

    const/16 v16, 0x0

    const/16 v17, 0x0

    const-string v18, "rowid"

    .line 47
    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v19

    .line 48
    invoke-virtual/range {v11 .. v19}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v11
    :try_end_c
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_c .. :try_end_c} :catch_9
    .catchall {:try_start_c .. :try_end_c} :catchall_2

    .line 49
    :try_start_d
    invoke-interface {v11}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v0

    if-nez v0, :cond_e

    .line 50
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v0
    :try_end_d
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_d .. :try_end_d} :catch_8
    .catchall {:try_start_d .. :try_end_d} :catchall_3

    if-eqz v11, :cond_d

    .line 51
    :try_start_e
    invoke-interface {v11}, Landroid/database/Cursor;->close()V
    :try_end_e
    .catchall {:try_start_e .. :try_end_e} :catchall_6

    :cond_d
    move-wide/from16 v20, v4

    goto/16 :goto_10

    .line 129
    :cond_e
    :try_start_f
    new-instance v12, Ljava/util/ArrayList;

    .line 52
    invoke-direct {v12}, Ljava/util/ArrayList;-><init>()V

    const/4 v13, 0x0

    .line 53
    :goto_9
    invoke-interface {v11, v3}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v14
    :try_end_f
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_f .. :try_end_f} :catch_8
    .catchall {:try_start_f .. :try_end_f} :catchall_3

    .line 54
    :try_start_10
    invoke-interface {v11, v2}, Landroid/database/Cursor;->getBlob(I)[B

    move-result-object v0

    iget-object v2, v8, Lcom/google/android/gms/measurement/internal/zzkc;->zzf:Lcom/google/android/gms/measurement/internal/zzkn;

    iget-object v2, v2, Lcom/google/android/gms/measurement/internal/zzkn;->zzi:Lcom/google/android/gms/measurement/internal/zzkp;

    .line 55
    invoke-static {v2}, Lcom/google/android/gms/measurement/internal/zzkn;->zzak(Lcom/google/android/gms/measurement/internal/zzkd;)Lcom/google/android/gms/measurement/internal/zzkd;
    :try_end_10
    .catch Ljava/io/IOException; {:try_start_10 .. :try_end_10} :catch_6
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_10 .. :try_end_10} :catch_8
    .catchall {:try_start_10 .. :try_end_10} :catchall_3

    :try_start_11
    new-instance v9, Ljava/io/ByteArrayInputStream;

    .line 56
    invoke-direct {v9, v0}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    new-instance v0, Ljava/util/zip/GZIPInputStream;

    .line 57
    invoke-direct {v0, v9}, Ljava/util/zip/GZIPInputStream;-><init>(Ljava/io/InputStream;)V

    .line 58
    new-instance v3, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v3}, Ljava/io/ByteArrayOutputStream;-><init>()V

    const/16 v10, 0x400

    new-array v10, v10, [B
    :try_end_11
    .catch Ljava/io/IOException; {:try_start_11 .. :try_end_11} :catch_4
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_11 .. :try_end_11} :catch_8
    .catchall {:try_start_11 .. :try_end_11} :catchall_3

    move-wide/from16 v20, v4

    .line 59
    :goto_a
    :try_start_12
    invoke-virtual {v0, v10}, Ljava/util/zip/GZIPInputStream;->read([B)I

    move-result v4

    if-gtz v4, :cond_11

    .line 61
    invoke-virtual {v0}, Ljava/util/zip/GZIPInputStream;->close()V

    .line 62
    invoke-virtual {v9}, Ljava/io/ByteArrayInputStream;->close()V

    .line 63
    invoke-virtual {v3}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v0
    :try_end_12
    .catch Ljava/io/IOException; {:try_start_12 .. :try_end_12} :catch_3
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_12 .. :try_end_12} :catch_7
    .catchall {:try_start_12 .. :try_end_12} :catchall_3

    .line 64
    :try_start_13
    invoke-interface {v12}, Ljava/util/List;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_f

    array-length v2, v0
    :try_end_13
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_13 .. :try_end_13} :catch_7
    .catchall {:try_start_13 .. :try_end_13} :catchall_3

    add-int/2addr v2, v13

    if-le v2, v7, :cond_f

    goto/16 :goto_e

    .line 65
    :cond_f
    :try_start_14
    invoke-static {}, Lcom/google/android/gms/internal/measurement/zzfy;->zzu()Lcom/google/android/gms/internal/measurement/zzfx;

    move-result-object v2

    invoke-static {v2, v0}, Lcom/google/android/gms/measurement/internal/zzkp;->zzl(Lcom/google/android/gms/internal/measurement/zzlf;[B)Lcom/google/android/gms/internal/measurement/zzlf;

    move-result-object v2

    check-cast v2, Lcom/google/android/gms/internal/measurement/zzfx;
    :try_end_14
    .catch Ljava/io/IOException; {:try_start_14 .. :try_end_14} :catch_2
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_14 .. :try_end_14} :catch_7
    .catchall {:try_start_14 .. :try_end_14} :catchall_3

    const/4 v3, 0x2

    .line 69
    :try_start_15
    invoke-interface {v11, v3}, Landroid/database/Cursor;->isNull(I)Z

    move-result v4

    if-nez v4, :cond_10

    .line 70
    invoke-interface {v11, v3}, Landroid/database/Cursor;->getInt(I)I

    move-result v4

    invoke-virtual {v2, v4}, Lcom/google/android/gms/internal/measurement/zzfx;->zzac(I)Lcom/google/android/gms/internal/measurement/zzfx;

    .line 71
    :cond_10
    array-length v0, v0

    add-int/2addr v13, v0

    .line 72
    invoke-virtual {v2}, Lcom/google/android/gms/internal/measurement/zzjv;->zzaA()Lcom/google/android/gms/internal/measurement/zzjz;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/measurement/zzfy;

    invoke-static {v14, v15}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-static {v0, v2}, Landroid/util/Pair;->create(Ljava/lang/Object;Ljava/lang/Object;)Landroid/util/Pair;

    move-result-object v0

    invoke-interface {v12, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_d

    :catch_2
    move-exception v0

    .line 75
    iget-object v2, v8, Lcom/google/android/gms/measurement/internal/zzgl;->zzs:Lcom/google/android/gms/measurement/internal/zzfs;

    .line 66
    invoke-virtual {v2}, Lcom/google/android/gms/measurement/internal/zzfs;->zzay()Lcom/google/android/gms/measurement/internal/zzei;

    move-result-object v2

    .line 67
    invoke-virtual {v2}, Lcom/google/android/gms/measurement/internal/zzei;->zzd()Lcom/google/android/gms/measurement/internal/zzeg;

    move-result-object v2

    const-string v3, "Failed to merge queued bundle. appId"

    invoke-static {v6}, Lcom/google/android/gms/measurement/internal/zzei;->zzn(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v4

    .line 68
    invoke-virtual {v2, v3, v4, v0}, Lcom/google/android/gms/measurement/internal/zzeg;->zzc(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V
    :try_end_15
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_15 .. :try_end_15} :catch_7
    .catchall {:try_start_15 .. :try_end_15} :catchall_3

    goto :goto_d

    :cond_11
    const/4 v5, 0x0

    .line 60
    :try_start_16
    invoke-virtual {v3, v10, v5, v4}, Ljava/io/ByteArrayOutputStream;->write([BII)V
    :try_end_16
    .catch Ljava/io/IOException; {:try_start_16 .. :try_end_16} :catch_3
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_16 .. :try_end_16} :catch_7
    .catchall {:try_start_16 .. :try_end_16} :catchall_3

    goto :goto_a

    :catch_3
    move-exception v0

    goto :goto_b

    :catch_4
    move-exception v0

    move-wide/from16 v20, v4

    .line 78
    :goto_b
    :try_start_17
    iget-object v2, v2, Lcom/google/android/gms/measurement/internal/zzgl;->zzs:Lcom/google/android/gms/measurement/internal/zzfs;

    .line 73
    invoke-virtual {v2}, Lcom/google/android/gms/measurement/internal/zzfs;->zzay()Lcom/google/android/gms/measurement/internal/zzei;

    move-result-object v2

    .line 74
    invoke-virtual {v2}, Lcom/google/android/gms/measurement/internal/zzei;->zzd()Lcom/google/android/gms/measurement/internal/zzeg;

    move-result-object v2

    const-string v3, "Failed to ungzip content"

    invoke-virtual {v2, v3, v0}, Lcom/google/android/gms/measurement/internal/zzeg;->zzb(Ljava/lang/String;Ljava/lang/Object;)V

    .line 75
    throw v0
    :try_end_17
    .catch Ljava/io/IOException; {:try_start_17 .. :try_end_17} :catch_5
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_17 .. :try_end_17} :catch_7
    .catchall {:try_start_17 .. :try_end_17} :catchall_3

    :catch_5
    move-exception v0

    goto :goto_c

    :catch_6
    move-exception v0

    move-wide/from16 v20, v4

    .line 147
    :goto_c
    :try_start_18
    iget-object v2, v8, Lcom/google/android/gms/measurement/internal/zzgl;->zzs:Lcom/google/android/gms/measurement/internal/zzfs;

    .line 76
    invoke-virtual {v2}, Lcom/google/android/gms/measurement/internal/zzfs;->zzay()Lcom/google/android/gms/measurement/internal/zzei;

    move-result-object v2

    .line 77
    invoke-virtual {v2}, Lcom/google/android/gms/measurement/internal/zzei;->zzd()Lcom/google/android/gms/measurement/internal/zzeg;

    move-result-object v2

    const-string v3, "Failed to unzip queued bundle. appId"

    invoke-static {v6}, Lcom/google/android/gms/measurement/internal/zzei;->zzn(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v4

    .line 78
    invoke-virtual {v2, v3, v4, v0}, Lcom/google/android/gms/measurement/internal/zzeg;->zzc(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 79
    :goto_d
    invoke-interface {v11}, Landroid/database/Cursor;->moveToNext()Z

    move-result v0
    :try_end_18
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_18 .. :try_end_18} :catch_7
    .catchall {:try_start_18 .. :try_end_18} :catchall_3

    if-eqz v0, :cond_13

    if-le v13, v7, :cond_12

    goto :goto_e

    :cond_12
    move-wide/from16 v4, v20

    const/4 v2, 0x1

    const/4 v3, 0x0

    const/4 v9, 0x0

    goto/16 :goto_9

    :cond_13
    :goto_e
    if-eqz v11, :cond_14

    .line 51
    :try_start_19
    invoke-interface {v11}, Landroid/database/Cursor;->close()V
    :try_end_19
    .catchall {:try_start_19 .. :try_end_19} :catchall_6

    :cond_14
    move-object v0, v12

    goto :goto_10

    :catch_7
    move-exception v0

    goto :goto_f

    :catch_8
    move-exception v0

    move-wide/from16 v20, v4

    goto :goto_f

    :catchall_2
    move-exception v0

    const/4 v9, 0x0

    goto/16 :goto_19

    :catch_9
    move-exception v0

    move-wide/from16 v20, v4

    const/4 v11, 0x0

    .line 36
    :goto_f
    :try_start_1a
    iget-object v2, v8, Lcom/google/android/gms/measurement/internal/zzgl;->zzs:Lcom/google/android/gms/measurement/internal/zzfs;

    .line 80
    invoke-virtual {v2}, Lcom/google/android/gms/measurement/internal/zzfs;->zzay()Lcom/google/android/gms/measurement/internal/zzei;

    move-result-object v2

    .line 81
    invoke-virtual {v2}, Lcom/google/android/gms/measurement/internal/zzei;->zzd()Lcom/google/android/gms/measurement/internal/zzeg;

    move-result-object v2

    const-string v3, "Error querying bundles. appId"

    invoke-static {v6}, Lcom/google/android/gms/measurement/internal/zzei;->zzn(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {v2, v3, v4, v0}, Lcom/google/android/gms/measurement/internal/zzeg;->zzc(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 82
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v0
    :try_end_1a
    .catchall {:try_start_1a .. :try_end_1a} :catchall_3

    if-eqz v11, :cond_15

    .line 51
    :try_start_1b
    invoke-interface {v11}, Landroid/database/Cursor;->close()V

    .line 84
    :cond_15
    :goto_10
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_28

    .line 85
    invoke-virtual {v1, v6}, Lcom/google/android/gms/measurement/internal/zzkn;->zzh(Ljava/lang/String;)Lcom/google/android/gms/measurement/internal/zzag;

    move-result-object v2

    invoke-virtual {v2}, Lcom/google/android/gms/measurement/internal/zzag;->zzj()Z

    move-result v2

    if-eqz v2, :cond_1a

    .line 86
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_16
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_17

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/util/Pair;

    .line 87
    iget-object v3, v3, Landroid/util/Pair;->first:Ljava/lang/Object;

    check-cast v3, Lcom/google/android/gms/internal/measurement/zzfy;

    .line 88
    invoke-virtual {v3}, Lcom/google/android/gms/internal/measurement/zzfy;->zzL()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-nez v4, :cond_16

    .line 89
    invoke-virtual {v3}, Lcom/google/android/gms/internal/measurement/zzfy;->zzL()Ljava/lang/String;

    move-result-object v2

    goto :goto_11

    :cond_17
    const/4 v2, 0x0

    :goto_11
    if-eqz v2, :cond_1a

    const/4 v3, 0x0

    .line 90
    :goto_12
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v4

    if-ge v3, v4, :cond_1a

    .line 91
    invoke-interface {v0, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/util/Pair;

    iget-object v4, v4, Landroid/util/Pair;->first:Ljava/lang/Object;

    check-cast v4, Lcom/google/android/gms/internal/measurement/zzfy;

    .line 92
    invoke-virtual {v4}, Lcom/google/android/gms/internal/measurement/zzfy;->zzL()Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v5

    if-eqz v5, :cond_18

    goto :goto_13

    .line 93
    :cond_18
    invoke-virtual {v4}, Lcom/google/android/gms/internal/measurement/zzfy;->zzL()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_19

    const/4 v4, 0x0

    .line 94
    invoke-interface {v0, v4, v3}, Ljava/util/List;->subList(II)Ljava/util/List;

    move-result-object v0

    goto :goto_14

    :cond_19
    :goto_13
    add-int/lit8 v3, v3, 0x1

    goto :goto_12

    .line 95
    :cond_1a
    :goto_14
    invoke-static {}, Lcom/google/android/gms/internal/measurement/zzfw;->zza()Lcom/google/android/gms/internal/measurement/zzfv;

    move-result-object v2

    .line 96
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v3

    new-instance v4, Ljava/util/ArrayList;

    .line 97
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v5

    invoke-direct {v4, v5}, Ljava/util/ArrayList;-><init>(I)V

    .line 98
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzg()Lcom/google/android/gms/measurement/internal/zzaf;

    move-result-object v5

    invoke-virtual {v5, v6}, Lcom/google/android/gms/measurement/internal/zzaf;->zzt(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_1b

    .line 99
    invoke-virtual {v1, v6}, Lcom/google/android/gms/measurement/internal/zzkn;->zzh(Ljava/lang/String;)Lcom/google/android/gms/measurement/internal/zzag;

    move-result-object v5

    invoke-virtual {v5}, Lcom/google/android/gms/measurement/internal/zzag;->zzj()Z

    move-result v5

    if-eqz v5, :cond_1b

    const/4 v5, 0x1

    goto :goto_15

    :cond_1b
    const/4 v5, 0x0

    .line 100
    :goto_15
    invoke-virtual {v1, v6}, Lcom/google/android/gms/measurement/internal/zzkn;->zzh(Ljava/lang/String;)Lcom/google/android/gms/measurement/internal/zzag;

    move-result-object v7

    invoke-virtual {v7}, Lcom/google/android/gms/measurement/internal/zzag;->zzj()Z

    move-result v7

    .line 101
    invoke-virtual {v1, v6}, Lcom/google/android/gms/measurement/internal/zzkn;->zzh(Ljava/lang/String;)Lcom/google/android/gms/measurement/internal/zzag;

    move-result-object v8

    invoke-virtual {v8}, Lcom/google/android/gms/measurement/internal/zzag;->zzk()Z

    move-result v8

    const/4 v9, 0x0

    :goto_16
    if-ge v9, v3, :cond_20

    .line 102
    invoke-interface {v0, v9}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Landroid/util/Pair;

    iget-object v10, v10, Landroid/util/Pair;->first:Ljava/lang/Object;

    check-cast v10, Lcom/google/android/gms/internal/measurement/zzfy;

    invoke-virtual {v10}, Lcom/google/android/gms/internal/measurement/zzjz;->zzbv()Lcom/google/android/gms/internal/measurement/zzjv;

    move-result-object v10

    check-cast v10, Lcom/google/android/gms/internal/measurement/zzfx;

    .line 103
    invoke-interface {v0, v9}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Landroid/util/Pair;

    iget-object v11, v11, Landroid/util/Pair;->second:Ljava/lang/Object;

    check-cast v11, Ljava/lang/Long;

    invoke-interface {v4, v11}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 104
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzg()Lcom/google/android/gms/measurement/internal/zzaf;

    move-result-object v11

    invoke-virtual {v11}, Lcom/google/android/gms/measurement/internal/zzaf;->zzh()J

    const-wide/32 v11, 0xa471

    invoke-virtual {v10, v11, v12}, Lcom/google/android/gms/internal/measurement/zzfx;->zzah(J)Lcom/google/android/gms/internal/measurement/zzfx;

    move-wide/from16 v11, v20

    .line 105
    invoke-virtual {v10, v11, v12}, Lcom/google/android/gms/internal/measurement/zzfx;->zzag(J)Lcom/google/android/gms/internal/measurement/zzfx;

    iget-object v13, v1, Lcom/google/android/gms/measurement/internal/zzkn;->zzn:Lcom/google/android/gms/measurement/internal/zzfs;

    .line 106
    invoke-virtual {v13}, Lcom/google/android/gms/measurement/internal/zzfs;->zzaw()Lcom/google/android/gms/measurement/internal/zzaa;

    const/4 v13, 0x0

    .line 107
    invoke-virtual {v10, v13}, Lcom/google/android/gms/internal/measurement/zzfx;->zzad(Z)Lcom/google/android/gms/internal/measurement/zzfx;

    if-nez v5, :cond_1c

    .line 108
    invoke-virtual {v10}, Lcom/google/android/gms/internal/measurement/zzfx;->zzo()Lcom/google/android/gms/internal/measurement/zzfx;

    :cond_1c
    if-nez v7, :cond_1d

    .line 109
    invoke-virtual {v10}, Lcom/google/android/gms/internal/measurement/zzfx;->zzu()Lcom/google/android/gms/internal/measurement/zzfx;

    .line 110
    invoke-virtual {v10}, Lcom/google/android/gms/internal/measurement/zzfx;->zzr()Lcom/google/android/gms/internal/measurement/zzfx;

    :cond_1d
    if-nez v8, :cond_1e

    .line 111
    invoke-virtual {v10}, Lcom/google/android/gms/internal/measurement/zzfx;->zzm()Lcom/google/android/gms/internal/measurement/zzfx;

    .line 112
    :cond_1e
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzg()Lcom/google/android/gms/measurement/internal/zzaf;

    move-result-object v13

    sget-object v14, Lcom/google/android/gms/measurement/internal/zzdw;->zzV:Lcom/google/android/gms/measurement/internal/zzdv;

    invoke-virtual {v13, v6, v14}, Lcom/google/android/gms/measurement/internal/zzaf;->zzs(Ljava/lang/String;Lcom/google/android/gms/measurement/internal/zzdv;)Z

    move-result v13

    if-eqz v13, :cond_1f

    .line 113
    invoke-virtual {v10}, Lcom/google/android/gms/internal/measurement/zzjv;->zzaA()Lcom/google/android/gms/internal/measurement/zzjz;

    move-result-object v13

    check-cast v13, Lcom/google/android/gms/internal/measurement/zzfy;

    invoke-virtual {v13}, Lcom/google/android/gms/internal/measurement/zzih;->zzbs()[B

    move-result-object v13

    iget-object v14, v1, Lcom/google/android/gms/measurement/internal/zzkn;->zzi:Lcom/google/android/gms/measurement/internal/zzkp;

    .line 114
    invoke-static {v14}, Lcom/google/android/gms/measurement/internal/zzkn;->zzak(Lcom/google/android/gms/measurement/internal/zzkd;)Lcom/google/android/gms/measurement/internal/zzkd;

    .line 115
    invoke-virtual {v14, v13}, Lcom/google/android/gms/measurement/internal/zzkp;->zzd([B)J

    move-result-wide v13

    invoke-virtual {v10, v13, v14}, Lcom/google/android/gms/internal/measurement/zzfx;->zzG(J)Lcom/google/android/gms/internal/measurement/zzfx;

    .line 116
    :cond_1f
    invoke-virtual {v2, v10}, Lcom/google/android/gms/internal/measurement/zzfv;->zza(Lcom/google/android/gms/internal/measurement/zzfx;)Lcom/google/android/gms/internal/measurement/zzfv;

    add-int/lit8 v9, v9, 0x1

    move-wide/from16 v20, v11

    goto :goto_16

    :cond_20
    move-wide/from16 v11, v20

    .line 117
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzay()Lcom/google/android/gms/measurement/internal/zzei;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzei;->zzq()Ljava/lang/String;

    move-result-object v0

    const/4 v5, 0x2

    .line 118
    invoke-static {v0, v5}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v0

    if-eqz v0, :cond_21

    iget-object v0, v1, Lcom/google/android/gms/measurement/internal/zzkn;->zzi:Lcom/google/android/gms/measurement/internal/zzkp;

    .line 119
    invoke-static {v0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzak(Lcom/google/android/gms/measurement/internal/zzkd;)Lcom/google/android/gms/measurement/internal/zzkd;

    .line 120
    invoke-virtual {v2}, Lcom/google/android/gms/internal/measurement/zzjv;->zzaA()Lcom/google/android/gms/internal/measurement/zzjz;

    move-result-object v5

    check-cast v5, Lcom/google/android/gms/internal/measurement/zzfw;

    invoke-virtual {v0, v5}, Lcom/google/android/gms/measurement/internal/zzkp;->zzm(Lcom/google/android/gms/internal/measurement/zzfw;)Ljava/lang/String;

    move-result-object v0

    goto :goto_17

    :cond_21
    const/4 v0, 0x0

    :goto_17
    iget-object v5, v1, Lcom/google/android/gms/measurement/internal/zzkn;->zzi:Lcom/google/android/gms/measurement/internal/zzkp;

    .line 121
    invoke-static {v5}, Lcom/google/android/gms/measurement/internal/zzkn;->zzak(Lcom/google/android/gms/measurement/internal/zzkd;)Lcom/google/android/gms/measurement/internal/zzkd;

    .line 122
    invoke-virtual {v2}, Lcom/google/android/gms/internal/measurement/zzjv;->zzaA()Lcom/google/android/gms/internal/measurement/zzjz;

    move-result-object v5

    check-cast v5, Lcom/google/android/gms/internal/measurement/zzfw;

    .line 123
    invoke-virtual {v5}, Lcom/google/android/gms/internal/measurement/zzih;->zzbs()[B

    move-result-object v14

    .line 124
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzg()Lcom/google/android/gms/measurement/internal/zzaf;

    sget-object v5, Lcom/google/android/gms/measurement/internal/zzdw;->zzp:Lcom/google/android/gms/measurement/internal/zzdv;

    const/4 v9, 0x0

    .line 125
    invoke-virtual {v5, v9}, Lcom/google/android/gms/measurement/internal/zzdv;->zza(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;
    :try_end_1b
    .catchall {:try_start_1b .. :try_end_1b} :catchall_6

    .line 126
    :try_start_1c
    new-instance v13, Ljava/net/URL;

    invoke-direct {v13, v5}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    .line 127
    invoke-interface {v4}, Ljava/util/List;->isEmpty()Z

    move-result v7

    const/4 v8, 0x1

    xor-int/2addr v7, v8

    invoke-static {v7}, Lcom/google/android/gms/common/internal/Preconditions;->checkArgument(Z)V

    iget-object v7, v1, Lcom/google/android/gms/measurement/internal/zzkn;->zzy:Ljava/util/List;

    if-eqz v7, :cond_22

    .line 128
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzay()Lcom/google/android/gms/measurement/internal/zzei;

    move-result-object v4

    invoke-virtual {v4}, Lcom/google/android/gms/measurement/internal/zzei;->zzd()Lcom/google/android/gms/measurement/internal/zzeg;

    move-result-object v4

    const-string v7, "Set uploading progress before finishing the previous upload"

    invoke-virtual {v4, v7}, Lcom/google/android/gms/measurement/internal/zzeg;->zza(Ljava/lang/String;)V

    goto :goto_18

    .line 8
    :cond_22
    new-instance v7, Ljava/util/ArrayList;

    .line 129
    invoke-direct {v7, v4}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    iput-object v7, v1, Lcom/google/android/gms/measurement/internal/zzkn;->zzy:Ljava/util/List;

    .line 128
    :goto_18
    iget-object v4, v1, Lcom/google/android/gms/measurement/internal/zzkn;->zzk:Lcom/google/android/gms/measurement/internal/zzjk;

    .line 130
    iget-object v4, v4, Lcom/google/android/gms/measurement/internal/zzjk;->zzd:Lcom/google/android/gms/measurement/internal/zzet;

    invoke-virtual {v4, v11, v12}, Lcom/google/android/gms/measurement/internal/zzet;->zzb(J)V

    const-string v4, "?"

    if-lez v3, :cond_23

    const/4 v3, 0x0

    .line 131
    invoke-virtual {v2, v3}, Lcom/google/android/gms/internal/measurement/zzfv;->zzb(I)Lcom/google/android/gms/internal/measurement/zzfy;

    move-result-object v2

    invoke-virtual {v2}, Lcom/google/android/gms/internal/measurement/zzfy;->zzy()Ljava/lang/String;

    move-result-object v4

    .line 132
    :cond_23
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzay()Lcom/google/android/gms/measurement/internal/zzei;

    move-result-object v2

    .line 133
    invoke-virtual {v2}, Lcom/google/android/gms/measurement/internal/zzei;->zzj()Lcom/google/android/gms/measurement/internal/zzeg;

    move-result-object v2

    const-string v3, "Uploading data. app, uncompressed size, data"

    array-length v7, v14

    .line 134
    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-virtual {v2, v3, v4, v7, v0}, Lcom/google/android/gms/measurement/internal/zzeg;->zzd(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    const/4 v2, 0x1

    iput-boolean v2, v1, Lcom/google/android/gms/measurement/internal/zzkn;->zzu:Z

    iget-object v11, v1, Lcom/google/android/gms/measurement/internal/zzkn;->zzd:Lcom/google/android/gms/measurement/internal/zzeo;

    .line 135
    invoke-static {v11}, Lcom/google/android/gms/measurement/internal/zzkn;->zzak(Lcom/google/android/gms/measurement/internal/zzkd;)Lcom/google/android/gms/measurement/internal/zzkd;

    new-instance v0, Lcom/google/android/gms/measurement/internal/zzkg;

    .line 136
    invoke-direct {v0, v1, v6}, Lcom/google/android/gms/measurement/internal/zzkg;-><init>(Lcom/google/android/gms/measurement/internal/zzkn;Ljava/lang/String;)V

    .line 137
    invoke-virtual {v11}, Lcom/google/android/gms/measurement/internal/zzgl;->zzg()V

    .line 138
    invoke-virtual {v11}, Lcom/google/android/gms/measurement/internal/zzkd;->zzY()V

    .line 139
    invoke-static {v13}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 140
    invoke-static {v14}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 141
    invoke-static {v0}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v2, v11, Lcom/google/android/gms/measurement/internal/zzgl;->zzs:Lcom/google/android/gms/measurement/internal/zzfs;

    .line 142
    invoke-virtual {v2}, Lcom/google/android/gms/measurement/internal/zzfs;->zzaz()Lcom/google/android/gms/measurement/internal/zzfp;

    move-result-object v2

    new-instance v3, Lcom/google/android/gms/measurement/internal/zzen;

    const/4 v15, 0x0

    move-object v10, v3

    move-object v12, v6

    move-object/from16 v16, v0

    .line 143
    invoke-direct/range {v10 .. v16}, Lcom/google/android/gms/measurement/internal/zzen;-><init>(Lcom/google/android/gms/measurement/internal/zzeo;Ljava/lang/String;Ljava/net/URL;[BLjava/util/Map;Lcom/google/android/gms/measurement/internal/zzek;)V

    .line 144
    invoke-virtual {v2, v3}, Lcom/google/android/gms/measurement/internal/zzfp;->zzo(Ljava/lang/Runnable;)V
    :try_end_1c
    .catch Ljava/net/MalformedURLException; {:try_start_1c .. :try_end_1c} :catch_a
    .catchall {:try_start_1c .. :try_end_1c} :catchall_6

    goto/16 :goto_1d

    .line 145
    :catch_a
    :try_start_1d
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzay()Lcom/google/android/gms/measurement/internal/zzei;

    move-result-object v0

    .line 146
    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzei;->zzd()Lcom/google/android/gms/measurement/internal/zzeg;

    move-result-object v0

    const-string v2, "Failed to parse upload URL. Not uploading. appId"

    invoke-static {v6}, Lcom/google/android/gms/measurement/internal/zzei;->zzn(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    .line 147
    invoke-virtual {v0, v2, v3, v5}, Lcom/google/android/gms/measurement/internal/zzeg;->zzc(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    goto/16 :goto_1d

    :catchall_3
    move-exception v0

    move-object v9, v11

    :goto_19
    if-eqz v9, :cond_24

    .line 51
    invoke-interface {v9}, Landroid/database/Cursor;->close()V

    .line 83
    :cond_24
    throw v0

    :cond_25
    move-wide v11, v4

    .line 32
    iput-wide v7, v1, Lcom/google/android/gms/measurement/internal/zzkn;->zzA:J

    iget-object v2, v1, Lcom/google/android/gms/measurement/internal/zzkn;->zze:Lcom/google/android/gms/measurement/internal/zzaj;

    .line 148
    invoke-static {v2}, Lcom/google/android/gms/measurement/internal/zzkn;->zzak(Lcom/google/android/gms/measurement/internal/zzkd;)Lcom/google/android/gms/measurement/internal/zzkd;

    .line 149
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzg()Lcom/google/android/gms/measurement/internal/zzaf;

    invoke-static {}, Lcom/google/android/gms/measurement/internal/zzaf;->zzz()J

    move-result-wide v3

    sub-long v4, v11, v3

    .line 150
    invoke-virtual {v2}, Lcom/google/android/gms/measurement/internal/zzgl;->zzg()V

    .line 151
    invoke-virtual {v2}, Lcom/google/android/gms/measurement/internal/zzkd;->zzY()V
    :try_end_1d
    .catchall {:try_start_1d .. :try_end_1d} :catchall_6

    .line 152
    :try_start_1e
    invoke-virtual {v2}, Lcom/google/android/gms/measurement/internal/zzaj;->zzh()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/String;

    .line 153
    invoke-static {v4, v5}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v4

    const/4 v5, 0x0

    aput-object v4, v3, v5

    const-string v4, "select app_id from apps where app_id in (select distinct app_id from raw_events) and config_fetched_time < ? order by failed_config_fetch_time limit 1;"

    .line 154
    invoke-virtual {v0, v4, v3}, Landroid/database/sqlite/SQLiteDatabase;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v3
    :try_end_1e
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_1e .. :try_end_1e} :catch_c
    .catchall {:try_start_1e .. :try_end_1e} :catchall_4

    .line 155
    :try_start_1f
    invoke-interface {v3}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v0

    if-nez v0, :cond_26

    iget-object v0, v2, Lcom/google/android/gms/measurement/internal/zzgl;->zzs:Lcom/google/android/gms/measurement/internal/zzfs;

    .line 156
    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzfs;->zzay()Lcom/google/android/gms/measurement/internal/zzei;

    move-result-object v0

    .line 157
    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzei;->zzj()Lcom/google/android/gms/measurement/internal/zzeg;

    move-result-object v0

    const-string v4, "No expired configs for apps with pending events"

    invoke-virtual {v0, v4}, Lcom/google/android/gms/measurement/internal/zzeg;->zza(Ljava/lang/String;)V
    :try_end_1f
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_1f .. :try_end_1f} :catch_b
    .catchall {:try_start_1f .. :try_end_1f} :catchall_5

    if-eqz v3, :cond_27

    .line 158
    :goto_1a
    :try_start_20
    invoke-interface {v3}, Landroid/database/Cursor;->close()V
    :try_end_20
    .catchall {:try_start_20 .. :try_end_20} :catchall_6

    goto :goto_1c

    :cond_26
    const/4 v4, 0x0

    .line 159
    :try_start_21
    invoke-interface {v3, v4}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v9
    :try_end_21
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_21 .. :try_end_21} :catch_b
    .catchall {:try_start_21 .. :try_end_21} :catchall_5

    if-eqz v3, :cond_27

    goto :goto_1a

    :catch_b
    move-exception v0

    goto :goto_1b

    :catchall_4
    move-exception v0

    goto :goto_1e

    :catch_c
    move-exception v0

    move-object v3, v9

    .line 68
    :goto_1b
    :try_start_22
    iget-object v2, v2, Lcom/google/android/gms/measurement/internal/zzgl;->zzs:Lcom/google/android/gms/measurement/internal/zzfs;

    .line 160
    invoke-virtual {v2}, Lcom/google/android/gms/measurement/internal/zzfs;->zzay()Lcom/google/android/gms/measurement/internal/zzei;

    move-result-object v2

    .line 161
    invoke-virtual {v2}, Lcom/google/android/gms/measurement/internal/zzei;->zzd()Lcom/google/android/gms/measurement/internal/zzeg;

    move-result-object v2

    const-string v4, "Error selecting expired configs"

    invoke-virtual {v2, v4, v0}, Lcom/google/android/gms/measurement/internal/zzeg;->zzb(Ljava/lang/String;Ljava/lang/Object;)V
    :try_end_22
    .catchall {:try_start_22 .. :try_end_22} :catchall_5

    if-eqz v3, :cond_27

    goto :goto_1a

    .line 163
    :cond_27
    :goto_1c
    :try_start_23
    invoke-static {v9}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_28

    iget-object v0, v1, Lcom/google/android/gms/measurement/internal/zzkn;->zze:Lcom/google/android/gms/measurement/internal/zzaj;

    .line 164
    invoke-static {v0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzak(Lcom/google/android/gms/measurement/internal/zzkd;)Lcom/google/android/gms/measurement/internal/zzkd;

    .line 165
    invoke-virtual {v0, v9}, Lcom/google/android/gms/measurement/internal/zzaj;->zzj(Ljava/lang/String;)Lcom/google/android/gms/measurement/internal/zzg;

    move-result-object v0

    if-eqz v0, :cond_28

    .line 166
    invoke-virtual {v1, v0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzC(Lcom/google/android/gms/measurement/internal/zzg;)V
    :try_end_23
    .catchall {:try_start_23 .. :try_end_23} :catchall_6

    :cond_28
    :goto_1d
    const/4 v2, 0x0

    .line 144
    iput-boolean v2, v1, Lcom/google/android/gms/measurement/internal/zzkn;->zzv:Z

    goto/16 :goto_0

    :catchall_5
    move-exception v0

    move-object v9, v3

    :goto_1e
    if-eqz v9, :cond_29

    .line 158
    :try_start_24
    invoke-interface {v9}, Landroid/database/Cursor;->close()V

    .line 162
    :cond_29
    throw v0
    :try_end_24
    .catchall {:try_start_24 .. :try_end_24} :catchall_6

    :catchall_6
    move-exception v0

    const/4 v2, 0x0

    .line 158
    iput-boolean v2, v1, Lcom/google/android/gms/measurement/internal/zzkn;->zzv:Z

    .line 8
    invoke-direct/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzac()V

    .line 169
    throw v0
.end method

.method final zzW(Lcom/google/android/gms/measurement/internal/zzat;Lcom/google/android/gms/measurement/internal/zzp;)V
    .locals 34

    move-object/from16 v1, p0

    move-object/from16 v2, p1

    move-object/from16 v3, p2

    const-string v4, "metadata_fingerprint"

    const-string v5, "app_id"

    const-string v6, "raw_events"

    const-string v7, "_sno"

    .line 1
    invoke-static/range {p2 .. p2}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 2
    iget-object v8, v3, Lcom/google/android/gms/measurement/internal/zzp;->zza:Ljava/lang/String;

    invoke-static {v8}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotEmpty(Ljava/lang/String;)Ljava/lang/String;

    .line 3
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v8

    .line 4
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzaz()Lcom/google/android/gms/measurement/internal/zzfp;

    move-result-object v10

    invoke-virtual {v10}, Lcom/google/android/gms/measurement/internal/zzgl;->zzg()V

    .line 5
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzB()V

    .line 6
    iget-object v10, v3, Lcom/google/android/gms/measurement/internal/zzp;->zza:Ljava/lang/String;

    iget-object v11, v1, Lcom/google/android/gms/measurement/internal/zzkn;->zzi:Lcom/google/android/gms/measurement/internal/zzkp;

    .line 7
    invoke-static {v11}, Lcom/google/android/gms/measurement/internal/zzkn;->zzak(Lcom/google/android/gms/measurement/internal/zzkd;)Lcom/google/android/gms/measurement/internal/zzkd;

    .line 8
    invoke-static/range {p1 .. p2}, Lcom/google/android/gms/measurement/internal/zzkp;->zzB(Lcom/google/android/gms/measurement/internal/zzat;Lcom/google/android/gms/measurement/internal/zzp;)Z

    move-result v11

    if-nez v11, :cond_0

    return-void

    .line 9
    :cond_0
    iget-boolean v11, v3, Lcom/google/android/gms/measurement/internal/zzp;->zzh:Z

    if-eqz v11, :cond_41

    iget-object v11, v1, Lcom/google/android/gms/measurement/internal/zzkn;->zzc:Lcom/google/android/gms/measurement/internal/zzfj;

    .line 10
    invoke-static {v11}, Lcom/google/android/gms/measurement/internal/zzkn;->zzak(Lcom/google/android/gms/measurement/internal/zzkd;)Lcom/google/android/gms/measurement/internal/zzkd;

    .line 11
    iget-object v12, v2, Lcom/google/android/gms/measurement/internal/zzat;->zza:Ljava/lang/String;

    invoke-virtual {v11, v10, v12}, Lcom/google/android/gms/measurement/internal/zzfj;->zzo(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v11

    const-string v15, "_err"

    const/4 v14, 0x0

    if-eqz v11, :cond_4

    .line 12
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzay()Lcom/google/android/gms/measurement/internal/zzei;

    move-result-object v3

    .line 13
    invoke-virtual {v3}, Lcom/google/android/gms/measurement/internal/zzei;->zzk()Lcom/google/android/gms/measurement/internal/zzeg;

    move-result-object v3

    invoke-static {v10}, Lcom/google/android/gms/measurement/internal/zzei;->zzn(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v4

    iget-object v5, v1, Lcom/google/android/gms/measurement/internal/zzkn;->zzn:Lcom/google/android/gms/measurement/internal/zzfs;

    .line 14
    invoke-virtual {v5}, Lcom/google/android/gms/measurement/internal/zzfs;->zzj()Lcom/google/android/gms/measurement/internal/zzed;

    move-result-object v5

    .line 15
    iget-object v6, v2, Lcom/google/android/gms/measurement/internal/zzat;->zza:Ljava/lang/String;

    invoke-virtual {v5, v6}, Lcom/google/android/gms/measurement/internal/zzed;->zzc(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    const-string v6, "Dropping blocked event. appId"

    .line 16
    invoke-virtual {v3, v6, v4, v5}, Lcom/google/android/gms/measurement/internal/zzeg;->zzc(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    iget-object v3, v1, Lcom/google/android/gms/measurement/internal/zzkn;->zzc:Lcom/google/android/gms/measurement/internal/zzfj;

    .line 17
    invoke-static {v3}, Lcom/google/android/gms/measurement/internal/zzkn;->zzak(Lcom/google/android/gms/measurement/internal/zzkd;)Lcom/google/android/gms/measurement/internal/zzkd;

    .line 18
    invoke-virtual {v3, v10}, Lcom/google/android/gms/measurement/internal/zzfj;->zzm(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_2

    iget-object v3, v1, Lcom/google/android/gms/measurement/internal/zzkn;->zzc:Lcom/google/android/gms/measurement/internal/zzfj;

    .line 19
    invoke-static {v3}, Lcom/google/android/gms/measurement/internal/zzkn;->zzak(Lcom/google/android/gms/measurement/internal/zzkd;)Lcom/google/android/gms/measurement/internal/zzkd;

    .line 20
    invoke-virtual {v3, v10}, Lcom/google/android/gms/measurement/internal/zzfj;->zzp(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_1

    goto :goto_0

    .line 30
    :cond_1
    iget-object v3, v2, Lcom/google/android/gms/measurement/internal/zzat;->zza:Ljava/lang/String;

    invoke-virtual {v15, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_3

    .line 31
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzv()Lcom/google/android/gms/measurement/internal/zzku;

    move-result-object v11

    iget-object v12, v1, Lcom/google/android/gms/measurement/internal/zzkn;->zzC:Lcom/google/android/gms/measurement/internal/zzkt;

    const/16 v14, 0xb

    iget-object v2, v2, Lcom/google/android/gms/measurement/internal/zzat;->zza:Ljava/lang/String;

    const/16 v17, 0x0

    const-string v15, "_ev"

    move-object v13, v10

    move-object/from16 v16, v2

    .line 32
    invoke-virtual/range {v11 .. v17}, Lcom/google/android/gms/measurement/internal/zzku;->zzM(Lcom/google/android/gms/measurement/internal/zzkt;Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;I)V

    return-void

    .line 20
    :cond_2
    :goto_0
    iget-object v2, v1, Lcom/google/android/gms/measurement/internal/zzkn;->zze:Lcom/google/android/gms/measurement/internal/zzaj;

    .line 21
    invoke-static {v2}, Lcom/google/android/gms/measurement/internal/zzkn;->zzak(Lcom/google/android/gms/measurement/internal/zzkd;)Lcom/google/android/gms/measurement/internal/zzkd;

    .line 22
    invoke-virtual {v2, v10}, Lcom/google/android/gms/measurement/internal/zzaj;->zzj(Ljava/lang/String;)Lcom/google/android/gms/measurement/internal/zzg;

    move-result-object v2

    if-eqz v2, :cond_3

    .line 23
    invoke-virtual {v2}, Lcom/google/android/gms/measurement/internal/zzg;->zzl()J

    move-result-wide v3

    invoke-virtual {v2}, Lcom/google/android/gms/measurement/internal/zzg;->zzc()J

    move-result-wide v5

    invoke-static {v3, v4, v5, v6}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v3

    .line 24
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzav()Lcom/google/android/gms/common/util/Clock;

    move-result-object v5

    invoke-interface {v5}, Lcom/google/android/gms/common/util/Clock;->currentTimeMillis()J

    move-result-wide v5

    sub-long/2addr v5, v3

    .line 25
    invoke-static {v5, v6}, Ljava/lang/Math;->abs(J)J

    move-result-wide v3

    .line 26
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzg()Lcom/google/android/gms/measurement/internal/zzaf;

    .line 27
    sget-object v5, Lcom/google/android/gms/measurement/internal/zzdw;->zzy:Lcom/google/android/gms/measurement/internal/zzdv;

    invoke-virtual {v5, v14}, Lcom/google/android/gms/measurement/internal/zzdv;->zza(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/Long;

    invoke-virtual {v5}, Ljava/lang/Long;->longValue()J

    move-result-wide v5

    cmp-long v7, v3, v5

    if-lez v7, :cond_3

    .line 28
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzay()Lcom/google/android/gms/measurement/internal/zzei;

    move-result-object v3

    invoke-virtual {v3}, Lcom/google/android/gms/measurement/internal/zzei;->zzc()Lcom/google/android/gms/measurement/internal/zzeg;

    move-result-object v3

    const-string v4, "Fetching config for blocked app"

    invoke-virtual {v3, v4}, Lcom/google/android/gms/measurement/internal/zzeg;->zza(Ljava/lang/String;)V

    .line 29
    invoke-virtual {v1, v2}, Lcom/google/android/gms/measurement/internal/zzkn;->zzC(Lcom/google/android/gms/measurement/internal/zzg;)V

    :cond_3
    return-void

    .line 33
    :cond_4
    invoke-static/range {p1 .. p1}, Lcom/google/android/gms/measurement/internal/zzej;->zzb(Lcom/google/android/gms/measurement/internal/zzat;)Lcom/google/android/gms/measurement/internal/zzej;

    move-result-object v2

    .line 34
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzv()Lcom/google/android/gms/measurement/internal/zzku;

    move-result-object v11

    .line 35
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzg()Lcom/google/android/gms/measurement/internal/zzaf;

    move-result-object v12

    invoke-virtual {v12, v10}, Lcom/google/android/gms/measurement/internal/zzaf;->zzd(Ljava/lang/String;)I

    move-result v12

    .line 36
    invoke-virtual {v11, v2, v12}, Lcom/google/android/gms/measurement/internal/zzku;->zzL(Lcom/google/android/gms/measurement/internal/zzej;I)V

    .line 37
    invoke-virtual {v2}, Lcom/google/android/gms/measurement/internal/zzej;->zza()Lcom/google/android/gms/measurement/internal/zzat;

    move-result-object v2

    .line 38
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzay()Lcom/google/android/gms/measurement/internal/zzei;

    move-result-object v11

    invoke-virtual {v11}, Lcom/google/android/gms/measurement/internal/zzei;->zzq()Ljava/lang/String;

    move-result-object v11

    const/4 v13, 0x2

    .line 39
    invoke-static {v11, v13}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v11

    if-eqz v11, :cond_8

    .line 40
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzay()Lcom/google/android/gms/measurement/internal/zzei;

    move-result-object v11

    .line 41
    invoke-virtual {v11}, Lcom/google/android/gms/measurement/internal/zzei;->zzj()Lcom/google/android/gms/measurement/internal/zzeg;

    move-result-object v11

    iget-object v12, v1, Lcom/google/android/gms/measurement/internal/zzkn;->zzn:Lcom/google/android/gms/measurement/internal/zzfs;

    .line 42
    invoke-virtual {v12}, Lcom/google/android/gms/measurement/internal/zzfs;->zzj()Lcom/google/android/gms/measurement/internal/zzed;

    move-result-object v12

    .line 43
    invoke-virtual {v12}, Lcom/google/android/gms/measurement/internal/zzed;->zzh()Z

    move-result v16

    if-nez v16, :cond_5

    .line 44
    invoke-virtual {v2}, Lcom/google/android/gms/measurement/internal/zzat;->toString()Ljava/lang/String;

    move-result-object v12

    goto :goto_2

    .line 81
    :cond_5
    new-instance v13, Ljava/lang/StringBuilder;

    .line 45
    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string v14, "origin="

    .line 46
    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v14, v2, Lcom/google/android/gms/measurement/internal/zzat;->zzc:Ljava/lang/String;

    .line 47
    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v14, ",name="

    .line 48
    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v14, v2, Lcom/google/android/gms/measurement/internal/zzat;->zza:Ljava/lang/String;

    .line 43
    invoke-virtual {v12, v14}, Lcom/google/android/gms/measurement/internal/zzed;->zzc(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v14

    .line 49
    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v14, ",params="

    .line 50
    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v14, v2, Lcom/google/android/gms/measurement/internal/zzat;->zzb:Lcom/google/android/gms/measurement/internal/zzar;

    if-nez v14, :cond_6

    const/4 v12, 0x0

    goto :goto_1

    .line 43
    :cond_6
    invoke-virtual {v12}, Lcom/google/android/gms/measurement/internal/zzed;->zzh()Z

    move-result v17

    if-nez v17, :cond_7

    .line 51
    invoke-virtual {v14}, Lcom/google/android/gms/measurement/internal/zzar;->toString()Ljava/lang/String;

    move-result-object v12

    goto :goto_1

    .line 52
    :cond_7
    invoke-virtual {v14}, Lcom/google/android/gms/measurement/internal/zzar;->zzc()Landroid/os/Bundle;

    move-result-object v14

    .line 43
    invoke-virtual {v12, v14}, Lcom/google/android/gms/measurement/internal/zzed;->zzb(Landroid/os/Bundle;)Ljava/lang/String;

    move-result-object v12

    .line 53
    :goto_1
    invoke-virtual {v13, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 54
    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    :goto_2
    const-string v13, "Logging event"

    .line 43
    invoke-virtual {v11, v13, v12}, Lcom/google/android/gms/measurement/internal/zzeg;->zzb(Ljava/lang/String;Ljava/lang/Object;)V

    :cond_8
    iget-object v11, v1, Lcom/google/android/gms/measurement/internal/zzkn;->zze:Lcom/google/android/gms/measurement/internal/zzaj;

    .line 55
    invoke-static {v11}, Lcom/google/android/gms/measurement/internal/zzkn;->zzak(Lcom/google/android/gms/measurement/internal/zzkd;)Lcom/google/android/gms/measurement/internal/zzkd;

    .line 56
    invoke-virtual {v11}, Lcom/google/android/gms/measurement/internal/zzaj;->zzw()V

    .line 57
    :try_start_0
    invoke-virtual {v1, v3}, Lcom/google/android/gms/measurement/internal/zzkn;->zzd(Lcom/google/android/gms/measurement/internal/zzp;)Lcom/google/android/gms/measurement/internal/zzg;

    .line 58
    invoke-static {}, Lcom/google/android/gms/internal/measurement/zzna;->zzc()Z

    .line 59
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzg()Lcom/google/android/gms/measurement/internal/zzaf;

    move-result-object v11

    sget-object v12, Lcom/google/android/gms/measurement/internal/zzdw;->zzay:Lcom/google/android/gms/measurement/internal/zzdv;

    const/4 v14, 0x0

    invoke-virtual {v11, v14, v12}, Lcom/google/android/gms/measurement/internal/zzaf;->zzs(Ljava/lang/String;Lcom/google/android/gms/measurement/internal/zzdv;)Z

    move-result v11

    if-nez v11, :cond_9

    .line 60
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzg()Lcom/google/android/gms/measurement/internal/zzaf;

    move-result-object v11

    sget-object v12, Lcom/google/android/gms/measurement/internal/zzdw;->zzaz:Lcom/google/android/gms/measurement/internal/zzdv;

    invoke-virtual {v11, v14, v12}, Lcom/google/android/gms/measurement/internal/zzaf;->zzs(Ljava/lang/String;Lcom/google/android/gms/measurement/internal/zzdv;)Z

    move-result v11

    if-eqz v11, :cond_9

    iget-object v11, v1, Lcom/google/android/gms/measurement/internal/zzkn;->zze:Lcom/google/android/gms/measurement/internal/zzaj;

    .line 61
    invoke-static {v11}, Lcom/google/android/gms/measurement/internal/zzkn;->zzak(Lcom/google/android/gms/measurement/internal/zzkd;)Lcom/google/android/gms/measurement/internal/zzkd;

    .line 62
    iget-object v12, v3, Lcom/google/android/gms/measurement/internal/zzp;->zza:Ljava/lang/String;

    const-string v13, "_lair"

    .line 63
    invoke-virtual {v11, v12, v13}, Lcom/google/android/gms/measurement/internal/zzaj;->zzA(Ljava/lang/String;Ljava/lang/String;)V

    :cond_9
    const-string v11, "ecommerce_purchase"

    iget-object v12, v2, Lcom/google/android/gms/measurement/internal/zzat;->zza:Ljava/lang/String;

    .line 64
    invoke-virtual {v11, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    const-string v12, "refund"

    move-wide/from16 v28, v8

    if-nez v11, :cond_b

    :try_start_1
    const-string v9, "purchase"

    iget-object v11, v2, Lcom/google/android/gms/measurement/internal/zzat;->zza:Ljava/lang/String;

    .line 65
    invoke-virtual {v9, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-nez v9, :cond_b

    iget-object v9, v2, Lcom/google/android/gms/measurement/internal/zzat;->zza:Ljava/lang/String;

    .line 66
    invoke-virtual {v12, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_a

    goto :goto_3

    :cond_a
    const/4 v9, 0x0

    goto :goto_4

    :cond_b
    :goto_3
    const/4 v9, 0x1

    :goto_4
    const-string v11, "_iap"

    iget-object v13, v2, Lcom/google/android/gms/measurement/internal/zzat;->zza:Ljava/lang/String;

    .line 67
    invoke-virtual {v11, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-nez v11, :cond_d

    if-eqz v9, :cond_c

    const/4 v9, 0x1

    goto :goto_6

    :cond_c
    move-object/from16 v33, v4

    move-object v8, v15

    :goto_5
    const/4 v4, 0x2

    goto/16 :goto_f

    :cond_d
    :goto_6
    iget-object v11, v2, Lcom/google/android/gms/measurement/internal/zzat;->zzb:Lcom/google/android/gms/measurement/internal/zzar;

    const-string v13, "currency"

    .line 68
    invoke-virtual {v11, v13}, Lcom/google/android/gms/measurement/internal/zzar;->zzg(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    const-string/jumbo v13, "value"

    if-eqz v9, :cond_10

    :try_start_2
    iget-object v9, v2, Lcom/google/android/gms/measurement/internal/zzat;->zzb:Lcom/google/android/gms/measurement/internal/zzar;

    .line 69
    invoke-virtual {v9, v13}, Lcom/google/android/gms/measurement/internal/zzar;->zzd(Ljava/lang/String;)Ljava/lang/Double;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v17

    const-wide v19, 0x412e848000000000L    # 1000000.0

    mul-double v17, v17, v19

    const-wide/16 v21, 0x0

    cmpl-double v9, v17, v21

    if-nez v9, :cond_e

    iget-object v9, v2, Lcom/google/android/gms/measurement/internal/zzat;->zzb:Lcom/google/android/gms/measurement/internal/zzar;

    .line 70
    invoke-virtual {v9, v13}, Lcom/google/android/gms/measurement/internal/zzar;->zze(Ljava/lang/String;)Ljava/lang/Long;

    move-result-object v9

    move-object/from16 v21, v15

    invoke-virtual {v9}, Ljava/lang/Long;->longValue()J

    move-result-wide v14

    long-to-double v13, v14

    mul-double v17, v13, v19

    goto :goto_7

    :cond_e
    move-object/from16 v21, v15

    :goto_7
    const-wide/high16 v13, 0x43e0000000000000L    # 9.223372036854776E18

    cmpg-double v9, v17, v13

    if-gtz v9, :cond_f

    const-wide/high16 v13, -0x3c20000000000000L    # -9.223372036854776E18

    cmpl-double v9, v17, v13

    if-ltz v9, :cond_f

    .line 79
    invoke-static/range {v17 .. v18}, Ljava/lang/Math;->round(D)J

    move-result-wide v13

    iget-object v9, v2, Lcom/google/android/gms/measurement/internal/zzat;->zza:Ljava/lang/String;

    .line 80
    invoke-virtual {v12, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_11

    neg-long v13, v13

    goto :goto_8

    .line 71
    :cond_f
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzay()Lcom/google/android/gms/measurement/internal/zzei;

    move-result-object v2

    .line 72
    invoke-virtual {v2}, Lcom/google/android/gms/measurement/internal/zzei;->zzk()Lcom/google/android/gms/measurement/internal/zzeg;

    move-result-object v2

    const-string v3, "Data lost. Currency value is too big. appId"

    invoke-static {v10}, Lcom/google/android/gms/measurement/internal/zzei;->zzn(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v4

    .line 73
    invoke-static/range {v17 .. v18}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v5

    .line 74
    invoke-virtual {v2, v3, v4, v5}, Lcom/google/android/gms/measurement/internal/zzeg;->zzc(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    iget-object v2, v1, Lcom/google/android/gms/measurement/internal/zzkn;->zze:Lcom/google/android/gms/measurement/internal/zzaj;

    .line 75
    invoke-static {v2}, Lcom/google/android/gms/measurement/internal/zzkn;->zzak(Lcom/google/android/gms/measurement/internal/zzkd;)Lcom/google/android/gms/measurement/internal/zzkd;

    .line 76
    invoke-virtual {v2}, Lcom/google/android/gms/measurement/internal/zzaj;->zzC()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    iget-object v2, v1, Lcom/google/android/gms/measurement/internal/zzkn;->zze:Lcom/google/android/gms/measurement/internal/zzaj;

    .line 77
    invoke-static {v2}, Lcom/google/android/gms/measurement/internal/zzkn;->zzak(Lcom/google/android/gms/measurement/internal/zzkd;)Lcom/google/android/gms/measurement/internal/zzkd;

    .line 78
    invoke-virtual {v2}, Lcom/google/android/gms/measurement/internal/zzaj;->zzx()V

    return-void

    :cond_10
    move-object/from16 v21, v15

    :try_start_3
    iget-object v9, v2, Lcom/google/android/gms/measurement/internal/zzat;->zzb:Lcom/google/android/gms/measurement/internal/zzar;

    .line 81
    invoke-virtual {v9, v13}, Lcom/google/android/gms/measurement/internal/zzar;->zze(Ljava/lang/String;)Ljava/lang/Long;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/Long;->longValue()J

    move-result-wide v13

    .line 82
    :cond_11
    :goto_8
    invoke-static {v11}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v9

    if-nez v9, :cond_15

    sget-object v9, Ljava/util/Locale;->US:Ljava/util/Locale;

    .line 83
    invoke-virtual {v11, v9}, Ljava/lang/String;->toUpperCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v9

    const-string v11, "[A-Z]{3}"

    .line 84
    invoke-virtual {v9, v11}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v11

    if-eqz v11, :cond_15

    const-string v11, "_ltv_"

    .line 85
    invoke-static {v9}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/String;->length()I

    move-result v12

    if-eqz v12, :cond_12

    invoke-virtual {v11, v9}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    goto :goto_9

    .line 102
    :cond_12
    new-instance v9, Ljava/lang/String;

    .line 85
    invoke-direct {v9, v11}, Ljava/lang/String;-><init>(Ljava/lang/String;)V

    :goto_9
    iget-object v11, v1, Lcom/google/android/gms/measurement/internal/zzkn;->zze:Lcom/google/android/gms/measurement/internal/zzaj;

    .line 86
    invoke-static {v11}, Lcom/google/android/gms/measurement/internal/zzkn;->zzak(Lcom/google/android/gms/measurement/internal/zzkd;)Lcom/google/android/gms/measurement/internal/zzkd;

    .line 87
    invoke-virtual {v11, v10, v9}, Lcom/google/android/gms/measurement/internal/zzaj;->zzp(Ljava/lang/String;Ljava/lang/String;)Lcom/google/android/gms/measurement/internal/zzks;

    move-result-object v11

    if-eqz v11, :cond_14

    iget-object v11, v11, Lcom/google/android/gms/measurement/internal/zzks;->zze:Ljava/lang/Object;

    .line 88
    instance-of v12, v11, Ljava/lang/Long;

    if-nez v12, :cond_13

    goto :goto_a

    .line 100
    :cond_13
    check-cast v11, Ljava/lang/Long;

    invoke-virtual {v11}, Ljava/lang/Long;->longValue()J

    move-result-wide v11

    new-instance v18, Lcom/google/android/gms/measurement/internal/zzks;

    iget-object v15, v2, Lcom/google/android/gms/measurement/internal/zzat;->zzc:Ljava/lang/String;

    .line 101
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzav()Lcom/google/android/gms/common/util/Clock;

    move-result-object v17

    invoke-interface/range {v17 .. v17}, Lcom/google/android/gms/common/util/Clock;->currentTimeMillis()J

    move-result-wide v19

    add-long/2addr v11, v13

    .line 102
    invoke-static {v11, v12}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v17

    move-object/from16 v11, v18

    move-object v12, v10

    const/4 v14, 0x0

    move-object v13, v15

    const/4 v8, 0x0

    const/4 v15, 0x0

    move-object v14, v9

    move-object/from16 v9, v21

    move-wide/from16 v15, v19

    invoke-direct/range {v11 .. v17}, Lcom/google/android/gms/measurement/internal/zzks;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;JLjava/lang/Object;)V

    move-object/from16 v33, v4

    move-object v8, v9

    move-object/from16 v9, v18

    const/4 v4, 0x2

    goto/16 :goto_e

    :cond_14
    :goto_a
    move-object/from16 v15, v21

    const/4 v8, 0x0

    .line 88
    iget-object v11, v1, Lcom/google/android/gms/measurement/internal/zzkn;->zze:Lcom/google/android/gms/measurement/internal/zzaj;

    .line 89
    invoke-static {v11}, Lcom/google/android/gms/measurement/internal/zzkn;->zzak(Lcom/google/android/gms/measurement/internal/zzkd;)Lcom/google/android/gms/measurement/internal/zzkd;

    .line 90
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzg()Lcom/google/android/gms/measurement/internal/zzaf;

    move-result-object v12

    sget-object v8, Lcom/google/android/gms/measurement/internal/zzdw;->zzD:Lcom/google/android/gms/measurement/internal/zzdv;

    invoke-virtual {v12, v10, v8}, Lcom/google/android/gms/measurement/internal/zzaf;->zze(Ljava/lang/String;Lcom/google/android/gms/measurement/internal/zzdv;)I

    move-result v8

    add-int/lit8 v8, v8, -0x1

    .line 91
    invoke-static {v10}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotEmpty(Ljava/lang/String;)Ljava/lang/String;

    .line 92
    invoke-virtual {v11}, Lcom/google/android/gms/measurement/internal/zzgl;->zzg()V

    .line 93
    invoke-virtual {v11}, Lcom/google/android/gms/measurement/internal/zzkd;->zzY()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 94
    :try_start_4
    invoke-virtual {v11}, Lcom/google/android/gms/measurement/internal/zzaj;->zzh()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v12
    :try_end_4
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_4 .. :try_end_4} :catch_2
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    move-object/from16 v21, v15

    const/4 v15, 0x3

    :try_start_5
    new-array v15, v15, [Ljava/lang/String;

    const/16 v16, 0x0

    aput-object v10, v15, v16

    const/16 v16, 0x1

    aput-object v10, v15, v16

    .line 95
    invoke-static {v8}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v8
    :try_end_5
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_5 .. :try_end_5} :catch_1
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    move-object/from16 v33, v4

    const/4 v4, 0x2

    :try_start_6
    aput-object v8, v15, v4

    const-string v8, "delete from user_attributes where app_id=? and name in (select name from user_attributes where app_id=? and name like \'_ltv_%\' order by set_timestamp desc limit ?,10);"

    .line 96
    invoke-virtual {v12, v8, v15}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;[Ljava/lang/Object;)V
    :try_end_6
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_6 .. :try_end_6} :catch_0
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    goto :goto_d

    :catch_0
    move-exception v0

    goto :goto_c

    :catch_1
    move-exception v0

    move-object/from16 v33, v4

    goto :goto_b

    :catch_2
    move-exception v0

    move-object/from16 v33, v4

    move-object/from16 v21, v15

    :goto_b
    const/4 v4, 0x2

    :goto_c
    move-object v8, v0

    .line 374
    :try_start_7
    iget-object v11, v11, Lcom/google/android/gms/measurement/internal/zzgl;->zzs:Lcom/google/android/gms/measurement/internal/zzfs;

    .line 97
    invoke-virtual {v11}, Lcom/google/android/gms/measurement/internal/zzfs;->zzay()Lcom/google/android/gms/measurement/internal/zzei;

    move-result-object v11

    .line 98
    invoke-virtual {v11}, Lcom/google/android/gms/measurement/internal/zzei;->zzd()Lcom/google/android/gms/measurement/internal/zzeg;

    move-result-object v11

    const-string v12, "Error pruning currencies. appId"

    invoke-static {v10}, Lcom/google/android/gms/measurement/internal/zzei;->zzn(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v15

    invoke-virtual {v11, v12, v15, v8}, Lcom/google/android/gms/measurement/internal/zzeg;->zzc(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 96
    :goto_d
    new-instance v18, Lcom/google/android/gms/measurement/internal/zzks;

    iget-object v8, v2, Lcom/google/android/gms/measurement/internal/zzat;->zzc:Ljava/lang/String;

    .line 99
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzav()Lcom/google/android/gms/common/util/Clock;

    move-result-object v11

    invoke-interface {v11}, Lcom/google/android/gms/common/util/Clock;->currentTimeMillis()J

    move-result-wide v15

    invoke-static {v13, v14}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v17

    move-object/from16 v11, v18

    move-object v12, v10

    move-object v13, v8

    move-object v14, v9

    move-object/from16 v8, v21

    invoke-direct/range {v11 .. v17}, Lcom/google/android/gms/measurement/internal/zzks;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;JLjava/lang/Object;)V

    move-object/from16 v9, v18

    :goto_e
    iget-object v11, v1, Lcom/google/android/gms/measurement/internal/zzkn;->zze:Lcom/google/android/gms/measurement/internal/zzaj;

    .line 103
    invoke-static {v11}, Lcom/google/android/gms/measurement/internal/zzkn;->zzak(Lcom/google/android/gms/measurement/internal/zzkd;)Lcom/google/android/gms/measurement/internal/zzkd;

    .line 104
    invoke-virtual {v11, v9}, Lcom/google/android/gms/measurement/internal/zzaj;->zzN(Lcom/google/android/gms/measurement/internal/zzks;)Z

    move-result v11

    if-nez v11, :cond_16

    .line 105
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzay()Lcom/google/android/gms/measurement/internal/zzei;

    move-result-object v11

    .line 106
    invoke-virtual {v11}, Lcom/google/android/gms/measurement/internal/zzei;->zzd()Lcom/google/android/gms/measurement/internal/zzeg;

    move-result-object v11

    const-string v12, "Too many unique user properties are set. Ignoring user property. appId"

    invoke-static {v10}, Lcom/google/android/gms/measurement/internal/zzei;->zzn(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v13

    iget-object v14, v1, Lcom/google/android/gms/measurement/internal/zzkn;->zzn:Lcom/google/android/gms/measurement/internal/zzfs;

    .line 107
    invoke-virtual {v14}, Lcom/google/android/gms/measurement/internal/zzfs;->zzj()Lcom/google/android/gms/measurement/internal/zzed;

    move-result-object v14

    iget-object v15, v9, Lcom/google/android/gms/measurement/internal/zzks;->zzc:Ljava/lang/String;

    .line 108
    invoke-virtual {v14, v15}, Lcom/google/android/gms/measurement/internal/zzed;->zze(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v14

    iget-object v9, v9, Lcom/google/android/gms/measurement/internal/zzks;->zze:Ljava/lang/Object;

    .line 109
    invoke-virtual {v11, v12, v13, v14, v9}, Lcom/google/android/gms/measurement/internal/zzeg;->zzd(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 110
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzv()Lcom/google/android/gms/measurement/internal/zzku;

    move-result-object v11

    iget-object v12, v1, Lcom/google/android/gms/measurement/internal/zzkn;->zzC:Lcom/google/android/gms/measurement/internal/zzkt;

    const/16 v14, 0x9

    const/4 v15, 0x0

    const/16 v16, 0x0

    const/16 v17, 0x0

    move-object v13, v10

    .line 111
    invoke-virtual/range {v11 .. v17}, Lcom/google/android/gms/measurement/internal/zzku;->zzM(Lcom/google/android/gms/measurement/internal/zzkt;Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;I)V

    goto :goto_f

    :cond_15
    move-object/from16 v33, v4

    move-object/from16 v8, v21

    goto/16 :goto_5

    :cond_16
    :goto_f
    iget-object v9, v2, Lcom/google/android/gms/measurement/internal/zzat;->zza:Ljava/lang/String;

    .line 112
    invoke-static {v9}, Lcom/google/android/gms/measurement/internal/zzku;->zzah(Ljava/lang/String;)Z

    move-result v9

    iget-object v11, v2, Lcom/google/android/gms/measurement/internal/zzat;->zza:Ljava/lang/String;

    .line 113
    invoke-virtual {v8, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    .line 114
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzv()Lcom/google/android/gms/measurement/internal/zzku;

    iget-object v11, v2, Lcom/google/android/gms/measurement/internal/zzat;->zzb:Lcom/google/android/gms/measurement/internal/zzar;

    if-nez v11, :cond_17

    const-wide/16 v16, 0x0

    goto :goto_11

    .line 181
    :cond_17
    new-instance v12, Lcom/google/android/gms/measurement/internal/zzaq;

    .line 115
    invoke-direct {v12, v11}, Lcom/google/android/gms/measurement/internal/zzaq;-><init>(Lcom/google/android/gms/measurement/internal/zzar;)V

    const-wide/16 v16, 0x0

    .line 116
    :cond_18
    :goto_10
    invoke-interface {v12}, Ljava/util/Iterator;->hasNext()Z

    move-result v13

    if-eqz v13, :cond_19

    .line 117
    invoke-virtual {v12}, Lcom/google/android/gms/measurement/internal/zzaq;->zza()Ljava/lang/String;

    move-result-object v13

    .line 118
    invoke-virtual {v11, v13}, Lcom/google/android/gms/measurement/internal/zzar;->zzf(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v13

    .line 119
    instance-of v14, v13, [Landroid/os/Parcelable;

    if-eqz v14, :cond_18

    .line 120
    check-cast v13, [Landroid/os/Parcelable;

    array-length v13, v13

    int-to-long v13, v13

    add-long v16, v16, v13

    goto :goto_10

    :cond_19
    :goto_11
    const-wide/16 v22, 0x1

    add-long v15, v16, v22

    .line 114
    iget-object v11, v1, Lcom/google/android/gms/measurement/internal/zzkn;->zze:Lcom/google/android/gms/measurement/internal/zzaj;

    .line 121
    invoke-static {v11}, Lcom/google/android/gms/measurement/internal/zzkn;->zzak(Lcom/google/android/gms/measurement/internal/zzkd;)Lcom/google/android/gms/measurement/internal/zzkd;

    .line 122
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzkn;->zza()J

    move-result-wide v12

    const/16 v17, 0x1

    const/16 v20, 0x0

    const/16 v21, 0x0

    move-object/from16 v30, v5

    const-wide/16 v4, 0x0

    move-object v14, v10

    move/from16 v18, v9

    move/from16 v19, v20

    move/from16 v20, v8

    .line 123
    invoke-virtual/range {v11 .. v21}, Lcom/google/android/gms/measurement/internal/zzaj;->zzm(JLjava/lang/String;JZZZZZ)Lcom/google/android/gms/measurement/internal/zzah;

    move-result-object v11

    iget-wide v12, v11, Lcom/google/android/gms/measurement/internal/zzah;->zzb:J

    .line 124
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzg()Lcom/google/android/gms/measurement/internal/zzaf;

    sget-object v14, Lcom/google/android/gms/measurement/internal/zzdw;->zzj:Lcom/google/android/gms/measurement/internal/zzdv;

    const/4 v15, 0x0

    .line 125
    invoke-virtual {v14, v15}, Lcom/google/android/gms/measurement/internal/zzdv;->zza(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v14

    check-cast v14, Ljava/lang/Integer;

    invoke-virtual {v14}, Ljava/lang/Integer;->intValue()I

    move-result v14

    int-to-long v4, v14

    sub-long/2addr v12, v4

    const-wide/16 v4, 0x3e8

    const-wide/16 v16, 0x0

    cmp-long v14, v12, v16

    if-lez v14, :cond_1b

    rem-long/2addr v12, v4

    cmp-long v2, v12, v22

    if-nez v2, :cond_1a

    .line 126
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzay()Lcom/google/android/gms/measurement/internal/zzei;

    move-result-object v2

    .line 127
    invoke-virtual {v2}, Lcom/google/android/gms/measurement/internal/zzei;->zzd()Lcom/google/android/gms/measurement/internal/zzeg;

    move-result-object v2

    const-string v3, "Data loss. Too many events logged. appId, count"

    invoke-static {v10}, Lcom/google/android/gms/measurement/internal/zzei;->zzn(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v4

    iget-wide v5, v11, Lcom/google/android/gms/measurement/internal/zzah;->zzb:J

    .line 128
    invoke-static {v5, v6}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v5

    .line 129
    invoke-virtual {v2, v3, v4, v5}, Lcom/google/android/gms/measurement/internal/zzeg;->zzc(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    :cond_1a
    iget-object v2, v1, Lcom/google/android/gms/measurement/internal/zzkn;->zze:Lcom/google/android/gms/measurement/internal/zzaj;

    .line 130
    invoke-static {v2}, Lcom/google/android/gms/measurement/internal/zzkn;->zzak(Lcom/google/android/gms/measurement/internal/zzkd;)Lcom/google/android/gms/measurement/internal/zzkd;

    .line 131
    invoke-virtual {v2}, Lcom/google/android/gms/measurement/internal/zzaj;->zzC()V
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_0

    iget-object v2, v1, Lcom/google/android/gms/measurement/internal/zzkn;->zze:Lcom/google/android/gms/measurement/internal/zzaj;

    .line 77
    invoke-static {v2}, Lcom/google/android/gms/measurement/internal/zzkn;->zzak(Lcom/google/android/gms/measurement/internal/zzkd;)Lcom/google/android/gms/measurement/internal/zzkd;

    .line 78
    invoke-virtual {v2}, Lcom/google/android/gms/measurement/internal/zzaj;->zzx()V

    return-void

    :cond_1b
    if-eqz v9, :cond_1d

    :try_start_8
    iget-wide v12, v11, Lcom/google/android/gms/measurement/internal/zzah;->zza:J

    .line 132
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzg()Lcom/google/android/gms/measurement/internal/zzaf;

    sget-object v14, Lcom/google/android/gms/measurement/internal/zzdw;->zzl:Lcom/google/android/gms/measurement/internal/zzdv;

    .line 133
    invoke-virtual {v14, v15}, Lcom/google/android/gms/measurement/internal/zzdv;->zza(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v14

    check-cast v14, Ljava/lang/Integer;

    invoke-virtual {v14}, Ljava/lang/Integer;->intValue()I

    move-result v14

    int-to-long v4, v14

    sub-long/2addr v12, v4

    const-wide/16 v4, 0x0

    cmp-long v14, v12, v4

    if-lez v14, :cond_1d

    const-wide/16 v4, 0x3e8

    rem-long/2addr v12, v4

    cmp-long v3, v12, v22

    if-nez v3, :cond_1c

    .line 366
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzay()Lcom/google/android/gms/measurement/internal/zzei;

    move-result-object v3

    .line 367
    invoke-virtual {v3}, Lcom/google/android/gms/measurement/internal/zzei;->zzd()Lcom/google/android/gms/measurement/internal/zzeg;

    move-result-object v3

    const-string v4, "Data loss. Too many public events logged. appId, count"

    invoke-static {v10}, Lcom/google/android/gms/measurement/internal/zzei;->zzn(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v5

    iget-wide v6, v11, Lcom/google/android/gms/measurement/internal/zzah;->zza:J

    .line 368
    invoke-static {v6, v7}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v6

    .line 369
    invoke-virtual {v3, v4, v5, v6}, Lcom/google/android/gms/measurement/internal/zzeg;->zzc(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 370
    :cond_1c
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzv()Lcom/google/android/gms/measurement/internal/zzku;

    move-result-object v11

    iget-object v12, v1, Lcom/google/android/gms/measurement/internal/zzkn;->zzC:Lcom/google/android/gms/measurement/internal/zzkt;

    const/16 v14, 0x10

    const-string v15, "_ev"

    iget-object v2, v2, Lcom/google/android/gms/measurement/internal/zzat;->zza:Ljava/lang/String;

    const/16 v17, 0x0

    move-object v13, v10

    move-object/from16 v16, v2

    .line 371
    invoke-virtual/range {v11 .. v17}, Lcom/google/android/gms/measurement/internal/zzku;->zzM(Lcom/google/android/gms/measurement/internal/zzkt;Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;I)V

    iget-object v2, v1, Lcom/google/android/gms/measurement/internal/zzkn;->zze:Lcom/google/android/gms/measurement/internal/zzaj;

    .line 372
    invoke-static {v2}, Lcom/google/android/gms/measurement/internal/zzkn;->zzak(Lcom/google/android/gms/measurement/internal/zzkd;)Lcom/google/android/gms/measurement/internal/zzkd;

    .line 373
    invoke-virtual {v2}, Lcom/google/android/gms/measurement/internal/zzaj;->zzC()V
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_0

    iget-object v2, v1, Lcom/google/android/gms/measurement/internal/zzkn;->zze:Lcom/google/android/gms/measurement/internal/zzaj;

    .line 77
    invoke-static {v2}, Lcom/google/android/gms/measurement/internal/zzkn;->zzak(Lcom/google/android/gms/measurement/internal/zzkd;)Lcom/google/android/gms/measurement/internal/zzkd;

    .line 78
    invoke-virtual {v2}, Lcom/google/android/gms/measurement/internal/zzaj;->zzx()V

    return-void

    :cond_1d
    const v4, 0xf4240

    if-eqz v8, :cond_1f

    :try_start_9
    iget-wide v12, v11, Lcom/google/android/gms/measurement/internal/zzah;->zzd:J

    .line 134
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzg()Lcom/google/android/gms/measurement/internal/zzaf;

    move-result-object v5

    iget-object v8, v3, Lcom/google/android/gms/measurement/internal/zzp;->zza:Ljava/lang/String;

    sget-object v14, Lcom/google/android/gms/measurement/internal/zzdw;->zzk:Lcom/google/android/gms/measurement/internal/zzdv;

    invoke-virtual {v5, v8, v14}, Lcom/google/android/gms/measurement/internal/zzaf;->zze(Ljava/lang/String;Lcom/google/android/gms/measurement/internal/zzdv;)I

    move-result v5

    .line 135
    invoke-static {v4, v5}, Ljava/lang/Math;->min(II)I

    move-result v5

    const/4 v8, 0x0

    .line 136
    invoke-static {v8, v5}, Ljava/lang/Math;->max(II)I

    move-result v5

    int-to-long v4, v5

    sub-long/2addr v12, v4

    const-wide/16 v4, 0x0

    cmp-long v14, v12, v4

    if-lez v14, :cond_1f

    cmp-long v2, v12, v22

    if-nez v2, :cond_1e

    .line 360
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzay()Lcom/google/android/gms/measurement/internal/zzei;

    move-result-object v2

    .line 361
    invoke-virtual {v2}, Lcom/google/android/gms/measurement/internal/zzei;->zzd()Lcom/google/android/gms/measurement/internal/zzeg;

    move-result-object v2

    const-string v3, "Too many error events logged. appId, count"

    invoke-static {v10}, Lcom/google/android/gms/measurement/internal/zzei;->zzn(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v4

    iget-wide v5, v11, Lcom/google/android/gms/measurement/internal/zzah;->zzd:J

    .line 362
    invoke-static {v5, v6}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v5

    .line 363
    invoke-virtual {v2, v3, v4, v5}, Lcom/google/android/gms/measurement/internal/zzeg;->zzc(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    :cond_1e
    iget-object v2, v1, Lcom/google/android/gms/measurement/internal/zzkn;->zze:Lcom/google/android/gms/measurement/internal/zzaj;

    .line 364
    invoke-static {v2}, Lcom/google/android/gms/measurement/internal/zzkn;->zzak(Lcom/google/android/gms/measurement/internal/zzkd;)Lcom/google/android/gms/measurement/internal/zzkd;

    .line 365
    invoke-virtual {v2}, Lcom/google/android/gms/measurement/internal/zzaj;->zzC()V
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_0

    iget-object v2, v1, Lcom/google/android/gms/measurement/internal/zzkn;->zze:Lcom/google/android/gms/measurement/internal/zzaj;

    .line 77
    invoke-static {v2}, Lcom/google/android/gms/measurement/internal/zzkn;->zzak(Lcom/google/android/gms/measurement/internal/zzkd;)Lcom/google/android/gms/measurement/internal/zzkd;

    .line 78
    invoke-virtual {v2}, Lcom/google/android/gms/measurement/internal/zzaj;->zzx()V

    return-void

    :cond_1f
    :try_start_a
    iget-object v4, v2, Lcom/google/android/gms/measurement/internal/zzat;->zzb:Lcom/google/android/gms/measurement/internal/zzar;

    .line 137
    invoke-virtual {v4}, Lcom/google/android/gms/measurement/internal/zzar;->zzc()Landroid/os/Bundle;

    move-result-object v4

    .line 138
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzv()Lcom/google/android/gms/measurement/internal/zzku;

    move-result-object v5

    const-string v11, "_o"

    iget-object v12, v2, Lcom/google/android/gms/measurement/internal/zzat;->zzc:Ljava/lang/String;

    invoke-virtual {v5, v4, v11, v12}, Lcom/google/android/gms/measurement/internal/zzku;->zzN(Landroid/os/Bundle;Ljava/lang/String;Ljava/lang/Object;)V

    .line 139
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzv()Lcom/google/android/gms/measurement/internal/zzku;

    move-result-object v5

    invoke-virtual {v5, v10}, Lcom/google/android/gms/measurement/internal/zzku;->zzad(Ljava/lang/String;)Z

    move-result v5
    :try_end_a
    .catchall {:try_start_a .. :try_end_a} :catchall_0

    const-string v14, "_r"

    if-eqz v5, :cond_20

    .line 140
    :try_start_b
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzv()Lcom/google/android/gms/measurement/internal/zzku;

    move-result-object v5

    invoke-static/range {v22 .. v23}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v11

    const-string v12, "_dbg"

    invoke-virtual {v5, v4, v12, v11}, Lcom/google/android/gms/measurement/internal/zzku;->zzN(Landroid/os/Bundle;Ljava/lang/String;Ljava/lang/Object;)V

    .line 141
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzv()Lcom/google/android/gms/measurement/internal/zzku;

    move-result-object v5

    invoke-virtual {v5, v4, v14, v11}, Lcom/google/android/gms/measurement/internal/zzku;->zzN(Landroid/os/Bundle;Ljava/lang/String;Ljava/lang/Object;)V

    :cond_20
    const-string v5, "_s"

    iget-object v11, v2, Lcom/google/android/gms/measurement/internal/zzat;->zza:Ljava/lang/String;

    .line 142
    invoke-virtual {v5, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_21

    iget-object v5, v1, Lcom/google/android/gms/measurement/internal/zzkn;->zze:Lcom/google/android/gms/measurement/internal/zzaj;

    .line 143
    invoke-static {v5}, Lcom/google/android/gms/measurement/internal/zzkn;->zzak(Lcom/google/android/gms/measurement/internal/zzkd;)Lcom/google/android/gms/measurement/internal/zzkd;

    .line 144
    iget-object v11, v3, Lcom/google/android/gms/measurement/internal/zzp;->zza:Ljava/lang/String;

    .line 145
    invoke-virtual {v5, v11, v7}, Lcom/google/android/gms/measurement/internal/zzaj;->zzp(Ljava/lang/String;Ljava/lang/String;)Lcom/google/android/gms/measurement/internal/zzks;

    move-result-object v5

    if-eqz v5, :cond_21

    iget-object v11, v5, Lcom/google/android/gms/measurement/internal/zzks;->zze:Ljava/lang/Object;

    .line 146
    instance-of v11, v11, Ljava/lang/Long;

    if-eqz v11, :cond_21

    .line 147
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzv()Lcom/google/android/gms/measurement/internal/zzku;

    move-result-object v11

    iget-object v5, v5, Lcom/google/android/gms/measurement/internal/zzks;->zze:Ljava/lang/Object;

    invoke-virtual {v11, v4, v7, v5}, Lcom/google/android/gms/measurement/internal/zzku;->zzN(Landroid/os/Bundle;Ljava/lang/String;Ljava/lang/Object;)V

    :cond_21
    iget-object v5, v1, Lcom/google/android/gms/measurement/internal/zzkn;->zze:Lcom/google/android/gms/measurement/internal/zzaj;

    .line 148
    invoke-static {v5}, Lcom/google/android/gms/measurement/internal/zzkn;->zzak(Lcom/google/android/gms/measurement/internal/zzkd;)Lcom/google/android/gms/measurement/internal/zzkd;

    .line 149
    invoke-static {v10}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotEmpty(Ljava/lang/String;)Ljava/lang/String;

    .line 150
    invoke-virtual {v5}, Lcom/google/android/gms/measurement/internal/zzgl;->zzg()V

    .line 151
    invoke-virtual {v5}, Lcom/google/android/gms/measurement/internal/zzkd;->zzY()V
    :try_end_b
    .catchall {:try_start_b .. :try_end_b} :catchall_0

    .line 152
    :try_start_c
    invoke-virtual {v5}, Lcom/google/android/gms/measurement/internal/zzaj;->zzh()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v7

    iget-object v11, v5, Lcom/google/android/gms/measurement/internal/zzgl;->zzs:Lcom/google/android/gms/measurement/internal/zzfs;

    .line 153
    invoke-virtual {v11}, Lcom/google/android/gms/measurement/internal/zzfs;->zzf()Lcom/google/android/gms/measurement/internal/zzaf;

    move-result-object v11

    sget-object v12, Lcom/google/android/gms/measurement/internal/zzdw;->zzo:Lcom/google/android/gms/measurement/internal/zzdv;

    .line 154
    invoke-virtual {v11, v10, v12}, Lcom/google/android/gms/measurement/internal/zzaf;->zze(Ljava/lang/String;Lcom/google/android/gms/measurement/internal/zzdv;)I

    move-result v11

    const v8, 0xf4240

    .line 155
    invoke-static {v8, v11}, Ljava/lang/Math;->min(II)I

    move-result v8
    :try_end_c
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_c .. :try_end_c} :catch_4
    .catchall {:try_start_c .. :try_end_c} :catchall_0

    const/4 v13, 0x0

    .line 156
    :try_start_d
    invoke-static {v13, v8}, Ljava/lang/Math;->max(II)I

    move-result v8

    .line 154
    invoke-static {v8}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v8

    const/4 v11, 0x2

    new-array v11, v11, [Ljava/lang/String;

    aput-object v10, v11, v13

    const/4 v12, 0x1

    aput-object v8, v11, v12

    const-string v8, "rowid in (select rowid from raw_events where app_id=? order by rowid desc limit -1 offset ?)"

    .line 157
    invoke-virtual {v7, v6, v8, v11}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v5
    :try_end_d
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_d .. :try_end_d} :catch_3
    .catchall {:try_start_d .. :try_end_d} :catchall_0

    int-to-long v7, v5

    goto :goto_13

    :catch_3
    move-exception v0

    goto :goto_12

    :catch_4
    move-exception v0

    const/4 v13, 0x0

    :goto_12
    move-object v7, v0

    .line 98
    :try_start_e
    iget-object v5, v5, Lcom/google/android/gms/measurement/internal/zzgl;->zzs:Lcom/google/android/gms/measurement/internal/zzfs;

    .line 158
    invoke-virtual {v5}, Lcom/google/android/gms/measurement/internal/zzfs;->zzay()Lcom/google/android/gms/measurement/internal/zzei;

    move-result-object v5

    .line 159
    invoke-virtual {v5}, Lcom/google/android/gms/measurement/internal/zzei;->zzd()Lcom/google/android/gms/measurement/internal/zzeg;

    move-result-object v5

    const-string v8, "Error deleting over the limit events. appId"

    invoke-static {v10}, Lcom/google/android/gms/measurement/internal/zzei;->zzn(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v11

    .line 160
    invoke-virtual {v5, v8, v11, v7}, Lcom/google/android/gms/measurement/internal/zzeg;->zzc(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    const-wide/16 v7, 0x0

    :goto_13
    const-wide/16 v11, 0x0

    cmp-long v5, v7, v11

    if-lez v5, :cond_22

    .line 161
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzay()Lcom/google/android/gms/measurement/internal/zzei;

    move-result-object v5

    .line 162
    invoke-virtual {v5}, Lcom/google/android/gms/measurement/internal/zzei;->zzk()Lcom/google/android/gms/measurement/internal/zzeg;

    move-result-object v5

    const-string v11, "Data lost. Too many events stored on disk, deleted. appId"

    invoke-static {v10}, Lcom/google/android/gms/measurement/internal/zzei;->zzn(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v12

    .line 163
    invoke-static {v7, v8}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v7

    .line 164
    invoke-virtual {v5, v11, v12, v7}, Lcom/google/android/gms/measurement/internal/zzeg;->zzc(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    :cond_22
    new-instance v5, Lcom/google/android/gms/measurement/internal/zzao;

    iget-object v12, v1, Lcom/google/android/gms/measurement/internal/zzkn;->zzn:Lcom/google/android/gms/measurement/internal/zzfs;

    iget-object v7, v2, Lcom/google/android/gms/measurement/internal/zzat;->zzc:Ljava/lang/String;

    iget-object v8, v2, Lcom/google/android/gms/measurement/internal/zzat;->zza:Ljava/lang/String;

    iget-wide v2, v2, Lcom/google/android/gms/measurement/internal/zzat;->zzd:J

    const-wide/16 v18, 0x0

    move-object v11, v5

    const/16 v31, 0x0

    move-object v13, v7

    move-object v7, v14

    move-object v14, v10

    move-object/from16 v32, v6

    move-object v6, v15

    move-object v15, v8

    move-wide/from16 v16, v2

    move-object/from16 v20, v4

    .line 165
    invoke-direct/range {v11 .. v20}, Lcom/google/android/gms/measurement/internal/zzao;-><init>(Lcom/google/android/gms/measurement/internal/zzfs;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;JJLandroid/os/Bundle;)V

    iget-object v2, v1, Lcom/google/android/gms/measurement/internal/zzkn;->zze:Lcom/google/android/gms/measurement/internal/zzaj;

    .line 166
    invoke-static {v2}, Lcom/google/android/gms/measurement/internal/zzkn;->zzak(Lcom/google/android/gms/measurement/internal/zzkd;)Lcom/google/android/gms/measurement/internal/zzkd;

    iget-object v3, v5, Lcom/google/android/gms/measurement/internal/zzao;->zzb:Ljava/lang/String;

    .line 167
    invoke-virtual {v2, v10, v3}, Lcom/google/android/gms/measurement/internal/zzaj;->zzn(Ljava/lang/String;Ljava/lang/String;)Lcom/google/android/gms/measurement/internal/zzap;

    move-result-object v2

    if-nez v2, :cond_24

    iget-object v2, v1, Lcom/google/android/gms/measurement/internal/zzkn;->zze:Lcom/google/android/gms/measurement/internal/zzaj;

    .line 168
    invoke-static {v2}, Lcom/google/android/gms/measurement/internal/zzkn;->zzak(Lcom/google/android/gms/measurement/internal/zzkd;)Lcom/google/android/gms/measurement/internal/zzkd;

    .line 169
    invoke-virtual {v2, v10}, Lcom/google/android/gms/measurement/internal/zzaj;->zzf(Ljava/lang/String;)J

    move-result-wide v2

    .line 170
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzg()Lcom/google/android/gms/measurement/internal/zzaf;

    move-result-object v4

    invoke-virtual {v4, v10}, Lcom/google/android/gms/measurement/internal/zzaf;->zzb(Ljava/lang/String;)I

    move-result v4

    int-to-long v11, v4

    cmp-long v4, v2, v11

    if-ltz v4, :cond_23

    if-eqz v9, :cond_23

    .line 172
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzay()Lcom/google/android/gms/measurement/internal/zzei;

    move-result-object v2

    .line 173
    invoke-virtual {v2}, Lcom/google/android/gms/measurement/internal/zzei;->zzd()Lcom/google/android/gms/measurement/internal/zzeg;

    move-result-object v2

    const-string v3, "Too many event names used, ignoring event. appId, name, supported count"

    invoke-static {v10}, Lcom/google/android/gms/measurement/internal/zzei;->zzn(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v4

    iget-object v6, v1, Lcom/google/android/gms/measurement/internal/zzkn;->zzn:Lcom/google/android/gms/measurement/internal/zzfs;

    .line 174
    invoke-virtual {v6}, Lcom/google/android/gms/measurement/internal/zzfs;->zzj()Lcom/google/android/gms/measurement/internal/zzed;

    move-result-object v6

    iget-object v5, v5, Lcom/google/android/gms/measurement/internal/zzao;->zzb:Ljava/lang/String;

    .line 175
    invoke-virtual {v6, v5}, Lcom/google/android/gms/measurement/internal/zzed;->zzc(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 176
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzg()Lcom/google/android/gms/measurement/internal/zzaf;

    move-result-object v6

    invoke-virtual {v6, v10}, Lcom/google/android/gms/measurement/internal/zzaf;->zzb(Ljava/lang/String;)I

    move-result v6

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    .line 177
    invoke-virtual {v2, v3, v4, v5, v6}, Lcom/google/android/gms/measurement/internal/zzeg;->zzd(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 178
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzv()Lcom/google/android/gms/measurement/internal/zzku;

    move-result-object v11

    iget-object v12, v1, Lcom/google/android/gms/measurement/internal/zzkn;->zzC:Lcom/google/android/gms/measurement/internal/zzkt;

    const/16 v14, 0x8

    const/4 v15, 0x0

    const/16 v16, 0x0

    const/16 v17, 0x0

    move-object v13, v10

    .line 179
    invoke-virtual/range {v11 .. v17}, Lcom/google/android/gms/measurement/internal/zzku;->zzM(Lcom/google/android/gms/measurement/internal/zzkt;Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;I)V
    :try_end_e
    .catchall {:try_start_e .. :try_end_e} :catchall_0

    iget-object v2, v1, Lcom/google/android/gms/measurement/internal/zzkn;->zze:Lcom/google/android/gms/measurement/internal/zzaj;

    .line 77
    invoke-static {v2}, Lcom/google/android/gms/measurement/internal/zzkn;->zzak(Lcom/google/android/gms/measurement/internal/zzkd;)Lcom/google/android/gms/measurement/internal/zzkd;

    .line 78
    invoke-virtual {v2}, Lcom/google/android/gms/measurement/internal/zzaj;->zzx()V

    return-void

    :cond_23
    :try_start_f
    new-instance v2, Lcom/google/android/gms/measurement/internal/zzap;

    iget-object v13, v5, Lcom/google/android/gms/measurement/internal/zzao;->zzb:Ljava/lang/String;

    iget-wide v3, v5, Lcom/google/android/gms/measurement/internal/zzao;->zzd:J

    const-wide/16 v14, 0x0

    const-wide/16 v16, 0x0

    const-wide/16 v18, 0x0

    const-wide/16 v22, 0x0

    const/16 v24, 0x0

    const/16 v25, 0x0

    const/16 v26, 0x0

    const/16 v27, 0x0

    move-object v11, v2

    move-object v12, v10

    move-wide/from16 v20, v3

    .line 171
    invoke-direct/range {v11 .. v27}, Lcom/google/android/gms/measurement/internal/zzap;-><init>(Ljava/lang/String;Ljava/lang/String;JJJJJLjava/lang/Long;Ljava/lang/Long;Ljava/lang/Long;Ljava/lang/Boolean;)V

    goto :goto_14

    .line 208
    :cond_24
    iget-object v3, v1, Lcom/google/android/gms/measurement/internal/zzkn;->zzn:Lcom/google/android/gms/measurement/internal/zzfs;

    iget-wide v8, v2, Lcom/google/android/gms/measurement/internal/zzap;->zzf:J

    .line 180
    invoke-virtual {v5, v3, v8, v9}, Lcom/google/android/gms/measurement/internal/zzao;->zza(Lcom/google/android/gms/measurement/internal/zzfs;J)Lcom/google/android/gms/measurement/internal/zzao;

    move-result-object v5

    iget-wide v3, v5, Lcom/google/android/gms/measurement/internal/zzao;->zzd:J

    .line 181
    invoke-virtual {v2, v3, v4}, Lcom/google/android/gms/measurement/internal/zzap;->zzc(J)Lcom/google/android/gms/measurement/internal/zzap;

    move-result-object v2

    .line 171
    :goto_14
    iget-object v3, v1, Lcom/google/android/gms/measurement/internal/zzkn;->zze:Lcom/google/android/gms/measurement/internal/zzaj;

    .line 182
    invoke-static {v3}, Lcom/google/android/gms/measurement/internal/zzkn;->zzak(Lcom/google/android/gms/measurement/internal/zzkd;)Lcom/google/android/gms/measurement/internal/zzkd;

    .line 183
    invoke-virtual {v3, v2}, Lcom/google/android/gms/measurement/internal/zzaj;->zzE(Lcom/google/android/gms/measurement/internal/zzap;)V

    .line 184
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzaz()Lcom/google/android/gms/measurement/internal/zzfp;

    move-result-object v2

    invoke-virtual {v2}, Lcom/google/android/gms/measurement/internal/zzgl;->zzg()V

    .line 185
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzB()V

    .line 186
    invoke-static {v5}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 187
    invoke-static/range {p2 .. p2}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v2, v5, Lcom/google/android/gms/measurement/internal/zzao;->zza:Ljava/lang/String;

    .line 188
    invoke-static {v2}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotEmpty(Ljava/lang/String;)Ljava/lang/String;

    iget-object v2, v5, Lcom/google/android/gms/measurement/internal/zzao;->zza:Ljava/lang/String;

    move-object/from16 v3, p2

    .line 189
    iget-object v4, v3, Lcom/google/android/gms/measurement/internal/zzp;->zza:Ljava/lang/String;

    invoke-virtual {v2, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    invoke-static {v2}, Lcom/google/android/gms/common/internal/Preconditions;->checkArgument(Z)V

    .line 190
    invoke-static {}, Lcom/google/android/gms/internal/measurement/zzfy;->zzu()Lcom/google/android/gms/internal/measurement/zzfx;

    move-result-object v2

    const/4 v4, 0x1

    invoke-virtual {v2, v4}, Lcom/google/android/gms/internal/measurement/zzfx;->zzaa(I)Lcom/google/android/gms/internal/measurement/zzfx;

    const-string v8, "android"

    invoke-virtual {v2, v8}, Lcom/google/android/gms/internal/measurement/zzfx;->zzW(Ljava/lang/String;)Lcom/google/android/gms/internal/measurement/zzfx;

    .line 191
    iget-object v8, v3, Lcom/google/android/gms/measurement/internal/zzp;->zza:Ljava/lang/String;

    invoke-static {v8}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v8

    if-nez v8, :cond_25

    .line 192
    iget-object v8, v3, Lcom/google/android/gms/measurement/internal/zzp;->zza:Ljava/lang/String;

    invoke-virtual {v2, v8}, Lcom/google/android/gms/internal/measurement/zzfx;->zzA(Ljava/lang/String;)Lcom/google/android/gms/internal/measurement/zzfx;

    .line 193
    :cond_25
    iget-object v8, v3, Lcom/google/android/gms/measurement/internal/zzp;->zzd:Ljava/lang/String;

    invoke-static {v8}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v8

    if-nez v8, :cond_26

    .line 194
    iget-object v8, v3, Lcom/google/android/gms/measurement/internal/zzp;->zzd:Ljava/lang/String;

    invoke-virtual {v2, v8}, Lcom/google/android/gms/internal/measurement/zzfx;->zzC(Ljava/lang/String;)Lcom/google/android/gms/internal/measurement/zzfx;

    .line 195
    :cond_26
    iget-object v8, v3, Lcom/google/android/gms/measurement/internal/zzp;->zzc:Ljava/lang/String;

    invoke-static {v8}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v8

    if-nez v8, :cond_27

    .line 196
    iget-object v8, v3, Lcom/google/android/gms/measurement/internal/zzp;->zzc:Ljava/lang/String;

    invoke-virtual {v2, v8}, Lcom/google/android/gms/internal/measurement/zzfx;->zzD(Ljava/lang/String;)Lcom/google/android/gms/internal/measurement/zzfx;

    .line 197
    :cond_27
    iget-wide v8, v3, Lcom/google/android/gms/measurement/internal/zzp;->zzj:J

    const-wide/32 v10, -0x80000000

    cmp-long v12, v8, v10

    if-eqz v12, :cond_28

    long-to-int v9, v8

    .line 198
    invoke-virtual {v2, v9}, Lcom/google/android/gms/internal/measurement/zzfx;->zzE(I)Lcom/google/android/gms/internal/measurement/zzfx;

    .line 199
    :cond_28
    iget-wide v8, v3, Lcom/google/android/gms/measurement/internal/zzp;->zze:J

    invoke-virtual {v2, v8, v9}, Lcom/google/android/gms/internal/measurement/zzfx;->zzS(J)Lcom/google/android/gms/internal/measurement/zzfx;

    .line 200
    iget-object v8, v3, Lcom/google/android/gms/measurement/internal/zzp;->zzb:Ljava/lang/String;

    invoke-static {v8}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v8

    if-nez v8, :cond_29

    .line 201
    iget-object v8, v3, Lcom/google/android/gms/measurement/internal/zzp;->zzb:Ljava/lang/String;

    invoke-virtual {v2, v8}, Lcom/google/android/gms/internal/measurement/zzfx;->zzR(Ljava/lang/String;)Lcom/google/android/gms/internal/measurement/zzfx;

    .line 202
    :cond_29
    iget-object v8, v3, Lcom/google/android/gms/measurement/internal/zzp;->zza:Ljava/lang/String;

    .line 203
    invoke-static {v8}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/String;

    invoke-virtual {v1, v8}, Lcom/google/android/gms/measurement/internal/zzkn;->zzh(Ljava/lang/String;)Lcom/google/android/gms/measurement/internal/zzag;

    move-result-object v8

    iget-object v9, v3, Lcom/google/android/gms/measurement/internal/zzp;->zzv:Ljava/lang/String;

    .line 204
    invoke-static {v9}, Lcom/google/android/gms/measurement/internal/zzag;->zzb(Ljava/lang/String;)Lcom/google/android/gms/measurement/internal/zzag;

    move-result-object v9

    invoke-virtual {v8, v9}, Lcom/google/android/gms/measurement/internal/zzag;->zzc(Lcom/google/android/gms/measurement/internal/zzag;)Lcom/google/android/gms/measurement/internal/zzag;

    move-result-object v8

    .line 205
    invoke-virtual {v8}, Lcom/google/android/gms/measurement/internal/zzag;->zzi()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v2, v8}, Lcom/google/android/gms/internal/measurement/zzfx;->zzI(Ljava/lang/String;)Lcom/google/android/gms/internal/measurement/zzfx;

    .line 206
    invoke-static {}, Lcom/google/android/gms/internal/measurement/zzoq;->zzc()Z

    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzg()Lcom/google/android/gms/measurement/internal/zzaf;

    move-result-object v8

    iget-object v9, v3, Lcom/google/android/gms/measurement/internal/zzp;->zza:Ljava/lang/String;

    sget-object v10, Lcom/google/android/gms/measurement/internal/zzdw;->zzad:Lcom/google/android/gms/measurement/internal/zzdv;

    invoke-virtual {v8, v9, v10}, Lcom/google/android/gms/measurement/internal/zzaf;->zzs(Ljava/lang/String;Lcom/google/android/gms/measurement/internal/zzdv;)Z

    move-result v8

    if-eqz v8, :cond_2b

    .line 209
    invoke-virtual {v2}, Lcom/google/android/gms/internal/measurement/zzfx;->zzan()Ljava/lang/String;

    move-result-object v8

    invoke-static {v8}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v8

    if-eqz v8, :cond_2a

    iget-object v8, v3, Lcom/google/android/gms/measurement/internal/zzp;->zzu:Ljava/lang/String;

    invoke-static {v8}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v8

    if-nez v8, :cond_2a

    .line 210
    iget-object v8, v3, Lcom/google/android/gms/measurement/internal/zzp;->zzu:Ljava/lang/String;

    invoke-virtual {v2, v8}, Lcom/google/android/gms/internal/measurement/zzfx;->zzQ(Ljava/lang/String;)Lcom/google/android/gms/internal/measurement/zzfx;

    .line 211
    :cond_2a
    invoke-virtual {v2}, Lcom/google/android/gms/internal/measurement/zzfx;->zzan()Ljava/lang/String;

    move-result-object v8

    invoke-static {v8}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v8

    if-eqz v8, :cond_2c

    .line 212
    invoke-virtual {v2}, Lcom/google/android/gms/internal/measurement/zzfx;->zzam()Ljava/lang/String;

    move-result-object v8

    invoke-static {v8}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v8

    if-eqz v8, :cond_2c

    iget-object v8, v3, Lcom/google/android/gms/measurement/internal/zzp;->zzq:Ljava/lang/String;

    .line 213
    invoke-static {v8}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v8

    if-nez v8, :cond_2c

    .line 214
    iget-object v8, v3, Lcom/google/android/gms/measurement/internal/zzp;->zzq:Ljava/lang/String;

    invoke-virtual {v2, v8}, Lcom/google/android/gms/internal/measurement/zzfx;->zzy(Ljava/lang/String;)Lcom/google/android/gms/internal/measurement/zzfx;

    goto :goto_15

    .line 207
    :cond_2b
    invoke-virtual {v2}, Lcom/google/android/gms/internal/measurement/zzfx;->zzan()Ljava/lang/String;

    move-result-object v8

    invoke-static {v8}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v8

    if-eqz v8, :cond_2c

    iget-object v8, v3, Lcom/google/android/gms/measurement/internal/zzp;->zzq:Ljava/lang/String;

    invoke-static {v8}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v8

    if-nez v8, :cond_2c

    .line 208
    iget-object v8, v3, Lcom/google/android/gms/measurement/internal/zzp;->zzq:Ljava/lang/String;

    invoke-virtual {v2, v8}, Lcom/google/android/gms/internal/measurement/zzfx;->zzy(Ljava/lang/String;)Lcom/google/android/gms/internal/measurement/zzfx;

    .line 215
    :cond_2c
    :goto_15
    iget-wide v8, v3, Lcom/google/android/gms/measurement/internal/zzp;->zzf:J

    const-wide/16 v10, 0x0

    cmp-long v12, v8, v10

    if-eqz v12, :cond_2d

    .line 216
    invoke-virtual {v2, v8, v9}, Lcom/google/android/gms/internal/measurement/zzfx;->zzJ(J)Lcom/google/android/gms/internal/measurement/zzfx;

    .line 217
    :cond_2d
    iget-wide v8, v3, Lcom/google/android/gms/measurement/internal/zzp;->zzs:J

    invoke-virtual {v2, v8, v9}, Lcom/google/android/gms/internal/measurement/zzfx;->zzM(J)Lcom/google/android/gms/internal/measurement/zzfx;

    iget-object v8, v1, Lcom/google/android/gms/measurement/internal/zzkn;->zzi:Lcom/google/android/gms/measurement/internal/zzkp;

    .line 218
    invoke-static {v8}, Lcom/google/android/gms/measurement/internal/zzkn;->zzak(Lcom/google/android/gms/measurement/internal/zzkd;)Lcom/google/android/gms/measurement/internal/zzkd;

    iget-object v9, v8, Lcom/google/android/gms/measurement/internal/zzkp;->zzf:Lcom/google/android/gms/measurement/internal/zzkn;

    iget-object v9, v9, Lcom/google/android/gms/measurement/internal/zzkn;->zzn:Lcom/google/android/gms/measurement/internal/zzfs;

    .line 219
    invoke-virtual {v9}, Lcom/google/android/gms/measurement/internal/zzfs;->zzau()Landroid/content/Context;

    move-result-object v9

    .line 220
    invoke-static {v9}, Lcom/google/android/gms/measurement/internal/zzdw;->zzc(Landroid/content/Context;)Ljava/util/Map;

    move-result-object v9

    if-eqz v9, :cond_31

    .line 221
    invoke-interface {v9}, Ljava/util/Map;->size()I

    move-result v10

    if-nez v10, :cond_2e

    goto/16 :goto_18

    .line 331
    :cond_2e
    new-instance v14, Ljava/util/ArrayList;

    .line 222
    invoke-direct {v14}, Ljava/util/ArrayList;-><init>()V

    sget-object v10, Lcom/google/android/gms/measurement/internal/zzdw;->zzO:Lcom/google/android/gms/measurement/internal/zzdv;

    .line 223
    invoke-virtual {v10, v6}, Lcom/google/android/gms/measurement/internal/zzdv;->zza(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Ljava/lang/Integer;

    invoke-virtual {v10}, Ljava/lang/Integer;->intValue()I

    move-result v10

    .line 224
    invoke-interface {v9}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v9

    invoke-interface {v9}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v9

    :cond_2f
    :goto_16
    invoke-interface {v9}, Ljava/util/Iterator;->hasNext()Z

    move-result v11

    if-eqz v11, :cond_30

    invoke-interface {v9}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Ljava/util/Map$Entry;

    .line 225
    invoke-interface {v11}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Ljava/lang/String;

    const-string v13, "measurement.id."

    invoke-virtual {v12, v13}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v12
    :try_end_f
    .catchall {:try_start_f .. :try_end_f} :catchall_0

    if-eqz v12, :cond_2f

    .line 226
    :try_start_10
    invoke-interface {v11}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Ljava/lang/String;

    invoke-static {v11}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v11

    if-eqz v11, :cond_2f

    .line 227
    invoke-static {v11}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v11

    invoke-interface {v14, v11}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 228
    invoke-interface {v14}, Ljava/util/List;->size()I

    move-result v11

    if-lt v11, v10, :cond_2f

    iget-object v11, v8, Lcom/google/android/gms/measurement/internal/zzgl;->zzs:Lcom/google/android/gms/measurement/internal/zzfs;

    .line 229
    invoke-virtual {v11}, Lcom/google/android/gms/measurement/internal/zzfs;->zzay()Lcom/google/android/gms/measurement/internal/zzei;

    move-result-object v11

    .line 230
    invoke-virtual {v11}, Lcom/google/android/gms/measurement/internal/zzei;->zzk()Lcom/google/android/gms/measurement/internal/zzeg;

    move-result-object v11

    const-string v12, "Too many experiment IDs. Number of IDs"

    .line 231
    invoke-interface {v14}, Ljava/util/List;->size()I

    move-result v13

    invoke-static {v13}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v13

    invoke-virtual {v11, v12, v13}, Lcom/google/android/gms/measurement/internal/zzeg;->zzb(Ljava/lang/String;Ljava/lang/Object;)V
    :try_end_10
    .catch Ljava/lang/NumberFormatException; {:try_start_10 .. :try_end_10} :catch_5
    .catchall {:try_start_10 .. :try_end_10} :catchall_0

    goto :goto_17

    :catch_5
    move-exception v0

    move-object v11, v0

    .line 352
    :try_start_11
    iget-object v12, v8, Lcom/google/android/gms/measurement/internal/zzgl;->zzs:Lcom/google/android/gms/measurement/internal/zzfs;

    .line 232
    invoke-virtual {v12}, Lcom/google/android/gms/measurement/internal/zzfs;->zzay()Lcom/google/android/gms/measurement/internal/zzei;

    move-result-object v12

    .line 233
    invoke-virtual {v12}, Lcom/google/android/gms/measurement/internal/zzei;->zzk()Lcom/google/android/gms/measurement/internal/zzeg;

    move-result-object v12

    const-string v13, "Experiment ID NumberFormatException"

    invoke-virtual {v12, v13, v11}, Lcom/google/android/gms/measurement/internal/zzeg;->zzb(Ljava/lang/String;Ljava/lang/Object;)V

    goto :goto_16

    .line 234
    :cond_30
    :goto_17
    invoke-interface {v14}, Ljava/util/List;->size()I

    move-result v8

    if-nez v8, :cond_32

    :cond_31
    :goto_18
    move-object v14, v6

    :cond_32
    if-eqz v14, :cond_33

    .line 235
    invoke-virtual {v2, v14}, Lcom/google/android/gms/internal/measurement/zzfx;->zzh(Ljava/lang/Iterable;)Lcom/google/android/gms/internal/measurement/zzfx;

    .line 236
    :cond_33
    iget-object v8, v3, Lcom/google/android/gms/measurement/internal/zzp;->zza:Ljava/lang/String;

    .line 237
    invoke-static {v8}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/String;

    invoke-virtual {v1, v8}, Lcom/google/android/gms/measurement/internal/zzkn;->zzh(Ljava/lang/String;)Lcom/google/android/gms/measurement/internal/zzag;

    move-result-object v8

    iget-object v9, v3, Lcom/google/android/gms/measurement/internal/zzp;->zzv:Ljava/lang/String;

    .line 238
    invoke-static {v9}, Lcom/google/android/gms/measurement/internal/zzag;->zzb(Ljava/lang/String;)Lcom/google/android/gms/measurement/internal/zzag;

    move-result-object v9

    invoke-virtual {v8, v9}, Lcom/google/android/gms/measurement/internal/zzag;->zzc(Lcom/google/android/gms/measurement/internal/zzag;)Lcom/google/android/gms/measurement/internal/zzag;

    move-result-object v8

    .line 239
    invoke-virtual {v8}, Lcom/google/android/gms/measurement/internal/zzag;->zzj()Z

    move-result v9

    if-eqz v9, :cond_34

    iget-object v9, v1, Lcom/google/android/gms/measurement/internal/zzkn;->zzk:Lcom/google/android/gms/measurement/internal/zzjk;

    .line 240
    iget-object v10, v3, Lcom/google/android/gms/measurement/internal/zzp;->zza:Ljava/lang/String;

    .line 241
    invoke-virtual {v9, v10, v8}, Lcom/google/android/gms/measurement/internal/zzjk;->zzd(Ljava/lang/String;Lcom/google/android/gms/measurement/internal/zzag;)Landroid/util/Pair;

    move-result-object v9

    .line 242
    iget-object v10, v9, Landroid/util/Pair;->first:Ljava/lang/Object;

    check-cast v10, Ljava/lang/CharSequence;

    invoke-static {v10}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v10

    if-nez v10, :cond_34

    .line 243
    iget-boolean v10, v3, Lcom/google/android/gms/measurement/internal/zzp;->zzo:Z

    if-eqz v10, :cond_34

    .line 244
    iget-object v10, v9, Landroid/util/Pair;->first:Ljava/lang/Object;

    check-cast v10, Ljava/lang/String;

    invoke-virtual {v2, v10}, Lcom/google/android/gms/internal/measurement/zzfx;->zzab(Ljava/lang/String;)Lcom/google/android/gms/internal/measurement/zzfx;

    .line 245
    iget-object v10, v9, Landroid/util/Pair;->second:Ljava/lang/Object;

    if-eqz v10, :cond_34

    .line 246
    iget-object v9, v9, Landroid/util/Pair;->second:Ljava/lang/Object;

    check-cast v9, Ljava/lang/Boolean;

    invoke-virtual {v9}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v9

    invoke-virtual {v2, v9}, Lcom/google/android/gms/internal/measurement/zzfx;->zzU(Z)Lcom/google/android/gms/internal/measurement/zzfx;

    :cond_34
    iget-object v9, v1, Lcom/google/android/gms/measurement/internal/zzkn;->zzn:Lcom/google/android/gms/measurement/internal/zzfs;

    .line 247
    invoke-virtual {v9}, Lcom/google/android/gms/measurement/internal/zzfs;->zzg()Lcom/google/android/gms/measurement/internal/zzan;

    move-result-object v9

    .line 248
    invoke-virtual {v9}, Lcom/google/android/gms/measurement/internal/zzgm;->zzu()V

    sget-object v9, Landroid/os/Build;->MODEL:Ljava/lang/String;

    invoke-virtual {v2, v9}, Lcom/google/android/gms/internal/measurement/zzfx;->zzK(Ljava/lang/String;)Lcom/google/android/gms/internal/measurement/zzfx;

    iget-object v9, v1, Lcom/google/android/gms/measurement/internal/zzkn;->zzn:Lcom/google/android/gms/measurement/internal/zzfs;

    .line 249
    invoke-virtual {v9}, Lcom/google/android/gms/measurement/internal/zzfs;->zzg()Lcom/google/android/gms/measurement/internal/zzan;

    move-result-object v9

    .line 250
    invoke-virtual {v9}, Lcom/google/android/gms/measurement/internal/zzgm;->zzu()V

    sget-object v9, Landroid/os/Build$VERSION;->RELEASE:Ljava/lang/String;

    invoke-virtual {v2, v9}, Lcom/google/android/gms/internal/measurement/zzfx;->zzV(Ljava/lang/String;)Lcom/google/android/gms/internal/measurement/zzfx;

    iget-object v9, v1, Lcom/google/android/gms/measurement/internal/zzkn;->zzn:Lcom/google/android/gms/measurement/internal/zzfs;

    .line 251
    invoke-virtual {v9}, Lcom/google/android/gms/measurement/internal/zzfs;->zzg()Lcom/google/android/gms/measurement/internal/zzan;

    move-result-object v9

    .line 252
    invoke-virtual {v9}, Lcom/google/android/gms/measurement/internal/zzan;->zzb()J

    move-result-wide v9

    long-to-int v10, v9

    invoke-virtual {v2, v10}, Lcom/google/android/gms/internal/measurement/zzfx;->zzaf(I)Lcom/google/android/gms/internal/measurement/zzfx;

    iget-object v9, v1, Lcom/google/android/gms/measurement/internal/zzkn;->zzn:Lcom/google/android/gms/measurement/internal/zzfs;

    .line 253
    invoke-virtual {v9}, Lcom/google/android/gms/measurement/internal/zzfs;->zzg()Lcom/google/android/gms/measurement/internal/zzan;

    move-result-object v9

    .line 254
    invoke-virtual {v9}, Lcom/google/android/gms/measurement/internal/zzan;->zzc()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v2, v9}, Lcom/google/android/gms/internal/measurement/zzfx;->zzaj(Ljava/lang/String;)Lcom/google/android/gms/internal/measurement/zzfx;

    .line 255
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzg()Lcom/google/android/gms/measurement/internal/zzaf;

    move-result-object v9

    sget-object v10, Lcom/google/android/gms/measurement/internal/zzdw;->zzan:Lcom/google/android/gms/measurement/internal/zzdv;

    invoke-virtual {v9, v6, v10}, Lcom/google/android/gms/measurement/internal/zzaf;->zzs(Ljava/lang/String;Lcom/google/android/gms/measurement/internal/zzdv;)Z

    move-result v9

    if-nez v9, :cond_35

    .line 256
    iget-wide v9, v3, Lcom/google/android/gms/measurement/internal/zzp;->zzl:J

    invoke-virtual {v2, v9, v10}, Lcom/google/android/gms/internal/measurement/zzfx;->zzz(J)Lcom/google/android/gms/internal/measurement/zzfx;

    :cond_35
    iget-object v9, v1, Lcom/google/android/gms/measurement/internal/zzkn;->zzn:Lcom/google/android/gms/measurement/internal/zzfs;

    .line 257
    invoke-virtual {v9}, Lcom/google/android/gms/measurement/internal/zzfs;->zzJ()Z

    move-result v9

    if-eqz v9, :cond_36

    .line 258
    invoke-virtual {v2}, Lcom/google/android/gms/internal/measurement/zzfx;->zzal()Ljava/lang/String;

    .line 259
    invoke-static {v6}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v9

    if-nez v9, :cond_36

    .line 260
    invoke-virtual {v2, v6}, Lcom/google/android/gms/internal/measurement/zzfx;->zzL(Ljava/lang/String;)Lcom/google/android/gms/internal/measurement/zzfx;

    :cond_36
    iget-object v9, v1, Lcom/google/android/gms/measurement/internal/zzkn;->zze:Lcom/google/android/gms/measurement/internal/zzaj;

    .line 261
    invoke-static {v9}, Lcom/google/android/gms/measurement/internal/zzkn;->zzak(Lcom/google/android/gms/measurement/internal/zzkd;)Lcom/google/android/gms/measurement/internal/zzkd;

    .line 262
    iget-object v10, v3, Lcom/google/android/gms/measurement/internal/zzp;->zza:Ljava/lang/String;

    invoke-virtual {v9, v10}, Lcom/google/android/gms/measurement/internal/zzaj;->zzj(Ljava/lang/String;)Lcom/google/android/gms/measurement/internal/zzg;

    move-result-object v9

    if-nez v9, :cond_39

    new-instance v9, Lcom/google/android/gms/measurement/internal/zzg;

    iget-object v10, v1, Lcom/google/android/gms/measurement/internal/zzkn;->zzn:Lcom/google/android/gms/measurement/internal/zzfs;

    .line 263
    iget-object v11, v3, Lcom/google/android/gms/measurement/internal/zzp;->zza:Ljava/lang/String;

    invoke-direct {v9, v10, v11}, Lcom/google/android/gms/measurement/internal/zzg;-><init>(Lcom/google/android/gms/measurement/internal/zzfs;Ljava/lang/String;)V

    .line 264
    invoke-virtual {v1, v8}, Lcom/google/android/gms/measurement/internal/zzkn;->zzw(Lcom/google/android/gms/measurement/internal/zzag;)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Lcom/google/android/gms/measurement/internal/zzg;->zzI(Ljava/lang/String;)V

    .line 265
    iget-object v10, v3, Lcom/google/android/gms/measurement/internal/zzp;->zzk:Ljava/lang/String;

    invoke-virtual {v9, v10}, Lcom/google/android/gms/measurement/internal/zzg;->zzW(Ljava/lang/String;)V

    .line 266
    iget-object v10, v3, Lcom/google/android/gms/measurement/internal/zzp;->zzb:Ljava/lang/String;

    invoke-virtual {v9, v10}, Lcom/google/android/gms/measurement/internal/zzg;->zzY(Ljava/lang/String;)V

    .line 267
    invoke-virtual {v8}, Lcom/google/android/gms/measurement/internal/zzag;->zzj()Z

    move-result v10

    if-eqz v10, :cond_37

    iget-object v10, v1, Lcom/google/android/gms/measurement/internal/zzkn;->zzk:Lcom/google/android/gms/measurement/internal/zzjk;

    .line 268
    iget-object v11, v3, Lcom/google/android/gms/measurement/internal/zzp;->zza:Ljava/lang/String;

    invoke-virtual {v10, v11}, Lcom/google/android/gms/measurement/internal/zzjk;->zzf(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    .line 269
    invoke-virtual {v9, v10}, Lcom/google/android/gms/measurement/internal/zzg;->zzag(Ljava/lang/String;)V

    :cond_37
    const-wide/16 v10, 0x0

    .line 270
    invoke-virtual {v9, v10, v11}, Lcom/google/android/gms/measurement/internal/zzg;->zzac(J)V

    .line 271
    invoke-virtual {v9, v10, v11}, Lcom/google/android/gms/measurement/internal/zzg;->zzad(J)V

    .line 272
    invoke-virtual {v9, v10, v11}, Lcom/google/android/gms/measurement/internal/zzg;->zzab(J)V

    .line 273
    iget-object v10, v3, Lcom/google/android/gms/measurement/internal/zzp;->zzc:Ljava/lang/String;

    invoke-virtual {v9, v10}, Lcom/google/android/gms/measurement/internal/zzg;->zzK(Ljava/lang/String;)V

    .line 274
    iget-wide v10, v3, Lcom/google/android/gms/measurement/internal/zzp;->zzj:J

    invoke-virtual {v9, v10, v11}, Lcom/google/android/gms/measurement/internal/zzg;->zzL(J)V

    .line 275
    iget-object v10, v3, Lcom/google/android/gms/measurement/internal/zzp;->zzd:Ljava/lang/String;

    invoke-virtual {v9, v10}, Lcom/google/android/gms/measurement/internal/zzg;->zzJ(Ljava/lang/String;)V

    .line 276
    iget-wide v10, v3, Lcom/google/android/gms/measurement/internal/zzp;->zze:J

    invoke-virtual {v9, v10, v11}, Lcom/google/android/gms/measurement/internal/zzg;->zzZ(J)V

    .line 277
    iget-wide v10, v3, Lcom/google/android/gms/measurement/internal/zzp;->zzf:J

    invoke-virtual {v9, v10, v11}, Lcom/google/android/gms/measurement/internal/zzg;->zzT(J)V

    .line 278
    iget-boolean v10, v3, Lcom/google/android/gms/measurement/internal/zzp;->zzh:Z

    invoke-virtual {v9, v10}, Lcom/google/android/gms/measurement/internal/zzg;->zzae(Z)V

    .line 279
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzg()Lcom/google/android/gms/measurement/internal/zzaf;

    move-result-object v10

    sget-object v11, Lcom/google/android/gms/measurement/internal/zzdw;->zzan:Lcom/google/android/gms/measurement/internal/zzdv;

    invoke-virtual {v10, v6, v11}, Lcom/google/android/gms/measurement/internal/zzaf;->zzs(Ljava/lang/String;Lcom/google/android/gms/measurement/internal/zzdv;)Z

    move-result v10

    if-nez v10, :cond_38

    .line 280
    iget-wide v10, v3, Lcom/google/android/gms/measurement/internal/zzp;->zzl:J

    invoke-virtual {v9, v10, v11}, Lcom/google/android/gms/measurement/internal/zzg;->zzH(J)V

    .line 281
    :cond_38
    iget-wide v10, v3, Lcom/google/android/gms/measurement/internal/zzp;->zzs:J

    invoke-virtual {v9, v10, v11}, Lcom/google/android/gms/measurement/internal/zzg;->zzU(J)V

    iget-object v10, v1, Lcom/google/android/gms/measurement/internal/zzkn;->zze:Lcom/google/android/gms/measurement/internal/zzaj;

    .line 282
    invoke-static {v10}, Lcom/google/android/gms/measurement/internal/zzkn;->zzak(Lcom/google/android/gms/measurement/internal/zzkd;)Lcom/google/android/gms/measurement/internal/zzkd;

    .line 283
    invoke-virtual {v10, v9}, Lcom/google/android/gms/measurement/internal/zzaj;->zzD(Lcom/google/android/gms/measurement/internal/zzg;)V

    .line 284
    :cond_39
    invoke-virtual {v8}, Lcom/google/android/gms/measurement/internal/zzag;->zzk()Z

    move-result v8

    if-eqz v8, :cond_3a

    .line 285
    invoke-virtual {v9}, Lcom/google/android/gms/measurement/internal/zzg;->zzu()Ljava/lang/String;

    move-result-object v8

    invoke-static {v8}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v8

    if-nez v8, :cond_3a

    .line 286
    invoke-virtual {v9}, Lcom/google/android/gms/measurement/internal/zzg;->zzu()Ljava/lang/String;

    move-result-object v8

    invoke-static {v8}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/String;

    invoke-virtual {v2, v8}, Lcom/google/android/gms/internal/measurement/zzfx;->zzB(Ljava/lang/String;)Lcom/google/android/gms/internal/measurement/zzfx;

    .line 287
    :cond_3a
    invoke-virtual {v9}, Lcom/google/android/gms/measurement/internal/zzg;->zzx()Ljava/lang/String;

    move-result-object v8

    invoke-static {v8}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v8

    if-nez v8, :cond_3b

    .line 288
    invoke-virtual {v9}, Lcom/google/android/gms/measurement/internal/zzg;->zzx()Ljava/lang/String;

    move-result-object v8

    invoke-static {v8}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/String;

    invoke-virtual {v2, v8}, Lcom/google/android/gms/internal/measurement/zzfx;->zzP(Ljava/lang/String;)Lcom/google/android/gms/internal/measurement/zzfx;

    :cond_3b
    iget-object v8, v1, Lcom/google/android/gms/measurement/internal/zzkn;->zze:Lcom/google/android/gms/measurement/internal/zzaj;

    .line 289
    invoke-static {v8}, Lcom/google/android/gms/measurement/internal/zzkn;->zzak(Lcom/google/android/gms/measurement/internal/zzkd;)Lcom/google/android/gms/measurement/internal/zzkd;

    .line 290
    iget-object v3, v3, Lcom/google/android/gms/measurement/internal/zzp;->zza:Ljava/lang/String;

    invoke-virtual {v8, v3}, Lcom/google/android/gms/measurement/internal/zzaj;->zzu(Ljava/lang/String;)Ljava/util/List;

    move-result-object v3

    const/4 v13, 0x0

    .line 291
    :goto_19
    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v8

    if-ge v13, v8, :cond_3c

    .line 292
    invoke-static {}, Lcom/google/android/gms/internal/measurement/zzgh;->zzd()Lcom/google/android/gms/internal/measurement/zzgg;

    move-result-object v8

    .line 293
    invoke-interface {v3, v13}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lcom/google/android/gms/measurement/internal/zzks;

    iget-object v9, v9, Lcom/google/android/gms/measurement/internal/zzks;->zzc:Ljava/lang/String;

    invoke-virtual {v8, v9}, Lcom/google/android/gms/internal/measurement/zzgg;->zzf(Ljava/lang/String;)Lcom/google/android/gms/internal/measurement/zzgg;

    .line 294
    invoke-interface {v3, v13}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lcom/google/android/gms/measurement/internal/zzks;

    iget-wide v9, v9, Lcom/google/android/gms/measurement/internal/zzks;->zzd:J

    invoke-virtual {v8, v9, v10}, Lcom/google/android/gms/internal/measurement/zzgg;->zzg(J)Lcom/google/android/gms/internal/measurement/zzgg;

    iget-object v9, v1, Lcom/google/android/gms/measurement/internal/zzkn;->zzi:Lcom/google/android/gms/measurement/internal/zzkp;

    .line 295
    invoke-static {v9}, Lcom/google/android/gms/measurement/internal/zzkn;->zzak(Lcom/google/android/gms/measurement/internal/zzkd;)Lcom/google/android/gms/measurement/internal/zzkd;

    .line 296
    invoke-interface {v3, v13}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Lcom/google/android/gms/measurement/internal/zzks;

    iget-object v10, v10, Lcom/google/android/gms/measurement/internal/zzks;->zze:Ljava/lang/Object;

    invoke-virtual {v9, v8, v10}, Lcom/google/android/gms/measurement/internal/zzkp;->zzv(Lcom/google/android/gms/internal/measurement/zzgg;Ljava/lang/Object;)V

    .line 297
    invoke-virtual {v2, v8}, Lcom/google/android/gms/internal/measurement/zzfx;->zzk(Lcom/google/android/gms/internal/measurement/zzgg;)Lcom/google/android/gms/internal/measurement/zzfx;
    :try_end_11
    .catchall {:try_start_11 .. :try_end_11} :catchall_0

    add-int/lit8 v13, v13, 0x1

    goto :goto_19

    :cond_3c
    :try_start_12
    iget-object v3, v1, Lcom/google/android/gms/measurement/internal/zzkn;->zze:Lcom/google/android/gms/measurement/internal/zzaj;

    .line 298
    invoke-static {v3}, Lcom/google/android/gms/measurement/internal/zzkn;->zzak(Lcom/google/android/gms/measurement/internal/zzkd;)Lcom/google/android/gms/measurement/internal/zzkd;

    .line 299
    invoke-virtual {v2}, Lcom/google/android/gms/internal/measurement/zzjv;->zzaA()Lcom/google/android/gms/internal/measurement/zzjz;

    move-result-object v8

    check-cast v8, Lcom/google/android/gms/internal/measurement/zzfy;

    .line 300
    invoke-virtual {v3}, Lcom/google/android/gms/measurement/internal/zzgl;->zzg()V

    .line 301
    invoke-virtual {v3}, Lcom/google/android/gms/measurement/internal/zzkd;->zzY()V

    .line 302
    invoke-static {v8}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 303
    invoke-virtual {v8}, Lcom/google/android/gms/internal/measurement/zzfy;->zzy()Ljava/lang/String;

    move-result-object v9

    invoke-static {v9}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotEmpty(Ljava/lang/String;)Ljava/lang/String;

    .line 304
    invoke-virtual {v8}, Lcom/google/android/gms/internal/measurement/zzih;->zzbs()[B

    move-result-object v9

    iget-object v10, v3, Lcom/google/android/gms/measurement/internal/zzkc;->zzf:Lcom/google/android/gms/measurement/internal/zzkn;

    iget-object v10, v10, Lcom/google/android/gms/measurement/internal/zzkn;->zzi:Lcom/google/android/gms/measurement/internal/zzkp;

    .line 305
    invoke-static {v10}, Lcom/google/android/gms/measurement/internal/zzkn;->zzak(Lcom/google/android/gms/measurement/internal/zzkd;)Lcom/google/android/gms/measurement/internal/zzkd;

    .line 306
    invoke-virtual {v10, v9}, Lcom/google/android/gms/measurement/internal/zzkp;->zzd([B)J

    move-result-wide v10

    new-instance v12, Landroid/content/ContentValues;

    .line 307
    invoke-direct {v12}, Landroid/content/ContentValues;-><init>()V

    .line 308
    invoke-virtual {v8}, Lcom/google/android/gms/internal/measurement/zzfy;->zzy()Ljava/lang/String;

    move-result-object v13

    move-object/from16 v14, v30

    invoke-virtual {v12, v14, v13}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 309
    invoke-static {v10, v11}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v13

    move-object/from16 v15, v33

    invoke-virtual {v12, v15, v13}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    const-string v13, "metadata"

    .line 310
    invoke-virtual {v12, v13, v9}, Landroid/content/ContentValues;->put(Ljava/lang/String;[B)V
    :try_end_12
    .catch Ljava/io/IOException; {:try_start_12 .. :try_end_12} :catch_8
    .catchall {:try_start_12 .. :try_end_12} :catchall_0

    .line 311
    :try_start_13
    invoke-virtual {v3}, Lcom/google/android/gms/measurement/internal/zzaj;->zzh()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v9

    const-string v13, "raw_events_metadata"

    const/4 v4, 0x4

    .line 312
    invoke-virtual {v9, v13, v6, v12, v4}, Landroid/database/sqlite/SQLiteDatabase;->insertWithOnConflict(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;I)J
    :try_end_13
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_13 .. :try_end_13} :catch_7
    .catch Ljava/io/IOException; {:try_start_13 .. :try_end_13} :catch_8
    .catchall {:try_start_13 .. :try_end_13} :catchall_0

    :try_start_14
    iget-object v2, v1, Lcom/google/android/gms/measurement/internal/zzkn;->zze:Lcom/google/android/gms/measurement/internal/zzaj;

    .line 322
    invoke-static {v2}, Lcom/google/android/gms/measurement/internal/zzkn;->zzak(Lcom/google/android/gms/measurement/internal/zzkd;)Lcom/google/android/gms/measurement/internal/zzkd;

    iget-object v3, v5, Lcom/google/android/gms/measurement/internal/zzao;->zzf:Lcom/google/android/gms/measurement/internal/zzar;

    new-instance v4, Lcom/google/android/gms/measurement/internal/zzaq;

    .line 323
    invoke-direct {v4, v3}, Lcom/google/android/gms/measurement/internal/zzaq;-><init>(Lcom/google/android/gms/measurement/internal/zzar;)V

    .line 324
    :cond_3d
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_3e

    .line 325
    invoke-virtual {v4}, Lcom/google/android/gms/measurement/internal/zzaq;->zza()Ljava/lang/String;

    move-result-object v3

    .line 326
    invoke-virtual {v7, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_3d

    :goto_1a
    const/4 v13, 0x1

    goto :goto_1b

    .line 359
    :cond_3e
    iget-object v3, v1, Lcom/google/android/gms/measurement/internal/zzkn;->zzc:Lcom/google/android/gms/measurement/internal/zzfj;

    .line 327
    invoke-static {v3}, Lcom/google/android/gms/measurement/internal/zzkn;->zzak(Lcom/google/android/gms/measurement/internal/zzkd;)Lcom/google/android/gms/measurement/internal/zzkd;

    iget-object v4, v5, Lcom/google/android/gms/measurement/internal/zzao;->zza:Ljava/lang/String;

    iget-object v7, v5, Lcom/google/android/gms/measurement/internal/zzao;->zzb:Ljava/lang/String;

    .line 328
    invoke-virtual {v3, v4, v7}, Lcom/google/android/gms/measurement/internal/zzfj;->zzn(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v3

    iget-object v4, v1, Lcom/google/android/gms/measurement/internal/zzkn;->zze:Lcom/google/android/gms/measurement/internal/zzaj;

    .line 329
    invoke-static {v4}, Lcom/google/android/gms/measurement/internal/zzkn;->zzak(Lcom/google/android/gms/measurement/internal/zzkd;)Lcom/google/android/gms/measurement/internal/zzkd;

    .line 330
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzkn;->zza()J

    move-result-wide v17

    iget-object v7, v5, Lcom/google/android/gms/measurement/internal/zzao;->zza:Ljava/lang/String;

    const/16 v20, 0x0

    const/16 v21, 0x0

    const/16 v22, 0x0

    const/16 v23, 0x0

    const/16 v24, 0x0

    move-object/from16 v16, v4

    move-object/from16 v19, v7

    invoke-virtual/range {v16 .. v24}, Lcom/google/android/gms/measurement/internal/zzaj;->zzl(JLjava/lang/String;ZZZZZ)Lcom/google/android/gms/measurement/internal/zzah;

    move-result-object v4

    if-eqz v3, :cond_3f

    iget-wide v3, v4, Lcom/google/android/gms/measurement/internal/zzah;->zze:J

    .line 331
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzg()Lcom/google/android/gms/measurement/internal/zzaf;

    move-result-object v7

    iget-object v8, v5, Lcom/google/android/gms/measurement/internal/zzao;->zza:Ljava/lang/String;

    sget-object v9, Lcom/google/android/gms/measurement/internal/zzdw;->zzn:Lcom/google/android/gms/measurement/internal/zzdv;

    invoke-virtual {v7, v8, v9}, Lcom/google/android/gms/measurement/internal/zzaf;->zze(Ljava/lang/String;Lcom/google/android/gms/measurement/internal/zzdv;)I

    move-result v7

    int-to-long v7, v7

    cmp-long v9, v3, v7

    if-gez v9, :cond_3f

    goto :goto_1a

    :cond_3f
    const/4 v13, 0x0

    .line 332
    :goto_1b
    invoke-virtual {v2}, Lcom/google/android/gms/measurement/internal/zzgl;->zzg()V

    .line 333
    invoke-virtual {v2}, Lcom/google/android/gms/measurement/internal/zzkd;->zzY()V

    .line 334
    invoke-static {v5}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v3, v5, Lcom/google/android/gms/measurement/internal/zzao;->zza:Ljava/lang/String;

    .line 335
    invoke-static {v3}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotEmpty(Ljava/lang/String;)Ljava/lang/String;

    iget-object v3, v2, Lcom/google/android/gms/measurement/internal/zzkc;->zzf:Lcom/google/android/gms/measurement/internal/zzkn;

    iget-object v3, v3, Lcom/google/android/gms/measurement/internal/zzkn;->zzi:Lcom/google/android/gms/measurement/internal/zzkp;

    .line 336
    invoke-static {v3}, Lcom/google/android/gms/measurement/internal/zzkn;->zzak(Lcom/google/android/gms/measurement/internal/zzkd;)Lcom/google/android/gms/measurement/internal/zzkd;

    .line 337
    invoke-virtual {v3, v5}, Lcom/google/android/gms/measurement/internal/zzkp;->zzj(Lcom/google/android/gms/measurement/internal/zzao;)Lcom/google/android/gms/internal/measurement/zzfo;

    move-result-object v3

    invoke-virtual {v3}, Lcom/google/android/gms/internal/measurement/zzih;->zzbs()[B

    move-result-object v3

    new-instance v4, Landroid/content/ContentValues;

    .line 338
    invoke-direct {v4}, Landroid/content/ContentValues;-><init>()V

    iget-object v7, v5, Lcom/google/android/gms/measurement/internal/zzao;->zza:Ljava/lang/String;

    .line 339
    invoke-virtual {v4, v14, v7}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    const-string v7, "name"

    iget-object v8, v5, Lcom/google/android/gms/measurement/internal/zzao;->zzb:Ljava/lang/String;

    .line 340
    invoke-virtual {v4, v7, v8}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    const-string/jumbo v7, "timestamp"

    iget-wide v8, v5, Lcom/google/android/gms/measurement/internal/zzao;->zzd:J

    .line 341
    invoke-static {v8, v9}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v8

    invoke-virtual {v4, v7, v8}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 342
    invoke-static {v10, v11}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v7

    invoke-virtual {v4, v15, v7}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    const-string v7, "data"

    .line 343
    invoke-virtual {v4, v7, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;[B)V

    const-string v3, "realtime"

    .line 344
    invoke-static {v13}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-virtual {v4, v3, v7}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V
    :try_end_14
    .catchall {:try_start_14 .. :try_end_14} :catchall_0

    .line 345
    :try_start_15
    invoke-virtual {v2}, Lcom/google/android/gms/measurement/internal/zzaj;->zzh()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v3

    move-object/from16 v7, v32

    .line 346
    invoke-virtual {v3, v7, v6, v4}, Landroid/database/sqlite/SQLiteDatabase;->insert(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J

    move-result-wide v3

    const-wide/16 v6, -0x1

    cmp-long v8, v3, v6

    if-nez v8, :cond_40

    iget-object v3, v2, Lcom/google/android/gms/measurement/internal/zzgl;->zzs:Lcom/google/android/gms/measurement/internal/zzfs;

    .line 347
    invoke-virtual {v3}, Lcom/google/android/gms/measurement/internal/zzfs;->zzay()Lcom/google/android/gms/measurement/internal/zzei;

    move-result-object v3

    .line 348
    invoke-virtual {v3}, Lcom/google/android/gms/measurement/internal/zzei;->zzd()Lcom/google/android/gms/measurement/internal/zzeg;

    move-result-object v3

    const-string v4, "Failed to insert raw event (got -1). appId"

    iget-object v6, v5, Lcom/google/android/gms/measurement/internal/zzao;->zza:Ljava/lang/String;

    invoke-static {v6}, Lcom/google/android/gms/measurement/internal/zzei;->zzn(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v6

    .line 349
    invoke-virtual {v3, v4, v6}, Lcom/google/android/gms/measurement/internal/zzeg;->zzb(Ljava/lang/String;Ljava/lang/Object;)V
    :try_end_15
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_15 .. :try_end_15} :catch_6
    .catchall {:try_start_15 .. :try_end_15} :catchall_0

    goto :goto_1c

    :cond_40
    const-wide/16 v3, 0x0

    .line 359
    :try_start_16
    iput-wide v3, v1, Lcom/google/android/gms/measurement/internal/zzkn;->zza:J

    goto :goto_1c

    :catch_6
    move-exception v0

    move-object v3, v0

    .line 317
    iget-object v2, v2, Lcom/google/android/gms/measurement/internal/zzgl;->zzs:Lcom/google/android/gms/measurement/internal/zzfs;

    .line 350
    invoke-virtual {v2}, Lcom/google/android/gms/measurement/internal/zzfs;->zzay()Lcom/google/android/gms/measurement/internal/zzei;

    move-result-object v2

    .line 351
    invoke-virtual {v2}, Lcom/google/android/gms/measurement/internal/zzei;->zzd()Lcom/google/android/gms/measurement/internal/zzeg;

    move-result-object v2

    const-string v4, "Error storing raw event. appId"

    iget-object v5, v5, Lcom/google/android/gms/measurement/internal/zzao;->zza:Ljava/lang/String;

    invoke-static {v5}, Lcom/google/android/gms/measurement/internal/zzei;->zzn(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v5

    .line 352
    invoke-virtual {v2, v4, v5, v3}, Lcom/google/android/gms/measurement/internal/zzeg;->zzc(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V
    :try_end_16
    .catchall {:try_start_16 .. :try_end_16} :catchall_0

    goto :goto_1c

    :catch_7
    move-exception v0

    move-object v4, v0

    .line 321
    :try_start_17
    iget-object v3, v3, Lcom/google/android/gms/measurement/internal/zzgl;->zzs:Lcom/google/android/gms/measurement/internal/zzfs;

    .line 313
    invoke-virtual {v3}, Lcom/google/android/gms/measurement/internal/zzfs;->zzay()Lcom/google/android/gms/measurement/internal/zzei;

    move-result-object v3

    .line 314
    invoke-virtual {v3}, Lcom/google/android/gms/measurement/internal/zzei;->zzd()Lcom/google/android/gms/measurement/internal/zzeg;

    move-result-object v3

    const-string v5, "Error storing raw event metadata. appId"

    .line 315
    invoke-virtual {v8}, Lcom/google/android/gms/internal/measurement/zzfy;->zzy()Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Lcom/google/android/gms/measurement/internal/zzei;->zzn(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v6

    .line 316
    invoke-virtual {v3, v5, v6, v4}, Lcom/google/android/gms/measurement/internal/zzeg;->zzc(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 317
    throw v4
    :try_end_17
    .catch Ljava/io/IOException; {:try_start_17 .. :try_end_17} :catch_8
    .catchall {:try_start_17 .. :try_end_17} :catchall_0

    :catch_8
    move-exception v0

    move-object v3, v0

    .line 318
    :try_start_18
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzay()Lcom/google/android/gms/measurement/internal/zzei;

    move-result-object v4

    .line 319
    invoke-virtual {v4}, Lcom/google/android/gms/measurement/internal/zzei;->zzd()Lcom/google/android/gms/measurement/internal/zzeg;

    move-result-object v4

    const-string v5, "Data loss. Failed to insert raw event metadata. appId"

    .line 320
    invoke-virtual {v2}, Lcom/google/android/gms/internal/measurement/zzfx;->zzal()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/google/android/gms/measurement/internal/zzei;->zzn(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    .line 321
    invoke-virtual {v4, v5, v2, v3}, Lcom/google/android/gms/measurement/internal/zzeg;->zzc(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 349
    :goto_1c
    iget-object v2, v1, Lcom/google/android/gms/measurement/internal/zzkn;->zze:Lcom/google/android/gms/measurement/internal/zzaj;

    .line 353
    invoke-static {v2}, Lcom/google/android/gms/measurement/internal/zzkn;->zzak(Lcom/google/android/gms/measurement/internal/zzkd;)Lcom/google/android/gms/measurement/internal/zzkd;

    .line 354
    invoke-virtual {v2}, Lcom/google/android/gms/measurement/internal/zzaj;->zzC()V
    :try_end_18
    .catchall {:try_start_18 .. :try_end_18} :catchall_0

    iget-object v2, v1, Lcom/google/android/gms/measurement/internal/zzkn;->zze:Lcom/google/android/gms/measurement/internal/zzaj;

    .line 77
    invoke-static {v2}, Lcom/google/android/gms/measurement/internal/zzkn;->zzak(Lcom/google/android/gms/measurement/internal/zzkd;)Lcom/google/android/gms/measurement/internal/zzkd;

    .line 78
    invoke-virtual {v2}, Lcom/google/android/gms/measurement/internal/zzaj;->zzx()V

    .line 355
    invoke-direct/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzaf()V

    .line 356
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzay()Lcom/google/android/gms/measurement/internal/zzei;

    move-result-object v2

    .line 357
    invoke-virtual {v2}, Lcom/google/android/gms/measurement/internal/zzei;->zzj()Lcom/google/android/gms/measurement/internal/zzeg;

    move-result-object v2

    .line 358
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v3

    sub-long v3, v3, v28

    const-wide/32 v5, 0x7a120

    add-long/2addr v3, v5

    const-wide/32 v5, 0xf4240

    div-long/2addr v3, v5

    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    const-string v4, "Background event processing time, ms"

    .line 359
    invoke-virtual {v2, v4, v3}, Lcom/google/android/gms/measurement/internal/zzeg;->zzb(Ljava/lang/String;Ljava/lang/Object;)V

    return-void

    :catchall_0
    move-exception v0

    move-object v2, v0

    .line 375
    iget-object v3, v1, Lcom/google/android/gms/measurement/internal/zzkn;->zze:Lcom/google/android/gms/measurement/internal/zzaj;

    .line 77
    invoke-static {v3}, Lcom/google/android/gms/measurement/internal/zzkn;->zzak(Lcom/google/android/gms/measurement/internal/zzkd;)Lcom/google/android/gms/measurement/internal/zzkd;

    .line 78
    invoke-virtual {v3}, Lcom/google/android/gms/measurement/internal/zzaj;->zzx()V

    .line 374
    throw v2

    .line 375
    :cond_41
    invoke-virtual {v1, v3}, Lcom/google/android/gms/measurement/internal/zzkn;->zzd(Lcom/google/android/gms/measurement/internal/zzp;)Lcom/google/android/gms/measurement/internal/zzg;

    return-void
.end method

.method final zzX()Z
    .locals 5

    .line 1
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzaz()Lcom/google/android/gms/measurement/internal/zzfp;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzgl;->zzg()V

    .line 2
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzg()Lcom/google/android/gms/measurement/internal/zzaf;

    move-result-object v0

    sget-object v1, Lcom/google/android/gms/measurement/internal/zzdw;->zzac:Lcom/google/android/gms/measurement/internal/zzdv;

    const/4 v2, 0x0

    invoke-virtual {v0, v2, v1}, Lcom/google/android/gms/measurement/internal/zzaf;->zzs(Ljava/lang/String;Lcom/google/android/gms/measurement/internal/zzdv;)Z

    move-result v0

    const/4 v1, 0x1

    const-string v2, "Storage concurrent access okay"

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzkn;->zzw:Ljava/nio/channels/FileLock;

    if-eqz v0, :cond_1

    .line 3
    invoke-virtual {v0}, Ljava/nio/channels/FileLock;->isValid()Z

    move-result v0

    if-nez v0, :cond_0

    goto :goto_0

    .line 15
    :cond_0
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzay()Lcom/google/android/gms/measurement/internal/zzei;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzei;->zzj()Lcom/google/android/gms/measurement/internal/zzeg;

    move-result-object v0

    invoke-virtual {v0, v2}, Lcom/google/android/gms/measurement/internal/zzeg;->zza(Ljava/lang/String;)V

    return v1

    .line 3
    :cond_1
    :goto_0
    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzkn;->zze:Lcom/google/android/gms/measurement/internal/zzaj;

    iget-object v0, v0, Lcom/google/android/gms/measurement/internal/zzgl;->zzs:Lcom/google/android/gms/measurement/internal/zzfs;

    .line 4
    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzfs;->zzf()Lcom/google/android/gms/measurement/internal/zzaf;

    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzkn;->zzn:Lcom/google/android/gms/measurement/internal/zzfs;

    .line 5
    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzfs;->zzau()Landroid/content/Context;

    move-result-object v0

    .line 6
    invoke-virtual {v0}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    move-result-object v0

    new-instance v3, Ljava/io/File;

    const-string v4, "google_app_measurement.db"

    .line 7
    invoke-direct {v3, v0, v4}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    :try_start_0
    new-instance v0, Ljava/io/RandomAccessFile;

    const-string v4, "rw"

    .line 8
    invoke-direct {v0, v3, v4}, Ljava/io/RandomAccessFile;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/io/RandomAccessFile;->getChannel()Ljava/nio/channels/FileChannel;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/gms/measurement/internal/zzkn;->zzx:Ljava/nio/channels/FileChannel;

    .line 9
    invoke-virtual {v0}, Ljava/nio/channels/FileChannel;->tryLock()Ljava/nio/channels/FileLock;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/gms/measurement/internal/zzkn;->zzw:Ljava/nio/channels/FileLock;

    if-eqz v0, :cond_2

    .line 10
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzay()Lcom/google/android/gms/measurement/internal/zzei;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzei;->zzj()Lcom/google/android/gms/measurement/internal/zzeg;

    move-result-object v0

    invoke-virtual {v0, v2}, Lcom/google/android/gms/measurement/internal/zzeg;->zza(Ljava/lang/String;)V

    return v1

    .line 11
    :cond_2
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzay()Lcom/google/android/gms/measurement/internal/zzei;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzei;->zzd()Lcom/google/android/gms/measurement/internal/zzeg;

    move-result-object v0

    const-string v1, "Storage concurrent data access panic"

    invoke-virtual {v0, v1}, Lcom/google/android/gms/measurement/internal/zzeg;->zza(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/io/FileNotFoundException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/nio/channels/OverlappingFileLockException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    :catch_0
    move-exception v0

    .line 12
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzay()Lcom/google/android/gms/measurement/internal/zzei;

    move-result-object v1

    invoke-virtual {v1}, Lcom/google/android/gms/measurement/internal/zzei;->zzk()Lcom/google/android/gms/measurement/internal/zzeg;

    move-result-object v1

    const-string v2, "Storage lock already acquired"

    invoke-virtual {v1, v2, v0}, Lcom/google/android/gms/measurement/internal/zzeg;->zzb(Ljava/lang/String;Ljava/lang/Object;)V

    goto :goto_1

    :catch_1
    move-exception v0

    .line 13
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzay()Lcom/google/android/gms/measurement/internal/zzei;

    move-result-object v1

    invoke-virtual {v1}, Lcom/google/android/gms/measurement/internal/zzei;->zzd()Lcom/google/android/gms/measurement/internal/zzeg;

    move-result-object v1

    const-string v2, "Failed to access storage lock file"

    invoke-virtual {v1, v2, v0}, Lcom/google/android/gms/measurement/internal/zzeg;->zzb(Ljava/lang/String;Ljava/lang/Object;)V

    goto :goto_1

    :catch_2
    move-exception v0

    .line 14
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzay()Lcom/google/android/gms/measurement/internal/zzei;

    move-result-object v1

    invoke-virtual {v1}, Lcom/google/android/gms/measurement/internal/zzei;->zzd()Lcom/google/android/gms/measurement/internal/zzeg;

    move-result-object v1

    const-string v2, "Failed to acquire storage lock"

    invoke-virtual {v1, v2, v0}, Lcom/google/android/gms/measurement/internal/zzeg;->zzb(Ljava/lang/String;Ljava/lang/Object;)V

    :goto_1
    const/4 v0, 0x0

    return v0
.end method

.method final zza()J
    .locals 8

    .line 1
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzav()Lcom/google/android/gms/common/util/Clock;

    move-result-object v0

    invoke-interface {v0}, Lcom/google/android/gms/common/util/Clock;->currentTimeMillis()J

    move-result-wide v0

    iget-object v2, p0, Lcom/google/android/gms/measurement/internal/zzkn;->zzk:Lcom/google/android/gms/measurement/internal/zzjk;

    invoke-virtual {v2}, Lcom/google/android/gms/measurement/internal/zzkd;->zzY()V

    invoke-virtual {v2}, Lcom/google/android/gms/measurement/internal/zzgl;->zzg()V

    iget-object v3, v2, Lcom/google/android/gms/measurement/internal/zzjk;->zze:Lcom/google/android/gms/measurement/internal/zzet;

    .line 2
    invoke-virtual {v3}, Lcom/google/android/gms/measurement/internal/zzet;->zza()J

    move-result-wide v3

    const-wide/16 v5, 0x0

    cmp-long v7, v3, v5

    if-nez v7, :cond_0

    iget-object v3, v2, Lcom/google/android/gms/measurement/internal/zzgl;->zzs:Lcom/google/android/gms/measurement/internal/zzfs;

    .line 3
    invoke-virtual {v3}, Lcom/google/android/gms/measurement/internal/zzfs;->zzv()Lcom/google/android/gms/measurement/internal/zzku;

    move-result-object v3

    .line 4
    invoke-virtual {v3}, Lcom/google/android/gms/measurement/internal/zzku;->zzF()Ljava/security/SecureRandom;

    move-result-object v3

    const v4, 0x5265c00

    invoke-virtual {v3, v4}, Ljava/security/SecureRandom;->nextInt(I)I

    move-result v3

    int-to-long v3, v3

    const-wide/16 v5, 0x1

    add-long/2addr v3, v5

    iget-object v2, v2, Lcom/google/android/gms/measurement/internal/zzjk;->zze:Lcom/google/android/gms/measurement/internal/zzet;

    .line 5
    invoke-virtual {v2, v3, v4}, Lcom/google/android/gms/measurement/internal/zzet;->zzb(J)V

    :cond_0
    add-long/2addr v0, v3

    const-wide/16 v2, 0x3e8

    div-long/2addr v0, v2

    const-wide/16 v2, 0x3c

    div-long/2addr v0, v2

    div-long/2addr v0, v2

    const-wide/16 v2, 0x18

    div-long/2addr v0, v2

    return-wide v0
.end method

.method public final zzau()Landroid/content/Context;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzkn;->zzn:Lcom/google/android/gms/measurement/internal/zzfs;

    .line 1
    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzfs;->zzau()Landroid/content/Context;

    move-result-object v0

    return-object v0
.end method

.method public final zzav()Lcom/google/android/gms/common/util/Clock;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzkn;->zzn:Lcom/google/android/gms/measurement/internal/zzfs;

    .line 1
    invoke-static {v0}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/measurement/internal/zzfs;

    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzfs;->zzav()Lcom/google/android/gms/common/util/Clock;

    move-result-object v0

    return-object v0
.end method

.method public final zzaw()Lcom/google/android/gms/measurement/internal/zzaa;
    .locals 1

    const/4 v0, 0x0

    throw v0
.end method

.method public final zzay()Lcom/google/android/gms/measurement/internal/zzei;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzkn;->zzn:Lcom/google/android/gms/measurement/internal/zzfs;

    .line 1
    invoke-static {v0}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/measurement/internal/zzfs;

    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzfs;->zzay()Lcom/google/android/gms/measurement/internal/zzei;

    move-result-object v0

    return-object v0
.end method

.method public final zzaz()Lcom/google/android/gms/measurement/internal/zzfp;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzkn;->zzn:Lcom/google/android/gms/measurement/internal/zzfs;

    .line 1
    invoke-static {v0}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/measurement/internal/zzfs;

    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzfs;->zzaz()Lcom/google/android/gms/measurement/internal/zzfp;

    move-result-object v0

    return-object v0
.end method

.method final zzd(Lcom/google/android/gms/measurement/internal/zzp;)Lcom/google/android/gms/measurement/internal/zzg;
    .locals 11

    .line 1
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzaz()Lcom/google/android/gms/measurement/internal/zzfp;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzgl;->zzg()V

    .line 2
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzB()V

    .line 3
    invoke-static {p1}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    iget-object v0, p1, Lcom/google/android/gms/measurement/internal/zzp;->zza:Ljava/lang/String;

    invoke-static {v0}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotEmpty(Ljava/lang/String;)Ljava/lang/String;

    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzkn;->zze:Lcom/google/android/gms/measurement/internal/zzaj;

    .line 5
    invoke-static {v0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzak(Lcom/google/android/gms/measurement/internal/zzkd;)Lcom/google/android/gms/measurement/internal/zzkd;

    .line 6
    iget-object v1, p1, Lcom/google/android/gms/measurement/internal/zzp;->zza:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/google/android/gms/measurement/internal/zzaj;->zzj(Ljava/lang/String;)Lcom/google/android/gms/measurement/internal/zzg;

    move-result-object v0

    .line 7
    iget-object v1, p1, Lcom/google/android/gms/measurement/internal/zzp;->zza:Ljava/lang/String;

    .line 8
    invoke-virtual {p0, v1}, Lcom/google/android/gms/measurement/internal/zzkn;->zzh(Ljava/lang/String;)Lcom/google/android/gms/measurement/internal/zzag;

    move-result-object v1

    iget-object v2, p1, Lcom/google/android/gms/measurement/internal/zzp;->zzv:Ljava/lang/String;

    .line 9
    invoke-static {v2}, Lcom/google/android/gms/measurement/internal/zzag;->zzb(Ljava/lang/String;)Lcom/google/android/gms/measurement/internal/zzag;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/google/android/gms/measurement/internal/zzag;->zzc(Lcom/google/android/gms/measurement/internal/zzag;)Lcom/google/android/gms/measurement/internal/zzag;

    move-result-object v1

    .line 10
    invoke-virtual {v1}, Lcom/google/android/gms/measurement/internal/zzag;->zzj()Z

    move-result v2

    if-eqz v2, :cond_0

    iget-object v2, p0, Lcom/google/android/gms/measurement/internal/zzkn;->zzk:Lcom/google/android/gms/measurement/internal/zzjk;

    .line 11
    iget-object v3, p1, Lcom/google/android/gms/measurement/internal/zzp;->zza:Ljava/lang/String;

    invoke-virtual {v2, v3}, Lcom/google/android/gms/measurement/internal/zzjk;->zzf(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    goto :goto_0

    :cond_0
    const-string v2, ""

    :goto_0
    const/4 v3, 0x0

    if-nez v0, :cond_2

    new-instance v0, Lcom/google/android/gms/measurement/internal/zzg;

    iget-object v4, p0, Lcom/google/android/gms/measurement/internal/zzkn;->zzn:Lcom/google/android/gms/measurement/internal/zzfs;

    .line 12
    iget-object v5, p1, Lcom/google/android/gms/measurement/internal/zzp;->zza:Ljava/lang/String;

    invoke-direct {v0, v4, v5}, Lcom/google/android/gms/measurement/internal/zzg;-><init>(Lcom/google/android/gms/measurement/internal/zzfs;Ljava/lang/String;)V

    .line 13
    invoke-virtual {v1}, Lcom/google/android/gms/measurement/internal/zzag;->zzk()Z

    move-result v4

    if-eqz v4, :cond_1

    .line 14
    invoke-virtual {p0, v1}, Lcom/google/android/gms/measurement/internal/zzkn;->zzw(Lcom/google/android/gms/measurement/internal/zzag;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v4}, Lcom/google/android/gms/measurement/internal/zzg;->zzI(Ljava/lang/String;)V

    .line 15
    :cond_1
    invoke-virtual {v1}, Lcom/google/android/gms/measurement/internal/zzag;->zzj()Z

    move-result v1

    if-eqz v1, :cond_4

    .line 16
    invoke-virtual {v0, v2}, Lcom/google/android/gms/measurement/internal/zzg;->zzag(Ljava/lang/String;)V

    goto/16 :goto_1

    .line 17
    :cond_2
    invoke-virtual {v1}, Lcom/google/android/gms/measurement/internal/zzag;->zzj()Z

    move-result v4

    if-eqz v4, :cond_3

    if-eqz v2, :cond_3

    .line 18
    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzg;->zzB()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_3

    .line 22
    invoke-virtual {v0, v2}, Lcom/google/android/gms/measurement/internal/zzg;->zzag(Ljava/lang/String;)V

    .line 23
    invoke-virtual {p0, v1}, Lcom/google/android/gms/measurement/internal/zzkn;->zzw(Lcom/google/android/gms/measurement/internal/zzag;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Lcom/google/android/gms/measurement/internal/zzg;->zzI(Ljava/lang/String;)V

    .line 24
    invoke-static {}, Lcom/google/android/gms/internal/measurement/zzna;->zzc()Z

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzg()Lcom/google/android/gms/measurement/internal/zzaf;

    move-result-object v2

    sget-object v4, Lcom/google/android/gms/measurement/internal/zzdw;->zzay:Lcom/google/android/gms/measurement/internal/zzdv;

    invoke-virtual {v2, v3, v4}, Lcom/google/android/gms/measurement/internal/zzaf;->zzs(Ljava/lang/String;Lcom/google/android/gms/measurement/internal/zzdv;)Z

    move-result v2

    if-eqz v2, :cond_4

    iget-object v2, p0, Lcom/google/android/gms/measurement/internal/zzkn;->zzk:Lcom/google/android/gms/measurement/internal/zzjk;

    .line 25
    iget-object v4, p1, Lcom/google/android/gms/measurement/internal/zzp;->zza:Ljava/lang/String;

    .line 26
    invoke-virtual {v2, v4, v1}, Lcom/google/android/gms/measurement/internal/zzjk;->zzd(Ljava/lang/String;Lcom/google/android/gms/measurement/internal/zzag;)Landroid/util/Pair;

    move-result-object v1

    iget-object v1, v1, Landroid/util/Pair;->first:Ljava/lang/Object;

    const-string v2, "00000000-0000-0000-0000-000000000000"

    .line 27
    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_4

    iget-object v1, p0, Lcom/google/android/gms/measurement/internal/zzkn;->zze:Lcom/google/android/gms/measurement/internal/zzaj;

    .line 28
    invoke-static {v1}, Lcom/google/android/gms/measurement/internal/zzkn;->zzak(Lcom/google/android/gms/measurement/internal/zzkd;)Lcom/google/android/gms/measurement/internal/zzkd;

    .line 29
    iget-object v2, p1, Lcom/google/android/gms/measurement/internal/zzp;->zza:Ljava/lang/String;

    const-string v4, "_id"

    .line 30
    invoke-virtual {v1, v2, v4}, Lcom/google/android/gms/measurement/internal/zzaj;->zzp(Ljava/lang/String;Ljava/lang/String;)Lcom/google/android/gms/measurement/internal/zzks;

    move-result-object v1

    if-eqz v1, :cond_4

    iget-object v1, p0, Lcom/google/android/gms/measurement/internal/zzkn;->zze:Lcom/google/android/gms/measurement/internal/zzaj;

    .line 31
    invoke-static {v1}, Lcom/google/android/gms/measurement/internal/zzkn;->zzak(Lcom/google/android/gms/measurement/internal/zzkd;)Lcom/google/android/gms/measurement/internal/zzkd;

    .line 32
    iget-object v2, p1, Lcom/google/android/gms/measurement/internal/zzp;->zza:Ljava/lang/String;

    const-string v4, "_lair"

    .line 33
    invoke-virtual {v1, v2, v4}, Lcom/google/android/gms/measurement/internal/zzaj;->zzp(Ljava/lang/String;Ljava/lang/String;)Lcom/google/android/gms/measurement/internal/zzks;

    move-result-object v1

    if-nez v1, :cond_4

    .line 34
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzav()Lcom/google/android/gms/common/util/Clock;

    move-result-object v1

    invoke-interface {v1}, Lcom/google/android/gms/common/util/Clock;->currentTimeMillis()J

    move-result-wide v8

    new-instance v1, Lcom/google/android/gms/measurement/internal/zzks;

    .line 35
    iget-object v5, p1, Lcom/google/android/gms/measurement/internal/zzp;->zza:Ljava/lang/String;

    const-wide/16 v6, 0x1

    .line 36
    invoke-static {v6, v7}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v10

    const-string v6, "auto"

    const-string v7, "_lair"

    move-object v4, v1

    invoke-direct/range {v4 .. v10}, Lcom/google/android/gms/measurement/internal/zzks;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;JLjava/lang/Object;)V

    iget-object v2, p0, Lcom/google/android/gms/measurement/internal/zzkn;->zze:Lcom/google/android/gms/measurement/internal/zzaj;

    .line 37
    invoke-static {v2}, Lcom/google/android/gms/measurement/internal/zzkn;->zzak(Lcom/google/android/gms/measurement/internal/zzkd;)Lcom/google/android/gms/measurement/internal/zzkd;

    .line 38
    invoke-virtual {v2, v1}, Lcom/google/android/gms/measurement/internal/zzaj;->zzN(Lcom/google/android/gms/measurement/internal/zzks;)Z

    goto :goto_1

    .line 19
    :cond_3
    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzg;->zzu()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_4

    .line 20
    invoke-virtual {v1}, Lcom/google/android/gms/measurement/internal/zzag;->zzk()Z

    move-result v2

    if-eqz v2, :cond_4

    .line 21
    invoke-virtual {p0, v1}, Lcom/google/android/gms/measurement/internal/zzkn;->zzw(Lcom/google/android/gms/measurement/internal/zzag;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/google/android/gms/measurement/internal/zzg;->zzI(Ljava/lang/String;)V

    .line 39
    :cond_4
    :goto_1
    iget-object v1, p1, Lcom/google/android/gms/measurement/internal/zzp;->zzb:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/google/android/gms/measurement/internal/zzg;->zzY(Ljava/lang/String;)V

    .line 40
    iget-object v1, p1, Lcom/google/android/gms/measurement/internal/zzp;->zzq:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/google/android/gms/measurement/internal/zzg;->zzF(Ljava/lang/String;)V

    .line 41
    invoke-static {}, Lcom/google/android/gms/internal/measurement/zzoq;->zzc()Z

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzg()Lcom/google/android/gms/measurement/internal/zzaf;

    move-result-object v1

    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzg;->zzt()Ljava/lang/String;

    move-result-object v2

    sget-object v4, Lcom/google/android/gms/measurement/internal/zzdw;->zzad:Lcom/google/android/gms/measurement/internal/zzdv;

    invoke-virtual {v1, v2, v4}, Lcom/google/android/gms/measurement/internal/zzaf;->zzs(Ljava/lang/String;Lcom/google/android/gms/measurement/internal/zzdv;)Z

    move-result v1

    if-eqz v1, :cond_5

    .line 42
    iget-object v1, p1, Lcom/google/android/gms/measurement/internal/zzp;->zzu:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/google/android/gms/measurement/internal/zzg;->zzX(Ljava/lang/String;)V

    .line 43
    :cond_5
    iget-object v1, p1, Lcom/google/android/gms/measurement/internal/zzp;->zzk:Ljava/lang/String;

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_6

    .line 44
    iget-object v1, p1, Lcom/google/android/gms/measurement/internal/zzp;->zzk:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/google/android/gms/measurement/internal/zzg;->zzW(Ljava/lang/String;)V

    .line 45
    :cond_6
    iget-wide v1, p1, Lcom/google/android/gms/measurement/internal/zzp;->zze:J

    const-wide/16 v4, 0x0

    cmp-long v6, v1, v4

    if-eqz v6, :cond_7

    .line 46
    invoke-virtual {v0, v1, v2}, Lcom/google/android/gms/measurement/internal/zzg;->zzZ(J)V

    .line 47
    :cond_7
    iget-object v1, p1, Lcom/google/android/gms/measurement/internal/zzp;->zzc:Ljava/lang/String;

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_8

    .line 48
    iget-object v1, p1, Lcom/google/android/gms/measurement/internal/zzp;->zzc:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/google/android/gms/measurement/internal/zzg;->zzK(Ljava/lang/String;)V

    .line 49
    :cond_8
    iget-wide v1, p1, Lcom/google/android/gms/measurement/internal/zzp;->zzj:J

    invoke-virtual {v0, v1, v2}, Lcom/google/android/gms/measurement/internal/zzg;->zzL(J)V

    .line 50
    iget-object v1, p1, Lcom/google/android/gms/measurement/internal/zzp;->zzd:Ljava/lang/String;

    if-eqz v1, :cond_9

    .line 51
    invoke-virtual {v0, v1}, Lcom/google/android/gms/measurement/internal/zzg;->zzJ(Ljava/lang/String;)V

    .line 52
    :cond_9
    iget-wide v1, p1, Lcom/google/android/gms/measurement/internal/zzp;->zzf:J

    invoke-virtual {v0, v1, v2}, Lcom/google/android/gms/measurement/internal/zzg;->zzT(J)V

    .line 53
    iget-boolean v1, p1, Lcom/google/android/gms/measurement/internal/zzp;->zzh:Z

    invoke-virtual {v0, v1}, Lcom/google/android/gms/measurement/internal/zzg;->zzae(Z)V

    .line 54
    iget-object v1, p1, Lcom/google/android/gms/measurement/internal/zzp;->zzg:Ljava/lang/String;

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_a

    .line 55
    iget-object v1, p1, Lcom/google/android/gms/measurement/internal/zzp;->zzg:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/google/android/gms/measurement/internal/zzg;->zzaa(Ljava/lang/String;)V

    .line 56
    :cond_a
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzg()Lcom/google/android/gms/measurement/internal/zzaf;

    move-result-object v1

    sget-object v2, Lcom/google/android/gms/measurement/internal/zzdw;->zzan:Lcom/google/android/gms/measurement/internal/zzdv;

    invoke-virtual {v1, v3, v2}, Lcom/google/android/gms/measurement/internal/zzaf;->zzs(Ljava/lang/String;Lcom/google/android/gms/measurement/internal/zzdv;)Z

    move-result v1

    if-nez v1, :cond_b

    .line 57
    iget-wide v1, p1, Lcom/google/android/gms/measurement/internal/zzp;->zzl:J

    invoke-virtual {v0, v1, v2}, Lcom/google/android/gms/measurement/internal/zzg;->zzH(J)V

    .line 58
    :cond_b
    iget-boolean v1, p1, Lcom/google/android/gms/measurement/internal/zzp;->zzo:Z

    invoke-virtual {v0, v1}, Lcom/google/android/gms/measurement/internal/zzg;->zzG(Z)V

    .line 59
    iget-object v1, p1, Lcom/google/android/gms/measurement/internal/zzp;->zzr:Ljava/lang/Boolean;

    invoke-virtual {v0, v1}, Lcom/google/android/gms/measurement/internal/zzg;->zzaf(Ljava/lang/Boolean;)V

    .line 60
    iget-wide v1, p1, Lcom/google/android/gms/measurement/internal/zzp;->zzs:J

    invoke-virtual {v0, v1, v2}, Lcom/google/android/gms/measurement/internal/zzg;->zzU(J)V

    .line 61
    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzg;->zzak()Z

    move-result p1

    if-eqz p1, :cond_c

    iget-object p1, p0, Lcom/google/android/gms/measurement/internal/zzkn;->zze:Lcom/google/android/gms/measurement/internal/zzaj;

    .line 62
    invoke-static {p1}, Lcom/google/android/gms/measurement/internal/zzkn;->zzak(Lcom/google/android/gms/measurement/internal/zzkd;)Lcom/google/android/gms/measurement/internal/zzkd;

    .line 63
    invoke-virtual {p1, v0}, Lcom/google/android/gms/measurement/internal/zzaj;->zzD(Lcom/google/android/gms/measurement/internal/zzg;)V

    :cond_c
    return-object v0
.end method

.method public final zzf()Lcom/google/android/gms/measurement/internal/zzz;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzkn;->zzh:Lcom/google/android/gms/measurement/internal/zzz;

    .line 1
    invoke-static {v0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzak(Lcom/google/android/gms/measurement/internal/zzkd;)Lcom/google/android/gms/measurement/internal/zzkd;

    return-object v0
.end method

.method public final zzg()Lcom/google/android/gms/measurement/internal/zzaf;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzkn;->zzn:Lcom/google/android/gms/measurement/internal/zzfs;

    .line 1
    invoke-static {v0}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/measurement/internal/zzfs;

    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzfs;->zzf()Lcom/google/android/gms/measurement/internal/zzaf;

    move-result-object v0

    return-object v0
.end method

.method final zzh(Ljava/lang/String;)Lcom/google/android/gms/measurement/internal/zzag;
    .locals 6

    .line 1
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzaz()Lcom/google/android/gms/measurement/internal/zzfp;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzgl;->zzg()V

    .line 2
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzB()V

    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzkn;->zzB:Ljava/util/Map;

    .line 3
    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/measurement/internal/zzag;

    if-nez v0, :cond_4

    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzkn;->zze:Lcom/google/android/gms/measurement/internal/zzaj;

    .line 4
    invoke-static {v0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzak(Lcom/google/android/gms/measurement/internal/zzkd;)Lcom/google/android/gms/measurement/internal/zzkd;

    .line 5
    invoke-static {p1}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 6
    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzgl;->zzg()V

    .line 7
    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzkd;->zzY()V

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    aput-object p1, v1, v2

    .line 8
    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzaj;->zzh()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v3

    const-string v4, "select consent_state from consent_settings where app_id=? limit 1;"

    const/4 v5, 0x0

    .line 9
    :try_start_0
    invoke-virtual {v3, v4, v1}, Landroid/database/sqlite/SQLiteDatabase;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v5

    .line 10
    invoke-interface {v5}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 12
    invoke-interface {v5, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v0
    :try_end_0
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v5, :cond_2

    .line 11
    invoke-interface {v5}, Landroid/database/Cursor;->close()V

    goto :goto_0

    :cond_0
    if-eqz v5, :cond_1

    invoke-interface {v5}, Landroid/database/Cursor;->close()V

    :cond_1
    const-string v0, "G1"

    .line 17
    :cond_2
    :goto_0
    invoke-static {v0}, Lcom/google/android/gms/measurement/internal/zzag;->zzb(Ljava/lang/String;)Lcom/google/android/gms/measurement/internal/zzag;

    move-result-object v0

    .line 18
    invoke-virtual {p0, p1, v0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzT(Ljava/lang/String;Lcom/google/android/gms/measurement/internal/zzag;)V

    goto :goto_2

    :catchall_0
    move-exception p1

    goto :goto_1

    :catch_0
    move-exception p1

    .line 11
    :try_start_1
    iget-object v0, v0, Lcom/google/android/gms/measurement/internal/zzgl;->zzs:Lcom/google/android/gms/measurement/internal/zzfs;

    .line 13
    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzfs;->zzay()Lcom/google/android/gms/measurement/internal/zzei;

    move-result-object v0

    .line 14
    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzei;->zzd()Lcom/google/android/gms/measurement/internal/zzeg;

    move-result-object v0

    const-string v1, "Database error"

    invoke-virtual {v0, v1, v4, p1}, Lcom/google/android/gms/measurement/internal/zzeg;->zzc(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 15
    throw p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :goto_1
    if-eqz v5, :cond_3

    .line 11
    invoke-interface {v5}, Landroid/database/Cursor;->close()V

    .line 16
    :cond_3
    throw p1

    :cond_4
    :goto_2
    return-object v0
.end method

.method public final zzi()Lcom/google/android/gms/measurement/internal/zzaj;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzkn;->zze:Lcom/google/android/gms/measurement/internal/zzaj;

    .line 1
    invoke-static {v0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzak(Lcom/google/android/gms/measurement/internal/zzkd;)Lcom/google/android/gms/measurement/internal/zzkd;

    return-object v0
.end method

.method public final zzj()Lcom/google/android/gms/measurement/internal/zzed;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzkn;->zzn:Lcom/google/android/gms/measurement/internal/zzfs;

    .line 1
    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzfs;->zzj()Lcom/google/android/gms/measurement/internal/zzed;

    move-result-object v0

    return-object v0
.end method

.method public final zzl()Lcom/google/android/gms/measurement/internal/zzeo;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzkn;->zzd:Lcom/google/android/gms/measurement/internal/zzeo;

    .line 1
    invoke-static {v0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzak(Lcom/google/android/gms/measurement/internal/zzkd;)Lcom/google/android/gms/measurement/internal/zzkd;

    return-object v0
.end method

.method public final zzm()Lcom/google/android/gms/measurement/internal/zzeq;
    .locals 2

    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzkn;->zzf:Lcom/google/android/gms/measurement/internal/zzeq;

    if-eqz v0, :cond_0

    return-object v0

    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Network broadcast receiver not created"

    .line 1
    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public final zzo()Lcom/google/android/gms/measurement/internal/zzfj;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzkn;->zzc:Lcom/google/android/gms/measurement/internal/zzfj;

    .line 1
    invoke-static {v0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzak(Lcom/google/android/gms/measurement/internal/zzkd;)Lcom/google/android/gms/measurement/internal/zzkd;

    return-object v0
.end method

.method final zzq()Lcom/google/android/gms/measurement/internal/zzfs;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzkn;->zzn:Lcom/google/android/gms/measurement/internal/zzfs;

    return-object v0
.end method

.method public final zzr()Lcom/google/android/gms/measurement/internal/zzia;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzkn;->zzj:Lcom/google/android/gms/measurement/internal/zzia;

    .line 1
    invoke-static {v0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzak(Lcom/google/android/gms/measurement/internal/zzkd;)Lcom/google/android/gms/measurement/internal/zzkd;

    return-object v0
.end method

.method public final zzs()Lcom/google/android/gms/measurement/internal/zzjk;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzkn;->zzk:Lcom/google/android/gms/measurement/internal/zzjk;

    return-object v0
.end method

.method public final zzu()Lcom/google/android/gms/measurement/internal/zzkp;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzkn;->zzi:Lcom/google/android/gms/measurement/internal/zzkp;

    .line 1
    invoke-static {v0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzak(Lcom/google/android/gms/measurement/internal/zzkd;)Lcom/google/android/gms/measurement/internal/zzkd;

    return-object v0
.end method

.method public final zzv()Lcom/google/android/gms/measurement/internal/zzku;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzkn;->zzn:Lcom/google/android/gms/measurement/internal/zzfs;

    .line 1
    invoke-static {v0}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/measurement/internal/zzfs;

    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzfs;->zzv()Lcom/google/android/gms/measurement/internal/zzku;

    move-result-object v0

    return-object v0
.end method

.method final zzw(Lcom/google/android/gms/measurement/internal/zzag;)Ljava/lang/String;
    .locals 4

    .line 1
    invoke-virtual {p1}, Lcom/google/android/gms/measurement/internal/zzag;->zzk()Z

    move-result p1

    if-eqz p1, :cond_0

    const/16 p1, 0x10

    new-array p1, p1, [B

    .line 2
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzv()Lcom/google/android/gms/measurement/internal/zzku;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzku;->zzF()Ljava/security/SecureRandom;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/security/SecureRandom;->nextBytes([B)V

    sget-object v0, Ljava/util/Locale;->US:Ljava/util/Locale;

    const/4 v1, 0x1

    new-array v2, v1, [Ljava/lang/Object;

    new-instance v3, Ljava/math/BigInteger;

    .line 3
    invoke-direct {v3, v1, p1}, Ljava/math/BigInteger;-><init>(I[B)V

    const/4 p1, 0x0

    aput-object v3, v2, p1

    const-string p1, "%032x"

    invoke-static {v0, p1, v2}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    return-object p1

    :cond_0
    const/4 p1, 0x0

    return-object p1
.end method

.method final zzx(Lcom/google/android/gms/measurement/internal/zzp;)Ljava/lang/String;
    .locals 4

    .line 1
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzaz()Lcom/google/android/gms/measurement/internal/zzfp;

    move-result-object v0

    new-instance v1, Lcom/google/android/gms/measurement/internal/zzki;

    invoke-direct {v1, p0, p1}, Lcom/google/android/gms/measurement/internal/zzki;-><init>(Lcom/google/android/gms/measurement/internal/zzkn;Lcom/google/android/gms/measurement/internal/zzp;)V

    .line 2
    invoke-virtual {v0, v1}, Lcom/google/android/gms/measurement/internal/zzfp;->zzh(Ljava/util/concurrent/Callable;)Ljava/util/concurrent/Future;

    move-result-object v0

    const-wide/16 v1, 0x7530

    :try_start_0
    sget-object v3, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    .line 3
    invoke-interface {v0, v1, v2, v3}, Ljava/util/concurrent/Future;->get(JLjava/util/concurrent/TimeUnit;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;
    :try_end_0
    .catch Ljava/util/concurrent/TimeoutException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/util/concurrent/ExecutionException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v0

    :catch_0
    move-exception v0

    goto :goto_0

    :catch_1
    move-exception v0

    goto :goto_0

    :catch_2
    move-exception v0

    .line 4
    :goto_0
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzay()Lcom/google/android/gms/measurement/internal/zzei;

    move-result-object v1

    .line 5
    invoke-virtual {v1}, Lcom/google/android/gms/measurement/internal/zzei;->zzd()Lcom/google/android/gms/measurement/internal/zzeg;

    move-result-object v1

    iget-object p1, p1, Lcom/google/android/gms/measurement/internal/zzp;->zza:Ljava/lang/String;

    invoke-static {p1}, Lcom/google/android/gms/measurement/internal/zzei;->zzn(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    const-string v2, "Failed to get app instance id. appId"

    .line 6
    invoke-virtual {v1, v2, p1, v0}, Lcom/google/android/gms/measurement/internal/zzeg;->zzc(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    const/4 p1, 0x0

    return-object p1
.end method

.method final zzz(Ljava/lang/Runnable;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzaz()Lcom/google/android/gms/measurement/internal/zzfp;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzgl;->zzg()V

    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzkn;->zzq:Ljava/util/List;

    if-nez v0, :cond_0

    new-instance v0, Ljava/util/ArrayList;

    .line 2
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/google/android/gms/measurement/internal/zzkn;->zzq:Ljava/util/List;

    :cond_0
    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzkn;->zzq:Ljava/util/List;

    .line 3
    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    return-void
.end method
