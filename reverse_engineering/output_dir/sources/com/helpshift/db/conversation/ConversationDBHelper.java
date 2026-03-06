package com.helpshift.db.conversation;

import android.content.Context;
import com.helpshift.db.base.BaseSqliteHelper;
import com.helpshift.util.HelpshiftContext;

/* JADX INFO: loaded from: classes2.dex */
public class ConversationDBHelper extends BaseSqliteHelper implements BaseSqliteHelper.IDbMigrationListener {
    public ConversationDBHelper(Context context, ConversationDatabaseContract conversationDatabaseContract) {
        super(context, conversationDatabaseContract);
        setListener(this);
    }

    @Override // com.helpshift.db.base.BaseSqliteHelper.IDbMigrationListener
    public void onDbMigrationSuccess(BaseSqliteHelper.MigrationType migrationType, String str) {
        if (migrationType == BaseSqliteHelper.MigrationType.DOWNGRADE) {
            HelpshiftContext.getCoreApi().resetUsersSyncStatusAndStartSetupForActiveUser();
        }
    }

    @Override // com.helpshift.db.base.BaseSqliteHelper.IDbMigrationListener
    public void onDbMigrationFailed(BaseSqliteHelper.MigrationType migrationType, String str) {
        if (migrationType == BaseSqliteHelper.MigrationType.UPGRADE) {
            HelpshiftContext.getCoreApi().resetUsersSyncStatusAndStartSetupForActiveUser();
        }
    }
}
