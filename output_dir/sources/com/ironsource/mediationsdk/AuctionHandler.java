package com.ironsource.mediationsdk;

import android.content.Context;
import android.os.AsyncTask;
import android.os.SystemClock;
import android.text.TextUtils;
import com.facebook.internal.ServerProtocol;
import com.ironsource.mediationsdk.AuctionDataUtils;
import com.ironsource.mediationsdk.logger.IronSourceLogger;
import com.ironsource.mediationsdk.logger.IronSourceLoggerManager;
import com.ironsource.mediationsdk.utils.AuctionSettings;
import com.ironsource.mediationsdk.utils.IronSourceAES;
import com.ironsource.mediationsdk.utils.IronSourceUtils;
import com.ironsource.sdk.precache.DownloadManager;
import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.lang.ref.WeakReference;
import java.net.HttpURLConnection;
import java.net.SocketTimeoutException;
import java.net.URL;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.CopyOnWriteArrayList;
import org.json.JSONException;
import org.json.JSONObject;

/* JADX INFO: loaded from: classes2.dex */
public class AuctionHandler {
    private static final int SERVER_REQUEST_TIMEOUT = 15000;
    private String mAdUnit;
    private AuctionEventListener mAuctionListener;
    private ISBannerSize mBannerSize;
    private AuctionSettings mSettings;
    private final String AUCTION_INTERNAL_ERROR_LOSS_CODE = "1";
    private final String AUCTION_NOT_HIGHEST_RTB_BIDDER_LOSS_CODE = "102";
    private final String AUCTION_LOST_TO_NON_BIDDER_LOSS_CODE = "103";
    private final String GENERIC_NOTIFICATIONS_DEFAULT_LOSS_CODE = "102";
    private String mSessionId = IronSourceUtils.getSessionId();

    public AuctionHandler(String str, AuctionSettings auctionSettings, AuctionEventListener auctionEventListener) {
        this.mAdUnit = str;
        this.mSettings = auctionSettings;
        this.mAuctionListener = auctionEventListener;
    }

    public void executeAuction(Context context, Map<String, Object> map, List<String> list, AuctionHistory auctionHistory, int i, ISBannerSize iSBannerSize) {
        this.mBannerSize = iSBannerSize;
        executeAuction(context, map, list, auctionHistory, i);
    }

    public void executeAuction(Context context, Map<String, Object> map, List<String> list, AuctionHistory auctionHistory, int i) {
        try {
            boolean z = IronSourceUtils.getSerr() == 1;
            new AuctionHttpRequestTask(this.mAuctionListener).execute(this.mSettings.getUrl(), generateRequest(context, map, list, auctionHistory, i, z), Boolean.valueOf(z), Integer.valueOf(this.mSettings.getNumOfMaxTrials()), Long.valueOf(this.mSettings.getTrialsInterval()));
        } catch (Exception e) {
            this.mAuctionListener.onAuctionFailed(1000, e.getMessage(), 0, "other", 0L);
        }
    }

    public void reportImpression(AuctionResponseItem auctionResponseItem, int i, AuctionResponseItem auctionResponseItem2, String str) {
        Iterator<String> it = auctionResponseItem.getBurls().iterator();
        while (it.hasNext()) {
            AuctionDataUtils.getInstance().sendResponse(AuctionDataUtils.getInstance().enrichNotificationURL(it.next(), i, auctionResponseItem, "", "", str));
        }
        if (auctionResponseItem2 != null) {
            Iterator<String> it2 = auctionResponseItem2.getBurls().iterator();
            while (it2.hasNext()) {
                AuctionDataUtils.getInstance().sendResponse(AuctionDataUtils.getInstance().enrichNotificationURL(it2.next(), i, auctionResponseItem, "", "102", str));
            }
        }
    }

    public void reportLoadSuccess(AuctionResponseItem auctionResponseItem, int i, AuctionResponseItem auctionResponseItem2) {
        Iterator<String> it = auctionResponseItem.getNurls().iterator();
        while (it.hasNext()) {
            AuctionDataUtils.getInstance().sendResponse(AuctionDataUtils.getInstance().enrichNotificationURL(it.next(), i, auctionResponseItem, "", "", ""));
        }
        if (auctionResponseItem2 != null) {
            Iterator<String> it2 = auctionResponseItem2.getNurls().iterator();
            while (it2.hasNext()) {
                AuctionDataUtils.getInstance().sendResponse(AuctionDataUtils.getInstance().enrichNotificationURL(it2.next(), i, auctionResponseItem, "", "102", ""));
            }
        }
    }

