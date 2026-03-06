package com.google.android.gms.measurement.internal;

import android.os.Bundle;
import android.os.IBinder;
import android.os.Parcel;
import android.os.RemoteException;
import java.util.ArrayList;
import java.util.List;

/* JADX INFO: compiled from: com.google.android.gms:play-services-measurement-impl@@19.0.1 */
/* JADX INFO: loaded from: classes.dex */
public final class zzdx extends com.google.android.gms.internal.measurement.zzbm implements zzdz {
    zzdx(IBinder iBinder) {
        super(iBinder, "com.google.android.gms.measurement.internal.IMeasurementService");
    }

    @Override // com.google.android.gms.measurement.internal.zzdz
    public final String zzd(zzp zzpVar) throws RemoteException {
        Parcel parcelZza = zza();
        com.google.android.gms.internal.measurement.zzbo.zzd(parcelZza, zzpVar);
        Parcel parcelZzb = zzb(11, parcelZza);
        String string = parcelZzb.readString();
        parcelZzb.recycle();
        return string;
    }

    @Override // com.google.android.gms.measurement.internal.zzdz
    public final List<zzkq> zze(zzp zzpVar, boolean z) throws RemoteException {
        Parcel parcelZza = zza();
        com.google.android.gms.internal.measurement.zzbo.zzd(parcelZza, zzpVar);
        com.google.android.gms.internal.measurement.zzbo.zzc(parcelZza, z);
        Parcel parcelZzb = zzb(7, parcelZza);
        ArrayList arrayListCreateTypedArrayList = parcelZzb.createTypedArrayList(zzkq.CREATOR);
        parcelZzb.recycle();
        return arrayListCreateTypedArrayList;
    }

    @Override // com.google.android.gms.measurement.internal.zzdz
    public final List<zzab> zzf(String str, String str2, zzp zzpVar) throws RemoteException {
        Parcel parcelZza = zza();
        parcelZza.writeString(str);
        parcelZza.writeString(str2);
        com.google.android.gms.internal.measurement.zzbo.zzd(parcelZza, zzpVar);
        Parcel parcelZzb = zzb(16, parcelZza);
        ArrayList arrayListCreateTypedArrayList = parcelZzb.createTypedArrayList(zzab.CREATOR);
        parcelZzb.recycle();
        return arrayListCreateTypedArrayList;
    }

    @Override // com.google.android.gms.measurement.internal.zzdz
    public final List<zzab> zzg(String str, String str2, String str3) throws RemoteException {
        Parcel parcelZza = zza();
        parcelZza.writeString(null);
        parcelZza.writeString(str2);
        parcelZza.writeString(str3);
        Parcel parcelZzb = zzb(17, parcelZza);
        ArrayList arrayListCreateTypedArrayList = parcelZzb.createTypedArrayList(zzab.CREATOR);
        parcelZzb.recycle();
        return arrayListCreateTypedArrayList;
    }

    @Override // com.google.android.gms.measurement.internal.zzdz
    public final List<zzkq> zzh(String str, String str2, boolean z, zzp zzpVar) throws RemoteException {
        Parcel parcelZza = zza();
        parcelZza.writeString(str);
        parcelZza.writeString(str2);
        com.google.android.gms.internal.measurement.zzbo.zzc(parcelZza, z);
        com.google.android.gms.internal.measurement.zzbo.zzd(parcelZza, zzpVar);
        Parcel parcelZzb = zzb(14, parcelZza);
        ArrayList arrayListCreateTypedArrayList = parcelZzb.createTypedArrayList(zzkq.CREATOR);
        parcelZzb.recycle();
        return arrayListCreateTypedArrayList;
    }

    @Override // com.google.android.gms.measurement.internal.zzdz
    public final List<zzkq> zzi(String str, String str2, String str3, boolean z) throws RemoteException {
        Parcel parcelZza = zza();
        parcelZza.writeString(null);
        parcelZza.writeString(str2);
        parcelZza.writeString(str3);
        com.google.android.gms.internal.measurement.zzbo.zzc(parcelZza, z);
        Parcel parcelZzb = zzb(15, parcelZza);
        ArrayList arrayListCreateTypedArrayList = parcelZzb.createTypedArrayList(zzkq.CREATOR);
        parcelZzb.recycle();
        return arrayListCreateTypedArrayList;
    }

