package com.helpshift.support.util;

import android.content.Context;
import android.view.View;
import com.google.android.material.snackbar.Snackbar;
import com.helpshift.R;
import com.helpshift.common.exception.ExceptionType;
import com.helpshift.common.exception.NetworkException;
import com.helpshift.common.exception.PlatformException;
import com.helpshift.util.HelpshiftContext;
import com.helpshift.views.HSSnackbar;
import com.helpshift.views.HSToast;
import java.util.WeakHashMap;

/* JADX INFO: loaded from: classes2.dex */
public class SnackbarUtil {
    private static WeakHashMap<View, Snackbar> viewToSnackbarMapping = new WeakHashMap<>();

    public static class SnackbarErrorCodes {
        public static final int INVALID_FAQ_PUBLISH_ID = 102;
        public static final int INVALID_SECTION_PUBLISH_ID = 103;
    }

    public static void showSnackbar(View view, CharSequence charSequence, int i) {
        if (charSequence == null || charSequence.length() == 0) {
            return;
        }
        if (view != null) {
            Snackbar snackbarMake = HSSnackbar.make(view, charSequence, i);
            snackbarMake.show();
            viewToSnackbarMapping.put(view, snackbarMake);
            return;
        }
        HSToast.makeText(HelpshiftContext.getApplicationContext(), charSequence, i == -1 ? 0 : 1).show();
    }

    public static void showSnackbar(View view, int i, int i2) {
        CharSequence text;
        if (view != null) {
            text = view.getResources().getText(i);
        } else {
            text = HelpshiftContext.getApplicationContext().getResources().getText(i);
        }
        showSnackbar(view, text, i2);
    }

    public static void showErrorSnackbar(int i, View view) {
        if (i == -1) {
            return;
        }
        showSnackbar(view, getErrorMessage(i, view == null ? HelpshiftContext.getApplicationContext() : view.getContext()), -1);
    }

    private static String getErrorMessage(int i, Context context) {
        int i2;
        if (i == 102) {
            i2 = R.string.hs__invalid_faq_publish_id_error;
        } else if (i == 103) {
            i2 = R.string.hs__invalid_section_publish_id_error;
        } else {
            i2 = R.string.hs__network_error_msg;
        }
        return context.getResources().getString(i2);
    }

    public static void showSnackbar(ExceptionType exceptionType, View view) {
        showSnackbar(view, getErrorMessage(exceptionType, view == null ? HelpshiftContext.getApplicationContext() : view.getContext()), -1);
    }

    private static String getErrorMessage(ExceptionType exceptionType, Context context) {
        int i;
        if (exceptionType == NetworkException.NO_CONNECTION) {
            i = R.string.hs__network_unavailable_msg;
        } else if (exceptionType == NetworkException.UNKNOWN_HOST) {
            i = R.string.hs__could_not_reach_support_msg;
        } else if (exceptionType == NetworkException.SSL_PEER_UNVERIFIED) {
            i = R.string.hs__ssl_peer_unverified_error;
        } else if (exceptionType == NetworkException.SSL_HANDSHAKE) {
            i = R.string.hs__ssl_handshake_error;
        } else if (exceptionType == NetworkException.CONTENT_NOT_FOUND) {
            i = R.string.hs__data_not_found_msg;
        } else if (exceptionType == NetworkException.SCREENSHOT_UPLOAD_ERROR) {
            i = R.string.hs__screenshot_upload_error_msg;
        } else if (exceptionType == PlatformException.NO_APPS_FOR_OPENING_ATTACHMENT) {
            i = R.string.hs__could_not_open_attachment_msg;
        } else if (exceptionType == PlatformException.FILE_NOT_FOUND) {
            i = R.string.hs__file_not_found_msg;
        } else {
            i = R.string.hs__network_error_msg;
        }
        return context.getResources().getString(i);
    }

    public static void hideSnackbar(View view) {
        if (view == null) {
            return;
        }
        Snackbar snackbar = viewToSnackbarMapping.get(view);
        if (snackbar != null && snackbar.isShown()) {
            snackbar.dismiss();
        }
        viewToSnackbarMapping.remove(view);
    }
}
