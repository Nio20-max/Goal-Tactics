package com.ironsource.mediationsdk;

/* JADX INFO: loaded from: classes2.dex */
public class ISBannerSize {
    private static final String size_custom = "CUSTOM";
    private String mDescription;
    private int mHeight;
    private int mWidth;
    private static final String size_banner = "BANNER";
    public static final ISBannerSize BANNER = new ISBannerSize(size_banner, 320, 50);
    private static final String size_large = "LARGE";
    public static final ISBannerSize LARGE = new ISBannerSize(size_large, 320, 90);
    private static final String size_rectangle = "RECTANGLE";
    public static final ISBannerSize RECTANGLE = new ISBannerSize(size_rectangle, 300, 250);
    private static final String size_leaderboard = "LEADERBOARD";
    protected static final ISBannerSize LEADERBOARD = new ISBannerSize(size_leaderboard, 728, 90);
    private static final String size_smart = "SMART";
    public static final ISBannerSize SMART = new ISBannerSize(size_smart, 0, 0);

    public ISBannerSize(int i, int i2) {
        this("CUSTOM", i, i2);
    }

    public ISBannerSize(String str, int i, int i2) {
        this.mDescription = str;
        this.mWidth = i;
        this.mHeight = i2;
    }

    public String getDescription() {
        return this.mDescription;
    }

    public int getWidth() {
        return this.mWidth;
    }

    public int getHeight() {
        return this.mHeight;
    }

    public boolean isSmart() {
        return this.mDescription.equals(size_smart);
    }
}
