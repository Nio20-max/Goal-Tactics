package com.helpshift.util;

import android.text.Spannable;
import android.text.SpannableString;
import android.text.method.LinkMovementMethod;
import android.text.method.MovementMethod;
import android.text.style.URLSpan;
import android.util.Patterns;
import android.view.View;
import android.widget.TextView;
import androidx.core.net.MailTo;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.Locale;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/* JADX INFO: loaded from: classes2.dex */
public class HSLinkify {
    public static final int ALL = 15;
    private static final int EMAIL_ADDRESSES = 2;
    private static final int MAP_ADDRESSES = 8;
    private static final int PHONE_NUMBERS = 4;
    private static final String TAG = "Helpshift_HSlnkfy";
    public static final int WEB_URLS = 1;
    private static final MatchFilter sUrlMatchFilter = new MatchFilter() { // from class: com.helpshift.util.HSLinkify.1
        @Override // com.helpshift.util.HSLinkify.MatchFilter
        public final boolean acceptMatch(CharSequence charSequence, int i, int i2) {
            return i == 0 || charSequence.charAt(i - 1) != '@';
        }
    };

    public interface LinkClickListener {
        void onLinkClickFailed();

        void onLinkClicked(String str);
    }

    public interface MatchFilter {
        boolean acceptMatch(CharSequence charSequence, int i, int i2);
    }

    public interface TransformFilter {
        String transformUrl(Matcher matcher, String str);
    }

    private static boolean addLinks(Spannable spannable, int i, LinkClickListener linkClickListener) {
        int i2;
        boolean z;
        boolean z2;
        if (i == 0) {
            return false;
        }
        URLSpan[] uRLSpanArr = (URLSpan[]) spannable.getSpans(0, spannable.length(), URLSpan.class);
        for (int length = uRLSpanArr.length - 1; length >= 0; length--) {
            spannable.removeSpan(uRLSpanArr[length]);
        }
        ArrayList<LinkSpec> arrayList = new ArrayList();
        if ((i & 1) != 0) {
            Matcher matcher = Patterns.WEB_URL.matcher(spannable);
            while (matcher.find()) {
                int iStart = matcher.start();
                int iEnd = matcher.end();
                MatchFilter matchFilter = sUrlMatchFilter;
                if (matchFilter == null || matchFilter.acceptMatch(spannable, iStart, iEnd)) {
                    LinkSpec linkSpec = new LinkSpec();
                    String strGroup = matcher.group(0);
                    String[] strArr = {"http://", "https://", "rtsp://"};
                    int i3 = 0;
                    while (true) {
                        if (i3 >= 3) {
                            z2 = false;
                            break;
                        }
                        int i4 = i3;
                        if (strGroup.regionMatches(true, 0, strArr[i3], 0, strArr[i3].length())) {
                            if (!strGroup.regionMatches(false, 0, strArr[i4], 0, strArr[i4].length())) {
                                strGroup = strArr[i4] + strGroup.substring(strArr[i4].length());
                            }
                            z2 = true;
                        } else {
                            i3 = i4 + 1;
                        }
                    }
                    if (!z2) {
                        strGroup = strArr[0] + strGroup;
                    }
                    linkSpec.url = strGroup;
                    linkSpec.start = iStart;
                    linkSpec.end = iEnd;
                    arrayList.add(linkSpec);
                }
            }
        }
        if ((i & 2) != 0) {
            Matcher matcher2 = Patterns.EMAIL_ADDRESS.matcher(spannable);
            while (matcher2.find()) {
                int iStart2 = matcher2.start();
                int iEnd2 = matcher2.end();
                LinkSpec linkSpec2 = new LinkSpec();
                String strGroup2 = matcher2.group(0);
                String[] strArr2 = {MailTo.MAILTO_SCHEME};
                int i5 = 0;
                while (true) {
                    if (i5 >= 1) {
                        z = false;
                        break;
                    }
                    int i6 = i5;
                    if (strGroup2.regionMatches(true, 0, strArr2[i5], 0, strArr2[i5].length())) {
                        if (!strGroup2.regionMatches(false, 0, strArr2[i6], 0, strArr2[i6].length())) {
                            strGroup2 = strArr2[i6] + strGroup2.substring(strArr2[i6].length());
                        }
                        z = true;
                    } else {
                        i5 = i6 + 1;
                    }
                }
                if (!z) {
                    strGroup2 = strArr2[0] + strGroup2;
                }
                linkSpec2.url = strGroup2;
                linkSpec2.start = iStart2;
                linkSpec2.end = iEnd2;
                arrayList.add(linkSpec2);
            }
        }
        if ((i & 4) != 0) {
            Matcher matcher3 = Patterns.PHONE.matcher(spannable);
            while (matcher3.find()) {
                String strGroup3 = matcher3.group();
                if (strGroup3.length() >= 6) {
                    LinkSpec linkSpec3 = new LinkSpec();
                    linkSpec3.url = "tel:" + strGroup3;
                    linkSpec3.start = matcher3.start();
                    linkSpec3.end = matcher3.end();
                    arrayList.add(linkSpec3);
                }
            }
        }
        Collections.sort(arrayList, new Comparator<LinkSpec>() { // from class: com.helpshift.util.HSLinkify.2
            @Override // java.util.Comparator
            public final boolean equals(Object obj) {
                return false;
            }

            @Override // java.util.Comparator
            public final int compare(LinkSpec linkSpec4, LinkSpec linkSpec5) {
                if (linkSpec4.start < linkSpec5.start) {
                    return -1;
                }
                if (linkSpec4.start <= linkSpec5.start && linkSpec4.end >= linkSpec5.end) {
                    return linkSpec4.end > linkSpec5.end ? -1 : 0;
                }
                return 1;
            }
        });
        int size = arrayList.size();
        int i7 = 0;
        while (i7 < size - 1) {
            LinkSpec linkSpec4 = (LinkSpec) arrayList.get(i7);
            int i8 = i7 + 1;
            LinkSpec linkSpec5 = (LinkSpec) arrayList.get(i8);
            if (linkSpec4.start <= linkSpec5.start && linkSpec4.end > linkSpec5.start) {
                if (linkSpec5.end > linkSpec4.end && linkSpec4.end - linkSpec4.start <= linkSpec5.end - linkSpec5.start) {
                    i2 = linkSpec4.end - linkSpec4.start < linkSpec5.end - linkSpec5.start ? i7 : -1;
                } else {
                    i2 = i8;
                }
                if (i2 != -1) {
                    arrayList.remove(i2);
                    size--;
                }
            }
            i7 = i8;
        }
        if (arrayList.size() == 0) {
            return false;
        }
        for (LinkSpec linkSpec6 : arrayList) {
            spannable.setSpan(getURLSpanWithClickListener(linkSpec6.url, linkClickListener), linkSpec6.start, linkSpec6.end, 33);
        }
        return true;
    }

