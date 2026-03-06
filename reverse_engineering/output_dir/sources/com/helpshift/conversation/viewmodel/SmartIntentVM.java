package com.helpshift.conversation.viewmodel;

import com.helpshift.account.domainmodel.UserDM;
import com.helpshift.analytics.AnalyticsEventKey;
import com.helpshift.analytics.AnalyticsEventType;
import com.helpshift.campaigns.util.constants.ModelKeys;
import com.helpshift.common.domain.Domain;
import com.helpshift.common.domain.F;
import com.helpshift.common.platform.Platform;
import com.helpshift.conversation.activeconversation.model.Conversation;
import com.helpshift.conversation.smartintent.BaseSmartIntentViewState;
import com.helpshift.conversation.smartintent.LeafIntentUIModel;
import com.helpshift.conversation.smartintent.RootIntentUIModel;
import com.helpshift.conversation.smartintent.SearchIntentUIModel;
import com.helpshift.conversation.smartintent.SmartIntentCollapsedRootViewState;
import com.helpshift.conversation.smartintent.SmartIntentDM;
import com.helpshift.conversation.smartintent.SmartIntentDMCallback;
import com.helpshift.conversation.smartintent.SmartIntentExpandedRootViewState;
import com.helpshift.conversation.smartintent.SmartIntentLeafViewState;
import com.helpshift.conversation.smartintent.SmartIntentSavedState;
import com.helpshift.conversation.smartintent.SmartIntentSearchResultViewState;
import com.helpshift.conversation.smartintent.dto.SISearchResultDTO;
import com.helpshift.conversation.smartintent.dto.SITreeDTO;
import com.helpshift.conversation.smartintent.dto.SmartIntentDTO;
import com.helpshift.util.HSBackStackController;
import com.helpshift.util.HSLogger;
import com.helpshift.util.ListUtils;
import com.helpshift.util.StringUtils;
import com.helpshift.util.ValuePair;
import com.helpshift.widget.BaseViewState;
import com.helpshift.widget.MutableBaseViewState;
import com.helpshift.widget.MutableReplyFieldViewState;
import com.helpshift.widget.ReplyFieldViewState;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

/* JADX INFO: loaded from: classes2.dex */
public class SmartIntentVM implements SmartIntentDMCallback {
    private static final String TAG = "Helpshift_SmartVM";
    private Conversation activeConversation;
    private SmartIntentVMCallback callback;
    MutableBaseViewState clearSearchViewState;
    private Domain domain;
    private SmartIntentSavedState lastSavedState;
    private Platform platform;
    private SmartIntentDM smartIntentDM;
    private UserDM userDM;
    private boolean isInitialized = false;
    private boolean isShowingFakeTAI = false;
    private SITreeDTO cachedSmartIntentTree = null;
    private Map<String, List<SearchIntentUIModel>> intentIdToSearchIntentUIModelMapping = null;
    private SISearchResultDTO lastSearchResultData = null;
    private HSBackStackController<BaseSmartIntentViewState> backStackController = new HSBackStackController<>();
    private boolean skipSearchOnUserQueryChange = false;
    MutableBaseViewState replyButtonViewState = new MutableBaseViewState();
    MutableReplyFieldViewState replyFieldViewState = new MutableReplyFieldViewState();

    public SmartIntentVM(Platform platform, Domain domain, SmartIntentDM smartIntentDM, UserDM userDM, Conversation conversation, SmartIntentVMCallback smartIntentVMCallback) {
        this.platform = platform;
        this.domain = domain;
        this.activeConversation = conversation;
        this.userDM = userDM;
        this.smartIntentDM = smartIntentDM;
        this.callback = smartIntentVMCallback;
        MutableBaseViewState mutableBaseViewState = new MutableBaseViewState();
        this.clearSearchViewState = mutableBaseViewState;
        mutableBaseViewState.setVisible(false);
        this.smartIntentDM.registerSmartIntentDMCallback(this);
    }

