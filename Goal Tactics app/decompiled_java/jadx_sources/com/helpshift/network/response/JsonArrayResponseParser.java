package com.helpshift.network.response;

import com.helpshift.common.domain.network.NetworkErrorCodes;
import com.helpshift.network.errors.NetworkError;
import com.helpshift.network.util.HttpHeaderParser;
import com.ironsource.sdk.constants.Events;
import java.io.UnsupportedEncodingException;
import org.json.JSONArray;
import org.json.JSONException;

/* JADX INFO: loaded from: classes2.dex */
public class JsonArrayResponseParser implements ResponseParser<JSONArray> {
    @Override // com.helpshift.network.response.ResponseParser
    public Response<JSONArray> parseResponse(NetworkResponse networkResponse) {
        try {
            return Response.success(new JSONArray(new String(networkResponse.data, HttpHeaderParser.parseCharset(networkResponse.headers, Events.CHARSET_FORMAT))), networkResponse.requestIdentifier);
        } catch (UnsupportedEncodingException e) {
            return Response.error(new NetworkError(NetworkErrorCodes.PARSE_ERROR, e), networkResponse.requestIdentifier);
        } catch (JSONException e2) {
            return Response.error(new NetworkError(NetworkErrorCodes.PARSE_ERROR, e2), networkResponse.requestIdentifier);
        }
    }
}
