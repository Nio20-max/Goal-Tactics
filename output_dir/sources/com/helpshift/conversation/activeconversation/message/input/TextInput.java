package com.helpshift.conversation.activeconversation.message.input;

import com.helpshift.common.domain.Domain;
import com.helpshift.common.util.HSDateFormatSpec;
import com.helpshift.util.HSCloneable;
import com.helpshift.util.HSPattern;
import com.helpshift.util.StringUtils;
import java.text.ParseException;

/* JADX INFO: loaded from: classes2.dex */
public class TextInput extends Input implements HSCloneable {
    private Domain domain;
    public final int keyboard;
    public final String placeholder;

    public interface Keyboard {
        public static final int DATE = 4;
        public static final int EMAIL = 2;
        public static final int NUMERIC = 3;
        public static final int TEXT = 1;
    }

    public TextInput(String str, boolean z, String str2, String str3, String str4, int i) {
        super(str, z, str2, str3);
        this.placeholder = str4;
        this.keyboard = i;
    }

    private TextInput(TextInput textInput) {
        super(textInput);
        this.placeholder = textInput.placeholder;
        this.keyboard = textInput.keyboard;
        this.domain = textInput.domain;
    }

    public void setDependencies(Domain domain) {
        this.domain = domain;
    }

    public boolean validate(String str) {
        int i = this.keyboard;
        if (i == 2) {
            return HSPattern.isValidEmail(str);
        }
        if (i == 3) {
            return HSPattern.isPositiveNumber(str);
        }
        if (i != 4) {
            return true;
        }
        try {
            HSDateFormatSpec.getDateFormatter(HSDateFormatSpec.DISPLAY_DATE_PATTERN, this.domain.getLocaleProviderDM().getCurrentLocale()).parse(str.trim());
            return true;
        } catch (ParseException unused) {
            return false;
        }
    }

    @Override // com.helpshift.conversation.activeconversation.message.input.Input
    public boolean equals(Object obj) {
        if (!(obj instanceof TextInput)) {
            return false;
        }
        TextInput textInput = (TextInput) obj;
        return textInput.keyboard == this.keyboard && StringUtils.isEqual(textInput.placeholder, this.placeholder) && super.equals(obj);
    }

    @Override // com.helpshift.util.HSCloneable
    public TextInput deepClone() {
        return new TextInput(this);
    }
}
