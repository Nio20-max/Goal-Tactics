package com.helpshift.support;

import android.content.Context;
import android.os.Bundle;
import android.view.View;
import androidx.fragment.app.FragmentActivity;
import com.helpshift.R;
import com.helpshift.model.InfoModelFactory;
import com.helpshift.support.flows.CustomContactUsFlowListHolder;
import com.helpshift.support.flows.Flow;
import com.helpshift.util.AssetsUtil;
import com.helpshift.util.LocaleContextUtil;
import java.util.List;

/* JADX INFO: loaded from: classes2.dex */
public final class HSReview extends FragmentActivity {
    private List<Flow> flowList;

    @Override // androidx.fragment.app.FragmentActivity, androidx.activity.ComponentActivity, androidx.core.app.ComponentActivity, android.app.Activity
    public void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        Integer theme = InfoModelFactory.getInstance().sdkInfoModel.getTheme();
        setTheme(AssetsUtil.resourceExists(this, theme) ? theme.intValue() : R.style.Helpshift_Theme_Base);
        setContentView(new View(this));
        this.flowList = CustomContactUsFlowListHolder.getFlowList();
        CustomContactUsFlowListHolder.setFlowList(null);
        new HSReviewFragment().show(getSupportFragmentManager(), "hs__review_dialog");
    }

    @Override // androidx.fragment.app.FragmentActivity, android.app.Activity
    protected void onDestroy() {
        super.onDestroy();
        CustomContactUsFlowListHolder.setFlowList(this.flowList);
        LocaleContextUtil.restoreApplicationLocale();
    }

    @Override // android.app.Activity, android.view.ContextThemeWrapper, android.content.ContextWrapper
    protected void attachBaseContext(Context context) {
        super.attachBaseContext(LocaleContextUtil.getContextWithUpdatedLocaleLegacy(context));
    }
}
