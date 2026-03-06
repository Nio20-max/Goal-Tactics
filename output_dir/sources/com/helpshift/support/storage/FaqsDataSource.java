package com.helpshift.support.storage;

import android.content.ContentValues;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.text.TextUtils;
import com.facebook.internal.ServerProtocol;
import com.helpshift.support.Faq;
import com.helpshift.support.FaqTagFilter;
import com.helpshift.support.db.faq.FaqsDBHelper;
import com.helpshift.util.DatabaseUtils;
import com.helpshift.util.HSJSONUtils;
import com.helpshift.util.HSLogger;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.List;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/* JADX INFO: loaded from: classes2.dex */
public class FaqsDataSource implements FaqDAO {
    private static final String TAG = "HelpShiftDebug";
    private final FaqsDBHelper dbHelper;

    private FaqsDataSource() {
        this.dbHelper = FaqsDBHelper.getInstance();
    }

    public static void addFaqsUnsafe(SQLiteDatabase sQLiteDatabase, String str, JSONArray jSONArray) {
        for (int i = 0; i < jSONArray.length(); i++) {
            try {
                sQLiteDatabase.insert("faqs", null, faqToContentValues(str, jSONArray.getJSONObject(i)));
            } catch (JSONException e) {
                HSLogger.d("HelpShiftDebug", "addFaqsUnsafe", e);
                return;
            }
        }
    }

    private static Faq cursorToFaq(Cursor cursor) {
        return new Faq(cursor.getLong(cursor.getColumnIndex("_id")), cursor.getString(cursor.getColumnIndex("question_id")), cursor.getString(cursor.getColumnIndex("publish_id")), cursor.getString(cursor.getColumnIndex("language")), cursor.getString(cursor.getColumnIndex("section_id")), cursor.getString(cursor.getColumnIndex("title")), cursor.getString(cursor.getColumnIndex("body")), cursor.getInt(cursor.getColumnIndex("helpful")), Boolean.valueOf(cursor.getInt(cursor.getColumnIndex("rtl")) == 1), HSJSONUtils.jsonArrayToStringArrayList(cursor.getString(cursor.getColumnIndex("tags"))), HSJSONUtils.jsonArrayToStringArrayList(cursor.getString(cursor.getColumnIndex("c_tags"))));
    }

    private static ContentValues faqToContentValues(Faq faq) {
        ContentValues contentValues = new ContentValues();
        contentValues.put("question_id", faq.getId());
        contentValues.put("publish_id", faq.publish_id);
        contentValues.put("language", faq.language);
        contentValues.put("section_id", faq.section_publish_id);
        contentValues.put("title", faq.title);
        contentValues.put("body", faq.body);
        contentValues.put("helpful", Integer.valueOf(faq.is_helpful));
        contentValues.put("rtl", faq.is_rtl);
        contentValues.put("tags", String.valueOf(new JSONArray((Collection) faq.getTags())));
        contentValues.put("c_tags", String.valueOf(new JSONArray((Collection) faq.getCategoryTags())));
        return contentValues;
    }

    private static ContentValues faqToContentValues(String str, JSONObject jSONObject) throws JSONException {
        ContentValues contentValues = new ContentValues();
        contentValues.put("question_id", jSONObject.getString("id"));
        contentValues.put("publish_id", jSONObject.getString("publish_id"));
        contentValues.put("language", jSONObject.getString("language"));
        contentValues.put("section_id", str);
        contentValues.put("title", jSONObject.getString("title"));
        contentValues.put("body", jSONObject.getString("body"));
        contentValues.put("helpful", (Integer) 0);
        contentValues.put("rtl", Boolean.valueOf(jSONObject.getString("is_rtl").equals(ServerProtocol.DIALOG_RETURN_SCOPES_TRUE)));
        contentValues.put("tags", jSONObject.has("stags") ? jSONObject.optJSONArray("stags").toString() : new JSONArray().toString());
        contentValues.put("c_tags", jSONObject.has("issue_tags") ? jSONObject.optJSONArray("issue_tags").toString() : new JSONArray().toString());
        return contentValues;
    }

    public static FaqsDataSource getInstance() {
        return LazyHolder.INSTANCE;
    }

    public synchronized void clearDB() {
        this.dbHelper.dropAndCreateAllTables(this.dbHelper.getWritableDatabase());
    }

    @Override // com.helpshift.support.storage.FaqDAO
    public synchronized void addFaq(Faq faq) {
        ContentValues contentValuesFaqToContentValues = faqToContentValues(faq);
        String[] strArr = {faq.getId()};
        try {
            SQLiteDatabase writableDatabase = this.dbHelper.getWritableDatabase();
            if (!DatabaseUtils.exists(writableDatabase, "faqs", "question_id=?", strArr)) {
                writableDatabase.insert("faqs", null, contentValuesFaqToContentValues);
            } else {
                writableDatabase.update("faqs", contentValuesFaqToContentValues, "question_id=?", strArr);
            }
        } catch (Exception e) {
            HSLogger.e("HelpShiftDebug", "Error in addFaq", e);
        }
    }

