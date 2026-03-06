package com.helpshift.support.views;

import android.content.Context;
import android.util.DisplayMetrics;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.LinearLayout;
import android.widget.TextView;
import androidx.core.view.GravityCompat;
import com.helpshift.conversation.activeconversation.message.input.OptionInput;
import com.helpshift.util.Styles;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

/* JADX INFO: loaded from: classes2.dex */
public class HSAdjustableSelectOptionsViewInflater {
    private LinearLayout containerView;
    private Context context;
    private double maxAvailableWidthScaleFactor;
    private int optionColorId;
    private int optionDrawableId;
    private View.OnClickListener optionSelectionListener;
    private int optionTextViewId;
    private List<OptionInput.Option> options;
    private int rightEndPadding;
    private int selectOptionInflaterLayout;

    public HSAdjustableSelectOptionsViewInflater(Context context, double d, int i, LinearLayout linearLayout, int i2, int i3, int i4, int i5, List<OptionInput.Option> list, View.OnClickListener onClickListener) {
        this.context = context;
        this.maxAvailableWidthScaleFactor = d;
        this.rightEndPadding = i;
        this.containerView = linearLayout;
        this.selectOptionInflaterLayout = i2;
        this.optionTextViewId = i3;
        this.optionDrawableId = i4;
        this.optionColorId = i5;
        this.optionSelectionListener = onClickListener;
        this.options = list;
    }

    public void inflate() {
        ArrayList arrayList = new ArrayList();
        DisplayMetrics displayMetrics = this.context.getResources().getDisplayMetrics();
        int i = ((int) (((double) displayMetrics.widthPixels) * this.maxAvailableWidthScaleFactor)) - ((int) (this.rightEndPadding * displayMetrics.density));
        int size = this.options.size();
        int i2 = 0;
        while (i2 < size) {
            LinearLayout linearLayout = new LinearLayout(this.context);
            linearLayout.setOrientation(0);
            linearLayout.setLayoutParams(new LinearLayout.LayoutParams(-1, -2));
            linearLayout.setGravity(GravityCompat.END);
            while (true) {
                View viewInflate = LayoutInflater.from(this.context).inflate(this.selectOptionInflaterLayout, (ViewGroup) null, false);
                TextView textView = (TextView) viewInflate.findViewById(this.optionTextViewId);
                int paddingLeft = textView.getPaddingLeft();
                int paddingTop = textView.getPaddingTop();
                int paddingRight = textView.getPaddingRight();
                int paddingBottom = textView.getPaddingBottom();
                Styles.setDrawable(this.context, textView, this.optionDrawableId, this.optionColorId);
                textView.setPadding(paddingLeft, paddingTop, paddingRight, paddingBottom);
                textView.setMaxWidth(i);
                OptionInput.Option option = this.options.get(i2);
                textView.setTag(option);
                textView.setText(option.title);
                textView.setOnClickListener(this.optionSelectionListener);
                linearLayout.addView(viewInflate);
                linearLayout.measure(0, 0);
                if (linearLayout.getMeasuredWidth() > i) {
                    if (linearLayout.getChildCount() == 1) {
                        i2++;
                    } else {
                        linearLayout.removeView(viewInflate);
                    }
                    arrayList.add(linearLayout);
                } else {
                    if (i2 == size - 1) {
                        arrayList.add(linearLayout);
                    }
                    i2++;
                    if (i2 >= size) {
                        break;
                    }
                }
            }
        }
        Iterator it = arrayList.iterator();
        while (it.hasNext()) {
            this.containerView.addView((LinearLayout) it.next());
        }
    }
}
