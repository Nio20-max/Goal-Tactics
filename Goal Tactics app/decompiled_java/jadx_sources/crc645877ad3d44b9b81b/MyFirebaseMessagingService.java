package crc645877ad3d44b9b81b;

import com.google.firebase.messaging.FirebaseMessagingService;
import com.google.firebase.messaging.RemoteMessage;
import java.util.ArrayList;
import mono.android.IGCUserPeer;
import mono.android.Runtime;
import mono.android.TypeManager;

/* JADX INFO: loaded from: classes2.dex */
public class MyFirebaseMessagingService extends FirebaseMessagingService implements IGCUserPeer {
    public static final String __md_methods = "n_onMessageReceived:(Lcom/google/firebase/messaging/RemoteMessage;)V:GetOnMessageReceived_Lcom_google_firebase_messaging_RemoteMessage_Handler\n";
    private ArrayList refList;

    private native void n_onMessageReceived(RemoteMessage remoteMessage);

    static {
        Runtime.register("GT.Droid.MyFirebaseMessagingService, GT.Droid", MyFirebaseMessagingService.class, __md_methods);
    }

    public MyFirebaseMessagingService() {
        if (getClass() == MyFirebaseMessagingService.class) {
            TypeManager.Activate("GT.Droid.MyFirebaseMessagingService, GT.Droid", "", this, new Object[0]);
        }
    }

    @Override // com.google.firebase.messaging.FirebaseMessagingService
    public void onMessageReceived(RemoteMessage remoteMessage) {
        n_onMessageReceived(remoteMessage);
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
