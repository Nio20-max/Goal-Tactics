package com.helpshift.conversation.activeconversation.message;

import com.helpshift.common.util.HSDateFormatSpec;
import java.util.Date;
import java.util.Locale;

/* JADX INFO: loaded from: classes2.dex */
public class SystemDateMessageDM extends SystemMessageDM {
    public boolean isFirstMessageInList;

    public SystemDateMessageDM(String str, long j, boolean z) {
        super("", str, j, MessageType.SYSTEM_DATE);
        this.isFirstMessageInList = z;
    }

    private SystemDateMessageDM(SystemDateMessageDM systemDateMessageDM) {
        super(systemDateMessageDM);
        this.isFirstMessageInList = systemDateMessageDM.isFirstMessageInList;
    }

    public String getBodyText() {
        Locale currentLocale = this.domain.getLocaleProviderDM().getCurrentLocale();
        return HSDateFormatSpec.getDateFormatter(HSDateFormatSpec.DISPLAY_DATE_PATTERN, currentLocale).format(new Date(getEpochCreatedAtTime()));
    }

    public boolean equals(Object obj) {
        if (obj instanceof SystemDateMessageDM) {
            return ((SystemDateMessageDM) obj).getCreatedAt().equals(getCreatedAt());
        }
        return false;
    }

    @Override // com.helpshift.conversation.activeconversation.message.SystemMessageDM, com.helpshift.conversation.activeconversation.message.MessageDM, com.helpshift.util.HSCloneable
    public SystemDateMessageDM deepClone() {
        return new SystemDateMessageDM(this);
    }
}
