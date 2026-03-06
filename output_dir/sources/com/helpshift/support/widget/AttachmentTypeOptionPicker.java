package com.helpshift.support.widget;

import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.AdapterView;
import android.widget.FrameLayout;
import android.widget.ListAdapter;
import android.widget.ListPopupWindow;
import android.widget.ListView;
import android.widget.SimpleAdapter;
import android.widget.TextView;
import com.google.android.material.bottomsheet.BottomSheetBehavior;
import com.google.android.material.bottomsheet.BottomSheetDialog;
import com.helpshift.R;
import com.helpshift.support.util.Styles;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/* JADX INFO: loaded from: classes2.dex */
public class AttachmentTypeOptionPicker implements AdapterView.OnItemClickListener {
    private static final String ICON = "icon";
    private static final String TITLE = "title";
    private BottomSheetDialog bottomSheetDialog;
    private Context context;
    OnAttachmentTypeOptionClickListener listener;
    private ListPopupWindow popupWindow;

    public interface OnAttachmentTypeOptionClickListener {
        void launchAttachmentPicker(int i);
    }

    public AttachmentTypeOptionPicker(Context context) {
        this.context = context;
    }

    public void showAttachmentPicker(View view, List<Integer> list) {
        if (list.size() == 1) {
            OnAttachmentTypeOptionClickListener onAttachmentTypeOptionClickListener = this.listener;
            if (onAttachmentTypeOptionClickListener != null) {
                onAttachmentTypeOptionClickListener.launchAttachmentPicker(list.get(0).intValue());
                return;
            }
            return;
        }
        if (Styles.isTablet(this.context)) {
            showPickerForTablet(view, list);
        } else {
            showPickerForPhone(list);
        }
    }

    public void dismissAttachmentPicker() {
        BottomSheetDialog bottomSheetDialog = this.bottomSheetDialog;
        if (bottomSheetDialog != null && bottomSheetDialog.isShowing()) {
            this.bottomSheetDialog.dismiss();
        }
        ListPopupWindow listPopupWindow = this.popupWindow;
        if (listPopupWindow == null || !listPopupWindow.isShowing()) {
            return;
        }
        this.popupWindow.dismiss();
    }

    public void setListener(OnAttachmentTypeOptionClickListener onAttachmentTypeOptionClickListener) {
        this.listener = onAttachmentTypeOptionClickListener;
    }

    @Override // android.widget.AdapterView.OnItemClickListener
    public void onItemClick(AdapterView<?> adapterView, View view, int i, long j) {
        dismissAttachmentPicker();
        if (this.listener != null) {
            String string = ((TextView) view.findViewById(R.id.title)).getText().toString();
            if (this.context.getString(R.string.hs__photo).equals(string)) {
                this.listener.launchAttachmentPicker(1);
            } else if (this.context.getString(R.string.hs__video).equals(string)) {
                this.listener.launchAttachmentPicker(2);
            } else if (this.context.getString(R.string.hs__documents).equals(string)) {
                this.listener.launchAttachmentPicker(3);
            }
        }
    }

    private void showPickerForTablet(View view, List<Integer> list) {
        ListPopupWindow listPopupWindow = new ListPopupWindow(this.context);
        this.popupWindow = listPopupWindow;
        listPopupWindow.setAnchorView(view);
        this.popupWindow.setHorizontalOffset(20);
        this.popupWindow.setVerticalOffset(10);
        this.popupWindow.setAdapter(getAdapter(list));
        this.popupWindow.setWidth((int) this.context.getResources().getDimension(R.dimen.hs__file_option_picker_pop_up_width));
        this.popupWindow.setOnItemClickListener(this);
        this.popupWindow.show();
    }

    private void showPickerForPhone(List<Integer> list) {
        View viewInflate = LayoutInflater.from(this.context).inflate(R.layout.hs__attachment_picker_bottom_sheet, (ViewGroup) null);
        ListView listView = (ListView) viewInflate.findViewById(R.id.picker_list);
        listView.setAdapter(getAdapter(list));
        listView.setOnItemClickListener(this);
        BottomSheetDialog bottomSheetDialog = new BottomSheetDialog(this.context);
        this.bottomSheetDialog = bottomSheetDialog;
        bottomSheetDialog.setContentView(viewInflate);
        FrameLayout frameLayout = (FrameLayout) this.bottomSheetDialog.findViewById(R.id.design_bottom_sheet);
        this.bottomSheetDialog.show();
        if (frameLayout != null) {
            BottomSheetBehavior.from(frameLayout).setState(3);
        }
    }

    private ListAdapter getAdapter(List<Integer> list) {
        return new SimpleAdapter(this.context, getViewDataForWhiteListedAttachment(list), R.layout.hs__attachment_picker_list_item, new String[]{"title", ICON}, new int[]{R.id.title, R.id.icon});
    }

    private List<Map<String, Object>> getViewDataForWhiteListedAttachment(List<Integer> list) {
        ArrayList arrayList = new ArrayList();
        Collections.sort(list);
        for (Integer num : list) {
            if (num.intValue() == 1) {
                arrayList.add(getViewDataForImage());
            } else if (num.intValue() == 2) {
                arrayList.add(getViewDataForVideo());
            } else if (num.intValue() == 3) {
                arrayList.add(getViewDataForDocument());
            }
        }
        return arrayList;
    }

    private Map<String, Object> getViewDataForDocument() {
        HashMap map = new HashMap();
        map.put("title", this.context.getString(R.string.hs__documents));
        map.put(ICON, Integer.valueOf(R.drawable.hs__document_picker_icon));
        return map;
    }

    private Map<String, Object> getViewDataForVideo() {
        HashMap map = new HashMap();
        map.put("title", this.context.getString(R.string.hs__video));
        map.put(ICON, Integer.valueOf(R.drawable.hs__video_picker_icon));
        return map;
    }

    private Map<String, Object> getViewDataForImage() {
        HashMap map = new HashMap();
        map.put("title", this.context.getString(R.string.hs__photo));
        map.put(ICON, Integer.valueOf(R.drawable.hs__image_picker_icon));
        return map;
    }
}
