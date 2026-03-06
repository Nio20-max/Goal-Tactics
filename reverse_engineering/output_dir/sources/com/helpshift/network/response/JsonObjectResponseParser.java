package com.helpshift.network.response;

import com.helpshift.common.domain.network.NetworkErrorCodes;
import com.helpshift.network.errors.NetworkError;
import com.helpshift.network.util.HttpHeaderParser;
import com.ironsource.sdk.constants.Events;
import java.io.UnsupportedEncodingException;
import org.json.JSONException;
import org.json.JSONObject;

/* JADX INFO: loaded from: classes2.dex */
public class JsonObjectResponseParser implements ResponseParser<JSONObject> {
    @Override // com.helpshift.network.response.ResponseParser
    public Response<JSONObject> parseResponse(NetworkResponse networkResponse) {
        try {
            return Response.success(new JSONObject(new String(networkResponse.data, HttpHeaderParser.parseCharset(networkResponse.headers, Events.CHARSET_FORMAT))), networkResponse.requestIdentifier);
        } catch (UnsupportedEncodingException e) {
            return Response.error(new NetworkError(NetworkErrorCodes.PARSE_ERROR, e), networkResponse.requestIdentifier);
        } catch (JSONException e2) {
            return Response.error(new NetworkError(NetworkErrorCodes.PARSE_ERROR, e2), networkResponse.requestIdentifier);
        }
    }
}
