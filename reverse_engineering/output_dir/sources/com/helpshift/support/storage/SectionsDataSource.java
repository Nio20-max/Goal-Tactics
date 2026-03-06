package com.helpshift.support.storage;

import android.content.ContentValues;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import com.helpshift.support.FaqTagFilter;
import com.helpshift.support.Section;
import com.helpshift.support.db.faq.FaqsDBHelper;
import com.helpshift.util.HSLogger;
import java.util.ArrayList;
import java.util.List;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/* JADX INFO: loaded from: classes2.dex */
public class SectionsDataSource implements SectionDAO {
    private static final String TAG = "HelpShiftDebug";
    private final FaqsDBHelper dbHelper;
    private FaqDAO faqDAO;

    private SectionsDataSource() {
        this.dbHelper = FaqsDBHelper.getInstance();
        this.faqDAO = FaqsDataSource.getInstance();
    }

    private static Section cursorToSection(Cursor cursor) {
        return new Section(cursor.getLong(0), cursor.getString(1), cursor.getString(3), cursor.getString(2));
    }

    private static ContentValues sectionToContentValues(JSONObject jSONObject) throws JSONException {
        ContentValues contentValues = new ContentValues();
        contentValues.put("title", jSONObject.getString("title"));
        contentValues.put("publish_id", jSONObject.getString("publish_id"));
        contentValues.put("section_id", jSONObject.getString("id"));
        return contentValues;
    }

    public static SectionsDataSource getInstance() {
        return LazyHolder.INSTANCE;
    }