    @Override // com.helpshift.support.storage.FaqDAO
    public synchronized void removeFaq(String str) {
        if (!TextUtils.isEmpty(str)) {
            try {
                this.dbHelper.getWritableDatabase().delete("faqs", "publish_id=?", new String[]{str});
            } catch (Exception e) {
                HSLogger.e("HelpShiftDebug", "Error in removeFaq", e);
            }
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r1v0 */
    /* JADX WARN: Type inference failed for: r1v1 */
    /* JADX WARN: Type inference failed for: r1v2, types: [android.database.Cursor] */
    @Override // com.helpshift.support.storage.FaqDAO
    public synchronized Faq getFaq(String str) {
        Cursor cursorQuery;
        ?? r1 = 0;
        faqCursorToFaq = null;
        Faq faqCursorToFaq = null;
        try {
            if (TextUtils.isEmpty(str)) {
                return null;
            }
            try {
                cursorQuery = this.dbHelper.getReadableDatabase().query("faqs", null, "publish_id = ?", new String[]{str}, null, null, null);
                try {
                    faqCursorToFaq = cursorQuery.moveToFirst() ? cursorToFaq(cursorQuery) : null;
                } catch (Exception e) {
                    e = e;
                    HSLogger.e("HelpShiftDebug", "Error in getFaq", e);
                    if (cursorQuery != null) {
                    }
                    return faqCursorToFaq;
                }
            } catch (Exception e2) {
                e = e2;
                cursorQuery = null;
            } catch (Throwable th) {
                th = th;
                if (r1 != 0) {
                    r1.close();
                }
                throw th;
            }
            if (cursorQuery != null) {
                cursorQuery.close();
            }
            return faqCursorToFaq;
        } catch (Throwable th2) {
            th = th2;
            r1 = str;
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:29:0x0050 A[Catch: all -> 0x0056, TRY_ENTER, TryCatch #2 {, blocks: (B:3:0x0001, B:5:0x0008, B:13:0x0036, B:29:0x0050, B:30:0x0053), top: B:38:0x0001 }] */
    @Override // com.helpshift.support.storage.FaqDAO
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public synchronized com.helpshift.support.Faq getFaq(java.lang.String r11, java.lang.String r12) {
        /*
            r10 = this;
            monitor-enter(r10)
            boolean r0 = android.text.TextUtils.isEmpty(r11)     // Catch: java.lang.Throwable -> L56
            r1 = 0
            if (r0 != 0) goto L54
            boolean r0 = android.text.TextUtils.isEmpty(r12)     // Catch: java.lang.Throwable -> L56
            if (r0 == 0) goto Lf
            goto L54
        Lf:
            com.helpshift.support.db.faq.FaqsDBHelper r0 = r10.dbHelper     // Catch: java.lang.Throwable -> L3c java.lang.Exception -> L3e
            android.database.sqlite.SQLiteDatabase r2 = r0.getReadableDatabase()     // Catch: java.lang.Throwable -> L3c java.lang.Exception -> L3e
            java.lang.String r3 = "faqs"
            r4 = 0
            java.lang.String r5 = "publish_id = ? AND language = ?"
            r0 = 2
            java.lang.String[] r6 = new java.lang.String[r0]     // Catch: java.lang.Throwable -> L3c java.lang.Exception -> L3e
            r0 = 0
            r6[r0] = r11     // Catch: java.lang.Throwable -> L3c java.lang.Exception -> L3e
            r11 = 1
            r6[r11] = r12     // Catch: java.lang.Throwable -> L3c java.lang.Exception -> L3e
            r7 = 0
            r8 = 0
            r9 = 0
            android.database.Cursor r11 = r2.query(r3, r4, r5, r6, r7, r8, r9)     // Catch: java.lang.Throwable -> L3c java.lang.Exception -> L3e
            boolean r12 = r11.moveToFirst()     // Catch: java.lang.Exception -> L3a java.lang.Throwable -> L4c
            if (r12 == 0) goto L34
            com.helpshift.support.Faq r1 = cursorToFaq(r11)     // Catch: java.lang.Exception -> L3a java.lang.Throwable -> L4c
        L34:
            if (r11 == 0) goto L4a
        L36:
            r11.close()     // Catch: java.lang.Throwable -> L56
            goto L4a
        L3a:
            r12 = move-exception
            goto L40
        L3c:
            r12 = move-exception
            goto L4e
        L3e:
            r12 = move-exception
            r11 = r1
        L40:
            java.lang.String r0 = "HelpShiftDebug"
            java.lang.String r2 = "Error in getFaq"
            com.helpshift.util.HSLogger.e(r0, r2, r12)     // Catch: java.lang.Throwable -> L4c
            if (r11 == 0) goto L4a
            goto L36
        L4a:
            monitor-exit(r10)
            return r1
        L4c:
            r12 = move-exception
            r1 = r11
        L4e:
            if (r1 == 0) goto L53
            r1.close()     // Catch: java.lang.Throwable -> L56
        L53:
            throw r12     // Catch: java.lang.Throwable -> L56
        L54:
            monitor-exit(r10)
            return r1
        L56:
            r11 = move-exception
            monitor-exit(r10)
            throw r11
        */
        throw new UnsupportedOperationException("Method not decompiled: com.helpshift.support.storage.FaqsDataSource.getFaq(java.lang.String, java.lang.String):com.helpshift.support.Faq");
    }

    @Override // com.helpshift.support.storage.FaqDAO
    public List<Faq> getFilteredFaqs(List<Faq> list, FaqTagFilter faqTagFilter) {
        if (faqTagFilter == null) {
            return list;
        }
        String operator = faqTagFilter.getOperator();
        operator.hashCode();
        switch (operator) {
        }
        return list;
    }

    @Override // com.helpshift.support.storage.FaqDAO
    public List<Faq> getFaqsForSection(String str, FaqTagFilter faqTagFilter) {
        return getFilteredFaqs(getFaqsDataForSection(str), faqTagFilter);
    }

    @Override // com.helpshift.support.storage.FaqDAO
    public synchronized int setIsHelpful(String str, Boolean bool) {
        int iUpdate = 0;
        if (TextUtils.isEmpty(str)) {
            return 0;
        }
        ContentValues contentValues = new ContentValues();
        contentValues.put("helpful", Integer.valueOf(bool.booleanValue() ? 1 : -1));
        try {
            iUpdate = this.dbHelper.getWritableDatabase().update("faqs", contentValues, "question_id = ?", new String[]{str});
        } catch (Exception e) {
            HSLogger.e("HelpShiftDebug", "Error in setIsHelpful", e);
        }
        return iUpdate;
    }

    @Override // com.helpshift.support.storage.FaqDAO
    public synchronized List<Faq> getFaqsDataForSection(String str) {
        if (TextUtils.isEmpty(str)) {
            return new ArrayList();
        }
        ArrayList arrayList = new ArrayList();
        Cursor cursorQuery = null;
        try {
            try {
                cursorQuery = this.dbHelper.getReadableDatabase().query("faqs", null, "section_id = ?", new String[]{str}, null, null, null);
                if (cursorQuery.moveToFirst()) {
                    while (!cursorQuery.isAfterLast()) {
                        arrayList.add(cursorToFaq(cursorQuery));
                        cursorQuery.moveToNext();
                    }
                }
            } catch (Exception e) {
                HSLogger.e("HelpShiftDebug", "Error in getFaqsDataForSection", e);
                if (cursorQuery != null) {
                }
            }
            return arrayList;
        } finally {
            if (cursorQuery != null) {
                cursorQuery.close();
            }
        }
    }

    @Override // com.helpshift.support.storage.FaqDAO
    public synchronized List<String> getAllFaqPublishIds() {
        ArrayList arrayList;
        arrayList = new ArrayList();
        Cursor cursorQuery = null;
        try {
            try {
                cursorQuery = this.dbHelper.getReadableDatabase().query("faqs", new String[]{"publish_id"}, null, null, null, null, null);
                if (cursorQuery.moveToFirst()) {
                    while (!cursorQuery.isAfterLast()) {
                        arrayList.add(cursorQuery.getString(cursorQuery.getColumnIndex("publish_id")));
                        cursorQuery.moveToNext();
                    }
                }
            } catch (Exception e) {
                HSLogger.e("HelpShiftDebug", "Error in getFaqsDataForSection", e);
                if (cursorQuery != null) {
                }
            }
        } finally {
            if (cursorQuery != null) {
                cursorQuery.close();
            }
        }
        return arrayList;
    }

    private List<Faq> getANDFilteredFaqs(List<Faq> list, FaqTagFilter faqTagFilter) {
        ArrayList arrayList = new ArrayList();
        for (Faq faq : list) {
            ArrayList arrayList2 = new ArrayList(Arrays.asList(faqTagFilter.getTags()));
            arrayList2.removeAll(faq.getCategoryTags());
            if (arrayList2.isEmpty()) {
                arrayList.add(faq);
            }
        }
        return arrayList;
    }

    private List<Faq> getORFilteredFaqs(List<Faq> list, FaqTagFilter faqTagFilter) {
        ArrayList arrayList = new ArrayList();
        for (Faq faq : list) {
            if (new ArrayList(Arrays.asList(faqTagFilter.getTags())).removeAll(faq.getCategoryTags())) {
                arrayList.add(faq);
            }
        }
        return arrayList;
    }

    private List<Faq> getNOTFilteredFaqs(List<Faq> list, FaqTagFilter faqTagFilter) {
        ArrayList arrayList = new ArrayList();
        for (Faq faq : list) {
            if (!new ArrayList(Arrays.asList(faqTagFilter.getTags())).removeAll(faq.getCategoryTags())) {
                arrayList.add(faq);
            }
        }
        return arrayList;
    }

    private static final class LazyHolder {
        static final FaqsDataSource INSTANCE = new FaqsDataSource();

        private LazyHolder() {
        }
    }
}
