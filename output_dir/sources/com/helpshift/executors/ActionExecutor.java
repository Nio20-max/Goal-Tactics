package com.helpshift.executors;

import android.app.Activity;
import com.helpshift.enums.ACTION_TYPE;
import java.io.Serializable;

/* JADX INFO: loaded from: classes2.dex */
public interface ActionExecutor extends Serializable {
    public static final long serialVersionUID = -5804259965557523136L;

    void executeAction(Activity activity, ACTION_TYPE action_type, String str);
}
