package com.helpshift.conversation.smartintent;

import com.helpshift.account.domainmodel.UserDM;
import com.helpshift.common.domain.Domain;
import com.helpshift.common.domain.F;
import com.helpshift.common.domain.network.ETagNetwork;
import com.helpshift.common.domain.network.GETNetwork;
import com.helpshift.common.domain.network.GuardOKNetwork;
import com.helpshift.common.domain.network.NetworkDataRequestUtil;
import com.helpshift.common.domain.network.NetworkErrorCodes;
import com.helpshift.common.domain.network.TSCorrectedNetwork;
import com.helpshift.common.exception.NetworkException;
import com.helpshift.common.exception.RootAPIException;
import com.helpshift.common.platform.Platform;
import com.helpshift.common.platform.network.RequestData;
import com.helpshift.common.util.HSDateFormatSpec;
import com.helpshift.configuration.domainmodel.SDKConfigurationDM;
import com.helpshift.conversation.activeconversation.ConversationManager;
import com.helpshift.conversation.activeconversation.model.Conversation;
import com.helpshift.conversation.smartintent.dao.SmartIntentDAO;
import com.helpshift.conversation.smartintent.dto.SISearchModelDTO;
import com.helpshift.conversation.smartintent.dto.SISearchResultDTO;
import com.helpshift.conversation.smartintent.dto.SITreeDTO;
import com.helpshift.db.smartintents.tables.SmartIntentTreeTable;
import com.helpshift.util.HSLogger;
import com.helpshift.util.StringUtils;
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Set;

/* JADX INFO: loaded from: classes2.dex */
public class SmartIntentDM {
    private static String SI_MODEL_ROUTE_ETAG_SUFFIX = "smart_intent_model_route";
    private static String SI_TREE_ROUTE_ETAG_SUFFIX = "smart_intent_tree_route";
    private static final String TAG = "Helpshift_SmartIntDM";
    private SmartIntentDMCallback callback;
    private Domain domain;
    private Platform platform;
    private SmartIntentSearchManager searchManager;
    private SmartIntentDAO smartIntentDAO;
    private Set<Long> inProgressTreeFetchRequests = Collections.synchronizedSet(new HashSet());
    private Set<Long> inProgressModelFetchRequests = Collections.synchronizedSet(new HashSet());

    /* JADX INFO: Access modifiers changed from: private */
    public void handleModelRefreshSuccess() {
    }

    public SmartIntentDM(Platform platform, Domain domain) {
        this.domain = domain;
        this.platform = platform;
        SmartIntentDAO smartIntentDAO = platform.getSmartIntentDAO();
        this.smartIntentDAO = smartIntentDAO;
        this.searchManager = new SmartIntentSearchManager(smartIntentDAO);
    }

    public boolean shouldShowSmartIntent(Conversation conversation) {
        SDKConfigurationDM sDKConfigurationDM = this.domain.getSDKConfigurationDM();
        if (!sDKConfigurationDM.isSmartIntentsEnabled() || StringUtils.isNotEmpty(sDKConfigurationDM.getString(SDKConfigurationDM.CONVERSATION_PRE_FILL_TEXT))) {
            return false;
        }
        if (sDKConfigurationDM.shouldAutoFillPreissueFirstMessage() && StringUtils.isNotEmpty(sDKConfigurationDM.getString(SDKConfigurationDM.INITIAL_USER_MESSAGE_TO_AUTOSEND_IN_PREISSUE))) {
            return false;
        }
        ConversationManager conversationManager = this.domain.getConversationInboxManagerDM().getActiveConversationInboxDM().getConversationManager();
        return (conversationManager.isSynced(conversation) || conversationManager.containsAtleastOneUserMessage(conversation)) ? false : true;
    }

    public boolean isSmartIntentTreeAvailable(UserDM userDM) {
        SITreeDTO tree = this.smartIntentDAO.getTree(userDM);
        if (tree == null) {
            return false;
        }
        return HSDateFormatSpec.getCurrentAdjustedTimeInMillis(this.platform) - tree.lastRefreshedAt < this.domain.getSDKConfigurationDM().getSmartIntentTreeRefreshInterval();
    }

    boolean checkAndDeleteCachedTree(UserDM userDM) {
        SITreeDTO tree = this.smartIntentDAO.getTree(userDM);
        if (tree == null) {
            return false;
        }
        if (HSDateFormatSpec.getCurrentAdjustedTimeInMillis(this.platform) - tree.lastRefreshedAt >= this.domain.getSDKConfigurationDM().getSmartIntentClientCacheExpiryInterval()) {
            return deleteTreeAndModel(userDM);
        }
        return false;
    }

    public void registerSmartIntentDMCallback(SmartIntentDMCallback smartIntentDMCallback) {
        this.callback = smartIntentDMCallback;
    }

