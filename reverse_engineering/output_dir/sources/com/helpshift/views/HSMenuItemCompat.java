package com.helpshift.views;

import android.view.MenuItem;
import android.view.View;
import androidx.core.view.MenuItemCompat;
import com.helpshift.util.ApplicationUtil;
import com.helpshift.util.HSLogger;
import com.helpshift.util.HelpshiftContext;

/* JADX INFO: loaded from: classes2.dex */
public class HSMenuItemCompat {
    public static <T extends MenuItem.OnActionExpandListener & MenuItemCompat.OnActionExpandListener> void setOnActionExpandListener(MenuItem menuItem, T t) {
        if (ApplicationUtil.isSupportLibVersionEqualAndAbove(HelpshiftContext.getApplicationContext(), 26)) {
            try {
                menuItem.setOnActionExpandListener(t);
                return;
            } catch (UnsupportedOperationException e) {
                HSLogger.e("HSMenuItemCompat", "Exception thrown while calling MenuItem#setOnActionExpandListener: ", e);
                MenuItemCompat.setOnActionExpandListener(menuItem, t);
                return;
            }
        }
        MenuItemCompat.setOnActionExpandListener(menuItem, t);
    }

    public static View getActionView(MenuItem menuItem) {
        if (ApplicationUtil.isSupportLibVersionEqualAndAbove(HelpshiftContext.getApplicationContext(), 26)) {
            return menuItem.getActionView();
        }
        return MenuItemCompat.getActionView(menuItem);
    }

    public static boolean isActionViewExpanded(MenuItem menuItem) {
        if (ApplicationUtil.isSupportLibVersionEqualAndAbove(HelpshiftContext.getApplicationContext(), 26)) {
            return menuItem.isActionViewExpanded();
        }
        return MenuItemCompat.isActionViewExpanded(menuItem);
    }

    public static void collapseActionView(MenuItem menuItem) {
        if (ApplicationUtil.isSupportLibVersionEqualAndAbove(HelpshiftContext.getApplicationContext(), 26)) {
            menuItem.collapseActionView();
        } else {
            MenuItemCompat.collapseActionView(menuItem);
        }
    }

    public static void expandActionView(MenuItem menuItem) {
        if (ApplicationUtil.isSupportLibVersionEqualAndAbove(HelpshiftContext.getApplicationContext(), 26)) {
            menuItem.expandActionView();
        } else {
            MenuItemCompat.expandActionView(menuItem);
        }
    }
}
