package com.helpshift.conversation.activeconversation.message.input;

import com.helpshift.util.StringUtils;

/* JADX INFO: loaded from: classes2.dex */
public class Input {
    public final String botInfo;
    public final String inputLabel;
    public final boolean required;
    public final String skipLabel;

    public Input(String str, boolean z, String str2, String str3) {
        this.botInfo = str;
        this.required = z;
        this.inputLabel = str2;
        this.skipLabel = str3;
    }

    protected Input(Input input) {
        this.botInfo = input.botInfo;
        this.required = input.required;
        this.inputLabel = input.inputLabel;
        this.skipLabel = input.skipLabel;
    }

    public boolean equals(Object obj) {
        if (!(obj instanceof Input)) {
            return false;
        }
        Input input = (Input) obj;
        return input.required == this.required && StringUtils.isEqual(input.inputLabel, this.inputLabel) && StringUtils.isEqual(input.skipLabel, this.skipLabel) && StringUtils.isEqual(input.botInfo, this.botInfo);
    }
}
