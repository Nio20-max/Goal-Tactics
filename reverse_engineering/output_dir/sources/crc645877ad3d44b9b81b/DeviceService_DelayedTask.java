package crc645877ad3d44b9b81b;

import java.util.ArrayList;
import java.util.TimerTask;
import mono.android.IGCUserPeer;
import mono.android.Runtime;
import mono.android.TypeManager;

/* JADX INFO: loaded from: classes2.dex */
public class DeviceService_DelayedTask extends TimerTask implements IGCUserPeer {
    public static final String __md_methods = "n_run:()V:GetRunHandler\n";
    private ArrayList refList;

    private native void n_run();

    static {
        Runtime.register("GT.Droid.DeviceService+DelayedTask, GT.Droid", DeviceService_DelayedTask.class, __md_methods);
    }

    public DeviceService_DelayedTask() {
        if (getClass() == DeviceService_DelayedTask.class) {
            TypeManager.Activate("GT.Droid.DeviceService+DelayedTask, GT.Droid", "", this, new Object[0]);
        }
    }

    @Override // java.util.TimerTask, java.lang.Runnable
    public void run() {
        n_run();
    }

    @Override // mono.android.IGCUserPeer
    public void monodroidAddReference(Object obj) {
        if (this.refList == null) {
            this.refList = new ArrayList();
        }
        this.refList.add(obj);
    }

    @Override // mono.android.IGCUserPeer
    public void monodroidClearReferences() {
        ArrayList arrayList = this.refList;
        if (arrayList != null) {
            arrayList.clear();
        }
    }
}
