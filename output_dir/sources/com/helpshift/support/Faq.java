package com.helpshift.support;

import android.os.Parcel;
import android.os.Parcelable;
import com.helpshift.faq.FaqCore;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;

/* JADX INFO: loaded from: classes2.dex */
public final class Faq implements Parcelable {
    public static final Parcelable.Creator<Faq> CREATOR = new Parcelable.Creator<Faq>() { // from class: com.helpshift.support.Faq.1
        /* JADX WARN: Can't rename method to resolve collision */
        @Override // android.os.Parcelable.Creator
        public Faq createFromParcel(Parcel parcel) {
            return new Faq(parcel);
        }

        /* JADX WARN: Can't rename method to resolve collision */
        @Override // android.os.Parcelable.Creator
        public Faq[] newArray(int i) {
            return new Faq[i];
        }
    };
    public final String body;
    private List<String> categoryTags;
    public long id;
    public final int is_helpful;
    public final Boolean is_rtl;
    public final String language;
    public final String publish_id;
    private String qId;
    public ArrayList<String> searchTerms;
    public final String section_publish_id;
    private List<String> tags;
    public final String title;
    private String type;

    @Override // android.os.Parcelable
    public int describeContents() {
        return 0;
    }

    public Faq(long j, String str, String str2, String str3, String str4, String str5, String str6, int i, Boolean bool, List<String> list, List<String> list2) {
        this.id = j;
        this.qId = str;
        this.title = str5;
        this.publish_id = str2;
        this.language = str3;
        this.type = "faq";
        this.section_publish_id = str4;
        this.body = str6;
        this.is_helpful = i;
        this.is_rtl = bool;
        this.tags = list;
        this.categoryTags = list2;
    }

    public Faq(FaqCore faqCore, String str) {
        this.id = 0L;
        this.qId = faqCore.qId;
        this.publish_id = faqCore.publish_id;
        this.language = faqCore.language;
        this.section_publish_id = str;
        this.title = faqCore.title;
        this.body = faqCore.body;
        this.is_helpful = faqCore.is_helpful;
        this.is_rtl = faqCore.is_rtl;
        this.tags = faqCore.tags;
        this.categoryTags = faqCore.categoryTags;
    }

    Faq(Parcel parcel) {
        this.qId = parcel.readString();
        this.title = parcel.readString();
        this.publish_id = parcel.readString();
        this.language = parcel.readString();
        this.type = parcel.readString();
        this.section_publish_id = parcel.readString();
        this.body = parcel.readString();
        this.is_helpful = parcel.readInt();
        this.is_rtl = Boolean.valueOf(parcel.readByte() != 0);
        if (this.searchTerms == null) {
            this.searchTerms = new ArrayList<>();
        }
        if (this.tags == null) {
            this.tags = new ArrayList();
        }
        if (this.categoryTags == null) {
            this.categoryTags = new ArrayList();
        }
        parcel.readStringList(this.searchTerms);
        parcel.readStringList(this.tags);
        parcel.readStringList(this.categoryTags);
    }

    private static ArrayList<String> mergeSearchTerms(ArrayList<String> arrayList, ArrayList<String> arrayList2) {
        HashSet hashSet = new HashSet();
        if (arrayList != null) {
            hashSet.addAll(arrayList);
        }
        if (arrayList2 != null) {
            hashSet.addAll(arrayList2);
        }
        return new ArrayList<>(hashSet);
    }

    @Override // android.os.Parcelable
    public void writeToParcel(Parcel parcel, int i) {
        parcel.writeString(this.qId);
        parcel.writeString(this.title);
        parcel.writeString(this.publish_id);
        parcel.writeString(this.language);
        parcel.writeString(this.type);
        parcel.writeString(this.section_publish_id);
        parcel.writeString(this.body);
        parcel.writeInt(this.is_helpful);
        parcel.writeByte(this.is_rtl.booleanValue() ? (byte) 1 : (byte) 0);
        parcel.writeStringList(this.searchTerms);
        parcel.writeStringList(this.tags);
        parcel.writeStringList(this.categoryTags);
    }

    public String getId() {
        return this.qId;
    }

    public List<String> getTags() {
        List<String> list = this.tags;
        return list == null ? new ArrayList() : list;
    }

    public List<String> getCategoryTags() {
        List<String> list = this.categoryTags;
        return list == null ? new ArrayList() : list;
    }

    protected void clearSearchTerms() {
        this.searchTerms = null;
    }

    protected void addSearchTerms(ArrayList<String> arrayList) {
        this.searchTerms = mergeSearchTerms(this.searchTerms, arrayList);
    }

    public boolean equals(Object obj) {
        Faq faq = (Faq) obj;
        return faq != null && this.qId.equals(faq.qId) && this.title.equals(faq.title) && this.body.equals(faq.body) && this.publish_id.equals(faq.publish_id) && this.language.equals(faq.language) && this.section_publish_id.equals(faq.section_publish_id) && this.is_rtl == faq.is_rtl && this.is_helpful == faq.is_helpful && this.tags.equals(faq.tags) && this.categoryTags.equals(faq.categoryTags);
    }

    public String toString() {
        return this.title;
    }
}
