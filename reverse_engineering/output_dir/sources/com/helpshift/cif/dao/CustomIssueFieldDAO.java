package com.helpshift.cif.dao;

import com.helpshift.cif.dto.CustomIssueFieldDTO;
import java.util.ArrayList;

/* JADX INFO: loaded from: classes.dex */
public interface CustomIssueFieldDAO {
    ArrayList<CustomIssueFieldDTO> getCustomIssueFields();

    void setCustomIssueFields(ArrayList<CustomIssueFieldDTO> arrayList);
}