    public void onNewConversationStarted(Conversation conversation) {
        this.activeConversation = conversation;
    }

    private SmartIntentCollapsedRootViewState buildSmartIntentCollapsedRootViewState(SITreeDTO sITreeDTO) {
        ArrayList arrayList = new ArrayList();
        for (SmartIntentDTO smartIntentDTO : sITreeDTO.rootIntents) {
            arrayList.add(new RootIntentUIModel(smartIntentDTO.localId.longValue(), smartIntentDTO.label));
        }
        return new SmartIntentCollapsedRootViewState(sITreeDTO.promptTitle, sITreeDTO.textInputHint, sITreeDTO.enforceIntentSelection, arrayList);
    }

    private SmartIntentExpandedRootViewState buildSmartIntentExpandedRootViewState(SmartIntentCollapsedRootViewState smartIntentCollapsedRootViewState) {
        return new SmartIntentExpandedRootViewState(smartIntentCollapsedRootViewState.promptTitle, smartIntentCollapsedRootViewState.typingBoxHint, smartIntentCollapsedRootViewState.enforceIntentSelection, smartIntentCollapsedRootViewState.rootIntentUIModels);
    }

    private SmartIntentLeafViewState buildSmartIntentLeafViewState(SITreeDTO sITreeDTO, long j) {
        String str;
        ArrayList arrayList = new ArrayList();
        Iterator<SmartIntentDTO> it = sITreeDTO.rootIntents.iterator();
        while (true) {
            if (!it.hasNext()) {
                str = "";
                break;
            }
            SmartIntentDTO next = it.next();
            if (next.localId.longValue() == j) {
                str = next.label;
                for (SmartIntentDTO smartIntentDTO : next.children) {
                    arrayList.add(new LeafIntentUIModel(smartIntentDTO.localId.longValue(), smartIntentDTO.label));
                }
            }
        }
        return new SmartIntentLeafViewState(str, sITreeDTO.textInputHint, sITreeDTO.enforceIntentSelection, j, arrayList);
    }

    private void showSmartIntentTreeInitialState(SITreeDTO sITreeDTO) {
        SmartIntentCollapsedRootViewState smartIntentCollapsedRootViewStateBuildSmartIntentCollapsedRootViewState = buildSmartIntentCollapsedRootViewState(sITreeDTO);
        this.backStackController.clear();
        if (this.backStackController.addItem(smartIntentCollapsedRootViewStateBuildSmartIntentCollapsedRootViewState)) {
            this.callback.showSmartIntentUI(smartIntentCollapsedRootViewStateBuildSmartIntentCollapsedRootViewState);
        }
        this.replyButtonViewState.setVisible(!sITreeDTO.enforceIntentSelection);
        this.replyButtonViewState.setEnabled(false);
    }

    private void sendTreeShownEvent(SITreeDTO sITreeDTO) {
        HashMap map = new HashMap();
        map.put("acid", this.activeConversation.acid);
        map.put(AnalyticsEventKey.SMART_INTENT_TREE_ID, sITreeDTO.serverId);
        map.put(AnalyticsEventKey.SMART_INTENT_TREE_VERSION, Integer.valueOf(sITreeDTO.version));
        map.put(AnalyticsEventKey.SMART_INTENT_ENFORCE_INTENT_SELECTION, Boolean.valueOf(sITreeDTO.enforceIntentSelection));
        this.domain.getAnalyticsEventDM().pushEvent(AnalyticsEventType.SMART_INTENT_TREE_SHOWN, map);
    }

