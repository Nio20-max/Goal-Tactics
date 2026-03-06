package com.helpshift.conversation.viewmodel;

import com.helpshift.account.AuthenticationFailureDM;
import com.helpshift.common.domain.Domain;
import com.helpshift.common.domain.F;
import com.helpshift.conversation.activeconversation.AttachmentPreviewRenderer;

/* JADX INFO: loaded from: classes2.dex */
public class AttachmentPreviewVM implements AuthenticationFailureDM.AuthenticationFailureObserver {
    private final Domain domain;
    private AttachmentPreviewRenderer renderer;

    public AttachmentPreviewVM(Domain domain, AttachmentPreviewRenderer attachmentPreviewRenderer) {
        this.domain = domain;
        this.renderer = attachmentPreviewRenderer;
        domain.getAuthenticationFailureDM().registerListener(this);
    }

    @Override // com.helpshift.account.AuthenticationFailureDM.AuthenticationFailureObserver
    public void onAuthenticationFailure() {
        this.domain.runOnUI(new F() { // from class: com.helpshift.conversation.viewmodel.AttachmentPreviewVM.1
            @Override // com.helpshift.common.domain.F
            public void f() {
                if (AttachmentPreviewVM.this.renderer != null) {
                    AttachmentPreviewVM.this.renderer.onAuthenticationFailure();
                }
            }
        });
    }

    public void unregisterRenderer() {
        this.renderer = null;
        this.domain.getAuthenticationFailureDM().unregisterListener(this);
    }
}