    public static boolean addLinks(TextView textView, int i, LinkClickListener linkClickListener) {
        if (i == 0) {
            return false;
        }
        CharSequence text = textView.getText();
        if (text instanceof Spannable) {
            if (!addLinks((Spannable) text, i, linkClickListener)) {
                return false;
            }
            MovementMethod movementMethod = textView.getMovementMethod();
            if ((movementMethod == null || !(movementMethod instanceof LinkMovementMethod)) && textView.getLinksClickable()) {
                textView.setMovementMethod(LinkMovementMethod.getInstance());
            }
            return true;
        }
        SpannableString spannableStringValueOf = SpannableString.valueOf(text);
        if (!addLinks(spannableStringValueOf, i, linkClickListener)) {
            return false;
        }
        MovementMethod movementMethod2 = textView.getMovementMethod();
        if ((movementMethod2 == null || !(movementMethod2 instanceof LinkMovementMethod)) && textView.getLinksClickable()) {
            textView.setMovementMethod(LinkMovementMethod.getInstance());
        }
        textView.setText(spannableStringValueOf);
        return true;
    }

    public static void addLinks(TextView textView, Pattern pattern, String str, MatchFilter matchFilter, TransformFilter transformFilter, LinkClickListener linkClickListener) {
        SpannableString spannableStringValueOf = SpannableString.valueOf(textView.getText());
        if (addLinks(spannableStringValueOf, pattern, str, matchFilter, transformFilter, linkClickListener)) {
            textView.setText(spannableStringValueOf);
            MovementMethod movementMethod = textView.getMovementMethod();
            if ((movementMethod == null || !(movementMethod instanceof LinkMovementMethod)) && textView.getLinksClickable()) {
                textView.setMovementMethod(LinkMovementMethod.getInstance());
            }
        }
    }

    private static boolean addLinks(Spannable spannable, Pattern pattern, String str, MatchFilter matchFilter, TransformFilter transformFilter, LinkClickListener linkClickListener) {
        boolean z;
        String lowerCase = str == null ? "" : str.toLowerCase(Locale.ROOT);
        Matcher matcher = pattern.matcher(spannable);
        boolean z2 = false;
        while (matcher.find()) {
            int iStart = matcher.start();
            int iEnd = matcher.end();
            if (matchFilter != null ? matchFilter.acceptMatch(spannable, iStart, iEnd) : true) {
                String strGroup = matcher.group(0);
                String[] strArr = {lowerCase};
                if (transformFilter != null) {
                    strGroup = transformFilter.transformUrl(matcher, strGroup);
                }
                int i = 0;
                while (true) {
                    if (i >= 1) {
                        z = false;
                        break;
                    }
                    int i2 = i;
                    if (strGroup.regionMatches(true, 0, strArr[i], 0, strArr[i].length())) {
                        if (!strGroup.regionMatches(false, 0, strArr[i2], 0, strArr[i2].length())) {
                            strGroup = strArr[i2] + strGroup.substring(strArr[i2].length());
                        }
                        z = true;
                    } else {
                        i = i2 + 1;
                    }
                }
                if (!z) {
                    strGroup = strArr[0] + strGroup;
                }
                spannable.setSpan(getURLSpanWithClickListener(strGroup, linkClickListener), iStart, iEnd, 33);
                z2 = true;
            }
        }
        return z2;
    }

    private static URLSpan getURLSpanWithClickListener(final String str, final LinkClickListener linkClickListener) {
        return new URLSpan(str) { // from class: com.helpshift.util.HSLinkify.3
            @Override // android.text.style.URLSpan, android.text.style.ClickableSpan
            public void onClick(View view) {
                try {
                    super.onClick(view);
                    LinkClickListener linkClickListener2 = linkClickListener;
                    if (linkClickListener2 != null) {
                        linkClickListener2.onLinkClicked(str);
                    }
                } catch (Exception e) {
                    HSLogger.e(HSLinkify.TAG, "Error in handling link click.", e);
                    LinkClickListener linkClickListener3 = linkClickListener;
                    if (linkClickListener3 != null) {
                        linkClickListener3.onLinkClickFailed();
                    }
                }
            }
        };
    }
}
