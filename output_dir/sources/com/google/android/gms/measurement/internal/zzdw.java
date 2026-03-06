package com.google.android.gms.measurement.internal;

import android.content.Context;
import com.google.android.gms.internal.measurement.zzna;
import com.google.android.gms.internal.measurement.zznd;
import com.google.android.gms.internal.measurement.zzng;
import com.google.android.gms.internal.measurement.zznj;
import com.google.android.gms.internal.measurement.zznm;
import com.google.android.gms.internal.measurement.zznp;
import com.google.android.gms.internal.measurement.zzns;
import com.google.android.gms.internal.measurement.zznv;
import com.google.android.gms.internal.measurement.zzny;
import com.google.android.gms.internal.measurement.zzob;
import com.google.android.gms.internal.measurement.zzoe;
import com.google.android.gms.internal.measurement.zzoh;
import com.google.android.gms.internal.measurement.zzok;
import com.google.android.gms.internal.measurement.zzon;
import com.google.android.gms.internal.measurement.zzoq;
import com.google.android.gms.internal.measurement.zzot;
import com.google.android.gms.internal.measurement.zzow;
import com.google.android.gms.internal.measurement.zzoz;
import com.google.android.gms.internal.measurement.zzpc;
import com.google.android.gms.internal.measurement.zzpf;
import com.google.android.gms.internal.measurement.zzpi;
import com.google.android.gms.internal.measurement.zzpl;
import com.google.android.gms.internal.measurement.zzpo;
import com.google.android.gms.internal.measurement.zzpr;
import com.google.android.gms.internal.measurement.zzpu;
import com.google.android.gms.internal.measurement.zzpx;
import com.google.android.gms.internal.measurement.zzqa;
import com.google.android.gms.internal.measurement.zzqd;
import com.google.android.gms.internal.measurement.zzqg;
import com.google.android.gms.internal.measurement.zzqj;
import com.google.android.gms.internal.measurement.zzqm;
import com.google.firebase.messaging.ServiceStarter;
import com.helpshift.util.ErrorReportProvider;
import com.ironsource.sdk.constants.Constants;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

/* JADX INFO: compiled from: com.google.android.gms:play-services-measurement-impl@@19.0.1 */
/* JADX INFO: loaded from: classes.dex */
public final class zzdw {
    public static final zzdv<Long> zzA;
    public static final zzdv<Integer> zzB;
    public static final zzdv<Long> zzC;
    public static final zzdv<Integer> zzD;
    public static final zzdv<Integer> zzE;
    public static final zzdv<Integer> zzF;
    public static final zzdv<Integer> zzG;
    public static final zzdv<Integer> zzH;
    public static final zzdv<Long> zzI;
    public static final zzdv<Boolean> zzJ;
    public static final zzdv<String> zzK;
    public static final zzdv<Long> zzL;
    public static final zzdv<Integer> zzM;
    public static final zzdv<Double> zzN;
    public static final zzdv<Integer> zzO;
    public static final zzdv<Integer> zzP;
    public static final zzdv<Long> zzQ;
    public static final zzdv<Boolean> zzR;
    public static final zzdv<Boolean> zzS;
    public static final zzdv<Boolean> zzT;
    public static final zzdv<Boolean> zzU;
    public static final zzdv<Boolean> zzV;
    public static final zzdv<Boolean> zzW;
    public static final zzdv<Boolean> zzX;
    public static final zzdv<Boolean> zzY;
    public static final zzdv<Boolean> zzZ;
    public static final zzdv<Boolean> zzaA;
    public static final zzdv<Boolean> zzaa;
    public static final zzdv<Boolean> zzab;
    public static final zzdv<Boolean> zzac;
    public static final zzdv<Boolean> zzad;
    public static final zzdv<Boolean> zzae;
    public static final zzdv<Boolean> zzaf;
    public static final zzdv<Boolean> zzag;
    public static final zzdv<Boolean> zzah;
    public static final zzdv<Boolean> zzai;
    public static final zzdv<Boolean> zzaj;
    public static final zzdv<Boolean> zzak;
    public static final zzdv<Boolean> zzal;
    public static final zzdv<Boolean> zzam;
    public static final zzdv<Boolean> zzan;
    public static final zzdv<Integer> zzao;
    public static final zzdv<Boolean> zzap;
    public static final zzdv<Boolean> zzaq;
    public static final zzdv<Boolean> zzar;
    public static final zzdv<Boolean> zzas;
    public static final zzdv<Boolean> zzat;
    public static final zzdv<Boolean> zzau;
    public static final zzdv<Boolean> zzav;
    public static final zzdv<Boolean> zzaw;
    public static final zzdv<Boolean> zzax;
    public static final zzdv<Boolean> zzay;
    public static final zzdv<Boolean> zzaz;
    public static final zzdv<Long> zzb;
    public static final zzdv<Long> zzc;
    public static final zzdv<String> zzd;
    public static final zzdv<String> zze;
    public static final zzdv<Integer> zzf;
    public static final zzdv<Integer> zzg;
    public static final zzdv<Integer> zzh;
    public static final zzdv<Integer> zzi;
    public static final zzdv<Integer> zzj;
    public static final zzdv<Integer> zzk;
    public static final zzdv<Integer> zzl;
    public static final zzdv<Integer> zzm;
    public static final zzdv<Integer> zzn;
    public static final zzdv<Integer> zzo;
    public static final zzdv<String> zzp;
    public static final zzdv<Long> zzq;
    public static final zzdv<Long> zzr;
    public static final zzdv<Long> zzs;
    public static final zzdv<Long> zzt;
    public static final zzdv<Long> zzu;
    public static final zzdv<Long> zzv;
    public static final zzdv<Long> zzw;
    public static final zzdv<Long> zzx;
    public static final zzdv<Long> zzy;
    public static final zzdv<Long> zzz;
    private static final List<zzdv<?>> zzaB = Collections.synchronizedList(new ArrayList());
    private static final Set<zzdv<?>> zzaC = Collections.synchronizedSet(new HashSet());
    public static final zzdv<Long> zza = zza("measurement.ad_id_cache_time", 10000L, 10000L, new zzds() { // from class: com.google.android.gms.measurement.internal.zzav
        @Override // com.google.android.gms.measurement.internal.zzds
        public final Object zza() {
            zzdv<Long> zzdvVar = zzdw.zza;
            return Long.valueOf(zznm.zzb());
        }
    });

