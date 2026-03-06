package com.helpshift.conversation.smartintent.dao;

import com.helpshift.account.domainmodel.UserDM;
import com.helpshift.conversation.smartintent.dto.SISearchModelDTO;
import com.helpshift.conversation.smartintent.dto.SITreeDTO;
import java.util.List;

/* JADX INFO: loaded from: classes2.dex */
public interface SmartIntentDAO {
    boolean deleteModel(long j);

    boolean deleteTreeAndModel(UserDM userDM);

    SISearchModelDTO getModelWithoutWordProbabilities(long j);

    SITreeDTO getTree(UserDM userDM);

    List<Double> getWordToIntentProbabilities(long j, String str);

    boolean insertModel(long j, SISearchModelDTO sISearchModelDTO);

    boolean insertTree(UserDM userDM, SITreeDTO sITreeDTO);

    boolean updateModelLastRefreshedAtTime(long j, long j2);

    boolean updateTreeLastRefreshedAtTime(UserDM userDM, long j);
}
