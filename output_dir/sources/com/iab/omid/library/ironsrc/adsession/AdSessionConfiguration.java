package com.iab.omid.library.ironsrc.adsession;

import com.iab.omid.library.ironsrc.d.b;
import com.iab.omid.library.ironsrc.d.e;
import org.json.JSONObject;

/* JADX INFO: loaded from: classes2.dex */
public class AdSessionConfiguration {
    private final Owner impressionOwner;
    private final boolean isolateVerificationScripts;
    private final Owner videoEventsOwner;

    private AdSessionConfiguration(Owner owner, Owner owner2, boolean z) {
        this.impressionOwner = owner;
        if (owner2 == null) {
            this.videoEventsOwner = Owner.NONE;
        } else {
            this.videoEventsOwner = owner2;
        }
        this.isolateVerificationScripts = z;
    }

    @Deprecated
    public static AdSessionConfiguration createAdSessionConfiguration(Owner owner, Owner owner2) {
        return createAdSessionConfiguration(owner, owner2, true);
    }

    public static AdSessionConfiguration createAdSessionConfiguration(Owner owner, Owner owner2, boolean z) {
        e.a(owner, "Impression owner is null");
        e.a(owner);
        return new AdSessionConfiguration(owner, owner2, z);
    }

    public boolean isNativeImpressionOwner() {
        return Owner.NATIVE == this.impressionOwner;
    }

    public boolean isNativeVideoEventsOwner() {
        return Owner.NATIVE == this.videoEventsOwner;
    }

    public JSONObject toJsonObject() {
        JSONObject jSONObject = new JSONObject();
        b.a(jSONObject, "impressionOwner", this.impressionOwner);
        b.a(jSONObject, "videoEventsOwner", this.videoEventsOwner);
        b.a(jSONObject, "isolateVerificationScripts", Boolean.valueOf(this.isolateVerificationScripts));
        return jSONObject;
    }
}