    static {
        Long lValueOf = Long.valueOf(ErrorReportProvider.BATCH_TIME);
        zzb = zza("measurement.monitoring.sample_period_millis", lValueOf, lValueOf, new zzds() { // from class: com.google.android.gms.measurement.internal.zzbg
            @Override // com.google.android.gms.measurement.internal.zzds
            public final Object zza() {
                zzdv<Long> zzdvVar = zzdw.zza;
                return Long.valueOf(zznm.zzl());
            }
        });
        zzc = zza("measurement.config.cache_time", lValueOf, 3600000L, new zzds() { // from class: com.google.android.gms.measurement.internal.zzay
            @Override // com.google.android.gms.measurement.internal.zzds
            public final Object zza() {
                zzdv<Long> zzdvVar = zzdw.zza;
                return Long.valueOf(zznm.zzd());
            }
        });
        zzd = zza("measurement.config.url_scheme", "https", "https", new zzds() { // from class: com.google.android.gms.measurement.internal.zzbk
            @Override // com.google.android.gms.measurement.internal.zzds
            public final Object zza() {
                zzdv<Long> zzdvVar = zzdw.zza;
                return zznm.zzJ();
            }
        });
        zze = zza("measurement.config.url_authority", "app-measurement.com", "app-measurement.com", new zzds() { // from class: com.google.android.gms.measurement.internal.zzbw
            @Override // com.google.android.gms.measurement.internal.zzds
            public final Object zza() {
                zzdv<Long> zzdvVar = zzdw.zza;
                return zznm.zzI();
            }
        });
        zzf = zza("measurement.upload.max_bundles", 100, 100, new zzds() { // from class: com.google.android.gms.measurement.internal.zzci
            @Override // com.google.android.gms.measurement.internal.zzds
            public final Object zza() {
                zzdv<Long> zzdvVar = zzdw.zza;
                return Integer.valueOf((int) zznm.zzv());
            }
        });
        zzg = zza("measurement.upload.max_batch_size", 65536, 65536, new zzds() { // from class: com.google.android.gms.measurement.internal.zzcu
            @Override // com.google.android.gms.measurement.internal.zzds
            public final Object zza() {
                zzdv<Long> zzdvVar = zzdw.zza;
                return Integer.valueOf((int) zznm.zzD());
            }
        });
        zzh = zza("measurement.upload.max_bundle_size", 65536, 65536, new zzds() { // from class: com.google.android.gms.measurement.internal.zzdg
            @Override // com.google.android.gms.measurement.internal.zzds
            public final Object zza() {
                zzdv<Long> zzdvVar = zzdw.zza;
                return Integer.valueOf((int) zznm.zzu());
            }
        });
        zzi = zza("measurement.upload.max_events_per_bundle", 1000, 1000, new zzds() { // from class: com.google.android.gms.measurement.internal.zzdn
            @Override // com.google.android.gms.measurement.internal.zzds
            public final Object zza() {
                zzdv<Long> zzdvVar = zzdw.zza;
                return Integer.valueOf((int) zznm.zzy());
            }
        });
        zzj = zza("measurement.upload.max_events_per_day", 100000, 100000, new zzds() { // from class: com.google.android.gms.measurement.internal.zzdo
            @Override // com.google.android.gms.measurement.internal.zzds
            public final Object zza() {
                zzdv<Long> zzdvVar = zzdw.zza;
                return Integer.valueOf((int) zznm.zzz());
            }
        });
        zzk = zza("measurement.upload.max_error_events_per_day", 1000, 1000, new zzds() { // from class: com.google.android.gms.measurement.internal.zzbr
            @Override // com.google.android.gms.measurement.internal.zzds
            public final Object zza() {
                zzdv<Long> zzdvVar = zzdw.zza;
                return Integer.valueOf((int) zznm.zzx());
            }
        });
        Integer numValueOf = Integer.valueOf(Constants.ControllerParameters.LOAD_RUNTIME);
        zzl = zza("measurement.upload.max_public_events_per_day", numValueOf, numValueOf, new zzds() { // from class: com.google.android.gms.measurement.internal.zzcc
            @Override // com.google.android.gms.measurement.internal.zzds
            public final Object zza() {
                zzdv<Long> zzdvVar = zzdw.zza;
                return Integer.valueOf((int) zznm.zzA());
            }
        });
        zzm = zza("measurement.upload.max_conversions_per_day", 10000, 10000, new zzds() { // from class: com.google.android.gms.measurement.internal.zzcn
            @Override // com.google.android.gms.measurement.internal.zzds
            public final Object zza() {
                zzdv<Long> zzdvVar = zzdw.zza;
                return Integer.valueOf((int) zznm.zzw());
            }
        });
        zzn = zza("measurement.upload.max_realtime_events_per_day", 10, 10, new zzds() { // from class: com.google.android.gms.measurement.internal.zzcy
            @Override // com.google.android.gms.measurement.internal.zzds
            public final Object zza() {
                zzdv<Long> zzdvVar = zzdw.zza;
                return Integer.valueOf((int) zznm.zzC());
            }
        });
        zzo = zza("measurement.store.max_stored_events_per_app", 100000, 100000, new zzds() { // from class: com.google.android.gms.measurement.internal.zzdj
            @Override // com.google.android.gms.measurement.internal.zzds
            public final Object zza() {
                zzdv<Long> zzdvVar = zzdw.zza;
                return Integer.valueOf((int) zznm.zzg());
            }
        });
        zzp = zza("measurement.upload.url", "https://app-measurement.com/a", "https://app-measurement.com/a", new zzds() { // from class: com.google.android.gms.measurement.internal.zzdp
            @Override // com.google.android.gms.measurement.internal.zzds
            public final Object zza() {
                zzdv<Long> zzdvVar = zzdw.zza;
                return zznm.zzK();
            }
        });
        zzq = zza("measurement.upload.backoff_period", 43200000L, 43200000L, new zzds() { // from class: com.google.android.gms.measurement.internal.zzdq
            @Override // com.google.android.gms.measurement.internal.zzds
            public final Object zza() {
                zzdv<Long> zzdvVar = zzdw.zza;
                return Long.valueOf(zznm.zzr());
            }
        });
        zzr = zza("measurement.upload.window_interval", 3600000L, 3600000L, new zzds() { // from class: com.google.android.gms.measurement.internal.zzdr
            @Override // com.google.android.gms.measurement.internal.zzds
            public final Object zza() {
                zzdv<Long> zzdvVar = zzdw.zza;
                return Long.valueOf(zznm.zzG());
            }
        });
        zzs = zza("measurement.upload.interval", 3600000L, 3600000L, new zzds() { // from class: com.google.android.gms.measurement.internal.zzaw
            @Override // com.google.android.gms.measurement.internal.zzds
            public final Object zza() {
                zzdv<Long> zzdvVar = zzdw.zza;
                return Long.valueOf(zznm.zzt());
            }
        });
        zzt = zza("measurement.upload.realtime_upload_interval", 10000L, 10000L, new zzds() { // from class: com.google.android.gms.measurement.internal.zzax
            @Override // com.google.android.gms.measurement.internal.zzds
            public final Object zza() {
                zzdv<Long> zzdvVar = zzdw.zza;
                return Long.valueOf(zznm.zzm());
            }
        });
        zzu = zza("measurement.upload.debug_upload_interval", 1000L, 1000L, new zzds() { // from class: com.google.android.gms.measurement.internal.zzaz
            @Override // com.google.android.gms.measurement.internal.zzds
            public final Object zza() {
                zzdv<Long> zzdvVar = zzdw.zza;
                return Long.valueOf(zznm.zze());
            }
        });
        zzv = zza("measurement.upload.minimum_delay", 500L, 500L, new zzds() { // from class: com.google.android.gms.measurement.internal.zzba
            @Override // com.google.android.gms.measurement.internal.zzds
            public final Object zza() {
                zzdv<Long> zzdvVar = zzdw.zza;
                return Long.valueOf(zznm.zzk());
            }
        });
        zzw = zza("measurement.alarm_manager.minimum_interval", 60000L, 60000L, new zzds() { // from class: com.google.android.gms.measurement.internal.zzbb
            @Override // com.google.android.gms.measurement.internal.zzds
            public final Object zza() {
                zzdv<Long> zzdvVar = zzdw.zza;
                return Long.valueOf(zznm.zzj());
            }
        });
        zzx = zza("measurement.upload.stale_data_deletion_interval", lValueOf, lValueOf, new zzds() { // from class: com.google.android.gms.measurement.internal.zzbc
            @Override // com.google.android.gms.measurement.internal.zzds
            public final Object zza() {
                zzdv<Long> zzdvVar = zzdw.zza;
                return Long.valueOf(zznm.zzp());
            }
        });
        zzy = zza("measurement.upload.refresh_blacklisted_config_interval", 604800000L, 604800000L, new zzds() { // from class: com.google.android.gms.measurement.internal.zzbd
            @Override // com.google.android.gms.measurement.internal.zzds
            public final Object zza() {
                zzdv<Long> zzdvVar = zzdw.zza;
                return Long.valueOf(zznm.zzn());
            }
        });
        zzz = zza("measurement.upload.initial_upload_delay_time", 15000L, 15000L, new zzds() { // from class: com.google.android.gms.measurement.internal.zzbe
            @Override // com.google.android.gms.measurement.internal.zzds
            public final Object zza() {
                zzdv<Long> zzdvVar = zzdw.zza;
                return Long.valueOf(zznm.zzs());
            }
        });
        zzA = zza("measurement.upload.retry_time", 1800000L, 1800000L, new zzds() { // from class: com.google.android.gms.measurement.internal.zzbf
            @Override // com.google.android.gms.measurement.internal.zzds
            public final Object zza() {
                zzdv<Long> zzdvVar = zzdw.zza;
                return Long.valueOf(zznm.zzF());
            }
        });
        zzB = zza("measurement.upload.retry_count", 6, 6, new zzds() { // from class: com.google.android.gms.measurement.internal.zzbh
            @Override // com.google.android.gms.measurement.internal.zzds
            public final Object zza() {
                zzdv<Long> zzdvVar = zzdw.zza;
                return Integer.valueOf((int) zznm.zzE());
            }
        });
        zzC = zza("measurement.upload.max_queue_time", 2419200000L, 2419200000L, new zzds() { // from class: com.google.android.gms.measurement.internal.zzbi
            @Override // com.google.android.gms.measurement.internal.zzds
            public final Object zza() {
                zzdv<Long> zzdvVar = zzdw.zza;
                return Long.valueOf(zznm.zzB());
            }
        });
        zzD = zza("measurement.lifetimevalue.max_currency_tracked", 4, 4, new zzds() { // from class: com.google.android.gms.measurement.internal.zzbj
            @Override // com.google.android.gms.measurement.internal.zzds
            public final Object zza() {
                zzdv<Long> zzdvVar = zzdw.zza;
                return Integer.valueOf((int) zznm.zzf());
            }
        });
        zzE = zza("measurement.audience.filter_result_max_count", 200, 200, new zzds() { // from class: com.google.android.gms.measurement.internal.zzbl
            @Override // com.google.android.gms.measurement.internal.zzds
            public final Object zza() {
                zzdv<Long> zzdvVar = zzdw.zza;
                return Integer.valueOf((int) zznm.zzi());
            }
        });
        zzF = zza("measurement.upload.max_public_user_properties", 25, 25, null);
        Integer numValueOf2 = Integer.valueOf(ServiceStarter.ERROR_UNKNOWN);
        zzG = zza("measurement.upload.max_event_name_cardinality", numValueOf2, numValueOf2, null);
        zzH = zza("measurement.upload.max_public_event_params", 25, 25, null);
        zzI = zza("measurement.service_client.idle_disconnect_millis", 5000L, 5000L, new zzds() { // from class: com.google.android.gms.measurement.internal.zzbm
            @Override // com.google.android.gms.measurement.internal.zzds
            public final Object zza() {
                zzdv<Long> zzdvVar = zzdw.zza;
                return Long.valueOf(zznm.zzo());
            }
        });
        zzJ = zza("measurement.test.boolean_flag", false, false, new zzds() { // from class: com.google.android.gms.measurement.internal.zzbn
            @Override // com.google.android.gms.measurement.internal.zzds
            public final Object zza() {
                zzdv<Long> zzdvVar = zzdw.zza;
                return Boolean.valueOf(zzpi.zzg());
            }
        });
        zzK = zza("measurement.test.string_flag", "---", "---", new zzds() { // from class: com.google.android.gms.measurement.internal.zzbo
            @Override // com.google.android.gms.measurement.internal.zzds
            public final Object zza() {
                zzdv<Long> zzdvVar = zzdw.zza;
                return zzpi.zzf();
            }
        });
        zzL = zza("measurement.test.long_flag", -1L, -1L, new zzds() { // from class: com.google.android.gms.measurement.internal.zzbp
            @Override // com.google.android.gms.measurement.internal.zzds
            public final Object zza() {
                zzdv<Long> zzdvVar = zzdw.zza;
                return Long.valueOf(zzpi.zzd());
            }
        });
        zzM = zza("measurement.test.int_flag", -2, -2, new zzds() { // from class: com.google.android.gms.measurement.internal.zzbq
            @Override // com.google.android.gms.measurement.internal.zzds
            public final Object zza() {
                zzdv<Long> zzdvVar = zzdw.zza;
                return Integer.valueOf((int) zzpi.zzc());
            }
        });
        Double dValueOf = Double.valueOf(-3.0d);
        zzN = zza("measurement.test.double_flag", dValueOf, dValueOf, new zzds() { // from class: com.google.android.gms.measurement.internal.zzbs
            @Override // com.google.android.gms.measurement.internal.zzds
            public final Object zza() {
                zzdv<Long> zzdvVar = zzdw.zza;
                return Double.valueOf(zzpi.zzb());
            }
        });
        zzO = zza("measurement.experiment.max_ids", 50, 50, new zzds() { // from class: com.google.android.gms.measurement.internal.zzbt
            @Override // com.google.android.gms.measurement.internal.zzds
            public final Object zza() {
                zzdv<Long> zzdvVar = zzdw.zza;
                return Integer.valueOf((int) zznm.zzh());
            }
        });
        zzP = zza("measurement.max_bundles_per_iteration", 100, 100, new zzds() { // from class: com.google.android.gms.measurement.internal.zzbu
            @Override // com.google.android.gms.measurement.internal.zzds
            public final Object zza() {
                zzdv<Long> zzdvVar = zzdw.zza;
                return Integer.valueOf((int) zznm.zzc());
            }
        });
        zzQ = zza("measurement.sdk.attribution.cache.ttl", 604800000L, 604800000L, new zzds() { // from class: com.google.android.gms.measurement.internal.zzbv
            @Override // com.google.android.gms.measurement.internal.zzds
            public final Object zza() {
                zzdv<Long> zzdvVar = zzdw.zza;
                return Long.valueOf(zznm.zzq());
            }
        });
        zzR = zza("measurement.validation.internal_limits_internal_event_params", false, false, new zzds() { // from class: com.google.android.gms.measurement.internal.zzbx
            @Override // com.google.android.gms.measurement.internal.zzds
            public final Object zza() {
                zzdv<Long> zzdvVar = zzdw.zza;
                return Boolean.valueOf(zzpc.zzc());
            }
        });
        zzS = zza("measurement.collection.firebase_global_collection_flag_enabled", true, true, new zzds() { // from class: com.google.android.gms.measurement.internal.zzby
            @Override // com.google.android.gms.measurement.internal.zzds
            public final Object zza() {
                zzdv<Long> zzdvVar = zzdw.zza;
                return Boolean.valueOf(zzon.zzc());
            }
        });
        zzT = zza("measurement.collection.redundant_engagement_removal_enabled", false, false, new zzds() { // from class: com.google.android.gms.measurement.internal.zzbz
            @Override // com.google.android.gms.measurement.internal.zzds
            public final Object zza() {
                zzdv<Long> zzdvVar = zzdw.zza;
                return Boolean.valueOf(zzok.zzc());
            }
        });
        zzU = zza("measurement.collection.log_event_and_bundle_v2", true, true, new zzds() { // from class: com.google.android.gms.measurement.internal.zzca
            @Override // com.google.android.gms.measurement.internal.zzds
            public final Object zza() {
                zzdv<Long> zzdvVar = zzdw.zza;
                return Boolean.valueOf(zzpo.zzc());
            }
        });
        zzV = zza("measurement.quality.checksum", false, false, null);
        zzW = zza("measurement.audience.use_bundle_end_timestamp_for_non_sequence_property_filters", false, false, new zzds() { // from class: com.google.android.gms.measurement.internal.zzcb
            @Override // com.google.android.gms.measurement.internal.zzds
            public final Object zza() {
                zzdv<Long> zzdvVar = zzdw.zza;
                return Boolean.valueOf(zzoe.zze());
            }
        });
        zzX = zza("measurement.audience.refresh_event_count_filters_timestamp", false, false, new zzds() { // from class: com.google.android.gms.measurement.internal.zzcd
            @Override // com.google.android.gms.measurement.internal.zzds
            public final Object zza() {
                zzdv<Long> zzdvVar = zzdw.zza;
                return Boolean.valueOf(zzoe.zzd());
            }
        });
        zzY = zza("measurement.audience.use_bundle_timestamp_for_event_count_filters", false, false, new zzds() { // from class: com.google.android.gms.measurement.internal.zzce
            @Override // com.google.android.gms.measurement.internal.zzds
            public final Object zza() {
                zzdv<Long> zzdvVar = zzdw.zza;
                return Boolean.valueOf(zzoe.zzf());
            }
        });
        zzZ = zza("measurement.sdk.collection.retrieve_deeplink_from_bow_2", true, true, new zzds() { // from class: com.google.android.gms.measurement.internal.zzcf
            @Override // com.google.android.gms.measurement.internal.zzds
            public final Object zza() {
                zzdv<Long> zzdvVar = zzdw.zza;
                return Boolean.valueOf(zzqg.zzc());
            }
        });
        zzaa = zza("measurement.sdk.collection.last_deep_link_referrer_campaign2", false, false, new zzds() { // from class: com.google.android.gms.measurement.internal.zzcg
            @Override // com.google.android.gms.measurement.internal.zzds
            public final Object zza() {
                zzdv<Long> zzdvVar = zzdw.zza;
                return Boolean.valueOf(zzot.zzd());
            }
        });
        zzab = zza("measurement.sdk.collection.enable_extend_user_property_size", true, true, new zzds() { // from class: com.google.android.gms.measurement.internal.zzch
            @Override // com.google.android.gms.measurement.internal.zzds
            public final Object zza() {
                zzdv<Long> zzdvVar = zzdw.zza;
                return Boolean.valueOf(zzot.zzc());
            }
        });
        zzac = zza("measurement.upload.file_lock_state_check", true, true, new zzds() { // from class: com.google.android.gms.measurement.internal.zzcj
            @Override // com.google.android.gms.measurement.internal.zzds
            public final Object zza() {
                zzdv<Long> zzdvVar = zzdw.zza;
                return Boolean.valueOf(zzqm.zzc());
            }
        });
        zzad = zza("measurement.ga.ga_app_id", false, false, new zzds() { // from class: com.google.android.gms.measurement.internal.zzck
            @Override // com.google.android.gms.measurement.internal.zzds
            public final Object zza() {
                zzdv<Long> zzdvVar = zzdw.zza;
                return Boolean.valueOf(zzoq.zzd());
            }
        });
        zzae = zza("measurement.lifecycle.app_in_background_parameter", false, false, new zzds() { // from class: com.google.android.gms.measurement.internal.zzcl
            @Override // com.google.android.gms.measurement.internal.zzds
            public final Object zza() {
                zzdv<Long> zzdvVar = zzdw.zza;
                return Boolean.valueOf(zzow.zzd());
            }
        });
        zzaf = zza("measurement.integration.disable_firebase_instance_id", false, false, new zzds() { // from class: com.google.android.gms.measurement.internal.zzcm
            @Override // com.google.android.gms.measurement.internal.zzds
            public final Object zza() {
                zzdv<Long> zzdvVar = zzdw.zza;
                return Boolean.valueOf(zzqd.zzd());
            }
        });
        zzag = zza("measurement.lifecycle.app_backgrounded_engagement", false, false, new zzds() { // from class: com.google.android.gms.measurement.internal.zzco
            @Override // com.google.android.gms.measurement.internal.zzds
            public final Object zza() {
                zzdv<Long> zzdvVar = zzdw.zza;
                return Boolean.valueOf(zzow.zzc());
            }
        });
        zzah = zza("measurement.collection.service.update_with_analytics_fix", false, false, new zzds() { // from class: com.google.android.gms.measurement.internal.zzcp
            @Override // com.google.android.gms.measurement.internal.zzds
            public final Object zza() {
                zzdv<Long> zzdvVar = zzdw.zza;
                return Boolean.valueOf(zzqj.zzc());
            }
        });
        zzai = zza("measurement.client.firebase_feature_rollout.v1.enable", true, true, new zzds() { // from class: com.google.android.gms.measurement.internal.zzcq
            @Override // com.google.android.gms.measurement.internal.zzds
            public final Object zza() {
                zzdv<Long> zzdvVar = zzdw.zza;
                return Boolean.valueOf(zzny.zzd());
            }
        });
        zzaj = zza("measurement.client.sessions.check_on_reset_and_enable2", true, true, new zzds() { // from class: com.google.android.gms.measurement.internal.zzcr
            @Override // com.google.android.gms.measurement.internal.zzds
            public final Object zza() {
                zzdv<Long> zzdvVar = zzdw.zza;
                return Boolean.valueOf(zzoh.zzd());
            }
        });
        zzak = zza("measurement.scheduler.task_thread.cleanup_on_exit", false, false, new zzds() { // from class: com.google.android.gms.measurement.internal.zzcs
            @Override // com.google.android.gms.measurement.internal.zzds
            public final Object zza() {
                zzdv<Long> zzdvVar = zzdw.zza;
                return Boolean.valueOf(zzpu.zzc());
            }
        });
        zzal = zza("measurement.upload.file_truncate_fix", false, false, new zzds() { // from class: com.google.android.gms.measurement.internal.zzct
            @Override // com.google.android.gms.measurement.internal.zzds
            public final Object zza() {
                zzdv<Long> zzdvVar = zzdw.zza;
                return Boolean.valueOf(zznv.zzc());
            }
        });
        zzam = zza("measurement.collection.synthetic_data_mitigation", false, false, new zzds() { // from class: com.google.android.gms.measurement.internal.zzcv
            @Override // com.google.android.gms.measurement.internal.zzds
            public final Object zza() {
                zzdv<Long> zzdvVar = zzdw.zza;
                return Boolean.valueOf(zzqa.zzc());
            }
        });
        zzan = zza("measurement.androidId.delete_feature", true, true, new zzds() { // from class: com.google.android.gms.measurement.internal.zzcw
            @Override // com.google.android.gms.measurement.internal.zzds
            public final Object zza() {
                zzdv<Long> zzdvVar = zzdw.zza;
                return Boolean.valueOf(zznd.zzc());
            }
        });
        zzao = zza("measurement.service.storage_consent_support_version", 203600, 203600, new zzds() { // from class: com.google.android.gms.measurement.internal.zzcx
            @Override // com.google.android.gms.measurement.internal.zzds
            public final Object zza() {
                zzdv<Long> zzdvVar = zzdw.zza;
                return Integer.valueOf((int) zznp.zzb());
            }
        });
        zzap = zza("measurement.client.properties.non_null_origin", true, true, new zzds() { // from class: com.google.android.gms.measurement.internal.zzcz
            @Override // com.google.android.gms.measurement.internal.zzds
            public final Object zza() {
                zzdv<Long> zzdvVar = zzdw.zza;
                return Boolean.valueOf(zzoz.zzc());
            }
        });
        zzaq = zza("measurement.client.click_identifier_control.dev", false, false, new zzds() { // from class: com.google.android.gms.measurement.internal.zzda
            @Override // com.google.android.gms.measurement.internal.zzds
            public final Object zza() {
                zzdv<Long> zzdvVar = zzdw.zza;
                return Boolean.valueOf(zzng.zzc());
            }
        });
        zzar = zza("measurement.service.click_identifier_control", false, false, new zzds() { // from class: com.google.android.gms.measurement.internal.zzdb
            @Override // com.google.android.gms.measurement.internal.zzds
            public final Object zza() {
                zzdv<Long> zzdvVar = zzdw.zza;
                return Boolean.valueOf(zznj.zzc());
            }
        });
        zzas = zza("measurement.client.reject_blank_user_id", true, true, new zzds() { // from class: com.google.android.gms.measurement.internal.zzdc
            @Override // com.google.android.gms.measurement.internal.zzds
            public final Object zza() {
                zzdv<Long> zzdvVar = zzdw.zza;
                return Boolean.valueOf(zzpr.zzc());
            }
        });
        zzat = zza("measurement.config.persist_last_modified", true, true, new zzds() { // from class: com.google.android.gms.measurement.internal.zzdd
            @Override // com.google.android.gms.measurement.internal.zzds
            public final Object zza() {
                zzdv<Long> zzdvVar = zzdw.zza;
                return Boolean.valueOf(zzpf.zzd());
            }
        });
        zzau = zza("measurement.client.consent.suppress_1p_in_ga4f_install", true, true, new zzds() { // from class: com.google.android.gms.measurement.internal.zzde
            @Override // com.google.android.gms.measurement.internal.zzds
            public final Object zza() {
                zzdv<Long> zzdvVar = zzdw.zza;
                return Boolean.valueOf(zzob.zzd());
            }
        });
        zzav = zza("measurement.module.pixie.ees", false, false, new zzds() { // from class: com.google.android.gms.measurement.internal.zzdf
            @Override // com.google.android.gms.measurement.internal.zzds
            public final Object zza() {
                zzdv<Long> zzdvVar = zzdw.zza;
                return Boolean.valueOf(zzpl.zzd());
            }
        });
        zzaw = zza("measurement.euid.client.dev", false, false, new zzds() { // from class: com.google.android.gms.measurement.internal.zzdh
            @Override // com.google.android.gms.measurement.internal.zzds
            public final Object zza() {
                zzdv<Long> zzdvVar = zzdw.zza;
                return Boolean.valueOf(zzns.zzc());
            }
        });
        zzax = zza("measurement.euid.service", false, false, new zzds() { // from class: com.google.android.gms.measurement.internal.zzdi
            @Override // com.google.android.gms.measurement.internal.zzds
            public final Object zza() {
                zzdv<Long> zzdvVar = zzdw.zza;
                return Boolean.valueOf(zzns.zzd());
            }
        });
        zzay = zza("measurement.adid_zero.service", false, false, new zzds() { // from class: com.google.android.gms.measurement.internal.zzdk
            @Override // com.google.android.gms.measurement.internal.zzds
            public final Object zza() {
                zzdv<Long> zzdvVar = zzdw.zza;
                return Boolean.valueOf(zzna.zzd());
            }
        });
        zzaz = zza("measurement.adid_zero.remove_lair_if_adidzero_false", true, true, new zzds() { // from class: com.google.android.gms.measurement.internal.zzdl
            @Override // com.google.android.gms.measurement.internal.zzds
            public final Object zza() {
                zzdv<Long> zzdvVar = zzdw.zza;
                return Boolean.valueOf(zzna.zze());
            }
        });
        zzaA = zza("measurement.service.refactor.package_side_screen", true, true, new zzds() { // from class: com.google.android.gms.measurement.internal.zzdm
            @Override // com.google.android.gms.measurement.internal.zzds
            public final Object zza() {
                zzdv<Long> zzdvVar = zzdw.zza;
                return Boolean.valueOf(zzpx.zzd());
            }
        });
    }

    static <V> zzdv<V> zza(String str, V v, V v2, zzds<V> zzdsVar) {
        zzdv<V> zzdvVar = new zzdv<>(str, v, v2, zzdsVar, null);
        zzaB.add(zzdvVar);
        return zzdvVar;
    }

    public static Map<String, String> zzc(Context context) {
        com.google.android.gms.internal.measurement.zzha zzhaVarZza = com.google.android.gms.internal.measurement.zzha.zza(context.getContentResolver(), com.google.android.gms.internal.measurement.zzhk.zza("com.google.android.gms.measurement"));
        return zzhaVarZza == null ? Collections.emptyMap() : zzhaVarZza.zzc();
    }
}
