package com.helpshift.support;

import android.os.Parcel;
import android.os.Parcelable;

/* JADX INFO: loaded from: classes2.dex */
public class Section implements Parcelable {
    public static final Parcelable.Creator<Section> CREATOR = new Parcelable.Creator<Section>() { // from class: com.helpshift.support.Section.1
        /* JADX WARN: Can't rename method to resolve collision */
        @Override // android.os.Parcelable.Creator
        public Section createFromParcel(Parcel parcel) {
            return new Section(parcel);
        }

        /* JADX WARN: Can't rename method to resolve collision */
        @Override // android.os.Parcelable.Creator
        public Section[] newArray(int i) {
            return new Section[i];
        }
    };
    private long id;
    private String publish_id;
    private String section_id;
    private String title;

    @Override // android.os.Parcelable
    public int describeContents() {
        return 0;
    }

    public Section() {
        this.id = -1L;
        this.section_id = "";
        this.publish_id = "";
        this.title = "";
    }

    public Section(long j, String str, String str2, String str3) {
        this.id = j;
        this.section_id = str;
        this.title = str2;
        this.publish_id = str3;
    }

    Section(Parcel parcel) {
        this.section_id = parcel.readString();
        this.title = parcel.readString();
        this.publish_id = parcel.readString();
    }

    public String getPublishId() {
        return this.publish_id;
    }

    public String getTitle() {
        return this.title;
    }

    public String getSectionId() {
        return this.section_id;
    }

    public boolean equals(Object obj) {
        Section section = (Section) obj;
        return section != null && this.title.equals(section.title) && this.publish_id.equals(section.publish_id) && this.section_id.equals(section.section_id);
    }

    public String toString() {
        return this.title;
    }

    @Override // android.os.Parcelable
    public void writeToParcel(Parcel parcel, int i) {
        parcel.writeString(this.section_id);
        parcel.writeString(this.title);
        parcel.writeString(this.publish_id);
    }
}
