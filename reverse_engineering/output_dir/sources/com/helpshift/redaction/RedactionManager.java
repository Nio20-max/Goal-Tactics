package com.helpshift.redaction;

import com.helpshift.account.domainmodel.UserDM;
import com.helpshift.common.domain.Domain;
import com.helpshift.common.domain.F;
import com.helpshift.common.platform.Platform;
import com.helpshift.conversation.domainmodel.ConversationController;
import java.lang.ref.WeakReference;

/* JADX INFO: loaded from: classes2.dex */
public class RedactionManager {
    private Domain domain;
    private RedactionDAO redactionDAO;
    private WeakReference<RedactionManagerListener> redactionManagerListener;
    private UserDM userDM;

    public interface RedactionManagerListener {
        void redactionStateChanged(UserDM userDM, RedactionState redactionState, RedactionState redactionState2);
    }

    public RedactionManager(Platform platform, Domain domain, UserDM userDM, RedactionManagerListener redactionManagerListener) {
        this.domain = domain;
        this.userDM = userDM;
        this.redactionManagerListener = new WeakReference<>(redactionManagerListener);
        this.redactionDAO = platform.getRedactionDAO();
    }

    public synchronized void executeRedaction() {
        RedactionState redactionState = getRedactionState();
        if (redactionState != RedactionState.PENDING) {
            return;
        }
        updateUserRedactionState(redactionState, RedactionState.IN_PROGRESS);
        this.domain.runParallel(new F() { // from class: com.helpshift.redaction.RedactionManager.1
            @Override // com.helpshift.common.domain.F
            public void f() {
                ConversationController conversationInboxDM = RedactionManager.this.domain.getConversationInboxManagerDM().getConversationInboxDM(RedactionManager.this.userDM);
                conversationInboxDM.getConversationInboxPoller().stop();
                conversationInboxDM.redactConversations();
                RedactionManager.this.domain.getUserManagerDM().resetSyncState(RedactionManager.this.userDM);
                RedactionManager.this.updateUserRedactionState(RedactionState.IN_PROGRESS, RedactionState.COMPLETED);
            }
        });
    }

    public RedactionState getRedactionState() {
        RedactionDetail redactionDetail = this.redactionDAO.getRedactionDetail(this.userDM.getLocalId().longValue());
        if (redactionDetail == null) {
            return RedactionState.COMPLETED;
        }
        return redactionDetail.redactionState;
    }

    public void setAppropriateInitialState() {
        RedactionState redactionState = getRedactionState();
        if (redactionState == RedactionState.IN_PROGRESS) {
            updateUserRedactionState(redactionState, RedactionState.PENDING);
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void updateUserRedactionState(final RedactionState redactionState, final RedactionState redactionState2) {
        if (redactionState2 == RedactionState.COMPLETED) {
            this.redactionDAO.deleteRedactionDetail(this.userDM.getLocalId().longValue());
        } else {
            this.redactionDAO.updateRedactionState(this.userDM.getLocalId().longValue(), redactionState2);
        }
        this.domain.runSerial(new F() { // from class: com.helpshift.redaction.RedactionManager.2
            @Override // com.helpshift.common.domain.F
            public void f() {
                RedactionManagerListener redactionManagerListener = (RedactionManagerListener) RedactionManager.this.redactionManagerListener.get();
                if (redactionManagerListener != null) {
                    redactionManagerListener.redactionStateChanged(RedactionManager.this.userDM, redactionState, redactionState2);
                }
            }
        });
    }
}
