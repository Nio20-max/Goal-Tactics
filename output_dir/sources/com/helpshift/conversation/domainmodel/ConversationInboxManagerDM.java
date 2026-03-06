package com.helpshift.conversation.domainmodel;

import com.helpshift.account.domainmodel.UserDM;
import com.helpshift.account.domainmodel.UserManagerDM;
import com.helpshift.common.HSBlockReason;
import com.helpshift.common.domain.Domain;
import com.helpshift.common.platform.Platform;
import com.helpshift.util.HSLogger;
import com.helpshift.util.ListUtils;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/* JADX INFO: loaded from: classes2.dex */
public class ConversationInboxManagerDM {
    public static final String TAG = "ConvInboxManagerDM";
    private Map<Long, ConversationController> activeUserAndInboxMapping = new HashMap();
    private final Domain domain;
    private final Platform platform;
    private final UserManagerDM userManagerDM;

    public ConversationInboxManagerDM(Platform platform, Domain domain, UserManagerDM userManagerDM) {
        this.platform = platform;
        this.domain = domain;
        this.userManagerDM = userManagerDM;
    }

    private ConversationController buildConversationInboxDM(UserDM userDM) {
        return new ConversationController(this.platform, this.domain, userDM);
    }

    public synchronized ConversationController getActiveConversationInboxDM() {
        ConversationController conversationController;
        UserDM activeUser;
        ConversationController conversationControllerBuildConversationInboxDM = null;
        try {
            activeUser = this.userManagerDM.getActiveUser();
            conversationController = this.activeUserAndInboxMapping.get(activeUser.getLocalId());
        } catch (Exception e) {
            e = e;
        }
        if (conversationController == null) {
            try {
                conversationControllerBuildConversationInboxDM = buildConversationInboxDM(activeUser);
                conversationControllerBuildConversationInboxDM.initialize();
                this.activeUserAndInboxMapping.clear();
                this.activeUserAndInboxMapping.put(activeUser.getLocalId(), conversationControllerBuildConversationInboxDM);
            } catch (Exception e2) {
                e = e2;
                conversationControllerBuildConversationInboxDM = conversationController;
                HSLogger.e(TAG, "Exception while setting up active conversation controller", e);
                this.domain.blockPublicAPI(HSBlockReason.FETCH_ACTIVE_USER_ERROR);
            }
            conversationController = conversationControllerBuildConversationInboxDM;
        }
        return conversationController;
    }

    public synchronized ConversationController getConversationInboxDM(UserDM userDM) {
        if (userDM == null) {
            return null;
        }
        ConversationController conversationControllerBuildConversationInboxDM = this.activeUserAndInboxMapping.get(userDM.getLocalId());
        if (conversationControllerBuildConversationInboxDM == null) {
            conversationControllerBuildConversationInboxDM = buildConversationInboxDM(userDM);
        }
        return conversationControllerBuildConversationInboxDM;
    }

    public synchronized void deleteConversations(UserDM userDM) {
        ConversationController conversationInboxDM = getConversationInboxDM(userDM);
        if (conversationInboxDM != null) {
            conversationInboxDM.deleteAllConversationsData();
        }
    }

    public synchronized void resetPreIssueConversations() {
        List<UserDM> allUsers = this.domain.getUserManagerDM().getAllUsers();
        if (ListUtils.isEmpty(allUsers)) {
            return;
        }
        for (UserDM userDM : allUsers) {
            ConversationController conversationInboxDM = getConversationInboxDM(userDM);
            if (conversationInboxDM != null) {
                conversationInboxDM.resetPreIssueConversationsForUser(userDM);
            }
        }
    }
}
