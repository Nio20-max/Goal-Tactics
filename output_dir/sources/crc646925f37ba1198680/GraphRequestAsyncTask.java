package crc646925f37ba1198680;

import android.os.AsyncTask;
import java.util.ArrayList;
import mono.android.IGCUserPeer;
import mono.android.Runtime;
import mono.android.TypeManager;

/* JADX INFO: loaded from: classes2.dex */
public class GraphRequestAsyncTask extends AsyncTask implements IGCUserPeer {
    public static final String __md_methods = "n_doInBackground:([Ljava/lang/Object;)Ljava/lang/Object;:GetDoInBackground_arrayLjava_lang_Object_Handler\n";
    private ArrayList refList;

    private native Object n_doInBackground(Object[] objArr);

    static {
        Runtime.register("Xamarin.Facebook.GraphRequestAsyncTask, Xamarin.Facebook.Login.Android", GraphRequestAsyncTask.class, __md_methods);
    }

    public GraphRequestAsyncTask() {
        if (getClass() == GraphRequestAsyncTask.class) {
            TypeManager.Activate("Xamarin.Facebook.GraphRequestAsyncTask, Xamarin.Facebook.Login.Android", "", this, new Object[0]);
        }
    }

    @Override // android.os.AsyncTask
    public Object doInBackground(Object[] objArr) {
        return n_doInBackground(objArr);
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
