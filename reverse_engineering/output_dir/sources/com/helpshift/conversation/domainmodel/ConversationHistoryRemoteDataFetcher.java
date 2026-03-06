package com.helpshift.conversation.domainmodel;

import com.helpshift.account.domainmodel.UserDM;
import com.helpshift.common.domain.Domain;
import com.helpshift.common.domain.network.AuthenticationFailureNetwork;
import com.helpshift.common.domain.network.FailedAPICallNetworkDecorator;
import com.helpshift.common.domain.network.GuardOKNetwork;
import com.helpshift.common.domain.network.Network;
import com.helpshift.common.domain.network.NetworkDataRequestUtil;
import com.helpshift.common.domain.network.POSTNetwork;
import com.helpshift.common.domain.network.TSCorrectedNetwork;
import com.helpshift.common.exception.RootAPIException;
import com.helpshift.common.platform.Platform;
import com.helpshift.common.platform.network.RequestData;
import com.helpshift.conversation.dto.ConversationHistory;
import java.util.HashMap;

/* JADX INFO: loaded from: classes2.dex */
public class ConversationHistoryRemoteDataFetcher {
    private Domain domain;
    private Platform platform;
    private UserDM userDM;

    public ConversationHistoryRemoteDataFetcher(Platform platform, Domain domain, UserDM userDM) {
        this.platform = platform;
        this.domain = domain;
        this.userDM = userDM;
    }

    private Network buildFetchNetwork() {
        return new GuardOKNetwork(new TSCorrectedNetwork(new FailedAPICallNetworkDecorator(new AuthenticationFailureNetwork(new POSTNetwork("/conversations/history/", this.domain, this.platform))), this.platform));
    }

    private RequestData buildRequestData(String str) {
        HashMap<String, String> userRequestData = NetworkDataRequestUtil.getUserRequestData(this.userDM);
        userRequestData.put("cursor", str);
        return new RequestData(userRequestData);
    }

    public ConversationHistory fetchConversations(String str) throws RootAPIException {
        return this.platform.getResponseParser().parseConversationHistory(buildFetchNetwork().makeRequest(buildRequestData(str)).responseString);
    }
}