    @Override // com.google.android.gms.measurement.internal.zzdz
    public final void zzj(zzp zzpVar) throws RemoteException {
        Parcel parcelZza = zza();
        com.google.android.gms.internal.measurement.zzbo.zzd(parcelZza, zzpVar);
        zzc(4, parcelZza);
    }

    @Override // com.google.android.gms.measurement.internal.zzdz
    public final void zzk(zzat zzatVar, zzp zzpVar) throws RemoteException {
        Parcel parcelZza = zza();
        com.google.android.gms.internal.measurement.zzbo.zzd(parcelZza, zzatVar);
        com.google.android.gms.internal.measurement.zzbo.zzd(parcelZza, zzpVar);
        zzc(1, parcelZza);
    }

    @Override // com.google.android.gms.measurement.internal.zzdz
    public final void zzl(zzat zzatVar, String str, String str2) throws RemoteException {
        throw null;
    }

    @Override // com.google.android.gms.measurement.internal.zzdz
    public final void zzm(zzp zzpVar) throws RemoteException {
        Parcel parcelZza = zza();
        com.google.android.gms.internal.measurement.zzbo.zzd(parcelZza, zzpVar);
        zzc(18, parcelZza);
    }

    @Override // com.google.android.gms.measurement.internal.zzdz
    public final void zzn(zzab zzabVar, zzp zzpVar) throws RemoteException {
        Parcel parcelZza = zza();
        com.google.android.gms.internal.measurement.zzbo.zzd(parcelZza, zzabVar);
        com.google.android.gms.internal.measurement.zzbo.zzd(parcelZza, zzpVar);
        zzc(12, parcelZza);
    }

    @Override // com.google.android.gms.measurement.internal.zzdz
    public final void zzo(zzab zzabVar) throws RemoteException {
        throw null;
    }

    @Override // com.google.android.gms.measurement.internal.zzdz
    public final void zzp(zzp zzpVar) throws RemoteException {
        Parcel parcelZza = zza();
        com.google.android.gms.internal.measurement.zzbo.zzd(parcelZza, zzpVar);
        zzc(20, parcelZza);
    }

    @Override // com.google.android.gms.measurement.internal.zzdz
    public final void zzq(long j, String str, String str2, String str3) throws RemoteException {
        Parcel parcelZza = zza();
        parcelZza.writeLong(j);
        parcelZza.writeString(str);
        parcelZza.writeString(str2);
        parcelZza.writeString(str3);
        zzc(10, parcelZza);
    }

    @Override // com.google.android.gms.measurement.internal.zzdz
    public final void zzr(Bundle bundle, zzp zzpVar) throws RemoteException {
        Parcel parcelZza = zza();
        com.google.android.gms.internal.measurement.zzbo.zzd(parcelZza, bundle);
        com.google.android.gms.internal.measurement.zzbo.zzd(parcelZza, zzpVar);
        zzc(19, parcelZza);
    }

    @Override // com.google.android.gms.measurement.internal.zzdz
    public final void zzs(zzp zzpVar) throws RemoteException {
        Parcel parcelZza = zza();
        com.google.android.gms.internal.measurement.zzbo.zzd(parcelZza, zzpVar);
        zzc(6, parcelZza);
    }

    @Override // com.google.android.gms.measurement.internal.zzdz
    public final void zzt(zzkq zzkqVar, zzp zzpVar) throws RemoteException {
        Parcel parcelZza = zza();
        com.google.android.gms.internal.measurement.zzbo.zzd(parcelZza, zzkqVar);
        com.google.android.gms.internal.measurement.zzbo.zzd(parcelZza, zzpVar);
        zzc(2, parcelZza);
    }

    @Override // com.google.android.gms.measurement.internal.zzdz
    public final byte[] zzu(zzat zzatVar, String str) throws RemoteException {
        Parcel parcelZza = zza();
        com.google.android.gms.internal.measurement.zzbo.zzd(parcelZza, zzatVar);
        parcelZza.writeString(str);
        Parcel parcelZzb = zzb(9, parcelZza);
        byte[] bArrCreateByteArray = parcelZzb.createByteArray();
        parcelZzb.recycle();
        return bArrCreateByteArray;
    }
}
