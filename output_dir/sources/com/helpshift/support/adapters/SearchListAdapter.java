package com.helpshift.support.adapters;

import android.content.Context;
import android.text.SpannableString;
import android.text.TextUtils;
import android.text.style.BackgroundColorSpan;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.LinearLayout;
import android.widget.TextView;
import androidx.recyclerview.widget.RecyclerView;
import com.google.android.gms.actions.SearchIntents;
import com.helpshift.R;
import com.helpshift.support.ContactUsFilter;
import com.helpshift.support.Faq;
import com.helpshift.support.util.HSTransliterator;
import com.helpshift.util.Styles;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

/* JADX INFO: loaded from: classes2.dex */
public class SearchListAdapter extends RecyclerView.Adapter<RecyclerView.ViewHolder> {
    private static final int TYPE_FOOTER = 0;
    private static final int TYPE_QUESTION = 1;
    private final int footerCount = 1;
    private View.OnClickListener onContactUsClickedListener;
    private View.OnClickListener onQuestionClickedListener;
    private List<Faq> questions;
    private final String searchQuery;

    public int getFooterCount() {
        return 1;
    }

    public SearchListAdapter(String str, List<Faq> list, View.OnClickListener onClickListener, View.OnClickListener onClickListener2) {
        this.searchQuery = str;
        this.questions = list;
        this.onQuestionClickedListener = onClickListener;
        this.onContactUsClickedListener = onClickListener2;
    }

    @Override // androidx.recyclerview.widget.RecyclerView.Adapter
    public RecyclerView.ViewHolder onCreateViewHolder(ViewGroup viewGroup, int i) {
        if (i == 0) {
            return new FooterViewHolder((LinearLayout) LayoutInflater.from(viewGroup.getContext()).inflate(R.layout.hs__search_list_footer, viewGroup, false));
        }
        return new QuestionViewHolder((TextView) LayoutInflater.from(viewGroup.getContext()).inflate(R.layout.hs_simple_recycler_view_item, viewGroup, false));
    }

    @Override // androidx.recyclerview.widget.RecyclerView.Adapter
    public void onBindViewHolder(RecyclerView.ViewHolder viewHolder, int i) {
        if (isPositionFooter(i)) {
            configureFooterViewHolder((FooterViewHolder) viewHolder);
        } else {
            configureQuestionViewHolder((QuestionViewHolder) viewHolder, i);
        }
    }

    @Override // androidx.recyclerview.widget.RecyclerView.Adapter
    public int getItemViewType(int i) {
        return isPositionFooter(i) ? 0 : 1;
    }

    @Override // androidx.recyclerview.widget.RecyclerView.Adapter
    public long getItemId(int i) {
        if (isPositionFooter(i)) {
            return 0L;
        }
        return Long.valueOf(this.questions.get(i).publish_id).longValue();
    }

    @Override // androidx.recyclerview.widget.RecyclerView.Adapter
    public int getItemCount() {
        return this.questions.size() + 1;
    }

    private void configureFooterViewHolder(FooterViewHolder footerViewHolder) {
        Context context = footerViewHolder.button.getContext();
        String string = context.getResources().getString(R.string.hs__search_footer);
        String string2 = context.getResources().getString(R.string.hs__no_search_results_message);
        if (ContactUsFilter.showContactUs(ContactUsFilter.LOCATION.SEARCH_FOOTER)) {
            if (getItemCount() == 1) {
                footerViewHolder.contactUsHintText.setText(string2.replaceFirst(SearchIntents.EXTRA_QUERY, " \"" + this.searchQuery + "\""));
                footerViewHolder.divider.setVisibility(8);
            } else {
                footerViewHolder.divider.setVisibility(0);
                footerViewHolder.contactUsHintText.setText(string);
            }
            footerViewHolder.contactUsView.setVisibility(0);
            footerViewHolder.noFaqsView.setVisibility(8);
            footerViewHolder.button.setOnClickListener(this.onContactUsClickedListener);
            return;
        }
        footerViewHolder.contactUsView.setVisibility(8);
        if (getItemCount() == 1) {
            footerViewHolder.noFaqsView.setVisibility(0);
        } else {
            footerViewHolder.noFaqsView.setVisibility(8);
        }
    }

