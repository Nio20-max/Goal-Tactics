package com.helpshift.conversation.viewmodel;

import com.helpshift.account.AuthenticationFailureDM;
import com.helpshift.common.domain.Domain;
import com.helpshift.common.domain.F;
import com.helpshift.conversation.activeconversation.ConversationInfoRenderer;

/* JADX INFO: loaded from: classes2.dex */
public class ConversationInfoVM implements AuthenticationFailureDM.AuthenticationFailureObserver {
    private final Domain domain;
    private ConversationInfoRenderer renderer;

    public ConversationInfoVM(Domain domain, ConversationInfoRenderer conversationInfoRenderer) {
        this.domain = domain;
        this.renderer = conversationInfoRenderer;
        domain.getAuthenticationFailureDM().registerListener(this);
    }

    @Override // com.helpshift.account.AuthenticationFailureDM.AuthenticationFailureObserver
    public void onAuthenticationFailure() {
        this.domain.runOnUI(new F() { // from class: com.helpshift.conversation.viewmodel.ConversationInfoVM.1
            @Override // com.helpshift.common.domain.F
            public void f() {
                if (ConversationInfoVM.this.renderer != null) {
                    ConversationInfoVM.this.renderer.onAuthenticationFailure();
                }
            }
        });
    }

    public void unregisterRenderer() {
        this.renderer = null;
        this.domain.getAuthenticationFailureDM().unregisterListener(this);
    }
}
