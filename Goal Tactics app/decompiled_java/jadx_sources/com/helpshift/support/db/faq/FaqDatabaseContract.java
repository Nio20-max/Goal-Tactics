package com.helpshift.support.db.faq;

import com.helpshift.db.base.DatabaseContract;
import com.helpshift.db.base.DropAndCreateDatabaseMigrator;
import com.helpshift.db.base.IMigrator;
import com.helpshift.support.db.SupportDBNameRepo;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

/* JADX INFO: loaded from: classes2.dex */
public class FaqDatabaseContract implements DatabaseContract {
    private static final String TAG = "Helpshift_FaqDB";
    private final String CREATE_FAQ_TABLE = "CREATE TABLE faqs (_id INTEGER PRIMARY KEY AUTOINCREMENT,question_id TEXT NOT NULL,publish_id TEXT NOT NULL,language TEXT NOT NULL,section_id TEXT NOT NULL,title TEXT NOT NULL,body TEXT NOT NULL,helpful INTEGER,rtl INTEGER,tags TEXT,c_tags TEXT,FOREIGN KEY(section_id) REFERENCES sections (_id));";
    private final String CREATE_SECTION_TABLE = "CREATE TABLE sections (_id INTEGER PRIMARY KEY AUTOINCREMENT,section_id TEXT NOT NULL,publish_id INTEGER NOT NULL,title TEXT NOT NULL);";

    @Override // com.helpshift.db.base.DatabaseContract
    public int getDatabaseVersion() {
        return 3;
    }

    @Override // com.helpshift.db.base.DatabaseContract
    public String getTag() {
        return TAG;
    }

    @Override // com.helpshift.db.base.DatabaseContract
    public String getDatabaseName() {
        return SupportDBNameRepo.getFaqsDbName();
    }

    @Override // com.helpshift.db.base.DatabaseContract
    public List<String> getCreateTableQueries() {
        return Arrays.asList("CREATE TABLE faqs (_id INTEGER PRIMARY KEY AUTOINCREMENT,question_id TEXT NOT NULL,publish_id TEXT NOT NULL,language TEXT NOT NULL,section_id TEXT NOT NULL,title TEXT NOT NULL,body TEXT NOT NULL,helpful INTEGER,rtl INTEGER,tags TEXT,c_tags TEXT,FOREIGN KEY(section_id) REFERENCES sections (_id));", "CREATE TABLE sections (_id INTEGER PRIMARY KEY AUTOINCREMENT,section_id TEXT NOT NULL,publish_id INTEGER NOT NULL,title TEXT NOT NULL);");
    }

    @Override // com.helpshift.db.base.DatabaseContract
    public List<IMigrator> getMigratorsForUpgrade(int i) {
        ArrayList arrayList = new ArrayList();
        arrayList.add(new DropAndCreateDatabaseMigrator(this));
        return arrayList;
    }

    @Override // com.helpshift.db.base.DatabaseContract
    public List<String> getTableNames() {
        return Arrays.asList("faqs", "sections");
    }
}