    public void showSmartIntentUI() {
        HSLogger.d(TAG, "Showing smart intent UI");
        updateConversationReplyFooter(false);
        if (this.isInitialized) {
            return;
        }
        SmartIntentSavedState smartIntentSavedState = this.lastSavedState;
        if (smartIntentSavedState != null) {
            restoreSmartIntentUIFromSavedState(smartIntentSavedState);
            this.lastSavedState = null;
            return;
        }
        if (this.smartIntentDM.isSmartIntentTreeAvailable(this.userDM)) {
            SITreeDTO smartIntentTree = this.smartIntentDM.getSmartIntentTree(this.userDM);
            this.cachedSmartIntentTree = smartIntentTree;
            this.intentIdToSearchIntentUIModelMapping = null;
            if (smartIntentTree != null) {
                showSmartIntentTreeInitialState(smartIntentTree);
                sendTreeShownEvent(this.cachedSmartIntentTree);
                this.isInitialized = true;
                this.smartIntentDM.refreshSmartIntentSearchModel(this.userDM, this.cachedSmartIntentTree);
                return;
            }
        }
        showFakeTypingIndicator(true);
        this.smartIntentDM.fetchSmartIntentTreeFromServer(this.userDM);
        this.isInitialized = true;
    }

    private void restoreSmartIntentUIFromSavedState(SmartIntentSavedState smartIntentSavedState) {
        HSLogger.d(TAG, "Restoring smart intent UI state on rotation");
        if (smartIntentSavedState.isShowingTAI && this.smartIntentDM.isTreeFetchRequestInProgress(this.userDM)) {
            showFakeTypingIndicator(true);
            this.isInitialized = true;
            return;
        }
        SITreeDTO smartIntentTree = this.smartIntentDM.getSmartIntentTree(this.userDM);
        this.cachedSmartIntentTree = smartIntentTree;
        if (smartIntentTree == null) {
            handleTreeUnAvailable();
            return;
        }
        showSmartIntentTreeInitialState(smartIntentTree);
        if (this.lastSavedState.selectedRootIntentLocalId != null) {
            handleRootIntentSelectedInternal(this.lastSavedState.selectedRootIntentLocalId.longValue());
        } else if (this.lastSavedState.isBottomSheetInExpandedState) {
            onSmartIntentBottomSheetExpanded();
        }
        if (StringUtils.isNotEmpty(this.lastSavedState.userTypedQuery)) {
            if (!this.lastSavedState.isSearchUIVisible) {
                this.skipSearchOnUserQueryChange = true;
            }
            this.replyFieldViewState.setReplyText(this.lastSavedState.userTypedQuery);
        }
        this.isInitialized = true;
    }

    public void handleRootIntentSelected(RootIntentUIModel rootIntentUIModel) {
        HSLogger.d(TAG, "On user selected a root intent : " + rootIntentUIModel.label);
        handleRootIntentSelectedInternal(rootIntentUIModel.localId);
        HashMap map = new HashMap();
        map.put("acid", this.activeConversation.acid);
        map.put(AnalyticsEventKey.SMART_INTENT_IS_LEAF_INTENT, false);
        SmartIntentDTO rootIntentDTO = getRootIntentDTO(rootIntentUIModel.localId);
        if (rootIntentDTO != null) {
            map.put(AnalyticsEventKey.SMART_INTENT_IDS, this.platform.getJsonifier().jsonifyListToJsonArray(Collections.singletonList(rootIntentDTO.serverId)));
        }
        this.domain.getAnalyticsEventDM().pushEvent(AnalyticsEventType.SMART_INTENT_SELECTION, map);
    }

    private void handleRootIntentSelectedInternal(long j) {
        SmartIntentLeafViewState smartIntentLeafViewStateBuildSmartIntentLeafViewState = buildSmartIntentLeafViewState(this.smartIntentDM.getSmartIntentTree(this.userDM), j);
        BaseSmartIntentViewState topItem = this.backStackController.getTopItem();
        if (topItem instanceof SmartIntentCollapsedRootViewState) {
            this.backStackController.addItem(buildSmartIntentExpandedRootViewState((SmartIntentCollapsedRootViewState) topItem));
        }
        if (this.backStackController.addItem(smartIntentLeafViewStateBuildSmartIntentLeafViewState)) {
            this.callback.updateSmartIntentView(smartIntentLeafViewStateBuildSmartIntentLeafViewState);
        }
    }

