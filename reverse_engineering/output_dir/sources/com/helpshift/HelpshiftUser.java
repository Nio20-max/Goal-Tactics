package com.helpshift;

import com.helpshift.util.HSPattern;

/* JADX INFO: loaded from: classes.dex */
public class HelpshiftUser {
    private String authToken;
    private String email;
    private String identifier;
    private String name;

    private HelpshiftUser(Builder builder) {
        this.identifier = builder.identifier;
        this.email = builder.email;
        this.name = builder.name;
        this.authToken = builder.authToken;
    }

    public String getIdentifier() {
        return this.identifier;
    }

    public String getEmail() {
        return this.email;
    }

    public String getName() {
        return this.name;
    }

    public String getAuthToken() {
        return this.authToken;
    }

    public static final class Builder {
        private String authToken;
        private String email;
        private String identifier;
        private String name;

        public Builder(String str, String str2) {
            this.identifier = null;
            this.email = null;
            if (HSPattern.isValidLoginIdentifier(str) && HSPattern.isValidLoginEmail(str2)) {
                this.identifier = str;
                this.email = str2;
            }
        }

        public Builder setName(String str) {
            this.name = str;
            return this;
        }

        public Builder setAuthToken(String str) {
            this.authToken = str;
            return this;
        }

        public HelpshiftUser build() {
            return new HelpshiftUser(this);
        }
    }
}
