package com.appsflyer;

import android.content.Context;
import com.appsflyer.internal.ac;
import com.appsflyer.internal.an;
import com.appsflyer.internal.n;
import com.appsflyer.share.LinkGenerator;
import com.helpshift.db.conversation.tables.ConversationTable;
import java.io.DataOutputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import javax.net.ssl.HttpsURLConnection;
import org.json.JSONException;
import org.json.JSONObject;

/* JADX INFO: loaded from: classes.dex */
public final class CreateOneLinkHttpTask extends an {
    public ResponseListener AFKeystoreWrapper;
    private final Map<String, String> AFLogger$LogLevel;
    private String getLevel;
    private final String init;
    public String values;

    public interface ResponseListener {
        void onResponse(String str);

        void onResponseError(String str);
    }

    public CreateOneLinkHttpTask(String str, Map<String, String> map, ac acVar, Context context) {
        super(acVar, context, "POST");
        this.getLevel = "";
        if (context != null) {
            this.getLevel = context.getPackageName();
        } else {
            AFLogger.AppsFlyer2dXConversionCallback("CreateOneLinkHttpTask: context can't be null");
        }
        this.AFInAppEventParameterName = str;
        this.init = "-1";
        this.AFLogger$LogLevel = map;
    }

    @Override // com.appsflyer.internal.an
    public final void AFInAppEventParameterName(HttpsURLConnection httpsURLConnection) throws IOException {
        httpsURLConnection.setDoInput(true);
        httpsURLConnection.setDoOutput(true);
        httpsURLConnection.setUseCaches(false);
        HashMap map = new HashMap();
        map.put("ttl", this.init);
        map.put(ConversationTable.Columns.LOCAL_UUID, this.AppsFlyer2dXConversionCallback);
        map.put("data", this.AFLogger$LogLevel);
        map.put("meta", this.AFVersionDeclaration);
        String str = this.values;
        if (str != null) {
            map.put("brand_domain", str);
        }
        String string = n.AFInAppEventType(map).toString();
        AFKeystoreWrapper(httpsURLConnection, this.valueOf, string);
        DataOutputStream dataOutputStream = new DataOutputStream(httpsURLConnection.getOutputStream());
        dataOutputStream.writeBytes(string);
        dataOutputStream.flush();
        dataOutputStream.close();
        httpsURLConnection.connect();
    }

    @Override // com.appsflyer.internal.an
    public final String values() {
        StringBuilder sb = new StringBuilder();
        sb.append(String.format(AFInAppEventType, AppsFlyerLib.getInstance().getHostPrefix(), ac.AFInAppEventParameterName().getHostName()));
        sb.append("/");
        sb.append(this.AFInAppEventParameterName);
        return sb.toString();
    }

    @Override // com.appsflyer.internal.an
    public final void valueOf(String str) {
        try {
            JSONObject jSONObject = new JSONObject(str);
            Iterator<String> itKeys = jSONObject.keys();
            while (itKeys.hasNext()) {
                this.AFKeystoreWrapper.onResponse(jSONObject.optString(itKeys.next()));
            }
        } catch (JSONException e) {
            this.AFKeystoreWrapper.onResponseError("Can't parse one link data");
            AFLogger.valueOf("Error while parsing to json ".concat(String.valueOf(str)), e);
        }
    }

    @Override // com.appsflyer.internal.an
    public final void valueOf() {
        LinkGenerator linkGeneratorAddParameters = new LinkGenerator("af_app_invites").setBaseURL(this.AFInAppEventParameterName, AppsFlyerProperties.getInstance().getString(AppsFlyerProperties.ONELINK_DOMAIN), this.getLevel).addParameter("af_siteid", this.getLevel).addParameters(this.AFLogger$LogLevel);
        ac.AFInAppEventParameterName();
        String strAFInAppEventType = ac.AFInAppEventType();
        if (strAFInAppEventType != null) {
            linkGeneratorAddParameters.setReferrerCustomerId(strAFInAppEventType);
        }
        this.AFKeystoreWrapper.onResponse(linkGeneratorAddParameters.generateLink());
    }
}
