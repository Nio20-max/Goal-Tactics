package com.google.android.gms.measurement.internal;

import android.os.Bundle;
import android.text.TextUtils;
import com.google.android.gms.common.internal.Preconditions;
import java.util.Iterator;

/* JADX INFO: compiled from: com.google.android.gms:play-services-measurement-impl@@19.0.1 */
/* JADX INFO: loaded from: classes.dex */
public final class zzao {
    final String zza;
    final String zzb;
    final String zzc;
    final long zzd;
    final long zze;
    final zzar zzf;

    zzao(zzfs zzfsVar, String str, String str2, String str3, long j, long j2, Bundle bundle) {
        zzar zzarVar;
        Preconditions.checkNotEmpty(str2);
        Preconditions.checkNotEmpty(str3);
        this.zza = str2;
        this.zzb = str3;
        this.zzc = true == TextUtils.isEmpty(str) ? null : str;
        this.zzd = j;
        this.zze = j2;
        if (j2 != 0 && j2 > j) {
            zzfsVar.zzay().zzk().zzb("Event created with reverse previous/current timestamps. appId", zzei.zzn(str2));
        }
        if (bundle == null || bundle.isEmpty()) {
            zzarVar = new zzar(new Bundle());
        } else {
            Bundle bundle2 = new Bundle(bundle);
            Iterator<String> it = bundle2.keySet().iterator();
            while (it.hasNext()) {
                String next = it.next();
                if (next == null) {
                    zzfsVar.zzay().zzd().zza("Param name can't be null");
                    it.remove();
                } else {
                    Object objZzA = zzfsVar.zzv().zzA(next, bundle2.get(next));
                    if (objZzA == null) {
                        zzfsVar.zzay().zzk().zzb("Param value can't be null", zzfsVar.zzj().zzd(next));
                        it.remove();
                    } else {
                        zzfsVar.zzv().zzN(bundle2, next, objZzA);
                    }
                }
            }
            zzarVar = new zzar(bundle2);
        }
        this.zzf = zzarVar;
    }

    public final String toString() {
        String str = this.zza;
        String str2 = this.zzb;
        String strValueOf = String.valueOf(this.zzf);
        int length = String.valueOf(str).length();
        StringBuilder sb = new StringBuilder(length + 33 + String.valueOf(str2).length() + String.valueOf(strValueOf).length());
        sb.append("Event{appId='");
        sb.append(str);
        sb.append("', name='");
        sb.append(str2);
        sb.append("', params=");
        sb.append(strValueOf);
        sb.append('}');
        return sb.toString();
    }

    final zzao zza(zzfs zzfsVar, long j) {
        return new zzao(zzfsVar, this.zzc, this.zza, this.zzb, this.zzd, j, this.zzf);
    }

    private zzao(zzfs zzfsVar, String str, String str2, String str3, long j, long j2, zzar zzarVar) {
        Preconditions.checkNotEmpty(str2);
        Preconditions.checkNotEmpty(str3);
        Preconditions.checkNotNull(zzarVar);
        this.zza = str2;
        this.zzb = str3;
        this.zzc = true == TextUtils.isEmpty(str) ? null : str;
        this.zzd = j;
        this.zze = j2;
        if (j2 != 0 && j2 > j) {
            zzfsVar.zzay().zzk().zzc("Event created with reverse previous/current timestamps. appId, name", zzei.zzn(str2), zzei.zzn(str3));
        }
        this.zzf = zzarVar;
    }
}