    private void configureQuestionViewHolder(QuestionViewHolder questionViewHolder, int i) {
        Faq faq = this.questions.get(i);
        ArrayList<String> arrayList = faq.searchTerms;
        String str = faq.title;
        if (arrayList != null && arrayList.size() > 0) {
            int color = Styles.getColor(questionViewHolder.textView.getContext(), R.attr.hs__searchHighlightColor);
            SpannableString spannableString = new SpannableString(str);
            if (str.equals(HSTransliterator.unidecode(str))) {
                String lowerCase = str.toLowerCase();
                for (String str2 : arrayList) {
                    if (str2.length() >= 3) {
                        for (int iIndexOf = TextUtils.indexOf(lowerCase, str2, 0); iIndexOf >= 0; iIndexOf = TextUtils.indexOf(lowerCase, str2, iIndexOf + str2.length())) {
                            spannableString.setSpan(new BackgroundColorSpan(color), iIndexOf, str2.length() + iIndexOf, 33);
                        }
                    }
                }
            } else {
                int length = str.length();
                StringBuilder sb = new StringBuilder();
                ArrayList arrayList2 = new ArrayList();
                for (int i2 = 0; i2 < length; i2++) {
                    String strUnidecode = HSTransliterator.unidecode(str.charAt(i2) + "");
                    for (int i3 = 0; i3 < strUnidecode.length(); i3++) {
                        sb.append(strUnidecode.charAt(i3));
                        arrayList2.add(Integer.valueOf(i2));
                    }
                }
                String lowerCase2 = sb.toString().toLowerCase();
                Iterator<String> it = arrayList.iterator();
                while (it.hasNext()) {
                    String lowerCase3 = it.next().toLowerCase();
                    if (lowerCase3.length() >= 3) {
                        for (int iIndexOf2 = TextUtils.indexOf(lowerCase2, lowerCase3, 0); iIndexOf2 >= 0; iIndexOf2 = TextUtils.indexOf(lowerCase2, lowerCase3, iIndexOf2 + lowerCase3.length())) {
                            spannableString.setSpan(new BackgroundColorSpan(color), ((Integer) arrayList2.get(iIndexOf2)).intValue(), ((Integer) arrayList2.get((lowerCase3.length() + iIndexOf2) - 1)).intValue() + 1, 33);
                        }
                    }
                }
            }
            questionViewHolder.textView.setText(spannableString);
        } else {
            questionViewHolder.textView.setText(str);
        }
        questionViewHolder.textView.setOnClickListener(this.onQuestionClickedListener);
        questionViewHolder.textView.setTag(faq.publish_id);
    }

    public Faq getFaq(String str) {
        List<Faq> list = this.questions;
        if (list == null) {
            return null;
        }
        for (Faq faq : list) {
            if (faq.publish_id.equals(str)) {
                return faq;
            }
        }
        return null;
    }

    private boolean isPositionFooter(int i) {
        return i == getItemCount() - 1;
    }

    private static class QuestionViewHolder extends RecyclerView.ViewHolder {
        TextView textView;

        public QuestionViewHolder(TextView textView) {
            super(textView);
            this.textView = textView;
        }
    }

    private static class FooterViewHolder extends RecyclerView.ViewHolder {
        Button button;
        TextView contactUsHintText;
        LinearLayout contactUsView;
        View divider;
        TextView noFaqsView;

        FooterViewHolder(LinearLayout linearLayout) {
            super(linearLayout);
            this.contactUsView = (LinearLayout) linearLayout.findViewById(R.id.contact_us_view);
            this.contactUsHintText = (TextView) linearLayout.findViewById(R.id.contact_us_hint_text);
            this.button = (Button) linearLayout.findViewById(R.id.report_issue);
            this.noFaqsView = (TextView) linearLayout.findViewById(R.id.no_faqs_view);
            this.divider = linearLayout.findViewById(R.id.search_list_footer_divider);
        }
    }
}