    @Override // com.helpshift.support.storage.SectionDAO
    public synchronized void storeSections(JSONArray jSONArray) {
        String str;
        String str2;
        SQLiteDatabase writableDatabase = this.dbHelper.getWritableDatabase();
        try {
            try {
                writableDatabase.beginTransaction();
                for (int i = 0; i < jSONArray.length(); i++) {
                    JSONObject jSONObject = jSONArray.getJSONObject(i);
                    writableDatabase.insert("sections", null, sectionToContentValues(jSONObject));
                    JSONArray jSONArrayOptJSONArray = jSONObject.optJSONArray("faqs");
                    if (jSONArrayOptJSONArray != null) {
                        FaqsDataSource.addFaqsUnsafe(writableDatabase, jSONObject.getString("publish_id"), jSONArrayOptJSONArray);
                    }
                }
                writableDatabase.setTransactionSuccessful();
                if (writableDatabase != null) {
                    try {
                        if (writableDatabase.inTransaction()) {
                            writableDatabase.endTransaction();
                        }
                    } catch (Exception e) {
                        e = e;
                        str = "HelpShiftDebug";
                        str2 = "Error in storeSections inside finally block";
                        HSLogger.e(str, str2, e);
                    }
                }
            } catch (JSONException e2) {
                HSLogger.e("HelpShiftDebug", "Error in storeSections", e2);
                if (writableDatabase != null) {
                    try {
                        if (writableDatabase.inTransaction()) {
                            writableDatabase.endTransaction();
                        }
                    } catch (Exception e3) {
                        e = e3;
                        str = "HelpShiftDebug";
                        str2 = "Error in storeSections inside finally block";
                        HSLogger.e(str, str2, e);
                    }
                }
            }
        } finally {
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:28:0x0050 A[Catch: all -> 0x005b, TRY_ENTER, TryCatch #3 {, blocks: (B:4:0x0003, B:13:0x0034, B:28:0x0050, B:29:0x0053, B:30:0x0054), top: B:38:0x0003 }] */
    @Override // com.helpshift.support.storage.SectionDAO
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public synchronized com.helpshift.support.Section getSection(java.lang.String r12) {
        /*
            r11 = this;
            monitor-enter(r11)
            if (r12 == 0) goto L54
            java.lang.String r0 = ""
            boolean r0 = r12.equals(r0)     // Catch: java.lang.Throwable -> L5b
            if (r0 == 0) goto Lc
            goto L54
        Lc:
            r0 = 0
            com.helpshift.support.db.faq.FaqsDBHelper r1 = r11.dbHelper     // Catch: java.lang.Throwable -> L3a java.lang.Exception -> L3f
            android.database.sqlite.SQLiteDatabase r2 = r1.getReadableDatabase()     // Catch: java.lang.Throwable -> L3a java.lang.Exception -> L3f
            java.lang.String r3 = "sections"
            r4 = 0
            java.lang.String r5 = "publish_id = ?"
            r1 = 1
            java.lang.String[] r6 = new java.lang.String[r1]     // Catch: java.lang.Throwable -> L3a java.lang.Exception -> L3f
            r1 = 0
            r6[r1] = r12     // Catch: java.lang.Throwable -> L3a java.lang.Exception -> L3f
            r7 = 0
            r8 = 0
            r9 = 0
            android.database.Cursor r12 = r2.query(r3, r4, r5, r6, r7, r8, r9)     // Catch: java.lang.Throwable -> L3a java.lang.Exception -> L3f
            r12.moveToFirst()     // Catch: java.lang.Exception -> L38 java.lang.Throwable -> L4d
            boolean r1 = r12.isAfterLast()     // Catch: java.lang.Exception -> L38 java.lang.Throwable -> L4d
            if (r1 != 0) goto L32
            com.helpshift.support.Section r0 = cursorToSection(r12)     // Catch: java.lang.Exception -> L38 java.lang.Throwable -> L4d
        L32:
            if (r12 == 0) goto L4b
        L34:
            r12.close()     // Catch: java.lang.Throwable -> L5b
            goto L4b
        L38:
            r1 = move-exception
            goto L41
        L3a:
            r12 = move-exception
            r10 = r0
            r0 = r12
            r12 = r10
            goto L4e
        L3f:
            r1 = move-exception
            r12 = r0
        L41:
            java.lang.String r2 = "HelpShiftDebug"
            java.lang.String r3 = "Error in getSection"
            com.helpshift.util.HSLogger.e(r2, r3, r1)     // Catch: java.lang.Throwable -> L4d
            if (r12 == 0) goto L4b
            goto L34
        L4b:
            monitor-exit(r11)
            return r0
        L4d:
            r0 = move-exception
        L4e:
            if (r12 == 0) goto L53
            r12.close()     // Catch: java.lang.Throwable -> L5b
        L53:
            throw r0     // Catch: java.lang.Throwable -> L5b
        L54:
            com.helpshift.support.Section r12 = new com.helpshift.support.Section     // Catch: java.lang.Throwable -> L5b
            r12.<init>()     // Catch: java.lang.Throwable -> L5b
            monitor-exit(r11)
            return r12
        L5b:
            r12 = move-exception
            monitor-exit(r11)
            throw r12
        */
        throw new UnsupportedOperationException("Method not decompiled: com.helpshift.support.storage.SectionsDataSource.getSection(java.lang.String):com.helpshift.support.Section");
    }

    @Override // com.helpshift.support.storage.SectionDAO
    public synchronized List<Section> getAllSections() {
        ArrayList arrayList;
        arrayList = new ArrayList();
        Cursor cursorQuery = null;
        try {
            try {
                cursorQuery = this.dbHelper.getReadableDatabase().query("sections", null, null, null, null, null, null);
                cursorQuery.moveToFirst();
                while (!cursorQuery.isAfterLast()) {
                    arrayList.add(cursorToSection(cursorQuery));
                    cursorQuery.moveToNext();
                }
            } catch (Exception e) {
                HSLogger.e("HelpShiftDebug", "Error in getAllSections", e);
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

    @Override // com.helpshift.support.storage.SectionDAO
    public List<Section> getAllSections(FaqTagFilter faqTagFilter) {
        List<Section> allSections = getAllSections();
        if (faqTagFilter == null) {
            return allSections;
        }
        ArrayList arrayList = new ArrayList();
        for (Section section : allSections) {
            if (!this.faqDAO.getFaqsForSection(section.getPublishId(), faqTagFilter).isEmpty()) {
                arrayList.add(section);
            }
        }
        return arrayList;
    }

    @Override // com.helpshift.support.storage.SectionDAO
    public synchronized void clearSectionsData() {
        this.dbHelper.dropAndCreateAllTables(this.dbHelper.getWritableDatabase());
    }

    private static final class LazyHolder {
        static final SectionsDataSource INSTANCE = new SectionsDataSource();

        private LazyHolder() {
        }
    }
}