    public void reportAuctionLose(CopyOnWriteArrayList<ProgSmash> copyOnWriteArrayList, ConcurrentHashMap<String, AuctionResponseItem> concurrentHashMap, int i, AuctionResponseItem auctionResponseItem, AuctionResponseItem auctionResponseItem2) {
        boolean z = false;
        boolean zIsBidder = false;
        for (ProgSmash progSmash : copyOnWriteArrayList) {
            String instanceName = progSmash.getInstanceName();
            if (instanceName.equals(auctionResponseItem2.getInstanceName())) {
                z = true;
                zIsBidder = progSmash.isBidder();
            } else {
                AuctionResponseItem auctionResponseItem3 = concurrentHashMap.get(instanceName);
                String price = auctionResponseItem3.getPrice();
                String str = z ? zIsBidder ? "102" : "103" : "1";
                Iterator<String> it = auctionResponseItem3.getLurls().iterator();
                while (it.hasNext()) {
                    AuctionDataUtils.getInstance().sendResponse(AuctionDataUtils.getInstance().enrichNotificationURL(it.next(), i, auctionResponseItem2, price, str, ""));
                }
            }
        }
        if (auctionResponseItem != null) {
            Iterator<String> it2 = auctionResponseItem.getLurls().iterator();
            while (it2.hasNext()) {
                AuctionDataUtils.getInstance().sendResponse(AuctionDataUtils.getInstance().enrichNotificationURL(it2.next(), i, auctionResponseItem2, "", "102", ""));
            }
        }
    }

    private JSONObject generateRequest(Context context, Map<String, Object> map, List<String> list, AuctionHistory auctionHistory, int i, boolean z) throws JSONException {
        new JSONObject();
        JSONObject jSONObjectEnrichToken = AuctionDataUtils.getInstance().enrichToken(context, map, list, auctionHistory, i, this.mSessionId, this.mSettings, this.mBannerSize);
        jSONObjectEnrichToken.put("adUnit", this.mAdUnit);
        jSONObjectEnrichToken.put("doNotEncryptResponse", z ? "false" : ServerProtocol.DIALOG_RETURN_SCOPES_TRUE);
        return jSONObjectEnrichToken;
    }

    static class AuctionHttpRequestTask extends AsyncTask<Object, Void, Boolean> {
        private String mAuctionFallback = "other";
        private String mAuctionId;
        private WeakReference<AuctionEventListener> mAuctionListener;
        private int mCurrentAuctionTrial;
        private int mErrorCode;
        private String mErrorMessage;
        private AuctionResponseItem mGenericNotifications;
        private JSONObject mRequestData;
        private long mRequestStartTime;
        private List<AuctionResponseItem> mWaterfall;

        AuctionHttpRequestTask(AuctionEventListener auctionEventListener) {
            this.mAuctionListener = new WeakReference<>(auctionEventListener);
        }

        /* JADX INFO: Access modifiers changed from: protected */
        /* JADX WARN: Can't rename method to resolve collision */
        @Override // android.os.AsyncTask
        public Boolean doInBackground(Object... objArr) {
            long time;
            int responseCode;
            this.mRequestStartTime = new Date().getTime();
            try {
                URL url = new URL((String) objArr[0]);
                this.mRequestData = (JSONObject) objArr[1];
                boolean zBooleanValue = ((Boolean) objArr[2]).booleanValue();
                int iIntValue = ((Integer) objArr[3]).intValue();
                long jLongValue = ((Long) objArr[4]).longValue();
                this.mCurrentAuctionTrial = 0;
                HttpURLConnection httpURLConnectionPrepareAuctionRequest = null;
                while (this.mCurrentAuctionTrial < iIntValue) {
                    try {
                        time = new Date().getTime();
                        IronSourceLoggerManager.getLogger().log(IronSourceLogger.IronSourceTag.INTERNAL, "Auction Handler: auction trial " + (this.mCurrentAuctionTrial + 1) + " out of " + iIntValue + " max trials", 0);
                        httpURLConnectionPrepareAuctionRequest = prepareAuctionRequest(url, jLongValue);
                        sendAuctionRequest(httpURLConnectionPrepareAuctionRequest, this.mRequestData);
                        responseCode = httpURLConnectionPrepareAuctionRequest.getResponseCode();
                    } catch (SocketTimeoutException unused) {
                        if (httpURLConnectionPrepareAuctionRequest != null) {
                            httpURLConnectionPrepareAuctionRequest.disconnect();
                        }
                        this.mErrorCode = 1006;
                        this.mErrorMessage = "Connection timed out";
                    } catch (Exception e) {
                        if (httpURLConnectionPrepareAuctionRequest != null) {
                            httpURLConnectionPrepareAuctionRequest.disconnect();
                        }
                        this.mErrorCode = 1000;
                        this.mErrorMessage = e.getMessage();
                        this.mAuctionFallback = "other";
                        return false;
                    }
                    if (responseCode != 200) {
                        this.mErrorCode = 1001;
                        this.mErrorMessage = "Auction status not 200 error, error code response from server - " + responseCode;
                        httpURLConnectionPrepareAuctionRequest.disconnect();
                        if (this.mCurrentAuctionTrial < iIntValue - 1) {
                            waitUntilNextTrial(jLongValue, time);
                        }
                        this.mCurrentAuctionTrial++;
                    } else {
                        try {
                            handleResponse(readResponse(httpURLConnectionPrepareAuctionRequest), zBooleanValue);
                            httpURLConnectionPrepareAuctionRequest.disconnect();
                            return true;
                        } catch (JSONException e2) {
                            if (e2.getMessage() != null && e2.getMessage().equalsIgnoreCase("decryption error")) {
                                this.mErrorCode = 1003;
                                this.mErrorMessage = "Auction decryption error";
                            } else {
                                this.mErrorCode = 1002;
                                this.mErrorMessage = "Auction parsing error";
                            }
                            this.mAuctionFallback = "parsing";
                            httpURLConnectionPrepareAuctionRequest.disconnect();
                            return false;
                        }
                    }
                }
                this.mCurrentAuctionTrial = iIntValue - 1;
                this.mAuctionFallback = "trials_fail";
                return false;
            } catch (Exception e3) {
                this.mErrorCode = 1007;
                this.mErrorMessage = e3.getMessage();
                this.mCurrentAuctionTrial = 0;
                this.mAuctionFallback = "other";
                return false;
            }
        }

