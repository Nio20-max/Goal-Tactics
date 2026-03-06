package com.helpshift.delegate;

import com.helpshift.HelpshiftUser;
import com.helpshift.account.domainmodel.UserDM;
import com.helpshift.common.domain.Domain;
import com.helpshift.common.domain.F;
import com.helpshift.conversation.activeconversation.model.ActionType;
import java.io.File;
import java.util.HashMap;
import java.util.Map;

/* JADX INFO: loaded from: classes2.dex */
public class UIThreadDelegateDecorator {
    private Map<String, Boolean> authenticationFailedCalledList = new HashMap();
    private RootDelegate delegate;
    private Domain domain;

    public UIThreadDelegateDecorator(Domain domain) {
        this.domain = domain;
    }

    public void sessionBegan() {
        if (this.delegate != null) {
            this.domain.runOnUI(new F() { // from class: com.helpshift.delegate.UIThreadDelegateDecorator.1
                @Override // com.helpshift.common.domain.F
                public void f() {
                    UIThreadDelegateDecorator.this.delegate.sessionBegan();
                }
            });
        }
    }

    public void sessionEnded() {
        if (this.delegate != null) {
            this.domain.runOnUI(new F() { // from class: com.helpshift.delegate.UIThreadDelegateDecorator.2
                @Override // com.helpshift.common.domain.F
                public void f() {
                    UIThreadDelegateDecorator.this.delegate.sessionEnded();
                }
            });
        }
    }

    public void newConversationStarted(final String str) {
        if (this.delegate != null) {
            this.domain.runOnUI(new F() { // from class: com.helpshift.delegate.UIThreadDelegateDecorator.3
                @Override // com.helpshift.common.domain.F
                public void f() {
                    UIThreadDelegateDecorator.this.delegate.newConversationStarted(str);
                }
            });
        }
    }

    public void conversationEnded() {
        if (this.delegate != null) {
            this.domain.runOnUI(new F() { // from class: com.helpshift.delegate.UIThreadDelegateDecorator.4
                @Override // com.helpshift.common.domain.F
                public void f() {
                    UIThreadDelegateDecorator.this.delegate.conversationEnded();
                }
            });
        }
    }

    public void userRepliedToConversation(final String str) {
        if (this.delegate != null) {
            this.domain.runOnUI(new F() { // from class: com.helpshift.delegate.UIThreadDelegateDecorator.5
                @Override // com.helpshift.common.domain.F
                public void f() {
                    UIThreadDelegateDecorator.this.delegate.userRepliedToConversation(str);
                }
            });
        }
    }

    public void userCompletedCustomerSatisfactionSurvey(final int i, final String str) {
        if (this.delegate != null) {
            this.domain.runOnUI(new F() { // from class: com.helpshift.delegate.UIThreadDelegateDecorator.6
                @Override // com.helpshift.common.domain.F
                public void f() {
                    UIThreadDelegateDecorator.this.delegate.userCompletedCustomerSatisfactionSurvey(i, str);
                }
            });
        }
    }

    public void displayAttachmentFile(final File file) {
        if (this.delegate != null) {
            this.domain.runOnUI(new F() { // from class: com.helpshift.delegate.UIThreadDelegateDecorator.7
                @Override // com.helpshift.common.domain.F
                public void f() {
                    UIThreadDelegateDecorator.this.delegate.displayAttachmentFile(file);
                }
            });
        }
    }

    public void didReceiveNotification(final int i) {
        if (this.delegate != null) {
            this.domain.runOnUI(new F() { // from class: com.helpshift.delegate.UIThreadDelegateDecorator.8
                @Override // com.helpshift.common.domain.F
                public void f() {
                    UIThreadDelegateDecorator.this.delegate.didReceiveNotification(i);
                }
            });
        }
    }

    public void authenticationFailed(UserDM userDM, final AuthenticationFailureReason authenticationFailureReason) {
        if (this.delegate == null || !userDM.isActiveUser()) {
            return;
        }
        String str = userDM.getLocalId() + "_" + userDM.getAuthToken();
        if (this.authenticationFailedCalledList.containsKey(str) && this.authenticationFailedCalledList.get(str).booleanValue()) {
            return;
        }
        this.authenticationFailedCalledList.put(str, true);
        final HelpshiftUser helpshiftUserBuild = new HelpshiftUser.Builder(userDM.getIdentifier(), userDM.getEmail()).setName(userDM.getName()).setAuthToken(userDM.getAuthToken()).build();
        this.domain.runOnUI(new F() { // from class: com.helpshift.delegate.UIThreadDelegateDecorator.9
            @Override // com.helpshift.common.domain.F
            public void f() {
                UIThreadDelegateDecorator.this.delegate.authenticationFailed(helpshiftUserBuild, authenticationFailureReason);
            }
        });
    }

    public void userClickOnAction(final ActionType actionType, final String str) {
        if (this.delegate != null) {
            this.domain.runOnUI(new F() { // from class: com.helpshift.delegate.UIThreadDelegateDecorator.10
                @Override // com.helpshift.common.domain.F
                public void f() {
                    UIThreadDelegateDecorator.this.delegate.userClickOnAction(actionType, str);
                }
            });
        }
    }

    public boolean isDelegateRegistered() {
        return this.delegate != null;
    }

    public RootDelegate getDelegate() {
        return this.delegate;
    }

    public void setDelegate(RootDelegate rootDelegate) {
        this.delegate = rootDelegate;
    }
}
