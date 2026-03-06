package com.helpshift.support.util;

import android.content.Context;
import android.content.res.TypedArray;
import android.graphics.drawable.Drawable;
import android.os.Build;
import android.text.TextUtils;
import android.util.TypedValue;
import android.widget.ImageButton;
import com.helpshift.R;
import com.helpshift.support.Faq;
import java.util.ArrayList;
import java.util.Collections;
import java.util.LinkedHashSet;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/* JADX INFO: loaded from: classes2.dex */
public class Styles {
    public static int getColor(Context context, int i) {
        TypedArray typedArrayObtainStyledAttributes = context.getTheme().obtainStyledAttributes(new int[]{i});
        int color = typedArrayObtainStyledAttributes.getColor(0, -1);
        typedArrayObtainStyledAttributes.recycle();
        return color;
    }

    public static int getInt(Context context, int i) {
        TypedArray typedArrayObtainStyledAttributes = context.getTheme().obtainStyledAttributes(new int[]{i});
        int i2 = typedArrayObtainStyledAttributes.getInt(0, 0);
        typedArrayObtainStyledAttributes.recycle();
        return i2;
    }

    public static void setImageAlpha(ImageButton imageButton, int i) {
        if (Build.VERSION.SDK_INT >= 16) {
            imageButton.setImageAlpha(i);
        } else {
            imageButton.setAlpha(i);
        }
    }

    public static void setSendMessageButtonIconColor(Context context, Drawable drawable, boolean z) {
        com.helpshift.util.Styles.setColorFilter(context, drawable, z ? R.attr.colorAccent : android.R.attr.textColorHint);
    }

    public static void setAdminChatBubbleColor(Context context, Drawable drawable) {
        com.helpshift.util.Styles.setColorFilter(context, drawable, R.attr.hs__chatBubbleAdminBackgroundColor);
    }

    public static void setAccentColor(Context context, Drawable drawable) {
        com.helpshift.util.Styles.setColorFilter(context, drawable, R.attr.colorAccent);
    }

    public static Faq getQuestionWithHighlightedSearchTerms(Context context, Faq faq, ArrayList<String> arrayList) {
        if (arrayList == null || arrayList.size() <= 0) {
            return null;
        }
        Collections.sort(arrayList);
        Collections.reverse(arrayList);
        String str = faq.title;
        String str2 = faq.body;
        LinkedHashSet<String> linkedHashSet = new LinkedHashSet();
        String hexColor = com.helpshift.util.Styles.getHexColor(context, R.attr.hs__searchHighlightColor);
        if (!(HSTransliterator.unidecode(str).equals(str) && HSTransliterator.unidecode(str2).equals(str2))) {
            int length = str.length();
            ArrayList arrayList2 = new ArrayList();
            String str3 = "";
            for (int i = 0; i < length; i++) {
                String strUnidecode = HSTransliterator.unidecode(str.charAt(i) + "");
                for (int i2 = 0; i2 < strUnidecode.length(); i2++) {
                    str3 = str3 + strUnidecode.charAt(i2);
                    arrayList2.add(Integer.valueOf(i));
                }
            }
            String lowerCase = str3.toLowerCase();
            int length2 = str2.length();
            HSTransliterator.unidecode(str2);
            ArrayList arrayList3 = new ArrayList();
            String str4 = "";
            for (int i3 = 0; i3 < length2; i3++) {
                String strUnidecode2 = HSTransliterator.unidecode(str2.charAt(i3) + "");
                for (int i4 = 0; i4 < strUnidecode2.length(); i4++) {
                    str4 = str4 + strUnidecode2.charAt(i4);
                    arrayList3.add(Integer.valueOf(i3));
                }
            }
            String lowerCase2 = str4.toLowerCase();
            for (String str5 : arrayList) {
                if (str5.length() >= 3) {
                    String lowerCase3 = str5.toLowerCase();
                    for (int iIndexOf = TextUtils.indexOf(lowerCase, lowerCase3, 0); iIndexOf >= 0; iIndexOf = TextUtils.indexOf(lowerCase, lowerCase3, iIndexOf + lowerCase3.length())) {
                        linkedHashSet.add(str.substring(((Integer) arrayList2.get(iIndexOf)).intValue(), ((Integer) arrayList2.get((lowerCase3.length() + iIndexOf) - 1)).intValue() + 1));
                    }
                    for (int iIndexOf2 = TextUtils.indexOf(lowerCase2, lowerCase3, 0); iIndexOf2 >= 0; iIndexOf2 = TextUtils.indexOf(lowerCase2, lowerCase3, iIndexOf2 + lowerCase3.length())) {
                        linkedHashSet.add(str2.substring(((Integer) arrayList3.get(iIndexOf2)).intValue(), ((Integer) arrayList3.get((lowerCase3.length() + iIndexOf2) - 1)).intValue() + 1));
                    }
                }
            }
        } else {
            for (String str6 : arrayList) {
                if (str6.length() >= 3) {
                    linkedHashSet.add(str6);
                }
            }
        }
        String str7 = ">" + str2 + "<";
        String str8 = ">" + str + "<";
        Pattern patternCompile = Pattern.compile(">[^<]+<");
        for (String str9 : linkedHashSet) {
            Matcher matcher = patternCompile.matcher(str8);
            String strReplace = str8;
            while (matcher.find()) {
                String strSubstring = str8.substring(matcher.start(), matcher.end());
                strReplace = strReplace.replace(strSubstring, strSubstring.replaceAll("(?i)(" + str9 + ")", "<span style=\"background-color: " + hexColor + "\">$1</span>"));
            }
            Matcher matcher2 = patternCompile.matcher(str7);
            String strReplace2 = str7;
            while (matcher2.find()) {
                String strSubstring2 = str7.substring(matcher2.start(), matcher2.end());
                strReplace2 = strReplace2.replace(strSubstring2, strSubstring2.replaceAll("(?i)(" + str9 + ")", "<span style=\"background-color: " + hexColor + "\">$1</span>"));
            }
            str7 = strReplace2;
            str8 = strReplace;
        }
        return new Faq(1L, faq.getId(), faq.publish_id, faq.language, faq.section_publish_id, str8.substring(1, str8.length() - 1), str7.substring(1, str7.length() - 1), faq.is_helpful, faq.is_rtl, faq.getTags(), faq.getCategoryTags());
    }

    public static boolean isTablet(Context context) {
        return context.getResources().getBoolean(R.bool.is_screen_large);
    }

    public static int getResourceIdForAttribute(Context context, int i) {
        TypedValue typedValue = new TypedValue();
        context.getTheme().resolveAttribute(i, typedValue, true);
        return typedValue.resourceId;
    }
}