    void handleLeafIntentSelected(LeafIntentUIModel leafIntentUIModel) {
        HSLogger.d(TAG, "On user selected a leaf intent : " + leafIntentUIModel.label);
        this.callback.hideSmartIntentView();
        resetInternalStates();
        createPreIssue(leafIntentUIModel.localId, null, null);
    }

    private void createPreIssue(long j, Integer num, Double d) {
        List<SmartIntentDTO> rootToLeafIntents = getRootToLeafIntents(j);
        ArrayList arrayList = new ArrayList();
        ArrayList arrayList2 = new ArrayList();
        for (SmartIntentDTO smartIntentDTO : rootToLeafIntents) {
            arrayList.add(smartIntentDTO.serverId);
            arrayList2.add(smartIntentDTO.label);
        }
        this.callback.createPreIssueFromSmartIntentSelection(this.cachedSmartIntentTree.serverId, arrayList, arrayList2, this.replyFieldViewState.getReplyText());
        HashMap map = new HashMap();
        map.put("acid", this.activeConversation.acid);
        map.put(AnalyticsEventKey.SMART_INTENT_IS_LEAF_INTENT, true);
        if (ListUtils.isNotEmpty(arrayList)) {
            map.put(AnalyticsEventKey.SMART_INTENT_IDS, this.platform.getJsonifier().jsonifyListToJsonArray(arrayList));
        }
        if (d != null) {
            map.put(AnalyticsEventKey.SMART_INTENT_SEARCH_CONFIDENCE, d);
        }
        if (num != null) {
            map.put(AnalyticsEventKey.SMART_INTENT_SEARCH_RANK, num);
        }
        this.domain.getAnalyticsEventDM().pushEvent(AnalyticsEventType.SMART_INTENT_SELECTION, map);
    }

    void handleSearchIntentSelected(SearchIntentUIModel searchIntentUIModel) {
        this.callback.hideSmartIntentView();
        resetInternalStates();
        Map<String, Object> searchAnalyticsData = getSearchAnalyticsData();
        searchAnalyticsData.put(AnalyticsEventKey.SMART_INTENT_SEARCH_CLEAR, false);
        this.domain.getAnalyticsEventDM().pushEvent(AnalyticsEventType.SMART_INTENT_SEARCH_INTENT, searchAnalyticsData);
        createPreIssue(searchIntentUIModel.localId, Integer.valueOf(searchIntentUIModel.rank), searchIntentUIModel.confidence);
    }

    private Map<String, Object> getSearchAnalyticsData() {
        HashMap map = new HashMap();
        map.put("acid", this.activeConversation.acid);
        SISearchResultDTO sISearchResultDTO = this.lastSearchResultData;
        if (sISearchResultDTO != null && sISearchResultDTO.isSearchPerformed) {
            if (this.lastSearchResultData.aiModelVersion != null) {
                map.put(AnalyticsEventKey.SMART_INTENT_MODEL_VERSION, this.lastSearchResultData.aiModelVersion);
            }
            if (this.lastSearchResultData.searchIntentLevel != null) {
                map.put("l", this.lastSearchResultData.searchIntentLevel);
            }
            if (this.lastSearchResultData.searchAlgorithmType != null) {
                if (this.lastSearchResultData.searchAlgorithmType.intValue() == 1) {
                    map.put(AnalyticsEventKey.SMART_INTENT_SEARCH_ALGORITHM, "ml");
                } else if (this.lastSearchResultData.searchAlgorithmType.intValue() == 2) {
                    map.put(AnalyticsEventKey.SMART_INTENT_SEARCH_ALGORITHM, ModelKeys.KEY_CAMPAIGN_DETAIL_MODEL_STYLE_SHEET);
                }
            }
            if (this.lastSearchResultData.searchResults != null) {
                Map<String, List<SearchIntentUIModel>> intentIdToSearchIntentUIModelIndex = getIntentIdToSearchIntentUIModelIndex();
                int size = 0;
                if (intentIdToSearchIntentUIModelIndex != null) {
                    Iterator<ValuePair<String, Double>> it = this.lastSearchResultData.searchResults.iterator();
                    while (it.hasNext()) {
                        List<SearchIntentUIModel> list = intentIdToSearchIntentUIModelIndex.get(it.next().first);
                        if (ListUtils.isNotEmpty(list)) {
                            size += list.size();
                        }
                    }
                }
                map.put(AnalyticsEventKey.SMART_INTENT_SEARCH_RESULT_COUNT, Integer.valueOf(size));
            }
        }
        return map;
    }

