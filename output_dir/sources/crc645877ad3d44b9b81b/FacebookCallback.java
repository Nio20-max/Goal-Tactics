package crc645877ad3d44b9b81b;

import com.facebook.FacebookException;
import com.facebook.GraphRequest;
import com.facebook.GraphResponse;
import java.util.ArrayList;
import mono.android.IGCUserPeer;
import mono.android.Runtime;
import mono.android.TypeManager;
import org.json.JSONObject;

/* JADX INFO: loaded from: classes2.dex */
public class FacebookCallback implements IGCUserPeer, com.facebook.FacebookCallback, GraphRequest.GraphJSONObjectCallback {
    public static final String __md_methods = "n_onCancel:()V:GetOnCancelHandler:Xamarin.Facebook.IFacebookCallbackInvoker, Xamarin.Facebook.Common.Android\nn_onError:(Lcom/facebook/FacebookException;)V:GetOnError_Lcom_facebook_FacebookException_Handler:Xamarin.Facebook.IFacebookCallbackInvoker, Xamarin.Facebook.Common.Android\nn_onSuccess:(Ljava/lang/Object;)V:GetOnSuccess_Ljava_lang_Object_Handler:Xamarin.Facebook.IFacebookCallbackInvoker, Xamarin.Facebook.Common.Android\nn_onCompleted:(Lorg/json/JSONObject;Lcom/facebook/GraphResponse;)V:GetOnCompleted_Lorg_json_JSONObject_Lcom_facebook_GraphResponse_Handler:Xamarin.Facebook.GraphRequest/IGraphJSONObjectCallbackInvoker, Xamarin.Facebook.Core.Android\n";
    private ArrayList refList;

    private native void n_onCancel();

    private native void n_onCompleted(JSONObject jSONObject, GraphResponse graphResponse);

    private native void n_onError(FacebookException facebookException);

    private native void n_onSuccess(Object obj);

    static {
        Runtime.register("GT.Droid.FacebookCallback, GT.Droid", FacebookCallback.class, __md_methods);
    }

    public FacebookCallback() {
        if (getClass() == FacebookCallback.class) {
            TypeManager.Activate("GT.Droid.FacebookCallback, GT.Droid", "", this, new Object[0]);
        }
    }

    @Override // com.facebook.FacebookCallback
    public void onCancel() {
        n_onCancel();
    }

    @Override // com.facebook.FacebookCallback
    public void onError(FacebookException facebookException) {
        n_onError(facebookException);
    }

    @Override // com.facebook.FacebookCallback
    public void onSuccess(Object obj) {
        n_onSuccess(obj);
    }

    @Override // com.facebook.GraphRequest.GraphJSONObjectCallback
    public void onCompleted(JSONObject jSONObject, GraphResponse graphResponse) {
        n_onCompleted(jSONObject, graphResponse);
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
