package com.helpshift.cif;

import com.helpshift.cif.dao.CustomIssueFieldDAO;
import com.helpshift.cif.dto.CustomIssueFieldDTO;
import com.helpshift.common.domain.Domain;
import com.helpshift.common.domain.F;
import com.helpshift.common.exception.RootAPIException;
import com.helpshift.common.platform.Jsonifier;
import com.helpshift.common.platform.Platform;
import com.helpshift.util.HSLogger;
import com.helpshift.util.StringUtils;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Map;

/* JADX INFO: loaded from: classes.dex */
public class CustomIssueFieldDM {
    private static final String TAG = "Helpshift_CIF_DM";
    private CustomIssueFieldDAO customIssueFieldDAO;
    private Domain domain;
    private Jsonifier jsonifier;

    public CustomIssueFieldDM(Domain domain, Platform platform) {
        this.domain = domain;
        this.customIssueFieldDAO = platform.getCustomIssueFieldDAO();
        this.jsonifier = platform.getJsonifier();
    }

    public Object getCustomIssueFieldData() {
        ArrayList<CustomIssueFieldDTO> customIssueFields = this.customIssueFieldDAO.getCustomIssueFields();
        if (customIssueFields == null || customIssueFields.size() == 0) {
            return null;
        }
        try {
            return this.jsonifier.jsonifyCustomIssueFieldDTOList(customIssueFields);
        } catch (RootAPIException e) {
            HSLogger.e(TAG, "Exception when jsonify data : " + e.getMessage());
            return null;
        }
    }

    public void setCustomIssueFieldData(final Map<String, String[]> map) {
        this.domain.runParallel(new F() { // from class: com.helpshift.cif.CustomIssueFieldDM.1
            @Override // com.helpshift.common.domain.F
            public void f() {
                CustomIssueFieldDM.this.customIssueFieldDAO.setCustomIssueFields(CustomIssueFieldDM.this.convertMapToDTOs(map));
            }
        });
    }

    /* JADX INFO: Access modifiers changed from: private */
    public ArrayList<CustomIssueFieldDTO> convertMapToDTOs(Map<String, String[]> map) {
        String[] strArr;
        if (map == null) {
            return null;
        }
        ArrayList<CustomIssueFieldDTO> arrayList = new ArrayList<>();
        for (String str : map.keySet()) {
            if (!StringUtils.isEmpty(str) && (strArr = map.get(str)) != null && strArr.length >= 2) {
                String str2 = strArr[0];
                if (!StringUtils.isEmpty(str2)) {
                    arrayList.add(new CustomIssueFieldDTO(str, str2, (String[]) Arrays.copyOfRange(strArr, 1, strArr.length)));
                }
            }
        }
        return arrayList;
    }
}