    private List<SmartIntentDTO> getRootToLeafIntents(long j) {
        ArrayList arrayList = new ArrayList();
        SITreeDTO sITreeDTO = this.cachedSmartIntentTree;
        if (sITreeDTO == null) {
            return arrayList;
        }
        Iterator<SmartIntentDTO> it = sITreeDTO.rootIntents.iterator();
        loop0: while (true) {
            if (!it.hasNext()) {
                break;
            }
            SmartIntentDTO next = it.next();
            for (SmartIntentDTO smartIntentDTO : next.children) {
                if (smartIntentDTO.localId.longValue() == j) {
                    arrayList.add(next);
                    arrayList.add(smartIntentDTO);
                    break loop0;
                }
            }
        }
        return arrayList;
    }

    private SmartIntentDTO getRootIntentDTO(long j) {
        SITreeDTO sITreeDTO = this.cachedSmartIntentTree;
        if (sITreeDTO == null) {
            return null;
        }
        for (SmartIntentDTO smartIntentDTO : sITreeDTO.rootIntents) {
            if (smartIntentDTO.localId.longValue() == j) {
                return smartIntentDTO;
            }
        }
        return null;
    }

    private void resetInternalStates() {
        this.lastSavedState = null;
        this.isShowingFakeTAI = false;
        this.isInitialized = false;
        this.backStackController.clear();
    }

    public boolean handleBackPressedForSmartIntent() {
        if (this.backStackController.isEmpty()) {
            return false;
        }
        HSLogger.d(TAG, "On user pressed back button");
        if (this.backStackController.isTopItemOfType(SmartIntentCollapsedRootViewState.class)) {
            return false;
        }
        BaseSmartIntentViewState baseSmartIntentViewStatePopTopItem = this.backStackController.popTopItem();
        if (baseSmartIntentViewStatePopTopItem instanceof SmartIntentSearchResultViewState) {
            Map<String, Object> searchAnalyticsData = getSearchAnalyticsData();
            searchAnalyticsData.put(AnalyticsEventKey.SMART_INTENT_SEARCH_CLEAR, true);
            this.domain.getAnalyticsEventDM().pushEvent(AnalyticsEventType.SMART_INTENT_SEARCH_INTENT, searchAnalyticsData);
        } else if (baseSmartIntentViewStatePopTopItem instanceof SmartIntentLeafViewState) {
            SmartIntentDTO rootIntentDTO = getRootIntentDTO(((SmartIntentLeafViewState) baseSmartIntentViewStatePopTopItem).parentIntentId);
            List listSingletonList = rootIntentDTO != null ? Collections.singletonList(rootIntentDTO.serverId) : null;
            HashMap map = new HashMap();
            map.put("acid", this.activeConversation.acid);
            if (ListUtils.isNotEmpty(listSingletonList)) {
                map.put(AnalyticsEventKey.SMART_INTENT_IDS, this.platform.getJsonifier().jsonifyListToJsonArray(listSingletonList));
            }
            this.domain.getAnalyticsEventDM().pushEvent(AnalyticsEventType.SMART_INTENT_DESELECTION, map);
        }
        BaseSmartIntentViewState topItem = this.backStackController.getTopItem();
        if (topItem == null) {
            return false;
        }
        this.callback.updateSmartIntentView(topItem);
        return true;
    }

