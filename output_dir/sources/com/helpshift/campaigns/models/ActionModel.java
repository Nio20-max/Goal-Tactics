package com.helpshift.campaigns.models;

import android.app.Activity;
import com.helpshift.CoreInternal;
import com.helpshift.campaigns.util.constants.ModelKeys;
import com.helpshift.enums.ACTION_TYPE;
import com.helpshift.executors.ActionExecutor;
import com.helpshift.util.HSLogger;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.io.Serializable;
import org.json.JSONException;
import org.json.JSONObject;

/* JADX INFO: loaded from: classes.dex */
public class ActionModel implements Serializable {
    private static final String TAG = "ActionModel";
    private static final long serialVersionUID = 1;
    public String actionData;
    private ActionExecutor actionExecutor;
    private String actionId;
    public ACTION_TYPE actionType;
    public boolean isGoalCompletion;
    public String textColor;
    public String title;

    ActionModel(JSONObject jSONObject) {
        try {
            this.actionId = jSONObject.getString("id");
            this.title = jSONObject.getString("t");
            this.actionType = ACTION_TYPE.getEnum(jSONObject.getInt("a"));
            this.actionData = jSONObject.optString("d", "");
            this.textColor = jSONObject.getString(ModelKeys.KEY_ACTION_MODEL_ACTION_TEXT_COLOR);
            this.isGoalCompletion = jSONObject.getBoolean(ModelKeys.KEY_ACTION_MODEL_GOAL_COMPLETION);
            this.actionExecutor = CoreInternal.getActionExecutor();
        } catch (JSONException e) {
            HSLogger.d(TAG, "Exception while creating actionType object from json : ", e);
        }
    }

    public void executeAction(Activity activity) {
        ActionExecutor actionExecutor = this.actionExecutor;
        if (actionExecutor != null) {
            actionExecutor.executeAction(activity, this.actionType, this.actionData);
        }
    }

    private void writeObject(ObjectOutputStream objectOutputStream) throws IOException {
        objectOutputStream.defaultWriteObject();
        objectOutputStream.writeUTF(this.actionId);
        objectOutputStream.writeUTF(this.title);
        objectOutputStream.writeObject(this.actionType);
        objectOutputStream.writeUTF(this.actionData);
        objectOutputStream.writeUTF(this.textColor);
        objectOutputStream.writeBoolean(this.isGoalCompletion);
    }

    private void readObject(ObjectInputStream objectInputStream) throws ClassNotFoundException, IOException {
        objectInputStream.defaultReadObject();
        this.actionData = objectInputStream.readUTF();
        this.title = objectInputStream.readUTF();
        this.actionType = (ACTION_TYPE) objectInputStream.readObject();
        this.actionData = objectInputStream.readUTF();
        this.textColor = objectInputStream.readUTF();
        this.isGoalCompletion = objectInputStream.readBoolean();
    }

    public boolean equals(Object obj) {
        if (!(obj instanceof ActionModel)) {
            return false;
        }
        ActionModel actionModel = (ActionModel) obj;
        boolean z = this.actionId.equals(actionModel.actionId) && this.title.equals(actionModel.title) && this.actionType == actionModel.actionType && this.actionData.equals(actionModel.actionData) && this.textColor.equals(actionModel.textColor) && this.isGoalCompletion == actionModel.isGoalCompletion;
        ActionExecutor actionExecutor = this.actionExecutor;
        if (actionExecutor != null) {
            if (!z || actionModel.actionExecutor == null || !actionExecutor.getClass().getName().equals(actionModel.actionExecutor.getClass().getName())) {
                return false;
            }
        } else if (!z || actionModel.actionExecutor != null) {
            return false;
        }
        return true;
    }
}
