package com.helpshift.conversation.activeconversation.message.input;

import com.helpshift.util.CloneUtil;
import com.helpshift.util.HSCloneable;
import java.util.List;

/* JADX INFO: loaded from: classes2.dex */
public class OptionInput extends Input implements HSCloneable {
    public final List<Option> options;
    public final Type type;

    public OptionInput(String str, boolean z, String str2, String str3, List<Option> list, Type type) {
        super(str, z, str2, str3);
        this.options = list;
        this.type = type;
    }

    private OptionInput(OptionInput optionInput) {
        super(optionInput);
        this.options = CloneUtil.deepClone(optionInput.options);
        this.type = optionInput.type;
    }

    @Override // com.helpshift.util.HSCloneable
    public OptionInput deepClone() {
        return new OptionInput(this);
    }

    public static class Option implements HSCloneable {
        public final String jsonData;
        public final String title;

        public Option(String str, String str2) {
            this.title = str;
            this.jsonData = str2;
        }

        private Option(Option option) {
            this.title = option.title;
            this.jsonData = option.jsonData;
        }

        public boolean equals(Object obj) {
            if (!(obj instanceof Option)) {
                return false;
            }
            Option option = (Option) obj;
            return option.title.equals(this.title) && option.jsonData.equals(this.jsonData);
        }

        @Override // com.helpshift.util.HSCloneable
        public Option deepClone() {
            return new Option(this);
        }
    }

    public enum Type {
        PILL("pill"),
        PICKER("picker");

        private final String optionInputType;

        Type(String str) {
            this.optionInputType = str;
        }

        @Override // java.lang.Enum
        public String toString() {
            return this.optionInputType;
        }

        public static Type getType(String str, int i) {
            if ("pill".equals(str)) {
                return PILL;
            }
            if ("picker".equals(str)) {
                return PICKER;
            }
            if (i <= 5) {
                return PILL;
            }
            return PICKER;
        }
    }
}