    public void onSmartIntentBottomSheetCollapsed() {
        HSLogger.d(TAG, "Smart intent bottom sheet state changed to collapsed mode");
        this.backStackController.popTopItem(SmartIntentExpandedRootViewState.class);
        BaseSmartIntentViewState topItem = this.backStackController.getTopItem();
        if (topItem instanceof SmartIntentCollapsedRootViewState) {
            this.callback.updateSmartIntentView(topItem);
        }
    }

    public void onSmartIntentBottomSheetExpanded() {
        HSLogger.d(TAG, "Smart intent bottom sheet state changed to Expanded mode");
        BaseSmartIntentViewState topItem = this.backStackController.getTopItem();
        if (topItem instanceof SmartIntentCollapsedRootViewState) {
            SmartIntentExpandedRootViewState smartIntentExpandedRootViewStateBuildSmartIntentExpandedRootViewState = buildSmartIntentExpandedRootViewState((SmartIntentCollapsedRootViewState) topItem);
            if (this.backStackController.addItem(smartIntentExpandedRootViewStateBuildSmartIntentExpandedRootViewState)) {
                this.callback.updateSmartIntentView(smartIntentExpandedRootViewStateBuildSmartIntentExpandedRootViewState);
            }
        }
    }

    public BaseViewState getReplyButtonViewState() {
        return this.replyButtonViewState;
    }

    public BaseViewState getClearSearchButtonViewState() {
        return this.clearSearchViewState;
    }

    public ReplyFieldViewState getReplyFieldViewState() {
        return this.replyFieldViewState;
    }

    public void onSmartIntentTextChanged(CharSequence charSequence) {
        HSLogger.d(TAG, "On user query change");
        String string = charSequence == null ? "" : charSequence.toString();
        this.replyFieldViewState.setReplyText(string);
        this.replyButtonViewState.setEnabled(!StringUtils.isEmpty(string));
        this.clearSearchViewState.setVisible(this.cachedSmartIntentTree.enforceIntentSelection && !StringUtils.isEmpty(string));
        if (this.skipSearchOnUserQueryChange) {
            this.skipSearchOnUserQueryChange = false;
            return;
        }
        SISearchResultDTO sISearchResultDTOMatch = this.smartIntentDM.match(this.cachedSmartIntentTree, string);
        if (sISearchResultDTOMatch != null) {
            updateUIOnSearchResultChange(sISearchResultDTOMatch, string);
        }
    }

    private void updateUIOnSearchResultChange(SISearchResultDTO sISearchResultDTO, String str) {
        SmartIntentSearchResultViewState smartIntentSearchResultViewState;
        BaseSmartIntentViewState topItem;
        SISearchResultDTO sISearchResultDTO2;
        if (!sISearchResultDTO.isSearchPerformed) {
            if (!StringUtils.isEmpty(str) && (sISearchResultDTO2 = this.lastSearchResultData) != null && sISearchResultDTO2.isSearchPerformed) {
                Map<String, Object> searchAnalyticsData = getSearchAnalyticsData();
                searchAnalyticsData.put(AnalyticsEventKey.SMART_INTENT_SEARCH_CLEAR, true);
                this.domain.getAnalyticsEventDM().pushEvent(AnalyticsEventType.SMART_INTENT_SEARCH_INTENT, searchAnalyticsData);
            }
            if (this.backStackController.popTopItem(SmartIntentSearchResultViewState.class) != null && (topItem = this.backStackController.getTopItem()) != null) {
                this.callback.updateSmartIntentView(topItem);
            }
        } else {
            if (ListUtils.isEmpty(sISearchResultDTO.searchResults)) {
                smartIntentSearchResultViewState = new SmartIntentSearchResultViewState(this.cachedSmartIntentTree.emptySearchTitle, this.cachedSmartIntentTree.emptySearchDescription, this.cachedSmartIntentTree.enforceIntentSelection, Collections.emptyList());
            } else {
                smartIntentSearchResultViewState = new SmartIntentSearchResultViewState(this.cachedSmartIntentTree.searchTitle, "", this.cachedSmartIntentTree.enforceIntentSelection, convertToSearchIntentUIModelList(sISearchResultDTO.searchResults));
            }
            this.backStackController.popTopItem(SmartIntentSearchResultViewState.class);
            if (this.backStackController.addItem(smartIntentSearchResultViewState)) {
                this.callback.updateSmartIntentView(smartIntentSearchResultViewState);
            }
        }
        this.lastSearchResultData = sISearchResultDTO;
    }

