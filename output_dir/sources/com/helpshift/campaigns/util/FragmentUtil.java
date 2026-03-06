package com.helpshift.campaigns.util;

import android.text.TextUtils;
import androidx.fragment.app.Fragment;
import androidx.fragment.app.FragmentManager;
import androidx.fragment.app.FragmentTransaction;
import com.helpshift.R;
import com.helpshift.campaigns.fragments.InboxFragment;
import com.helpshift.model.InfoModelFactory;

/* JADX INFO: loaded from: classes.dex */
public class FragmentUtil {
    public static void startFragment(FragmentManager fragmentManager, int i, Fragment fragment, String str, String str2, boolean z) {
        FragmentTransaction fragmentTransactionBeginTransaction = fragmentManager.beginTransaction();
        Fragment fragmentFindFragmentById = fragmentManager.findFragmentById(i);
        if (!InfoModelFactory.getInstance().appInfoModel.disableAnimations.booleanValue()) {
            if (fragmentFindFragmentById == null) {
                fragmentTransactionBeginTransaction.setCustomAnimations(0, 0, 0, 0);
            } else {
                fragmentTransactionBeginTransaction.setCustomAnimations(R.anim.hs__slide_in_from_right, R.anim.hs__slide_out_to_left, R.anim.hs__slide_in_from_left, R.anim.hs__slide_out_to_right);
            }
        }
        fragmentTransactionBeginTransaction.replace(i, fragment, str);
        if (!TextUtils.isEmpty(str2)) {
            fragmentTransactionBeginTransaction.addToBackStack(str2);
        }
        fragmentTransactionBeginTransaction.commit();
        if (z) {
            fragmentManager.executePendingTransactions();
        }
    }

    public static void removeFragment(FragmentManager fragmentManager, Fragment fragment) {
        FragmentTransaction fragmentTransactionBeginTransaction = fragmentManager.beginTransaction();
        fragmentTransactionBeginTransaction.remove(fragment);
        fragmentTransactionBeginTransaction.commit();
    }

    public static InboxFragment getInboxFragment(Fragment fragment) {
        Fragment parentFragment = fragment.getParentFragment();
        if (parentFragment == null) {
            return null;
        }
        if (parentFragment instanceof InboxFragment) {
            return (InboxFragment) parentFragment;
        }
        return getInboxFragment(parentFragment);
    }
}