        private void waitUntilNextTrial(long j, long j2) {
            long time = j - (new Date().getTime() - j2);
            if (time > 0) {
                SystemClock.sleep(time);
            }
        }

        private void sendAuctionRequest(HttpURLConnection httpURLConnection, JSONObject jSONObject) throws IOException {
            OutputStream outputStream = httpURLConnection.getOutputStream();
            OutputStreamWriter outputStreamWriter = new OutputStreamWriter(outputStream, DownloadManager.UTF8_CHARSET);
            BufferedWriter bufferedWriter = new BufferedWriter(outputStreamWriter);
            bufferedWriter.write(String.format("{\"request\" : \"%1$s\"}", IronSourceAES.encode(IronSourceUtils.KEY, jSONObject.toString())));
            bufferedWriter.flush();
            bufferedWriter.close();
            outputStreamWriter.close();
            outputStream.close();
        }

        private HttpURLConnection prepareAuctionRequest(URL url, long j) throws IOException {
            HttpURLConnection httpURLConnection = (HttpURLConnection) url.openConnection();
            httpURLConnection.setRequestMethod("POST");
            httpURLConnection.setRequestProperty("Content-Type", "application/json; charset=utf-8");
            httpURLConnection.setReadTimeout((int) j);
            httpURLConnection.setDoInput(true);
            httpURLConnection.setDoOutput(true);
            return httpURLConnection;
        }

        private void handleResponse(String str, boolean z) throws JSONException {
            if (TextUtils.isEmpty(str)) {
                throw new JSONException("empty response");
            }
            JSONObject jSONObject = new JSONObject(str);
            if (z) {
                try {
                    jSONObject = new JSONObject(IronSourceAES.decode(IronSourceUtils.KEY, jSONObject.getString("response")));
                } catch (Exception unused) {
                    throw new JSONException("decryption error");
                }
            }
            AuctionDataUtils.AuctionData auctionDataFromResponse = AuctionDataUtils.getInstance().getAuctionDataFromResponse(jSONObject);
            this.mAuctionId = auctionDataFromResponse.getAuctionId();
            this.mWaterfall = auctionDataFromResponse.getWaterfall();
            this.mGenericNotifications = auctionDataFromResponse.getGenericNotifications();
            this.mErrorCode = auctionDataFromResponse.getErrorCode();
            this.mErrorMessage = auctionDataFromResponse.getErrorMessage();
        }

        private String readResponse(HttpURLConnection httpURLConnection) throws IOException {
            InputStreamReader inputStreamReader = new InputStreamReader(httpURLConnection.getInputStream());
            BufferedReader bufferedReader = new BufferedReader(inputStreamReader);
            StringBuilder sb = new StringBuilder();
            while (true) {
                String line = bufferedReader.readLine();
                if (line != null) {
                    sb.append(line);
                } else {
                    bufferedReader.close();
                    inputStreamReader.close();
                    return sb.toString();
                }
            }
        }

        /* JADX INFO: Access modifiers changed from: protected */
        @Override // android.os.AsyncTask
        public void onPostExecute(Boolean bool) {
            AuctionEventListener auctionEventListener = this.mAuctionListener.get();
            if (auctionEventListener == null) {
                return;
            }
            long time = new Date().getTime() - this.mRequestStartTime;
            if (bool.booleanValue()) {
                auctionEventListener.onAuctionSuccess(this.mWaterfall, this.mAuctionId, this.mGenericNotifications, this.mCurrentAuctionTrial + 1, time);
            } else {
                auctionEventListener.onAuctionFailed(this.mErrorCode, this.mErrorMessage, this.mCurrentAuctionTrial + 1, this.mAuctionFallback, time);
            }
        }
    }
}