    public void onSmartIntentSendButtonClick(String str) {
        if (StringUtils.userVisibleCharacterCount(str) < this.domain.getSDKConfigurationDM().getMinimumConversationDescriptionLength()) {
            this.callback.showSmartIntentReplyValidationFailedError();
            return;
        }
        this.callback.hideSmartIntentView();
        resetInternalStates();
        this.callback.createPreIssueFromSmartIntentSendButton(this.cachedSmartIntentTree.serverId, str);
        SISearchResultDTO sISearchResultDTO = this.lastSearchResultData;
        if (sISearchResultDTO == null || !sISearchResultDTO.isSearchPerformed) {
            return;
        }
        Map<String, Object> searchAnalyticsData = getSearchAnalyticsData();
        searchAnalyticsData.put(AnalyticsEventKey.SMART_INTENT_SEARCH_CLEAR, false);
        this.domain.getAnalyticsEventDM().pushEvent(AnalyticsEventType.SMART_INTENT_SEARCH_INTENT, searchAnalyticsData);
    }

    public boolean shouldShowSmartIntentFakeTypingIndicator() {
        return this.isShowingFakeTAI;
    }

    private void updateConversationReplyFooter(boolean z) {
        if (z) {
            this.callback.showReplyFooterFromSmartIntent();
        } else {
            this.callback.hideReplyFooterFromSmartIntent();
        }
    }

