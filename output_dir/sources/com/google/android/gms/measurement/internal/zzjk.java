package com.google.android.gms.measurement.internal;

import android.util.Pair;
import com.google.android.gms.ads.identifier.AdvertisingIdClient;
import java.math.BigInteger;
import java.security.MessageDigest;
import java.util.Locale;

/* JADX INFO: compiled from: com.google.android.gms:play-services-measurement@@19.0.1 */
/* JADX INFO: loaded from: classes.dex */
public final class zzjk extends zzkd {
    public final zzet zza;
    public final zzet zzb;
    public final zzet zzc;
    public final zzet zzd;
    public final zzet zze;
    private String zzg;
    private boolean zzh;
    private long zzi;

    zzjk(zzkn zzknVar) {
        super(zzknVar);
        zzex zzexVarZzm = this.zzs.zzm();
        zzexVarZzm.getClass();
        this.zza = new zzet(zzexVarZzm, "last_delete_stale", 0L);
        zzex zzexVarZzm2 = this.zzs.zzm();
        zzexVarZzm2.getClass();
        this.zzb = new zzet(zzexVarZzm2, "backoff", 0L);
        zzex zzexVarZzm3 = this.zzs.zzm();
        zzexVarZzm3.getClass();
        this.zzc = new zzet(zzexVarZzm3, "last_upload", 0L);
        zzex zzexVarZzm4 = this.zzs.zzm();
        zzexVarZzm4.getClass();
        this.zzd = new zzet(zzexVarZzm4, "last_upload_attempt", 0L);
        zzex zzexVarZzm5 = this.zzs.zzm();
        zzexVarZzm5.getClass();
        this.zze = new zzet(zzexVarZzm5, "midnight_offset", 0L);
    }

    @Deprecated
    final Pair<String, Boolean> zza(String str) {
        zzg();
        long jElapsedRealtime = this.zzs.zzav().elapsedRealtime();
        String str2 = this.zzg;
        if (str2 != null && jElapsedRealtime < this.zzi) {
            return new Pair<>(str2, Boolean.valueOf(this.zzh));
        }
        this.zzi = jElapsedRealtime + this.zzs.zzf().zzi(str, zzdw.zza);
        AdvertisingIdClient.setShouldSkipGmsCoreVersionCheck(true);
        try {
            AdvertisingIdClient.Info advertisingIdInfo = AdvertisingIdClient.getAdvertisingIdInfo(this.zzs.zzau());
            this.zzg = "";
            String id = advertisingIdInfo.getId();
            if (id != null) {
                this.zzg = id;
            }
            this.zzh = advertisingIdInfo.isLimitAdTrackingEnabled();
        } catch (Exception e) {
            this.zzs.zzay().zzc().zzb("Unable to get advertising id", e);
            this.zzg = "";
        }
        AdvertisingIdClient.setShouldSkipGmsCoreVersionCheck(false);
        return new Pair<>(this.zzg, Boolean.valueOf(this.zzh));
    }

    @Override // com.google.android.gms.measurement.internal.zzkd
    protected final boolean zzb() {
        return false;
    }

    final Pair<String, Boolean> zzd(String str, zzag zzagVar) {
        return zzagVar.zzj() ? zza(str) : new Pair<>("", false);
    }

    @Deprecated
    final String zzf(String str) {
        zzg();
        String str2 = (String) zza(str).first;
        MessageDigest messageDigestZzE = zzku.zzE("MD5");
        if (messageDigestZzE == null) {
            return null;
        }
        return String.format(Locale.US, "%032X", new BigInteger(1, messageDigestZzE.digest(str2.getBytes())));
    }
}
