package com.google.android.gms.internal.play_billing;

import android.os.Bundle;
import android.os.IBinder;
import android.os.Parcel;
import android.os.RemoteException;
import androidx.constraintlayout.core.motion.utils.TypedValues;
import com.android.billingclient.api.BillingClient;

/* JADX INFO: compiled from: com.android.billingclient:billing@@4.0.0 */
/* JADX INFO: loaded from: classes.dex */
public final class zzb extends zze implements zzd {
    zzb(IBinder iBinder) {
        super(iBinder, "com.android.vending.billing.IInAppBillingService");
    }

    @Override // com.google.android.gms.internal.play_billing.zzd
    public final int zza(int i, String str, String str2) throws RemoteException {
        Parcel parcelZzn = zzn();
        parcelZzn.writeInt(3);
        parcelZzn.writeString(str);
        parcelZzn.writeString(str2);
        Parcel parcelZzo = zzo(5, parcelZzn);
        int i2 = parcelZzo.readInt();
        parcelZzo.recycle();
        return i2;
    }

    @Override // com.google.android.gms.internal.play_billing.zzd
    public final int zzb(int i, String str, String str2) throws RemoteException {
        Parcel parcelZzn = zzn();
        parcelZzn.writeInt(i);
        parcelZzn.writeString(str);
        parcelZzn.writeString(str2);
        Parcel parcelZzo = zzo(1, parcelZzn);
        int i2 = parcelZzo.readInt();
        parcelZzo.recycle();
        return i2;
    }

    @Override // com.google.android.gms.internal.play_billing.zzd
    public final int zzc(int i, String str, String str2, Bundle bundle) throws RemoteException {
        Parcel parcelZzn = zzn();
        parcelZzn.writeInt(7);
        parcelZzn.writeString(str);
        parcelZzn.writeString(str2);
        zzg.zzb(parcelZzn, bundle);
        Parcel parcelZzo = zzo(10, parcelZzn);
        int i2 = parcelZzo.readInt();
        parcelZzo.recycle();
        return i2;
    }

    @Override // com.google.android.gms.internal.play_billing.zzd
    public final Bundle zzd(int i, String str, String str2, Bundle bundle) throws RemoteException {
        Parcel parcelZzn = zzn();
        parcelZzn.writeInt(9);
        parcelZzn.writeString(str);
        parcelZzn.writeString(str2);
        zzg.zzb(parcelZzn, bundle);
        Parcel parcelZzo = zzo(TypedValues.Custom.TYPE_COLOR, parcelZzn);
        Bundle bundle2 = (Bundle) zzg.zza(parcelZzo, Bundle.CREATOR);
        parcelZzo.recycle();
        return bundle2;
    }

    @Override // com.google.android.gms.internal.play_billing.zzd
    public final Bundle zze(int i, String str, String str2, Bundle bundle) throws RemoteException {
        Parcel parcelZzn = zzn();
        parcelZzn.writeInt(9);
        parcelZzn.writeString(str);
        parcelZzn.writeString(str2);
        zzg.zzb(parcelZzn, bundle);
        Parcel parcelZzo = zzo(12, parcelZzn);
        Bundle bundle2 = (Bundle) zzg.zza(parcelZzo, Bundle.CREATOR);
        parcelZzo.recycle();
        return bundle2;
    }

    @Override // com.google.android.gms.internal.play_billing.zzd
    public final Bundle zzf(int i, String str, String str2, String str3, String str4) throws RemoteException {
        Parcel parcelZzn = zzn();
        parcelZzn.writeInt(3);
        parcelZzn.writeString(str);
        parcelZzn.writeString(str2);
        parcelZzn.writeString(str3);
        parcelZzn.writeString(null);
        Parcel parcelZzo = zzo(3, parcelZzn);
        Bundle bundle = (Bundle) zzg.zza(parcelZzo, Bundle.CREATOR);
        parcelZzo.recycle();
        return bundle;
    }

    @Override // com.google.android.gms.internal.play_billing.zzd
    public final Bundle zzg(int i, String str, String str2, String str3, String str4, Bundle bundle) throws RemoteException {
        Parcel parcelZzn = zzn();
        parcelZzn.writeInt(i);
        parcelZzn.writeString(str);
        parcelZzn.writeString(str2);
        parcelZzn.writeString(str3);
        parcelZzn.writeString(null);
        zzg.zzb(parcelZzn, bundle);
        Parcel parcelZzo = zzo(8, parcelZzn);
        Bundle bundle2 = (Bundle) zzg.zza(parcelZzo, Bundle.CREATOR);
        parcelZzo.recycle();
        return bundle2;
    }