    public boolean isTreeFetchRequestInProgress(UserDM userDM) {
        return this.inProgressTreeFetchRequests.contains(userDM.getLocalId());
    }

    public boolean isModelFetchRequestInProgress(UserDM userDM) {
        return this.inProgressModelFetchRequests.contains(userDM.getLocalId());
    }

    public void fetchSmartIntentTreeFromServer(final UserDM userDM) {
        if (isTreeFetchRequestInProgress(userDM)) {
            return;
        }
        this.inProgressTreeFetchRequests.add(userDM.getLocalId());
        this.domain.runParallel(new F() { // from class: com.helpshift.conversation.smartintent.SmartIntentDM.1
            @Override // com.helpshift.common.domain.F
            public void f() {
                Exception e;
                boolean z;
                RootAPIException e2;
                String keyToStoreETag = SmartIntentDM.this.getKeyToStoreETag(userDM, SmartIntentDM.SI_TREE_ROUTE_ETAG_SUFFIX);
                try {
                    try {
                        z = true;
                    } finally {
                        SmartIntentDM.this.inProgressTreeFetchRequests.remove(userDM.getLocalId());
                    }
                } catch (RootAPIException e3) {
                    e2 = e3;
                    z = false;
                } catch (Exception e4) {
                    e = e4;
                    z = false;
                }
                try {
                    SITreeDTO smartIntentTree = SmartIntentDM.this.platform.getResponseParser().parseSmartIntentTree(new GuardOKNetwork(new ETagNetwork(new TSCorrectedNetwork(new GETNetwork("/intent-trees/", SmartIntentDM.this.domain, SmartIntentDM.this.platform), SmartIntentDM.this.platform), SmartIntentDM.this.platform, keyToStoreETag)).makeRequest(new RequestData(SmartIntentDM.this.getIntentTreeRequestData(userDM))).responseString);
                    smartIntentTree.lastRefreshedAt = HSDateFormatSpec.getCurrentAdjustedTimeInMillis(SmartIntentDM.this.platform);
                    SmartIntentDM.this.smartIntentDAO.deleteTreeAndModel(userDM);
                    if (SmartIntentDM.this.smartIntentDAO.insertTree(userDM, smartIntentTree)) {
                        SmartIntentDM.this.handleTreeRefreshSuccess(userDM);
                    } else {
                        SmartIntentDM.this.clearETagFromStorage(keyToStoreETag);
                        SmartIntentDM.this.handleTreeRefreshFailure(userDM);
                    }
                } catch (RootAPIException e5) {
                    e2 = e5;
                    if (z) {
                        SmartIntentDM.this.clearETagFromStorage(keyToStoreETag);
                    }
                    if (e2.exceptionType instanceof NetworkException) {
                        NetworkException networkException = (NetworkException) e2.exceptionType;
                        if (networkException.serverStatusCode == NetworkErrorCodes.CONTENT_UNCHANGED.intValue()) {
                            SmartIntentDM.this.updateLastSuccessfulTreeFetchTime(userDM);
                            SmartIntentDM.this.handleTreeRefreshSuccess(userDM);
                        } else if (networkException.serverStatusCode == NetworkErrorCodes.CONTENT_NOT_FOUND.intValue()) {
                            HSLogger.e(SmartIntentDM.TAG, "Smart intent tree data not exist on server : ", e2);
                            SmartIntentDM.this.deleteTreeAndModel(userDM);
                            SmartIntentDM.this.notifyTreeUnAvailableCallback(userDM);
                        } else {
                            HSLogger.e(SmartIntentDM.TAG, "Error while fetching smart intent tree : ", e2);
                            SmartIntentDM.this.handleTreeRefreshFailure(userDM);
                        }
                    } else {
                        HSLogger.e(SmartIntentDM.TAG, "Error while fetching smart intent tree : ", e2);
                        SmartIntentDM.this.handleTreeRefreshFailure(userDM);
                    }
                } catch (Exception e6) {
                    e = e6;
                    if (z) {
                        SmartIntentDM.this.clearETagFromStorage(keyToStoreETag);
                    }
                    HSLogger.e(SmartIntentDM.TAG, "Generic error while fetching smart intent tree : ", e);
                    SmartIntentDM.this.handleTreeRefreshFailure(userDM);
                }
            }
        });
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void handleTreeRefreshSuccess(UserDM userDM) {
        SITreeDTO tree = this.smartIntentDAO.getTree(userDM);
        if (tree != null) {
            notifyTreeAvailableCallback(userDM, tree);
        } else {
            deleteTreeAndModel(userDM);
            notifyTreeUnAvailableCallback(userDM);
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void updateLastSuccessfulTreeFetchTime(UserDM userDM) {
        this.smartIntentDAO.updateTreeLastRefreshedAtTime(userDM, HSDateFormatSpec.getCurrentAdjustedTimeInMillis(this.platform));
    }

    public void refreshSmartIntentSearchModel(UserDM userDM, SITreeDTO sITreeDTO) {
        if (isSmartIntentModelAvailable(sITreeDTO.localId.longValue())) {
            return;
        }
        fetchSmartIntentModelFromServer(userDM, sITreeDTO);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void handleTreeRefreshFailure(UserDM userDM) {
        SITreeDTO tree = !checkAndDeleteCachedTree(userDM) ? this.smartIntentDAO.getTree(userDM) : null;
        if (tree != null) {
            notifyTreeAvailableCallback(userDM, tree);
        } else {
            notifyTreeUnAvailableCallback(userDM);
        }
    }

    private void notifyTreeAvailableCallback(UserDM userDM, SITreeDTO sITreeDTO) {
        HSLogger.d(TAG, "Smart intent tree available");
        SmartIntentDMCallback smartIntentDMCallback = this.callback;
        if (smartIntentDMCallback != null) {
            smartIntentDMCallback.onTreeAvailable(userDM, sITreeDTO);
        }
        refreshSmartIntentSearchModel(userDM, sITreeDTO);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void notifyTreeUnAvailableCallback(UserDM userDM) {
        HSLogger.d(TAG, "Smart intent tree unavailable");
        SmartIntentDMCallback smartIntentDMCallback = this.callback;
        if (smartIntentDMCallback != null) {
            smartIntentDMCallback.onTreeUnAvailable(userDM);
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public RequestData getIntentTreeRequestData(UserDM userDM) {
        HashMap<String, String> userRequestData = NetworkDataRequestUtil.getUserRequestData(userDM);
        userRequestData.put("platform_id", this.platform.getAppId());
        return new RequestData(userRequestData);
    }

    public void unregisterSmartIntentDMCallback() {
        this.callback = null;
    }

    public SITreeDTO getSmartIntentTree(UserDM userDM) {
        return this.smartIntentDAO.getTree(userDM);
    }

    public boolean isSmartIntentModelAvailable(long j) {
        SISearchModelDTO modelWithoutWordProbabilities = this.smartIntentDAO.getModelWithoutWordProbabilities(j);
        if (modelWithoutWordProbabilities == null) {
            return false;
        }
        return HSDateFormatSpec.getCurrentAdjustedTimeInMillis(this.platform) - modelWithoutWordProbabilities.lastRefreshedAt < this.domain.getSDKConfigurationDM().getSmartIntentModelRefreshInterval();
    }

    void fetchSmartIntentModelFromServer(final UserDM userDM, final SITreeDTO sITreeDTO) {
        if (isModelFetchRequestInProgress(userDM)) {
            return;
        }
        this.inProgressModelFetchRequests.add(userDM.getLocalId());
        this.domain.runParallel(new F() { // from class: com.helpshift.conversation.smartintent.SmartIntentDM.2
            @Override // com.helpshift.common.domain.F
            public void f() {
                String str = "/intent-trees/" + sITreeDTO.serverId + "/models/";
                String keyToStoreETag = SmartIntentDM.this.getKeyToStoreETag(userDM, SmartIntentDM.SI_MODEL_ROUTE_ETAG_SUFFIX);
                boolean z = false;
                try {
                    try {
                        z = true;
                        SISearchModelDTO smartIntentSearchModel = SmartIntentDM.this.platform.getResponseParser().parseSmartIntentSearchModel(new GuardOKNetwork(new ETagNetwork(new TSCorrectedNetwork(new GETNetwork(str, SmartIntentDM.this.domain, SmartIntentDM.this.platform), SmartIntentDM.this.platform), SmartIntentDM.this.platform, keyToStoreETag)).makeRequest(new RequestData(SmartIntentDM.this.getIntentModelRequestData(userDM, sITreeDTO))).responseString);
                        smartIntentSearchModel.lastRefreshedAt = HSDateFormatSpec.getCurrentAdjustedTimeInMillis(SmartIntentDM.this.platform);
                        SmartIntentDM.this.smartIntentDAO.deleteModel(sITreeDTO.localId.longValue());
                        if (SmartIntentDM.this.smartIntentDAO.insertModel(sITreeDTO.localId.longValue(), smartIntentSearchModel)) {
                            SmartIntentDM.this.handleModelRefreshSuccess();
                        } else {
                            SmartIntentDM.this.clearETagFromStorage(keyToStoreETag);
                            SmartIntentDM.this.handleModelRefreshFailure(userDM, sITreeDTO);
                        }
                    } catch (RootAPIException e) {
                        if (z) {
                            SmartIntentDM.this.clearETagFromStorage(keyToStoreETag);
                        }
                        if (e.exceptionType instanceof NetworkException) {
                            NetworkException networkException = (NetworkException) e.exceptionType;
                            if (networkException.serverStatusCode == NetworkErrorCodes.CONTENT_UNCHANGED.intValue()) {
                                SmartIntentDM.this.updateLastSuccessfulModelFetchTime(sITreeDTO.localId.longValue());
                                SmartIntentDM.this.handleModelRefreshSuccess();
                            } else if (networkException.serverStatusCode == NetworkErrorCodes.CONTENT_NOT_FOUND.intValue() || networkException.serverStatusCode == NetworkErrorCodes.CONFLICT.intValue()) {
                                HSLogger.e(SmartIntentDM.TAG, "Error smart intent model not exist or cached tree is not latest: ", e);
                                SmartIntentDM.this.deleteModel(userDM, sITreeDTO);
                            } else {
                                HSLogger.e(SmartIntentDM.TAG, "Error while fetching smart intent model : ", e);
                                SmartIntentDM.this.handleModelRefreshFailure(userDM, sITreeDTO);
                            }
                        } else {
                            HSLogger.e(SmartIntentDM.TAG, "Error while fetching smart intent model : ", e);
                            SmartIntentDM.this.handleModelRefreshFailure(userDM, sITreeDTO);
                        }
                    } catch (Exception e2) {
                        if (z) {
                            SmartIntentDM.this.clearETagFromStorage(keyToStoreETag);
                        }
                        HSLogger.e(SmartIntentDM.TAG, "Generic error while fetching smart intent model : ", e2);
                        SmartIntentDM.this.handleModelRefreshFailure(userDM, sITreeDTO);
                    }
                } finally {
                    SmartIntentDM.this.inProgressModelFetchRequests.remove(userDM.getLocalId());
                }
            }
        });
    }

    boolean checkAndDeleteCachedModel(UserDM userDM, SITreeDTO sITreeDTO) {
        SISearchModelDTO modelWithoutWordProbabilities = this.smartIntentDAO.getModelWithoutWordProbabilities(sITreeDTO.localId.longValue());
        if (modelWithoutWordProbabilities == null) {
            return false;
        }
        if (HSDateFormatSpec.getCurrentAdjustedTimeInMillis(this.platform) - modelWithoutWordProbabilities.lastRefreshedAt >= this.domain.getSDKConfigurationDM().getSmartIntentClientCacheExpiryInterval()) {
            return deleteModel(userDM, sITreeDTO);
        }
        return false;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void handleModelRefreshFailure(UserDM userDM, SITreeDTO sITreeDTO) {
        checkAndDeleteCachedModel(userDM, sITreeDTO);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void updateLastSuccessfulModelFetchTime(long j) {
        this.smartIntentDAO.updateModelLastRefreshedAtTime(j, HSDateFormatSpec.getCurrentAdjustedTimeInMillis(this.platform));
    }

    /* JADX INFO: Access modifiers changed from: private */
    public RequestData getIntentModelRequestData(UserDM userDM, SITreeDTO sITreeDTO) {
        HashMap<String, String> userRequestData = NetworkDataRequestUtil.getUserRequestData(userDM);
        userRequestData.put(SmartIntentTreeTable.Columns.TREE_VERSION, String.valueOf(sITreeDTO.version));
        return new RequestData(userRequestData);
    }

    public SISearchResultDTO match(SITreeDTO sITreeDTO, String str) {
        return this.searchManager.match(sITreeDTO, str);
    }

    public void clearUserData(UserDM userDM) {
        deleteTreeAndModel(userDM);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public boolean deleteTreeAndModel(UserDM userDM) {
        if (userDM == null) {
            return false;
        }
        clearETagFromStorage(getKeyToStoreETag(userDM, SI_TREE_ROUTE_ETAG_SUFFIX));
        clearETagFromStorage(getKeyToStoreETag(userDM, SI_MODEL_ROUTE_ETAG_SUFFIX));
        return this.smartIntentDAO.deleteTreeAndModel(userDM);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public boolean deleteModel(UserDM userDM, SITreeDTO sITreeDTO) {
        if (userDM == null || sITreeDTO == null) {
            return false;
        }
        clearETagFromStorage(getKeyToStoreETag(userDM, SI_MODEL_ROUTE_ETAG_SUFFIX));
        return this.smartIntentDAO.deleteModel(sITreeDTO.localId.longValue());
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void clearETagFromStorage(String str) {
        this.platform.getNetworkRequestDAO().removeETag(str);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public String getKeyToStoreETag(UserDM userDM, String str) {
        return userDM.getLocalId() + "_" + str;
    }
}
