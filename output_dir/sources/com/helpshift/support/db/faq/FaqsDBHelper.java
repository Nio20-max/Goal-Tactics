package com.helpshift.support.db.faq;

import android.content.Context;
import com.helpshift.db.base.BaseSqliteHelper;
import com.helpshift.db.base.DatabaseContract;
import com.helpshift.util.HelpshiftContext;

/* JADX INFO: loaded from: classes2.dex */
public class FaqsDBHelper extends BaseSqliteHelper {
    FaqsDBHelper(Context context, DatabaseContract databaseContract) {
        super(context, databaseContract);
    }

    public static FaqsDBHelper getInstance() {
        return LazyHolder.INSTANCE;
    }

    private static class LazyHolder {
        static final FaqsDBHelper INSTANCE = new FaqsDBHelper(HelpshiftContext.getApplicationContext(), new FaqDatabaseContract());

        private LazyHolder() {
        }
    }
}