    @Override // com.google.android.gms.internal.play_billing.zzd
    public final Bundle zzh(int i, String str, String str2, String str3, Bundle bundle) throws RemoteException {
        Parcel parcelZzn = zzn();
        parcelZzn.writeInt(6);
        parcelZzn.writeString(str);
        parcelZzn.writeString(str2);
        parcelZzn.writeString(str3);
        zzg.zzb(parcelZzn, bundle);
        Parcel parcelZzo = zzo(9, parcelZzn);
        Bundle bundle2 = (Bundle) zzg.zza(parcelZzo, Bundle.CREATOR);
        parcelZzo.recycle();
        return bundle2;
    }

    @Override // com.google.android.gms.internal.play_billing.zzd
    public final Bundle zzi(int i, String str, String str2, String str3) throws RemoteException {
        Parcel parcelZzn = zzn();
        parcelZzn.writeInt(3);
        parcelZzn.writeString(str);
        parcelZzn.writeString(str2);
        parcelZzn.writeString(str3);
        Parcel parcelZzo = zzo(4, parcelZzn);
        Bundle bundle = (Bundle) zzg.zza(parcelZzo, Bundle.CREATOR);
        parcelZzo.recycle();
        return bundle;
    }

    @Override // com.google.android.gms.internal.play_billing.zzd
    public final Bundle zzj(int i, String str, String str2, String str3, Bundle bundle) throws RemoteException {
        Parcel parcelZzn = zzn();
        parcelZzn.writeInt(9);
        parcelZzn.writeString(str);
        parcelZzn.writeString(str2);
        parcelZzn.writeString(str3);
        zzg.zzb(parcelZzn, bundle);
        Parcel parcelZzo = zzo(11, parcelZzn);
        Bundle bundle2 = (Bundle) zzg.zza(parcelZzo, Bundle.CREATOR);
        parcelZzo.recycle();
        return bundle2;
    }

    @Override // com.google.android.gms.internal.play_billing.zzd
    public final Bundle zzk(int i, String str, String str2, Bundle bundle) throws RemoteException {
        Parcel parcelZzn = zzn();
        parcelZzn.writeInt(3);
        parcelZzn.writeString(str);
        parcelZzn.writeString(str2);
        zzg.zzb(parcelZzn, bundle);
        Parcel parcelZzo = zzo(2, parcelZzn);
        Bundle bundle2 = (Bundle) zzg.zza(parcelZzo, Bundle.CREATOR);
        parcelZzo.recycle();
        return bundle2;
    }

    @Override // com.google.android.gms.internal.play_billing.zzd
    public final Bundle zzl(int i, String str, String str2, Bundle bundle, Bundle bundle2) throws RemoteException {
        Parcel parcelZzn = zzn();
        parcelZzn.writeInt(10);
        parcelZzn.writeString(str);
        parcelZzn.writeString(str2);
        zzg.zzb(parcelZzn, bundle);
        zzg.zzb(parcelZzn, bundle2);
        Parcel parcelZzo = zzo(TypedValues.Custom.TYPE_FLOAT, parcelZzn);
        Bundle bundle3 = (Bundle) zzg.zza(parcelZzo, Bundle.CREATOR);
        parcelZzo.recycle();
        return bundle3;
    }

    @Override // com.google.android.gms.internal.play_billing.zzd
    public final Bundle zzm(int i, String str, String str2, String str3, Bundle bundle) throws RemoteException {
        Parcel parcelZzn = zzn();
        parcelZzn.writeInt(8);
        parcelZzn.writeString(str);
        parcelZzn.writeString(str2);
        parcelZzn.writeString(BillingClient.SkuType.SUBS);
        zzg.zzb(parcelZzn, bundle);
        Parcel parcelZzo = zzo(801, parcelZzn);
        Bundle bundle2 = (Bundle) zzg.zza(parcelZzo, Bundle.CREATOR);
        parcelZzo.recycle();
        return bundle2;
    }
}
