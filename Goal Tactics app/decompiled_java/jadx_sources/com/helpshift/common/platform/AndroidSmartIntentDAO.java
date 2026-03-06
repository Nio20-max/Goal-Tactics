package com.helpshift.common.platform;

import android.content.Context;
import com.helpshift.account.domainmodel.UserDM;
import com.helpshift.conversation.smartintent.dao.SmartIntentDAO;
import com.helpshift.conversation.smartintent.dto.SISearchModelDTO;
import com.helpshift.conversation.smartintent.dto.SITreeDTO;
import com.helpshift.db.conversation.smartintent.SmartIntentDB;
import java.util.List;

/* JADX INFO: loaded from: classes2.dex */
public class AndroidSmartIntentDAO implements SmartIntentDAO {
    private static final String TAG = "Helpshift_SIDBDao";
    private final SmartIntentDB smartIntentDB;

    AndroidSmartIntentDAO(Context context) {
        this.smartIntentDB = SmartIntentDB.getInstance(context);
    }

    @Override // com.helpshift.conversation.smartintent.dao.SmartIntentDAO
    public boolean insertTree(UserDM userDM, SITreeDTO sITreeDTO) {
        return this.smartIntentDB.insertTree(userDM, sITreeDTO);
    }

    @Override // com.helpshift.conversation.smartintent.dao.SmartIntentDAO
    public boolean updateTreeLastRefreshedAtTime(UserDM userDM, long j) {
        return this.smartIntentDB.updateTreeRefreshedAt(userDM, j);
    }

    @Override // com.helpshift.conversation.smartintent.dao.SmartIntentDAO
    public boolean insertModel(long j, SISearchModelDTO sISearchModelDTO) {
        return this.smartIntentDB.insertModel(j, sISearchModelDTO);
    }

    @Override // com.helpshift.conversation.smartintent.dao.SmartIntentDAO
    public boolean deleteTreeAndModel(UserDM userDM) {
        return this.smartIntentDB.deleteTreeAndModel(userDM);
    }

    @Override // com.helpshift.conversation.smartintent.dao.SmartIntentDAO
    public boolean deleteModel(long j) {
        return this.smartIntentDB.deleteModel(j);
    }

    @Override // com.helpshift.conversation.smartintent.dao.SmartIntentDAO
    public SITreeDTO getTree(UserDM userDM) {
        return this.smartIntentDB.getSmartIntentTree(userDM.getLocalId().longValue());
    }

    @Override // com.helpshift.conversation.smartintent.dao.SmartIntentDAO
    public SISearchModelDTO getModelWithoutWordProbabilities(long j) {
        return this.smartIntentDB.getModelWithoutWordProbabilities(j);
    }

    @Override // com.helpshift.conversation.smartintent.dao.SmartIntentDAO
    public List<Double> getWordToIntentProbabilities(long j, String str) {
        return this.smartIntentDB.getWordToIntentProbabilities(j, str);
    }

    @Override // com.helpshift.conversation.smartintent.dao.SmartIntentDAO
    public boolean updateModelLastRefreshedAtTime(long j, long j2) {
        return this.smartIntentDB.updateModelRefreshedAt(j, j2);
    }
}