    private void showFakeTypingIndicator(boolean z) {
        this.isShowingFakeTAI = z;
        if (z) {
            this.callback.showFakeTypingIndicatorFromSmartIntent();
        } else {
            this.callback.hideFakeTypingIndicatorFromSmartIntent();
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void handleTreeUnAvailable() {
        resetInternalStates();
        showFakeTypingIndicator(false);
        notifyShowReplyBox();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void handleTreeAvailable(SITreeDTO sITreeDTO) {
        this.cachedSmartIntentTree = sITreeDTO;
        this.intentIdToSearchIntentUIModelMapping = null;
        showFakeTypingIndicator(false);
        showSmartIntentTreeInitialState(sITreeDTO);
        sendTreeShownEvent(sITreeDTO);
    }

    @Override // com.helpshift.conversation.smartintent.SmartIntentDMCallback
    public void onTreeAvailable(UserDM userDM, final SITreeDTO sITreeDTO) {
        if (this.userDM.getLocalId().equals(userDM.getLocalId())) {
            this.domain.runOnUI(new F() { // from class: com.helpshift.conversation.viewmodel.SmartIntentVM.1
                @Override // com.helpshift.common.domain.F
                public void f() {
                    SmartIntentVM.this.handleTreeAvailable(sITreeDTO);
                }
            });
        }
    }

    @Override // com.helpshift.conversation.smartintent.SmartIntentDMCallback
    public void onTreeUnAvailable(UserDM userDM) {
        if (this.userDM.getLocalId().equals(userDM.getLocalId())) {
            this.domain.runOnUI(new F() { // from class: com.helpshift.conversation.viewmodel.SmartIntentVM.2
                @Override // com.helpshift.common.domain.F
                public void f() {
                    SmartIntentVM.this.handleTreeUnAvailable();
                }
            });
        }
    }

    private void notifyShowReplyBox() {
        this.callback.showReplyFooterFromSmartIntent();
    }

    public SmartIntentSavedState buildInstanceSaveState() {
        if (this.isShowingFakeTAI) {
            return new SmartIntentSavedState(false, null, null, false, true);
        }
        if (!this.isInitialized || this.backStackController.isEmpty()) {
            return null;
        }
        String replyText = this.replyFieldViewState.getReplyText();
        boolean z = !this.backStackController.isTopItemOfType(SmartIntentCollapsedRootViewState.class);
        BaseSmartIntentViewState lastItemOfType = this.backStackController.getLastItemOfType(SmartIntentLeafViewState.class);
        return new SmartIntentSavedState(z, lastItemOfType instanceof SmartIntentLeafViewState ? Long.valueOf(((SmartIntentLeafViewState) lastItemOfType).parentIntentId) : null, replyText, this.backStackController.isTopItemOfType(SmartIntentSearchResultViewState.class), false);
    }

    public void onRestoreInstanceState(SmartIntentSavedState smartIntentSavedState) {
        this.lastSavedState = smartIntentSavedState;
    }

    private Map<String, List<SearchIntentUIModel>> getIntentIdToSearchIntentUIModelIndex() {
        Map<String, List<SearchIntentUIModel>> map = this.intentIdToSearchIntentUIModelMapping;
        if (map != null) {
            return map;
        }
        if (this.cachedSmartIntentTree == null) {
            return null;
        }
        HashMap map2 = new HashMap();
        for (SmartIntentDTO smartIntentDTO : this.cachedSmartIntentTree.rootIntents) {
            ArrayList arrayList = new ArrayList();
            for (SmartIntentDTO smartIntentDTO2 : smartIntentDTO.children) {
                SearchIntentUIModel searchIntentUIModel = new SearchIntentUIModel(smartIntentDTO2.localId.longValue(), smartIntentDTO2.label, smartIntentDTO.label);
                map2.put(smartIntentDTO2.serverId, Collections.singletonList(searchIntentUIModel));
                arrayList.add(searchIntentUIModel);
            }
            map2.put(smartIntentDTO.serverId, arrayList);
        }
        this.intentIdToSearchIntentUIModelMapping = map2;
        return map2;
    }

    private List<SearchIntentUIModel> convertToSearchIntentUIModelList(List<ValuePair<String, Double>> list) {
        Map<String, List<SearchIntentUIModel>> intentIdToSearchIntentUIModelIndex = getIntentIdToSearchIntentUIModelIndex();
        ArrayList arrayList = new ArrayList();
        if (intentIdToSearchIntentUIModelIndex == null) {
            return arrayList;
        }
        int i = 1;
        for (ValuePair<String, Double> valuePair : list) {
            List<SearchIntentUIModel> list2 = intentIdToSearchIntentUIModelIndex.get(valuePair.first);
            if (ListUtils.isNotEmpty(list2)) {
                Iterator<SearchIntentUIModel> it = list2.iterator();
                while (it.hasNext()) {
                    SearchIntentUIModel searchIntentUIModelDeepClone = it.next().deepClone();
                    searchIntentUIModelDeepClone.rank = i;
                    searchIntentUIModelDeepClone.confidence = valuePair.second;
                    arrayList.add(searchIntentUIModelDeepClone);
                    i++;
                }
            }
        }
        return arrayList;
    }

    public boolean isSmartIntentUIVisible() {
        return this.isInitialized;
    }

    public void onDestroy() {
        this.smartIntentDM.unregisterSmartIntentDMCallback();
    }
}
