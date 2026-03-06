package com.helpshift.conversation.smartintent;

import com.helpshift.account.domainmodel.UserDM;
import com.helpshift.conversation.smartintent.dto.SITreeDTO;

/* JADX INFO: loaded from: classes2.dex */
public interface SmartIntentDMCallback {
    void onTreeAvailable(UserDM userDM, SITreeDTO sITreeDTO);

    void onTreeUnAvailable(UserDM userDM);
}
